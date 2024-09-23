@implementation OSActivitySignpostEvent

- (OSActivitySignpostEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  OSActivitySignpostEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OSActivitySignpostEvent;
  result = -[OSActivityLogMessageEvent initWithEntry:](&v5, sel_initWithEntry_);
  if (result)
    result->_signpostID = a3->var8.var4.var20;
  return result;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

@end
