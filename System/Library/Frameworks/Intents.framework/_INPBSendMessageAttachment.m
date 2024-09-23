@implementation _INPBSendMessageAttachment

- (void)setAudioMessageFile:(id)a3
{
  _INPBFileDataAttachment *v4;
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;
  unint64_t v11;
  _INPBFileDataAttachment *audioMessageFile;

  v4 = (_INPBFileDataAttachment *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  v11 = 5;
  if (!v4)
    v11 = 0;
  self->_whichDatasource = v11;
  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = v4;

}

- (_INPBFileDataAttachment)audioMessageFile
{
  if (self->_whichDatasource == 5)
    return self->_audioMessageFile;
  else
    return (_INPBFileDataAttachment *)0;
}

- (BOOL)hasAudioMessageFile
{
  return self->_whichDatasource == 5 && self->_audioMessageFile != 0;
}

- (void)setAudioMessageFileURL:(id)a3
{
  _INPBURLValue *v4;
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;
  unint64_t v11;
  _INPBURLValue *audioMessageFileURL;

  v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  v11 = 6;
  if (!v4)
    v11 = 0;
  self->_whichDatasource = v11;
  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = v4;

}

- (_INPBURLValue)audioMessageFileURL
{
  if (self->_whichDatasource == 6)
    return self->_audioMessageFileURL;
  else
    return (_INPBURLValue *)0;
}

- (BOOL)hasAudioMessageFileURL
{
  return self->_whichDatasource == 6 && self->_audioMessageFileURL != 0;
}

- (void)setCurrentLocation:(BOOL)a3
{
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;

  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 3;
  self->_currentLocation = a3;
}

- (BOOL)currentLocation
{
  return self->_whichDatasource == 3 && self->_currentLocation;
}

- (BOOL)hasCurrentLocation
{
  return self->_whichDatasource == 3;
}

- (void)setFile:(id)a3
{
  _INPBFileDataAttachment *v4;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;
  _INPBFileDataAttachment *file;

  v4 = (_INPBFileDataAttachment *)a3;
  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = v4 != 0;
  file = self->_file;
  self->_file = v4;

}

- (_INPBFileDataAttachment)file
{
  if (self->_whichDatasource == 1)
    return self->_file;
  else
    return (_INPBFileDataAttachment *)0;
}

- (BOOL)hasFile
{
  return self->_whichDatasource == 1 && self->_file != 0;
}

- (void)setFileURL:(id)a3
{
  _INPBURLValue *v4;
  _INPBFileDataAttachment *file;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;
  _INPBURLValue *fileURL;

  v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 2 * (v4 != 0);
  fileURL = self->_fileURL;
  self->_fileURL = v4;

}

- (_INPBURLValue)fileURL
{
  if (self->_whichDatasource == 2)
    return self->_fileURL;
  else
    return (_INPBURLValue *)0;
}

- (BOOL)hasFileURL
{
  return self->_whichDatasource == 2 && self->_fileURL != 0;
}

- (void)setPhAssetId:(id)a3
{
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *v10;
  NSString *phAssetId;
  id v12;

  file = self->_file;
  self->_file = 0;
  v12 = a3;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  self->_whichDatasource = 8 * (v12 != 0);
  v10 = (NSString *)objc_msgSend(v12, "copy");
  phAssetId = self->_phAssetId;
  self->_phAssetId = v10;

}

- (NSString)phAssetId
{
  if (self->_whichDatasource == 8)
    return self->_phAssetId;
  else
    return (NSString *)0;
}

- (BOOL)hasPhAssetId
{
  return self->_whichDatasource == 8 && self->_phAssetId != 0;
}

- (void)setSharedLink:(id)a3
{
  _INPBURLValue *v4;
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBURLValue *speechDataURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  NSString *phAssetId;
  unint64_t v11;
  _INPBURLValue *sharedLink;

  v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = 0;

  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  v11 = 7;
  if (!v4)
    v11 = 0;
  self->_whichDatasource = v11;
  sharedLink = self->_sharedLink;
  self->_sharedLink = v4;

}

- (_INPBURLValue)sharedLink
{
  if (self->_whichDatasource == 7)
    return self->_sharedLink;
  else
    return (_INPBURLValue *)0;
}

- (BOOL)hasSharedLink
{
  return self->_whichDatasource == 7 && self->_sharedLink != 0;
}

- (void)setSpeechDataURL:(id)a3
{
  _INPBURLValue *v4;
  _INPBFileDataAttachment *file;
  _INPBURLValue *fileURL;
  _INPBFileDataAttachment *audioMessageFile;
  _INPBURLValue *audioMessageFileURL;
  _INPBURLValue *sharedLink;
  NSString *phAssetId;
  _INPBURLValue *speechDataURL;

  v4 = (_INPBURLValue *)a3;
  file = self->_file;
  self->_file = 0;

  fileURL = self->_fileURL;
  self->_fileURL = 0;

  self->_currentLocation = 0;
  audioMessageFile = self->_audioMessageFile;
  self->_audioMessageFile = 0;

  audioMessageFileURL = self->_audioMessageFileURL;
  self->_audioMessageFileURL = 0;

  sharedLink = self->_sharedLink;
  self->_sharedLink = 0;

  phAssetId = self->_phAssetId;
  self->_phAssetId = 0;

  self->_whichDatasource = 4 * (v4 != 0);
  speechDataURL = self->_speechDataURL;
  self->_speechDataURL = v4;

}

- (_INPBURLValue)speechDataURL
{
  if (self->_whichDatasource == 4)
    return self->_speechDataURL;
  else
    return (_INPBURLValue *)0;
}

- (BOOL)hasSpeechDataURL
{
  return self->_whichDatasource == 4 && self->_speechDataURL != 0;
}

- (void)setTypeIdentifier:(id)a3
{
  NSString *v4;
  NSString *typeIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  typeIdentifier = self->_typeIdentifier;
  self->_typeIdentifier = v4;

}

- (BOOL)hasTypeIdentifier
{
  return self->_typeIdentifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendMessageAttachmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation"))
    PBDataWriterWriteBOOLField();
  -[_INPBSendMessageAttachment file](self, "file");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSendMessageAttachment file](self, "file");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageAttachment fileURL](self, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSendMessageAttachment fileURL](self, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageAttachment phAssetId](self, "phAssetId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSendMessageAttachment typeIdentifier](self, "typeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v19;
  if (v17)
  {
    PBDataWriterWriteStringField();
    v18 = v19;
  }

}

