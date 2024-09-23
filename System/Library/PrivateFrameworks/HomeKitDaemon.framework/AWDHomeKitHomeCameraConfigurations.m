@implementation AWDHomeKitHomeCameraConfigurations

- (void)clearHomeKitCameraUserSettings
{
  -[NSMutableArray removeAllObjects](self->_homeKitCameraUserSettings, "removeAllObjects");
}

- (void)addHomeKitCameraUserSettings:(id)a3
{
  id v4;
  NSMutableArray *homeKitCameraUserSettings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeKitCameraUserSettings = self->_homeKitCameraUserSettings;
  v8 = v4;
  if (!homeKitCameraUserSettings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_homeKitCameraUserSettings;
    self->_homeKitCameraUserSettings = v6;

    v4 = v8;
    homeKitCameraUserSettings = self->_homeKitCameraUserSettings;
  }
  -[NSMutableArray addObject:](homeKitCameraUserSettings, "addObject:", v4);

}

- (unint64_t)homeKitCameraUserSettingsCount
{
  return -[NSMutableArray count](self->_homeKitCameraUserSettings, "count");
}

- (id)homeKitCameraUserSettingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeKitCameraUserSettings, "objectAtIndex:", a3);
}

- (void)clearHomeKitCameraSettings
{
  -[NSMutableArray removeAllObjects](self->_homeKitCameraSettings, "removeAllObjects");
}

- (void)addHomeKitCameraSettings:(id)a3
{
  id v4;
  NSMutableArray *homeKitCameraSettings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  homeKitCameraSettings = self->_homeKitCameraSettings;
  v8 = v4;
  if (!homeKitCameraSettings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_homeKitCameraSettings;
    self->_homeKitCameraSettings = v6;

    v4 = v8;
    homeKitCameraSettings = self->_homeKitCameraSettings;
  }
  -[NSMutableArray addObject:](homeKitCameraSettings, "addObject:", v4);

}

- (unint64_t)homeKitCameraSettingsCount
{
  return -[NSMutableArray count](self->_homeKitCameraSettings, "count");
}

- (id)homeKitCameraSettingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_homeKitCameraSettings, "objectAtIndex:", a3);
}

- (void)setEnabledResidentsDeviceCapabilities:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enabledResidentsDeviceCapabilities = a3;
}

- (void)setHasEnabledResidentsDeviceCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabledResidentsDeviceCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsFaceClassificationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isFaceClassificationEnabled = a3;
}

- (void)setHasIsFaceClassificationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsFaceClassificationEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsOwner:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isOwner = a3;
}

