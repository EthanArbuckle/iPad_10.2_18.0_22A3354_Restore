@implementation DYLaunchdCheckin

- (DYLaunchdCheckin)initWithSocketPath:(id)a3
{
  id v4;
  DYLaunchdCheckin *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSString *socketPath;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DYLaunchdCheckin;
  v5 = -[DYLaunchdCheckin init](&v14, sel_init);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("gputools.%@.%p"), v7, v5);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v9;

  v11 = objc_msgSend(v4, "copy");
  socketPath = v5->_socketPath;
  v5->_socketPath = (NSString *)v11;

  return v5;
}

- (id)_connectToSocketDescriptor:(int)a3
{
  void *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *connSource;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  int v17;
  _QWORD handler[5];
  int v19;

  v5 = (void *)objc_opt_new();
  fcntl(a3, 4, 4);
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->_queue);
  connSource = self->_connSource;
  self->_connSource = v6;

  v8 = self->_connSource;
  v9 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke;
  handler[3] = &unk_250D586C8;
  v19 = a3;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v8, handler);
  v10 = self->_connSource;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke_2;
  v15[3] = &unk_250D586F0;
  v15[4] = self;
  v17 = a3;
  v11 = v5;
  v16 = v11;
  dispatch_source_set_event_handler(v10, v15);
  dispatch_resume((dispatch_object_t)self->_connSource);
  v12 = v16;
  v13 = v11;

  return v13;
}

void __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  close(*(_DWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

void __47__DYLaunchdCheckin__connectToSocketDescriptor___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  socklen_t v4;
  sockaddr v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!dispatch_source_testcancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8)))
  {
    v4 = 0;
    if (accept(*(_DWORD *)(a1 + 48), &v5, &v4) == -1)
    {
      objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setError:", v3);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setResult:", v2);

  }
}

- (int)_tcpListenSocketDescriptor
{
  return -1;
}

- (int)_unixListenSocketDescriptor
{
  int v3;
  const char *v4;
  sockaddr v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = socket(1, 1, 0);
  bzero(&v6, 0x6AuLL);
  v6.sa_family = 1;
  v4 = -[NSString fileSystemRepresentation](objc_retainAutorelease(self->_socketPath), "fileSystemRepresentation");
  v6.sa_len = strlen(v4);
  strncpy(v6.sa_data, v4, 0x67uLL);
  if (bind(v3, &v6, 0x6Au))
    return -1;
  if (listen(v3, 1))
    return -1;
  return v3;
}

- (DYLaunchdCheckin)checkinWithBlock:(id)a3
{
  void *v4;
  id block;
  uint64_t v6;
  id v7;
  DYLaunchdCheckin *result;
  id v9;

  v9 = a3;
  v4 = (void *)objc_msgSend(v9, "copy");
  block = self->_block;
  self->_block = v4;

  v6 = -[DYLaunchdCheckin _unixListenSocketDescriptor](self, "_unixListenSocketDescriptor");
  if ((_DWORD)v6 != -1)
    v7 = -[DYLaunchdCheckin _connectToSocketDescriptor:](self, "_connectToSocketDescriptor:", v6);

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_connSource, 0);
}

@end