- (_INPBSendMessageAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSendMessageAttachment *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSendMessageAttachment *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSendMessageAttachment *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSendMessageAttachment initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBSendMessageAttachment data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSendMessageAttachment *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v5 = -[_INPBSendMessageAttachment init](+[_INPBSendMessageAttachment allocWithZone:](_INPBSendMessageAttachment, "allocWithZone:"), "init");
  v6 = -[_INPBFileDataAttachment copyWithZone:](self->_audioMessageFile, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setAudioMessageFile:](v5, "setAudioMessageFile:", v6);

  v7 = -[_INPBURLValue copyWithZone:](self->_audioMessageFileURL, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setAudioMessageFileURL:](v5, "setAudioMessageFileURL:", v7);

  if (-[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation"))
    -[_INPBSendMessageAttachment setCurrentLocation:](v5, "setCurrentLocation:", -[_INPBSendMessageAttachment currentLocation](self, "currentLocation"));
  v8 = -[_INPBFileDataAttachment copyWithZone:](self->_file, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setFile:](v5, "setFile:", v8);

  v9 = -[_INPBURLValue copyWithZone:](self->_fileURL, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setFileURL:](v5, "setFileURL:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_phAssetId, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setPhAssetId:](v5, "setPhAssetId:", v10);

  v11 = -[_INPBURLValue copyWithZone:](self->_sharedLink, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setSharedLink:](v5, "setSharedLink:", v11);

  v12 = -[_INPBURLValue copyWithZone:](self->_speechDataURL, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setSpeechDataURL:](v5, "setSpeechDataURL:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_typeIdentifier, "copyWithZone:", a3);
  -[_INPBSendMessageAttachment setTypeIdentifier:](v5, "setTypeIdentifier:", v13);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int currentLocation;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  BOOL v49;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioMessageFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioMessageFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioMessageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioMessageFileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_46;
  }
  else
  {

  }
  v17 = -[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation");
  if (v17 != objc_msgSend(v4, "hasCurrentLocation"))
    goto LABEL_46;
  if (-[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation"))
  {
    if (objc_msgSend(v4, "hasCurrentLocation"))
    {
      currentLocation = self->_currentLocation;
      if (currentLocation != objc_msgSend(v4, "currentLocation"))
        goto LABEL_46;
    }
  }
  -[_INPBSendMessageAttachment file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment file](self, "file");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSendMessageAttachment file](self, "file");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "file");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment fileURL](self, "fileURL");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBSendMessageAttachment fileURL](self, "fileURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment phAssetId](self, "phAssetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phAssetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment phAssetId](self, "phAssetId");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBSendMessageAttachment phAssetId](self, "phAssetId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phAssetId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedLink");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechDataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_45;
  -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechDataURL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_46;
  }
  else
  {

  }
  -[_INPBSendMessageAttachment typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSendMessageAttachment typeIdentifier](self, "typeIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
    {

LABEL_49:
      v49 = 1;
      goto LABEL_47;
    }
    v45 = (void *)v44;
    -[_INPBSendMessageAttachment typeIdentifier](self, "typeIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if ((v48 & 1) != 0)
      goto LABEL_49;
  }
  else
  {
LABEL_45:

  }
LABEL_46:
  v49 = 0;
LABEL_47:

  return v49;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[_INPBFileDataAttachment hash](self->_audioMessageFile, "hash");
  v4 = -[_INPBURLValue hash](self->_audioMessageFileURL, "hash");
  if (-[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation"))
    v5 = 2654435761 * self->_currentLocation;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[_INPBFileDataAttachment hash](self->_file, "hash");
  v7 = -[_INPBURLValue hash](self->_fileURL, "hash");
  v8 = v7 ^ -[NSString hash](self->_phAssetId, "hash");
  v9 = v6 ^ v8 ^ -[_INPBURLValue hash](self->_sharedLink, "hash");
  v10 = -[_INPBURLValue hash](self->_speechDataURL, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_typeIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSendMessageAttachment audioMessageFile](self, "audioMessageFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("audioMessageFile"));

  -[_INPBSendMessageAttachment audioMessageFileURL](self, "audioMessageFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("audioMessageFileURL"));

  if (-[_INPBSendMessageAttachment hasCurrentLocation](self, "hasCurrentLocation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSendMessageAttachment currentLocation](self, "currentLocation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("currentLocation"));

  }
  -[_INPBSendMessageAttachment file](self, "file");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("file"));

  -[_INPBSendMessageAttachment fileURL](self, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("fileURL"));

  if (self->_phAssetId)
  {
    -[_INPBSendMessageAttachment phAssetId](self, "phAssetId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("phAssetId"));

  }
  -[_INPBSendMessageAttachment sharedLink](self, "sharedLink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("sharedLink"));

  -[_INPBSendMessageAttachment speechDataURL](self, "speechDataURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("speechDataURL"));

  if (self->_typeIdentifier)
  {
    -[_INPBSendMessageAttachment typeIdentifier](self, "typeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("typeIdentifier"));

  }
  return v3;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (unint64_t)whichDatasource
{
  return self->_whichDatasource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_sharedLink, 0);
  objc_storeStrong((id *)&self->_phAssetId, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_audioMessageFileURL, 0);
  objc_storeStrong((id *)&self->_audioMessageFile, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
