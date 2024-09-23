@implementation NUBrushStroke

- (NUBrushStroke)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NUBrushStroke *v21;
  double v22;
  NSObject *v24;
  void *v25;
  void *specific;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  objc_super v39[2];
  objc_super v40;
  uint8_t buf[40];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 != 1)
  {
    NUAssertLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown brush stroke version. %ld"), v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A6553000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUBrushStroke initWithDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStroke.mm", 74, CFSTR("Unknown brush stroke version. %ld"), v34, v35, v36, v37, v6);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radius"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("softness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("opacity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  v15 = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("points"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUBrushStroke _createDataFromPointArray:](self, "_createDataFromPointArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pressureMode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("radius")) & 1) != 0)
  {
    v19 = 1;
  }
  else if (objc_msgSend(v18, "isEqualToString:", CFSTR("opacity")))
  {
    v19 = 2;
  }
  else
  {
    v19 = 0;
  }
  memset(buf, 0, 32);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clipRect"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NUPixelRectFromArray(v20, (uint64_t *)buf);

  v40.receiver = self;
  v40.super_class = (Class)NUBrushStroke;
  v21 = -[NUBrushStroke init](&v40, sel_init);
  memset(v39, 0, sizeof(v39));
  v38[0] = *(_OWORD *)buf;
  v38[1] = *(_OWORD *)&buf[16];
  LODWORD(v22) = v15;
  -[NUBrushStroke _initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:](v21, "_initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:", v39, v38, v17, v19, COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], v9)), COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[20], v12)), v22);
  -[NUBrushStroke _updateExtent](v21, "_updateExtent");

  return v21;
}

- (void)_initializeWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 extent:(id *)a6 clipRect:(id *)a7 data:(id)a8 pressureMode:(int64_t)a9
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12;

  self->_radius = a3;
  self->_softness = a4;
  self->_opacity = a5;
  var1 = a6->var1;
  self->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a6->var0;
  self->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
  v12 = a7->var1;
  self->_clipRect.origin = ($86B46DF249C2B4242DBB096758D29184)a7->var0;
  self->_clipRect.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v12;
  objc_storeStrong((id *)&self->_data, a8);
  self->_pressureMode = a9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUBrushStroke *v4;
  double v5;
  double v6;
  double v7;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v9;
  _OWORD v11[2];
  _OWORD v12[2];

  v4 = -[NUBrushStroke init](+[NUBrushStroke allocWithZone:](NUBrushStroke, "allocWithZone:", a3), "init");
  *(float *)&v5 = self->_radius;
  *(float *)&v6 = self->_softness;
  *(float *)&v7 = self->_opacity;
  size = self->_extent.size;
  v12[0] = self->_extent.origin;
  v12[1] = size;
  v9 = self->_clipRect.size;
  v11[0] = self->_clipRect.origin;
  v11[1] = v9;
  -[NUBrushStroke _initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:](v4, "_initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:", v12, v11, self->_data, self->_pressureMode, v5, v6, v7);
  if ((!self->_extent.size.width || !self->_extent.size.height) && -[NUBrushStroke pointCount](v4, "pointCount") >= 1)
    -[NUBrushStroke _updateExtent](v4, "_updateExtent");
  return v4;
}

- (id)points
{
  return self->_data;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NUMutableBrushStroke *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v10;
  _OWORD v12[2];
  _OWORD v13[2];

  v4 = -[NUMutableBrushStroke init](+[NUMutableBrushStroke allocWithZone:](NUMutableBrushStroke, "allocWithZone:", a3), "init");
  v5 = (void *)-[NSMutableData mutableCopy](self->_data, "mutableCopy");
  *(float *)&v6 = self->_radius;
  *(float *)&v7 = self->_softness;
  *(float *)&v8 = self->_opacity;
  size = self->_extent.size;
  v13[0] = self->_extent.origin;
  v13[1] = size;
  v10 = self->_clipRect.size;
  v12[0] = self->_clipRect.origin;
  v12[1] = v10;
  -[NUBrushStroke _initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:](v4, "_initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:", v13, v12, v5, self->_pressureMode, v6, v7, v8);
  if ((!self->_extent.size.width || !self->_extent.size.height) && -[NUBrushStroke pointCount](v4, "pointCount") >= 1)
    -[NUBrushStroke _updateExtent](v4, "_updateExtent");

  return v4;
}

