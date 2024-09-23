@implementation ICDrawingCommandData

- (ICDrawingCommandData)init
{
  ICDrawingCommandData *result;
  CGPoint v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDrawingCommandData;
  result = -[ICDrawingCommandData init](&v4, sel_init);
  if (result)
  {
    v3 = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_cachedBounds.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_cachedBounds.origin = v3;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  self->_color = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICDrawingCommandData;
  -[ICDrawingCommandData dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqualDrawingCommandData:(id)a3
{
  id v4;
  int v5;
  char v6;
  int v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;

  v4 = a3;
  -[ICDrawingCommandData commandID](self, "commandID");
  if (v4)
  {
    objc_msgSend(v4, "commandID");
    v5 = v8;
  }
  else
  {
    v5 = 0;
    v9 = 0;
    v10 = 0;
  }
  if (v11 == v5 && v13 == v10)
    v6 = objc_msgSend(v12, "isEqual:", v9);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ICDrawingCommandData isEqualDrawingCommandData:](self, "isEqualDrawingCommandData:", v4);

  return v5;
}

- (unint64_t)hash
{
  int v3;
  int v4;
  unint64_t v5;
  id v7;
  id v8;
  int v9;
  int v10;
  id v11;

  -[ICDrawingCommandData commandID](self, "commandID");
  v3 = v10;
  -[ICDrawingCommandData commandID](self, "commandID");
  v4 = v9;
  -[ICDrawingCommandData commandID](self, "commandID");
  v5 = objc_msgSend(v7, "hash") ^ v3 ^ (v4 << 16);

  return v5;
}

- (unsigned)randomSeed
{
  return -[ICDrawingCommandData hash](self, "hash");
}

- (void)invalidateBounds
{
  CGPoint v2;

  v2 = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_cachedBounds.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_cachedBounds.origin = v2;
}

- (double)renderCost
{
  return (double)(unint64_t)((self->_points.__end_ - self->_points.__begin_) >> 6);
}

- (CGRect)bounds
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  double v9;
  double v10;
  CGRect result;
  CGRect v12;

  if (CGRectIsNull(self->_cachedBounds))
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
    begin = self->_points.__begin_;
    for (i = self->_points.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 64))
    {
      if (*((double *)begin + 6) >= 1.0)
        v9 = *((double *)begin + 6);
      else
        v9 = 1.0;
      v10 = (*((double *)begin + 2) + *((double *)begin + 5)) * v9;
      v12.origin.x = *(double *)begin - v10 + -2.0;
      v12.origin.y = *((double *)begin + 1) - v10 + -2.0;
      v12.size.width = v10 * 2.0 + 4.0;
      v12.size.height = v12.size.width;
      *(CGRect *)&v3 = CGRectUnion(*(CGRect *)&v3, v12);
    }
    result = CGRectIntegral(*(CGRect *)&v3);
    self->_cachedBounds = result;
  }
  else
  {
    return self->_cachedBounds;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p type=%ld points=%ld>"), v5, self, self->_type, (self->_points.__end_ - self->_points.__begin_) >> 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)points
{
  return &self->_points;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (CGColor)color
{
  return self->_color;
}

- (void)setColor:(CGColor *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)baseValues
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[2].var5;
  retstr->var0 = *(CGPoint *)&self[2].var3;
  *(_OWORD *)&retstr->var1 = v3;
  v4 = *(_OWORD *)&self[3].var1;
  *(CGPoint *)&retstr->var3 = self[3].var0;
  *(_OWORD *)&retstr->var5 = v4;
  return self;
}

- (void)setBaseValues:(id *)a3
{
  CGPoint var0;
  __int128 v4;
  __int128 v5;

  var0 = a3->var0;
  v4 = *(_OWORD *)&a3->var1;
  v5 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_baseValues.azimuth = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_baseValues.aspectRatio = v5;
  self->_baseValues.point = var0;
  *(_OWORD *)&self->_baseValues.radius = v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)parameters
{
  double baseAlpha;
  double blendAlpha;
  double targetMultiple;
  $1AB5FA073B851C12C2339EC22442E995 result;

  baseAlpha = self->_parameters.baseAlpha;
  blendAlpha = self->_parameters.blendAlpha;
  targetMultiple = self->_parameters.targetMultiple;
  result.var2 = targetMultiple;
  result.var1 = blendAlpha;
  result.var0 = baseAlpha;
  return result;
}

- (void)setParameters:(id)a3
{
  self->_parameters = ($D0E20E97318CF8C4151E8D3C9DB23823)a3;
}

- (BOOL)isClipped
{
  return self->_isClipped;
}

- (void)setIsClipped:(BOOL)a3
{
  self->_isClipped = a3;
}

- (CGPoint)clipOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_clipOrigin.x;
  y = self->_clipOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setClipOrigin:(CGPoint)a3
{
  self->_clipOrigin = a3;
}

- (CGPoint)clipNormal
{
  double x;
  double y;
  CGPoint result;

  x = self->_clipNormal.x;
  y = self->_clipNormal.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setClipNormal:(CGPoint)a3
{
  self->_clipNormal = a3;
}

- (ICDrawingCommandID)commandID
{
  ICDrawingCommandID *result;

  retstr->clock = self->_commandID.clock;
  result = self->_commandID.replicaUUID;
  retstr->replicaUUID = (NSUUID *)result;
  retstr->subclock = self->_commandID.subclock;
  return result;
}

- (void)setCommandID:(ICDrawingCommandID *)a3
{
  self->_commandID.clock = a3->clock;
  objc_storeStrong((id *)&self->_commandID.replicaUUID, a3->replicaUUID);
  self->_commandID.subclock = a3->subclock;

}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 18) = 0;
  return self;
}

