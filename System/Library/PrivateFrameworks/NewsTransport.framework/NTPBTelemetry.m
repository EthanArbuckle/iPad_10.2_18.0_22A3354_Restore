@implementation NTPBTelemetry

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDevicePlatform
{
  return self->_devicePlatform != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setAppBuild:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appBuild = a3;
}

- (void)setHasAppBuild:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppBuild
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCarrier
{
  return self->_carrier != 0;
}

- (BOOL)hasMobileCountryCode
{
  return self->_mobileCountryCode != 0;
}

- (BOOL)hasMobileNetworkCode
{
  return self->_mobileNetworkCode != 0;
}

- (BOOL)hasOsCountryCode
{
  return self->_osCountryCode != 0;
}

- (int)osInstallVariant
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_osInstallVariant;
  else
    return 0;
}

- (void)setOsInstallVariant:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_osInstallVariant = a3;
}

- (void)setHasOsInstallVariant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOsInstallVariant
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)osInstallVariantAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53518 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOsInstallVariant:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_OS_INSTALL_VARIANT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_OS_INSTALL_VARIANT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_OS_INSTALL_VARIANT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)contentEnvironment
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_contentEnvironment;
  else
    return 0;
}

- (void)setContentEnvironment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_contentEnvironment = a3;
}

- (void)setHasContentEnvironment:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentEnvironment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)clearNetworkEventGroups
{
  -[NSMutableArray removeAllObjects](self->_networkEventGroups, "removeAllObjects");
}

- (void)addNetworkEventGroups:(id)a3
{
  id v4;
  NSMutableArray *networkEventGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  networkEventGroups = self->_networkEventGroups;
  v8 = v4;
  if (!networkEventGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_networkEventGroups;
    self->_networkEventGroups = v6;

    v4 = v8;
    networkEventGroups = self->_networkEventGroups;
  }
  -[NSMutableArray addObject:](networkEventGroups, "addObject:", v4);

}

- (unint64_t)networkEventGroupsCount
{
  return -[NSMutableArray count](self->_networkEventGroups, "count");
}

- (id)networkEventGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_networkEventGroups, "objectAtIndex:", a3);
}

