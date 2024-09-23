@implementation MCResourceProgressObserver

- (MCResourceProgressObserver)initWithName:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  MCResourceProgressObserver *v8;
  MCResourceProgressObserver *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MCResourceProgressObserver;
  v8 = -[MCResourceProgressObserver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MCResourceProgressObserver setName:](v8, "setName:", a3);
    -[MCResourceProgressObserver setProgress:](v9, "setProgress:", a4);
    v9->_cancelHandler = (id)objc_msgSend(a5, "copy");
    -[NSProgress addObserver:forKeyPath:options:context:](v9->_progress, "addObserver:forKeyPath:options:context:", v9, CFSTR("cancelled"), 1, 0);
    -[NSProgress addObserver:forKeyPath:options:context:](v9->_progress, "addObserver:forKeyPath:options:context:", v9, CFSTR("completedUnitCount"), 1, 0);
    v9->_progressObserversSet = 1;
  }
  return v9;
}

- (void)invalidate
{
  if (self->_progressObserversSet)
  {
    -[NSProgress removeObserver:forKeyPath:](-[MCResourceProgressObserver progress](self, "progress"), "removeObserver:forKeyPath:", self, CFSTR("cancelled"));
    -[NSProgress removeObserver:forKeyPath:](-[MCResourceProgressObserver progress](self, "progress"), "removeObserver:forKeyPath:", self, CFSTR("completedUnitCount"));
    self->_progressObserversSet = 0;
  }
  -[MCResourceProgressObserver setCancelHandler:](self, "setCancelHandler:", 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cancelled"), a4, a5, a6))
  {
    if (objc_msgSend(a4, "isCancelled"))
    {
      if (-[MCResourceProgressObserver cancelHandler](self, "cancelHandler"))
        (*(void (**)(void))(-[MCResourceProgressObserver cancelHandler](self, "cancelHandler") + 16))();
    }
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("completedUnitCount")))
  {
    v9 = objc_msgSend(a4, "completedUnitCount");
    if (v9 == objc_msgSend(a4, "totalUnitCount"))
      -[MCResourceProgressObserver invalidate](self, "invalidate");
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_cancelHandler = 0;
  v3.receiver = self;
  v3.super_class = (Class)MCResourceProgressObserver;
  -[MCResourceProgressObserver dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
