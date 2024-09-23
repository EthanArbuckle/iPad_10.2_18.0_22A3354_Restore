@implementation HFChildServiceFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServiceTypes, 0);
}

- (HFChildServiceFilter)initWithChildServiceTypes:(id)a3
{
  id v4;
  HFChildServiceFilter *v5;
  uint64_t v6;
  NSSet *childServiceTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFChildServiceFilter;
  v5 = -[HFChildServiceFilter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    childServiceTypes = v5->_childServiceTypes;
    v5->_childServiceTypes = (NSSet *)v6;

  }
  return v5;
}

- (id)filteredChildServicesForParentService:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "hf_childServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HFChildServiceFilter_filteredChildServicesForParentService___block_invoke;
  v7[3] = &unk_1EA7283A0;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __62__HFChildServiceFilter_filteredChildServicesForParentService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "childServiceTypes");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_3;
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "childServiceTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (!v8)
    v9 = 0;
  else
LABEL_3:
    v9 = objc_msgSend(v3, "configurationState") != 2;

  return v9;
}

- (NSSet)childServiceTypes
{
  return self->_childServiceTypes;
}

@end
