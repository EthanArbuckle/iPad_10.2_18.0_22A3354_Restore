@implementation _HKCompoundFilter(_HKBuilders)

- (id)builder_filterWithDataTypes:()_HKBuilders
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "subfilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62___HKCompoundFilter__HKBuilders__builder_filterWithDataTypes___block_invoke;
  v10[3] = &unk_1E6D0C0F8;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "hk_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F30]), "initWithType:subfilters:", objc_msgSend(a1, "compoundPredicateType"), v7);
  return v8;
}

@end
