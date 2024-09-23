@implementation CNUICoreContactAggregateValueFilter

- (CNUICoreContactAggregateValueFilter)init
{
  CNUICoreContactAggregateValueFilter *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactAggregateValueFilter)initWithValueFilters:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CNUICoreContactAggregateValueFilter *v14;
  CNUICoreContactAggregateValueFilter *v15;
  CNUICoreContactAggregateValueFilter *v16;
  objc_super v18;

  v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
    v6 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactAggregateValueFilter initWithValueFilters:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v18.receiver = self;
  v18.super_class = (Class)CNUICoreContactAggregateValueFilter;
  v14 = -[CNUICoreContactAggregateValueFilter init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_valueFilters, a3);
    v16 = v15;
  }

  return v15;
}

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
    v5 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
      -[CNUICoreContactAggregateValueFilter contactByFilteringOutPropertyValueOfContact:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  -[CNUICoreContactAggregateValueFilter filterPropertyValuesFromContact:](self, "filterPropertyValuesFromContact:", v13);

  return v13;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CNUICoreContactAggregateValueFilter valueFilters](self, "valueFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CNUICoreContactAggregateValueFilter_filterPropertyValuesFromContact___block_invoke;
  v7[3] = &unk_1EA602E90;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_each:", v7);

}

uint64_t __71__CNUICoreContactAggregateValueFilter_filterPropertyValuesFromContact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "filterPropertyValuesFromContact:", *(_QWORD *)(a1 + 32));
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactAggregateValueFilter valueFilters](self, "valueFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("valueFilters"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)valueFilters
{
  return self->_valueFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFilters, 0);
}

- (void)initWithValueFilters:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘valueFilters’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)contactByFilteringOutPropertyValueOfContact:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DD140000, a1, a3, "parameter ‘contact’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
