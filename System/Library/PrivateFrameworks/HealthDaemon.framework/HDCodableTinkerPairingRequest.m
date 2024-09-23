@implementation HDCodableTinkerPairingRequest

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (BOOL)hasGuardianIcloudIdentifier
{
  return self->_guardianIcloudIdentifier != 0;
}

- (int)setupType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_setupType;
  else
    return 0;
}

- (void)setSetupType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_setupType = a3;
}

- (void)setHasSetupType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSetupType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)setupTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("TinkerPairingInitialSetup");
  if (a3 == 1)
  {
    v3 = CFSTR("TinkerPairingMigrationSetup");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSetupType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TinkerPairingInitialSetup")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TinkerPairingMigrationSetup"));

  return v4;
}

- (BOOL)hasGuardianFirstName
{
  return self->_guardianFirstName != 0;
}

- (BOOL)hasGuardianLastName
{
  return self->_guardianLastName != 0;
}

- (void)setGuardianDSID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_guardianDSID = a3;
}

- (void)setHasGuardianDSID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGuardianDSID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProfileIdentifier
{
  return self->_profileIdentifier != 0;
}

- (BOOL)hasTinkerFirstName
{
  return self->_tinkerFirstName != 0;
}

- (BOOL)hasTinkerLastName
{
  return self->_tinkerLastName != 0;
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
  v8.super_class = (Class)HDCodableTinkerPairingRequest;
  -[HDCodableTinkerPairingRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerPairingRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestIdentifier;
  NSString *guardianIcloudIdentifier;
  int setupType;
  __CFString *v8;
  NSString *guardianFirstName;
  NSString *guardianLastName;
  void *v11;
  NSData *profileIdentifier;
  NSString *tinkerFirstName;
  NSString *tinkerLastName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestIdentifier, CFSTR("requestIdentifier"));
  guardianIcloudIdentifier = self->_guardianIcloudIdentifier;
  if (guardianIcloudIdentifier)
    objc_msgSend(v4, "setObject:forKey:", guardianIcloudIdentifier, CFSTR("guardianIcloudIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    setupType = self->_setupType;
    if (setupType)
    {
      if (setupType == 1)
      {
        v8 = CFSTR("TinkerPairingMigrationSetup");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_setupType);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("TinkerPairingInitialSetup");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("setupType"));

  }
  guardianFirstName = self->_guardianFirstName;
  if (guardianFirstName)
    objc_msgSend(v4, "setObject:forKey:", guardianFirstName, CFSTR("guardianFirstName"));
  guardianLastName = self->_guardianLastName;
  if (guardianLastName)
    objc_msgSend(v4, "setObject:forKey:", guardianLastName, CFSTR("guardianLastName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_guardianDSID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("guardianDSID"));

  }
  profileIdentifier = self->_profileIdentifier;
  if (profileIdentifier)
    objc_msgSend(v4, "setObject:forKey:", profileIdentifier, CFSTR("profileIdentifier"));
  tinkerFirstName = self->_tinkerFirstName;
  if (tinkerFirstName)
    objc_msgSend(v4, "setObject:forKey:", tinkerFirstName, CFSTR("tinkerFirstName"));
  tinkerLastName = self->_tinkerLastName;
  if (tinkerLastName)
    objc_msgSend(v4, "setObject:forKey:", tinkerLastName, CFSTR("tinkerLastName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTinkerPairingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_guardianIcloudIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_guardianFirstName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_guardianLastName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_profileIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_tinkerFirstName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_tinkerLastName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_requestIdentifier)
  {
    objc_msgSend(v4, "setRequestIdentifier:");
    v4 = v5;
  }
  if (self->_guardianIcloudIdentifier)
  {
    objc_msgSend(v5, "setGuardianIcloudIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_setupType;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  if (self->_guardianFirstName)
  {
    objc_msgSend(v5, "setGuardianFirstName:");
    v4 = v5;
  }
  if (self->_guardianLastName)
  {
    objc_msgSend(v5, "setGuardianLastName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_guardianDSID;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_profileIdentifier)
  {
    objc_msgSend(v5, "setProfileIdentifier:");
    v4 = v5;
  }
  if (self->_tinkerFirstName)
  {
    objc_msgSend(v5, "setTinkerFirstName:");
    v4 = v5;
  }
  if (self->_tinkerLastName)
  {
    objc_msgSend(v5, "setTinkerLastName:");
    v4 = v5;
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_guardianIcloudIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_setupType;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_guardianFirstName, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_guardianLastName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_guardianDSID;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v14 = -[NSData copyWithZone:](self->_profileIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_tinkerFirstName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  v18 = -[NSString copyWithZone:](self->_tinkerLastName, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestIdentifier;
  NSString *guardianIcloudIdentifier;
  NSString *guardianFirstName;
  NSString *guardianLastName;
  NSData *profileIdentifier;
  NSString *tinkerFirstName;
  NSString *tinkerLastName;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  requestIdentifier = self->_requestIdentifier;
  if ((unint64_t)requestIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](requestIdentifier, "isEqual:"))
      goto LABEL_26;
  }
  guardianIcloudIdentifier = self->_guardianIcloudIdentifier;
  if ((unint64_t)guardianIcloudIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](guardianIcloudIdentifier, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_setupType != *((_DWORD *)v4 + 14))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  guardianFirstName = self->_guardianFirstName;
  if ((unint64_t)guardianFirstName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](guardianFirstName, "isEqual:"))
  {
    goto LABEL_26;
  }
  guardianLastName = self->_guardianLastName;
  if ((unint64_t)guardianLastName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](guardianLastName, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_guardianDSID != *((_QWORD *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_26;
  }
  profileIdentifier = self->_profileIdentifier;
  if ((unint64_t)profileIdentifier | *((_QWORD *)v4 + 5)
    && !-[NSData isEqual:](profileIdentifier, "isEqual:"))
  {
    goto LABEL_26;
  }
  tinkerFirstName = self->_tinkerFirstName;
  if ((unint64_t)tinkerFirstName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](tinkerFirstName, "isEqual:"))
      goto LABEL_26;
  }
  tinkerLastName = self->_tinkerLastName;
  if ((unint64_t)tinkerLastName | *((_QWORD *)v4 + 9))
    v12 = -[NSString isEqual:](tinkerLastName, "isEqual:");
  else
    v12 = 1;
LABEL_27:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_requestIdentifier, "hash");
  v4 = -[NSString hash](self->_guardianIcloudIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_setupType;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_guardianFirstName, "hash");
  v7 = -[NSString hash](self->_guardianLastName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_guardianDSID;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSData hash](self->_profileIdentifier, "hash");
  v10 = -[NSString hash](self->_tinkerFirstName, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_tinkerLastName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCodableTinkerPairingRequest setRequestIdentifier:](self, "setRequestIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableTinkerPairingRequest setGuardianIcloudIdentifier:](self, "setGuardianIcloudIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    self->_setupType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HDCodableTinkerPairingRequest setGuardianFirstName:](self, "setGuardianFirstName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCodableTinkerPairingRequest setGuardianLastName:](self, "setGuardianLastName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_guardianDSID = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCodableTinkerPairingRequest setProfileIdentifier:](self, "setProfileIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCodableTinkerPairingRequest setTinkerFirstName:](self, "setTinkerFirstName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableTinkerPairingRequest setTinkerLastName:](self, "setTinkerLastName:");
    v4 = v5;
  }

}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)guardianIcloudIdentifier
{
  return self->_guardianIcloudIdentifier;
}

- (void)setGuardianIcloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_guardianIcloudIdentifier, a3);
}

- (NSString)guardianFirstName
{
  return self->_guardianFirstName;
}

- (void)setGuardianFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_guardianFirstName, a3);
}

- (NSString)guardianLastName
{
  return self->_guardianLastName;
}

- (void)setGuardianLastName:(id)a3
{
  objc_storeStrong((id *)&self->_guardianLastName, a3);
}

- (int64_t)guardianDSID
{
  return self->_guardianDSID;
}

- (NSData)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (NSString)tinkerFirstName
{
  return self->_tinkerFirstName;
}

- (void)setTinkerFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_tinkerFirstName, a3);
}

- (NSString)tinkerLastName
{
  return self->_tinkerLastName;
}

- (void)setTinkerLastName:(id)a3
{
  objc_storeStrong((id *)&self->_tinkerLastName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerLastName, 0);
  objc_storeStrong((id *)&self->_tinkerFirstName, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_guardianLastName, 0);
  objc_storeStrong((id *)&self->_guardianIcloudIdentifier, 0);
  objc_storeStrong((id *)&self->_guardianFirstName, 0);
}

@end
