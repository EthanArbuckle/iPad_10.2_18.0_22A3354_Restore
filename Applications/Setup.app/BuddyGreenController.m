@implementation BuddyGreenController

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  id location[2];
  BuddyGreenController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(_QWORD))-[BuddyGreenController writeGreenInformedDefaultPlistIfNecessaryBlock](v5, "writeGreenInformedDefaultPlistIfNecessaryBlock");
  v3[2](v3);

  (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)writeGreenInformedDefaultPlistIfNecessaryBlock
{
  return self->_writeGreenInformedDefaultPlistIfNecessaryBlock;
}

- (void)setWriteGreenInformedDefaultPlistIfNecessaryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_writeGreenInformedDefaultPlistIfNecessaryBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
