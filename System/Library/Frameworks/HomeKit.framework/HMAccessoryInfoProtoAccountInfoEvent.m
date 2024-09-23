@implementation HMAccessoryInfoProtoAccountInfoEvent

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasAaAltDSID
{
  return self->_aaAltDSID != 0;
}

- (BOOL)hasAmsAltDSID
{
  return self->_amsAltDSID != 0;
}

- (void)setSignedIn:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_signedIn = a3;
}

- (void)setHasSignedIn:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSignedIn
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoAccountInfoEvent;
  -[HMAccessoryInfoProtoAccountInfoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoAccountInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *username;
  NSString *aaAltDSID;
  NSString *amsAltDSID;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  username = self->_username;
  if (username)
    objc_msgSend(v3, "setObject:forKey:", username, CFSTR("username"));
  aaAltDSID = self->_aaAltDSID;
  if (aaAltDSID)
    objc_msgSend(v4, "setObject:forKey:", aaAltDSID, CFSTR("aa_altDSID"));
  amsAltDSID = self->_amsAltDSID;
  if (amsAltDSID)
    objc_msgSend(v4, "setObject:forKey:", amsAltDSID, CFSTR("ams_altDSID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_signedIn);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("signedIn"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoAccountInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_aaAltDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_amsAltDSID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_username)
  {
    objc_msgSend(v4, "setUsername:");
    v4 = v5;
  }
  if (self->_aaAltDSID)
  {
    objc_msgSend(v5, "setAaAltDSID:");
    v4 = v5;
  }
  if (self->_amsAltDSID)
  {
    objc_msgSend(v5, "setAmsAltDSID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_signedIn;
    v4[36] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_username, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_aaAltDSID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_amsAltDSID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_signedIn;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *username;
  NSString *aaAltDSID;
  NSString *amsAltDSID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  username = self->_username;
  if ((unint64_t)username | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](username, "isEqual:"))
      goto LABEL_10;
  }
  aaAltDSID = self->_aaAltDSID;
  if ((unint64_t)aaAltDSID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](aaAltDSID, "isEqual:"))
      goto LABEL_10;
  }
  amsAltDSID = self->_amsAltDSID;
  if ((unint64_t)amsAltDSID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](amsAltDSID, "isEqual:"))
      goto LABEL_10;
  }
  v8 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      v8 = 0;
      goto LABEL_11;
    }
    if (self->_signedIn)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_username, "hash");
  v4 = -[NSString hash](self->_aaAltDSID, "hash");
  v5 = -[NSString hash](self->_amsAltDSID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_signedIn;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setUsername:](self, "setUsername:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setAaAltDSID:](self, "setAaAltDSID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HMAccessoryInfoProtoAccountInfoEvent setAmsAltDSID:](self, "setAmsAltDSID:");
    v4 = v5;
  }
  if (v4[36])
  {
    self->_signedIn = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)aaAltDSID
{
  return self->_aaAltDSID;
}

- (void)setAaAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_aaAltDSID, a3);
}

- (NSString)amsAltDSID
{
  return self->_amsAltDSID;
}

- (void)setAmsAltDSID:(id)a3
{
  objc_storeStrong((id *)&self->_amsAltDSID, a3);
}

- (BOOL)signedIn
{
  return self->_signedIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_amsAltDSID, 0);
  objc_storeStrong((id *)&self->_aaAltDSID, 0);
}

@end
