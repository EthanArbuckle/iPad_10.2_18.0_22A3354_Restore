@implementation AFInstrumentationObserverConnection

- (AFInstrumentationObserverConnection)initWithObservation:(id)a3
{
  return -[AFInstrumentationObserverConnection initWithObservation:filterByInstrumentationTypes:](self, "initWithObservation:filterByInstrumentationTypes:", a3, 0);
}

- (AFInstrumentationObserverConnection)initWithObservation:(id)a3 filterByInstrumentationTypes:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFInstrumentationObserverConnection;
  return -[AFInstrumentationObserverConnection init](&v5, sel_init, a3, a4);
}

- (void)flushWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

@end
