@implementation VCCallInfoBlob

- (id)stringForCheckpoint
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](self, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(": "), CFSTR("=")), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_1E9E58EE0);
  return (id)objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(", $"), &stru_1E9E58EE0, 1024, 0, objc_msgSend(v2, "length"));
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCallInfoBlob setDeviceType:](self, "setDeviceType:", 0);
  -[VCCallInfoBlob setFrameworkVersion:](self, "setFrameworkVersion:", 0);
  -[VCCallInfoBlob setOsVersion:](self, "setOsVersion:", 0);
  -[VCCallInfoBlob setDeviceName:](self, "setDeviceName:", 0);
  -[VCCallInfoBlob setAudioDeviceUID:](self, "setAudioDeviceUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfoBlob;
  -[VCCallInfoBlob dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasAudioDeviceUID
{
  return self->_audioDeviceUID != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfoBlob;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCCallInfoBlob description](&v3, sel_description), -[VCCallInfoBlob dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *deviceType;
  NSString *frameworkVersion;
  NSString *osVersion;
  NSString *deviceName;
  NSString *audioDeviceUID;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_callID), CFSTR("callID"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_clientVersion), CFSTR("clientVersion"));
  deviceType = self->_deviceType;
  if (deviceType)
    objc_msgSend(v3, "setObject:forKey:", deviceType, CFSTR("deviceType"));
  frameworkVersion = self->_frameworkVersion;
  if (frameworkVersion)
    objc_msgSend(v3, "setObject:forKey:", frameworkVersion, CFSTR("frameworkVersion"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v3, "setObject:forKey:", osVersion, CFSTR("osVersion"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  audioDeviceUID = self->_audioDeviceUID;
  if (audioDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", audioDeviceUID, CFSTR("audioDeviceUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCallInfoBlobReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_deviceName)
    PBDataWriterWriteStringField();
  if (self->_audioDeviceUID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_callID;
  *((_DWORD *)a3 + 5) = self->_clientVersion;
  objc_msgSend(a3, "setDeviceType:", self->_deviceType);
  objc_msgSend(a3, "setFrameworkVersion:", self->_frameworkVersion);
  objc_msgSend(a3, "setOsVersion:", self->_osVersion);
  if (self->_deviceName)
    objc_msgSend(a3, "setDeviceName:");
  if (self->_audioDeviceUID)
    objc_msgSend(a3, "setAudioDeviceUID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_callID;
  *(_DWORD *)(v5 + 20) = self->_clientVersion;

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_deviceType, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_frameworkVersion, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_audioDeviceUID, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *deviceType;
  NSString *frameworkVersion;
  NSString *osVersion;
  NSString *deviceName;
  NSString *audioDeviceUID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_callID == *((_DWORD *)a3 + 4) && self->_clientVersion == *((_DWORD *)a3 + 5))
    {
      deviceType = self->_deviceType;
      if (!((unint64_t)deviceType | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](deviceType, "isEqual:")) != 0)
      {
        frameworkVersion = self->_frameworkVersion;
        if (!((unint64_t)frameworkVersion | *((_QWORD *)a3 + 5))
          || (v5 = -[NSString isEqual:](frameworkVersion, "isEqual:")) != 0)
        {
          osVersion = self->_osVersion;
          if (!((unint64_t)osVersion | *((_QWORD *)a3 + 6))
            || (v5 = -[NSString isEqual:](osVersion, "isEqual:")) != 0)
          {
            deviceName = self->_deviceName;
            if (!((unint64_t)deviceName | *((_QWORD *)a3 + 3))
              || (v5 = -[NSString isEqual:](deviceName, "isEqual:")) != 0)
            {
              audioDeviceUID = self->_audioDeviceUID;
              if ((unint64_t)audioDeviceUID | *((_QWORD *)a3 + 1))
                LOBYTE(v5) = -[NSString isEqual:](audioDeviceUID, "isEqual:");
              else
                LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = (2654435761 * self->_clientVersion) ^ (2654435761 * self->_callID);
  v4 = -[NSString hash](self->_deviceType, "hash");
  v5 = v4 ^ -[NSString hash](self->_frameworkVersion, "hash");
  v6 = v5 ^ -[NSString hash](self->_osVersion, "hash");
  v7 = v6 ^ -[NSString hash](self->_deviceName, "hash");
  return v3 ^ v7 ^ -[NSString hash](self->_audioDeviceUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_callID = *((_DWORD *)a3 + 4);
  self->_clientVersion = *((_DWORD *)a3 + 5);
  if (*((_QWORD *)a3 + 4))
    -[VCCallInfoBlob setDeviceType:](self, "setDeviceType:");
  if (*((_QWORD *)a3 + 5))
    -[VCCallInfoBlob setFrameworkVersion:](self, "setFrameworkVersion:");
  if (*((_QWORD *)a3 + 6))
    -[VCCallInfoBlob setOsVersion:](self, "setOsVersion:");
  if (*((_QWORD *)a3 + 3))
    -[VCCallInfoBlob setDeviceName:](self, "setDeviceName:");
  if (*((_QWORD *)a3 + 1))
    -[VCCallInfoBlob setAudioDeviceUID:](self, "setAudioDeviceUID:");
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (unsigned)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(unsigned int)a3
{
  self->_clientVersion = a3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)frameworkVersion
{
  return self->_frameworkVersion;
}

- (void)setFrameworkVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)audioDeviceUID
{
  return self->_audioDeviceUID;
}

- (void)setAudioDeviceUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
