@implementation BNPostingContext

- (BNPostingContext)initWithPresentable:(id)a3 presentationOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v10;
  id v11;
  BNPostingContext *v12;
  BNPostingContext *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableQueue.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentable"));

  }
  v16.receiver = self;
  v16.super_class = (Class)BNPostingContext;
  v12 = -[BNPostingContext init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_presentable, a3);
    v13->_presentationOptions = a4;
    objc_storeStrong((id *)&v13->_userInfo, a5);
  }

  return v13;
}

- (NSUUID)pendingIdentifier
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[NSDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("BNPresentableQueueUserInfoUniquePendingIdentifierKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return (NSUUID *)v6;
}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
}

@end
