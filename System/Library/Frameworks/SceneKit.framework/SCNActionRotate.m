@implementation SCNActionRotate

- (SCNActionRotate)init
{
  SCNActionRotate *v2;
  SCNCActionRotate *v3;
  SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionRotate;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SCNCActionRotate *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionRotate;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCActionRotate::SCNCActionRotate(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionRotate;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
    v2->_mycaction->var19 = 0.0;
    *(_DWORD *)&v2->_mycaction->var20 = 0;
    *(_DWORD *)&v2->_mycaction->var24 = 0;
    LODWORD(v2->_mycaction[1].var2) = 0;
    HIDWORD(v2->_mycaction[1].var2) = 0;
    LODWORD(v2->_mycaction[1].var3) = 0;
    *(_DWORD *)&v2->_mycaction[1].var10 = 0;
    *(_DWORD *)(&v2->_mycaction[1].var11 + 3) = 0;
    LODWORD(v2->_mycaction[1].var12) = 0;
    HIDWORD(v2->_mycaction[1].var12) = 0;
    *(_DWORD *)&v2->_mycaction[1].var4 = 0;
    *((_DWORD *)&v2->_mycaction[1].var4 + 1) = 0;
    LODWORD(v2->_mycaction[1].var5) = 0;
    HIDWORD(v2->_mycaction[1].var5) = 0;
    LODWORD(v2->_mycaction[1].var15) = 0x10000;
  }
  return v2;
}