- (int64_t)pointCount
{
  return (int64_t)-[NSMutableData length](self->_data, "length") / 12;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)pointAtIndex:(int64_t)a3
{
  int64_t v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v5 = -[NUBrushStroke pointCount](self, "pointCount");
  if (a3 < 0 || v5 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("Point index out of bounds"));
  }
  else
  {
    v6 = (float *)(-[NSMutableData bytes](self->_data, "bytes") + 12 * a3);
    v7 = *v6;
    v8 = v6[1];
    v9 = v6[2];
  }
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->var1 = var1;
  return self;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)clipRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = self[2].var1;
  retstr->var0 = self[2].var0;
  retstr->var1 = var1;
  return self;
}

- (id)description
{
  void *v3;
  float radius;
  float softness;
  float opacity;
  int64_t v7;
  void *v8;
  int64_t x;
  int64_t y;
  int64_t height;
  BOOL v14;
  char v15;
  __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  radius = self->_radius;
  softness = self->_softness;
  opacity = self->_opacity;
  v7 = -[NUBrushStroke pointCount](self, "pointCount");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  x = self->_clipRect.origin.x;
  y = self->_clipRect.origin.y;
  height = self->_clipRect.size.height;
  v14 = x == 0x7FFFFFFFFFFFFFFFLL && y == 0x7FFFFFFFFFFFFFFFLL && self->_clipRect.size.width == 0 && height == 0;
  v15 = v14;
  if (v14)
  {
    v16 = CFSTR("None");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{origin={%ld, %ld} size={%ld, %ld}}]"), x, y, self->_clipRect.size.width, height);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: radius=%f,softness=%f,opacity=%f,pointCount=%lu,extent=%@,clipRect=%@>"), CFSTR("NUBrushStroke"), radius, softness, opacity, v7, v8, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v15 & 1) == 0)

  return v17;
}

- (id)_createPointArrayFromData:(id)a3
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  int *v8;
  int v9;
  int v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v18;
  id v19;

  v18 = a3;
  v3 = objc_msgSend(v18, "length");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3 / 0xC);
  v19 = objc_retainAutorelease(v18);
  v5 = objc_msgSend(v19, "bytes");
  if (v3 >= 0xC)
  {
    if (v3 / 0xC <= 1)
      v7 = 1;
    else
      v7 = v3 / 0xC;
    v8 = (int *)(v5 + 8);
    do
    {
      LODWORD(v6) = *(v8 - 2);
      v9 = *(v8 - 1);
      v10 = *v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = v9;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v11, CFSTR("x"), v13, CFSTR("y"), v15, CFSTR("p"), 0);
      objc_msgSend(v4, "addObject:", v16);

      v8 += 3;
      --v7;
    }
    while (v7);
  }

  return v4;
}

- (id)_createDataFromPointArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  float v17;
  float v18;
  id v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v20 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 12 * v4));
  v5 = objc_msgSend(v20, "mutableBytes");
  if (v4)
  {
    v6 = 0;
    v7 = (float *)(v5 + 8);
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("x"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("y"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("p"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
        v14 = 0;
        if (v10)
        {
          objc_msgSend(v10, "floatValue");
          v14 = v15;
        }
        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          v13 = v16;
        }
        if (v12)
        {
          objc_msgSend(v12, "floatValue");
          v18 = v17;
        }
        else
        {
          v18 = 1.0;
        }

      }
      else
      {
        v13 = 0;
        v18 = 1.0;
        v14 = 0;
      }
      *((_DWORD *)v7 - 2) = v14;
      *((_DWORD *)v7 - 1) = v13;
      *v7 = v18;
      v7 += 3;

      ++v6;
    }
    while (v4 != v6);
  }

  return v20;
}

