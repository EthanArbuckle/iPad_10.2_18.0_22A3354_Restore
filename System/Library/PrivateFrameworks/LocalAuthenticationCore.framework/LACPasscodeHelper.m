@implementation LACPasscodeHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance_1;
}

void __35__LACPasscodeHelper_sharedInstance__block_invoke()
{
  LACPasscodeHelper *v0;
  void *v1;

  v0 = objc_alloc_init(LACPasscodeHelper);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (LACPasscodeHelper)init
{
  LACPasscodeHelper *v2;
  uint64_t v3;
  NSHashTable *observers;
  LACKeyBagMKBAdapter *v5;
  LACKeyBagMKBAdapter *keyBagAdapter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LACPasscodeHelper;
  v2 = -[LACPasscodeHelper init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = -[LACKeyBagMKBAdapter initWithUserId:]([LACKeyBagMKBAdapter alloc], "initWithUserId:", geteuid());
    keyBagAdapter = v2->_keyBagAdapter;
    v2->_keyBagAdapter = v5;

    -[LACKeyBagMKBAdapter addObserver:](v2->_keyBagAdapter, "addObserver:", v2);
  }
  return v2;
}

- (void)updatePasscodeSuccessAgeWithCurrentSystemUptime
{
  -[LACPasscodeHelper _updatePasscodeSuccessAgeWithUptime:](self, "_updatePasscodeSuccessAgeWithUptime:", 0);
}

- (void)_updatePasscodeSuccessAgeWithUptime:(id)a3
{
  double v4;
  double v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    self->_lastPasscodeSuccessUptime = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemUptime");
    self->_lastPasscodeSuccessUptime = v5;

  }
}

- (BOOL)isPasscodeSetForUser:(unsigned int)a3 error:(id *)a4
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE63CB8], "sharedConnection", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPasscodeSet");

  if (a4)
  {
    if (v6)
    {
      *a4 = 0;
    }
    else
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -5, CFSTR("Passcode not set."));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v7;

    }
  }
  return v6;
}

- (double)passcodeSuccessAge
{
  double result;
  void *v4;
  double v5;
  double v6;

  result = 0.0;
  if (self->_lastPasscodeSuccessUptime > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemUptime");
    v6 = v5;

    return v6 - self->_lastPasscodeSuccessUptime;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversAboutUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "passcodeSetDidChangeForHelper:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)keybagStateDidChange:(id)a3
{
  uint64_t v4;
  NSNumber *keyBagDisabled;
  NSNumber *v6;
  NSNumber *v7;

  v4 = objc_msgSend(a3, "state");
  keyBagDisabled = self->_keyBagDisabled;
  if (!keyBagDisabled || (v4 == 1) != -[NSNumber BOOLValue](keyBagDisabled, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4 == 1);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_keyBagDisabled;
    self->_keyBagDisabled = v6;

    -[LACPasscodeHelper _notifyObserversAboutUpdate](self, "_notifyObserversAboutUpdate");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyBagDisabled, 0);
  objc_storeStrong((id *)&self->_keyBagAdapter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
