@implementation IMPerfSinkPair

- (IMPerfSinkPair)initWithBehavior:(id)a3 sink:(id)a4
{
  id v7;
  id v8;
  IMPerfSinkPair *v9;
  IMPerfSinkPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMPerfSinkPair;
  v9 = -[IMPerfSinkPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_behavior, a3);
    objc_storeStrong((id *)&v10->_sink, a4);
  }

  return v10;
}

- (IMPerfProfilerBehavior)behavior
{
  return self->_behavior;
}

- (IMPerfProfilerSink)sink
{
  return self->_sink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
