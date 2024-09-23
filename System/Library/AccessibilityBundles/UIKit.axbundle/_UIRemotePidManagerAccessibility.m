@implementation _UIRemotePidManagerAccessibility

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance__shared;
}

- (_UIRemotePidManagerAccessibility)init
{
  _UIRemotePidManagerAccessibility *v3;
  _UIRemotePidManagerAccessibility *v4;
  objc_super v5;
  SEL v6;
  _UIRemotePidManagerAccessibility *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIRemotePidManagerAccessibility;
  v7 = -[_UIRemotePidManagerAccessibility init](&v5, sel_init);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v4 = v7;
    AXPerformBlockOnMainThread();
    objc_storeStrong((id *)&v4, 0);
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)unsuspendPid:(int)a3 forAssertionPointer:(id)a4
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  _UIRemotePidManagerAccessibility *v9;
  id v10;
  int v11;
  id location;
  int v13;
  SEL v14;
  _UIRemotePidManagerAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __69___UIRemotePidManagerAccessibility_unsuspendPid_forAssertionPointer___block_invoke;
  v8 = &unk_24FF3DB98;
  v9 = v15;
  v11 = v13;
  v10 = location;
  AXPerformBlockOnMainThread();
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)_main_unsuspendPid:(int)a3 forAssertionPointer:(id)a4
{
  id *v4;
  NSMutableDictionary *v5;
  id v6;
  NSMutableDictionary *pidToAssertions;
  id v8;
  id v9;
  id location;
  unsigned int v11;
  SEL v12;
  _UIRemotePidManagerAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  pidToAssertions = v13->_pidToAssertions;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
  v9 = (id)-[NSMutableDictionary objectForKey:](pidToAssertions, "objectForKey:");

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);

    v5 = v13->_pidToAssertions;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9);

    AXPidUnsuspend();
  }
  objc_msgSend(v9, "addObject:", location, &v9);
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (void)suspendPid:(int)a3 forAssertionPointer:(id)a4
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  _UIRemotePidManagerAccessibility *v9;
  id v10;
  int v11;
  id location;
  int v13;
  SEL v14;
  _UIRemotePidManagerAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __67___UIRemotePidManagerAccessibility_suspendPid_forAssertionPointer___block_invoke;
  v8 = &unk_24FF3DB98;
  v9 = v15;
  v11 = v13;
  v10 = location;
  AXPerformBlockOnMainThread();
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)_main_suspendPid:(int)a3 forAssertionPointer:(id)a4
{
  NSMutableDictionary *v4;
  id v5;
  NSMutableDictionary *pidToAssertions;
  id v7;
  id v8;
  id location;
  unsigned int v10;
  SEL v11;
  _UIRemotePidManagerAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  pidToAssertions = v12->_pidToAssertions;
  v7 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
  v8 = (id)-[NSMutableDictionary objectForKey:](pidToAssertions, "objectForKey:");

  if (v8)
  {
    objc_msgSend(v8, "removeObject:", location);
    if (!objc_msgSend(v8, "count"))
    {
      v4 = v12->_pidToAssertions;
      v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:");

      AXPidSuspend();
    }
  }
  else
  {
    AXPidSuspend();
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (NSMutableDictionary)pidToAssertions
{
  return self->_pidToAssertions;
}

- (void)setPidToAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_pidToAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pidToAssertions, 0);
}

@end
