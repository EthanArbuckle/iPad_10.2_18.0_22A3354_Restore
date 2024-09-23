@implementation MPSGraphWaitEvent

- (MPSGraphWaitEvent)initWithEvent:(id)a3 value:(unint64_t)a4
{
  MTLSharedEvent *v6;
  MPSGraphWaitEvent *v7;
  MTLSharedEvent *event;
  objc_super v10;

  v6 = (MTLSharedEvent *)a3;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphWaitEvent;
  v7 = -[MPSGraphWaitEvent init](&v10, sel_init);
  event = v7->_event;
  v7->_event = v6;

  v7->_value = a4;
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
