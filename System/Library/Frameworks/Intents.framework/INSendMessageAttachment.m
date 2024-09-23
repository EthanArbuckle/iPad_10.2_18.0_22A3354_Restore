@implementation INSendMessageAttachment

- (id)_initWithCurrentLocation:(BOOL)a3 file:(id)a4 speechDataURL:(id)a5 audioMessageFile:(id)a6 sharedLink:(id)a7 phAssetId:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  INSendMessageAttachment *v19;
  INSendMessageAttachment *v20;
  uint64_t v21;
  INFile *file;
  uint64_t v23;
  NSURL *speechDataURL;
  uint64_t v25;
  INFile *audioMessageFile;
  uint64_t v27;
  NSURL *sharedLink;
  uint64_t v29;
  NSString *phAssetId;
  objc_super v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)INSendMessageAttachment;
  v19 = -[INSendMessageAttachment init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_currentLocation = a3;
    v21 = objc_msgSend(v14, "copy");
    file = v20->_file;
    v20->_file = (INFile *)v21;

    v23 = objc_msgSend(v15, "copy");
    speechDataURL = v20->_speechDataURL;
    v20->_speechDataURL = (NSURL *)v23;

    v25 = objc_msgSend(v16, "copy");
    audioMessageFile = v20->_audioMessageFile;
    v20->_audioMessageFile = (INFile *)v25;

    v27 = objc_msgSend(v17, "copy");
    sharedLink = v20->_sharedLink;
    v20->_sharedLink = (NSURL *)v27;

    v29 = objc_msgSend(v18, "copy");
    phAssetId = v20->_phAssetId;
    v20->_phAssetId = (NSString *)v29;

  }
  return v20;
}

- (PHAsset)phAsset
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!self->_phAssetId)
    return (PHAsset *)0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getPHAssetClass_softClass;
  v13 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getPHAssetClass_block_invoke;
    v9[3] = &unk_1E22953C0;
    v9[4] = &v10;
    __getPHAssetClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v14[0] = self->_phAssetId;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsWithLocalIdentifiers:options:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAsset *)v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_currentLocation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[INFile hash](self->_file, "hash");
  v6 = v5 ^ -[NSURL hash](self->_speechDataURL, "hash");
  v7 = v6 ^ -[INFile hash](self->_audioMessageFile, "hash") ^ v4;
  v8 = v7 ^ -[NSURL hash](self->_sharedLink, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString **v5;
  INFile *file;
  NSURL *speechDataURL;
  INFile *audioMessageFile;
  NSURL *sharedLink;
  NSString *phAssetId;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSString **)v4;
    v11 = 0;
    if (self->_currentLocation == *((unsigned __int8 *)v5 + 8))
    {
      file = self->_file;
      if (file == (INFile *)v5[3] || -[INFile isEqual:](file, "isEqual:"))
      {
        speechDataURL = self->_speechDataURL;
        if (speechDataURL == (NSURL *)v5[4] || -[NSURL isEqual:](speechDataURL, "isEqual:"))
        {
          audioMessageFile = self->_audioMessageFile;
          if (audioMessageFile == (INFile *)v5[2] || -[INFile isEqual:](audioMessageFile, "isEqual:"))
          {
            sharedLink = self->_sharedLink;
            if (sharedLink == (NSURL *)v5[5] || -[NSURL isEqual:](sharedLink, "isEqual:"))
            {
              phAssetId = self->_phAssetId;
              if (phAssetId == v5[6] || -[NSString isEqual:](phAssetId, "isEqual:"))
                v11 = 1;
            }
          }
        }
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (INSendMessageAttachment)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INSendMessageAttachment *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("currentLocation"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechDataURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioMessageFile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedLink"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phAssetId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (INSendMessageAttachment *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 currentLocation;
  id v5;

  currentLocation = self->_currentLocation;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", currentLocation, CFSTR("currentLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_file, CFSTR("file"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechDataURL, CFSTR("speechDataURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioMessageFile, CFSTR("audioMessageFile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedLink, CFSTR("sharedLink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phAssetId, CFSTR("phAssetId"));

}

- (id)_dictionaryRepresentation
{
  void *v3;
  INFile *file;
  void *v5;
  NSURL *speechDataURL;
  void *v7;
  INFile *audioMessageFile;
  void *v9;
  NSURL *sharedLink;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("currentLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_currentLocation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("file");
  file = self->_file;
  v5 = file;
  if (!file)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v5;
  v14[2] = CFSTR("speechDataURL");
  speechDataURL = self->_speechDataURL;
  v7 = speechDataURL;
  if (!speechDataURL)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v7;
  v14[3] = CFSTR("audioMessageFile");
  audioMessageFile = self->_audioMessageFile;
  v9 = audioMessageFile;
  if (!audioMessageFile)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[3] = v9;
  v14[4] = CFSTR("sharedLink");
  sharedLink = self->_sharedLink;
  v11 = sharedLink;
  if (!sharedLink)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (sharedLink)
  {
    if (audioMessageFile)
      goto LABEL_11;
  }
  else
  {

    if (audioMessageFile)
    {
LABEL_11:
      if (speechDataURL)
        goto LABEL_12;
LABEL_16:

      if (file)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!speechDataURL)
    goto LABEL_16;
LABEL_12:
  if (!file)
    goto LABEL_17;
LABEL_13:

  return v12;
}

- (INFile)audioMessageFile
{
  return self->_audioMessageFile;
}

- (BOOL)currentLocation
{
  return self->_currentLocation;
}

- (INFile)file
{
  return self->_file;
}

- (NSURL)speechDataURL
{
  return self->_speechDataURL;
}

- (NSURL)sharedLink
{
  return self->_sharedLink;
}

- (NSString)phAssetId
{
  return self->_phAssetId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phAssetId, 0);
  objc_storeStrong((id *)&self->_sharedLink, 0);
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);
}

+ (INSendMessageAttachment)attachmentWithCurrentLocation
{
  return (INSendMessageAttachment *)-[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 1, 0, 0, 0, 0, 0);
}

+ (INSendMessageAttachment)attachmentWithFile:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, v3, 0, 0, 0, 0);

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithSpeechDataURL:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, 0, v3, 0, 0, 0);

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithAudioMessageFile:(INFile *)audioMessageFile
{
  INFile *v3;
  id v4;

  v3 = audioMessageFile;
  v4 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, 0, 0, v3, 0, 0);

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithSharedLink:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, 0, 0, 0, v3, 0);

  return (INSendMessageAttachment *)v4;
}

+ (INSendMessageAttachment)attachmentWithPHAsset:(id)a3
{
  id v3;
  INSendMessageAttachment *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [INSendMessageAttachment alloc];
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:](v4, "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, 0, 0, 0, 0, v5);
  return (INSendMessageAttachment *)v6;
}

+ (INSendMessageAttachment)attachmentWithPHAssetId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[INSendMessageAttachment _initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:]([INSendMessageAttachment alloc], "_initWithCurrentLocation:file:speechDataURL:audioMessageFile:sharedLink:phAssetId:", 0, 0, 0, 0, 0, v3);

  return (INSendMessageAttachment *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSendMessageAttachment speechDataURL](self, "speechDataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[INSendMessageAttachment sharedLink](self, "sharedLink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[INSendMessageAttachment sharedLink](self, "sharedLink");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("sharedLink");
      goto LABEL_5;
    }
    if (-[INSendMessageAttachment currentLocation](self, "currentLocation"))
    {
      objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("currentLocation"));
      goto LABEL_7;
    }
    -[INSendMessageAttachment audioMessageFile](self, "audioMessageFile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[INSendMessageAttachment audioMessageFile](self, "audioMessageFile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "_isFileURLBased"))
      {
        v24[0] = CFSTR("data");
        objc_msgSend(v8, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encodeObject:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = CFSTR("filename");
        v25[0] = v14;
        objc_msgSend(v8, "filename");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encodeObject:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("audioMessageFile");
LABEL_18:
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v17, v18);

        goto LABEL_19;
      }
    }
    else
    {
      -[INSendMessageAttachment file](self, "file");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "typeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v8, "typeIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encodeObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v21, CFSTR("typeIdentifier"));

      }
      if (!objc_msgSend(v8, "_isFileURLBased"))
      {
        v22[0] = CFSTR("data");
        objc_msgSend(v8, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encodeObject:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = CFSTR("filename");
        v23[0] = v14;
        objc_msgSend(v8, "filename");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "encodeObject:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("file");
        goto LABEL_18;
      }
    }
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, CFSTR("fileURL"));
LABEL_19:

    goto LABEL_6;
  }
  -[INSendMessageAttachment speechDataURL](self, "speechDataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("speechDataURL");
LABEL_5:
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, v10);
LABEL_6:

