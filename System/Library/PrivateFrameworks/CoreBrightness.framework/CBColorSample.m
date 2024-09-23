@implementation CBColorSample

- (CBColorSample)init
{
  objc_super v3;
  SEL v4;
  CBColorSample *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBColorSample;
  v5 = -[CBColorSample init](&v3, sel_init);
  if (v5)
  {
    v5->_lux = -1.0;
    v5->_CCT = 0.0;
    v5->_XYZ.X = 0.0;
    v5->_XYZ.Y = 0.0;
    v5->_XYZ.Z = 0.0;
    v5->_xy.x = 0.0;
    v5->_xy.y = 0.0;
  }
  return v5;
}

- (CBColorSample)initWithTristimulus:(id)a3 illuminance:(double)a4 andTempterature:(double)a5
{
  double *v5;
  objc_super v7;
  double v8;
  double v9;
  SEL v10;
  char *v11;
  __int128 v12;
  double var2;

  *(double *)&v12 = a3.var0;
  *((_QWORD *)&v12 + 1) = *(_QWORD *)&a3.var1;
  var2 = a3.var2;
  v11 = (char *)self;
  v10 = a2;
  v9 = a4;
  v8 = a5;
  v7.receiver = self;
  v7.super_class = (Class)CBColorSample;
  v11 = -[CBColorSample init](&v7, sel_init);
  if (v11)
  {
    *((double *)v11 + 1) = v9;
    *((double *)v11 + 2) = v8;
    v5 = (double *)v11;
    *(_OWORD *)(v11 + 56) = v12;
    v5[9] = var2;
    objc_msgSend(v11, "fillInChromaticity");
  }
  return (CBColorSample *)v11;
}

- (CBColorSample)initWithChromaticity:(id)a3 illuminance:(double)a4 andTempterature:(double)a5
{
  objc_super v6;
  double v7;
  double v8;
  SEL v9;
  char *v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 v11;

  v11 = a3;
  v10 = (char *)self;
  v9 = a2;
  v8 = a4;
  v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBColorSample;
  v10 = -[CBColorSample init](&v6, sel_init);
  if (v10)
  {
    *((double *)v10 + 1) = v8;
    *((double *)v10 + 2) = v7;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v10 + 40) = v11;
    objc_msgSend(v10, "fillInTristimulus");
  }
  return (CBColorSample *)v10;
}

- (CBColorSample)initWithHIDEvent:(__IOHIDEvent *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *inited;
  NSObject *log;
  os_log_type_t type;
  NSObject *v14;
  objc_super v15;
  uint8_t v16[7];
  char v17;
  NSObject *v18;
  uint8_t v19[7];
  char v20;
  NSObject *v21;
  __IOHIDEvent *v22;
  SEL v23;
  CBColorSample *v24;

  v24 = self;
  v23 = a2;
  v22 = a3;
  if (IOHIDEventGetType() == 12)
  {
    if (IOHIDEventGetIntegerValue() == 1)
    {
      v15.receiver = v24;
      v15.super_class = (Class)CBColorSample;
      v24 = -[CBColorSample init](&v15, sel_init);
      if (v24)
      {
        IOHIDEventGetDoubleValue();
        v24->_lux = v3;
        IOHIDEventGetDoubleValue();
        v24->_CCT = v4;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.X = v5;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.Y = v6;
        IOHIDEventGetDoubleValue();
        v24->_XYZ.Z = v7;
        -[CBColorSample fillInChromaticity](v24, "fillInChromaticity");
      }
      return v24;
    }
    else
    {
      v18 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v18 = inited;
      v17 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        v9 = v18;
        v10 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1B5291000, v9, v10, "ERROR: unsupported color space", v16, 2u);
      }
      return 0;
    }
  }
  else
  {
    v21 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v14 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v14 = init_default_corebrightness_log();
    v21 = v14;
    v20 = 16;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      log = v21;
      type = v20;
      __os_log_helper_16_0_0(v19);
      _os_log_error_impl(&dword_1B5291000, log, type, "ERROR: not an ALS event", v19, 2u);
    }
    return 0;
  }
}

- (void)setXy:(id)a3
{
  self->_xy = ($69B62588CC25CB7767350DB9F5F34ADF)a3;
  -[CBColorSample fillInTristimulus](self, "fillInTristimulus", a2, self, *(_QWORD *)&a3.var0, *(_QWORD *)&a3.var1);
}

- (void)setXYZ:(id)a3
{
  self->_XYZ = ($2ECA4ECC36AE74DF8ED1D9484503D891)a3;
  -[CBColorSample fillInChromaticity](self, "fillInChromaticity");
}

- (void)fillInChromaticity
{
  if (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z == 0.0)
  {
    self->_xy.x = 0.0;
    self->_xy.y = 0.0;
  }
  else
  {
    self->_xy.x = self->_XYZ.X / (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z);
    self->_xy.y = self->_XYZ.Y / (self->_XYZ.X + self->_XYZ.Y + self->_XYZ.Z);
  }
}