- (SCNActionRotate)initWithCoder:(id)a3
{
  SCNActionRotate *v4;
  SCNCActionRotate *v5;
  SCNCAction *v6;
  __int128 v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  __int128 v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  objc_super v23;
  objc_super v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SCNActionRotate;
  v4 = -[SCNAction initWithCoder:](&v25, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionRotate *)operator new();
    v24.receiver = v4;
    v24.super_class = (Class)SCNActionRotate;
    v6 = -[SCNAction caction](&v24, sel_caction);
    SCNCActionRotate::SCNCActionRotate(v5, v6);
    v4->_mycaction = v5;
    v23.receiver = v4;
    v23.super_class = (Class)SCNActionRotate;
    -[SCNAction setCppAction:](&v23, sel_setCppAction_, v5);
    *(float *)&v7 = SCNDecodeVector4(a3, (uint64_t)CFSTR("_axisRot"));
    DWORD1(v7) = v8;
    *((_QWORD *)&v7 + 1) = __PAIR64__(v10, v9);
    *(_OWORD *)&v4->_mycaction[1].var4 = v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotX")), "doubleValue");
    *(float *)&v11 = v11;
    v4->_mycaction->var19 = *(float *)&v11;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotY")), "doubleValue");
    *(float *)&v12 = v12;
    *(_DWORD *)&v4->_mycaction->var20 = LODWORD(v12);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rotZ")), "doubleValue");
    *(float *)&v13 = v13;
    *(_DWORD *)&v4->_mycaction->var24 = LODWORD(v13);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotX")), "doubleValue");
    *(float *)&v14 = v14;
    LODWORD(v4->_mycaction[1].var2) = LODWORD(v14);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotY")), "doubleValue");
    *(float *)&v15 = v15;
    HIDWORD(v4->_mycaction[1].var2) = LODWORD(v15);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRotZ")), "doubleValue");
    *(float *)&v16 = v16;
    LODWORD(v4->_mycaction[1].var3) = LODWORD(v16);
    BYTE1(v4->_mycaction[1].var15) = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed")), "BOOLValue");
    BYTE2(v4->_mycaction[1].var15) = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative")), "BOOLValue");
    LOBYTE(v4->_mycaction[1].var15) = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isAxisAngle")), "BOOLValue");
    v17 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isUnitArc")), "BOOLValue");
    BYTE3(v4->_mycaction[1].var15) = v17;
    if (v17)
    {
      *(float *)&v18 = SCNDecodeVector4(a3, (uint64_t)CFSTR("_qRot"));
      DWORD1(v18) = v19;
      *((_QWORD *)&v18 + 1) = __PAIR64__(v21, v20);
      *(_OWORD *)&v4->_mycaction[1].var10 = v18;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  SCNCActionRotate *mycaction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNActionRotate;
  -[SCNAction encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19), CFSTR("_rotX"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction->var20), CFSTR("_rotY"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction->var24), CFSTR("_rotZ"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var2), CFSTR("_lastRotX"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&self->_mycaction[1].var2 + 1)), CFSTR("_lastRotY"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var3), CFSTR("_lastRotZ"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(self->_mycaction[1].var15)), CFSTR("_isReversed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE2(self->_mycaction[1].var15)), CFSTR("_isRelative"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(self->_mycaction[1].var15)), CFSTR("_isAxisAngle"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE3(self->_mycaction[1].var15)), CFSTR("_isUnitArc"));
  SCNEncodeVector4(a3, (uint64_t)CFSTR("_axisRot"), *(float *)&self->_mycaction[1].var4, *((float *)&self->_mycaction[1].var4 + 1), *(float *)&self->_mycaction[1].var5, *((float *)&self->_mycaction[1].var5 + 1));
  mycaction = self->_mycaction;
  if (BYTE3(mycaction[1].var15))
    SCNEncodeVector4(a3, (uint64_t)CFSTR("_qRot"), *(float *)&mycaction[1].var10, *(float *)(&mycaction[1].var11 + 3), *(float *)&mycaction[1].var12, *((float *)&mycaction[1].var12 + 1));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  SCNActionRotate *v10;
  SCNCActionRotate *mycaction;
  float v12;
  float v13;
  float v14;

  v10 = objc_alloc_init(SCNActionRotate);
  mycaction = v10->_mycaction;
  BYTE2(mycaction[1].var15) = 1;
  v12 = a3;
  mycaction->var19 = v12;
  v13 = a4;
  *(float *)&v10->_mycaction->var20 = v13;
  v14 = a5;
  *(float *)&v10->_mycaction->var24 = v14;
  -[SCNAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  return +[SCNActionRotate rotateToX:y:z:duration:shortestUnitArc:](SCNActionRotate, "rotateToX:y:z:duration:shortestUnitArc:", 0, a3, a4, a5, a6);
}

+ (id)rotateByAngle:(double)a3 aroundAxis:(SCNVector3)a4 duration:(double)a5
{
  float z;
  float y;
  float x;
  SCNActionRotate *v10;
  SCNCActionRotate *mycaction;
  SCNCActionRotate *v12;
  float v13;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v10 = objc_alloc_init(SCNActionRotate);
  mycaction = v10->_mycaction;
  *(float *)&mycaction[1].var4 = x;
  v12 = v10->_mycaction;
  BYTE2(mycaction[1].var15) = 1;
  *((float *)&v12[1].var4 + 1) = y;
  *(float *)&v10->_mycaction[1].var5 = z;
  v13 = a3;
  *((float *)&v10->_mycaction[1].var5 + 1) = v13;
  LOBYTE(v10->_mycaction[1].var15) = 1;
  -[SCNAction setDuration:](v10, "setDuration:", a5);
  return v10;
}

+ (id)rotateToAxisAngle:(SCNVector4)a3 duration:(double)a4
{
  SCNActionRotate *v5;
  SCNCActionRotate *mycaction;
  __int128 v7;
  float x;
  float y;
  float z;
  float w;

  w = a3.w;
  z = a3.z;
  y = a3.y;
  x = a3.x;
  v5 = objc_alloc_init(SCNActionRotate);
  mycaction = v5->_mycaction;
  *(_QWORD *)&v7 = __PAIR64__(LODWORD(y), LODWORD(x));
  *((_QWORD *)&v7 + 1) = __PAIR64__(LODWORD(w), LODWORD(z));
  BYTE2(mycaction[1].var15) = 0;
  *(_OWORD *)&mycaction[1].var4 = v7;
  LOBYTE(v5->_mycaction[1].var15) = 1;
  -[SCNAction setDuration:](v5, "setDuration:", a4);
  return v5;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6 shortestUnitArc:(BOOL)a7
{
  SCNActionRotate *v12;
  SCNCActionRotate *mycaction;
  float v14;
  float v15;
  float v16;

  v12 = objc_alloc_init(SCNActionRotate);
  mycaction = v12->_mycaction;
  BYTE2(mycaction[1].var15) = 0;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (a7)
  {
    C3DQuaternionMakeEuler(&mycaction[1].var10, v14, v15, v16);
    mycaction = v12->_mycaction;
  }
  mycaction->var19 = v14;
  *(float *)&v12->_mycaction->var20 = v15;
  *(float *)&v12->_mycaction->var24 = v16;
  -[SCNAction setDuration:](v12, "setDuration:", a6);
  BYTE3(v12->_mycaction[1].var15) = a7;
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SCNCActionRotate *mycaction;
  uint64_t v6;
  SCNCActionRotate *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNActionRotate;
  result = -[SCNAction copyWithZone:](&v9, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(_DWORD *)(v6 + 272) = LODWORD(mycaction[1].var15);
  *(_OWORD *)(v6 + 144) = *(_OWORD *)&mycaction->var19;
  *(_OWORD *)(*((_QWORD *)result + 2) + 192) = *(_OWORD *)&self->_mycaction[1].var4;
  *(_OWORD *)(*((_QWORD *)result + 2) + 240) = *(_OWORD *)&self->_mycaction[1].var10;
  v7 = self->_mycaction;
  v8 = *((_QWORD *)result + 2);
  *(_OWORD *)(v8 + 56) = *(_OWORD *)&v7->var7;
  *(_QWORD *)(v8 + 104) = v7->var14;
  *(_OWORD *)(v8 + 120) = *(_OWORD *)&v7->var16;
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  int8x16_t v5;
  int8x16_t v6;
  void *v7;
  SCNCActionRotate *mycaction;
  uint64_t v9;
  int var15_low;
  __int128 v11;
  SCNCActionRotate *v12;
  objc_super v14;

  v3 = MEMORY[0x1DF0D3F5C](self, a2);
  v14.receiver = self;
  v14.super_class = (Class)SCNActionRotate;
  v4 = -[SCNAction copyWithZone:](&v14, sel_copyWithZone_, v3);
  v7 = v4;
  mycaction = self->_mycaction;
  v9 = v4[2];
  *(_WORD *)(v9 + 274) = WORD1(mycaction[1].var15);
  *(_BYTE *)(v9 + 273) = BYTE1(mycaction[1].var15) ^ 1;
  var15_low = LOBYTE(mycaction[1].var15);
  *(_BYTE *)(v9 + 272) = var15_low;
  if (var15_low)
  {
    v11 = *(_OWORD *)&mycaction[1].var4;
    *(_OWORD *)(v9 + 192) = v11;
    v12 = self->_mycaction;
    if (BYTE2(v12[1].var15))
    {
      *(float *)&v11 = -*((float *)&v12[1].var5 + 1);
      *(_DWORD *)(v4[2] + 204) = v11;
    }
  }
  else
  {
    v5.i32[0] = 0;
    v6.i8[0] = BYTE2(mycaction[1].var15);
    *(int8x16_t *)(v9 + 144) = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v6, v5), 0), *(int8x16_t *)&mycaction->var19, (int8x16_t)vnegq_f32(*(float32x4_t *)&mycaction->var19));
    v11 = *(_OWORD *)&self->_mycaction[1].var10;
    *(_OWORD *)(v4[2] + 240) = v11;
    if (BYTE2(self->_mycaction[1].var15))
      *(_QWORD *)&v11 = C3DQuaternionConjugate((float32x4_t *)(v4[2] + 240)).n128_u64[0];
  }
  -[SCNAction duration](self, "duration", *(double *)&v11);
  objc_msgSend(v7, "setDuration:");
  return v7;
}

- (BOOL)isRelative
{
  return BYTE2(self->_mycaction[1].var15);
}

- (id)parameters
{
  double v2;
  SCNCActionRotate *mycaction;
  double v5;
  double v6;
  double v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  _QWORD v14[4];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  mycaction = self->_mycaction;
  if (LOBYTE(mycaction[1].var15))
  {
    LODWORD(v2) = *(_DWORD *)&mycaction[1].var4;
    v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
    LODWORD(v5) = *((_DWORD *)&self->_mycaction[1].var4 + 1);
    v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    LODWORD(v6) = LODWORD(self->_mycaction[1].var5);
    v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    LODWORD(v7) = HIDWORD(self->_mycaction[1].var5);
    v15[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v15[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BYTE3(self->_mycaction[1].var15));
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v15;
    v10 = 5;
  }
  else
  {
    *(float *)&v2 = mycaction->var19;
    v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
    LODWORD(v11) = *(_DWORD *)&self->_mycaction->var20;
    v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11, v14[0]);
    LODWORD(v12) = *(_DWORD *)&self->_mycaction->var24;
    v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
    v14[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BYTE3(self->_mycaction[1].var15));
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v14;
    v10 = 4;
  }
  return (id)objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
}

@end
