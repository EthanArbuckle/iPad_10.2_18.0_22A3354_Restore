@implementation DTTapHeartbeatMemo

- (DTTapHeartbeatMemo)initWithTimestamp:(unint64_t)a3
{
  DTTapHeartbeatMemo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTTapHeartbeatMemo;
  result = -[DTTapHeartbeatMemo init](&v5, sel_init);
  if (result)
    result->_timestamp = a3;
  return result;
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
