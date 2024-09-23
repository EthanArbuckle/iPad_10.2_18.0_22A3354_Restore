@implementation HFEmptyLocalizableStringKey

- (HFEmptyLocalizableStringKey)init
{
  id v3;
  HFEmptyLocalizableStringKey *v4;
  objc_super v6;

  if (qword_1F03ED360 != -1)
    dispatch_once(&qword_1F03ED360, &__block_literal_global_88_0);
  v3 = (id)qword_1F03ED368;
  v6.receiver = self;
  v6.super_class = (Class)HFEmptyLocalizableStringKey;
  v4 = -[HFLocalizableStringKey initWithKey:argumentKeys:](&v6, sel_initWithKey_argumentKeys_, v3, 0);

  return v4;
}

void __35__HFEmptyLocalizableStringKey_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1F03ED368;
  qword_1F03ED368 = (uint64_t)&stru_1EA741FF8;

}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  return 0;
}

@end
