@implementation MXSpeechProfile

- (void)setMoreDataFollows:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_moreDataFollows = a3;
}

- (void)setHasMoreDataFollows:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMoreDataFollows
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLanguageProfile
{
  return self->_languageProfile != 0;
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
  v8.super_class = (Class)MXSpeechProfile;
  -[MXSpeechProfile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXSpeechProfile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *languageProfile;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_moreDataFollows);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("more_data_follows"));

  }
  languageProfile = self->_languageProfile;
  if (languageProfile)
    objc_msgSend(v3, "setObject:forKey:", languageProfile, CFSTR("language_profile"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXSpeechProfileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
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

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_moreDataFollows;
    v4[20] |= 1u;
  }
  if (self->_languageProfile)
  {
    v5 = v4;
    objc_msgSend(v4, "setLanguageProfile:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_moreDataFollows;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_languageProfile, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSData *languageProfile;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_moreDataFollows)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  languageProfile = self->_languageProfile;
  if ((unint64_t)languageProfile | *((_QWORD *)v4 + 1))
    v5 = -[NSData isEqual:](languageProfile, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_moreDataFollows;
  else
    v2 = 0;
  return -[NSData hash](self->_languageProfile, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 1) != 0)
  {
    self->_moreDataFollows = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[MXSpeechProfile setLanguageProfile:](self, "setLanguageProfile:");
    v4 = v5;
  }

}

- (BOOL)moreDataFollows
{
  return self->_moreDataFollows;
}

- (NSData)languageProfile
{
  return self->_languageProfile;
}

- (void)setLanguageProfile:(id)a3
{
  objc_storeStrong((id *)&self->_languageProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageProfile, 0);
}

@end
