@implementation HKCodableChartBloodPressureDataSourceQueryData

- (BOOL)hasSystolicStatisticsCollection
{
  return self->_systolicStatisticsCollection != 0;
}

- (BOOL)hasDiastolicStatisticsCollection
{
  return self->_diastolicStatisticsCollection != 0;
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
  v8.super_class = (Class)HKCodableChartBloodPressureDataSourceQueryData;
  -[HKCodableChartBloodPressureDataSourceQueryData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartBloodPressureDataSourceQueryData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableStatisticsCollection *systolicStatisticsCollection;
  void *v5;
  HKCodableStatisticsCollection *diastolicStatisticsCollection;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systolicStatisticsCollection = self->_systolicStatisticsCollection;
  if (systolicStatisticsCollection)
  {
    -[HKCodableStatisticsCollection dictionaryRepresentation](systolicStatisticsCollection, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("systolicStatisticsCollection"));

  }
  diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
  if (diastolicStatisticsCollection)
  {
    -[HKCodableStatisticsCollection dictionaryRepresentation](diastolicStatisticsCollection, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("diastolicStatisticsCollection"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartBloodPressureDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_systolicStatisticsCollection)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_diastolicStatisticsCollection)
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
  if (self->_systolicStatisticsCollection)
  {
    objc_msgSend(v4, "setSystolicStatisticsCollection:");
    v4 = v5;
  }
  if (self->_diastolicStatisticsCollection)
  {
    objc_msgSend(v5, "setDiastolicStatisticsCollection:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableStatisticsCollection copyWithZone:](self->_systolicStatisticsCollection, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[HKCodableStatisticsCollection copyWithZone:](self->_diastolicStatisticsCollection, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableStatisticsCollection *systolicStatisticsCollection;
  HKCodableStatisticsCollection *diastolicStatisticsCollection;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((systolicStatisticsCollection = self->_systolicStatisticsCollection,
         !((unint64_t)systolicStatisticsCollection | v4[2]))
     || -[HKCodableStatisticsCollection isEqual:](systolicStatisticsCollection, "isEqual:")))
  {
    diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
    if ((unint64_t)diastolicStatisticsCollection | v4[1])
      v7 = -[HKCodableStatisticsCollection isEqual:](diastolicStatisticsCollection, "isEqual:");
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

  v3 = -[HKCodableStatisticsCollection hash](self->_systolicStatisticsCollection, "hash");
  return -[HKCodableStatisticsCollection hash](self->_diastolicStatisticsCollection, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableStatisticsCollection *systolicStatisticsCollection;
  uint64_t v6;
  HKCodableStatisticsCollection *diastolicStatisticsCollection;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  systolicStatisticsCollection = self->_systolicStatisticsCollection;
  v6 = v4[2];
  v9 = v4;
  if (systolicStatisticsCollection)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableStatisticsCollection mergeFrom:](systolicStatisticsCollection, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableChartBloodPressureDataSourceQueryData setSystolicStatisticsCollection:](self, "setSystolicStatisticsCollection:");
  }
  v4 = v9;
LABEL_7:
  diastolicStatisticsCollection = self->_diastolicStatisticsCollection;
  v8 = v4[1];
  if (diastolicStatisticsCollection)
  {
    if (v8)
    {
      -[HKCodableStatisticsCollection mergeFrom:](diastolicStatisticsCollection, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[HKCodableChartBloodPressureDataSourceQueryData setDiastolicStatisticsCollection:](self, "setDiastolicStatisticsCollection:");
    goto LABEL_12;
  }

}

- (HKCodableStatisticsCollection)systolicStatisticsCollection
{
  return self->_systolicStatisticsCollection;
}

- (void)setSystolicStatisticsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_systolicStatisticsCollection, a3);
}

- (HKCodableStatisticsCollection)diastolicStatisticsCollection
{
  return self->_diastolicStatisticsCollection;
}

- (void)setDiastolicStatisticsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_diastolicStatisticsCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systolicStatisticsCollection, 0);
  objc_storeStrong((id *)&self->_diastolicStatisticsCollection, 0);
}

@end