LABEL_7:
  return v6;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("speechDataURL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("speechDataURL"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "attachmentWithSpeechDataURL:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v16 = (void *)v15;

        goto LABEL_9;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sharedLink"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sharedLink"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v18, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "attachmentWithSharedLink:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("currentLocation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(a1, "attachmentWithCurrentLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("audioMessageFile"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("audioMessageFile"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("data"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("audioMessageFile"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("filename"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v26, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        +[INFile fileWithData:filename:typeIdentifier:](INFile, "fileWithData:filename:typeIdentifier:", v25, v29, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          objc_msgSend(a1, "attachmentWithAudioMessageFile:", v30);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_24;
      }
      v31 = objc_opt_class();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("typeIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "decodeObjectOfClass:from:", v31, v32);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fileURL"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fileURL"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        +[INFile fileWithFileURL:filename:typeIdentifier:](INFile, "fileWithFileURL:filename:typeIdentifier:", v36, 0, v25);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("file"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
          goto LABEL_23;
        v39 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("file"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("data"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v39, v41);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("file"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("filename"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClass:from:", v42, v44);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        +[INFile fileWithData:filename:typeIdentifier:](INFile, "fileWithData:filename:typeIdentifier:", v35, v36, v25);
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v45 = (void *)v37;

      if (v45)
      {
        objc_msgSend(a1, "attachmentWithFile:", v45);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
        goto LABEL_9;
      }
LABEL_23:
      v16 = 0;
      goto LABEL_24;
    }
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  -[INSendMessageAttachment audioMessageFile](self, "audioMessageFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  if ((v8 & 1) != 0
    || (-[INSendMessageAttachment file](self, "file"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)INSendMessageAttachment;
    v11 = -[NSObject _intents_enumerateObjectsOfClass:withBlock:](&v13, sel__intents_enumerateObjectsOfClass_withBlock_, a3, v6);
  }

  return v11;
}

@end
