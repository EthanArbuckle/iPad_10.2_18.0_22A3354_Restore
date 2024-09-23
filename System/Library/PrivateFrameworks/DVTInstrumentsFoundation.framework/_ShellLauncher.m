@implementation _ShellLauncher

- (_ShellLauncher)init
{
  _ShellLauncher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableArray *launchCompletions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_ShellLauncher;
  v2 = -[_ShellLauncher init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PreviewShellLauncherQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_launching = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    launchCompletions = v2->_launchCompletions;
    v2->_launchCompletions = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)launchWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222BA9E58;
  v7[3] = &unk_24EB2B428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_queue_launchWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *launchCompletions;
  void *v7;
  _BOOL4 launching;
  NSObject *v9;
  _BOOL4 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    launchCompletions = self->_launchCompletions;
    v7 = _Block_copy(v4);
    -[NSMutableArray addObject:](launchCompletions, "addObject:", v7);

  }
  launching = self->_launching;
  DTUVPreviewServiceLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (launching)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222B17000, v9, OS_LOG_TYPE_INFO, "Launch/connect to preview shell already underway; not initiating new request",
        buf,
        2u);
    }

  }
  else
  {
    if (v10)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_222B17000, v9, OS_LOG_TYPE_INFO, "Initiating request to launch/connect to preview shell", v11, 2u);
    }

    self->_launching = 1;
    -[_ShellLauncher _queue_launchWithRetries:](self, "_queue_launchWithRetries:", 3);
  }

}

- (void)_queue_launchWithRetries:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  int v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_222BAA10C;
  aBlock[3] = &unk_24EB29BD8;
  v16 = a3;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BE38228];
  v20[0] = &unk_24EB4EF20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE38478];
  v9 = *MEMORY[0x24BE38310];
  v17[0] = *MEMORY[0x24BE382C0];
  v17[1] = v9;
  v18[0] = v7;
  v18[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "optionsWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = sub_222BAA21C;
  v13[3] = &unk_24EB2B478;
  v13[4] = self;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v6, "openApplication:withOptions:completion:", CFSTR("com.apple.PreviewShell"), v11, v13);

}

- (void)_queue_completeWithPid:(int)a3 error:(id)a4
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_launchCompletions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->_launchCompletions, "removeAllObjects", (_QWORD)v11);
  self->_launching = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchCompletions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
