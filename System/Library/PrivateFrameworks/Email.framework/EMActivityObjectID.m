@implementation EMActivityObjectID

id __38__EMActivityObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)EMActivityObjectID;
  return objc_msgSendSuper2(&v3, sel_encodeWithCoder_, v1);
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (EMActivityObjectID)initWithCoder:(id)a3
{
  EMActivityObjectID *v4;
  id v5;
  EMActivityObjectID *v6;
  id v8;
  EMActivityObjectID *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (EMActivityObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (EMActivityObjectID)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMActivityObjectID;
  return (EMActivityObjectID *)-[EMObjectID initAsEphemeralID:](&v3, sel_initAsEphemeralID_, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __36__EMActivityObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  objc_super v5;

  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = v2;
  v5.super_class = (Class)EMActivityObjectID;
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, v3);
}

@end
