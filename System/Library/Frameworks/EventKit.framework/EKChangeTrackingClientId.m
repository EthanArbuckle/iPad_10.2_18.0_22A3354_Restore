@implementation EKChangeTrackingClientId

- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3
{
  return -[EKChangeTrackingClientId initWithCustomClientId:suffix:](self, "initWithCustomClientId:suffix:", a3, 0);
}

- (EKChangeTrackingClientId)initWithSuffix:(id)a3
{
  return -[EKChangeTrackingClientId initWithCustomClientId:suffix:](self, "initWithCustomClientId:suffix:", 0, a3);
}

- (EKChangeTrackingClientId)init
{
  return -[EKChangeTrackingClientId initWithCustomClientId:suffix:](self, "initWithCustomClientId:suffix:", 0, 0);
}

- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3 suffix:(id)a4
{
  id v6;
  id v7;
  EKChangeTrackingClientId *v8;
  uint64_t v9;
  NSString *customClientId;
  uint64_t v11;
  NSString *suffix;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKChangeTrackingClientId;
  v8 = -[EKChangeTrackingClientId init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    customClientId = v8->_customClientId;
    v8->_customClientId = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    suffix = v8->_suffix;
    v8->_suffix = (NSString *)v11;

  }
  return v8;
}

- (CADChangeTrackingClientId)CADChangeTrackingClientId
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  -[EKChangeTrackingClientId customClientId](self, "customClientId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D0A048]);
    -[EKChangeTrackingClientId customClientId](self, "customClientId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithCustomClientId:", v5);
  }
  else
  {
    -[EKChangeTrackingClientId suffix](self, "suffix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D0A048]);
      return (CADChangeTrackingClientId *)v9;
    }
    v8 = objc_alloc(MEMORY[0x1E0D0A048]);
    -[EKChangeTrackingClientId suffix](self, "suffix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "initWithSuffix:", v5);
  }
  v9 = (id)v6;

  return (CADChangeTrackingClientId *)v9;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSString)customClientId
{
  return self->_customClientId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customClientId, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

@end
