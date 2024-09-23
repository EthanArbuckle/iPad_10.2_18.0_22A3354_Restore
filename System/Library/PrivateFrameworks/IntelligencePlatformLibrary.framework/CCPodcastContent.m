@implementation CCPodcastContent

- (CCPodcastContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int IsInstanceOfExpectedClass;
  id v11;
  int v12;
  void *v13;
  void *v14;
  CCPodcastContent *v15;
  uint64_t v17;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (IsInstanceOfExpectedClass)
      goto LABEL_8;
LABEL_10:
    CCSetError();
    v15 = 0;
    goto LABEL_11;
  }
  v11 = 0;
  if (!v8 || a4 != 2)
    goto LABEL_9;
  objc_opt_class();
  v17 = 0;
  v12 = CCValidateIsInstanceOfExpectedClass();
  v11 = 0;
  if (!v12)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v8, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField();

LABEL_9:
  objc_msgSend(v9, "immutableData", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v14, a5);

  v15 = self;
LABEL_11:

  return v15;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  id v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  CCPodcastShow *v20;
  void *v21;
  CCPodcastShow *v22;
  CCPodcastShow *v23;
  CCPodcastPlaylist *v24;
  CCPodcastPlaylist *v25;
  void *v26;
  CCPodcastPlaylist *v27;
  CCPodcastPlaylist *playlist;
  CCPodcastShow *show;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  BOOL v35;
  id v37;
  id v38;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_30;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (!v12)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        if (*(_QWORD *)&v6[*v9])
          goto LABEL_31;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_31;
LABEL_18:
    if ((v15 >> 3) == 2)
    {
      v25 = [CCPodcastPlaylist alloc];
      CCPBReaderReadDataNoCopy();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v27 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", v26, &v37);
      v10 = v37;
      playlist = self->_playlist;
      self->_playlist = v27;

      if (!v10)
      {
        show = self->_show;
        self->_show = 0;

        self->_entityType = 2;
      }
    }
    else if ((v15 >> 3) == 1)
    {
      v20 = [CCPodcastShow alloc];
      CCPBReaderReadDataNoCopy();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      v22 = -[CCItemMessage initWithData:error:](v20, "initWithData:error:", v21, &v38);
      v10 = v38;
      v23 = self->_show;
      self->_show = v22;

      if (!v10)
      {
        self->_entityType = 1;
        v24 = self->_playlist;
        self->_playlist = 0;

      }
    }
    else if ((CCPBReaderSkipValueWithTag() & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CCSkipFieldErrorForMessage();
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_30:
    if (!*(_QWORD *)&v6[*v9])
    {
      v10 = 0;
      v35 = 1;
      goto LABEL_34;
    }
LABEL_31:
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
  }
  v35 = 0;
LABEL_34:

  return v35;
}

- (CCPodcastShow)show
{
  return (CCPodcastShow *)(id)-[CCPodcastShow copy](self->_show, "copy");
}

- (CCPodcastPlaylist)playlist
{
  return (CCPodcastPlaylist *)(id)-[CCPodcastPlaylist copy](self->_playlist, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  if (self->_show)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 42185, self->_show);
    v7[2](v7, v5);

  }
  if (self->_playlist)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 42186, self->_playlist);
    v7[2](v7, v6);

  }
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  if (self->_show)
  {
    -[CCPodcastContent show](self, "show");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("show"));

  }
  if (self->_playlist)
  {
    -[CCPodcastContent playlist](self, "playlist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsonDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("playlist"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (CCPodcastContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  CCPodcastShow *v9;
  CCPodcastShow *v10;
  id v11;
  void *v12;
  CCPodcastPlaylist *v13;
  CCPodcastShow *v14;
  CCPodcastShow *v15;
  uint64_t v16;
  CCPodcastContent *v17;
  id v19;
  id v20[2];

  v6 = a3;
  objc_opt_class();
  v20[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("show"));
    v9 = (CCPodcastShow *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v20[0] = 0;
      v10 = -[CCPodcastShow initWithJSONDictionary:error:]([CCPodcastShow alloc], "initWithJSONDictionary:error:", v9, v20);
      v11 = v20[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        goto LABEL_15;
      }

      v9 = v10;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playlist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_10:
      if (v9)
      {
        v15 = v9;
        v16 = 1;
      }
      else
      {
        v16 = 0;
      }
      v10 = v9;
      if (v12)
      {
        v10 = v12;

        v16 = 2;
      }
      v17 = -[CCPodcastContent initWithEntity:entityType:error:]([CCPodcastContent alloc], "initWithEntity:entityType:error:", v10, v16, a4);
      goto LABEL_20;
    }
    v19 = 0;
    v13 = -[CCPodcastPlaylist initWithJSONDictionary:error:]([CCPodcastPlaylist alloc], "initWithJSONDictionary:error:", v12, &v19);
    v14 = (CCPodcastShow *)v19;
    v10 = v14;
    if (v13 && !v14)
    {

      v12 = v13;
      goto LABEL_10;
    }
    CCSetError();

LABEL_15:
    v17 = 0;
LABEL_20:

    goto LABEL_21;
  }
  CCSetError();
  v17 = 0;
LABEL_21:

  return v17;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_show, 0);
}

+ (unsigned)itemType
{
  return -23352;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 23352) > 6u)
    return 0;
  else
    return off_2510306A8[(unsigned __int16)(a3 + 23352)];
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
