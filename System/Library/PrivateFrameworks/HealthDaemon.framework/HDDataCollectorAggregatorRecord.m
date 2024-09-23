@implementation HDDataCollectorAggregatorRecord

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HDDataCollectorAggregatorRecord;
  -[HDDataCollectorAggregatorRecord description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_hasSetLastSensorDatum)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: aggregator: %@, identifier: %@, configuration: %@, hasSetLastSensorDatum: %@, lastSensorDatum: %@>"), v4, *(_OWORD *)&self->_aggregator, self->_configuration, v6, self->_lastSensorDatum);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSensorDatum, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
