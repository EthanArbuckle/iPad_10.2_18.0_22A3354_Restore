@implementation _CNObservableEventStaticArrayBufferingStrategy

- (_CNObservableEventStaticArrayBufferingStrategy)initWithEvents:(id)a3
{
  id v4;
  _CNObservableEventStaticArrayBufferingStrategy *v5;
  uint64_t v6;
  NSArray *events;
  _CNObservableEventStaticArrayBufferingStrategy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNObservableEventStaticArrayBufferingStrategy;
  v5 = -[_CNObservableEventStaticArrayBufferingStrategy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    events = v5->_events;
    v5->_events = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isSequenceTerminated
{
  return 1;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
}

@end
