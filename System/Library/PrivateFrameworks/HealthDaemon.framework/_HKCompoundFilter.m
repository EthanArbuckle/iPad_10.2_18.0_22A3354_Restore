@implementation _HKCompoundFilter

- (id)_filterByApplyingTransformationToSubfilters:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "subfilters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79___HKCompoundFilter_HealthDaemon___filterByApplyingTransformationToSubfilters___block_invoke;
    v7[3] = &unk_1E6CF7668;
    v8 = v3;
    objc_msgSend(v4, "hk_map:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F30]), "initWithType:subfilters:", objc_msgSend(a1, "compoundPredicateType"), v5);
  }

  return a1;
}

@end
