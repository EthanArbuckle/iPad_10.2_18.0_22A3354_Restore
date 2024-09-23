@implementation CNiOSABPreferredChannelContactPredicate

- (CNiOSABPreferredChannelContactPredicate)initWithPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  id v6;
  CNiOSABPreferredChannelContactPredicate *v7;
  uint64_t v8;
  NSString *preferredChannel;
  CNiOSABPreferredChannelContactPredicate *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  v7 = -[CNPredicate init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    preferredChannel = v7->_preferredChannel;
    v7->_preferredChannel = (NSString *)v8;

    v7->_limitOne = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredChannelContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABPreferredChannelContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *preferredChannel;
  CNiOSABPreferredChannelContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_preferredChannel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    preferredChannel = v5->_preferredChannel;
    v5->_preferredChannel = (NSString *)v7;

    v5->_limitOne = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_limitOne"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredChannel, CFSTR("_preferredChannel"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_limitOne, CFSTR("_limitOne"));

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
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9;
  id v10;
  CNiOSABPreferredChannelContactPredicate *v11;
  id v12;

  v9 = a4;
  v10 = a6;
  v11 = self;
  CNUnimplementedMethodException();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CF5D88];
  -[CNiOSABPreferredChannelContactPredicate preferredChannel](self, "preferredChannel", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForContactsMatchingPreferredChannel:limitOne:", v7, -[CNiOSABPreferredChannelContactPredicate limitOne](self, "limitOne"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForContactsMatchingPreferredChannel:]"));
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("limitOne"), -[CNiOSABPreferredChannelContactPredicate limitOne](self, "limitOne"));
  -[CNiOSABPreferredChannelContactPredicate preferredChannel](self, "preferredChannel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("preferredChannel"), v6 != 0);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)shortDebugDescription
{
  return CFSTR("PreferredChannelContactPredicate");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNiOSABPreferredChannelContactPredicate *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "preferredChannel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "preferredChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "limitOne"), objc_msgSend(*(id *)(a1 + 40), "limitOne"));
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "preferredChannel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "limitOne"));
}

- (NSString)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)limitOne
{
  return self->_limitOne;
}

- (void)setLimitOne:(BOOL)a3
{
  self->_limitOne = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredChannel, 0);
}

@end
