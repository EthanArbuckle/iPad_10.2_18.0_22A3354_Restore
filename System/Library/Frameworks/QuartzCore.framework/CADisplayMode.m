@implementation CADisplayMode

- (unint64_t)width
{
  return (unint64_t)self->_priv->var1;
}

- (unint64_t)height
{
  return self->_priv->var2;
}

- (void)_setPreferredUIScale:(unsigned int)a3
{
  LODWORD(self->_priv->var3) = a3;
}

- (void)_setWidth:(unint64_t)a3 height:(unint64_t)a4
{
  CADisplayModePriv *priv;

  priv = self->_priv;
  priv->var1 = (id)a3;
  priv->var2 = a4;
}

- (NSString)hdrMode
{
  unint64_t var1;
  BOOL v3;
  unsigned int v4;

  var1 = self->_priv->var0.var0.var1;
  if (var1)
    v3 = (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  else
    v3 = 0;
  if (v3 && (v4 = ((var1 >> 55) & 0x1F) - 16, v4 <= 0xC))
    return (NSString *)*((_QWORD *)&off_1E159C520 + v4);
  else
    return (NSString *)CFSTR("SDR");
}

- (NSString)colorGamut
{
  if (objc_msgSend(*((id *)&self->_priv->var0.var0.var1 + 1), "supportsExtendedColors"))
    return (NSString *)CFSTR("gamut_P3");
  else
    return (NSString *)CFSTR("gamut_SRGB");
}

- (double)refreshRate
{
  CADisplayModePriv *priv;
  double v3;
  double v4;

  priv = self->_priv;
  if (priv->var0.var0.var1 == -1)
  {
    objc_msgSend(*((id *)&priv->var0.var0.var1 + 1), "hardwareRefreshRate");
    v3 = 1.0 / v4;
  }
  else
  {
    v3 = (double)((priv->var0.var0.var1 >> 29) & 0x1FFFFFF) * 0.0000152587891;
  }
  return round(v3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  free(self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayMode;
  -[CADisplayMode dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v5;
  uint64_t *priv;
  int v7;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_7;
    v5 = (uint64_t *)*((_QWORD *)a3 + 1);
    priv = (uint64_t *)self->_priv;
    v7 = CA::WindowServer::Display::Mode::operator==(*v5, *priv);
    if (!v7)
      return v7;
    if (v5[1] != priv[1] || v5[2] != priv[2])
    {
LABEL_7:
      LOBYTE(v7) = 0;
      return v7;
    }
    LOBYTE(v7) = v5[3] == priv[3];
  }
  return v7;
}

- (unint64_t)preferredScale
{
  CADisplayModePriv *priv;
  unint64_t result;
  float v4;

  priv = self->_priv;
  result = LODWORD(priv->var3);
  if (!(_DWORD)result)
  {
    if ((priv->var0.var0.var1 & 0x10000000) != 0)
    {
      MGGetFloat32Answer();
      return (unint64_t)v4;
    }
    else if (priv->var2 <= 0x438)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (id)_initWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7
{
  unsigned int v7;
  unsigned int var0;
  void *v10;
  unint64_t var1;
  CADisplayModePriv *v13;
  id v14;
  CADisplayModePriv *priv;
  objc_super v17;
  uint64_t v18;

  v7 = *(_DWORD *)&a6.var2;
  var0 = a6.var0;
  v10 = (void *)*(&a3.var0.var1 + 1);
  var1 = a3.var0.var1;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = (CADisplayModePriv *)malloc_type_malloc(0x40uLL, 0x1080040D897DFA0uLL);
  self->_priv = v13;
  v13->var0.var0.var1 = var1;
  v14 = v10;
  priv = self->_priv;
  *(&priv->var0.var0.var1 + 1) = (unint64_t)v14;
  priv->var1 = (id)(var1 & 0x3FFF);
  priv->var2 = (var1 >> 14) & 0x3FFF;
  LODWORD(priv->var3) = 0;
  priv->var5 = a5;
  priv->var6.var0 = var0;
  self->_priv->var6.var1 = v7;
  v17.receiver = self;
  v17.super_class = (Class)CADisplayMode;
  return -[CADisplayMode init](&v17, sel_init);
}

- (id)_display
{
  return (id)*(&self->_priv->var0.var0.var1 + 1);
}

- (Mode)_mode
{
  unint64_t var1;
  Mode result;

  var1 = self->_priv->var0.var0.var1;
  *(&result.var0.var1 + 1) = (unint64_t)a2;
  result.var0.var1 = var1;
  return result;
}

- (double)pixelAspectRatio
{
  return 1.0;
}

- (BOOL)isVirtual
{
  return (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x40000010000000) == 0x40000000000000;
}

- (BOOL)isHighBandwidth
{
  return (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x4000000010000000) == 0x4000000000000000;
}

- (NSString)colorMode
{
  unint64_t var1;
  BOOL v3;
  NSString *result;
  uint64_t v5;
  __CFString *v6;
  BOOL v7;

  var1 = self->_priv->var0.var0.var1;
  if (var1)
    v3 = (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  else
    v3 = 0;
  result = (NSString *)CFSTR("auto");
  if (v3)
  {
    result = (NSString *)CFSTR("YCbCr444LimitedRange");
    switch((var1 >> 55) & 0x1F)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
        v5 = (var1 >> 60) & 3;
        if ((_DWORD)v5 != 1)
        {
          v6 = CFSTR("RGBLimitedRange");
          v7 = (_DWORD)v5 == 2;
          goto LABEL_13;
        }
        result = (NSString *)CFSTR("RGBFullRange");
        break;
      case 4uLL:
      case 5uLL:
      case 6uLL:
        result = (NSString *)CFSTR("YCbCr420LimitedRange");
        break;
      case 7uLL:
      case 8uLL:
      case 9uLL:
        result = (NSString *)CFSTR("YCbCr422LimitedRange");
        break;
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
        return result;
      case 0x10uLL:
      case 0x11uLL:
        result = (NSString *)CFSTR("HDR10_444LimitedRange");
        break;
      case 0x12uLL:
      case 0x13uLL:
        result = (NSString *)CFSTR("HDR10_422LimitedRange");
        break;
      case 0x14uLL:
      case 0x15uLL:
        result = (NSString *)CFSTR("HDR10_420LimitedRange");
        break;
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
        v6 = CFSTR("HDR10_RGBFullRange");
        v7 = (var1 & 0x3000000000000000) == 0x1000000000000000;
LABEL_13:
        if (v7)
          result = &v6->isa;
        else
          result = (NSString *)CFSTR("auto");
        break;
      case 0x1AuLL:
      case 0x1BuLL:
        result = (NSString *)CFSTR("DolbyVision");
        break;
      case 0x1CuLL:
        result = (NSString *)CFSTR("DolbyVisionLowLatency");
        break;
      default:
        result = (NSString *)CFSTR("auto");
        break;
    }
  }
  return result;
}

- (BOOL)colorModeIsYCbCr
{
  unint64_t var1;
  BOOL v3;
  uint64_t v4;
  _BOOL4 v5;

  var1 = self->_priv->var0.var0.var1;
  if (var1)
    v3 = (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  else
    v3 = 0;
  if (v3 && (v4 = (var1 >> 55) & 0x1F, v4 <= 0x15))
    return (0x3F1FF0u >> v4) & 1;
  else
    LOBYTE(v5) = 0;
  return v5;
}

- (unint64_t)bitDepth
{
  unint64_t var1;
  BOOL v3;
  unsigned int v4;

  var1 = self->_priv->var0.var0.var1;
  if (var1)
    v3 = (*(_QWORD *)&self->_priv->var0.var0.var0 & 0x10000000) == 0;
  else
    v3 = 0;
  if (v3 && (v4 = ((var1 >> 55) & 0x1F) - 2, v4 <= 0x1A))
    return qword_18474FE10[v4];
  else
    return 8;
}

- (BOOL)isVRR
{
  return *(_QWORD *)&self->_priv->var0.var0.var0 < -1;
}

- (unint64_t)internalRepresentation
{
  return self->_priv->var0.var0.var1;
}

- (unsigned)maximumSourceWidth
{
  return self->_priv->var5;
}

- (unsigned)maximumSourceHeight
{
  return HIDWORD(self->_priv->var5);
}

- (unint64_t)maximumSourceBandwidth
{
  return self->_priv->var6.var1 * LOBYTE(self->_priv->var6.var0) * BYTE1(self->_priv->var6.var0);
}

- (unint64_t)hash
{
  return self->_priv->var0.var0.var1;
}

- (id)description
{
  unint64_t var1;
  char *v4;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  var1 = self->_priv->var0.var0.var1;
  if ((var1 & 0x10000000) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CADisplayMode %d x %d internal_panel (fixed)>"), -[CADisplayMode width](self, "width"), -[CADisplayMode height](self, "height"), v11, v12);
  if ((~var1 & 0x3000000000000000) != 0)
    v4 = off_1E159C588[(var1 >> 60) & 3];
  else
    v4 = 0;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[CADisplayMode width](self, "width");
  v8 = -[CADisplayMode height](self, "height");
  v9 = ((*(_QWORD *)&self->_priv->var0.var0.var0 >> 55) & 0x1F) - 1;
  if (v9 > 0x1B)
    v10 = "";
  else
    v10 = off_1E159D930[v9];
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("<CADisplayMode %d x %d fmt:%s range:%s>"), v7, v8, v10, v4);
}

+ (id)_displayModeWithMode:(Mode)a3 display:(id)a4 rates:(id)a5 perMode:(PerModeInfo)a6 maxSourceBandwidthPerPipe:(unsigned int)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", a3.var0.var1, *(&a3.var0.var1 + 1), a4, a5, a6.var0, *(_QWORD *)&a6.var2);
}

+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5
{
  return (CADisplayMode *)objc_msgSend(a1, "_displayModeWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", a3 & 0x3FFF | ((a4 & 0x3FFF) << 14) | ((unint64_t)(vcvtd_n_u64_f64(a5, 0x10uLL) & 0x1FFFFFF) << 29) | 0x1080000000000000, 0, 0, 0, 0, 0);
}

+ (CADisplayMode)displayModeWithWidth:(unint64_t)a3 height:(unint64_t)a4 refreshRate:(double)a5 isVRR:(BOOL)a6
{
  unint64_t v6;
  unint64_t v7;

  v6 = a3 & 0x3FFF | ((a4 & 0x3FFF) << 14) | ((unint64_t)(vcvtd_n_u64_f64(a5, 0x10uLL) & 0x1FFFFFF) << 29);
  v7 = 0x8000000000000000;
  if (!a6)
    v7 = 0;
  return (CADisplayMode *)objc_msgSend(a1, "_displayModeWithMode:display:rates:perMode:maxSourceBandwidthPerPipe:", v6 | v7 | 0x1080000000000000, 0, 0, 0, 0, 0);
}

@end
