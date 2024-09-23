@implementation HDCodableMedicationChartSeries

- (BOOL)hasMonthData
{
  return self->_monthData != 0;
}

- (BOOL)hasSixMonthsData
{
  return self->_sixMonthsData != 0;
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
  v8.super_class = (Class)HDCodableMedicationChartSeries;
  -[HDCodableMedicationChartSeries description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationChartSeries dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *monthData;
  NSData *sixMonthsData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  monthData = self->_monthData;
  if (monthData)
    objc_msgSend(v3, "setObject:forKey:", monthData, CFSTR("monthData"));
  sixMonthsData = self->_sixMonthsData;
  if (sixMonthsData)
    objc_msgSend(v4, "setObject:forKey:", sixMonthsData, CFSTR("sixMonthsData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationChartSeriesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_monthData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_sixMonthsData)
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
  if (self->_monthData)
  {
    objc_msgSend(v4, "setMonthData:");
    v4 = v5;
  }
  if (self->_sixMonthsData)
  {
    objc_msgSend(v5, "setSixMonthsData:");
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
  v6 = -[NSData copyWithZone:](self->_monthData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_sixMonthsData, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *monthData;
  NSData *sixMonthsData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((monthData = self->_monthData, !((unint64_t)monthData | v4[1]))
     || -[NSData isEqual:](monthData, "isEqual:")))
  {
    sixMonthsData = self->_sixMonthsData;
    if ((unint64_t)sixMonthsData | v4[2])
      v7 = -[NSData isEqual:](sixMonthsData, "isEqual:");
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

  v3 = -[NSData hash](self->_monthData, "hash");
  return -[NSData hash](self->_sixMonthsData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[HDCodableMedicationChartSeries setMonthData:](self, "setMonthData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[HDCodableMedicationChartSeries setSixMonthsData:](self, "setSixMonthsData:");
    v4 = v5;
  }

}

- (NSData)monthData
{
  return self->_monthData;
}

- (void)setMonthData:(id)a3
{
  objc_storeStrong((id *)&self->_monthData, a3);
}

- (NSData)sixMonthsData
{
  return self->_sixMonthsData;
}

- (void)setSixMonthsData:(id)a3
{
  objc_storeStrong((id *)&self->_sixMonthsData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixMonthsData, 0);
  objc_storeStrong((id *)&self->_monthData, 0);
}

@end
