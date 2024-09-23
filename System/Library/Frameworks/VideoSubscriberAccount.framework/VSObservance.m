@implementation VSObservance

- (VSObservance)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSObservance)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  VSObservance *v11;
  VSObservance *v12;
  uint64_t v13;
  NSString *keyPath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The object parameter must not be nil."));
    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The keyPath parameter must not be nil."));
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)VSObservance;
  v11 = -[VSObservance init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_object = v8;
    v13 = objc_msgSend(v10, "copy");
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v12->_options = a5;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[VSObservance stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)VSObservance;
  -[VSObservance dealloc](&v3, sel_dealloc);
}

- (void)startObserving
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[VSObservance isObserving](self, "isObserving"))
  {
    -[VSObservance object](self, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSObservance keyPath](self, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VSObservance options](self, "options");
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, v4, v5, kVSKeyValueObservingContext_GenericObservance);

    -[VSObservance setObserving:](self, "setObserving:", 1);
  }
}

- (void)stopObserving
{
  void *v3;
  void *v4;

  if (-[VSObservance isObserving](self, "isObserving"))
  {
    -[VSObservance object](self, "object");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSObservance keyPath](self, "keyPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, kVSKeyValueObservingContext_GenericObservance);

    -[VSObservance setObserving:](self, "setObserving:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  if ((void *)kVSKeyValueObservingContext_GenericObservance == a6)
  {
    v11 = a5;
    -[VSObservance delegate](self, "delegate");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "observeChange:forObservance:", v11, self);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VSObservance;
    v10 = a5;
    -[VSObservance observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);

  }
}

- (id)object
{
  return self->_object;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)options
{
  return self->_options;
}

- (VSObservanceDelegate)delegate
{
  return (VSObservanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
