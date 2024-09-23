@implementation HKSampleListDataProviderFilter

- (HKSampleListDataProviderFilter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSampleListDataProviderFilter)initWithPredicate:(id)a3 dataTypes:(id)a4
{
  id v6;
  id v7;
  HKSampleListDataProviderFilter *v8;
  uint64_t v9;
  _HKFilter *filter;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSampleListDataProviderFilter;
  v8 = -[HKSampleListDataProviderFilter init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "hk_filterRepresentationForDataTypes:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    filter = v8->_filter;
    v8->_filter = (_HKFilter *)v9;

  }
  return v8;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return -[_HKFilter acceptsDataObject:](self->_filter, "acceptsDataObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
