@implementation HKQuantityTypeDataSourceValue

- (void)setBaselineRelativeValueState:(id)a3
{
  HKQuantity *minQuantity;
  HKQuantity *maxQuantity;
  HKQuantity *averageQuantity;
  void *v8;
  void *v9;
  HKQuantity *v10;
  HKQuantity *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_baselineRelativeValueState, a3);
  if (v12)
  {
    minQuantity = self->_minQuantity;
    if (minQuantity)
    {
      self->_minQuantity = 0;

    }
    maxQuantity = self->_maxQuantity;
    if (maxQuantity)
    {
      self->_maxQuantity = 0;

    }
    if (objc_msgSend(v12, "integerValue") != 3)
    {
      averageQuantity = self->_averageQuantity;
      if (averageQuantity)
      {
        v8 = (void *)MEMORY[0x1E0CB6A28];
        -[HKQuantity _unit](averageQuantity, "_unit");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, 0.0);
        v10 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
        v11 = self->_averageQuantity;
        self->_averageQuantity = v10;

      }
    }
  }

}

- (id)minYValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity _value](self->_minQuantity, "_value");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)maxYValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity _value](self->_maxQuantity, "_value");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (HKQuantity)sumQuantity
{
  return self->_sumQuantity;
}

- (void)setSumQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_sumQuantity, a3);
}

- (HKQuantity)minQuantity
{
  return self->_minQuantity;
}

- (void)setMinQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_minQuantity, a3);
}

- (HKQuantity)maxQuantity
{
  return self->_maxQuantity;
}

- (void)setMaxQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_maxQuantity, a3);
}

- (HKQuantity)averageQuantity
{
  return self->_averageQuantity;
}

- (void)setAverageQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_averageQuantity, a3);
}

- (HKQuantity)durationQuantity
{
  return self->_durationQuantity;
}

- (void)setDurationQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_durationQuantity, a3);
}

- (HKQuantity)mostRecentQuantity
{
  return self->_mostRecentQuantity;
}

- (void)setMostRecentQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentQuantity, a3);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
  objc_storeStrong((id *)&self->_quantityType, a3);
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (NSNumber)baselineRelativeValueState
{
  return self->_baselineRelativeValueState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_baselineRelativeValueState, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_durationQuantity, 0);
  objc_storeStrong((id *)&self->_averageQuantity, 0);
  objc_storeStrong((id *)&self->_maxQuantity, 0);
  objc_storeStrong((id *)&self->_minQuantity, 0);
  objc_storeStrong((id *)&self->_sumQuantity, 0);
}

