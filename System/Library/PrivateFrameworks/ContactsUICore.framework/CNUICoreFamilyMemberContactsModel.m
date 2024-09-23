@implementation CNUICoreFamilyMemberContactsModel

- (CNUICoreFamilyMemberContactsModel)init
{
  CNUICoreFamilyMemberContactsModel *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsModel)initWithItems:(id)a3
{
  id v5;
  NSObject *v6;
  CNUICoreFamilyMemberContactsModel *v7;
  CNUICoreFamilyMemberContactsModel *v8;
  CNUICoreFamilyMemberContactsModel *v9;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_10 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_10, &__block_literal_global_35);
    v6 = CNGuardOSLog_cn_once_object_0_10;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_10, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyMemberContactsModel initWithItems:].cold.1(v6);
  }
  v11.receiver = self;
  v11.super_class = (Class)CNUICoreFamilyMemberContactsModel;
  v7 = -[CNUICoreFamilyMemberContactsModel init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_items, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUICoreFamilyMemberContactsModel)initWithCoder:(id)a3
{
  id v4;
  CNUICoreFamilyMemberContactsModel *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *items;
  CNUICoreFamilyMemberContactsModel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreFamilyMemberContactsModel;
  v5 = -[CNUICoreFamilyMemberContactsModel init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("_items"));
}

- (BOOL)isEqual:(id)a3
{
  CNUICoreFamilyMemberContactsModel *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (CNUICoreFamilyMemberContactsModel *)a3;
  v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v5 = (unint64_t)-[CNUICoreFamilyMemberContactsModel items](self, "items"),
          v6 = (unint64_t)-[CNUICoreFamilyMemberContactsModel items](v4, "items"),
          v5 | v6)
      && !objc_msgSend((id)v5, "isEqual:", v6))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreFamilyMemberContactsModel items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "arrayHash:", v3) + 527;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyMemberContactsModel items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("items"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)initWithItems:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD140000, log, OS_LOG_TYPE_FAULT, "parameter ‘items’ must be nonnull", v1, 2u);
}

@end