- (ICDrawingCommandData)initWithArchive:(const void *)a3 version:(unsigned int)a4 sortedUUIDs:(id)a5
{
  ICDrawingCommandData *v8;
  ICDrawingCommandData *v9;
  drawing::Command *v10;
  uint64_t v11;
  drawing::Command *v12;
  drawing::Command *v13;
  uint64_t v14;
  int v15;
  drawing::Command *v16;
  int v17;
  drawing::Command *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float *v23;
  float v24;
  drawing::Command *v25;
  CGColorSpace *DeviceRGB;
  CGColorRef v27;
  drawing::Command *v28;
  int v29;
  uint64_t v30;
  drawing::Command *v31;
  uint64_t v32;
  int v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  drawing::Command *v38;
  uint64_t v39;
  void **v40;
  unint64_t v41;
  void **v42;
  int v43;
  int v44;
  _QWORD *v45;
  uint64_t v46;
  double *v47;
  BOOL v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void **v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  char *v61;
  char *v62;
  void **v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  const drawing::Rectangle *v67;
  drawing::Rectangle *v68;
  drawing::Command *v70;
  drawing::Command *v71;
  drawing::Command *v72;
  id v73;
  char v74[64];
  _OWORD v75[4];
  _QWORD v76[17];
  int v77;
  drawing::Command *v78;
  int v79;
  CGFloat components[2];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v73 = a5;
  v8 = -[ICDrawingCommandData init](self, "init");
  v9 = v8;
  if (!v8)
    goto LABEL_69;
  v10 = (drawing::Command *)-[ICDrawingCommandData setType:](v8, "setType:", *((unsigned int *)a3 + 32));
  v11 = *((_QWORD *)a3 + 5);
  if (!v11)
    v11 = *(_QWORD *)(drawing::Command::default_instance(v10) + 40);
  objc_msgSend(v73, "objectAtIndexedSubscript:", *(unsigned int *)(v11 + 48), 0);
  v12 = (drawing::Command *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = *((_QWORD *)a3 + 5);
  if (v14)
  {
    v15 = *(_DWORD *)(v14 + 40);
  }
  else
  {
    v16 = (drawing::Command *)drawing::Command::default_instance(v12);
    v14 = *((_QWORD *)a3 + 5);
    v15 = *(_DWORD *)(*((_QWORD *)v16 + 5) + 40);
    if (!v14)
      v14 = *(_QWORD *)(drawing::Command::default_instance(v16) + 40);
  }
  v17 = *(_DWORD *)(v14 + 44);
  v77 = v15;
  v72 = v13;
  v78 = v72;
  v79 = v17;
  v18 = (drawing::Command *)-[ICDrawingCommandData setCommandID:](v9, "setCommandID:", &v77);
  if ((*((_BYTE *)a3 + 32) & 4) != 0)
  {
    v23 = (float *)*((_QWORD *)a3 + 6);
    if (v23)
    {
      v20 = v23[10];
      v21 = v23[11];
    }
    else
    {
      v25 = (drawing::Command *)drawing::Command::default_instance(v18);
      v23 = (float *)*((_QWORD *)a3 + 6);
      v20 = *(float *)(*((_QWORD *)v25 + 6) + 40);
      if (v23)
      {
        v24 = v23[12];
        v21 = v23[11];
        goto LABEL_15;
      }
      v70 = (drawing::Command *)drawing::Command::default_instance(v25);
      v23 = (float *)*((_QWORD *)a3 + 6);
      v21 = *(float *)(*((_QWORD *)v70 + 6) + 44);
      if (!v23)
      {
        v71 = (drawing::Command *)drawing::Command::default_instance(v70);
        v23 = (float *)*((_QWORD *)a3 + 6);
        v24 = *(float *)(*((_QWORD *)v71 + 6) + 48);
        if (!v23)
          v23 = *(float **)(drawing::Command::default_instance(v71) + 48);
        goto LABEL_15;
      }
    }
    v24 = v23[12];
LABEL_15:
    v22 = v24;
    v19 = v23[13];
    goto LABEL_16;
  }
  v19 = 1.0;
  v20 = 0.0;
  v21 = 0.0;
  v22 = 0.0;
LABEL_16:
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = v20;
  components[1] = v21;
  *(double *)&v81 = v22;
  *((double *)&v81 + 1) = v19;
  v27 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  CFAutorelease(v27);
  v28 = (drawing::Command *)-[ICDrawingCommandData setColor:](v9, "setColor:", v27);
  v29 = *((_DWORD *)a3 + 8);
  if ((v29 & 8) != 0)
  {
    v30 = *((_QWORD *)a3 + 7);
    if (!v30)
      v30 = *(_QWORD *)(drawing::Command::default_instance(v28) + 56);
    -[ICDrawingCommandData readPointFromArchive:deltaFrom:](v9, "readPointFromArchive:deltaFrom:", v30, &ICDrawingOutputPointDefault);
    *(_OWORD *)v76 = *(_OWORD *)&v76[9];
    *(_OWORD *)&v76[2] = *(_OWORD *)&v76[11];
    *(_OWORD *)&v76[4] = *(_OWORD *)&v76[13];
    *(_OWORD *)&v76[6] = *(_OWORD *)&v76[15];
    v28 = (drawing::Command *)-[ICDrawingCommandData setBaseValues:](v9, "setBaseValues:", v76);
    v29 = *((_DWORD *)a3 + 8);
  }
  if ((v29 & 0x200) != 0)
  {
    v32 = *((_QWORD *)a3 + 15);
    if (!v32)
      v32 = *(_QWORD *)(drawing::Command::default_instance(v28) + 120);
    v33 = *(_DWORD *)(v32 + 32);
    v34 = 0.0;
    v35 = 0.0;
    if ((v33 & 1) != 0)
      v35 = *(float *)(v32 + 40);
    if ((v33 & 2) != 0)
      v34 = *(float *)(v32 + 44);
    v36 = 0.0;
    if ((v33 & 4) != 0)
      v36 = *(float *)(v32 + 48);
    v31 = (drawing::Command *)-[ICDrawingCommandData setParameters:](v9, "setParameters:", v35, v34, v36);
  }
  else
  {
    -[ICDrawingCommandData version1Parameters](v9, "version1Parameters");
    v31 = (drawing::Command *)-[ICDrawingCommandData setParameters:](v9, "setParameters:");
  }
  if ((*((_BYTE *)a3 + 32) & 0x80) != 0)
  {
    v82 = 0u;
    v83 = 0u;
    *(_OWORD *)components = 0u;
    v81 = 0u;
    v37 = *((_QWORD *)a3 + 13);
    if (!v37)
      v37 = *(_QWORD *)(drawing::Command::default_instance(v31) + 104);
    -[ICDrawingCommandData baseValues](v9, "baseValues");
    v38 = -[ICDrawingCommandData readPointFromArchive:deltaFrom:](v9, "readPointFromArchive:deltaFrom:", v37, v75);
    memset(v75, 0, sizeof(v75));
    v39 = *((_QWORD *)a3 + 14);
    if (!v39)
      v39 = *(_QWORD *)(drawing::Command::default_instance(v38) + 112);
    -[ICDrawingCommandData baseValues](v9, "baseValues");
    -[ICDrawingCommandData readPointFromArchive:deltaFrom:](v9, "readPointFromArchive:deltaFrom:", v39, v74);
    -[ICDrawingCommandData setIsClipped:](v9, "setIsClipped:", 1);
    -[ICDrawingCommandData setClipOrigin:](v9, "setClipOrigin:", components[0], components[1]);
    -[ICDrawingCommandData setClipNormal:](v9, "setClipNormal:", v75[0]);
  }
  v40 = -[ICDrawingCommandData points](v9, "points");
  v41 = *((unsigned int *)a3 + 18);
  if ((_DWORD)v41)
  {
    v42 = v40;
    std::vector<ICDrawingOutputPoint>::reserve(v40, v41);
    v43 = *((_DWORD *)a3 + 18);
    if (v43)
    {
      v44 = 0;
      v45 = v42 + 2;
      do
      {
        v46 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<drawing::Point>::TypeHandler>((uint64_t)a3 + 64, v44);
        v82 = 0u;
        v83 = 0u;
        *(_OWORD *)components = 0u;
        v81 = 0u;
        -[ICDrawingCommandData baseValues](v9, "baseValues");
        v40 = -[ICDrawingCommandData readPointFromArchive:deltaFrom:](v9, "readPointFromArchive:deltaFrom:", v46, v75);
        v47 = (double *)v42[1];
        if (a4 || !v44 || (components[0] == *(v47 - 8) ? (v48 = components[1] == *(v47 - 7)) : (v48 = 0), !v48))
        {
          if ((unint64_t)v47 >= *v45)
          {
            v53 = ((char *)v47 - (_BYTE *)*v42) >> 6;
            v54 = v53 + 1;
            if ((unint64_t)(v53 + 1) >> 58)
              std::vector<TopoSubstring *>::__throw_length_error[abi:ne180100]();
            v55 = *v45 - (_QWORD)*v42;
            if (v55 >> 5 > v54)
              v54 = v55 >> 5;
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFC0)
              v56 = 0x3FFFFFFFFFFFFFFLL;
            else
              v56 = v54;
            if (v56)
              v40 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<ICDrawingOutputPoint>>((uint64_t)(v42 + 2), v56);
            else
              v40 = 0;
            v57 = &v40[8 * v53];
            v58 = *(_OWORD *)components;
            v59 = v81;
            v60 = v83;
            *((_OWORD *)v57 + 2) = v82;
            *((_OWORD *)v57 + 3) = v60;
            *(_OWORD *)v57 = v58;
            *((_OWORD *)v57 + 1) = v59;
            v62 = (char *)*v42;
            v61 = (char *)v42[1];
            v63 = v57;
            if (v61 != *v42)
            {
              do
              {
                v64 = *((_OWORD *)v61 - 4);
                v65 = *((_OWORD *)v61 - 3);
                v66 = *((_OWORD *)v61 - 1);
                *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
                *((_OWORD *)v63 - 1) = v66;
                *((_OWORD *)v63 - 4) = v64;
                *((_OWORD *)v63 - 3) = v65;
                v63 -= 8;
                v61 -= 64;
              }
              while (v61 != v62);
              v61 = (char *)*v42;
            }
            v52 = v57 + 8;
            *v42 = v63;
            v42[1] = v57 + 8;
            v42[2] = &v40[8 * v56];
            if (v61)
              operator delete(v61);
          }
          else
          {
            v49 = *(_OWORD *)components;
            v50 = v81;
            v51 = v83;
            *((_OWORD *)v47 + 2) = v82;
            *((_OWORD *)v47 + 3) = v51;
            *(_OWORD *)v47 = v49;
            *((_OWORD *)v47 + 1) = v50;
            v52 = v47 + 8;
          }
          v42[1] = v52;
        }
        ++v44;
      }
      while (v44 != v43);
    }
  }
  if ((*((_BYTE *)a3 + 32) & 0x40) != 0)
  {
    v67 = (const drawing::Rectangle *)*((_QWORD *)a3 + 12);
    if (!v67)
      v67 = *(const drawing::Rectangle **)(drawing::Command::default_instance((drawing::Command *)v40) + 96);
    v68 = (drawing::Rectangle *)drawing::Rectangle::Rectangle((drawing::Rectangle *)components, v67);
    v9->_cachedBounds.origin = (CGPoint)vcvtq_f64_f32(*(float32x2_t *)((char *)&v82 + 8));
    v9->_cachedBounds.size = (CGSize)vcvtq_f64_f32(*(float32x2_t *)&v83);
    drawing::Rectangle::~Rectangle(v68);
  }

LABEL_69:
  return v9;
}

