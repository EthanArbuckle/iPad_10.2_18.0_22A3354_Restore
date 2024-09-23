@implementation EKSecureKeyedArchiverSerializer

- (EKSecureKeyedArchiverSerializer)initWithEventStore:(id)a3 withVersion:(id)a4
{
  id v7;
  id v8;
  EKSecureKeyedArchiverSerializer *v9;
  EKSecureKeyedArchiverSerializer *v10;
  uint64_t v11;
  NSString *version;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKSecureKeyedArchiverSerializer;
  v9 = -[EKSecureKeyedArchiverSerializer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    v11 = objc_msgSend(v8, "copy");
    version = v10->_version;
    v10->_version = (NSString *)v11;

  }
  return v10;
}

- (id)deserializeData:(id)a3 isNew:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25[9];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25[0] = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, v25);
  v10 = v25[0];
  v11 = v10;
  if (!v9)
  {
    if (a5)
    {
      v18 = 0;
      *a5 = objc_retainAutorelease(v10);
      goto LABEL_12;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSecureKeyedArchiverSerializer version](self, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[EKSecureKeyedArchiverSerializer version](self, "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Version mismatch. Archiver version: [%@]. Encoded Data Version: [%@]."), v20, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0, v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }

  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a4)
  {
    objc_msgSend(v15, "isNew");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[EKSecureKeyedArchiverSerializer eventStore](self, "eventStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createEventInEventStore:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v18;
}

- (id)serializeEvent:(id)a3 error:(id *)a4
{
  id v5;
  EKSerializableEvent *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = -[EKSerializableEvent initWithEvent:]([EKSerializableEvent alloc], "initWithEvent:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[EKSecureKeyedArchiverSerializer version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("Version"));

  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("Data"));
  objc_msgSend(v7, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)versionFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11[6];

  v11[5] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a3;
  v11[0] = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, v11);
  v7 = v11[0];
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v9;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