+ (Class)networkEventGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBuildNumber
{
  return self->_appBuildNumber != 0;
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
  v8.super_class = (Class)NTPBTelemetry;
  -[NTPBTelemetry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTelemetry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceModel;
  NSString *devicePlatform;
  NSString *osVersion;
  NSString *appVersion;
  void *v9;
  NSString *countryCode;
  NSString *languageCode;
  NSString *carrier;
  NSString *mobileCountryCode;
  NSString *mobileNetworkCode;
  NSString *osCountryCode;
  char has;
  uint64_t osInstallVariant;
  void *v18;
  void *v19;
  NSString *userId;
  NSString *userStorefrontId;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSString *appBuildNumber;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  devicePlatform = self->_devicePlatform;
  if (devicePlatform)
    objc_msgSend(v4, "setObject:forKey:", devicePlatform, CFSTR("device_platform"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v4, "setObject:forKey:", osVersion, CFSTR("os_version"));
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v4, "setObject:forKey:", appVersion, CFSTR("app_version"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appBuild);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("app_build"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v4, "setObject:forKey:", countryCode, CFSTR("country_code"));
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v4, "setObject:forKey:", languageCode, CFSTR("language_code"));
  carrier = self->_carrier;
  if (carrier)
    objc_msgSend(v4, "setObject:forKey:", carrier, CFSTR("carrier"));
  mobileCountryCode = self->_mobileCountryCode;
  if (mobileCountryCode)
    objc_msgSend(v4, "setObject:forKey:", mobileCountryCode, CFSTR("mobile_country_code"));
  mobileNetworkCode = self->_mobileNetworkCode;
  if (mobileNetworkCode)
    objc_msgSend(v4, "setObject:forKey:", mobileNetworkCode, CFSTR("mobile_network_code"));
  osCountryCode = self->_osCountryCode;
  if (osCountryCode)
    objc_msgSend(v4, "setObject:forKey:", osCountryCode, CFSTR("os_country_code"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    osInstallVariant = self->_osInstallVariant;
    if (osInstallVariant >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_osInstallVariant);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = *(&off_24CD53518 + osInstallVariant);
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("os_install_variant"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_contentEnvironment);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("content_environment"));

  }
  userId = self->_userId;
  if (userId)
    objc_msgSend(v4, "setObject:forKey:", userId, CFSTR("user_id"));
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v4, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  if (-[NSMutableArray count](self->_networkEventGroups, "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_networkEventGroups, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = self->_networkEventGroups;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("network_event_groups"));
  }
  appBuildNumber = self->_appBuildNumber;
  if (appBuildNumber)
    objc_msgSend(v4, "setObject:forKey:", appBuildNumber, CFSTR("app_build_number"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  if (self->_devicePlatform)
    PBDataWriterWriteStringField();
  if (self->_osVersion)
    PBDataWriterWriteStringField();
  if (self->_appVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  if (self->_carrier)
    PBDataWriterWriteStringField();
  if (self->_mobileCountryCode)
    PBDataWriterWriteStringField();
  if (self->_mobileNetworkCode)
    PBDataWriterWriteStringField();
  if (self->_osCountryCode)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_userId)
    PBDataWriterWriteStringField();
  if (self->_userStorefrontId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_networkEventGroups;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_appBuildNumber)
    PBDataWriterWriteStringField();

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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char has;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_devicePlatform, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v10;

  v12 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_appBuild;
    *(_BYTE *)(v5 + 144) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v16;

  v18 = -[NSString copyWithZone:](self->_carrier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  v20 = -[NSString copyWithZone:](self->_mobileCountryCode, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v20;

  v22 = -[NSString copyWithZone:](self->_mobileNetworkCode, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  v24 = -[NSString copyWithZone:](self->_osCountryCode, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v24;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_osInstallVariant;
    *(_BYTE *)(v5 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_contentEnvironment;
    *(_BYTE *)(v5 + 144) |= 2u;
  }
  v27 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v27;

  v29 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v29;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v31 = self->_networkEventGroups;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v40);
        objc_msgSend((id)v5, "addNetworkEventGroups:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v33);
  }

  v37 = -[NSString copyWithZone:](self->_appBuildNumber, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v37;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceModel;
  NSString *devicePlatform;
  NSString *osVersion;
  NSString *appVersion;
  NSString *countryCode;
  NSString *languageCode;
  NSString *carrier;
  NSString *mobileCountryCode;
  NSString *mobileNetworkCode;
  NSString *osCountryCode;
  NSString *userId;
  NSString *userStorefrontId;
  NSMutableArray *networkEventGroups;
  NSString *appBuildNumber;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_45;
  }
  devicePlatform = self->_devicePlatform;
  if ((unint64_t)devicePlatform | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](devicePlatform, "isEqual:"))
      goto LABEL_45;
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:"))
      goto LABEL_45;
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0 || self->_appBuild != *((_QWORD *)v4 + 1))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
LABEL_45:
    v19 = 0;
    goto LABEL_46;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_45;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:"))
      goto LABEL_45;
  }
  carrier = self->_carrier;
  if ((unint64_t)carrier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](carrier, "isEqual:"))
      goto LABEL_45;
  }
  mobileCountryCode = self->_mobileCountryCode;
  if ((unint64_t)mobileCountryCode | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](mobileCountryCode, "isEqual:"))
      goto LABEL_45;
  }
  mobileNetworkCode = self->_mobileNetworkCode;
  if ((unint64_t)mobileNetworkCode | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](mobileNetworkCode, "isEqual:"))
      goto LABEL_45;
  }
  osCountryCode = self->_osCountryCode;
  if ((unint64_t)osCountryCode | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](osCountryCode, "isEqual:"))
      goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 4) == 0 || self->_osInstallVariant != *((_DWORD *)v4 + 28))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 2) == 0 || self->_contentEnvironment != *((_DWORD *)v4 + 10))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    goto LABEL_45;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 16) && !-[NSString isEqual:](userId, "isEqual:"))
    goto LABEL_45;
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:"))
      goto LABEL_45;
  }
  networkEventGroups = self->_networkEventGroups;
  if ((unint64_t)networkEventGroups | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](networkEventGroups, "isEqual:"))
      goto LABEL_45;
  }
  appBuildNumber = self->_appBuildNumber;
  if ((unint64_t)appBuildNumber | *((_QWORD *)v4 + 2))
    v19 = -[NSString isEqual:](appBuildNumber, "isEqual:");
  else
    v19 = 1;
