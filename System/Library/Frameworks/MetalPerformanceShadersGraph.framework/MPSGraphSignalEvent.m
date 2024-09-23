@implementation MPSGraphSignalEvent

- (MPSGraphSignalEvent)initWithEvent:(id)a3 executionStage:(unint64_t)a4 value:(unint64_t)a5
{
  MTLSharedEvent *v8;
  MPSGraphSignalEvent *v9;
  MTLSharedEvent *event;
  objc_super v12;

  v8 = (MTLSharedEvent *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphSignalEvent;
  v9 = -[MPSGraphSignalEvent init](&v12, sel_init);
  event = v9->_event;
  v9->_event = v8;

  v9->_value = a5;
  v9->_executionStage = a4;
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
