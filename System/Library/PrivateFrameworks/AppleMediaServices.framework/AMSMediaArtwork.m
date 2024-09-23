@implementation AMSMediaArtwork

+ (NSString)cropStylePlaceholder
{
  void *v2;

  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)formatPlaceholder
{
  void *v2;

  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)heightPlaceholder
{
  void *v2;

  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)qualityPlaceholder
{
  void *v2;

  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)widthPlaceholder
{
  void *v2;

  v2 = (void *)sub_18CEC17F8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (id)urlWithURLTemplate:(id)a3 size:(CGSize)a4 cropStyle:(id)a5 format:(id)a6 quality:(id)a7
{
  double height;
  double width;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;

  height = a4.height;
  width = a4.width;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEAA300);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v16 = sub_18CEC181C();
    a3 = v17;
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if (a5)
    {
LABEL_3:
      v18 = sub_18CEC181C();
      a5 = v19;
      if (a6)
        goto LABEL_4;
LABEL_8:
      v20 = 0;
      if (a7)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v18 = 0;
  if (!a6)
    goto LABEL_8;
LABEL_4:
  v20 = sub_18CEC181C();
  a6 = v21;
  if (a7)
  {
LABEL_5:
    v22 = sub_18CEC181C();
    a7 = v23;
    goto LABEL_10;
  }
LABEL_9:
  v22 = 0;
LABEL_10:
  static AMSMediaArtwork.url(URLTemplate:size:cropStyle:format:quality:)(v16, (uint64_t)a3, v18, (unint64_t)a5, v20, (unint64_t)a6, v22, (unint64_t)a7, (uint64_t)v15, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = sub_18CEC142C();
  v25 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v24) != 1)
  {
    v25 = (void *)sub_18CEC13B4();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v15, v24);
  }
  return v25;
}

- (AMSMediaArtwork)initWithDictionary:(id)a3
{
  id v5;
  AMSMediaArtwork *v6;
  AMSMediaArtwork *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMediaArtwork;
  v6 = -[AMSMediaArtwork init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_artworkDictionary, a3);

  return v7;
}

- (CGSize)artworkSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[AMSMediaArtwork width](self, "width");
  v4 = v3;
  -[AMSMediaArtwork height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)height
{
  void *v2;
  void *v3;
  id v4;
  float v5;
  double v6;

  -[AMSMediaArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("height"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (id)URLString
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMediaArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (double)width
{
  void *v2;
  void *v3;
  id v4;
  float v5;
  double v6;

  -[AMSMediaArtwork artworkDictionary](self, "artworkDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("width"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (CGColor)colorWithKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  CGColorSpace *DeviceRGB;
  CGColor *v10;
  float64x2_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSMediaArtwork artworkDictionary](self, "artworkDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
    goto LABEL_6;
  }
  v7 = v6;

  if (!v7)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  v7 = objc_retainAutorelease(v7);
  v8 = strtoul((const char *)objc_msgSend(v7, "UTF8String"), 0, 16);
  v12 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v8), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u)));
  v13 = (float)((float)v8 / 255.0);
  v14 = 0x3FF0000000000000;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = CGColorCreate(DeviceRGB, v12.f64);
  if (DeviceRGB)
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:

  return v10;
}

- (id)URLWithSize:(CGSize)a3
{
  return -[AMSMediaArtwork URLWithSize:cropStyle:format:quality:](self, "URLWithSize:cropStyle:format:quality:", CFSTR("bb"), CFSTR("jpg"), -[AMSMediaArtwork _qualityForFormat:](self, "_qualityForFormat:", CFSTR("jpg")), a3.width, a3.height);
}

- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = a4;
  -[AMSMediaArtwork URLWithSize:cropStyle:format:quality:](self, "URLWithSize:cropStyle:format:quality:", v10, v9, -[AMSMediaArtwork _qualityForFormat:](self, "_qualityForFormat:", v9), width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)URLWithSize:(CGSize)a3 cropStyle:(id)a4 format:(id)a5 quality:(unint64_t)a6
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;

  height = a3.height;
  width = a3.width;
  v11 = a4;
  v12 = a5;
  -[AMSMediaArtwork URLString](self, "URLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (v14)
  {
    -[AMSMediaArtwork height](self, "height");
    if (height < v15)
      v15 = height;
    v16 = fmax(v15, 0.0);
    -[AMSMediaArtwork width](self, "width");
    if (width < v17)
      v17 = width;
    v18 = (double)(unint64_t)fmax(v17, 0.0);
    v19 = 100;
    if (a6 < 0x64)
      v19 = a6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "urlWithURLTemplate:size:cropStyle:format:quality:", v14, v11, v12, v20, v18, (double)(unint64_t)v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)_qualityForFormat:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("heic")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("jpg")) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("png"));
  }

  return 70;
}

- (NSDictionary)artworkDictionary
{
  return self->_artworkDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDictionary, 0);
}

@end
