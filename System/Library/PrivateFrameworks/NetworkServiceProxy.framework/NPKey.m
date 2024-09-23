@implementation NPKey

- (NPKey)initWithData:(id)a3
{
  id v4;
  NPKey *v5;
  void *v6;
  _QWORD v8[4];
  NPKey *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKey;
  v5 = -[NPKey init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __22__NPKey_initWithData___block_invoke;
    v8[3] = &unk_1E4137CC8;
    v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);

  }
  return v5;
}

uint64_t __22__NPKey_initWithData___block_invoke(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (a2 == 1 && a3 == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = *a4;
    return 1;
  }
  if (a2 == 2 && a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v5;
LABEL_10:

    return 1;
  }
  if (a2 == 3 && a3 == 16)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a4);
    v9 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;
    goto LABEL_10;
  }
  if (a2 == 4 && a3 == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = *a4;
  }
  else if (a2 == 5 && a3 == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = *a4;
  }
  return 1;
}

- (id)data
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int16 v7;
  id v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[NSMutableData appendType:length:value:](v3, 1, 4u, (uint64_t)&self->_session_counter);
  -[NPKey info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[NPKey info](self, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    -[NPKey info](self, "info");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[NSMutableData appendType:length:value:](v3, 2, v7, objc_msgSend(v8, "bytes"));

  }
  v11[0] = 0;
  v11[1] = 0;
  -[NPKey uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getUUIDBytes:", v11);

  -[NSMutableData appendType:length:value:](v3, 3, 0x10u, (uint64_t)v11);
  -[NSMutableData appendType:length:value:](v3, 4, 4u, (uint64_t)&self->_error);
  -[NSMutableData appendType:length:value:](v3, 5, 4u, (uint64_t)&self->_flags);
  return v3;
}

- (NSPNetworkAgent)agentForKey
{
  NSPKeyNetworkAgent *v3;
  void *v4;

  v3 = objc_alloc_init(NSPKeyNetworkAgent);
  -[NPKey uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPNetworkAgent setAgentUUID:](v3, "setAgentUUID:", v4);

  return (NSPNetworkAgent *)v3;
}

- (unsigned)session_counter
{
  return self->_session_counter;
}

- (void)setSession_counter:(unsigned int)a3
{
  self->_session_counter = a3;
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (NSData)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
