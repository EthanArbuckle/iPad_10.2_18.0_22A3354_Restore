@implementation _MRDiscoverySessionConfigurationProtobuf

- (int)features
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_features;
  else
    return 0;
}

- (void)setFeatures:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_features = a3;
}

- (void)setHasFeatures:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeatures
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)featuresAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("None");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("Audio");
      return v3;
    case 2:
      return CFSTR("Screen");
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 4:
      return CFSTR("Video");
    case 8:
      return CFSTR("RemoteControl");
    default:
      if (a3 == 256)
        return CFSTR("Companion");
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsFeatures:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Screen")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteControl")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Companion")))
  {
    v4 = 256;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRoutingContextUID
{
  return self->_routingContextUID != 0;
}

- (void)setEnableThrottling:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_enableThrottling = a3;
}

- (void)setHasEnableThrottling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEnableThrottling
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_alwaysAllowUpdates = a3;
}

- (void)setHasAlwaysAllowUpdates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlwaysAllowUpdates
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_populatesExternalDevice = a3;
}

- (void)setHasPopulatesExternalDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPopulatesExternalDevice
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (void)setTargetSessionID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_targetSessionID = a3;
}

- (void)setHasTargetSessionID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTargetSessionID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)_MRDiscoverySessionConfigurationProtobuf;
  -[_MRDiscoverySessionConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRDiscoverySessionConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int features;
  __CFString *v5;
  NSString *routingContextUID;
  char has;
  void *v8;
  NSString *outputDeviceUID;
  void *v10;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    features = self->_features;
    v5 = CFSTR("None");
    switch(features)
    {
      case 0:
        break;
      case 1:
        v5 = CFSTR("Audio");
        break;
      case 2:
        v5 = CFSTR("Screen");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_6;
      case 4:
        v5 = CFSTR("Video");
        break;
      case 8:
        v5 = CFSTR("RemoteControl");
        break;
      default:
        if (features == 256)
        {
          v5 = CFSTR("Companion");
        }
        else
        {
LABEL_6:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_features);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("features"));

  }
  routingContextUID = self->_routingContextUID;
  if (routingContextUID)
    objc_msgSend(v3, "setObject:forKey:", routingContextUID, CFSTR("routingContextUID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableThrottling);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("enableThrottling"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alwaysAllowUpdates);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("alwaysAllowUpdates"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_populatesExternalDevice);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("populatesExternalDevice"));

  }
LABEL_17:
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetSessionID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("targetSessionID"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDiscoverySessionConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_routingContextUID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_outputDeviceUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_features;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v6 = v4;
  if (self->_routingContextUID)
  {
    objc_msgSend(v4, "setRoutingContextUID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 37) = self->_enableThrottling;
    *((_BYTE *)v4 + 40) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 36) = self->_alwaysAllowUpdates;
  *((_BYTE *)v4 + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 38) = self->_populatesExternalDevice;
    *((_BYTE *)v4 + 40) |= 0x10u;
  }
LABEL_9:
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v6, "setOutputDeviceUID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_targetSessionID;
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_features;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_routingContextUID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v6 + 37) = self->_enableThrottling;
    *(_BYTE *)(v6 + 40) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v6 + 36) = self->_alwaysAllowUpdates;
  *(_BYTE *)(v6 + 40) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 38) = self->_populatesExternalDevice;
    *(_BYTE *)(v6 + 40) |= 0x10u;
  }
LABEL_7:
  v10 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_targetSessionID;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *routingContextUID;
  NSString *outputDeviceUID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_features != *((_DWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_41;
  }
  routingContextUID = self->_routingContextUID;
  if ((unint64_t)routingContextUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](routingContextUID, "isEqual:"))
      goto LABEL_41;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_41;
    if (self->_enableThrottling)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_41;
    if (self->_alwaysAllowUpdates)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0)
      goto LABEL_41;
    if (self->_populatesExternalDevice)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (!((unint64_t)outputDeviceUID | *((_QWORD *)v4 + 2)))
    goto LABEL_37;
  if (!-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
LABEL_41:
    v8 = 0;
    goto LABEL_42;
  }
  has = (char)self->_has;
LABEL_37:
  v8 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_targetSessionID != *((_DWORD *)v4 + 8))
      goto LABEL_41;
    v8 = 1;
  }
LABEL_42:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_features;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_routingContextUID, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_enableThrottling;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_alwaysAllowUpdates;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_populatesExternalDevice;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_outputDeviceUID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_targetSessionID;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_features = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRDiscoverySessionConfigurationProtobuf setRoutingContextUID:](self, "setRoutingContextUID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_enableThrottling = *((_BYTE *)v4 + 37);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_alwaysAllowUpdates = *((_BYTE *)v4 + 36);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
LABEL_8:
    self->_populatesExternalDevice = *((_BYTE *)v4 + 38);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRDiscoverySessionConfigurationProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_targetSessionID = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)routingContextUID
{
  return self->_routingContextUID;
}

- (void)setRoutingContextUID:(id)a3
{
  objc_storeStrong((id *)&self->_routingContextUID, a3);
}

- (BOOL)enableThrottling
{
  return self->_enableThrottling;
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (unsigned)targetSessionID
{
  return self->_targetSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
