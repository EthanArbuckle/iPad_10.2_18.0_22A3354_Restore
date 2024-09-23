@implementation ATXRootOfAppData

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXRootOfAppData;
  return -[ATXRootOfAppData init](&v3, sel_init);
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  unint64_t result;

  result = (unint64_t)a3;
  __break(1u);
  return result;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  id v5;
  unint64_t result;

  v5 = a3;
  result = (unint64_t)a4;
  __break(1u);
  return result;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (unint64_t)docFreqForBundleId:(id)a3 withAction:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a4;
  objc_msgSend(CFSTR("DocFreq_"), "stringByAppendingString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXRootOfAppData sessionCountForBundleId:firstAction:](self, "sessionCountForBundleId:firstAction:", v7, v6);

  return v8;
}

- (void)recordDocFreqWithBundleId:(id)a3 hasAction:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(CFSTR("DocFreq_"), "stringByAppendingString:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXRootOfAppData recordSessionWithBundleId:firstAction:](self, "recordSessionWithBundleId:firstAction:", v7, v6);

}

@end
