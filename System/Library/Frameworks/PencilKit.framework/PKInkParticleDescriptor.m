@implementation PKInkParticleDescriptor

- (PKInkParticleDescriptor)initWithTextureName:(id)a3 textureImage:(CGImage *)a4 maskTextureName:(id)a5 maskTextureImage:(CGImage *)a6 particleSpacing:(double)a7 particleCount:(int64_t)a8 particleSize:(CGSize)a9 particleRotation:(unint64_t)a10 maskScale:(double)a11 maskScaleConstant:(double)a12 maskMovement:(double)a13 maskDepth:(double)a14 initialRandomRotation:(BOOL)a15 maskInitialRandomOffset:(BOOL)a16 adjustEndCapParticleAlpha:(BOOL)a17 particleBlendMode:(unint64_t)a18
{
  CGFloat height;
  CGFloat width;
  id v32;
  id v33;
  PKInkParticleDescriptor *v34;
  PKInkParticleDescriptor *v35;
  objc_super v37;

  height = a9.height;
  width = a9.width;
  v32 = a3;
  v33 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PKInkParticleDescriptor;
  v34 = -[PKInkParticleDescriptor init](&v37, sel_init);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_textureName, a3);
    v35->_textureImage = a4;
    objc_storeStrong((id *)&v35->_maskTextureName, a5);
    v35->_maskTextureImage = a6;
    v35->_particleSpacing = a7;
    v35->_particleSize.width = width;
    v35->_particleSize.height = height;
    v35->_particleCount = a8;
    v35->_particleRotation = a10;
    v35->_maskScale = a11;
    v35->_maskScaleConstant = a12;
    v35->_maskMovement = a13;
    v35->_maskDepth = a14;
    v35->_initialRandomRotation = a15;
    v35->_maskInitialRandomOffset = a16;
    v35->_adjustEndCapParticleAlpha = a17;
    v35->_particleBlendMode = a18;
  }

  return v35;
}

- (id)mutableCopy
{
  PKInkParticleDescriptor *v3;
  uint64_t v5;

  v3 = [PKInkParticleDescriptor alloc];
  *(_WORD *)((char *)&v5 + 1) = *(_WORD *)&self->_maskInitialRandomOffset;
  LOBYTE(v5) = self->_initialRandomRotation;
  return -[PKInkParticleDescriptor initWithTextureName:textureImage:maskTextureName:maskTextureImage:particleSpacing:particleCount:particleSize:particleRotation:maskScale:maskScaleConstant:maskMovement:maskDepth:initialRandomRotation:maskInitialRandomOffset:adjustEndCapParticleAlpha:particleBlendMode:](v3, "initWithTextureName:textureImage:maskTextureName:maskTextureImage:particleSpacing:particleCount:particleSize:particleRotation:maskScale:maskScaleConstant:maskMovement:maskDepth:initialRandomRotation:maskInitialRandomOffset:adjustEndCapParticleAlpha:particleBlendMode:", self->_textureName, self->_textureImage, self->_maskTextureName, self->_maskTextureImage, self->_particleCount, self->_particleRotation, self->_particleSpacing, self->_particleSize.width, self->_particleSize.height, self->_maskScale, self->_maskScaleConstant, self->_maskMovement, self->_maskDepth, v5, self->_particleBlendMode);
}

+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 particleSpacing:(double)a4 particleCount:(int64_t)a5 particleSize:(CGSize)a6 particleRotation:(unint64_t)a7
{
  double height;
  double width;
  id v12;
  PKInkParticleDescriptor *v13;

  height = a6.height;
  width = a6.width;
  v12 = a3;
  v13 = objc_alloc_init(PKInkParticleDescriptor);
  -[PKInkParticleDescriptor setTextureName:](v13, "setTextureName:", v12);
  -[PKInkParticleDescriptor setParticleSpacing:](v13, "setParticleSpacing:", a4);
  -[PKInkParticleDescriptor setParticleCount:](v13, "setParticleCount:", a5);
  -[PKInkParticleDescriptor setParticleSize:](v13, "setParticleSize:", width, height);
  -[PKInkParticleDescriptor setParticleRotation:](v13, "setParticleRotation:", a7);

  return v13;
}

