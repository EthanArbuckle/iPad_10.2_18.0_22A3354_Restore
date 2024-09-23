@implementation MGServiceClient

- (MGServiceClient)initWithConnection:(id)a3
{
  id v5;
  MGServiceClient *v6;
  MGServiceClient *v7;
  NSDictionary *queries;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MGServiceClient;
  v6 = -[MGServiceClient init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    queries = v7->_queries;
    v7->_queries = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MGServiceClient *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MGServiceClient *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MGServiceClient connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MGServiceClient connection](v4, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MGServiceClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MGServiceClient *v4;
  void *v5;
  MGServiceClient *v6;

  v4 = [MGServiceClient alloc];
  -[MGServiceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MGServiceClient initWithConnection:](v4, "initWithConnection:", v5);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGServiceClient connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, connection = %p>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v2;
  void (**v3)(_QWORD);

  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (void)setQueries:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSDictionary *v7;
  NSDictionary *queries;
  NSUInteger v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  id v15;
  void *v16;
  _OWORD buffer[4];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[MGServiceClient queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToDictionary:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (NSDictionary *)objc_msgSend(v4, "copy");
    queries = self->_queries;
    self->_queries = v7;

    v9 = -[NSDictionary count](self->_queries, "count");
    -[MGServiceClient transaction](self, "transaction");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!v9 || v10)
    {
      if (!v9 && v10)
        -[MGServiceClient setTransaction:](self, "setTransaction:", 0);
    }
    else
    {
      -[MGServiceClient connection](self, "connection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "processIdentifier");

      memset(buffer, 0, sizeof(buffer));
      *((_BYTE *)buffer + proc_name(v13, buffer, 0x40u)) = 0;
      if (LOBYTE(buffer[0]))
        v14 = (const char *)buffer;
      else
        v14 = "unknown";
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.MediaGroups.queries-%s"), v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "UTF8String");
      v16 = (void *)os_transaction_create();
      -[MGServiceClient setTransaction:](self, "setTransaction:", v16);

    }
  }

}

- (void)addQuery:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__MGServiceClient_addQuery___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);

}

void __28__MGServiceClient_addQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = *(void **)(a1 + 40);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setQueries:", v5);
}

- (void)removeQuery:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__MGServiceClient_removeQuery___block_invoke;
  v6[3] = &unk_24E0AA5E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v6);

}

void __31__MGServiceClient_removeQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setQueries:", v4);
}

- (id)outstandingQueryForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
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
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__MGServiceClient_outstandingQueryForIdentifier___block_invoke;
  v8[3] = &unk_24E0AA660;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__MGServiceClient_outstandingQueryForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)enumerateQueriesUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[6];
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
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke;
  v10[3] = &unk_24E0AA728;
  v10[4] = self;
  v10[5] = &v11;
  -[MGServiceClient _withLock:]((os_unfair_lock_s *)self, v10);
  v6 = (void *)v12[5];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke_2;
  v8[3] = &unk_24E0AB238;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  _Block_object_dispose(&v11, 8);
}

void __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "queries");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __46__MGServiceClient_enumerateQueriesUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
