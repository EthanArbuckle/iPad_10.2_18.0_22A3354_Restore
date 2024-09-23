@implementation AppleKeyboardStateManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23110FCF8;
  block[3] = &unk_250000588;
  block[4] = a1;
  if (qword_255EB5188 != -1)
    dispatch_once(&qword_255EB5188, block);
  return (id)qword_255EB5180;
}

- (AppleKeyboardStateManager)init
{
  AppleKeyboardStateManager *v2;
  uint64_t v3;
  NSMutableSet *capsLockStateTable;
  AppleKeyboardStateManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppleKeyboardStateManager;
  v2 = -[AppleKeyboardStateManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    capsLockStateTable = v2->_capsLockStateTable;
    v2->_capsLockStateTable = (NSMutableSet *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isCapsLockEnabled:(id)a3
{
  id v4;
  AppleKeyboardStateManager *v5;
  char v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[NSMutableSet containsObject:](v5->_capsLockStateTable, "containsObject:", v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setCapsLockEnabled:(BOOL)a3 locationID:(id)a4
{
  _BOOL4 v4;
  id v6;
  AppleKeyboardStateManager *v7;
  NSMutableSet *capsLockStateTable;
  id v9;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    v9 = v6;
    v7 = self;
    objc_sync_enter(v7);
    capsLockStateTable = v7->_capsLockStateTable;
    if (v4)
      -[NSMutableSet addObject:](capsLockStateTable, "addObject:", v9);
    else
      -[NSMutableSet removeObject:](capsLockStateTable, "removeObject:", v9);
    objc_sync_exit(v7);

    v6 = v9;
  }

}

- (NSMutableSet)capsLockStateTable
{
  return self->_capsLockStateTable;
}

- (void)setCapsLockStateTable:(id)a3
{
  objc_storeStrong((id *)&self->_capsLockStateTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capsLockStateTable, 0);
}

@end
