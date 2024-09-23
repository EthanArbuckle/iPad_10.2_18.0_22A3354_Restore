@implementation ABParameterLimits

+ (id)unlimited
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__ABParameterLimits_unlimited__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (unlimited_onceToken != -1)
    dispatch_once(&unlimited_onceToken, block);
  return (id)unlimited_unlimited;
}

void __30__ABParameterLimits_unlimited__block_invoke(uint64_t a1)
{
  char *v1;
  void *v2;
  objc_super v3;

  v1 = (char *)objc_alloc(*(Class *)(a1 + 32));
  if (v1)
  {
    v3.receiver = v1;
    v3.super_class = (Class)ABParameterLimits;
    v1 = (char *)objc_msgSendSuper2(&v3, sel_init);
    if (v1)
      *(_OWORD *)(v1 + 8) = xmmword_235E80B00;
  }
  v2 = (void *)unlimited_unlimited;
  unlimited_unlimited = (uint64_t)v1;

}

@end
