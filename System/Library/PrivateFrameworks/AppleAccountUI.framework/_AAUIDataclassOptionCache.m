@implementation _AAUIDataclassOptionCache

- (_AAUIDataclassOptionCache)initWithDataclassOptions:(id)a3
{
  id v4;
  _AAUIDataclassOptionCache *v5;
  uint64_t v6;
  NSDictionary *dataclassOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AAUIDataclassOptionCache;
  v5 = -[_AAUIDataclassOptionCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dataclassOptions = v5->_dataclassOptions;
    v5->_dataclassOptions = (NSDictionary *)v6;

  }
  return v5;
}

- (void)setDataclassOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *dataclassOptions;
  NSArray *filteredDataclasses;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  dataclassOptions = self->_dataclassOptions;
  self->_dataclassOptions = v4;

  filteredDataclasses = self->_filteredDataclasses;
  self->_filteredDataclasses = 0;

}

- (NSArray)filteredDataclasses
{
  NSArray *filteredDataclasses;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[5];

  filteredDataclasses = self->_filteredDataclasses;
  if (!filteredDataclasses)
  {
    -[NSDictionary aaf_filter:](self->_dataclassOptions, "aaf_filter:", &__block_literal_global_12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48___AAUIDataclassOptionCache_filteredDataclasses__block_invoke_2;
    v9[3] = &unk_1EA2DC8E0;
    v9[4] = self;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v9);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_filteredDataclasses;
    self->_filteredDataclasses = v6;

    filteredDataclasses = self->_filteredDataclasses;
  }
  return filteredDataclasses;
}

- (NSDictionary)dataclassDetails
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *dataclassDetails;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self->_dataclassDetails)
  {
    v4 = *MEMORY[0x1E0C8EE90];
    -[NSDictionary objectForKeyedSubscript:](self->_dataclassOptions, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EE90]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = +[_AAUIDataclassOptionCache _hasPrescriptionEnrollment](_AAUIDataclassOptionCache, "_hasPrescriptionEnrollment");

      if (v7)
      {
        v12 = v4;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_HEALTH_ROW_DETAIL_TEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
        v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        dataclassDetails = self->_dataclassDetails;
        self->_dataclassDetails = v10;

      }
    }
  }
  return self->_dataclassDetails;
}

+ (BOOL)_hasPrescriptionEnrollment
{
  if (_hasPrescriptionEnrollment_onceToken != -1)
    dispatch_once(&_hasPrescriptionEnrollment_onceToken, &__block_literal_global_34);
  return 0;
}

- (NSDictionary)dataclassOptions
{
  return self->_dataclassOptions;
}

- (void)setFilteredDataclasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDataclassDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclassDetails, 0);
  objc_storeStrong((id *)&self->_filteredDataclasses, 0);
  objc_storeStrong((id *)&self->_dataclassOptions, 0);
}

@end
