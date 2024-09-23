@implementation HDCodableWorkoutZones

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableWorkoutZones sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    -[HDCodableWorkoutZones zones](self, "zones");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v7, "unarchivedArrayOfObjectsOfClass:fromData:error:", v8, v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;

    v12 = v10 != 0;
    if (v10)
    {
      objc_msgSend(v4, "_setZones:", v10);
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Error unarchiving zones: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasZones
{
  return self->_zones != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutZones;
  -[HDCodableWorkoutZones description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutZones dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  NSData *zones;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  zones = self->_zones;
  if (zones)
    objc_msgSend(v3, "setObject:forKey:", zones, CFSTR("zones"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutZonesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_zones)
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
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v5;
  }
  if (self->_zones)
  {
    objc_msgSend(v5, "setZones:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_zones, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  NSData *zones;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sample = self->_sample, !((unint64_t)sample | v4[1])) || -[HDCodableSample isEqual:](sample, "isEqual:")))
  {
    zones = self->_zones;
    if ((unint64_t)zones | v4[2])
      v7 = -[NSData isEqual:](zones, "isEqual:");
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
  unint64_t v3;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  return -[NSData hash](self->_zones, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableSample *sample;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  sample = self->_sample;
  v6 = v4[1];
  v7 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableWorkoutZones setSample:](self, "setSample:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[HDCodableWorkoutZones setZones:](self, "setZones:");
    v4 = v7;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (NSData)zones
{
  return self->_zones;
}

- (void)setZones:(id)a3
{
  objc_storeStrong((id *)&self->_zones, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
