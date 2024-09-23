@implementation EventAndSignal

- (EventAndSignal)initWithEvent:(id)a3 andSignal:(unint64_t)a4
{
  id v7;
  EventAndSignal *v8;
  EventAndSignal *v9;
  EventAndSignal *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EventAndSignal;
  v8 = -[EventAndSignal init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_event, a3);
    v9->_signal = a4;
    v10 = v9;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v9;
}

- (MTLEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (unint64_t)signal
{
  return self->_signal;
}

- (void)setSignal:(unint64_t)a3
{
  self->_signal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
