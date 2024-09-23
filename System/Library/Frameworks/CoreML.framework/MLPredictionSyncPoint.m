@implementation MLPredictionSyncPoint

- (MLPredictionSyncPoint)initWithSharedEvent:(id)a3 value:(unint64_t)a4
{
  id v7;
  MLPredictionSyncPoint *v8;
  MLPredictionSyncPoint *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLPredictionSyncPoint;
  v8 = -[MLPredictionSyncPoint init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sharedEvent, a3);
    v9->_value = a4;
  }

  return v9;
}

- (void)notify
{
  unint64_t v3;
  id v4;

  v3 = -[MLPredictionSyncPoint value](self, "value");
  -[MLPredictionSyncPoint sharedEvent](self, "sharedEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSignaledValue:", v3);

}

- (MTLSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
}

@end
