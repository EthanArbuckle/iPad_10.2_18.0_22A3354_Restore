@implementation CLPSatelliteReport

- (BOOL)hasGps
{
  return self->_gps != 0;
}

- (BOOL)hasGlonass
{
  return self->_glonass != 0;
}

- (BOOL)hasQzss
{
  return self->_qzss != 0;
}

- (BOOL)hasGalileo
{
  return self->_galileo != 0;
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
  v8.super_class = (Class)CLPSatelliteReport;
  -[CLPSatelliteReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPSatelliteReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPSatelliteInfo *gps;
  void *v5;
  CLPSatelliteInfo *glonass;
  void *v7;
  CLPSatelliteInfo *qzss;
  void *v9;
  CLPSatelliteInfo *galileo;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gps = self->_gps;
  if (gps)
  {
    -[CLPSatelliteInfo dictionaryRepresentation](gps, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("gps"));

  }
  glonass = self->_glonass;
  if (glonass)
  {
    -[CLPSatelliteInfo dictionaryRepresentation](glonass, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("glonass"));

  }
  qzss = self->_qzss;
  if (qzss)
  {
    -[CLPSatelliteInfo dictionaryRepresentation](qzss, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("qzss"));

  }
  galileo = self->_galileo;
  if (galileo)
  {
    -[CLPSatelliteInfo dictionaryRepresentation](galileo, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("galileo"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSatelliteReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_gps)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_glonass)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_qzss)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_galileo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_gps)
  {
    objc_msgSend(v4, "setGps:");
    v4 = v5;
  }
  if (self->_glonass)
  {
    objc_msgSend(v5, "setGlonass:");
    v4 = v5;
  }
  if (self->_qzss)
  {
    objc_msgSend(v5, "setQzss:");
    v4 = v5;
  }
  if (self->_galileo)
  {
    objc_msgSend(v5, "setGalileo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPSatelliteInfo copyWithZone:](self->_gps, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[CLPSatelliteInfo copyWithZone:](self->_glonass, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[CLPSatelliteInfo copyWithZone:](self->_qzss, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[CLPSatelliteInfo copyWithZone:](self->_galileo, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPSatelliteInfo *gps;
  CLPSatelliteInfo *glonass;
  CLPSatelliteInfo *qzss;
  CLPSatelliteInfo *galileo;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((gps = self->_gps, !((unint64_t)gps | v4[3])) || -[CLPSatelliteInfo isEqual:](gps, "isEqual:"))
    && ((glonass = self->_glonass, !((unint64_t)glonass | v4[2]))
     || -[CLPSatelliteInfo isEqual:](glonass, "isEqual:"))
    && ((qzss = self->_qzss, !((unint64_t)qzss | v4[4])) || -[CLPSatelliteInfo isEqual:](qzss, "isEqual:")))
  {
    galileo = self->_galileo;
    if ((unint64_t)galileo | v4[1])
      v9 = -[CLPSatelliteInfo isEqual:](galileo, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[CLPSatelliteInfo hash](self->_gps, "hash");
  v4 = -[CLPSatelliteInfo hash](self->_glonass, "hash") ^ v3;
  v5 = -[CLPSatelliteInfo hash](self->_qzss, "hash");
  return v4 ^ v5 ^ -[CLPSatelliteInfo hash](self->_galileo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CLPSatelliteInfo *gps;
  uint64_t v6;
  CLPSatelliteInfo *glonass;
  uint64_t v8;
  CLPSatelliteInfo *qzss;
  uint64_t v10;
  CLPSatelliteInfo *galileo;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  gps = self->_gps;
  v6 = v4[3];
  v13 = v4;
  if (gps)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPSatelliteInfo mergeFrom:](gps, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPSatelliteReport setGps:](self, "setGps:");
  }
  v4 = v13;
LABEL_7:
  glonass = self->_glonass;
  v8 = v4[2];
  if (glonass)
  {
    if (!v8)
      goto LABEL_13;
    -[CLPSatelliteInfo mergeFrom:](glonass, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[CLPSatelliteReport setGlonass:](self, "setGlonass:");
  }
  v4 = v13;
LABEL_13:
  qzss = self->_qzss;
  v10 = v4[4];
  if (qzss)
  {
    if (!v10)
      goto LABEL_19;
    -[CLPSatelliteInfo mergeFrom:](qzss, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[CLPSatelliteReport setQzss:](self, "setQzss:");
  }
  v4 = v13;
LABEL_19:
  galileo = self->_galileo;
  v12 = v4[1];
  if (galileo)
  {
    if (v12)
    {
      -[CLPSatelliteInfo mergeFrom:](galileo, "mergeFrom:");
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[CLPSatelliteReport setGalileo:](self, "setGalileo:");
    goto LABEL_24;
  }

}

- (CLPSatelliteInfo)gps
{
  return self->_gps;
}

- (void)setGps:(id)a3
{
  objc_storeStrong((id *)&self->_gps, a3);
}

- (CLPSatelliteInfo)glonass
{
  return self->_glonass;
}

- (void)setGlonass:(id)a3
{
  objc_storeStrong((id *)&self->_glonass, a3);
}

- (CLPSatelliteInfo)qzss
{
  return self->_qzss;
}

- (void)setQzss:(id)a3
{
  objc_storeStrong((id *)&self->_qzss, a3);
}

- (CLPSatelliteInfo)galileo
{
  return self->_galileo;
}

- (void)setGalileo:(id)a3
{
  objc_storeStrong((id *)&self->_galileo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qzss, 0);
  objc_storeStrong((id *)&self->_gps, 0);
  objc_storeStrong((id *)&self->_glonass, 0);
  objc_storeStrong((id *)&self->_galileo, 0);
}

@end
