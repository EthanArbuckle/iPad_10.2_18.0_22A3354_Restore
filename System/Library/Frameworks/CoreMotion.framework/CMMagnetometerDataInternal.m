@implementation CMMagnetometerDataInternal

- (void)setMagneticField:(id)a3
{
  self->fMagneticField = ($393C16A032292777F0C3725FFB2C0008)a3;
}

- (CMMagnetometerDataInternal)initWithMagneticField:(id)a3
{
  float var2;
  float var1;
  float var0;
  CMMagnetometerDataInternal *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  CMMagnetometerDataInternal *v14;
  objc_super v16;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v16.receiver = self;
  v16.super_class = (Class)CMMagnetometerDataInternal;
  v6 = -[CMMagnetometerDataInternal init](&v16, sel_init);
  v14 = v6;
  if (v6)
  {
    *(float *)&v11 = var0;
    *(float *)&v12 = var1;
    *(float *)&v13 = var2;
    objc_msgSend_setMagneticField_(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return v14;
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
  uint64_t v15;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  result = (id)objc_msgSend_init(v9, v10, v11, v12, v13);
  if (result)
  {
    v15 = *(_QWORD *)&self->fMagneticField.x;
    *((_DWORD *)result + 4) = LODWORD(self->fMagneticField.z);
    *((_QWORD *)result + 1) = v15;
  }
  return result;
}

@end
