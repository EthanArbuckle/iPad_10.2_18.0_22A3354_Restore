@implementation BLSHFlipbookInvalidationTelemetryData

- (BLSHFlipbookInvalidationTelemetryData)initWithTimestamp:(double)a3 reason:(id)a4 source:(id)a5 didClearDateSpecifiers:(BOOL)a6 wasReset:(BOOL)a7 invalidatedFramesHistogram:(id)a8 environmentIdentifiers:(id)a9
{
  id v17;
  id v18;
  id v19;
  BLSHFlipbookInvalidationTelemetryData *v20;
  BLSHFlipbookInvalidationTelemetryData *v21;
  id v23;
  objc_super v24;

  v23 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)BLSHFlipbookInvalidationTelemetryData;
  v20 = -[BLSHFlipbookInvalidationTelemetryData init](&v24, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_timestamp = a3;
    objc_storeStrong((id *)&v20->_reason, a4);
    objc_storeStrong((id *)&v21->_source, a5);
    v21->_didClearDateSpecifiers = a6;
    v21->_wasReset = a7;
    objc_storeStrong((id *)&v21->_invalidatedFramesHistogram, a8);
    objc_storeStrong((id *)&v21->_environmentIdentifiers, a9);
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BLSShortLoggingStringForContinuousMachTime();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("timestamp"));

  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_source, CFSTR("source"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", self->_didClearDateSpecifiers, CFSTR("didClearDateSpecifiers"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", self->_wasReset, CFSTR("wasReset"));
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", self->_invalidatedFramesHistogram, CFSTR("histogram"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_environmentIdentifiers, CFSTR("environments"), 1);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)source
{
  return self->_source;
}

- (BOOL)didClearDateSpecifiers
{
  return self->_didClearDateSpecifiers;
}

- (BOOL)wasReset
{
  return self->_wasReset;
}

- (BLSHFlipbookFramesHistogram)invalidatedFramesHistogram
{
  return self->_invalidatedFramesHistogram;
}

- (NSArray)environmentIdentifiers
{
  return self->_environmentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_invalidatedFramesHistogram, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
