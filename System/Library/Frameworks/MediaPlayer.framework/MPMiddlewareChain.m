@implementation MPMiddlewareChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middlewareEnumerator, 0);
  objc_storeStrong((id *)&self->_builders, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPMiddlewareChain;
  -[MPMiddlewareChain methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "builderProxyForProtocol:", self->_protocol);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)builderProxyForProtocol:(id)a3
{
  return +[_MPMiddlewareChainBuilderProxy allocWithProtocol:](_MPMiddlewareChainBuilderProxy, "allocWithProtocol:", a3);
}

- (MPMiddlewareChain)initWithMiddleware:(id)a3 protocol:(id)a4
{
  id v6;
  Protocol *v7;
  MPMiddlewareChain *v8;
  MPMiddlewareChain *v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  NSArray *builders;
  NSArray *v19;
  uint64_t v20;
  NSEnumerator *middlewareEnumerator;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (Protocol *)a4;
  v27.receiver = self;
  v27.super_class = (Class)MPMiddlewareChain;
  v8 = -[MPMiddlewareChain init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_protocol, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15);
          v17 = (objc_class *)objc_opt_class();
          if (class_conformsToProtocol(v17, v7))
            -[NSArray addObject:](v10, "addObject:", v16, (_QWORD)v23);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v13);
    }

    builders = v9->_builders;
    v9->_builders = v10;
    v19 = v10;

    -[NSArray objectEnumerator](v19, "objectEnumerator");
    v20 = objc_claimAutoreleasedReturnValue();
    middlewareEnumerator = v9->_middlewareEnumerator;
    v9->_middlewareEnumerator = (NSEnumerator *)v20;

  }
  return v9;
}

- (void)forwardInvocation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "methodSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "methodReturnLength");

  objc_msgSend(v3, "getArgument:atIndex:", (char *)v6 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), 2);
  objc_msgSend(v3, "setReturnValue:", (char *)v6 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));

}

- (id)nextObject
{
  uint64_t v3;
  void *v4;
  MPMiddlewareChain *v5;
  MPMiddlewareChain *v6;
  BOOL v7;
  uint64_t v8;

  -[NSEnumerator nextObject](self->_middlewareEnumerator, "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (MPMiddlewareChain *)v3;
  else
    v5 = self;
  v6 = v5;

  if (self->_builderSelector)
    v7 = v6 == self;
  else
    v7 = 1;
  if (!v7 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    -[MPMiddlewareChain nextObject](self, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (MPMiddlewareChain *)v8;
  }
  return v6;
}

- (void)setBuilderSelector:(SEL)a3
{
  self->_builderSelector = a3;
}

- (SEL)builderSelector
{
  return self->_builderSelector;
}

@end
