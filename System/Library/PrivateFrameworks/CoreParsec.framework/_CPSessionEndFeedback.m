@implementation _CPSessionEndFeedback

- (_CPSessionEndFeedback)init
{
  _CPSessionEndFeedback *v2;
  _CPSessionEndFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSessionEndFeedback;
  v2 = -[_CPSessionEndFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSessionEndFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPSessionEndFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPSessionEndFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  if (-[_CPSessionEndFeedback reason](self, "reason"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  int reason;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (timestamp = self->_timestamp, timestamp == objc_msgSend(v4, "timestamp")))
  {
    reason = self->_reason;
    v7 = reason == objc_msgSend(v4, "reason");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (2654435761 * self->_reason) ^ (2654435761u * self->_timestamp);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

@end
