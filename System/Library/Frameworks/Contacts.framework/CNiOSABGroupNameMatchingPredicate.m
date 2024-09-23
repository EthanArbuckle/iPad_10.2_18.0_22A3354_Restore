@implementation CNiOSABGroupNameMatchingPredicate

- (CNiOSABGroupNameMatchingPredicate)initWithName:(id)a3
{
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  CNiOSABGroupNameMatchingPredicate *v10;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v4 = (const __CFString *)a3;
  v5 = (__CFString *)v4;
  v6 = (void *)MEMORY[0x1E0CB3880];
  if (v4)
    v7 = v4;
  else
    v7 = &stru_1E29FF900;
  objc_msgSend(CFSTR("*"), "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("name LIKE[cd] %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  v10 = -[CNPredicate initWithPredicate:](&v14, sel_initWithPredicate_, v9);

  if (v10)
  {
    v11 = -[__CFString copy](v5, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupNameMatchingPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABGroupNameMatchingPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  CNiOSABGroupNameMatchingPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupNameMatchingPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("_name"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v7;
  void *v8;
  __CFArray *Mutable;
  const __CFArray *v10;
  const __CFArray *v11;
  void *v12;
  void *v13;
  void *v14;
  CFIndex v15;
  ABPropertyID v16;
  const void *ValueAtIndex;
  CFTypeRef v18;
  CFTypeRef v19;

  v7 = *MEMORY[0x1E0D13848];
  -[CNiOSABGroupNameMatchingPredicate name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((_DWORD)v7)
  {
    if (!a4)
      return 0;
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    Mutable = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return Mutable;
  }
  v10 = ABAddressBookCopyArrayOfAllGroups(a3);
  if (v10)
  {
    v11 = v10;
    if (CFArrayGetCount(v10))
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      v12 = (void *)objc_opt_class();
      -[CNiOSABGroupNameMatchingPredicate name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tokenizeString:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (CFArrayGetCount(v11) >= 1)
      {
        v15 = 0;
        v16 = *MEMORY[0x1E0CF5E88];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v11, v15);
          v18 = ABRecordCopyValue(ValueAtIndex, v16);
          if (v18)
            v19 = CFAutorelease(v18);
          else
            v19 = 0;
          if (-[CNiOSABGroupNameMatchingPredicate groupName:matchesSearchTokens:](self, "groupName:matchesSearchTokens:", v19, v14))
          {
            CFArrayAppendValue(Mutable, ValueAtIndex);
          }
          ++v15;
        }
        while (v15 < CFArrayGetCount(v11));
      }
      CFRelease(v11);

      return Mutable;
    }
    CFRelease(v11);
  }
  return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
}

- (BOOL)groupName:(id)a3 matchesSearchTokens:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "tokenizeString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke;
  v10[3] = &unk_1E29F9198;
  v11 = v7;
  v8 = v7;
  LOBYTE(v7) = objc_msgSend(v5, "_cn_all:", v10);

  return (char)v7;
}

uint64_t __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke_2;
  v8[3] = &unk_1E29F9198;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __67__CNiOSABGroupNameMatchingPredicate_groupName_matchesSearchTokens___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_hasPrefix:", *(_QWORD *)(a1 + 32));
}

+ (id)tokenizeString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "groupNameTokenizingCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_cn_filter:", *MEMORY[0x1E0D13850]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)groupNameTokenizingCharacterSet
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeCharactersInString:", CFSTR("@"));
  return v4;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNGroup predicateForGroupWithNameMatching:]"));
  -[CNiOSABGroupNameMatchingPredicate name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
