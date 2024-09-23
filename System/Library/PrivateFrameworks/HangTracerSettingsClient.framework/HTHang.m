@implementation HTHang

- (HTHang)initWithXPCDictionary:(id)a3
{
  id v4;
  HTHang *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *bundleID;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  NSDate *creationDate;
  void *v15;
  double v16;
  uint64_t v17;
  NSString *processPath;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HTHang;
  v5 = -[HTHang init](&v20, sel_init);
  if (v5)
  {
    stringFromXpcDictionary(v4, (id)*MEMORY[0x24BE3F350]);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    stringFromXpcDictionary(v4, (id)*MEMORY[0x24BE3F338]);
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    stringFromXpcDictionary(v4, (id)*MEMORY[0x24BE3F340]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    if (v12 == 0.0)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    stringFromXpcDictionary(v4, (id)*MEMORY[0x24BE3F348]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v5->_duration = v16;

    stringFromXpcDictionary(v4, (id)*MEMORY[0x24BE3F358]);
    v17 = objc_claimAutoreleasedReturnValue();
    processPath = v5->_processPath;
    v5->_processPath = (NSString *)v17;

    objc_storeStrong((id *)&v5->_bundleId, v5->_bundleID);
    objc_storeStrong((id *)&v5->_hangId, v5->_identifier);
    objc_storeStrong((id *)&v5->_createdAt, v5->_creationDate);
  }

  return v5;
}

- (int64_t)durationLevel
{
  return HTLevelForHangDuration(self->_duration);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)hangId
{
  return self->_hangId;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_hangId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