- ($1AB5FA073B851C12C2339EC22442E995)version1Parameters
{
  signed int v2;
  double v3;
  double v4;
  double v5;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v2 = -[ICDrawingCommandData type](self, "type");
  if (v2 > 3)
  {
    v3 = 0.0;
    v4 = 0.97;
  }
  else
  {
    v3 = dbl_1BDC166B0[v2];
    v4 = dbl_1BDC166D0[v2];
  }
  v5 = 0.0;
  result.var2 = v5;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- ($0CEE44BE5CDCEEF763AA42CAC61E9EDC)readPointFromArchive:(SEL)a3 deltaFrom:(const void *)a4
{
  unsigned int v5;
  int8x8_t v6;
  int32x2_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int32x2_t v11;
  int32x2_t v12;
  double var5;

  v5 = *((_DWORD *)a4 + 8);
  v6 = (int8x8_t)vdup_n_s32(v5);
  v7 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x800000004));
  v8.i64[0] = v7.i32[0];
  v8.i64[1] = v7.i32[1];
  v9 = *(int8x16_t *)&a5->var3;
  v10 = vbslq_s8(v8, *(int8x16_t *)&a5->var1, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 48)));
  v11 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x200000001));
  v8.i64[0] = v11.i32[0];
  v8.i64[1] = v11.i32[1];
  retstr->var0 = (CGPoint)vbicq_s8((int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 40)), v8);
  *(int8x16_t *)&retstr->var1 = v10;
  v12 = vceqz_s32((int32x2_t)vand_s8(v6, (int8x8_t)0x2000000010));
  v8.i64[0] = v12.i32[0];
  v8.i64[1] = v12.i32[1];
  *(int8x16_t *)&retstr->var3 = vbslq_s8(v8, v9, (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)((char *)a4 + 56)));
  var5 = *((float *)a4 + 16);
  if ((v5 & 0x40) == 0)
    var5 = a5->var5;
  retstr->var5 = var5;
  retstr->var6 = 0.0;
  return self;
}

