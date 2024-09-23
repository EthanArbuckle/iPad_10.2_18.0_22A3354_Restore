@implementation FPInFlightDrawableLifetime

- (void)dealloc
{
  unint64_t v2;
  objc_super v3;

  do
    v2 = __ldaxr(&gFPInFlightDrawableLifetimeCount);
  while (__stlxr(v2 - 1, &gFPInFlightDrawableLifetimeCount));
  v3.receiver = self;
  v3.super_class = (Class)FPInFlightDrawableLifetime;
  -[FPInFlightDrawableLifetime dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedCommandBuffers, 0);
}

@end
