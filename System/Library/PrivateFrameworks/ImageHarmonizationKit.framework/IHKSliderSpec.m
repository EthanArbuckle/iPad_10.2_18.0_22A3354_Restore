@implementation IHKSliderSpec

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_identity(self, a2, v2, v3, v4);
  v8 = v7;
  objc_msgSend_min(self, v9, v10, v11, v12);
  v14 = v13;
  objc_msgSend_max(self, v15, v16, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v6, v19, (uint64_t)CFSTR("<IHKSliderSpec identity: %.2f, min: %.2f, max:%.2f>"), v20, v21, v8, v14, v22);
}

- (void)_initWithMin:(double)a3 max:(double)a4 identity:(double)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_setMin_(self, a2, v5, v6, v7, a3);
  objc_msgSend_setMax_(self, v10, v11, v12, v13, a4);
  MEMORY[0x24BEDD108](self, sel_setIdentity_, v14, v15, v16);
}

- (IHKSliderSpec)init
{
  IHKSliderSpec *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  IHKSliderSpec *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IHKSliderSpec;
  v2 = -[IHKSliderSpec init](&v9, sel_init);
  v7 = v2;
  if (v2)
    objc_msgSend__initWithMin_max_identity_(v2, v3, v4, v5, v6, -1.0, 1.0, 0.0);
  return v7;
}

- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4
{
  IHKSliderSpec *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  IHKSliderSpec *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IHKSliderSpec;
  v6 = -[IHKSliderSpec init](&v13, sel_init);
  v11 = v6;
  if (v6)
    objc_msgSend__initWithMin_max_identity_(v6, v7, v8, v9, v10, a3, a4, 0.0);
  return v11;
}

- (IHKSliderSpec)initWithMin:(double)a3 max:(double)a4 identity:(double)a5
{
  IHKSliderSpec *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IHKSliderSpec *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)IHKSliderSpec;
  v8 = -[IHKSliderSpec init](&v15, sel_init);
  v13 = v8;
  if (v8)
    objc_msgSend__initWithMin_max_identity_(v8, v9, v10, v11, v12, a3, a4, a5);
  return v13;
}

- (double)toNormalizedRange:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;

  objc_msgSend_identity(self, a2, v3, v4, v5);
  if (v12 <= a3)
  {
    objc_msgSend_identity(self, v8, v9, v10, v11);
    v28 = a3 - v27;
    objc_msgSend_max(self, v29, v30, v31, v32);
    v34 = v33;
    objc_msgSend_identity(self, v35, v36, v37, v38);
    return v28 / (v34 - v39);
  }
  else
  {
    objc_msgSend_min(self, v8, v9, v10, v11);
    v14 = a3 - v13;
    objc_msgSend_identity(self, v15, v16, v17, v18);
    v20 = v19;
    objc_msgSend_min(self, v21, v22, v23, v24);
    return v14 / (v20 - v25) + -1.0;
  }
}

- (double)toNativeRange:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;

  if (a3 >= 0.0)
  {
    objc_msgSend_max(self, a2, v3, v4, v5);
    v9 = v19;
    objc_msgSend_identity(self, v20, v21, v22, v23);
  }
  else
  {
    objc_msgSend_identity(self, a2, v3, v4, v5);
    v9 = v8;
    objc_msgSend_min(self, v10, v11, v12, v13);
  }
  v24 = (v9 - v18) * a3;
  objc_msgSend_identity(self, v14, v15, v16, v17);
  return v25 + v24;
}

- (double)min
{
  return self->min;
}

- (void)setMin:(double)a3
{
  self->min = a3;
}

- (double)max
{
  return self->max;
}

- (void)setMax:(double)a3
{
  self->max = a3;
}

- (double)identity
{
  return self->identity;
}

- (void)setIdentity:(double)a3
{
  self->identity = a3;
}

@end