- (void)setHasIsOwner:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsOwner
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)AWDHomeKitHomeCameraConfigurations;
  -[AWDHomeKitHomeCameraConfigurations description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitHomeCameraConfigurations dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  char has;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_homeKitCameraUserSettings, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_homeKitCameraUserSettings, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = self->_homeKitCameraUserSettings;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("homeKitCameraUserSettings"));
  }
  if (-[NSMutableArray count](self->_homeKitCameraSettings, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_homeKitCameraSettings, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = self->_homeKitCameraSettings;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("homeKitCameraSettings"));
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_21;
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFaceClassificationEnabled, (_QWORD)v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("isFaceClassificationEnabled"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabledResidentsDeviceCapabilities);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("enabledResidentsDeviceCapabilities"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_25;
LABEL_21:
  if ((has & 4) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOwner, (_QWORD)v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("isOwner"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitHomeCameraConfigurationsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_homeKitCameraUserSettings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_homeKitCameraSettings;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
LABEL_21:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((has & 4) != 0)
LABEL_18:
    PBDataWriterWriteBOOLField();
LABEL_19:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char has;
  id v13;

  v13 = a3;
  if (-[AWDHomeKitHomeCameraConfigurations homeKitCameraUserSettingsCount](self, "homeKitCameraUserSettingsCount"))
  {
    objc_msgSend(v13, "clearHomeKitCameraUserSettings");
    v4 = -[AWDHomeKitHomeCameraConfigurations homeKitCameraUserSettingsCount](self, "homeKitCameraUserSettingsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[AWDHomeKitHomeCameraConfigurations homeKitCameraUserSettingsAtIndex:](self, "homeKitCameraUserSettingsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addHomeKitCameraUserSettings:", v7);

      }
    }
  }
  if (-[AWDHomeKitHomeCameraConfigurations homeKitCameraSettingsCount](self, "homeKitCameraSettingsCount"))
  {
    objc_msgSend(v13, "clearHomeKitCameraSettings");
    v8 = -[AWDHomeKitHomeCameraConfigurations homeKitCameraSettingsCount](self, "homeKitCameraSettingsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[AWDHomeKitHomeCameraConfigurations homeKitCameraSettingsAtIndex:](self, "homeKitCameraSettingsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addHomeKitCameraSettings:", v11);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
LABEL_15:
    *((_BYTE *)v13 + 32) = self->_isFaceClassificationEnabled;
    *((_BYTE *)v13 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_DWORD *)v13 + 2) = self->_enabledResidentsDeviceCapabilities;
  *((_BYTE *)v13 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 4) != 0)
  {
LABEL_12:
    *((_BYTE *)v13 + 33) = self->_isOwner;
    *((_BYTE *)v13 + 36) |= 4u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_homeKitCameraUserSettings;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHomeKitCameraUserSettings:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_homeKitCameraSettings;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addHomeKitCameraSettings:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_17;
LABEL_21:
    *(_BYTE *)(v5 + 32) = self->_isFaceClassificationEnabled;
    *(_BYTE *)(v5 + 36) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_18;
  }
  *(_DWORD *)(v5 + 8) = self->_enabledResidentsDeviceCapabilities;
  *(_BYTE *)(v5 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((has & 4) != 0)
  {
LABEL_18:
    *(_BYTE *)(v5 + 33) = self->_isOwner;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *homeKitCameraUserSettings;
  NSMutableArray *homeKitCameraSettings;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  homeKitCameraUserSettings = self->_homeKitCameraUserSettings;
  if ((unint64_t)homeKitCameraUserSettings | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](homeKitCameraUserSettings, "isEqual:"))
      goto LABEL_21;
  }
  homeKitCameraSettings = self->_homeKitCameraSettings;
  if ((unint64_t)homeKitCameraSettings | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](homeKitCameraSettings, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_enabledResidentsDeviceCapabilities != *((_DWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_21;
    if (self->_isFaceClassificationEnabled)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_21;
  }
  v7 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_isOwner)
      {
        if (!*((_BYTE *)v4 + 33))
          goto LABEL_21;
      }
      else if (*((_BYTE *)v4 + 33))
      {
        goto LABEL_21;
      }
      v7 = 1;
      goto LABEL_22;
    }
LABEL_21:
    v7 = 0;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_homeKitCameraUserSettings, "hash");
  v4 = -[NSMutableArray hash](self->_homeKitCameraSettings, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_enabledResidentsDeviceCapabilities;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_isFaceClassificationEnabled;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_isOwner;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[AWDHomeKitHomeCameraConfigurations addHomeKitCameraUserSettings:](self, "addHomeKitCameraUserSettings:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[AWDHomeKitHomeCameraConfigurations addHomeKitCameraSettings:](self, "addHomeKitCameraSettings:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15 = *((_BYTE *)v4 + 36);
  if ((v15 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_17;
LABEL_21:
    self->_isFaceClassificationEnabled = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_enabledResidentsDeviceCapabilities = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v15 = *((_BYTE *)v4 + 36);
  if ((v15 & 2) != 0)
    goto LABEL_21;
LABEL_17:
  if ((v15 & 4) != 0)
  {
LABEL_18:
    self->_isOwner = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_19:

}

- (NSMutableArray)homeKitCameraUserSettings
{
  return self->_homeKitCameraUserSettings;
}

- (void)setHomeKitCameraUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitCameraUserSettings, a3);
}

- (NSMutableArray)homeKitCameraSettings
{
  return self->_homeKitCameraSettings;
}

- (void)setHomeKitCameraSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitCameraSettings, a3);
}

- (unsigned)enabledResidentsDeviceCapabilities
{
  return self->_enabledResidentsDeviceCapabilities;
}

- (BOOL)isFaceClassificationEnabled
{
  return self->_isFaceClassificationEnabled;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitCameraUserSettings, 0);
  objc_storeStrong((id *)&self->_homeKitCameraSettings, 0);
}

+ (Class)homeKitCameraUserSettingsType
{
  return (Class)objc_opt_class();
}

+ (Class)homeKitCameraSettingsType
{
  return (Class)objc_opt_class();
}

@end
