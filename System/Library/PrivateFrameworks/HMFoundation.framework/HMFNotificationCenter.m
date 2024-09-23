@implementation HMFNotificationCenter

void __38__HMFNotificationCenter_defaultCenter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_71;
  _MergedGlobals_71 = v0;

}

- (void)postNotificationName:(id)a3 object:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", v7, v6);

}

+ (id)defaultCenter
{
  if (qword_1ED013208 != -1)
    dispatch_once(&qword_1ED013208, &__block_literal_global_39);
  return (id)_MergedGlobals_71;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0CB37D0];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v9, "defaultCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v12, a4, v11, v10);

}

- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0CB37D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", v10, v9, v8);

}

- (void)removeObserver:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)postNotification:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotification:", v4);

}

- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0CB37D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", v10, v9, v8);

}

@end
