@implementation MOSuggestionAttachment

- (MOSuggestionAttachment)initWithProvider:(id)a3
{
  id v5;
  MOSuggestionAttachment *v6;
  MOSuggestionAttachment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionAttachment;
  v6 = -[MOSuggestionAttachment init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemProvider, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  _mo_log_facility_get_os_log(MOLogFacilityUIService);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOSuggestionAttachment encodeWithCoder:].cold.1();

  objc_msgSend(v4, "encodeObject:forKey:", self->_itemProvider, CFSTR("provider"));
}

- (MOSuggestionAttachment)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAttachment *v5;
  uint64_t v6;
  NSItemProvider *itemProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionAttachment;
  v5 = -[MOSuggestionAttachment init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemProvider = v5->_itemProvider;
    v5->_itemProvider = (NSItemProvider *)v6;

  }
  return v5;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, v0, v1, "encoding _itemProvider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
