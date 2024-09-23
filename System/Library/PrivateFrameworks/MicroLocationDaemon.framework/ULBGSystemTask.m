@implementation ULBGSystemTask

- (ULBGSystemTask)initWithUnderlyingTask:(id)a3
{
  id v4;
  ULBGSystemTask *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULBGSystemTask;
  v5 = -[ULBGSystemTask init](&v10, sel_init);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__ULBGSystemTask_initWithUnderlyingTask___block_invoke;
    v7[3] = &unk_2511D2C80;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "setExpirationHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __41__ULBGSystemTask_initWithUnderlyingTask___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setShouldCancel:", 1);
    WeakRetained = v2;
  }

}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

@end
