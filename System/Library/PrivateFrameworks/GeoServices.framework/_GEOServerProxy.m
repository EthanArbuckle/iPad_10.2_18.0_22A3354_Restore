@implementation _GEOServerProxy

- (Class)serverClass
{
  return self->_serverClass;
}

- (GEOServer)server
{
  return self->_server;
}

+ (id)proxyForClass:(Class)a3
{
  _QWORD *v5;

  if (a3)
  {
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
    {
      v5 = objc_alloc_init((Class)a1);
      if (v5)
        v5[1] = a3;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)proxyForServer:(id)a3 daemon:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_alloc_init((Class)a1);
    if (v8)
    {
      v8[1] = objc_opt_class();
      objc_msgSend(v8, "_setServer:", v6);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (void)startServerWithDaemon:(id)a3
{
  objc_class *serverClass;
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_server)
  {
    serverClass = self->_serverClass;
    v5 = a3;
    NSStringFromClass(serverClass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetLaunchLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    GEOGetLaunchLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v14 = 138543362;
      v15 = v6;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LaunchServer", "class=%{public}@", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)objc_msgSend(objc_alloc(self->_serverClass), "initWithDaemon:", v5);
    -[_GEOServerProxy _setServer:](self, "_setServer:", v11);

    GEOGetLaunchLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = 138543362;
      v15 = v6;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v13, OS_SIGNPOST_INTERVAL_END, v8, "LaunchServer", "class=%{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[_GEOServerProxy isEqualToServerProxy:](self, "isEqualToServerProxy:", v4);

  return v5;
}

- (BOOL)isEqualToServerProxy:(id)a3
{
  return self->_serverClass == (Class)*((_QWORD *)a3 + 1);
}

- (unint64_t)hash
{
  return -[objc_class hash](self->_serverClass, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(self->_serverClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v4, self->_server);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
}

@end
