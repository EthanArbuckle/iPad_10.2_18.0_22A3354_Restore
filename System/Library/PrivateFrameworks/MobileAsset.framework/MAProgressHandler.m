@implementation MAProgressHandler

- (MAProgressHandler)initWithCallBack:(id)a3
{
  id v4;
  MAProgressHandler *v5;
  MAProgressHandler *v6;
  uint64_t v7;
  NSMutableArray *callBackArray;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MAProgressHandler;
  v5 = -[MAProgressHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_notificationInterval = 1;
    v7 = objc_opt_new();
    callBackArray = v6->_callBackArray;
    v6->_callBackArray = (NSMutableArray *)v7;

    -[MAProgressHandler addCallBack:](v6, "addCallBack:", v4);
  }

  return v6;
}

- (void)addCallBack:(id)a3
{
  NSMutableArray *callBackArray;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_msgSend(a3, "copy");
    callBackArray = self->_callBackArray;
    v5 = (void *)MEMORY[0x1AF44EFD8]();
    -[NSMutableArray addObject:](callBackArray, "addObject:", v5);

  }
}

- (unint64_t)notificationInterval
{
  return self->_notificationInterval;
}

- (void)setNotificationInterval:(unint64_t)a3
{
  self->_notificationInterval = a3;
}

- (NSMutableArray)callBackArray
{
  return self->_callBackArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callBackArray, 0);
}

@end
