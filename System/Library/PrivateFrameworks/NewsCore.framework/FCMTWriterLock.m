@implementation FCMTWriterLock

- (void)performWriteSync:(id)a3
{
  void *v4;
  void (**v5)(_QWORD);

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = (void (**)(_QWORD))a3;
  objc_msgSend(v4, "isMainThread");
  -[FCMTWriterLock lock](self, "lock");
  v5[2](v5);

  -[FCMTWriterLock unlock](self, "unlock");
}

- (void)performReadSync:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2]();
  }
  else
  {
    -[FCMTWriterLock lock](self, "lock");
    v4[2]();
    -[FCMTWriterLock unlock](self, "unlock");
  }

}

- (void)lock
{
  if (self)
    self = (FCMTWriterLock *)self->_underlyingLock;
  -[FCMTWriterLock lock](self, "lock");
}

- (void)unlock
{
  if (self)
    self = (FCMTWriterLock *)self->_underlyingLock;
  -[FCMTWriterLock unlock](self, "unlock");
}

void __29__FCMTWriterLock_readObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)readObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__80;
  v15 = __Block_byref_object_dispose__80;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__FCMTWriterLock_readObject___block_invoke;
  v8[3] = &unk_1E464A878;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[FCMTWriterLock performReadSync:](self, "performReadSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (FCMTWriterLock)init
{
  id v3;
  FCMTWriterLock *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D60B18]);
  v4 = -[FCMTWriterLock initWithUnderlyingLock:](self, "initWithUnderlyingLock:", v3);

  return v4;
}

- (FCMTWriterLock)initWithUnderlyingLock:(id)a3
{
  id v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCMTWriterLock;
  v6 = -[FCMTWriterLock init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingLock, a3);

  return v7;
}

- (BOOL)readBool:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__FCMTWriterLock_readBool___block_invoke;
  v7[3] = &unk_1E464A878;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[FCMTWriterLock performReadSync:](self, "performReadSync:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __27__FCMTWriterLock_readBool___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLock, 0);
}

@end
