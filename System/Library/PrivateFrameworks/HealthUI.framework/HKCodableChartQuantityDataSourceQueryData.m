@implementation HKCodableChartQuantityDataSourceQueryData

- (BOOL)readFrom:(id)a3
{
  return HKCodableChartQuantityDataSourceQueryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (HKCodableStatisticsCollection)statisticsCollection
{
  return self->_statisticsCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsCollection, 0);
}

- (BOOL)hasStatisticsCollection
{
  return self->_statisticsCollection != 0;
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
  v8.super_class = (Class)HKCodableChartQuantityDataSourceQueryData;
  -[HKCodableChartQuantityDataSourceQueryData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartQuantityDataSourceQueryData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableStatisticsCollection *statisticsCollection;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  statisticsCollection = self->_statisticsCollection;
  if (statisticsCollection)
  {
    -[HKCodableStatisticsCollection dictionaryRepresentation](statisticsCollection, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("statisticsCollection"));

  }
  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_statisticsCollection)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  HKCodableStatisticsCollection *statisticsCollection;

  statisticsCollection = self->_statisticsCollection;
  if (statisticsCollection)
    objc_msgSend(a3, "setStatisticsCollection:", statisticsCollection);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableStatisticsCollection copyWithZone:](self->_statisticsCollection, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKCodableStatisticsCollection *statisticsCollection;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    statisticsCollection = self->_statisticsCollection;
    if ((unint64_t)statisticsCollection | v4[1])
      v6 = -[HKCodableStatisticsCollection isEqual:](statisticsCollection, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[HKCodableStatisticsCollection hash](self->_statisticsCollection, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableStatisticsCollection *statisticsCollection;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  statisticsCollection = self->_statisticsCollection;
  v6 = v4[1];
  if (statisticsCollection)
  {
    if (v6)
    {
      v7 = v4;
      -[HKCodableStatisticsCollection mergeFrom:](statisticsCollection, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[HKCodableChartQuantityDataSourceQueryData setStatisticsCollection:](self, "setStatisticsCollection:");
    goto LABEL_6;
  }

}

- (void)setStatisticsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsCollection, a3);
}

@end
