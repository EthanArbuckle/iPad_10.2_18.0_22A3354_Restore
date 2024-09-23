@implementation BLSHSuppressionEvent

- (BLSHSuppressionEvent)initWithCoreMotionEvent:(id)a3 timestamp:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a3;
  if (objc_msgSend(v6, "type") == 1)
    v7 = 1;
  else
    v7 = 2;
  v8 = objc_msgSend(v6, "reason");

  return -[BLSHSuppressionEvent initWithType:reason:timestamp:](self, "initWithType:reason:timestamp:", v7, v8, a4);
}

- (BLSHSuppressionEvent)initWithType:(unint64_t)a3 reason:(unint64_t)a4 timestamp:(unint64_t)a5
{
  BLSHSuppressionEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLSHSuppressionEvent;
  result = -[BLSHSuppressionEvent init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_reason = a4;
    result->_machContinuousTimestamp = a5;
  }
  return result;
}

- (BOOL)wantsSuppression
{
  return self->_type == 1;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSAlwaysOnSuppressionType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("type"));

  NSStringFromBLSAlwaysOnSuppressionReason();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("reason"));

  objc_msgSend(v2, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)machContinuousTimestamp
{
  return self->_machContinuousTimestamp;
}

@end