- (unsigned)savePoint:(id *)a3 deltaFrom:(id *)a4 toArchive:(void *)a5
{
  float x;
  double y;
  float v7;
  double var1;
  float v9;
  double var2;
  float v11;
  double var3;
  float v13;
  double var4;
  float v15;
  double var5;
  float v17;

  if (a3->var0.x != 0.0)
  {
    x = a3->var0.x;
    *((_DWORD *)a5 + 8) |= 1u;
    *((float *)a5 + 10) = x;
  }
  y = a3->var0.y;
  if (y != 0.0)
  {
    v7 = y;
    *((_DWORD *)a5 + 8) |= 2u;
    *((float *)a5 + 11) = v7;
  }
  var1 = a3->var1;
  if (var1 != a4->var1)
  {
    v9 = var1;
    *((_DWORD *)a5 + 8) |= 4u;
    *((float *)a5 + 12) = v9;
  }
  var2 = a3->var2;
  if (var2 != a4->var2)
  {
    v11 = var2;
    *((_DWORD *)a5 + 8) |= 8u;
    *((float *)a5 + 13) = v11;
  }
  var3 = a3->var3;
  if (var3 != a4->var3)
  {
    v13 = var3;
    *((_DWORD *)a5 + 8) |= 0x10u;
    *((float *)a5 + 14) = v13;
  }
  var4 = a3->var4;
  if (var4 != a4->var4)
  {
    v15 = var4;
    *((_DWORD *)a5 + 8) |= 0x20u;
    *((float *)a5 + 15) = v15;
  }
  var5 = a3->var5;
  if (var5 == a4->var5)
    return 1;
  v17 = var5;
  *((_DWORD *)a5 + 8) |= 0x40u;
  *((float *)a5 + 16) = v17;
  return 4;
}

