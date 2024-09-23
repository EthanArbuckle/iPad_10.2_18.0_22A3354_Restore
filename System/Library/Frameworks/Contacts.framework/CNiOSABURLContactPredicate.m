@implementation CNiOSABURLContactPredicate

- (CNiOSABURLContactPredicate)initWithURLString:(id)a3
{
  id v4;
  CNiOSABURLContactPredicate *v5;
  uint64_t v6;
  NSString *urlString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABURLContactPredicate;
  v5 = -[CNPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABURLContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABURLContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *urlString;
  CNiOSABURLContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABURLContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_urlString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABURLContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_urlString, CFSTR("_urlString"), v5.receiver, v5.super_class);

}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
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
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;

  v15 = 0;
  -[CNiOSABURLContactPredicate cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:](self, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:nserror:", a3, a4, a5, a6, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v11 = v8;
  }
  else if (a7)
  {
    v12 = objc_msgSend(v9, "code");
    objc_msgSend(v10, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v12, v13);
    *a7 = (__CFError *)objc_claimAutoreleasedReturnValue();

  }
  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  -[CNiOSABURLContactPredicate urlString](self, "urlString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CF5D90];
    -[CNiOSABURLContactPredicate urlString](self, "urlString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personPredicateWithValue:comparison:forProperty:addressBook:", v17, 0, *MEMORY[0x1E0CF6288], a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v26[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNiOSFetchExecution contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:](CNiOSFetchExecution, "contactsMatchingPredicates:sortOrdering:matchInfos:options:addressBook:environment:error:", v19, objc_msgSend(v12, "sortOrder"), a5, objc_msgSend(v12, "options"), a3, v13, a7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a7)
        *a7 = objc_retainAutorelease(v23);

      v20 = 0;
    }

  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a7)
      *a7 = objc_retainAutorelease(v21);

    v20 = 0;
  }

  return v20;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactMatchingURLString:]"));
  -[CNiOSABURLContactPredicate urlString](self, "urlString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("urlString"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
