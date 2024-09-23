@implementation SKFollowPath

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKFollowPath)init
{
  SKFollowPath *v2;
  SKCFollowPath *v3;
  SKCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKFollowPath;
  v2 = -[SKAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SKCFollowPath *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SKFollowPath;
    v4 = -[SKAction caction](&v7, sel_caction);
    SKCFollowPath::SKCFollowPath(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SKFollowPath;
    -[SKAction setCppAction:](&v6, sel_setCppAction_, v3);
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKFollowPath;
  -[SKAction encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  PKArrayFromCGPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_cgPath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_isOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_mycaction->var24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_orient"));

}

- (SKFollowPath)initWithCoder:(id)a3
{
  id v4;
  SKFollowPath *v5;
  SKCFollowPath *v6;
  SKCAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKFollowPath;
  v5 = -[SKAction initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (SKCFollowPath *)operator new();
    v16.receiver = v5;
    v16.super_class = (Class)SKFollowPath;
    v7 = -[SKAction caction](&v16, sel_caction);
    SKCFollowPath::SKCFollowPath(v6, v7);
    v5->_mycaction = v6;
    v15.receiver = v5;
    v15.super_class = (Class)SKFollowPath;
    -[SKAction setCppAction:](&v15, sel_setCppAction_, v6);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v18[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_cgPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cgPath = (CGPath *)PKCGPathCreateFromArray();

    v5->_mycaction->var21 = (PKPath *)PKPathCreateFromCGPathWithOptions();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isOffset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var23 = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_orient"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mycaction->var24 = objc_msgSend(v13, "BOOLValue");

  }
  return v5;
}

+ (id)followPath:(CGPath *)a3 duration:(double)a4
{
  SKFollowPath *v6;

  v6 = objc_alloc_init(SKFollowPath);
  v6->_cgPath = a3;
  CGPathRetain(a3);
  v6->_mycaction->var21 = (PKPath *)PKPathCreateFromCGPathWithOptions();
  *(_WORD *)&v6->_mycaction->var23 = 257;
  -[SKAction setDuration:](v6, "setDuration:", a4);
  return v6;
}

+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 duration:(double)a6
{
  SKFollowPath *v10;
  SKCFollowPath *mycaction;

  v10 = objc_alloc_init(SKFollowPath);
  v10->_cgPath = (CGPath *)MEMORY[0x1DF0CEF24](a3);
  v10->_mycaction->var21 = (PKPath *)PKPathCreateFromCGPathWithOptions();
  mycaction = v10->_mycaction;
  mycaction->var23 = a4;
  mycaction->var24 = a5;
  -[SKAction setDuration:](v10, "setDuration:", a6);
  return v10;
}

+ (id)followPath:(CGPath *)a3 speed:(double)a4
{
  SKFollowPath *v6;
  float *v7;
  float v8;
  float v9;
  double v10;

  v6 = objc_alloc_init(SKFollowPath);
  v6->_cgPath = a3;
  CGPathRetain(a3);
  v7 = (float *)PKPathCreateFromCGPathWithOptions();
  v6->_mycaction->var21 = (PKPath *)v7;
  *(_WORD *)&v6->_mycaction->var23 = 257;
  v8 = a4;
  v9 = v8;
  v10 = 3.40282347e38;
  if ((LODWORD(v9) & 0x80000000) == 0 && (LODWORD(v9) & 0x60000000) != 0)
    v10 = *v7 / a4;
  -[SKAction setDuration:](v6, "setDuration:", v10);
  return v6;
}

+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 speed:(double)a6
{
  SKFollowPath *v10;
  float *v11;
  SKCFollowPath *mycaction;
  float v13;
  float v14;
  double v15;

  v10 = objc_alloc_init(SKFollowPath);
  v10->_cgPath = (CGPath *)MEMORY[0x1DF0CEF24](a3);
  v11 = (float *)PKPathCreateFromCGPathWithOptions();
  v10->_mycaction->var21 = (PKPath *)v11;
  mycaction = v10->_mycaction;
  mycaction->var23 = a4;
  mycaction->var24 = a5;
  v13 = a6;
  v14 = v13;
  v15 = 3.40282347e38;
  if ((LODWORD(v14) & 0x80000000) == 0 && (LODWORD(v14) & 0x60000000) != 0)
    v15 = *v11 / a6;
  -[SKAction setDuration:](v10, "setDuration:", v15);
  return v10;
}

- (void)dealloc
{
  CGPath *cgPath;
  objc_super v4;

  cgPath = self->_cgPath;
  if (cgPath)
    CGPathRelease(cgPath);
  v4.receiver = self;
  v4.super_class = (Class)SKFollowPath;
  -[SKAction dealloc](&v4, sel_dealloc);
}

- (id)reversedAction
{
  _QWORD *v3;
  int *v4;
  uint64_t v5;
  int v6;
  void **v7;
  _QWORD *v8;
  uint64_t v9;
  float32x2_t *v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t *v14;
  float32x2_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  float32x2_t *v21;
  float32x2_t v22;
  char **v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  PKPath *v37;

  v3 = -[SKAction copy](self, "copy");
  v4 = *(int **)(v3[2] + 120);
  if (v4)
  {
    if (self->_mycaction->var23)
    {
      v5 = operator new();
      *(_QWORD *)(v5 + 32) = 0;
      v6 = *v4;
      *(_QWORD *)(v5 + 8) = 0;
      v7 = (void **)(v5 + 8);
      *(_DWORD *)v5 = v6;
      *(_QWORD *)(v5 + 24) = 0;
      v8 = (_QWORD *)(v5 + 24);
      *(_QWORD *)(v5 + 16) = 0;
      v9 = *((_QWORD *)v4 + 2);
      if (*((_QWORD *)v4 + 1) != v9)
      {
        v10 = 0;
        v11 = *(float32x2_t *)(v9 - 8);
        do
        {
          v12 = *(float32x2_t *)(v9 - 8);
          v9 -= 8;
          v13 = vsub_f32(v12, v11);
          if ((unint64_t)v10 >= *v8)
          {
            v15 = (float32x2_t *)*v7;
            v16 = ((char *)v10 - (_BYTE *)*v7) >> 3;
            v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) >> 61)
              goto LABEL_46;
            v18 = *v8 - (_QWORD)v15;
            if (v18 >> 2 > v17)
              v17 = v18 >> 2;
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
              v19 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v19 = v17;
            if (v19)
            {
              v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKCLineSeg *>>((uint64_t)v8, v19);
              v15 = *(float32x2_t **)(v5 + 8);
              v10 = *(float32x2_t **)(v5 + 16);
            }
            else
            {
              v20 = 0;
            }
            v21 = (float32x2_t *)&v20[8 * v16];
            *v21 = v13;
            v14 = v21 + 1;
            if (v10 != v15)
            {
              do
              {
                v22 = v10[-1];
                --v10;
                v21[-1] = v22;
                --v21;
              }
              while (v10 != v15);
              v15 = (float32x2_t *)*v7;
            }
            *(_QWORD *)(v5 + 8) = v21;
            *(_QWORD *)(v5 + 16) = v14;
            *(_QWORD *)(v5 + 24) = &v20[8 * v19];
            if (v15)
              operator delete(v15);
          }
          else
          {
            *v10 = v13;
            v14 = v10 + 1;
          }
          *(_QWORD *)(v5 + 16) = v14;
          v10 = v14;
        }
        while (v9 != *((_QWORD *)v4 + 1));
      }
    }
    else
    {
      v5 = operator new();
      *(_OWORD *)(v5 + 8) = 0u;
      v23 = (char **)(v5 + 8);
      *(_OWORD *)(v5 + 24) = 0u;
      *(_DWORD *)v5 = *v4;
      std::vector<PKPoint>::reserve((void **)(v5 + 8), (uint64_t)(*((_QWORD *)v4 + 2) - *((_QWORD *)v4 + 1)) >> 3);
      v24 = (_QWORD *)*((_QWORD *)v4 + 2);
      if (*((_QWORD **)v4 + 1) != v24)
      {
        v25 = (_QWORD *)(v5 + 24);
        v26 = *(char **)(v5 + 16);
        do
        {
          --v24;
          if ((unint64_t)v26 >= *v25)
          {
            v27 = (v26 - *v23) >> 3;
            if ((unint64_t)(v27 + 1) >> 61)
LABEL_46:
              std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
            v28 = *v25 - (_QWORD)*v23;
            v29 = v28 >> 2;
            if (v28 >> 2 <= (unint64_t)(v27 + 1))
              v29 = v27 + 1;
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
              v30 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v30 = v29;
            if (v30)
              v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKCLineSeg *>>(v5 + 24, v30);
            else
              v31 = 0;
            v32 = &v31[8 * v27];
            *(_QWORD *)v32 = *v24;
            v26 = v32 + 8;
            v34 = *(char **)(v5 + 8);
            v33 = *(char **)(v5 + 16);
            if (v33 != v34)
            {
              do
              {
                v35 = *((_QWORD *)v33 - 1);
                v33 -= 8;
                *((_QWORD *)v32 - 1) = v35;
                v32 -= 8;
              }
              while (v33 != v34);
              v33 = *v23;
            }
            *(_QWORD *)(v5 + 8) = v32;
            *(_QWORD *)(v5 + 16) = v26;
            *(_QWORD *)(v5 + 24) = &v31[8 * v30];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *(_QWORD *)v26 = *v24;
            v26 += 8;
          }
          *(_QWORD *)(v5 + 16) = v26;
        }
        while (v24 != *((_QWORD **)v4 + 1));
      }
    }
    v36 = v3[2];
    v37 = *(PKPath **)(v36 + 120);
    if (v37)
    {
      PKPath::~PKPath(v37);
      MEMORY[0x1DF0CF560]();
      v36 = v3[2];
    }
    *(_QWORD *)(v36 + 120) = v5;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  CGPath *cgPath;
  uint64_t v6;
  PKPath *var21;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKFollowPath;
  v4 = -[SKAction copyWithZone:](&v9, sel_copyWithZone_, a3);
  cgPath = self->_cgPath;
  v4[3] = cgPath;
  if (cgPath)
  {
    CGPathRetain(cgPath);
    v6 = operator new();
    var21 = self->_mycaction->var21;
    *(_DWORD *)v6 = *(_DWORD *)var21;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)(v6 + 24) = 0;
    *(_QWORD *)(v6 + 8) = 0;
    std::vector<PKPoint>::__init_with_size[abi:ne180100]<PKPoint*,PKPoint*>((_QWORD *)(v6 + 8), *((const void **)var21 + 1), *((_QWORD *)var21 + 2), (uint64_t)(*((_QWORD *)var21 + 2) - *((_QWORD *)var21 + 1)) >> 3);
    *(_QWORD *)(v6 + 32) = 0;
    *(_QWORD *)(v4[2] + 120) = v6;
  }
  *(_WORD *)(v4[2] + 136) = *(_WORD *)&self->_mycaction->var23;
  return v4;
}

@end
