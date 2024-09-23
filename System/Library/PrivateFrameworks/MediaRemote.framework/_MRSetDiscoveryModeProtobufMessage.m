@implementation _MRSetDiscoveryModeProtobufMessage

- (int)mode
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_mode;
  else
    return 0;
}

- (void)setMode:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E30CAC38[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Presence")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InfraOnly")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Detailed")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
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
  v8.super_class = (Class)_MRSetDiscoveryModeProtobufMessage;
  -[_MRSetDiscoveryModeProtobufMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetDiscoveryModeProtobufMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t mode;
  __CFString *v6;
  int features;
  __CFString *v8;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    mode = self->_mode;
    if (mode >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mode);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E30CAC38[mode];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mode"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    features = self->_features;
    v8 = CFSTR("None");
    switch(features)
    {
      case 0:
        break;
      case 1:
        v8 = CFSTR("Audio");
        break;
      case 2:
        v8 = CFSTR("Screen");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_11;
      case 4:
        v8 = CFSTR("Video");
        break;
      case 8:
        v8 = CFSTR("RemoteControl");
        break;
      default:
        if (features == 256)
        {
          v8 = CFSTR("Companion");
        }
        else
        {
LABEL_11:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_features);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("features"));

  }
  configuration = self->_configuration;
  if (configuration)
  {
    -[_MRDiscoverySessionConfigurationProtobuf dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("configuration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetDiscoveryModeProtobufMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_configuration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_mode;
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = self->_features;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_configuration)
  {
    v6 = v4;
    objc_msgSend(v4, "setConfiguration:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_mode;
    *(_BYTE *)(v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_features;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v8 = -[_MRDiscoverySessionConfigurationProtobuf copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_mode != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_features != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((_QWORD *)v4 + 1))
    v6 = -[_MRDiscoverySessionConfigurationProtobuf isEqual:](configuration, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_mode;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[_MRDiscoverySessionConfigurationProtobuf hash](self->_configuration, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_features;
  return v3 ^ v2 ^ -[_MRDiscoverySessionConfigurationProtobuf hash](self->_configuration, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  _MRDiscoverySessionConfigurationProtobuf *configuration;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_mode = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 24);
  }
  if ((v6 & 1) != 0)
  {
    self->_features = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  configuration = self->_configuration;
  v8 = v5[1];
  if (configuration)
  {
    if (v8)
    {
      v9 = v5;
      -[_MRDiscoverySessionConfigurationProtobuf mergeFrom:](configuration, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[_MRSetDiscoveryModeProtobufMessage setConfiguration:](self, "setConfiguration:");
    goto LABEL_10;
  }

}

- (_MRDiscoverySessionConfigurationProtobuf)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
