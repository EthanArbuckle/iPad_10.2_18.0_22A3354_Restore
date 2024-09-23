@implementation GEOConfigProxy

void ___GEOConfigProxy_block_invoke()
{
  objc_class *v0;
  id v1;
  void *v2;

  v0 = (objc_class *)qword_1ECDBBA68;
  if (!qword_1ECDBBA68)
  {
    v0 = (objc_class *)objc_opt_class();
    qword_1ECDBBA68 = (uint64_t)v0;
  }
  v1 = objc_alloc_init(v0);
  v2 = (void *)qword_1ECDBBA70;
  qword_1ECDBBA70 = (uint64_t)v1;

}

@end
