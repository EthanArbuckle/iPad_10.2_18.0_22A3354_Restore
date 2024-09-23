@implementation MXStreamingSpeechProfileAddData

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasSourceData
{
  return self->_sourceData != 0;
}

- (BOOL)hasExistingLanguageProfile
{
  return self->_existingLanguageProfile != 0;
}

- (BOOL)hasExistingPronunciationCache
{
  return self->_existingPronunciationCache != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXStreamingSpeechProfileAddData;
  -[MXStreamingSpeechProfileAddData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXStreamingSpeechProfileAddData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestId;
  MXSpeechProfileSourceData *sourceData;
  void *v7;
  NSData *existingLanguageProfile;
  NSData *existingPronunciationCache;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  sourceData = self->_sourceData;
  if (sourceData)
  {
    -[MXSpeechProfileSourceData dictionaryRepresentation](sourceData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("source_data"));

  }
  existingLanguageProfile = self->_existingLanguageProfile;
  if (existingLanguageProfile)
    objc_msgSend(v4, "setObject:forKey:", existingLanguageProfile, CFSTR("existing_language_profile"));
  existingPronunciationCache = self->_existingPronunciationCache;
  if (existingPronunciationCache)
    objc_msgSend(v4, "setObject:forKey:", existingPronunciationCache, CFSTR("existing_pronunciation_cache"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXStreamingSpeechProfileAddDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_existingLanguageProfile)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_existingPronunciationCache)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_sourceData)
  {
    objc_msgSend(v5, "setSourceData:");
    v4 = v5;
  }
  if (self->_existingLanguageProfile)
  {
    objc_msgSend(v5, "setExistingLanguageProfile:");
    v4 = v5;
  }
  if (self->_existingPronunciationCache)
  {
    objc_msgSend(v5, "setExistingPronunciationCache:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[MXSpeechProfileSourceData copyWithZone:](self->_sourceData, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSData copyWithZone:](self->_existingLanguageProfile, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSData copyWithZone:](self->_existingPronunciationCache, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestId;
  MXSpeechProfileSourceData *sourceData;
  NSData *existingLanguageProfile;
  NSData *existingPronunciationCache;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((sourceData = self->_sourceData, !((unint64_t)sourceData | v4[4]))
     || -[MXSpeechProfileSourceData isEqual:](sourceData, "isEqual:"))
    && ((existingLanguageProfile = self->_existingLanguageProfile, !((unint64_t)existingLanguageProfile | v4[1]))
     || -[NSData isEqual:](existingLanguageProfile, "isEqual:")))
  {
    existingPronunciationCache = self->_existingPronunciationCache;
    if ((unint64_t)existingPronunciationCache | v4[2])
      v9 = -[NSData isEqual:](existingPronunciationCache, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_requestId, "hash");
  v4 = -[MXSpeechProfileSourceData hash](self->_sourceData, "hash") ^ v3;
  v5 = -[NSData hash](self->_existingLanguageProfile, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_existingPronunciationCache, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  MXSpeechProfileSourceData *sourceData;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[3])
  {
    -[MXStreamingSpeechProfileAddData setRequestId:](self, "setRequestId:");
    v4 = v7;
  }
  sourceData = self->_sourceData;
  v6 = v4[4];
  if (sourceData)
  {
    if (!v6)
      goto LABEL_9;
    -[MXSpeechProfileSourceData mergeFrom:](sourceData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[MXStreamingSpeechProfileAddData setSourceData:](self, "setSourceData:");
  }
  v4 = v7;
LABEL_9:
  if (v4[1])
  {
    -[MXStreamingSpeechProfileAddData setExistingLanguageProfile:](self, "setExistingLanguageProfile:");
    v4 = v7;
  }
  if (v4[2])
  {
    -[MXStreamingSpeechProfileAddData setExistingPronunciationCache:](self, "setExistingPronunciationCache:");
    v4 = v7;
  }

}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (MXSpeechProfileSourceData)sourceData
{
  return self->_sourceData;
}

- (void)setSourceData:(id)a3
{
  objc_storeStrong((id *)&self->_sourceData, a3);
}

- (NSData)existingLanguageProfile
{
  return self->_existingLanguageProfile;
}

- (void)setExistingLanguageProfile:(id)a3
{
  objc_storeStrong((id *)&self->_existingLanguageProfile, a3);
}

- (NSData)existingPronunciationCache
{
  return self->_existingPronunciationCache;
}

- (void)setExistingPronunciationCache:(id)a3
{
  objc_storeStrong((id *)&self->_existingPronunciationCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceData, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_existingPronunciationCache, 0);
  objc_storeStrong((id *)&self->_existingLanguageProfile, 0);
}

@end
