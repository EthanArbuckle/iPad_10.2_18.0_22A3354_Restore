@implementation DRSTaskingEventSubscriber

- (DRSTaskingEventSubscriber)initWithTeamID:(id)a3 token:(unint64_t)a4
{
  id v7;
  DRSTaskingEventSubscriber *v8;
  DRSTaskingEventSubscriber *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DRSTaskingEventSubscriber;
  v8 = -[DRSTaskingEventSubscriber init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_teamID, a3);
    v9->_token = a4;
    DPLogHandle_ServiceEventPublisher();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2048;
      v16 = a4;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventSubscriberInit", "TeamID: %{public}@ token: %#llx", buf, 0x16u);
    }

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ServiceEventPublisher();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    -[DRSTaskingEventSubscriber teamID](self, "teamID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v7 = v4;
    v8 = 2048;
    v9 = -[DRSTaskingEventSubscriber token](self, "token");
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventSubscriberDealloc", "TeamID: %{public}@ token: %#llx", buf, 0x16u);

  }
  v5.receiver = self;
  v5.super_class = (Class)DRSTaskingEventSubscriber;
  -[DRSTaskingEventSubscriber dealloc](&v5, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  DRSTaskingEventSubscriber *v4;
  DRSTaskingEventSubscriber *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (DRSTaskingEventSubscriber *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DRSTaskingEventSubscriber token](self, "token");
      if (v6 == -[DRSTaskingEventSubscriber token](v5, "token"))
      {
        -[DRSTaskingEventSubscriber teamID](self, "teamID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[DRSTaskingEventSubscriber teamID](v5, "teamID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)token
{
  return self->_token;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
}

@end
