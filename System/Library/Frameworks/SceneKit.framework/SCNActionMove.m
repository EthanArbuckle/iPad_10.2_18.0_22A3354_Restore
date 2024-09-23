@implementation SCNActionMove

- (SCNActionMove)init
{
  SCNActionMove *v2;
  SCNCActionMove *v3;
  SCNCAction *v4;
  SCNCActionMove *mycaction;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNActionMove;
  v2 = -[SCNAction init](&v9, sel_init);
  if (v2)
  {
    v3 = (SCNCActionMove *)operator new();
    v8.receiver = v2;
    v8.super_class = (Class)SCNActionMove;
    v4 = -[SCNAction caction](&v8, sel_caction);
    SCNCActionMove::SCNCActionMove(v3, v4);
    v2->_mycaction = v3;
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionMove;
    -[SCNAction setCppAction:](&v7, sel_setCppAction_, v3);
    mycaction = v2->_mycaction;
    mycaction->var19 = 0.0;
    LOWORD(mycaction[1].var6) = 0;
  }
  return v2;
}

- (SCNActionMove)initWithCoder:(id)a3
{
  SCNActionMove *v4;
  SCNCActionMove *v5;
  SCNCAction *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v18;
  objc_super v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SCNActionMove;
  v4 = -[SCNAction initWithCoder:](&v20, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionMove *)operator new();
    v19.receiver = v4;
    v19.super_class = (Class)SCNActionMove;
    v6 = -[SCNAction caction](&v19, sel_caction);
    SCNCActionMove::SCNCActionMove(v5, v6);
    v4->_mycaction = v5;
    v18.receiver = v4;
    v18.super_class = (Class)SCNActionMove;
    -[SCNAction setCppAction:](&v18, sel_setCppAction_, v5);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastRatio")), "doubleValue");
    v4->_mycaction->var19 = v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTarget.x")), "doubleValue");
    *(float *)&v8 = v8;
    LODWORD(v4->_mycaction[1].var2) = LODWORD(v8);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTarget.y")), "doubleValue");
    *(float *)&v9 = v9;
    HIDWORD(v4->_mycaction[1].var2) = LODWORD(v9);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTarget.z")), "doubleValue");
    *(float *)&v10 = v10;
    LODWORD(v4->_mycaction[1].var3) = LODWORD(v10);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTargetReversed.x")), "doubleValue");
    *(float *)&v11 = v11;
    *(_DWORD *)&v4->_mycaction[1].var4 = LODWORD(v11);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTargetReversed.y")), "doubleValue");
    *(float *)&v12 = v12;
    *((_DWORD *)&v4->_mycaction[1].var4 + 1) = LODWORD(v12);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posTargetReversed.z")), "doubleValue");
    *(float *)&v13 = v13;
    LODWORD(v4->_mycaction[1].var5) = LODWORD(v13);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posStart.x")), "doubleValue");
    *(float *)&v14 = v14;
    LODWORD(v4->_mycaction[1].var0) = LODWORD(v14);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posStart.y")), "doubleValue");
    *(float *)&v15 = v15;
    HIDWORD(v4->_mycaction[1].var0) = LODWORD(v15);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posStart.z")), "doubleValue");
    *(float *)&v16 = v16;
    LODWORD(v4->_mycaction[1].var1) = LODWORD(v16);
    LOBYTE(v4->_mycaction[1].var6) = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isReversed")), "BOOLValue");
    BYTE1(v4->_mycaction[1].var6) = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isRelative")), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionMove;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mycaction->var19), CFSTR("_lastRatio"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var2), CFSTR("_posTarget.x"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&self->_mycaction[1].var2 + 1)), CFSTR("_posTarget.y"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var3), CFSTR("_posTarget.z"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var4), CFSTR("_posTargetReversed.x"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&self->_mycaction[1].var4 + 1)), CFSTR("_posTargetReversed.y"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var5), CFSTR("_posTargetReversed.z"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var0), CFSTR("_posStart.x"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((float *)&self->_mycaction[1].var0 + 1)), CFSTR("_posStart.y"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)&self->_mycaction[1].var1), CFSTR("_posStart.z"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(self->_mycaction[1].var6)), CFSTR("_isReversed"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(self->_mycaction[1].var6)), CFSTR("_isRelative"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)moveBy:(SCNVector3)a3 duration:(double)a4
{
  return +[SCNActionMove moveByX:y:z:duration:](SCNActionMove, "moveByX:y:z:duration:", a3.x, a3.y, a3.z, a4);
}

+ (id)moveByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  SCNActionMove *v10;
  float v11;
  float v12;
  float v13;

  v10 = objc_alloc_init(SCNActionMove);
  v11 = a3;
  *(float *)&v10->_mycaction[1].var2 = v11;
  v12 = a4;
  *((float *)&v10->_mycaction[1].var2 + 1) = v12;
  v13 = a5;
  *(float *)&v10->_mycaction[1].var3 = v13;
  *(float *)&v10->_mycaction[1].var4 = -v11;
  *((float *)&v10->_mycaction[1].var4 + 1) = -v12;
  *(float *)&v10->_mycaction[1].var5 = -v13;
  LOWORD(v10->_mycaction[1].var6) = 256;
  -[SCNAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

+ (id)moveTo:(SCNVector3)a3 duration:(double)a4
{
  return +[SCNActionMove moveToX:y:z:duration:](SCNActionMove, "moveToX:y:z:duration:", a3.x, a3.y, a3.z, a4);
}

+ (id)moveToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  SCNActionMove *v10;
  float v11;
  float v12;
  float v13;

  v10 = objc_alloc_init(SCNActionMove);
  v11 = a3;
  *(float *)&v10->_mycaction[1].var2 = v11;
  v12 = a4;
  *((float *)&v10->_mycaction[1].var2 + 1) = v12;
  v13 = a5;
  *(float *)&v10->_mycaction[1].var3 = v13;
  *(float *)&v10->_mycaction[1].var4 = v11;
  *((float *)&v10->_mycaction[1].var4 + 1) = v12;
  *(float *)&v10->_mycaction[1].var5 = v13;
  BYTE1(v10->_mycaction[1].var6) = 0;
  -[SCNAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  SCNCActionMove *mycaction;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNActionMove;
  result = -[SCNAction copyWithZone:](&v7, sel_copyWithZone_, a3);
  mycaction = self->_mycaction;
  v6 = *((_QWORD *)result + 2);
  *(double *)(v6 + 144) = mycaction->var19;
  *(_OWORD *)(v6 + 176) = *(_OWORD *)&mycaction[1].var2;
  *(_OWORD *)(*((_QWORD *)result + 2) + 192) = *(_OWORD *)&self->_mycaction[1].var4;
  *(_OWORD *)(*((_QWORD *)result + 2) + 160) = *(_OWORD *)&self->_mycaction[1].var0;
  *(_WORD *)(*((_QWORD *)result + 2) + 208) = LOWORD(self->_mycaction[1].var6);
  return result;
}

- (id)reversedAction
{
  uint64_t v3;
  _QWORD *v4;
  SCNCActionMove *mycaction;
  uint64_t v6;
  SCNCActionMove *v7;
  uint64_t v8;
  objc_super v10;

  v3 = MEMORY[0x1DF0D3F5C](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SCNActionMove;
  v4 = -[SCNAction copyWithZone:](&v10, sel_copyWithZone_, v3);
  mycaction = self->_mycaction;
  v6 = v4[2];
  *(double *)(v6 + 144) = mycaction->var19;
  *(_OWORD *)(v6 + 176) = *(_OWORD *)&mycaction[1].var4;
  *(_OWORD *)(v4[2] + 192) = *(_OWORD *)&self->_mycaction[1].var2;
  *(_OWORD *)(v4[2] + 160) = *(_OWORD *)&self->_mycaction[1].var0;
  v7 = self->_mycaction;
  v8 = v4[2];
  *(_BYTE *)(v8 + 209) = BYTE1(v7[1].var6);
  *(_BYTE *)(v8 + 208) = LOBYTE(v7[1].var6) ^ 1;
  return v4;
}

- (BOOL)isRelative
{
  return BYTE1(self->_mycaction[1].var6);
}

- (id)parameters
{
  double v2;
  double v4;
  double v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = self->_mycaction[1].var2;
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  LODWORD(v4) = HIDWORD(self->_mycaction[1].var2);
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4, v7[0]);
  LODWORD(v5) = self->_mycaction[1].var3;
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
}

@end
