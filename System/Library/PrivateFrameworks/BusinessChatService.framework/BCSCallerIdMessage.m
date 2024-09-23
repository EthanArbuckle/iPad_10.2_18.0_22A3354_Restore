@implementation BCSCallerIdMessage

- (void)setPhoneHash:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_phoneHash = a3;
}

- (void)setHasPhoneHash:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPhoneHash
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCompanyId
{
  return self->_companyId != 0;
}

- (BOOL)hasBusinessId
{
  return self->_businessId != 0;
}

- (BOOL)hasLocationId
{
  return self->_locationId != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasLogoUrl
{
  return self->_logoUrl != 0;
}

- (void)setIsVerified:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isVerified = a3;
}

- (void)setHasIsVerified:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVerified
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (BOOL)hasConflatedMuid
{
  return self->_conflatedMuid != 0;
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
  v8.super_class = (Class)BCSCallerIdMessage;
  -[BCSCallerIdMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallerIdMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *companyId;
  NSString *businessId;
  NSString *locationId;
  BCSCallerIdLocalizedString *name;
  void *v9;
  NSString *logoUrl;
  void *v11;
  BCSCallerIdLocalizedString *intent;
  void *v13;
  NSString *conflatedMuid;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_phoneHash);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("phone_hash"));

  }
  companyId = self->_companyId;
  if (companyId)
    objc_msgSend(v3, "setObject:forKey:", companyId, CFSTR("company_id"));
  businessId = self->_businessId;
  if (businessId)
    objc_msgSend(v3, "setObject:forKey:", businessId, CFSTR("business_id"));
  locationId = self->_locationId;
  if (locationId)
    objc_msgSend(v3, "setObject:forKey:", locationId, CFSTR("location_id"));
  name = self->_name;
  if (name)
  {
    -[BCSCallerIdLocalizedString dictionaryRepresentation](name, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("name"));

  }
  logoUrl = self->_logoUrl;
  if (logoUrl)
    objc_msgSend(v3, "setObject:forKey:", logoUrl, CFSTR("logo_url"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVerified);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("is_verified"));

  }
  intent = self->_intent;
  if (intent)
  {
    -[BCSCallerIdLocalizedString dictionaryRepresentation](intent, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("intent"));

  }
  conflatedMuid = self->_conflatedMuid;
  if (conflatedMuid)
    objc_msgSend(v3, "setObject:forKey:", conflatedMuid, CFSTR("conflated_muid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BCSCallerIdMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_companyId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_businessId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_locationId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_logoUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_intent)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_conflatedMuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_phoneHash;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  v5 = v4;
  if (self->_companyId)
  {
    objc_msgSend(v4, "setCompanyId:");
    v4 = v5;
  }
  if (self->_businessId)
  {
    objc_msgSend(v5, "setBusinessId:");
    v4 = v5;
  }
  if (self->_locationId)
  {
    objc_msgSend(v5, "setLocationId:");
    v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_logoUrl)
  {
    objc_msgSend(v5, "setLogoUrl:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_isVerified;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_intent)
  {
    objc_msgSend(v5, "setIntent:");
    v4 = v5;
  }
  if (self->_conflatedMuid)
  {
    objc_msgSend(v5, "setConflatedMuid:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_phoneHash;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_companyId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_businessId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_locationId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[BCSCallerIdLocalizedString copyWithZone:](self->_name, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_logoUrl, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v15;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 72) = self->_isVerified;
    *(_BYTE *)(v6 + 76) |= 2u;
  }
  v17 = -[BCSCallerIdLocalizedString copyWithZone:](self->_intent, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v17;

  v19 = -[NSString copyWithZone:](self->_conflatedMuid, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v19;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *companyId;
  NSString *businessId;
  NSString *locationId;
  BCSCallerIdLocalizedString *name;
  NSString *logoUrl;
  BCSCallerIdLocalizedString *intent;
  NSString *conflatedMuid;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_phoneHash != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_29;
  }
  companyId = self->_companyId;
  if ((unint64_t)companyId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](companyId, "isEqual:"))
    goto LABEL_29;
  businessId = self->_businessId;
  if ((unint64_t)businessId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](businessId, "isEqual:"))
      goto LABEL_29;
  }
  locationId = self->_locationId;
  if ((unint64_t)locationId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](locationId, "isEqual:"))
      goto LABEL_29;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 8))
  {
    if (!-[BCSCallerIdLocalizedString isEqual:](name, "isEqual:"))
      goto LABEL_29;
  }
  logoUrl = self->_logoUrl;
  if ((unint64_t)logoUrl | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](logoUrl, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) != 0)
    {
      if (self->_isVerified)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_29;
        goto LABEL_25;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_25;
    }
LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 76) & 2) != 0)
    goto LABEL_29;
LABEL_25:
  intent = self->_intent;
  if ((unint64_t)intent | *((_QWORD *)v4 + 5) && !-[BCSCallerIdLocalizedString isEqual:](intent, "isEqual:"))
    goto LABEL_29;
  conflatedMuid = self->_conflatedMuid;
  if ((unint64_t)conflatedMuid | *((_QWORD *)v4 + 4))
    v12 = -[NSString isEqual:](conflatedMuid, "isEqual:");
  else
    v12 = 1;
LABEL_30:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  unint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_phoneHash;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_companyId, "hash");
  v5 = -[NSString hash](self->_businessId, "hash");
  v6 = -[NSString hash](self->_locationId, "hash");
  v7 = -[BCSCallerIdLocalizedString hash](self->_name, "hash");
  v8 = -[NSString hash](self->_logoUrl, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_isVerified;
  else
    v9 = 0;
  v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v11 = -[BCSCallerIdLocalizedString hash](self->_intent, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_conflatedMuid, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  BCSCallerIdLocalizedString *name;
  uint64_t v7;
  BCSCallerIdLocalizedString *intent;
  uint64_t v9;
  _QWORD *v10;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_phoneHash = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v10 = v4;
  if (v4[3])
  {
    -[BCSCallerIdMessage setCompanyId:](self, "setCompanyId:");
    v5 = v10;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[BCSCallerIdMessage setBusinessId:](self, "setBusinessId:");
    v5 = v10;
  }
  if (*((_QWORD *)v5 + 6))
  {
    -[BCSCallerIdMessage setLocationId:](self, "setLocationId:");
    v5 = v10;
  }
  name = self->_name;
  v7 = *((_QWORD *)v5 + 8);
  if (name)
  {
    if (!v7)
      goto LABEL_15;
    -[BCSCallerIdLocalizedString mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_15;
    -[BCSCallerIdMessage setName:](self, "setName:");
  }
  v5 = v10;
LABEL_15:
  if (*((_QWORD *)v5 + 7))
  {
    -[BCSCallerIdMessage setLogoUrl:](self, "setLogoUrl:");
    v5 = v10;
  }
  if ((*((_BYTE *)v5 + 76) & 2) != 0)
  {
    self->_isVerified = *((_BYTE *)v5 + 72);
    *(_BYTE *)&self->_has |= 2u;
  }
  intent = self->_intent;
  v9 = *((_QWORD *)v5 + 5);
  if (intent)
  {
    if (!v9)
      goto LABEL_25;
    -[BCSCallerIdLocalizedString mergeFrom:](intent, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_25;
    -[BCSCallerIdMessage setIntent:](self, "setIntent:");
  }
  v5 = v10;
LABEL_25:
  if (*((_QWORD *)v5 + 4))
  {
    -[BCSCallerIdMessage setConflatedMuid:](self, "setConflatedMuid:");
    v5 = v10;
  }

}

- (int64_t)phoneHash
{
  return self->_phoneHash;
}

- (NSString)companyId
{
  return self->_companyId;
}

- (void)setCompanyId:(id)a3
{
  objc_storeStrong((id *)&self->_companyId, a3);
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_storeStrong((id *)&self->_businessId, a3);
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_locationId, a3);
}

- (BCSCallerIdLocalizedString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)logoUrl
{
  return self->_logoUrl;
}

- (void)setLogoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_logoUrl, a3);
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BCSCallerIdLocalizedString)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (NSString)conflatedMuid
{
  return self->_conflatedMuid;
}

- (void)setConflatedMuid:(id)a3
{
  objc_storeStrong((id *)&self->_conflatedMuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoUrl, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_conflatedMuid, 0);
  objc_storeStrong((id *)&self->_companyId, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

@end
