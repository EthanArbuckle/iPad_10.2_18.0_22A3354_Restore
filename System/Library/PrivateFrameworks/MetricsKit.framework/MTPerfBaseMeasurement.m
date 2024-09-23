@implementation MTPerfBaseMeasurement

- (void)addFields:(id)a3
{
  id v4;
  MTPerfBaseMeasurement *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  id v11;
  id *v12;
  uint64_t v13;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTPerfBaseMeasurement getAdditionalData](v5, "getAdditionalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)&v13;
  v7 = v4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "addObjectsFromArray:", v9);
      else
        objc_msgSend(v6, "addObject:", v9);
      v10 = v12++;
      v11 = *v10;

      v9 = v11;
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

- (id)getAdditionalData
{
  NSMutableArray *additionalData;
  NSMutableArray *v4;
  NSMutableArray *v5;

  additionalData = self->_additionalData;
  if (!additionalData)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_additionalData;
    self->_additionalData = v4;

    additionalData = self->_additionalData;
  }
  return additionalData;
}

- (id)record
{
  void *v2;
  void *v3;

  -[MTPerfBaseMeasurement metricsData](self, "metricsData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricsData
{
  void *v3;
  void *v4;

  -[MTPerfBaseMeasurement measurementTransformer](self, "measurementTransformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metricsDataWithPerfMeasurement:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAnonymous:", 1);
  return v4;
}

- (MTPerfBaseMeasurementTransformation)measurementTransformer
{
  return (MTPerfBaseMeasurementTransformation *)objc_loadWeakRetained((id *)&self->_measurementTransformer);
}

- (MTPerfBaseMeasurement)initWithMeasurementTransformer:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;
  MTPerfBaseMeasurement *v8;
  MTPerfBaseMeasurement *v9;
  uint64_t v10;
  NSArray *eventData;
  uint64_t v12;
  NSMutableDictionary *timestamps;
  uint64_t v14;
  NSMutableDictionary *measurementSpecificData;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MTPerfBaseMeasurement;
  v8 = -[MTPerfBaseMeasurement init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_measurementTransformer, v6);
    objc_msgSend(v7, "mt_deepCopy");
    v10 = objc_claimAutoreleasedReturnValue();
    eventData = v9->_eventData;
    v9->_eventData = (NSArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    timestamps = v9->_timestamps;
    v9->_timestamps = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    measurementSpecificData = v9->_measurementSpecificData;
    v9->_measurementSpecificData = (NSMutableDictionary *)v14;

  }
  return v9;
}

- (NSArray)eventData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_eventData, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", self->_eventData);
  -[MTPerfBaseMeasurement timestamps](self, "timestamps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[MTPerfBaseMeasurement timestamps](self, "timestamps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "addObject:", v7);

  }
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v12;
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (NSArray)additionalFields
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_additionalData, "copy");
}

- (NSMutableDictionary)measurementSpecificData
{
  return self->_measurementSpecificData;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_measurementTransformer);
  objc_storeStrong((id *)&self->_measurementSpecificData, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
}

- (void)addFieldsWithDictionary:(id)a3
{
  -[MTPerfBaseMeasurement addFields:](self, "addFields:", a3, 0);
}

- (void)addFieldsWithPromise:(id)a3
{
  -[MTPerfBaseMeasurement addFields:](self, "addFields:", a3, 0);
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (void)setMeasurementSpecificData:(id)a3
{
  objc_storeStrong((id *)&self->_measurementSpecificData, a3);
}

- (void)setMeasurementTransformer:(id)a3
{
  objc_storeWeak((id *)&self->_measurementTransformer, a3);
}

@end
