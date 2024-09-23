@implementation SurfStatusSyncPlugin

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v7;

  v7 = a6;
  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("SurfStatusValidity")) & 1) == 0)
    objc_msgSend(v7, "resetWithValidity:", CFSTR("SurfStatusValidity"));

}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  intptr_t (*v15)(uint64_t, unint64_t);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_228C15654;
  v23 = sub_228C15664;
  v24 = 0;
  v7 = dispatch_semaphore_create(0);
  v8 = objc_alloc_init(MEMORY[0x24BE6EDF0]);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = sub_228C1566C;
  v16 = &unk_24F186BF8;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v8, "registrationStatusWithCompletion:", &v13);
  v10 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v9, v10);
  if (v20[5])
  {
    if (objc_msgSend(v5, "isEqualToString:", v13, v14, v15, v16))
    {
      objc_msgSend(v6, "setPostAnchor:", v5);
      objc_msgSend(v6, "setObject:", 0);
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x24BE817D0]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("SurfStatusIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIdentifier:", v12);

      objc_msgSend(v11, "setCurrentState:", v20[5]);
      objc_msgSend(v6, "setObject:", v11);
      objc_msgSend(v6, "setPostAnchor:", v20[5]);

    }
  }
  else
  {
    objc_msgSend(v6, "setObject:", v13, v14, v15, v16);
    objc_msgSend(v6, "setPostAnchor:", v5);
  }
  objc_msgSend(v6, "setIsDelete:", 0);

  _Block_object_dispose(&v19, 8);
}

@end
