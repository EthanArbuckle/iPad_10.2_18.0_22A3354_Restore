@implementation CNiOSABEKParticipantPredicate

- (CNiOSABEKParticipantPredicate)initWithName:(id)a3 URL:(id)a4 emailAddress:(id)a5 customDescription:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNiOSABEKParticipantPredicate *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  NSURL *URL;
  uint64_t v19;
  NSString *emailAddress;
  uint64_t v21;
  NSString *customDescription;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSABEKParticipantPredicate;
  v14 = -[CNPredicate init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    URL = v14->_URL;
    v14->_URL = (NSURL *)v17;

    v19 = objc_msgSend(v12, "copy");
    emailAddress = v14->_emailAddress;
    v14->_emailAddress = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    customDescription = v14->_customDescription;
    v14->_customDescription = (NSString *)v21;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABEKParticipantPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABEKParticipantPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *emailAddress;
  void *v12;
  uint64_t v13;
  NSString *customDescription;
  void *v15;
  uint64_t v16;
  NSURL *URL;
  CNiOSABEKParticipantPredicate *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABEKParticipantPredicate;
  v5 = -[CNPredicate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_emailAddress"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_customDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    customDescription = v5->_customDescription;
    v5->_customDescription = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_URL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABEKParticipantPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, CFSTR("_emailAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_customDescription, CFSTR("_customDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL, CFSTR("_URL"));

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSABEKParticipantPredicate customDescription](self, "customDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNiOSABEKParticipantPredicate customDescription](self, "customDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), v5);

  }
  else
  {
    v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactMatchingEKParticipantWithName:emailAddress:URL:predicateDescription:]"));
  }
  -[CNiOSABEKParticipantPredicate name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v8);

  -[CNiOSABEKParticipantPredicate URL](self, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("URL"), v10);

  -[CNiOSABEKParticipantPredicate emailAddress](self, "emailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("emailAddress"), v12);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
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
  __CFArray *v7;
  __CFString *v9;
  const void *PersonMatchingEmailAddress;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *values;

  v7 = (__CFArray *)a3;
  values = 0;
  if (a3)
  {
    -[CNiOSABEKParticipantPredicate emailAddress](self, "emailAddress", a3, a4, a5, a6, a7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v9, "length"))
    {
      if (CFStringFind(v9, CFSTR("@"), 0).location != -1)
      {
        PersonMatchingEmailAddress = (const void *)ABAddressBookFindPersonMatchingEmailAddress();
        if (PersonMatchingEmailAddress)
        {
          values = (void *)CFRetain(PersonMatchingEmailAddress);
          if (values)
            goto LABEL_10;
        }
      }
    }
    -[CNiOSABEKParticipantPredicate URL](self, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[CNiOSABEKParticipantPredicate URL](self, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      values = (void *)CNiOSABEKParticipantMatchingCopyPersonByURL((uint64_t)v7, v12);

      if (values)
        goto LABEL_10;
    }
    -[CNiOSABEKParticipantPredicate name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13
      && (-[CNiOSABEKParticipantPredicate name](self, "name"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          values = (void *)CNiOSABEKParticipantMatchingCopyPersonByName((uint64_t)v7, (uint64_t)v14),
          v14,
          values))
    {
LABEL_10:
      v7 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      CFRelease(values);
      values = 0;
    }
    else
    {
      v7 = CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
    }

  }
  return v7;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)customDescription
{
  return self->_customDescription;
}

- (void)setCustomDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDescription, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
