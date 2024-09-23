@implementation _CPFeedback

- (_CPFeedback)init
{
  _CPFeedback *v2;
  _CPFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPFeedback;
  v2 = -[_CPFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return _CPFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_CPFeedback timestamp](self, "timestamp"))
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

- (_CPFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPFeedback *v5;
  _CPFeedback *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPFeedback;
  v5 = -[_CPFeedback init](&v8, sel_init);
  if (v5)
  {
    -[_CPFeedback setTimestamp:](v5, "setTimestamp:", objc_msgSend(v4, "timestamp"));
    v6 = v5;
  }

  return v5;
}

@end
