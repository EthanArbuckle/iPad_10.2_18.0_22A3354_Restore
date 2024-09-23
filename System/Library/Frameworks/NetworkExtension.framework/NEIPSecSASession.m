@implementation NEIPSecSASession

- (NEIPSecSASession)initWithName:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NEIPSecSASession *v8;
  const char *v9;
  NEIPSecSASession *v10;
  unint64_t v11;
  id v12;
  SEL v13;
  id v14;
  SEL v15;
  NEIPSecSASession *v16;
  NSObject *v18;
  uint8_t v19[16];
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NEIPSecSASession;
  v8 = -[NEIPSecSASession init](&v20, sel_init);
  v10 = v8;
  if (v8)
  {
    do
      v11 = __ldxr((unint64_t *)&sNEIPSecSASessionIndex);
    while (__stxr(v11 + 1, (unint64_t *)&sNEIPSecSASessionIndex));
    v8->_uniqueIndex = v11;
    objc_setProperty_atomic(v8, v9, v6, 8);
    -[NEIPSecSASession setDelegate:](v10, "setDelegate:", v7);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_setProperty_atomic(v10, v13, v12, 24);

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_setProperty_atomic(v10, v15, v14, 32);

    v16 = v10;
  }
  else
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", v19, 2u);
    }

  }
  return v10;
}

- (id)description
{
  id v3;
  unint64_t uniqueIndex;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
    uniqueIndex = self->_uniqueIndex;
  else
    uniqueIndex = 0;
  -[NEIPSecSASession name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SASession[%llu, %@]"), uniqueIndex, v5);

  return v6;
}

- (NSArray)securityAssociations
{
  if (self)
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 24, 1);
  return (NSArray *)self;
}

- (id)copyEmptySASession
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  -[NEIPSecSASession name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIPSecSASession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:delegate:", v4, v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NEIPSecSASession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NEIPSecSASession;
  -[NEIPSecSASession dealloc](&v3, sel_dealloc);
}

- (void)setDelegateQueue:(id)a3
{
  if (self)
    objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)delegateQueue
{
  if (self)
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 48, 1);
  return (OS_dispatch_queue *)self;
}

- (void)removeAllSAs
{
  NSObject *v3;
  const char *v4;
  id Property;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  SEL v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  NEIPSecSASession *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@ Removing all SAs", buf, 0xCu);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  if (self)
    Property = objc_getProperty(self, v4, 32, 1);
  else
    Property = 0;
  v6 = Property;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10++), "invalidate");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v11, 32, 1), "removeAllObjects");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = objc_getProperty(self, v12, 24, 1);
  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
    v13 = 0;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
  }
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18++), "invalidate", (_QWORD)v21);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  if (self)
    v20 = objc_getProperty(self, v19, 24, 1);
  else
    v20 = 0;
  objc_msgSend(v20, "removeAllObjects", (_QWORD)v21);
}

- (BOOL)addLarvalSA:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NEIPSecSASession;
  -[NEIPSecSASession doesNotRecognizeSelector:](&v4, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (BOOL)updateSA:(id)a3
{
  const char *v4;
  id v5;
  const char *v6;
  SEL v7;
  id Property;
  BOOL v9;

  v5 = a3;
  if (!self)
  {
    if ((objc_msgSend(0, "containsObject:", v5) & 1) != 0)
    {
      objc_msgSend(0, "addObject:", v5);
      Property = 0;
      goto LABEL_4;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, v4, 32, 1), "containsObject:", v5))
    goto LABEL_7;
  objc_msgSend(objc_getProperty(self, v6, 24, 1), "addObject:", v5);
  Property = objc_getProperty(self, v7, 32, 1);
LABEL_4:
  objc_msgSend(Property, "removeObject:", v5);
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)addSA:(id)a3
{
  const char *v4;
  id v5;
  id Property;

  v5 = a3;
  if (v5)
  {
    if (self)
      Property = objc_getProperty(self, v4, 24, 1);
    else
      Property = 0;
    objc_msgSend(Property, "addObject:", v5);
  }

  return v5 != 0;
}

- (BOOL)removeSA:(id)a3
{
  const char *v4;
  id v5;
  const char *v6;
  BOOL v7;
  const char *v8;
  id Property;
  char v11;

  v5 = a3;
  if (self)
  {
    if (objc_msgSend(objc_getProperty(self, v4, 24, 1), "containsObject:", v5))
    {
      v7 = 1;
      objc_msgSend(objc_getProperty(self, v6, 24, 1), "removeObject:", v5);
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(objc_getProperty(self, v6, 32, 1), "containsObject:", v5))
    {
      Property = objc_getProperty(self, v8, 32, 1);
LABEL_7:
      objc_msgSend(Property, "removeObject:", v5);
      v7 = 1;
    }
  }
  else
  {
    if (objc_msgSend(0, "containsObject:", v5))
    {
      objc_msgSend(0, "removeObject:", v5);
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    v11 = objc_msgSend(0, "containsObject:", v5);
    Property = 0;
    if ((v11 & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(v5, "invalidate");

  return v7;
}

- (BOOL)migrateSA:(id)a3
{
  const char *v4;
  id v5;
  const char *v6;
  SEL v7;
  id Property;
  BOOL v9;

  v5 = a3;
  if (!self)
  {
    if ((objc_msgSend(0, "containsObject:", v5) & 1) != 0)
    {
      objc_msgSend(0, "removeObject:", v5);
      Property = 0;
      goto LABEL_4;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, v4, 24, 1), "containsObject:", v5))
    goto LABEL_7;
  objc_msgSend(objc_getProperty(self, v6, 24, 1), "removeObject:", v5);
  Property = objc_getProperty(self, v7, 24, 1);
LABEL_4:
  objc_msgSend(Property, "addObject:", v5);
  v9 = 1;
LABEL_8:

  return v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NEIPSecSASessionDelegate)delegate
{
  return (NEIPSecSASessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_larvalSAs, 0);
  objc_storeStrong((id *)&self->_internalSecurityAssociations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
