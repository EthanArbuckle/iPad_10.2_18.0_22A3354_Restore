@implementation CNUICoreContactRelationshipsFilter

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_13 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_13, &__block_literal_global_42);
    v5 = CNGuardOSLog_cn_once_object_0_13;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_13, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactRelationshipsFilter contactByFilteringOutPropertyValueOfContact:].cold.1(v5);
  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[CNUICoreContactRelationshipsFilter filterPropertyValuesFromContact:](self, "filterPropertyValuesFromContact:", v6);

  return v6;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
  objc_msgSend(a3, "setContactRelations:", MEMORY[0x1E0C9AA60]);
}

- (NSString)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)contactByFilteringOutPropertyValueOfContact:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD140000, log, OS_LOG_TYPE_FAULT, "parameter ‘contact’ must be nonnull", v1, 2u);
}

@end
