@implementation GEOLogMsgEventWifiConnectionQualityProbe

- (BOOL)hasWifiConnectionQuality
{
  return self->_wifiConnectionQuality != 0;
}

- (GEOWiFiConnectionQuality)wifiConnectionQuality
{
  return self->_wifiConnectionQuality;
}

- (void)setWifiConnectionQuality:(id)a3
{
  objc_storeStrong((id *)&self->_wifiConnectionQuality, a3);
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
  v8.super_class = (Class)GEOLogMsgEventWifiConnectionQualityProbe;
  -[GEOLogMsgEventWifiConnectionQualityProbe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventWifiConnectionQualityProbe dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventWifiConnectionQualityProbe _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "wifiConnectionQuality");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("wifiConnectionQuality");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("wifi_connection_quality");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventWifiConnectionQualityProbe _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventWifiConnectionQualityProbe)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventWifiConnectionQualityProbe *)-[GEOLogMsgEventWifiConnectionQualityProbe _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOWiFiConnectionQuality *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("wifiConnectionQuality");
      else
        v6 = CFSTR("wifi_connection_quality");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOWiFiConnectionQuality alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOWiFiConnectionQuality initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOWiFiConnectionQuality initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setWifiConnectionQuality:", v9);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventWifiConnectionQualityProbe)initWithJSON:(id)a3
{
  return (GEOLogMsgEventWifiConnectionQualityProbe *)-[GEOLogMsgEventWifiConnectionQualityProbe _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventWifiConnectionQualityProbeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventWifiConnectionQualityProbeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_wifiConnectionQuality)
    PBDataWriterWriteSubmessage();
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgEventWifiConnectionQualityProbeClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOWiFiConnectionQuality hasGreenTeaWithValue:](self->_wifiConnectionQuality, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventWifiConnectionQualityProbe readAll:](self, "readAll:", 0);
  if (self->_wifiConnectionQuality)
    objc_msgSend(v4, "setWifiConnectionQuality:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOWiFiConnectionQuality copyWithZone:](self->_wifiConnectionQuality, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOWiFiConnectionQuality *wifiConnectionQuality;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgEventWifiConnectionQualityProbe readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    wifiConnectionQuality = self->_wifiConnectionQuality;
    if ((unint64_t)wifiConnectionQuality | v4[1])
      v5 = -[GEOWiFiConnectionQuality isEqual:](wifiConnectionQuality, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgEventWifiConnectionQualityProbe readAll:](self, "readAll:", 1);
  return -[GEOWiFiConnectionQuality hash](self->_wifiConnectionQuality, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOWiFiConnectionQuality *wifiConnectionQuality;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  wifiConnectionQuality = self->_wifiConnectionQuality;
  v6 = v4[1];

  if (wifiConnectionQuality)
  {
    if (v6)
      -[GEOWiFiConnectionQuality mergeFrom:](wifiConnectionQuality, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOLogMsgEventWifiConnectionQualityProbe setWifiConnectionQuality:](self, "setWifiConnectionQuality:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiConnectionQuality, 0);
}

@end