+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 texture:(CGImage *)a4 particleSpacing:(double)a5 particleCount:(int64_t)a6 particleSize:(CGSize)a7 particleRotation:(unint64_t)a8
{
  double height;
  double width;
  id v14;
  PKInkParticleDescriptor *v15;

  height = a7.height;
  width = a7.width;
  v14 = a3;
  v15 = objc_alloc_init(PKInkParticleDescriptor);
  -[PKInkParticleDescriptor setTextureImage:](v15, "setTextureImage:", a4);
  -[PKInkParticleDescriptor setTextureName:](v15, "setTextureName:", v14);
  -[PKInkParticleDescriptor setParticleSpacing:](v15, "setParticleSpacing:", a5);
  -[PKInkParticleDescriptor setParticleCount:](v15, "setParticleCount:", a6);
  -[PKInkParticleDescriptor setParticleSize:](v15, "setParticleSize:", width, height);
  -[PKInkParticleDescriptor setParticleRotation:](v15, "setParticleRotation:", a8);

  return v15;
}

- (double)particleSpacingForRadius:(double)a3
{
  double v5;
  double v6;
  _QWORD *v7;
  double v8;
  double v9;

  -[PKInkParticleDescriptor particleSpacing](self, "particleSpacing");
  v6 = v5;
  if (*(_QWORD *)-[PKInkParticleDescriptor particleSpacingFunction](self, "particleSpacingFunction"))
  {
    v7 = -[PKInkParticleDescriptor particleSpacingFunction](self, "particleSpacingFunction");
    v8 = (**(double (***)(_QWORD, double, double))*v7)(*v7, a3, 0.0);
    -[PKInkParticleDescriptor particleSpacing](self, "particleSpacing");
    return v8 * v9;
  }
  return v6;
}

- (void)setParticleSpacingFunction:()unique_ptr<PKFunction
{
  PKFunction *v4;
  PKFunction *value;

  v4 = *(PKFunction **)a3.__ptr_.__value_;
  *(_QWORD *)a3.__ptr_.__value_ = 0;
  value = self->_particleSpacingFunction.__ptr_.__value_;
  self->_particleSpacingFunction.__ptr_.__value_ = v4;
  if (value)
    (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);
}

- (void)particleSpacingFunction
{
  return &self->_particleSpacingFunction;
}

- (id)particleSpacingInkFunction
{
  PKFunction *value;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKInkFunction *v7;
  PKInkFunction *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *__p;
  void *v15;
  uint64_t v16;

  value = self->_particleSpacingFunction.__ptr_.__value_;
  if (value)
  {
    v3 = (void *)objc_opt_class();
    v15 = 0;
    v16 = 0;
    __p = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *((const void **)value + 7), *((_QWORD *)value + 8), (uint64_t)(*((_QWORD *)value + 8) - *((_QWORD *)value + 7)) >> 3);
    objc_msgSend(v3, "arrayFromVector:", &__p);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    v5 = (void *)objc_opt_class();
    v11 = 0;
    v12 = 0;
    v13 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v11, *((const void **)value + 10), *((_QWORD *)value + 11), (uint64_t)(*((_QWORD *)value + 11) - *((_QWORD *)value + 10)) >> 3);
    objc_msgSend(v5, "arrayFromVector:", &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      operator delete(v11);
    }
    v7 = -[PKInkFunction initWithInputPoints:outputPoints:functionType:]([PKInkFunction alloc], "initWithInputPoints:outputPoints:functionType:", v4, v6, 1);

  }
  else
  {
    v8 = [PKInkFunction alloc];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E77EBAC0, &unk_1E77EBAD8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E77EBAC0, &unk_1E77EBAC0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKInkFunction initWithInputPoints:outputPoints:functionType:](v8, "initWithInputPoints:outputPoints:functionType:", v4, v9, 1);

  }
  return v7;
}

+ (id)arrayFromVector:()vector<double
{
  void *v4;
  double *begin;
  unint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  begin = a3->__begin_;
  if (a3->__end_ != a3->__begin_)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", begin[v6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v6;
      begin = a3->__begin_;
    }
    while (v6 < a3->__end_ - a3->__begin_);
  }
  return v4;
}

