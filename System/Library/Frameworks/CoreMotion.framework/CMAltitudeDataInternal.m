@implementation CMAltitudeDataInternal

- (void)setAltitude:(float)a3 andPressure:(float)a4
{
  self->fAltitude = a3;
  self->fPressure = a4;
}

- (CMAltitudeDataInternal)initWithAltitude:(float)a3 andPressure:(float)a4
{
  CMAltitudeDataInternal *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CMAltitudeDataInternal *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMAltitudeDataInternal;
  v6 = -[CMAltitudeDataInternal init](&v15, sel_init);
  v13 = v6;
  if (v6)
  {
    *(float *)&v11 = a3;
    *(float *)&v12 = a4;
    objc_msgSend_setAltitude_andPressure_(v6, v7, v8, v9, v10, v11, v12);
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (result)
  {
    *((_DWORD *)result + 2) = LODWORD(self->fAltitude);
    *((_DWORD *)result + 3) = LODWORD(self->fPressure);
  }
  return result;
}

@end
