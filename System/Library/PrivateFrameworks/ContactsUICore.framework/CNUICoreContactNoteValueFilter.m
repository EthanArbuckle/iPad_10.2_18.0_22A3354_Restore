@implementation CNUICoreContactNoteValueFilter

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_22 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_22, &__block_literal_global_72);
    v5 = CNGuardOSLog_cn_once_object_0_22;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_22, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactRelationshipsFilter contactByFilteringOutPropertyValueOfContact:].cold.1(v5);
  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[CNUICoreContactNoteValueFilter filterPropertyValuesFromContact:](self, "filterPropertyValuesFromContact:", v6);

  return v6;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
  objc_msgSend(a3, "setNote:", &stru_1EA606688);
}

- (NSString)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
