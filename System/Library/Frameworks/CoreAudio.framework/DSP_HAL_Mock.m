@implementation DSP_HAL_Mock

+ (void)setTestHooks:(void *)a3
{
  gMockTestHooks = (uint64_t)a3;
}

+ (BOOL)hasTestHooks
{
  return gMockTestHooks != 0;
}

+ (unsigned)mockDSPPropertyCooldownMilliseconds
{
  return 2000;
}

- (id)createFactory:(int)a3
{
  uint64_t v3;
  DSP_HAL_Mock_Factory *v4;
  DSP_HAL_Bypass *v5;
  DSP_HAL_Bypass *v6;
  uint64_t v7;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    v4 = objc_alloc_init(DSP_HAL_Mock_Factory);
    -[DSP_HAL_Mock_Factory setFeatureFlag:](v4, "setFeatureFlag:", v3);
  }
  else
  {
    v5 = objc_alloc_init(DSP_HAL_Bypass);
    v6 = v5;
    if (v5)
    {
      -[DSP_HAL_Bypass createFactory](v5, "createFactory");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    v4 = (DSP_HAL_Mock_Factory *)v7;
  }
  return v4;
}

@end