- (unsigned)saveToArchive:(void *)a3 sortedUUIDs:(id)a4 withPathData:(BOOL)a5 isHidden:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  unsigned int v11;
  CGColorSpace *ColorSpace;
  float64x2_t *Components;
  float32x2_t *v14;
  float32_t v15;
  float32_t Alpha;
  drawing::CommandID *v17;
  int v18;
  drawing::CommandID *v19;
  int v20;
  int v21;
  drawing::CommandID *v22;
  unsigned int v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  drawing::Point *v31;
  uint64_t v32;
  int32x2_t v33;
  uint64_t v34;
  drawing::Point *v35;
  unsigned int v36;
  drawing::Point *v37;
  double v38;
  uint64_t v39;
  double v40;
  float v41;
  drawing::Point *v42;
  double v43;
  uint64_t v44;
  double v45;
  float v46;
  double x;
  double y;
  double width;
  double height;
  uint64_t v51;
  float v52;
  int v53;
  float v54;
  float v55;
  float v56;
  drawing::Point *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  float v68;
  double v69;
  double v70;
  float v71;
  BOOL v72;
  int v73;
  int v75;
  id v76;
  int v77;
  CGRect v78;

  v7 = a5;
  v10 = a4;
  v11 = -[ICDrawingCommandData type](self, "type");
  *((_DWORD *)a3 + 8) |= 2u;
  *((_DWORD *)a3 + 32) = v11;
  ColorSpace = CGColorGetColorSpace(-[ICDrawingCommandData color](self, "color"));
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
  {
    Components = (float64x2_t *)CGColorGetComponents(-[ICDrawingCommandData color](self, "color"));
    *((_DWORD *)a3 + 8) |= 4u;
    v14 = (float32x2_t *)*((_QWORD *)a3 + 6);
    if (!v14)
    {
      v14 = (float32x2_t *)operator new();
      drawing::Color::Color((drawing::Color *)v14);
      *((_QWORD *)a3 + 6) = v14;
    }
    v14[4].i32[0] |= 1u;
    *((_DWORD *)a3 + 8) |= 4u;
    v14[4].i32[0] |= 2u;
    v14[5] = vcvt_f32_f64(*Components);
    *((_DWORD *)a3 + 8) |= 4u;
    v15 = Components[1].f64[0];
    v14[4].i32[0] |= 4u;
    v14[6].f32[0] = v15;
    *((_DWORD *)a3 + 8) |= 4u;
    Alpha = CGColorGetAlpha(-[ICDrawingCommandData color](self, "color"));
    v14[4].i32[0] |= 8u;
    v14[6].f32[1] = Alpha;
  }
  *((_DWORD *)a3 + 8) |= 1u;
  v17 = (drawing::CommandID *)*((_QWORD *)a3 + 5);
  if (!v17)
  {
    v17 = (drawing::CommandID *)operator new();
    drawing::CommandID::CommandID(v17);
    *((_QWORD *)a3 + 5) = v17;
  }
  -[ICDrawingCommandData commandID](self, "commandID");
  v18 = v75;
  *((_DWORD *)v17 + 8) |= 1u;
  *((_DWORD *)v17 + 10) = v18;

  *((_DWORD *)a3 + 8) |= 1u;
  v19 = (drawing::CommandID *)*((_QWORD *)a3 + 5);
  if (!v19)
  {
    v19 = (drawing::CommandID *)operator new();
    drawing::CommandID::CommandID(v19);
    *((_QWORD *)a3 + 5) = v19;
  }
  -[ICDrawingCommandData commandID](self, "commandID");
  v20 = v77;
  *((_DWORD *)v19 + 8) |= 2u;
  *((_DWORD *)v19 + 11) = v20;

  -[ICDrawingCommandData commandID](self, "commandID");
  v21 = objc_msgSend(v10, "indexOfObject:", v76);

  *((_DWORD *)a3 + 8) |= 1u;
  v22 = (drawing::CommandID *)*((_QWORD *)a3 + 5);
  if (!v22)
  {
    v22 = (drawing::CommandID *)operator new();
    drawing::CommandID::CommandID(v22);
    *((_QWORD *)a3 + 5) = v22;
  }
  *((_DWORD *)v22 + 8) |= 4u;
  *((_DWORD *)v22 + 12) = v21;
  if (a6)
  {
    v23 = 1;
  }
  else
  {
    if (v7)
    {
      v24 = -[ICDrawingCommandData points](self, "points");
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 16, (unint64_t)(v24[1] - *v24) >> 6);
      v25 = v24[1] - *v24;
      if ((v25 & 0x3FFFFFFFC0) != 0)
      {
        v26 = 0;
        v27 = (v25 >> 6);
        do
        {
          v28 = *((_DWORD *)a3 + 19);
          v29 = *((int *)a3 + 18);
          if ((int)v29 >= v28)
          {
            if (v28 == *((_DWORD *)a3 + 20))
              google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 16, v28 + 1);
            v31 = google::protobuf::internal::GenericTypeHandler<drawing::Point>::New();
            v32 = *((_QWORD *)a3 + 8);
            v33 = *(int32x2_t *)((char *)a3 + 72);
            *((int32x2_t *)a3 + 9) = vadd_s32(v33, (int32x2_t)0x100000001);
            *(_QWORD *)(v32 + 8 * v33.i32[0]) = v31;
          }
          else
          {
            v30 = *((_QWORD *)a3 + 8);
            *((_DWORD *)a3 + 18) = v29 + 1;
            v31 = *(drawing::Point **)(v30 + 8 * v29);
          }
          v34 = *v24;
          -[ICDrawingCommandData baseValues](self, "baseValues");
          -[ICDrawingCommandData savePoint:deltaFrom:toArchive:](self, "savePoint:deltaFrom:toArchive:", v34 + v26, &v75, v31);
          v26 += 64;
          --v27;
        }
        while (v27);
      }
      -[ICDrawingCommandData baseValues](self, "baseValues");
      *((_DWORD *)a3 + 8) |= 8u;
      v35 = (drawing::Point *)*((_QWORD *)a3 + 7);
      if (!v35)
      {
        v35 = (drawing::Point *)operator new();
        drawing::Point::Point(v35);
        *((_QWORD *)a3 + 7) = v35;
      }
      v36 = -[ICDrawingCommandData savePoint:deltaFrom:toArchive:](self, "savePoint:deltaFrom:toArchive:", &v75, &ICDrawingOutputPointDefault, v35);
      if (v36 <= 1)
        v23 = 1;
      else
        v23 = v36;
      if (-[ICDrawingCommandData isClipped](self, "isClipped"))
      {
        *((_DWORD *)a3 + 8) |= 0x80u;
        v37 = (drawing::Point *)*((_QWORD *)a3 + 13);
        if (!v37)
        {
          v37 = (drawing::Point *)operator new();
          drawing::Point::Point(v37);
          *((_QWORD *)a3 + 13) = v37;
        }
        -[ICDrawingCommandData clipOrigin](self, "clipOrigin");
        *(float *)&v38 = v38;
        *((_DWORD *)v37 + 8) |= 1u;
        *((_DWORD *)v37 + 10) = LODWORD(v38);
        *((_DWORD *)a3 + 8) |= 0x80u;
        v39 = *((_QWORD *)a3 + 13);
        if (!v39)
        {
          v39 = operator new();
          drawing::Point::Point((drawing::Point *)v39);
          *((_QWORD *)a3 + 13) = v39;
        }
        -[ICDrawingCommandData clipOrigin](self, "clipOrigin");
        v41 = v40;
        *(_DWORD *)(v39 + 32) |= 2u;
        *(float *)(v39 + 44) = v41;
        *((_DWORD *)a3 + 8) |= 0x100u;
        v42 = (drawing::Point *)*((_QWORD *)a3 + 14);
        if (!v42)
        {
          v42 = (drawing::Point *)operator new();
          drawing::Point::Point(v42);
          *((_QWORD *)a3 + 14) = v42;
        }
        -[ICDrawingCommandData clipNormal](self, "clipNormal");
        *(float *)&v43 = v43;
        *((_DWORD *)v42 + 8) |= 1u;
        *((_DWORD *)v42 + 10) = LODWORD(v43);
        *((_DWORD *)a3 + 8) |= 0x100u;
        v44 = *((_QWORD *)a3 + 14);
        if (!v44)
        {
          v44 = operator new();
          drawing::Point::Point((drawing::Point *)v44);
          *((_QWORD *)a3 + 14) = v44;
        }
        -[ICDrawingCommandData clipNormal](self, "clipNormal");
        v46 = v45;
        *(_DWORD *)(v44 + 32) |= 2u;
        *(float *)(v44 + 44) = v46;
      }
    }
    else
    {
      v23 = 1;
    }
    -[ICDrawingCommandData bounds](self, "bounds");
    x = v78.origin.x;
    y = v78.origin.y;
    width = v78.size.width;
    height = v78.size.height;
    if (!CGRectIsNull(v78))
    {
      *((_DWORD *)a3 + 8) |= 0x40u;
      v51 = *((_QWORD *)a3 + 12);
      if (!v51)
      {
        v51 = operator new();
        drawing::Rectangle::Rectangle((drawing::Rectangle *)v51);
        *((_QWORD *)a3 + 12) = v51;
      }
      v52 = x;
      v53 = *(_DWORD *)(v51 + 32);
      v54 = y;
      *(float *)(v51 + 40) = v52;
      *(float *)(v51 + 44) = v54;
      v55 = width;
      v56 = height;
      *(_DWORD *)(v51 + 32) = v53 | 0xF;
      *(float *)(v51 + 48) = v55;
      *(float *)(v51 + 52) = v56;
    }
    -[ICDrawingCommandData baseValues](self, "baseValues");
    *((_DWORD *)a3 + 8) |= 8u;
    v57 = (drawing::Point *)*((_QWORD *)a3 + 7);
    if (!v57)
    {
      v57 = (drawing::Point *)operator new();
      drawing::Point::Point(v57);
      *((_QWORD *)a3 + 7) = v57;
    }
    -[ICDrawingCommandData savePoint:deltaFrom:toArchive:](self, "savePoint:deltaFrom:toArchive:", &v75, &ICDrawingOutputPointDefault, v57);
    -[ICDrawingCommandData version1Parameters](self, "version1Parameters");
    v59 = v58;
    v61 = v60;
    -[ICDrawingCommandData parameters](self, "parameters");
    if (vabdd_f64(v62, v59) >= 0.00999999978
      || (-[ICDrawingCommandData parameters](self, "parameters"), vabdd_f64(v63, v61) >= 0.00999999978)
      || (-[ICDrawingCommandData parameters](self, "parameters"), v64 > 0.0))
    {
      *((_DWORD *)a3 + 8) |= 0x200u;
      v65 = *((_QWORD *)a3 + 15);
      if (!v65)
      {
        v65 = operator new();
        drawing::Parameters::Parameters((drawing::Parameters *)v65);
        *((_QWORD *)a3 + 15) = v65;
      }
      -[ICDrawingCommandData parameters](self, "parameters");
      *(float *)&v66 = v66;
      *(_DWORD *)(v65 + 32) |= 1u;
      *(_DWORD *)(v65 + 40) = LODWORD(v66);
      -[ICDrawingCommandData parameters](self, "parameters");
      v68 = v67;
      *(_DWORD *)(v65 + 32) |= 2u;
      *(float *)(v65 + 44) = v68;
      -[ICDrawingCommandData parameters](self, "parameters");
      if (v69 <= 0.0)
      {
        v72 = v23 > 2;
        v73 = 2;
      }
      else
      {
        -[ICDrawingCommandData parameters](self, "parameters");
        v71 = v70;
        *(_DWORD *)(v65 + 32) |= 4u;
        *(float *)(v65 + 48) = v71;
        v72 = v23 > 3;
        v73 = 3;
      }
      if (!v72)
        v23 = v73;
    }
  }

  return v23;
}

@end
