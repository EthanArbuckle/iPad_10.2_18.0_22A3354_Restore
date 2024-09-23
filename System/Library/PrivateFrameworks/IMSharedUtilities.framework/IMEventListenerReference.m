@implementation IMEventListenerReference

- (IMEventListenerReference)initWithEventListener:(id)a3
{
  id v4;
  IMEventListenerReference *v5;
  IMEventListenerReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMEventListenerReference;
  v5 = -[IMEventListenerReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_eventListener, v4);

  return v6;
}

- (IMEventListener)eventListener
{
  return (IMEventListener *)objc_loadWeakRetained((id *)&self->_eventListener);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventListener);
}

@end
