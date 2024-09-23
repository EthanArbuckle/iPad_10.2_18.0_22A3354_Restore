@implementation LNUniqueQueryRequestType

- (LNUniqueQueryRequestType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNUniqueQueryRequestType;
  return (LNUniqueQueryRequestType *)-[LNQueryRequestTypeBase _init](&v3, sel__init);
}

- (id)description
{
  return CFSTR("UniqueQuery");
}

- (LNUniqueQueryRequestType)initWithCoder:(id)a3
{
  LNUniqueQueryRequestType *v4;

  objc_msgSend((id)objc_opt_class(), "queryRequest");
  v4 = (LNUniqueQueryRequestType *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNUniqueQueryRequestType description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (id)queryRequest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__LNUniqueQueryRequestType_queryRequest__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (queryRequest_onceToken != -1)
    dispatch_once(&queryRequest_onceToken, block);
  return (id)queryRequest_instance;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __40__LNUniqueQueryRequestType_queryRequest__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)queryRequest_instance;
  queryRequest_instance = (uint64_t)v1;

}

@end
