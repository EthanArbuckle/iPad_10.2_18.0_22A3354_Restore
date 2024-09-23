@implementation FTServerBag

+ (id)sharedInstance
{
  return (id)objc_msgSend_sharedInstanceForBagType_(FTServerBag, a2, 0);
}

+ (id)_sharedInstanceForType:(int64_t)a3
{
  id v3;
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  FTServerBag *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  if (a3 <= 1)
  {
    v5 = a1;
    objc_sync_enter(v5);
    v8 = qword_1ECF9D790[a3];
    if (v8)
    {
      if ((objc_msgSend_isLoaded(v8, v6, v7) & 1) == 0)
        objc_msgSend_startBagLoad(qword_1ECF9D790[a3], v9, v10);
    }
    else
    {
      v11 = [FTServerBag alloc];
      v13 = objc_msgSend_initWithBagType_(v11, v12, a3);
      v14 = qword_1ECF9D790[a3];
      qword_1ECF9D790[a3] = (id)v13;

    }
    objc_sync_exit(v5);

    v3 = qword_1ECF9D790[a3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)_sharedInstance
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__sharedInstanceForType_, 0);
}

+ (id)sharedInstanceForBagType:(int64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel__sharedInstanceForType_, a3);
}

- (FTServerBag)initWithBagType:(int64_t)a3
{
  FTServerBag *v4;
  const char *v5;
  FTServerBag *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FTServerBag;
  v4 = -[FTServerBag init](&v9, sel_init);
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    v7 = (id)objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], v5, a3);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)FTServerBag;
  -[FTServerBag dealloc](&v6, sel_dealloc);
}

- (void)startBagLoad
{
  const char *v2;
  uint64_t v3;
  id v4;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startBagLoad(v4, v2, v3);

}

- (void)forceBagLoad
{
  const char *v2;
  uint64_t v3;
  id v4;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_forceBagLoad(v4, v2, v3);

}

- (BOOL)isLoading
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char isLoading;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isLoading = objc_msgSend_isLoading(v2, v3, v4);

  return isLoading;
}

- (BOOL)isLoaded
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char isLoaded;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isLoaded = objc_msgSend_isLoaded(v2, v3, v4);

  return isLoaded;
}

- (id)_cachedBag
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__cachedBag(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_bag
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__bag(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSURL)bagURL
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bagURL(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSString)apsEnvironmentName
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_apsEnvironmentName(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)allowSelfSignedCertificates
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_allowSelfSignedCertificates(v2, v3, v4);

  return v5;
}

- (BOOL)allowUnsignedBags
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_allowUnsignedBags(v2, v3, v4);

  return v5;
}

- (BOOL)isInDebilitatedMode
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char v5;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_isInDebilitatedMode(v2, v3, v4);

  return v5;
}

- (id)objectForKey:(id)a3
{
  void *v3;
  int64_t type;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D34E78];
  type = self->_type;
  v5 = a3;
  objc_msgSend_sharedInstanceForBagType_(v3, v6, type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)urlWithKey:(id)a3
{
  void *v3;
  int64_t type;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D34E78];
  type = self->_type;
  v5 = a3;
  objc_msgSend_sharedInstanceForBagType_(v3, v6, type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_urlWithKey_(v7, v8, (uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isServerAvailable
{
  void *v2;
  const char *v3;
  uint64_t v4;
  char isServerAvailable;

  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E0D34E78], a2, self->_type);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isServerAvailable = objc_msgSend_isServerAvailable(v2, v3, v4);

  return isServerAvailable;
}

@end
