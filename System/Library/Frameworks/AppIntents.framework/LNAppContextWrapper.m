@implementation LNAppContextWrapper

- (LNAppContextWrapper)init
{
  LNAppContextWrapper *v2;
  uint64_t v3;
  LNAppContext *appContext;
  LNAppContextWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNAppContextWrapper;
  v2 = -[LNAppContextWrapper init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    appContext = v2->_appContext;
    v2->_appContext = (LNAppContext *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)performAction:(id)a3 options:(id)a4 reportingProgress:(id)a5 delegate:(id)a6 auditToken:(id *)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __int128 v20;
  _OWORD v21[2];

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[LNAppContextWrapper appContext](self, "appContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&a7->var0[4];
  v21[0] = *(_OWORD *)a7->var0;
  v21[1] = v20;
  objc_msgSend(v19, "performAction:options:reportingProgress:delegate:auditToken:completionHandler:", v18, v17, v16, v15, v21, v14);

}

- (LNAppContext)appContext
{
  return self->_appContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
}

@end