- (void)setParticleSpacingInkFunction:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void **v5;
  void **v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  float v11;
  double v12;
  unint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  void **v25;
  void **v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  float v31;
  double v32;
  unint64_t v33;
  double *v34;
  double *v35;
  double *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  double *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  float v46;
  double v47;
  unint64_t v48;
  double *v49;
  double *v50;
  double *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  double *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  float v61;
  double v62;
  unint64_t v63;
  double *v64;
  double *v65;
  double *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  double *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char **v83;
  void **v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  _QWORD *v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  PKFunction *value;
  id v125;

  v125 = a3;
  v3 = operator new();
  v4 = 0;
  v5 = (void **)(v3 + 8);
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  v6 = (void **)(v3 + 56);
  *(_QWORD *)v3 = &unk_1E77743F0;
  *(_OWORD *)(v3 + 88) = 0u;
  *(_OWORD *)(v3 + 104) = 0u;
  *(_OWORD *)(v3 + 120) = 0u;
  *(_OWORD *)(v3 + 136) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_QWORD *)(v3 + 168) = 0;
  *(_OWORD *)(v3 + 72) = 0u;
  while (1)
  {
    objc_msgSend(v125, "inputPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 <= v4)
      break;
    objc_msgSend(v125, "inputPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;
    v14 = *(double **)(v3 + 64);
    v13 = *(_QWORD *)(v3 + 72);
    if ((unint64_t)v14 >= v13)
    {
      v16 = (double *)*v6;
      v17 = ((char *)v14 - (_BYTE *)*v6) >> 3;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v19 = v13 - (_QWORD)v16;
      if (v19 >> 2 > v18)
        v18 = v19 >> 2;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      if (v20)
      {
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 72, v20);
        v16 = *(double **)(v3 + 56);
        v14 = *(double **)(v3 + 64);
      }
      else
      {
        v21 = 0;
      }
      v22 = (double *)&v21[8 * v17];
      *v22 = v12;
      v15 = v22 + 1;
      while (v14 != v16)
      {
        v23 = *((_QWORD *)v14-- - 1);
        *((_QWORD *)v22-- - 1) = v23;
      }
      *(_QWORD *)(v3 + 56) = v22;
      *(_QWORD *)(v3 + 64) = v15;
      *(_QWORD *)(v3 + 72) = &v21[8 * v20];
      if (v16)
        operator delete(v16);
    }
    else
    {
      *v14 = v12;
      v15 = v14 + 1;
    }
    *(_QWORD *)(v3 + 64) = v15;

    ++v4;
  }
  v24 = 0;
  v25 = (void **)(v3 + 80);
  v26 = (void **)(v3 + 32);
  while (1)
  {
    objc_msgSend(v125, "outputPoints");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28 <= v24)
      break;
    objc_msgSend(v125, "outputPoints");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;
    v34 = *(double **)(v3 + 88);
    v33 = *(_QWORD *)(v3 + 96);
    if ((unint64_t)v34 >= v33)
    {
      v36 = (double *)*v25;
      v37 = ((char *)v34 - (_BYTE *)*v25) >> 3;
      v38 = v37 + 1;
      if ((unint64_t)(v37 + 1) >> 61)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v39 = v33 - (_QWORD)v36;
      if (v39 >> 2 > v38)
        v38 = v39 >> 2;
      if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
        v40 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v40 = v38;
      if (v40)
      {
        v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 96, v40);
        v36 = *(double **)(v3 + 80);
        v34 = *(double **)(v3 + 88);
      }
      else
      {
        v41 = 0;
      }
      v42 = (double *)&v41[8 * v37];
      *v42 = v32;
      v35 = v42 + 1;
      while (v34 != v36)
      {
        v43 = *((_QWORD *)v34-- - 1);
        *((_QWORD *)v42-- - 1) = v43;
      }
      *(_QWORD *)(v3 + 80) = v42;
      *(_QWORD *)(v3 + 88) = v35;
      *(_QWORD *)(v3 + 96) = &v41[8 * v40];
      if (v36)
        operator delete(v36);
    }
    else
    {
      *v34 = v32;
      v35 = v34 + 1;
    }
    *(_QWORD *)(v3 + 88) = v35;

    objc_msgSend(v125, "outputPoints");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectAtIndexedSubscript:", v24);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "floatValue");
    v47 = v46;
    v49 = *(double **)(v3 + 16);
    v48 = *(_QWORD *)(v3 + 24);
    if ((unint64_t)v49 >= v48)
    {
      v51 = (double *)*v5;
      v52 = ((char *)v49 - (_BYTE *)*v5) >> 3;
      v53 = v52 + 1;
      if ((unint64_t)(v52 + 1) >> 61)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v54 = v48 - (_QWORD)v51;
      if (v54 >> 2 > v53)
        v53 = v54 >> 2;
      if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8)
        v55 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v55 = v53;
      if (v55)
      {
        v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 24, v55);
        v51 = *(double **)(v3 + 8);
        v49 = *(double **)(v3 + 16);
      }
      else
      {
        v56 = 0;
      }
      v57 = (double *)&v56[8 * v52];
      *v57 = v47;
      v50 = v57 + 1;
      while (v49 != v51)
      {
        v58 = *((_QWORD *)v49-- - 1);
        *((_QWORD *)v57-- - 1) = v58;
      }
      *(_QWORD *)(v3 + 8) = v57;
      *(_QWORD *)(v3 + 16) = v50;
      *(_QWORD *)(v3 + 24) = &v56[8 * v55];
      if (v51)
        operator delete(v51);
    }
    else
    {
      *v49 = v47;
      v50 = v49 + 1;
    }
    *(_QWORD *)(v3 + 16) = v50;

    objc_msgSend(v125, "outputPoints");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectAtIndexedSubscript:", v24);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "floatValue");
    v62 = v61;
    v64 = *(double **)(v3 + 40);
    v63 = *(_QWORD *)(v3 + 48);
    if ((unint64_t)v64 >= v63)
    {
      v66 = (double *)*v26;
      v67 = ((char *)v64 - (_BYTE *)*v26) >> 3;
      v68 = v67 + 1;
      if ((unint64_t)(v67 + 1) >> 61)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v69 = v63 - (_QWORD)v66;
      if (v69 >> 2 > v68)
        v68 = v69 >> 2;
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
        v70 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v70 = v68;
      if (v70)
      {
        v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 48, v70);
        v66 = *(double **)(v3 + 32);
        v64 = *(double **)(v3 + 40);
      }
      else
      {
        v71 = 0;
      }
      v72 = (double *)&v71[8 * v67];
      *v72 = v62;
      v65 = v72 + 1;
      while (v64 != v66)
      {
        v73 = *((_QWORD *)v64-- - 1);
        *((_QWORD *)v72-- - 1) = v73;
      }
      *(_QWORD *)(v3 + 32) = v72;
      *(_QWORD *)(v3 + 40) = v65;
      *(_QWORD *)(v3 + 48) = &v71[8 * v70];
      if (v66)
        operator delete(v66);
    }
    else
    {
      *v64 = v62;
      v65 = v64 + 1;
    }
    *(_QWORD *)(v3 + 40) = v65;

    ++v24;
  }
  +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", objc_msgSend(v125, "functionType"));
  v75 = v74;
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = (char **)(v3 + 120);
  v82 = *(char **)(v3 + 120);
  v84 = (void **)(v3 + 104);
  v85 = *(char **)(v3 + 112);
  if (v85 >= v82)
  {
    v87 = (char *)*v84;
    v88 = (v85 - (_BYTE *)*v84) >> 3;
    v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61)
      goto LABEL_142;
    v90 = v82 - v87;
    if (v90 >> 2 > v89)
      v89 = v90 >> 2;
    if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8)
      v91 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v91 = v89;
    if (v91)
    {
      v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 120, v91);
      v87 = *(char **)(v3 + 104);
      v85 = *(char **)(v3 + 112);
    }
    else
    {
      v92 = 0;
    }
    v93 = &v92[8 * v88];
    v82 = &v92[8 * v91];
    *(_QWORD *)v93 = v75;
    v86 = v93 + 8;
    while (v85 != v87)
    {
      v94 = *((_QWORD *)v85 - 1);
      v85 -= 8;
      *((_QWORD *)v93 - 1) = v94;
      v93 -= 8;
    }
    *(_QWORD *)(v3 + 104) = v93;
    *(_QWORD *)(v3 + 112) = v86;
    *(_QWORD *)(v3 + 120) = v82;
    if (v87)
    {
      operator delete(v87);
      v82 = *v83;
    }
  }
  else
  {
    *(_QWORD *)v85 = v74;
    v86 = v85 + 8;
  }
  *(_QWORD *)(v3 + 112) = v86;
  if (v86 >= v82)
  {
    v96 = (char *)*v84;
    v97 = (v86 - (_BYTE *)*v84) >> 3;
    v98 = v97 + 1;
    if ((unint64_t)(v97 + 1) >> 61)
      goto LABEL_142;
    v99 = v82 - v96;
    if (v99 >> 2 > v98)
      v98 = v99 >> 2;
    if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF8)
      v100 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v100 = v98;
    if (v100)
    {
      v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 120, v100);
      v96 = *(char **)(v3 + 104);
      v86 = *(char **)(v3 + 112);
    }
    else
    {
      v101 = 0;
    }
    v102 = &v101[8 * v97];
    v82 = &v101[8 * v100];
    *(_QWORD *)v102 = v77;
    v95 = v102 + 8;
    while (v86 != v96)
    {
      v103 = *((_QWORD *)v86 - 1);
      v86 -= 8;
      *((_QWORD *)v102 - 1) = v103;
      v102 -= 8;
    }
    *(_QWORD *)(v3 + 104) = v102;
    *(_QWORD *)(v3 + 112) = v95;
    *(_QWORD *)(v3 + 120) = v82;
    if (v96)
    {
      operator delete(v96);
      v82 = *v83;
    }
  }
  else
  {
    *(_QWORD *)v86 = v77;
    v95 = v86 + 8;
  }
  *(_QWORD *)(v3 + 112) = v95;
  if (v95 >= v82)
  {
    v105 = (char *)*v84;
    v106 = (v95 - (_BYTE *)*v84) >> 3;
    v107 = v106 + 1;
    if ((unint64_t)(v106 + 1) >> 61)
      goto LABEL_142;
    v108 = v82 - v105;
    if (v108 >> 2 > v107)
      v107 = v108 >> 2;
    if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8)
      v109 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v109 = v107;
    if (v109)
    {
      v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 120, v109);
      v105 = *(char **)(v3 + 104);
      v95 = *(char **)(v3 + 112);
    }
    else
    {
      v110 = 0;
    }
    v111 = &v110[8 * v106];
    v82 = &v110[8 * v109];
    *(_QWORD *)v111 = v79;
    v104 = v111 + 8;
    while (v95 != v105)
    {
      v112 = *((_QWORD *)v95 - 1);
      v95 -= 8;
      *((_QWORD *)v111 - 1) = v112;
      v111 -= 8;
    }
    *(_QWORD *)(v3 + 104) = v111;
    *(_QWORD *)(v3 + 112) = v104;
    *(_QWORD *)(v3 + 120) = v82;
    if (v105)
    {
      operator delete(v105);
      v82 = *v83;
    }
  }
  else
  {
    *(_QWORD *)v95 = v79;
    v104 = v95 + 8;
  }
  *(_QWORD *)(v3 + 112) = v104;
  if (v104 < v82)
  {
    *(_QWORD *)v104 = v81;
    v113 = v104 + 8;
    goto LABEL_135;
  }
  v114 = (char *)*v84;
  v115 = (v104 - (_BYTE *)*v84) >> 3;
  v116 = v115 + 1;
  if ((unint64_t)(v115 + 1) >> 61)
