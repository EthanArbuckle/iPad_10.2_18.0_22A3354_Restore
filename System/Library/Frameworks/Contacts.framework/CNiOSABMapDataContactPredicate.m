@implementation CNiOSABMapDataContactPredicate

- (CNiOSABMapDataContactPredicate)initWithString:(id)a3
{
  id v4;
  CNiOSABMapDataContactPredicate *v5;
  uint64_t v6;
  NSString *mapString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABMapDataContactPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mapString = v5->_mapString;
    v5->_mapString = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABMapDataContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABMapDataContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *mapString;
  CNiOSABMapDataContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABMapDataContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_mapString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    mapString = v5->_mapString;
    v5->_mapString = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABMapDataContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mapString, CFSTR("_mapString"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFArray *v13;
  void *values;

  -[CNiOSABMapDataContactPredicate mapString](self, "mapString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[CNiOSABMapDataContactPredicate mapString](self, "mapString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)ABAddressBookCopyPersonMatchingMapData();

    values = v12;
    if (v12)
    {
      v13 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      CFRelease(values);
    }
    else
    {
      return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    }
  }
  else if (a7)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v13 = 0;
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v13;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactMatchingMapString:]"));
  -[CNiOSABMapDataContactPredicate mapString](self, "mapString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("mapString"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)mapString
{
  return self->_mapString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapString, 0);
}

@end