- (void)_updateExtent
{
  uint64_t v3;
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  double v9;
  float *v10;
  float *v11;
  float radius;
  float v13;
  float v14;
  $86B46DF249C2B4242DBB096758D29184 v15;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v16;
  _OWORD v17[2];
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v3 = -[NUBrushStroke pointCount](self, "pointCount");
  if (v3 < 1)
  {
    v15 = ($86B46DF249C2B4242DBB096758D29184)NUPixelRectNull;
    v16 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)unk_1A6719E60;
  }
  else
  {
    v4 = v3;
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v9 = (float)((float)(self->_radius * 2.0) + 1.0);
    v10 = (float *)-[NSMutableData bytes](self->_data, "bytes");
    v11 = &v10[3 * v4];
    do
    {
      radius = self->_radius;
      v13 = *v10;
      v14 = v10[1];
      v10 += 3;
      v21.origin.x = (float)(v13 - radius);
      v21.origin.y = (float)(v14 - radius);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v21.size.width = v9;
      v21.size.height = v9;
      v20 = CGRectUnion(v19, v21);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
    }
    while (v10 != v11);
    v18 = v20;
    NU::RectT<long>::RectT(v17, &v18, 0);
    v15 = ($86B46DF249C2B4242DBB096758D29184)v17[0];
    v16 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v17[1];
  }
  self->_extent.origin = v15;
  self->_extent.size = v16;
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

- (float)softness
{
  return self->_softness;
}

- (void)setSoftness:(float)a3
{
  self->_softness = a3;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (int64_t)pressureMode
{
  return self->_pressureMode;
}

- (void)setPressureMode:(int64_t)a3
{
  self->_pressureMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (id)brushStrokeFromDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)dictionaryFromBrushStroke:(id)a3
{
  _QWORD *v3;
  uint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  _OWORD v19[2];
  _QWORD v20[7];
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3[3];
  v5 = CFSTR("none");
  if (v4 == 2)
    v5 = CFSTR("opacity");
  if (v4 == 1)
    v6 = CFSTR("radius");
  else
    v6 = (__CFString *)v5;
  v7 = v6;
  objc_msgSend(v3, "_createPointArrayFromData:", v3[12]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = &unk_1E50A2520;
  v20[0] = CFSTR("version");
  v20[1] = CFSTR("radius");
  LODWORD(v9) = *((_DWORD *)v3 + 2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  v20[2] = CFSTR("softness");
  LODWORD(v11) = *((_DWORD *)v3 + 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  v20[3] = CFSTR("opacity");
  LODWORD(v13) = *((_DWORD *)v3 + 4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v14;
  v21[4] = v8;
  v20[4] = CFSTR("points");
  v20[5] = CFSTR("pressureMode");
  v21[5] = v7;
  v20[6] = CFSTR("clipRect");
  v15 = *((_OWORD *)v3 + 5);
  v19[0] = *((_OWORD *)v3 + 4);
  v19[1] = v15;
  NSArrayFromNUPixelRect(v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 alwaysUseCG:(BOOL)a6
{
  return -[NUBrushStroke ciImageTiled:closed:pressureMode:filled:alwaysUseCG:](self, "ciImageTiled:closed:pressureMode:filled:alwaysUseCG:", a3, a4, a5, 0, a6);
}

- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6 alwaysUseCG:(BOOL)a7
{
  -[NUBrushStroke extent](self, "extent");
  return 0;
}

- (void)writeToTIFFAtPath:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v14;
  CGFloat MinY;
  void *v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v6 = a4;
  v8 = a3;
  -[NUBrushStroke ciImageTiled:closed:pressureMode:alwaysUseCG:](self, "ciImageTiled:closed:pressureMode:alwaysUseCG:", 1, v6, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extent");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v14 = -CGRectGetMinX(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MinY = CGRectGetMinY(v19);
  CGAffineTransformMakeTranslation(&v17, v14, -MinY);
  objc_msgSend(v9, "imageByApplyingTransform:", &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "writeToTIFF:", v8);
}

@end
