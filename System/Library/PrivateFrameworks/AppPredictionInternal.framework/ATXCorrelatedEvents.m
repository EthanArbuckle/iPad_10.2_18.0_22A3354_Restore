@implementation ATXCorrelatedEvents

- (ATXCorrelatedEvents)initWithFirstEvent:(id)a3 secondEvent:(id)a4
{
  id v7;
  id v8;
  ATXCorrelatedEvents *v9;
  ATXCorrelatedEvents *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCorrelatedEvents;
  v9 = -[ATXCorrelatedEvents init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstEvent, a3);
    objc_storeStrong((id *)&v10->_secondEvent, a4);
  }

  return v10;
}

- (ATXDuetEvent)firstEvent
{
  return self->_firstEvent;
}

- (ATXDuetEvent)secondEvent
{
  return self->_secondEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondEvent, 0);
  objc_storeStrong((id *)&self->_firstEvent, 0);
}

@end
