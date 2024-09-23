@implementation _CPConnectionInvalidatedFeedback

- (_CPConnectionInvalidatedFeedback)init
{
  _CPConnectionInvalidatedFeedback *v2;
  _CPConnectionInvalidatedFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPConnectionInvalidatedFeedback;
  v2 = -[_CPConnectionInvalidatedFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPConnectionInvalidatedFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPConnectionInvalidatedFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPConnectionInvalidatedFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    v6 = timestamp == objc_msgSend(v4, "timestamp");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 2654435761u * self->_timestamp;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

@end
