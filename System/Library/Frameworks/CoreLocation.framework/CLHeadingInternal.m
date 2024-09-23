@implementation CLHeadingInternal

- (CLHeadingInternal)initWithClientHeading:(id *)a3
{
  CLHeadingInternal *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLHeadingInternal;
  result = -[CLHeadingInternal init](&v9, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->fHeading.z = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->fHeading.x = v5;
    v6 = *(_OWORD *)&a3->var4;
    v7 = *(_OWORD *)&a3->var6;
    v8 = *(_OWORD *)&a3->var8;
    *(_QWORD *)&result->fHeading.calibration = *(_QWORD *)&a3->var10;
    *(_OWORD *)&result->fHeading.magnitude = v8;
    *(_OWORD *)&result->fHeading.timestamp = v7;
    *(_OWORD *)&result->fHeading.trueHeading = v6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  _OWORD v14[5];
  uint64_t v15;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v9 = *(_OWORD *)&self->fHeading.timestamp;
  v14[2] = *(_OWORD *)&self->fHeading.trueHeading;
  v14[3] = v9;
  v14[4] = *(_OWORD *)&self->fHeading.magnitude;
  v15 = *(_QWORD *)&self->fHeading.calibration;
  v10 = *(_OWORD *)&self->fHeading.z;
  v14[0] = *(_OWORD *)&self->fHeading.x;
  v14[1] = v10;
  return (id)objc_msgSend_initWithClientHeading_(v8, v11, (uint64_t)v14, v12);
}

@end