LABEL_142:
    std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
  v117 = v82 - v114;
  if (v117 >> 2 > v116)
    v116 = v117 >> 2;
  if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFF8)
    v118 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v118 = v116;
  if (v118)
  {
    v119 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3 + 120, v118);
    v114 = *(char **)(v3 + 104);
    v104 = *(char **)(v3 + 112);
  }
  else
  {
    v119 = 0;
  }
  v120 = &v119[8 * v115];
  v121 = &v119[8 * v118];
  *(_QWORD *)v120 = v81;
  v113 = v120 + 8;
  while (v104 != v114)
  {
    v122 = *((_QWORD *)v104 - 1);
    v104 -= 8;
    *((_QWORD *)v120 - 1) = v122;
    v120 -= 8;
  }
  *(_QWORD *)(v3 + 104) = v120;
  *(_QWORD *)(v3 + 112) = v113;
  *(_QWORD *)(v3 + 120) = v121;
  if (v114)
    operator delete(v114);
LABEL_135:
  *(_QWORD *)(v3 + 112) = v113;
  PKFunctionPiecewiseBezier::solve((PKFunctionPiecewiseBezier *)v3);
  value = self->_particleSpacingFunction.__ptr_.__value_;
  self->_particleSpacingFunction.__ptr_.__value_ = (PKFunction *)v3;
  if (value)
    (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);

}

