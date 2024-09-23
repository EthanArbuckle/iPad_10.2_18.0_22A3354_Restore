@implementation CLPPressureCollectionRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPPressureCollectionRequest;
  -[CLPPressureCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPressureCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  CLPMeta *meta;
  void *v5;
  CLPPressure *pressure;
  void *v7;
  CLPLocation *pressureLocation;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  meta = self->_meta;
  if (meta)
  {
    -[CLPMeta dictionaryRepresentation](meta, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("meta"));

  }
  pressure = self->_pressure;
  if (pressure)
  {
    -[CLPPressure dictionaryRepresentation](pressure, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("pressure"));

  }
  pressureLocation = self->_pressureLocation;
  if (pressureLocation)
  {
    -[CLPLocation dictionaryRepresentation](pressureLocation, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("pressureLocation"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPressureCollectionRequestReadFrom((id *)&self->super.super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_meta)
    -[CLPPressureCollectionRequest writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_pressure)
    -[CLPPressureCollectionRequest writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if (!self->_pressureLocation)
    -[CLPPressureCollectionRequest writeTo:].cold.3();
  PBDataWriterWriteSubmessage();

}

- (unsigned)requestTypeCode
{
  return 106;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  CLPMeta *meta;
  id v5;

  meta = self->_meta;
  v5 = a3;
  objc_msgSend(v5, "setMeta:", meta);
  objc_msgSend(v5, "setPressure:", self->_pressure);
  objc_msgSend(v5, "setPressureLocation:", self->_pressureLocation);

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[CLPMeta copyWithZone:](self->_meta, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[CLPPressure copyWithZone:](self->_pressure, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[CLPLocation copyWithZone:](self->_pressureLocation, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  CLPMeta *meta;
  CLPPressure *pressure;
  CLPLocation *pressureLocation;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((meta = self->_meta, !((unint64_t)meta | v4[1])) || -[CLPMeta isEqual:](meta, "isEqual:"))
    && ((pressure = self->_pressure, !((unint64_t)pressure | v4[2]))
     || -[CLPPressure isEqual:](pressure, "isEqual:")))
  {
    pressureLocation = self->_pressureLocation;
    if ((unint64_t)pressureLocation | v4[3])
      v8 = -[CLPLocation isEqual:](pressureLocation, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[CLPMeta hash](self->_meta, "hash");
  v4 = -[CLPPressure hash](self->_pressure, "hash") ^ v3;
  return v4 ^ -[CLPLocation hash](self->_pressureLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CLPMeta *meta;
  uint64_t v6;
  CLPPressure *pressure;
  uint64_t v8;
  CLPLocation *pressureLocation;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  meta = self->_meta;
  v6 = v4[1];
  v11 = v4;
  if (meta)
  {
    if (!v6)
      goto LABEL_7;
    -[CLPMeta mergeFrom:](meta, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[CLPPressureCollectionRequest setMeta:](self, "setMeta:");
  }
  v4 = v11;
LABEL_7:
  pressure = self->_pressure;
  v8 = v4[2];
  if (pressure)
  {
    if (!v8)
      goto LABEL_13;
    -[CLPPressure mergeFrom:](pressure, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[CLPPressureCollectionRequest setPressure:](self, "setPressure:");
  }
  v4 = v11;
LABEL_13:
  pressureLocation = self->_pressureLocation;
  v10 = v4[3];
  if (pressureLocation)
  {
    if (v10)
    {
      -[CLPLocation mergeFrom:](pressureLocation, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[CLPPressureCollectionRequest setPressureLocation:](self, "setPressureLocation:");
    goto LABEL_18;
  }

}

- (CLPMeta)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (CLPPressure)pressure
{
  return self->_pressure;
}

- (void)setPressure:(id)a3
{
  objc_storeStrong((id *)&self->_pressure, a3);
}

- (CLPLocation)pressureLocation
{
  return self->_pressureLocation;
}

- (void)setPressureLocation:(id)a3
{
  objc_storeStrong((id *)&self->_pressureLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressureLocation, 0);
  objc_storeStrong((id *)&self->_pressure, 0);
  objc_storeStrong((id *)&self->_meta, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31832, "self->_meta != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31837, "self->_pressure != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[CLPPressureCollectionRequest writeTo:]", "CLPCollectionRequest.gen.m", 31842, "self->_pressureLocation != nil");
}

@end
