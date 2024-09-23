@implementation HMAccessoryInfoProtoAirportInfoEvent

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (BOOL)hasBssid
{
  return self->_bssid != 0;
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
  v8.super_class = (Class)HMAccessoryInfoProtoAirportInfoEvent;
  -[HMAccessoryInfoProtoAirportInfoEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryInfoProtoAirportInfoEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *ssid;
  NSData *bssid;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  ssid = self->_ssid;
  if (ssid)
    objc_msgSend(v3, "setObject:forKey:", ssid, CFSTR("ssid"));
  bssid = self->_bssid;
  if (bssid)
    objc_msgSend(v4, "setObject:forKey:", bssid, CFSTR("bssid"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoAirportInfoEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ssid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_bssid)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ssid)
  {
    objc_msgSend(v4, "setSsid:");
    v4 = v5;
  }
  if (self->_bssid)
  {
    objc_msgSend(v5, "setBssid:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_ssid, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_bssid, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *ssid;
  NSData *bssid;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ssid = self->_ssid, !((unint64_t)ssid | v4[2])) || -[NSData isEqual:](ssid, "isEqual:")))
  {
    bssid = self->_bssid;
    if ((unint64_t)bssid | v4[1])
      v7 = -[NSData isEqual:](bssid, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_ssid, "hash");
  return -[NSData hash](self->_bssid, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[HMAccessoryInfoProtoAirportInfoEvent setSsid:](self, "setSsid:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[HMAccessoryInfoProtoAirportInfoEvent setBssid:](self, "setBssid:");
    v4 = v5;
  }

}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (NSData)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_storeStrong((id *)&self->_bssid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
}

@end