LABEL_46:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;

  v20 = -[NSString hash](self->_deviceModel, "hash");
  v19 = -[NSString hash](self->_devicePlatform, "hash");
  v18 = -[NSString hash](self->_osVersion, "hash");
  v3 = -[NSString hash](self->_appVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_appBuild;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_countryCode, "hash");
  v6 = -[NSString hash](self->_languageCode, "hash");
  v7 = -[NSString hash](self->_carrier, "hash");
  v8 = -[NSString hash](self->_mobileCountryCode, "hash");
  v9 = -[NSString hash](self->_mobileNetworkCode, "hash");
  v10 = -[NSString hash](self->_osCountryCode, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = 2654435761 * self->_osInstallVariant;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v12 = 2654435761 * self->_contentEnvironment;
LABEL_9:
  v13 = v19 ^ v20 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v14 = v11 ^ v12 ^ -[NSString hash](self->_userId, "hash");
  v15 = v14 ^ -[NSString hash](self->_userStorefrontId, "hash");
  v16 = v15 ^ -[NSMutableArray hash](self->_networkEventGroups, "hash");
  return v13 ^ v16 ^ -[NSString hash](self->_appBuildNumber, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 7))
    -[NTPBTelemetry setDeviceModel:](self, "setDeviceModel:");
  if (*((_QWORD *)v4 + 8))
    -[NTPBTelemetry setDevicePlatform:](self, "setDevicePlatform:");
  if (*((_QWORD *)v4 + 15))
    -[NTPBTelemetry setOsVersion:](self, "setOsVersion:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBTelemetry setAppVersion:](self, "setAppVersion:");
  if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
    self->_appBuild = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[NTPBTelemetry setCountryCode:](self, "setCountryCode:");
  if (*((_QWORD *)v4 + 9))
    -[NTPBTelemetry setLanguageCode:](self, "setLanguageCode:");
  if (*((_QWORD *)v4 + 4))
    -[NTPBTelemetry setCarrier:](self, "setCarrier:");
  if (*((_QWORD *)v4 + 10))
    -[NTPBTelemetry setMobileCountryCode:](self, "setMobileCountryCode:");
  if (*((_QWORD *)v4 + 11))
    -[NTPBTelemetry setMobileNetworkCode:](self, "setMobileNetworkCode:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBTelemetry setOsCountryCode:](self, "setOsCountryCode:");
  v5 = *((_BYTE *)v4 + 144);
  if ((v5 & 4) != 0)
  {
    self->_osInstallVariant = *((_DWORD *)v4 + 28);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 144);
  }
  if ((v5 & 2) != 0)
  {
    self->_contentEnvironment = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 16))
    -[NTPBTelemetry setUserId:](self, "setUserId:");
  if (*((_QWORD *)v4 + 17))
    -[NTPBTelemetry setUserStorefrontId:](self, "setUserStorefrontId:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 12);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NTPBTelemetry addNetworkEventGroups:](self, "addNetworkEventGroups:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 2))
    -[NTPBTelemetry setAppBuildNumber:](self, "setAppBuildNumber:");

}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (void)setDevicePlatform:(id)a3
{
  objc_storeStrong((id *)&self->_devicePlatform, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (int64_t)appBuild
{
  return self->_appBuild;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
  objc_storeStrong((id *)&self->_carrier, a3);
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (void)setMobileCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_mobileCountryCode, a3);
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (void)setMobileNetworkCode:(id)a3
{
  objc_storeStrong((id *)&self->_mobileNetworkCode, a3);
}

- (NSString)osCountryCode
{
  return self->_osCountryCode;
}

- (void)setOsCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_osCountryCode, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_userStorefrontId, a3);
}

- (NSMutableArray)networkEventGroups
{
  return self->_networkEventGroups;
}

- (void)setNetworkEventGroups:(id)a3
{
  objc_storeStrong((id *)&self->_networkEventGroups, a3);
}

- (NSString)appBuildNumber
{
  return self->_appBuildNumber;
}

- (void)setAppBuildNumber:(id)a3
{
  objc_storeStrong((id *)&self->_appBuildNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_osCountryCode, 0);
  objc_storeStrong((id *)&self->_networkEventGroups, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appBuildNumber, 0);
}

@end