+ (id)quantityTypeDataSourceValueWithCodableStatistics:(id)a3 sourceTimeZone:(id)a4
{
  id v5;
  id v6;
  HKQuantityTypeDataSourceValue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    if (objc_msgSend(v5, "hasDataType"))
    {
      objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", objc_msgSend(v5, "dataType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setQuantityType:](v7, "setQuantityType:", v8);

    }
    if (objc_msgSend(v5, "hasStartDate"))
    {
      objc_msgSend(v5, "startDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_dateFromSourceTimeZone:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setStartDate:](v7, "setStartDate:", v10);

    }
    if (objc_msgSend(v5, "hasEndDate"))
    {
      objc_msgSend(v5, "endDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_dateFromSourceTimeZone:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setEndDate:](v7, "setEndDate:", v12);

    }
    if (objc_msgSend(v5, "hasAverageQuantity"))
    {
      v13 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "averageQuantity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createWithCodableQuantity:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setAverageQuantity:](v7, "setAverageQuantity:", v15);

    }
    if (objc_msgSend(v5, "hasMinQuantity"))
    {
      v16 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "minQuantity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "createWithCodableQuantity:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setMinQuantity:](v7, "setMinQuantity:", v18);

    }
    if (objc_msgSend(v5, "hasMaxQuantity"))
    {
      v19 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "maxQuantity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createWithCodableQuantity:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setMaxQuantity:](v7, "setMaxQuantity:", v21);

    }
    if (objc_msgSend(v5, "hasMostRecentQuantity"))
    {
      v22 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "mostRecentQuantity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "createWithCodableQuantity:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setMostRecentQuantity:](v7, "setMostRecentQuantity:", v24);

    }
    if (objc_msgSend(v5, "hasSumQuantity"))
    {
      v25 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "sumQuantity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "createWithCodableQuantity:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setSumQuantity:](v7, "setSumQuantity:", v27);

    }
    if (objc_msgSend(v5, "hasDurationQuantity"))
    {
      v28 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v5, "durationQuantity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "createWithCodableQuantity:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setDurationQuantity:](v7, "setDurationQuantity:", v30);

    }
    if (objc_msgSend(v5, "hasDataCount"))
      -[HKQuantityTypeDataSourceValue setRecordCount:](v7, "setRecordCount:", objc_msgSend(v5, "dataCount"));
    if (objc_msgSend(v5, "hasStatisticsInterval"))
    {
      v31 = (void *)MEMORY[0x1E0C99D78];
      objc_msgSend(v5, "statisticsInterval");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hkui_dateComponentsWithCodableDateComponents:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setStatisticsInterval:](v7, "setStatisticsInterval:", v33);

    }
    if (objc_msgSend(v5, "hasBaselineRelativeValueState"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "baselineRelativeValueState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setBaselineRelativeValueState:](v7, "setBaselineRelativeValueState:", v34);

    }
    if (objc_msgSend(v5, "hasMetadata"))
    {
      v35 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v5, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dictionaryWithCodableMetadata:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKQuantityTypeDataSourceValue setMetadata:](v7, "setMetadata:", v37);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)codableStatistics
{
  HKCodableStatistics *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HKCodableMetadataDictionary *v24;
  void *v25;
  _QWORD v27[4];
  HKCodableStatistics *v28;

  v3 = objc_alloc_init(HKCodableStatistics);
  -[HKQuantityTypeDataSourceValue quantityType](self, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setDataType:](v3, "setDataType:", objc_msgSend(v4, "code"));

  -[HKQuantityTypeDataSourceValue startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[HKCodableStatistics setStartDate:](v3, "setStartDate:");

  -[HKQuantityTypeDataSourceValue endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[HKCodableStatistics setEndDate:](v3, "setEndDate:");

  -[HKQuantityTypeDataSourceValue averageQuantity](self, "averageQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setAverageQuantity:](v3, "setAverageQuantity:", v8);

  -[HKQuantityTypeDataSourceValue minQuantity](self, "minQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMinQuantity:](v3, "setMinQuantity:", v10);

  -[HKQuantityTypeDataSourceValue maxQuantity](self, "maxQuantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "codableRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMaxQuantity:](v3, "setMaxQuantity:", v12);

  -[HKQuantityTypeDataSourceValue mostRecentQuantity](self, "mostRecentQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "codableRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMostRecentQuantity:](v3, "setMostRecentQuantity:", v14);

  -[HKQuantityTypeDataSourceValue sumQuantity](self, "sumQuantity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "codableRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setSumQuantity:](v3, "setSumQuantity:", v16);

  -[HKQuantityTypeDataSourceValue durationQuantity](self, "durationQuantity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "codableRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setDurationQuantity:](v3, "setDurationQuantity:", v18);

  -[HKCodableStatistics setDataCount:](v3, "setDataCount:", -[HKQuantityTypeDataSourceValue recordCount](self, "recordCount"));
  -[HKQuantityTypeDataSourceValue statisticsInterval](self, "statisticsInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hkui_codableDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setStatisticsInterval:](v3, "setStatisticsInterval:", v20);

  -[HKQuantityTypeDataSourceValue baselineRelativeValueState](self, "baselineRelativeValueState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
    -[HKCodableStatistics setBaselineRelativeValueState:](v3, "setBaselineRelativeValueState:", objc_msgSend(v21, "integerValue"));
  -[HKQuantityTypeDataSourceValue metadata](self, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc_init(HKCodableMetadataDictionary);
    -[HKCodableStatistics setMetadata:](v3, "setMetadata:", v24);

    -[HKQuantityTypeDataSourceValue metadata](self, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__HKQuantityTypeDataSourceValue_HKCodingSupport__codableStatistics__block_invoke;
    v27[3] = &unk_1E9C47568;
    v28 = v3;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v27);

  }
  return v3;
}

void __67__HKQuantityTypeDataSourceValue_HKCodingSupport__codableStatistics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HKCodableMetadataKeyValuePair *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HKCodableMetadataKeyValuePair);
  -[HKCodableMetadataKeyValuePair setKey:](v6, "setKey:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKCodableMetadataKeyValuePair setStringValue:](v6, "setStringValue:", v8);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addKeyValuePairs:", v6);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKCodableMetadataKeyValuePair setNumberIntValue:](v6, "setNumberIntValue:", (int)objc_msgSend(v8, "intValue"));
    goto LABEL_5;
  }
LABEL_6:

}

@end
