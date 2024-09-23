@implementation MXSpeechProfileBuildResponse

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setIncompleteProfile:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_incompleteProfile = a3;
}

- (void)setHasIncompleteProfile:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIncompleteProfile
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLanguageProfile
{
  return self->_languageProfile != 0;
}

- (BOOL)hasPronunciationCache
{
  return self->_pronunciationCache != 0;
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
  v8.super_class = (Class)MXSpeechProfileBuildResponse;
  -[MXSpeechProfileBuildResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXSpeechProfileBuildResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  MXProcessingError *error;
  void *v7;
  void *v8;
  NSData *languageProfile;
  NSData *pronunciationCache;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  error = self->_error;
  if (error)
  {
    -[MXProcessingError dictionaryRepresentation](error, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("error"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_incompleteProfile);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("incomplete_profile"));

  }
  languageProfile = self->_languageProfile;
  if (languageProfile)
    objc_msgSend(v4, "setObject:forKey:", languageProfile, CFSTR("language_profile"));
  pronunciationCache = self->_pronunciationCache;
  if (pronunciationCache)
    objc_msgSend(v4, "setObject:forKey:", pronunciationCache, CFSTR("pronunciation_cache"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXSpeechProfileBuildResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_languageProfile)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_pronunciationCache)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_incompleteProfile;
    v4[44] |= 1u;
  }
  if (self->_languageProfile)
  {
    objc_msgSend(v5, "setLanguageProfile:");
    v4 = v5;
  }
  if (self->_pronunciationCache)
  {
    objc_msgSend(v5, "setPronunciationCache:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[MXProcessingError copyWithZone:](self->_error, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_incompleteProfile;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v10 = -[NSData copyWithZone:](self->_languageProfile, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSData copyWithZone:](self->_pronunciationCache, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestId;
  MXProcessingError *error;
  NSData *languageProfile;
  NSData *pronunciationCache;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:"))
      goto LABEL_18;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 1))
  {
    if (!-[MXProcessingError isEqual:](error, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_incompleteProfile)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_18;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_14;
    }
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
    goto LABEL_18;
LABEL_14:
  languageProfile = self->_languageProfile;
  if ((unint64_t)languageProfile | *((_QWORD *)v4 + 2)
    && !-[NSData isEqual:](languageProfile, "isEqual:"))
  {
    goto LABEL_18;
  }
  pronunciationCache = self->_pronunciationCache;
  if ((unint64_t)pronunciationCache | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](pronunciationCache, "isEqual:");
  else
    v9 = 1;
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_requestId, "hash");
  v4 = -[MXProcessingError hash](self->_error, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_incompleteProfile;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NSData hash](self->_languageProfile, "hash");
  return v6 ^ -[NSData hash](self->_pronunciationCache, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  MXProcessingError *error;
  uint64_t v6;
  BOOL *v7;

  v4 = (BOOL *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[MXSpeechProfileBuildResponse setRequestId:](self, "setRequestId:");
    v4 = v7;
  }
  error = self->_error;
  v6 = *((_QWORD *)v4 + 1);
  if (error)
  {
    if (!v6)
      goto LABEL_9;
    -[MXProcessingError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[MXSpeechProfileBuildResponse setError:](self, "setError:");
  }
  v4 = v7;
LABEL_9:
  if (v4[44])
  {
    self->_incompleteProfile = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[MXSpeechProfileBuildResponse setLanguageProfile:](self, "setLanguageProfile:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[MXSpeechProfileBuildResponse setPronunciationCache:](self, "setPronunciationCache:");
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

- (MXProcessingError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)incompleteProfile
{
  return self->_incompleteProfile;
}

- (NSData)languageProfile
{
  return self->_languageProfile;
}

- (void)setLanguageProfile:(id)a3
{
  objc_storeStrong((id *)&self->_languageProfile, a3);
}

- (NSData)pronunciationCache
{
  return self->_pronunciationCache;
}

- (void)setPronunciationCache:(id)a3
{
  objc_storeStrong((id *)&self->_pronunciationCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_pronunciationCache, 0);
  objc_storeStrong((id *)&self->_languageProfile, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
