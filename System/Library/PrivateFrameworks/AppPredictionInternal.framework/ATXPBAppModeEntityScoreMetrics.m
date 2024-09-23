@implementation ATXPBAppModeEntityScoreMetrics

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasActivityState
{
  return self->_activityState != 0;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (BOOL)hasNumDaysSinceStartOfMetricsLogging
{
  return self->_numDaysSinceStartOfMetricsLogging != 0;
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
  v8.super_class = (Class)ATXPBAppModeEntityScoreMetrics;
  -[ATXPBAppModeEntityScoreMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBAppModeEntityScoreMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  NSString *activityState;
  NSString *modelVersion;
  NSString *numDaysSinceStartOfMetricsLogging;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  activityState = self->_activityState;
  if (activityState)
    objc_msgSend(v4, "setObject:forKey:", activityState, CFSTR("activityState"));
  modelVersion = self->_modelVersion;
  if (modelVersion)
    objc_msgSend(v4, "setObject:forKey:", modelVersion, CFSTR("modelVersion"));
  numDaysSinceStartOfMetricsLogging = self->_numDaysSinceStartOfMetricsLogging;
  if (numDaysSinceStartOfMetricsLogging)
    objc_msgSend(v4, "setObject:forKey:", numDaysSinceStartOfMetricsLogging, CFSTR("numDaysSinceStartOfMetricsLogging"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppModeEntityScoreMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_activityState)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_modelVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_numDaysSinceStartOfMetricsLogging)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v5;
  }
  if (self->_activityState)
  {
    objc_msgSend(v5, "setActivityState:");
    v4 = v5;
  }
  if (self->_modelVersion)
  {
    objc_msgSend(v5, "setModelVersion:");
    v4 = v5;
  }
  if (self->_numDaysSinceStartOfMetricsLogging)
  {
    objc_msgSend(v5, "setNumDaysSinceStartOfMetricsLogging:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_activityState, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_modelVersion, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_numDaysSinceStartOfMetricsLogging, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *bundleId;
  NSString *activityState;
  NSString *modelVersion;
  NSString *numDaysSinceStartOfMetricsLogging;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[2]))
     || -[NSString isEqual:](bundleId, "isEqual:"))
    && ((activityState = self->_activityState, !((unint64_t)activityState | v4[1]))
     || -[NSString isEqual:](activityState, "isEqual:"))
    && ((modelVersion = self->_modelVersion, !((unint64_t)modelVersion | v4[3]))
     || -[NSString isEqual:](modelVersion, "isEqual:")))
  {
    numDaysSinceStartOfMetricsLogging = self->_numDaysSinceStartOfMetricsLogging;
    if ((unint64_t)numDaysSinceStartOfMetricsLogging | v4[4])
      v9 = -[NSString isEqual:](numDaysSinceStartOfMetricsLogging, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_activityState, "hash") ^ v3;
  v5 = -[NSString hash](self->_modelVersion, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_numDaysSinceStartOfMetricsLogging, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[ATXPBAppModeEntityScoreMetrics setBundleId:](self, "setBundleId:");
  if (v4[1])
    -[ATXPBAppModeEntityScoreMetrics setActivityState:](self, "setActivityState:");
  if (v4[3])
    -[ATXPBAppModeEntityScoreMetrics setModelVersion:](self, "setModelVersion:");
  if (v4[4])
    -[ATXPBAppModeEntityScoreMetrics setNumDaysSinceStartOfMetricsLogging:](self, "setNumDaysSinceStartOfMetricsLogging:");

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSString)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(id)a3
{
  objc_storeStrong((id *)&self->_activityState, a3);
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (NSString)numDaysSinceStartOfMetricsLogging
{
  return self->_numDaysSinceStartOfMetricsLogging;
}

- (void)setNumDaysSinceStartOfMetricsLogging:(id)a3
{
  objc_storeStrong((id *)&self->_numDaysSinceStartOfMetricsLogging, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDaysSinceStartOfMetricsLogging, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activityState, 0);
}

@end
