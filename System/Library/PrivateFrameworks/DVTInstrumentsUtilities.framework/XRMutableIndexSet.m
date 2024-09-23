@implementation XRMutableIndexSet

- (void)addIndex:(unint64_t)a3
{
  XRIndexSetImpl<unsigned long long, 4, std::allocator<xray::internal::RangeImp<unsigned long long>>> *p_impl;
  __int128 v5;

  p_impl = &self->super._impl;
  *(_QWORD *)&v5 = a3;
  *((_QWORD *)&v5 + 1) = a3;
  sub_2263547C0((uint64_t)&self->super._impl, &v5);
  self->super._impl._cacheIsValid = 0;
  sub_22635398C((uint64_t)p_impl);
}

- (void)addIndexesInRange:(_XRIndexRange)a3
{
  XRIndexSetImpl<unsigned long long, 4, std::allocator<xray::internal::RangeImp<unsigned long long>>> *p_impl;
  __int128 v5;

  p_impl = &self->super._impl;
  if (a3.var1)
  {
    *(_QWORD *)&v5 = a3.var0;
    *((_QWORD *)&v5 + 1) = a3.var0 + a3.var1 - 1;
    sub_2263547C0((uint64_t)&self->super._impl, &v5);
    self->super._impl._cacheIsValid = 0;
  }
  sub_22635398C((uint64_t)p_impl);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_new();
  v5 = sub_226353B00(v4, self);
  return v4;
}

@end