- (void)fillInTristimulus
{
  if (self->_xy.y == 0.0)
  {
    self->_XYZ.X = 0.0;
    self->_XYZ.Y = 0.0;
    self->_XYZ.Z = 0.0;
  }
  else
  {
    self->_XYZ.X = self->_xy.x / self->_xy.y * self->_lux / 3.14159265;
    self->_XYZ.Y = self->_lux / 3.14159265;
    self->_XYZ.Z = (1.0 - self->_xy.x - self->_xy.y) / self->_xy.y * self->_XYZ.Y;
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)Lab
{
  float X;
  float Y;
  float Z;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  float v9;
  SEL v10;
  CBColorSample *v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = self;
  v10 = a2;
  v12 = 0;
  v13 = 0.0;
  X = self->_XYZ.X;
  *(float *)&v12 = X;
  Y = self->_XYZ.Y;
  *((float *)&v12 + 1) = Y;
  Z = self->_XYZ.Z;
  v13 = Z;
  v8 = 0;
  v9 = 0.0;
  CFXTristimulus2Lab((float *)&v12, (float *)&v8);
  v5 = v9;
  v6 = *((float *)&v8 + 1);
  v7 = *(float *)&v8;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (double)colorDeltaEWith:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  long double v9;
  double v11;
  long double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v18 = 0.0;
  if (a3)
  {
    -[CBColorSample Lab](self, "Lab");
    v15 = v3;
    v16 = v4;
    v17 = v5;
    objc_msgSend(a3, "Lab");
    v13 = v6;
    v14 = v7;
    v11 = pow(v15 - v8, 2.0);
    v12 = v11 + pow(v16 - v13, 2.0);
    v9 = pow(v17 - v14, 2.0);
    return pow(v12 + v9, 0.5);
  }
  return v18;
}

- (double)CCTDifferenceWith:(id)a3
{
  double v3;
  double v4;
  double v6;
  double v7;

  v7 = 0.0;
  if (a3)
  {
    -[CBColorSample CCT](self, "CCT");
    v6 = v3;
    objc_msgSend(a3, "CCT");
    return vabdd_f64(v6, v4);
  }
  return v7;
}

- (double)LuxDifferenceWith:(id)a3
{
  double v3;
  double v4;
  double v6;
  double v7;

  v7 = 0.0;
  if (a3)
  {
    -[CBColorSample lux](self, "lux");
    v6 = v3;
    objc_msgSend(a3, "lux");
    return vabdd_f64(v6, v4);
  }
  return v7;
}

- (int64_t)colorBin
{
  double v2;
  double v3;
  float v4;
  _QWORD v6[2];
  CBColorSample *v7;

  v7 = self;
  v6[1] = a2;
  v6[0] = 0;
  -[CBColorSample xy](self, "xy");
  *(float *)&v2 = v2;
  LODWORD(v6[0]) = LODWORD(v2);
  -[CBColorSample xy](v7, "xy");
  v4 = v3;
  *((float *)v6 + 1) = v4;
  return (int)CFXAnsiBinFromChromaticity((float *)v6);
}

- (id)copyDataInDictionary
{
  _QWORD v3[13];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  SEL v10;
  CBColorSample *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8 = 0;
  v3[12] = 0x1E0CB3000uLL;
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", self->_lux);
  v7 = 0;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v11->_CCT);
  v6 = 0;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v11->_xy.x);
  v5 = 0;
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v11->_xy.y);
  v4 = 0;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v11->_mode);
  if (v8 && v7 && v6 && v5 && v4)
  {
    v3[11] = v3;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("lux"), v7, CFSTR("CCT"), v6, CFSTR("x"), v5, CFSTR("y"), v4, CFSTR("mode"), 0);
  }

  return v9;
}

- (id)description
{
  SEL v3;
  CBColorSample *v4;

  v4 = self;
  v3 = a2;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lux = %f; CCT = %f; XYZ = [%f, %f, %f]; xy = [%f, %f]"),
               *(_QWORD *)&self->_lux,
               *(_QWORD *)&self->_CCT,
               *(_QWORD *)&self->_XYZ.X,
               *(_QWORD *)&self->_XYZ.Y,
               *(_QWORD *)&self->_XYZ.Z,
               *(_QWORD *)&self->_xy.x,
               *(_QWORD *)&self->_xy.y);
}

- (double)lux
{
  return self->_lux;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)xy
{
  double x;
  double y;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = self->_xy.y;
  x = self->_xy.x;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)XYZ
{
  double X;
  double Y;
  double Z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  Y = self->_XYZ.Y;
  X = self->_XYZ.X;
  Z = self->_XYZ.Z;
  result.var2 = Z;
  result.var1 = Y;
  result.var0 = X;
  return result;
}

- (double)CCT
{
  return self->_CCT;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