- (BOOL)adjustEndCapParticleAlpha
{
  return self->_adjustEndCapParticleAlpha;
}

- (void)setAdjustEndCapParticleAlpha:(BOOL)a3
{
  self->_adjustEndCapParticleAlpha = a3;
}

- (void)setDynamicStep:(double)a3
{
  self->_dynamicStep = a3;
}

- (double)dynamicStep
{
  return self->_dynamicStep;
}

- (NSString)textureName
{
  return self->_textureName;
}

- (void)setTextureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGImage)textureImage
{
  return self->_textureImage;
}

- (void)setTextureImage:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)maskTextureName
{
  return self->_maskTextureName;
}

- (void)setMaskTextureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGImage)maskTextureImage
{
  return self->_maskTextureImage;
}

- (void)setMaskTextureImage:(CGImage *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (double)particleSpacing
{
  return self->_particleSpacing;
}

- (void)setParticleSpacing:(double)a3
{
  self->_particleSpacing = a3;
}

- (int64_t)particleCount
{
  return self->_particleCount;
}

- (void)setParticleCount:(int64_t)a3
{
  self->_particleCount = a3;
}

- (CGSize)particleSize
{
  double width;
  double height;
  CGSize result;

  width = self->_particleSize.width;
  height = self->_particleSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setParticleSize:(CGSize)a3
{
  self->_particleSize = a3;
}

- (unint64_t)particleRotation
{
  return self->_particleRotation;
}

- (void)setParticleRotation:(unint64_t)a3
{
  self->_particleRotation = a3;
}

- (double)maskScale
{
  return self->_maskScale;
}

- (void)setMaskScale:(double)a3
{
  self->_maskScale = a3;
}

- (double)maskScaleConstant
{
  return self->_maskScaleConstant;
}

- (void)setMaskScaleConstant:(double)a3
{
  self->_maskScaleConstant = a3;
}

- (double)maskMovement
{
  return self->_maskMovement;
}

- (void)setMaskMovement:(double)a3
{
  self->_maskMovement = a3;
}

- (double)maskDepth
{
  return self->_maskDepth;
}

- (void)setMaskDepth:(double)a3
{
  self->_maskDepth = a3;
}

- (BOOL)initialRandomRotation
{
  return self->_initialRandomRotation;
}

- (void)setInitialRandomRotation:(BOOL)a3
{
  self->_initialRandomRotation = a3;
}

- (BOOL)maskInitialRandomOffset
{
  return self->_maskInitialRandomOffset;
}

- (void)setMaskInitialRandomOffset:(BOOL)a3
{
  self->_maskInitialRandomOffset = a3;
}

- (unint64_t)particleBlendMode
{
  return self->_particleBlendMode;
}

- (void)setParticleBlendMode:(unint64_t)a3
{
  self->_particleBlendMode = a3;
}

- (void).cxx_destruct
{
  PKFunction *value;

  objc_storeStrong((id *)&self->_maskTextureName, 0);
  objc_storeStrong((id *)&self->_textureName, 0);
  value = self->_particleSpacingFunction.__ptr_.__value_;
  self->_particleSpacingFunction.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
