@implementation CNUICoreFamilyInfo

- (CNUICoreFamilyInfo)init
{
  CNUICoreFamilyInfo *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyInfo)initWithMeContact:(id)a3 elements:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  CNUICoreFamilyInfo *v10;
  CNUICoreFamilyInfo *v11;
  CNUICoreFamilyInfo *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0_21 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_21, &__block_literal_global_70);
    v9 = CNGuardOSLog_cn_once_object_0_21;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_21, OS_LOG_TYPE_FAULT))
      -[CNUICoreFamilyInfo initWithMeContact:elements:].cold.1(v9);
  }
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreFamilyInfo;
  v10 = -[CNUICoreFamilyInfo init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_meContact, a3);
    objc_storeStrong((id *)&v11->_elements, a4);
    v12 = v11;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreFamilyInfo meContact](self, "meContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("meContact"));

  -[CNUICoreFamilyInfo elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("elements"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

- (void)initWithMeContact:(os_log_t)log elements:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD140000, log, OS_LOG_TYPE_FAULT, "parameter ‘elements’ must be nonnull", v1, 2u);
}

@end
