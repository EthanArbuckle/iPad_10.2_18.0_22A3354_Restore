@implementation PKInkBehavior

- (BOOL)useUnclampedWeight
{
  return self->_useUnclampedWeight;
}

- (PKInkRenderingDescriptor)renderingDescriptor
{
  return self->_renderingDescriptor;
}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(void *)a22 radiusOutput:()vector<PKOutputFunction radius2Output:(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std:()vector<PKOutputFunction :(std::allocator<PKOutputFunction>> *)a28 allocator<PKOutputFunction>> *)a27 allocator<PKOutputFunction>> *)a26 allocator<PKOutputFunction>> *)a25 allocator<PKOutputFunction>> *)a24 allocator<PKOutputFunction>> *)a23 opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:
{
  id v40;
  id v41;
  PKInkBehavior *v42;
  PKInkBehavior *v43;
  PKInkBehavior *v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  NSString *identifier;
  uint64_t v49;
  NSString *variant;
  uint64_t v51;
  NSArray *uiWidths;
  PKFunction *value;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  objc_super v62;

  v60 = a3;
  v59 = a9;
  v58 = a10;
  v57 = a11;
  v56 = a12;
  v40 = a13;
  v61 = a15;
  v41 = a16;
  v62.receiver = self;
  v62.super_class = (Class)PKInkBehavior;
  v42 = -[PKInkBehavior init](&v62, sel_init);
  v43 = v42;
  v44 = v42;
  if (v42)
  {
    objc_storeStrong((id *)&v42->_renderingDescriptor, a3);
    objc_storeStrong((id *)&v43->_smoothingDescriptor, a9);
    objc_storeStrong((id *)&v43->_featheringDescriptor, a10);
    objc_storeStrong((id *)&v43->_pencilFeatheringDescriptor, a11);
    objc_storeStrong((id *)&v43->_animationDescriptor, a12);
    v44->_useUnclampedWeight = a8;
    v44->_blendAlpha = a4;
    v44->_targetMultiple = a5;
    v44->_baseAlpha = a6;
    v45 = *(_OWORD *)&a7->a;
    v46 = *(_OWORD *)&a7->tx;
    *(_OWORD *)&v44->_inkTransform.c = *(_OWORD *)&a7->c;
    *(_OWORD *)&v44->_inkTransform.tx = v46;
    *(_OWORD *)&v44->_inkTransform.a = v45;
    v47 = objc_msgSend(v40, "copy");
    identifier = v44->_identifier;
    v44->_identifier = (NSString *)v47;

    v49 = objc_msgSend(v61, "copy");
    variant = v44->_variant;
    v44->_variant = (NSString *)v49;

    v51 = objc_msgSend(v41, "copy");
    uiWidths = v44->_uiWidths;
    v44->_uiWidths = (NSArray *)v51;

    v44->_defaultWidth = a17;
    v44->_version = a14;
    v44->_showBrushIndicator = a18;
    v44->_supportsCombiningStrokes = a19;
    v44->_rulerOffsetScale = a20;
    v44->_rulerOffsetConstant = a21;
    value = v44->_weightFunction.__ptr_.__value_;
    v44->_weightFunction.__ptr_.__value_ = (PKFunction *)a22;
    if (value)
      (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);
    if (&v43->_radiusOutput != a23)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_radiusOutput, a23->__begin_, a23->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a23->__end_ - a23->__begin_) >> 3));
    if (&v43->_radius2Output != a24)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_radius2Output, a24->__begin_, a24->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a24->__end_ - a24->__begin_) >> 3));
    if (&v43->_opacityOutput != a25)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_opacityOutput, a25->__begin_, a25->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a25->__end_ - a25->__begin_) >> 3));
    if (&v43->_edgeWidthOutput != a26)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_edgeWidthOutput, a26->__begin_, a26->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a26->__end_ - a26->__begin_) >> 3));
    if (&v43->_aspectRatioOutput != a27)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_aspectRatioOutput, a27->__begin_, a27->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a27->__end_ - a27->__begin_) >> 3));
    if (&v43->_brushOpacityOutput != a28)
      std::vector<PKOutputFunction>::__assign_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((uint64_t)&v43->_brushOpacityOutput, a28->__begin_, a28->__end_, 0xCCCCCCCCCCCCCCCDLL * ((a28->__end_ - a28->__begin_) >> 3));
    -[PKInkBehavior _calculateUsesAzimuthOrAltitude](v44, "_calculateUsesAzimuthOrAltitude");
  }

  return v44;
}

- (void)_calculateUsesAzimuthOrAltitude
{
  uint64_t i;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t j;
  void **v8;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v9, self->_radiusOutput.__begin_, self->_radiusOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radiusOutput.__end_ - self->_radiusOutput.__begin_) >> 3));
  memset(v10, 0, sizeof(v10));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v10, self->_radius2Output.__begin_, self->_radius2Output.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radius2Output.__end_ - self->_radius2Output.__begin_) >> 3));
  memset(v11, 0, sizeof(v11));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v11, self->_opacityOutput.__begin_, self->_opacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_opacityOutput.__end_ - self->_opacityOutput.__begin_) >> 3));
  memset(v12, 0, sizeof(v12));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v12, self->_edgeWidthOutput.__begin_, self->_edgeWidthOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_edgeWidthOutput.__end_ - self->_edgeWidthOutput.__begin_) >> 3));
  memset(v13, 0, 24);
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v13, self->_aspectRatioOutput.__begin_, self->_aspectRatioOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_aspectRatioOutput.__end_ - self->_aspectRatioOutput.__begin_) >> 3));
  for (i = 0; i != 5; ++i)
  {
    v4 = &v9[3 * i];
    v5 = *v4;
    v6 = v4[1];
    while (v5 != v6)
    {
      if ((*(_QWORD *)(v5 + 24) & 0xFFFFFFFFFFFFFFFELL) == 2)
        self->_usesAzimuthOrAltitude = 1;
      v5 += 40;
    }
  }
  for (j = 12; j != -3; j -= 3)
  {
    v8 = (void **)&v9[j];
    std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v8);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 27) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

+ (id)loadInkV2WithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = specialized static PKInkBehavior.loadInkV2(url:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v8;
}

+ (void)outputFunctionFromInkFunction:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  unint64_t v15;
  void **v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  unint64_t v23;
  double *v24;
  double *v25;
  double *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  uint64_t v33;
  unint64_t v34;
  void **v35;
  void **v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  float v41;
  double v42;
  unint64_t v43;
  double *v44;
  double *v45;
  double *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  double *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  float v58;
  double v59;
  unint64_t v60;
  double *v61;
  double *v62;
  double *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  double *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  float v75;
  double v76;
  unint64_t v77;
  double *v78;
  double *v79;
  double *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  double *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char **v97;
  void **v98;
  char *v99;
  char *v100;
  unint64_t v101;
  void **v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  float v107;
  double v108;
  unint64_t v109;
  double *v110;
  double *v111;
  double *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  double *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  _QWORD *v146;
  char *v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char *v152;
  char *v153;
  char *v154;
  uint64_t v155;
  _QWORD *v156;
  void **v157;
  id v158;

  v158 = a3;
  objc_opt_self();
  a1[4] = 0;
  v156 = a1;
  *a1 = objc_msgSend(v158, "inputMask");
  a1[1] = objc_msgSend(v158, "deviceMask");
  a1[2] = 3;
  v4 = objc_msgSend(v158, "inkInput");
  a1[3] = v4;
  if (v4 != 5)
  {
    if (objc_msgSend(v158, "functionType") == 6)
    {
      v5 = operator new();
      objc_msgSend(v158, "maxOutputPoints");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      *(_OWORD *)(v5 + 40) = 0u;
      *(_OWORD *)(v5 + 24) = 0u;
      *(_OWORD *)(v5 + 8) = 0u;
      *(_QWORD *)v5 = &unk_1E7773E40;
      *(double *)(v5 + 56) = v8;

      objc_msgSend(v158, "minOutputPoints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      *(double *)(v5 + 64) = v11;

      objc_msgSend(v158, "maxOutputPoints");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      *(double *)(v5 + 72) = v14;

LABEL_164:
      v156[4] = v5;
      goto LABEL_165;
    }
    v5 = operator new();
    v15 = 0;
    v157 = (void **)(v5 + 8);
    *(_OWORD *)(v5 + 32) = 0u;
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    v16 = (void **)(v5 + 56);
    *(_QWORD *)v5 = &unk_1E77743F0;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_QWORD *)(v5 + 168) = 0;
    *(_OWORD *)(v5 + 72) = 0u;
    while (1)
    {
      objc_msgSend(v158, "inputPoints");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 <= v15)
        break;
      objc_msgSend(v158, "inputPoints");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "floatValue");
      v22 = v21;
      v24 = *(double **)(v5 + 64);
      v23 = *(_QWORD *)(v5 + 72);
      if ((unint64_t)v24 >= v23)
      {
        v26 = (double *)*v16;
        v27 = ((char *)v24 - (_BYTE *)*v16) >> 3;
        v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 61)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v29 = v23 - (_QWORD)v26;
        if (v29 >> 2 > v28)
          v28 = v29 >> 2;
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
          v30 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v30 = v28;
        if (v30)
        {
          v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 72, v30);
          v26 = *(double **)(v5 + 56);
          v24 = *(double **)(v5 + 64);
        }
        else
        {
          v31 = 0;
        }
        v32 = (double *)&v31[8 * v27];
        *v32 = v22;
        v25 = v32 + 1;
        while (v24 != v26)
        {
          v33 = *((_QWORD *)v24-- - 1);
          *((_QWORD *)v32-- - 1) = v33;
        }
        *(_QWORD *)(v5 + 56) = v32;
        *(_QWORD *)(v5 + 64) = v25;
        *(_QWORD *)(v5 + 72) = &v31[8 * v30];
        if (v26)
          operator delete(v26);
      }
      else
      {
        *v24 = v22;
        v25 = v24 + 1;
      }
      *(_QWORD *)(v5 + 64) = v25;

      ++v15;
    }
    v34 = 0;
    v35 = (void **)(v5 + 80);
    v36 = (void **)(v5 + 32);
    while (1)
    {
      objc_msgSend(v158, "outputPoints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (v38 <= v34)
        break;
      objc_msgSend(v158, "outputPoints");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "floatValue");
      v42 = v41;
      v44 = *(double **)(v5 + 88);
      v43 = *(_QWORD *)(v5 + 96);
      if ((unint64_t)v44 >= v43)
      {
        v46 = (double *)*v35;
        v47 = ((char *)v44 - (_BYTE *)*v35) >> 3;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v49 = v43 - (_QWORD)v46;
        if (v49 >> 2 > v48)
          v48 = v49 >> 2;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
          v50 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 96, v50);
          v46 = *(double **)(v5 + 80);
          v44 = *(double **)(v5 + 88);
        }
        else
        {
          v51 = 0;
        }
        v52 = (double *)&v51[8 * v47];
        *v52 = v42;
        v45 = v52 + 1;
        while (v44 != v46)
        {
          v53 = *((_QWORD *)v44-- - 1);
          *((_QWORD *)v52-- - 1) = v53;
        }
        *(_QWORD *)(v5 + 80) = v52;
        *(_QWORD *)(v5 + 88) = v45;
        *(_QWORD *)(v5 + 96) = &v51[8 * v50];
        if (v46)
          operator delete(v46);
      }
      else
      {
        *v44 = v42;
        v45 = v44 + 1;
      }
      *(_QWORD *)(v5 + 88) = v45;

      objc_msgSend(v158, "minOutputPoints");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectAtIndexedSubscript:", v34);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v158, "minOutputPoints");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectAtIndexedSubscript:", v34);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "floatValue");
        v59 = v58;
        v61 = *(double **)(v5 + 16);
        v60 = *(_QWORD *)(v5 + 24);
        if ((unint64_t)v61 >= v60)
        {
          v63 = (double *)*v157;
          v64 = ((char *)v61 - (_BYTE *)*v157) >> 3;
          v65 = v64 + 1;
          if ((unint64_t)(v64 + 1) >> 61)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v66 = v60 - (_QWORD)v63;
          if (v66 >> 2 > v65)
            v65 = v66 >> 2;
          if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
            v67 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v67 = v65;
          if (v67)
          {
            v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 24, v67);
            v63 = *(double **)(v5 + 8);
            v61 = *(double **)(v5 + 16);
          }
          else
          {
            v68 = 0;
          }
          v69 = (double *)&v68[8 * v64];
          *v69 = v59;
          v62 = v69 + 1;
          while (v61 != v63)
          {
            v70 = *((_QWORD *)v61-- - 1);
            *((_QWORD *)v69-- - 1) = v70;
          }
          *(_QWORD *)(v5 + 8) = v69;
          *(_QWORD *)(v5 + 16) = v62;
          *(_QWORD *)(v5 + 24) = &v68[8 * v67];
          if (v63)
            operator delete(v63);
        }
        else
        {
          *v61 = v59;
          v62 = v61 + 1;
        }
        *(_QWORD *)(v5 + 16) = v62;

      }
      objc_msgSend(v158, "maxOutputPoints");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "objectAtIndexedSubscript:", v34);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72)
      {
        objc_msgSend(v158, "maxOutputPoints");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", v34);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "floatValue");
        v76 = v75;
        v78 = *(double **)(v5 + 40);
        v77 = *(_QWORD *)(v5 + 48);
        if ((unint64_t)v78 >= v77)
        {
          v80 = (double *)*v36;
          v81 = ((char *)v78 - (_BYTE *)*v36) >> 3;
          v82 = v81 + 1;
          if ((unint64_t)(v81 + 1) >> 61)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v83 = v77 - (_QWORD)v80;
          if (v83 >> 2 > v82)
            v82 = v83 >> 2;
          if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF8)
            v84 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v84 = v82;
          if (v84)
          {
            v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 48, v84);
            v80 = *(double **)(v5 + 32);
            v78 = *(double **)(v5 + 40);
          }
          else
          {
            v85 = 0;
          }
          v86 = (double *)&v85[8 * v81];
          *v86 = v76;
          v79 = v86 + 1;
          while (v78 != v80)
          {
            v87 = *((_QWORD *)v78-- - 1);
            *((_QWORD *)v86-- - 1) = v87;
          }
          *(_QWORD *)(v5 + 32) = v86;
          *(_QWORD *)(v5 + 40) = v79;
          *(_QWORD *)(v5 + 48) = &v85[8 * v84];
          if (v80)
            operator delete(v80);
        }
        else
        {
          *v78 = v76;
          v79 = v78 + 1;
        }
        *(_QWORD *)(v5 + 40) = v79;

      }
      ++v34;
    }
    if (!objc_msgSend(v158, "functionType"))
    {
      v101 = 0;
      v102 = (void **)(v5 + 104);
      while (1)
      {
        objc_msgSend(v158, "controlPoints");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "count");

        if (v104 <= v101)
          break;
        objc_msgSend(v158, "controlPoints");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "objectAtIndexedSubscript:", v101);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "floatValue");
        v108 = v107;
        v110 = *(double **)(v5 + 112);
        v109 = *(_QWORD *)(v5 + 120);
        if ((unint64_t)v110 >= v109)
        {
          v112 = (double *)*v102;
          v113 = ((char *)v110 - (_BYTE *)*v102) >> 3;
          v114 = v113 + 1;
          if ((unint64_t)(v113 + 1) >> 61)
            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
          v115 = v109 - (_QWORD)v112;
          if (v115 >> 2 > v114)
            v114 = v115 >> 2;
          if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF8)
            v116 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v116 = v114;
          if (v116)
          {
            v117 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 120, v116);
            v112 = *(double **)(v5 + 104);
            v110 = *(double **)(v5 + 112);
          }
          else
          {
            v117 = 0;
          }
          v118 = (double *)&v117[8 * v113];
          *v118 = v108;
          v111 = v118 + 1;
          while (v110 != v112)
          {
            v119 = *((_QWORD *)v110-- - 1);
            *((_QWORD *)v118-- - 1) = v119;
          }
          *(_QWORD *)(v5 + 104) = v118;
          *(_QWORD *)(v5 + 112) = v111;
          *(_QWORD *)(v5 + 120) = &v117[8 * v116];
          if (v112)
            operator delete(v112);
        }
        else
        {
          *v110 = v108;
          v111 = v110 + 1;
        }
        *(_QWORD *)(v5 + 112) = v111;

        ++v101;
      }
      goto LABEL_163;
    }
    +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", objc_msgSend(v158, "functionType"));
    v89 = v88;
    v91 = v90;
    v93 = v92;
    v95 = v94;
    v97 = (char **)(v5 + 120);
    v96 = *(char **)(v5 + 120);
    v98 = (void **)(v5 + 104);
    v99 = *(char **)(v5 + 112);
    if (v99 >= v96)
    {
      v120 = (char *)*v98;
      v121 = (v99 - (_BYTE *)*v98) >> 3;
      v122 = v121 + 1;
      if ((unint64_t)(v121 + 1) >> 61)
        goto LABEL_171;
      v123 = v96 - v120;
      if (v123 >> 2 > v122)
        v122 = v123 >> 2;
      if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFF8)
        v124 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v124 = v122;
      if (v124)
      {
        v125 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 120, v124);
        v120 = *(char **)(v5 + 104);
        v99 = *(char **)(v5 + 112);
      }
      else
      {
        v125 = 0;
      }
      v126 = &v125[8 * v121];
      v96 = &v125[8 * v124];
      *(_QWORD *)v126 = v89;
      v100 = v126 + 8;
      while (v99 != v120)
      {
        v127 = *((_QWORD *)v99 - 1);
        v99 -= 8;
        *((_QWORD *)v126 - 1) = v127;
        v126 -= 8;
      }
      *(_QWORD *)(v5 + 104) = v126;
      *(_QWORD *)(v5 + 112) = v100;
      *(_QWORD *)(v5 + 120) = v96;
      if (v120)
      {
        operator delete(v120);
        v96 = *v97;
      }
    }
    else
    {
      *(_QWORD *)v99 = v88;
      v100 = v99 + 8;
    }
    *(_QWORD *)(v5 + 112) = v100;
    if (v100 >= v96)
    {
      v129 = (char *)*v98;
      v130 = (v100 - (_BYTE *)*v98) >> 3;
      v131 = v130 + 1;
      if ((unint64_t)(v130 + 1) >> 61)
        goto LABEL_171;
      v132 = v96 - v129;
      if (v132 >> 2 > v131)
        v131 = v132 >> 2;
      if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8)
        v133 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v133 = v131;
      if (v133)
      {
        v134 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 120, v133);
        v129 = *(char **)(v5 + 104);
        v100 = *(char **)(v5 + 112);
      }
      else
      {
        v134 = 0;
      }
      v135 = &v134[8 * v130];
      v96 = &v134[8 * v133];
      *(_QWORD *)v135 = v91;
      v128 = v135 + 8;
      while (v100 != v129)
      {
        v136 = *((_QWORD *)v100 - 1);
        v100 -= 8;
        *((_QWORD *)v135 - 1) = v136;
        v135 -= 8;
      }
      *(_QWORD *)(v5 + 104) = v135;
      *(_QWORD *)(v5 + 112) = v128;
      *(_QWORD *)(v5 + 120) = v96;
      if (v129)
      {
        operator delete(v129);
        v96 = *v97;
      }
    }
    else
    {
      *(_QWORD *)v100 = v91;
      v128 = v100 + 8;
    }
    *(_QWORD *)(v5 + 112) = v128;
    if (v128 >= v96)
    {
      v138 = (char *)*v98;
      v139 = (v128 - (_BYTE *)*v98) >> 3;
      v140 = v139 + 1;
      if ((unint64_t)(v139 + 1) >> 61)
        goto LABEL_171;
      v141 = v96 - v138;
      if (v141 >> 2 > v140)
        v140 = v141 >> 2;
      if ((unint64_t)v141 >= 0x7FFFFFFFFFFFFFF8)
        v142 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v142 = v140;
      if (v142)
      {
        v143 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 120, v142);
        v138 = *(char **)(v5 + 104);
        v128 = *(char **)(v5 + 112);
      }
      else
      {
        v143 = 0;
      }
      v144 = &v143[8 * v139];
      v96 = &v143[8 * v142];
      *(_QWORD *)v144 = v93;
      v137 = v144 + 8;
      while (v128 != v138)
      {
        v145 = *((_QWORD *)v128 - 1);
        v128 -= 8;
        *((_QWORD *)v144 - 1) = v145;
        v144 -= 8;
      }
      *(_QWORD *)(v5 + 104) = v144;
      *(_QWORD *)(v5 + 112) = v137;
      *(_QWORD *)(v5 + 120) = v96;
      if (v138)
      {
        operator delete(v138);
        v96 = *v97;
      }
    }
    else
    {
      *(_QWORD *)v128 = v93;
      v137 = v128 + 8;
    }
    *(_QWORD *)(v5 + 112) = v137;
    if (v137 < v96)
    {
      *(_QWORD *)v137 = v95;
      v146 = v137 + 8;
LABEL_162:
      *(_QWORD *)(v5 + 112) = v146;
LABEL_163:
      PKFunctionPiecewiseBezier::solve((PKFunctionPiecewiseBezier *)v5);
      goto LABEL_164;
    }
    v147 = (char *)*v98;
    v148 = (v137 - (_BYTE *)*v98) >> 3;
    v149 = v148 + 1;
    if (!((unint64_t)(v148 + 1) >> 61))
    {
      v150 = v96 - v147;
      if (v150 >> 2 > v149)
        v149 = v150 >> 2;
      if ((unint64_t)v150 >= 0x7FFFFFFFFFFFFFF8)
        v151 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v151 = v149;
      if (v151)
      {
        v152 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5 + 120, v151);
        v147 = *(char **)(v5 + 104);
        v137 = *(char **)(v5 + 112);
      }
      else
      {
        v152 = 0;
      }
      v153 = &v152[8 * v148];
      v154 = &v152[8 * v151];
      *(_QWORD *)v153 = v95;
      v146 = v153 + 8;
      while (v137 != v147)
      {
        v155 = *((_QWORD *)v137 - 1);
        v137 -= 8;
        *((_QWORD *)v153 - 1) = v155;
        v153 -= 8;
      }
      *(_QWORD *)(v5 + 104) = v153;
      *(_QWORD *)(v5 + 112) = v146;
      *(_QWORD *)(v5 + 120) = v154;
      if (v147)
        operator delete(v147);
      goto LABEL_162;
    }
LABEL_171:
    std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
  }
LABEL_165:

}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 blendAlpha:(double)a4 targetMultiple:(double)a5 baseAlpha:(double)a6 inkTransform:(CGAffineTransform *)a7 useUnclampedWeight:(BOOL)a8 smoothingDescriptor:(id)a9 featheringDescriptor:(id)a10 pencilFeatheringDescriptor:(id)a11 animationDescriptor:(id)a12 identifier:(id)a13 version:(unint64_t)a14 variant:(id)a15 uiWidths:(id)a16 defaultWidth:(double)a17 showBrushIndicator:(BOOL)a18 supportsCombiningStrokes:(BOOL)a19 rulerOffsetScale:(double)a20 rulerOffsetConstant:(double)a21 weightFunction:(id)a22 inkFunctions:(id)a23
{
  id v32;
  PKInkBehavior *v33;
  PKInkBehavior *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  NSString *identifier;
  uint64_t v39;
  NSString *variant;
  uint64_t v41;
  NSArray *uiWidths;
  PKFunction *value;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  PKFunction *v69;
  objc_super v70;
  void **v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = a9;
  v54 = a10;
  v55 = a11;
  v56 = a12;
  v58 = a13;
  v59 = a15;
  v60 = a16;
  v32 = a22;
  v61 = a23;
  v70.receiver = self;
  v70.super_class = (Class)PKInkBehavior;
  v33 = -[PKInkBehavior init](&v70, sel_init);
  v34 = v33;
  if (!v33)
    goto LABEL_13;
  objc_storeStrong((id *)&v33->_renderingDescriptor, a3);
  objc_storeStrong((id *)&v34->_smoothingDescriptor, a9);
  objc_storeStrong((id *)&v34->_featheringDescriptor, a10);
  objc_storeStrong((id *)&v34->_pencilFeatheringDescriptor, a11);
  objc_storeStrong((id *)&v34->_animationDescriptor, a12);
  v34->_useUnclampedWeight = a8;
  v34->_blendAlpha = a4;
  v34->_targetMultiple = a5;
  v34->_baseAlpha = a6;
  v35 = *(_OWORD *)&a7->a;
  v36 = *(_OWORD *)&a7->tx;
  *(_OWORD *)&v34->_inkTransform.c = *(_OWORD *)&a7->c;
  *(_OWORD *)&v34->_inkTransform.tx = v36;
  *(_OWORD *)&v34->_inkTransform.a = v35;
  v37 = objc_msgSend(v58, "copy");
  identifier = v34->_identifier;
  v34->_identifier = (NSString *)v37;

  v39 = objc_msgSend(v59, "copy");
  variant = v34->_variant;
  v34->_variant = (NSString *)v39;

  v41 = objc_msgSend(v60, "copy");
  uiWidths = v34->_uiWidths;
  v34->_uiWidths = (NSArray *)v41;

  v34->_defaultWidth = a17;
  v34->_version = a14;
  v34->_showBrushIndicator = a18;
  v34->_supportsCombiningStrokes = a19;
  v34->_rulerOffsetScale = a20;
  v34->_rulerOffsetConstant = a21;
  if (!v32)
  {
    value = v34->_weightFunction.__ptr_.__value_;
    v34->_weightFunction.__ptr_.__value_ = 0;
    if (!value)
      goto LABEL_5;
    goto LABEL_4;
  }
  +[PKInkBehavior outputFunctionFromInkFunction:](&v66, (uint64_t)PKInkBehavior, v32);
  value = v34->_weightFunction.__ptr_.__value_;
  v34->_weightFunction.__ptr_.__value_ = v69;
  if (value)
LABEL_4:
    (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);
LABEL_5:
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_radiusOutput.__begin_);
  v34->_radiusOutput.__begin_ = 0;
  v34->_radiusOutput.__end_ = 0;
  v34->_radiusOutput.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_radius2Output.__begin_);
  v34->_radius2Output.__begin_ = 0;
  v34->_radius2Output.__end_ = 0;
  v34->_radius2Output.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_opacityOutput.__begin_);
  v34->_opacityOutput.__begin_ = 0;
  v34->_opacityOutput.__end_ = 0;
  v34->_opacityOutput.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_edgeWidthOutput.__begin_);
  v34->_edgeWidthOutput.__begin_ = 0;
  v34->_edgeWidthOutput.__end_ = 0;
  v34->_edgeWidthOutput.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_aspectRatioOutput.__begin_);
  v34->_aspectRatioOutput.__begin_ = 0;
  v34->_aspectRatioOutput.__end_ = 0;
  v34->_aspectRatioOutput.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  std::vector<PKOutputFunction>::__vdeallocate((void **)&v34->_brushOpacityOutput.__begin_);
  v34->_brushOpacityOutput.__begin_ = 0;
  v34->_brushOpacityOutput.__end_ = 0;
  v34->_brushOpacityOutput.__end_cap_.__value_ = 0;
  v67 = 0;
  v68 = 0;
  v66 = 0;
  v71 = (void **)&v66;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](&v71);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v44 = v61;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v63 != v46)
          objc_enumerationMutation(v44);
        -[PKInkBehavior addNewInkFunction:](v34, "addNewInkFunction:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v45);
  }

  -[PKInkBehavior _calculateUsesAzimuthOrAltitude](v34, "_calculateUsesAzimuthOrAltitude");
LABEL_13:

  return v34;
}

- (id)mutableCopy
{
  PKInkBehavior *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  _BOOL4 showBrushIndicator;
  _BOOL4 supportsCombiningStrokes;
  double rulerOffsetScale;
  double rulerOffsetConstant;
  PKFunction *value;
  uint64_t v20;
  PKInkBehavior *v21;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _BYTE v43[48];
  void **v44[2];

  v3 = [PKInkBehavior alloc];
  -[PKInkBehavior renderingDescriptor](self, "renderingDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v36, "mutableCopy");
  -[PKInkBehavior blendAlpha](self, "blendAlpha");
  v5 = v4;
  -[PKInkBehavior targetMultiple](self, "targetMultiple");
  v7 = v6;
  -[PKInkBehavior baseAlpha](self, "baseAlpha");
  v9 = v8;
  -[PKInkBehavior inkTransform](self, "inkTransform");
  v10 = -[PKInkBehavior useUnclampedWeight](self, "useUnclampedWeight");
  -[PKInkBehavior smoothingDescriptor](self, "smoothingDescriptor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v34, "mutableCopy");
  -[PKInkBehavior featheringDescriptor](self, "featheringDescriptor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v32, "mutableCopy");
  -[PKInkBehavior pencilFeatheringDescriptor](self, "pencilFeatheringDescriptor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v30, "mutableCopy");
  -[PKInkBehavior animationDescriptor](self, "animationDescriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v28, "mutableCopy");
  -[PKInkBehavior identifier](self, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKInkBehavior version](self, "version");
  -[PKInkBehavior variant](self, "variant");
  v24 = v10;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkBehavior uiWidths](self, "uiWidths");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkBehavior defaultWidth](self, "defaultWidth");
  v14 = v13;
  showBrushIndicator = self->_showBrushIndicator;
  supportsCombiningStrokes = self->_supportsCombiningStrokes;
  rulerOffsetScale = self->_rulerOffsetScale;
  rulerOffsetConstant = self->_rulerOffsetConstant;
  value = self->_weightFunction.__ptr_.__value_;
  if (value)
    v20 = (*(uint64_t (**)(PKFunction *))(*(_QWORD *)value + 24))(value);
  else
    v20 = 0;
  memset(v42, 0, sizeof(v42));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v42, self->_radiusOutput.__begin_, self->_radiusOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radiusOutput.__end_ - self->_radiusOutput.__begin_) >> 3));
  memset(v41, 0, sizeof(v41));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v41, self->_radius2Output.__begin_, self->_radius2Output.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_radius2Output.__end_ - self->_radius2Output.__begin_) >> 3));
  memset(v40, 0, sizeof(v40));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v40, self->_opacityOutput.__begin_, self->_opacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_opacityOutput.__end_ - self->_opacityOutput.__begin_) >> 3));
  memset(v39, 0, sizeof(v39));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v39, self->_edgeWidthOutput.__begin_, self->_edgeWidthOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_edgeWidthOutput.__end_ - self->_edgeWidthOutput.__begin_) >> 3));
  memset(v38, 0, sizeof(v38));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v38, self->_aspectRatioOutput.__begin_, self->_aspectRatioOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_aspectRatioOutput.__end_ - self->_aspectRatioOutput.__begin_) >> 3));
  memset(v37, 0, sizeof(v37));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v37, self->_brushOpacityOutput.__begin_, self->_brushOpacityOutput.__end_, 0xCCCCCCCCCCCCCCCDLL * ((self->_brushOpacityOutput.__end_ - self->_brushOpacityOutput.__begin_) >> 3));
  BYTE1(v23) = supportsCombiningStrokes;
  LOBYTE(v23) = showBrushIndicator;
  v21 = -[PKInkBehavior initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:](v3, "initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:", v35, v43, v24, v33, v31, v29, v5, v7, v9, v14, rulerOffsetScale, rulerOffsetConstant, v11, v27,
          v12,
          v26,
          v25,
          v23,
          v20,
          v42,
          v41,
          v40,
          v39,
          v38,
          v37);
  v44[0] = (void **)v37;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v38;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v39;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v40;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v41;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);
  v44[0] = (void **)v42;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100](v44);

  return v21;
}

- (PKInkBehavior)initWithRenderingDescriptor:(id)a3 variant:(id)a4
{
  id v7;
  id v8;
  PKInkBehavior *v9;
  PKInkBehavior *v10;
  uint64_t v11;
  NSString *variant;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKInkBehavior;
  v9 = -[PKInkBehavior init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_renderingDescriptor, a3);
    v11 = objc_msgSend(v8, "copy");
    variant = v10->_variant;
    v10->_variant = (NSString *)v11;

  }
  return v10;
}

+ (double)inkRadiusOverride
{
  if (qword_1ECEE61C8 != -1)
    dispatch_once(&qword_1ECEE61C8, &__block_literal_global_32);
  return *(double *)&_MergedGlobals_125;
}

void __34__PKInkBehavior_inkRadiusOverride__block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleForKey:", CFSTR("PKInkRadiusOverride"));
  _MergedGlobals_125 = v0;

}

- (PKInkParticleDescriptor)particleDescriptor
{
  return -[PKInkRenderingDescriptor particleDescriptor](self->_renderingDescriptor, "particleDescriptor");
}

- (PKInkParticleDescriptor)secondaryParticleDescriptor
{
  return -[PKInkRenderingDescriptor secondaryParticleDescriptor](self->_renderingDescriptor, "secondaryParticleDescriptor");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)variant
{
  return self->_variant;
}

- (double)blendAlpha
{
  return self->_blendAlpha;
}

- (void)setBlendAlpha:(double)a3
{
  self->_blendAlpha = a3;
}

- (CGAffineTransform)inkTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].tx;
  return self;
}

- (void)setInkTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_inkTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_inkTransform.tx = v4;
  *(_OWORD *)&self->_inkTransform.a = v3;
}

- (void)setUseUnclampedWeight:(BOOL)a3
{
  self->_useUnclampedWeight = a3;
}

- (double)targetMultiple
{
  return self->_targetMultiple;
}

- (void)setTargetMultiple:(double)a3
{
  self->_targetMultiple = a3;
}

- (double)baseAlpha
{
  return self->_baseAlpha;
}

- (void)setBaseAlpha:(double)a3
{
  self->_baseAlpha = a3;
}

- (PKInkSmoothingDescriptor)smoothingDescriptor
{
  return self->_smoothingDescriptor;
}

- (void)setSmoothingDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_smoothingDescriptor, a3);
}

- (PKInkFeatheringDescriptor)featheringDescriptor
{
  return self->_featheringDescriptor;
}

- (void)setFeatheringDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_featheringDescriptor, a3);
}

- (PKInkFeatheringDescriptor)pencilFeatheringDescriptor
{
  return self->_pencilFeatheringDescriptor;
}

- (void)setPencilFeatheringDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_pencilFeatheringDescriptor, a3);
}

- (PKInkAnimationDescriptor)animationDescriptor
{
  return self->_animationDescriptor;
}

- (void)setAnimationDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_animationDescriptor, a3);
}

- (BOOL)supportsCombiningStrokes
{
  return self->_supportsCombiningStrokes;
}

- (void)setSupportsCombiningStrokes:(BOOL)a3
{
  self->_supportsCombiningStrokes = a3;
}

- (NSArray)uiWidths
{
  return self->_uiWidths;
}

- (void)setUiWidths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (void)setDefaultWidth:(double)a3
{
  self->_defaultWidth = a3;
}

- (void).cxx_destruct
{
  PKFunction *value;
  vector<PKOutputFunction, std::allocator<PKOutputFunction>> *p_brushOpacityOutput;

  objc_storeStrong((id *)&self->_uiWidths, 0);
  objc_storeStrong((id *)&self->_animationDescriptor, 0);
  objc_storeStrong((id *)&self->_pencilFeatheringDescriptor, 0);
  objc_storeStrong((id *)&self->_featheringDescriptor, 0);
  objc_storeStrong((id *)&self->_smoothingDescriptor, 0);
  objc_storeStrong((id *)&self->_renderingDescriptor, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  p_brushOpacityOutput = &self->_brushOpacityOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_aspectRatioOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_edgeWidthOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_opacityOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_radius2Output;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  p_brushOpacityOutput = &self->_radiusOutput;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_brushOpacityOutput);
  value = self->_weightFunction.__ptr_.__value_;
  self->_weightFunction.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(PKFunction *))(*(_QWORD *)value + 40))(value);
  objc_storeStrong((id *)&self->_cachedAspectRatioFunctions, 0);
  objc_storeStrong((id *)&self->_cachedEdgeWidthFunctions, 0);
  objc_storeStrong((id *)&self->_cachedOpacityFunctions, 0);
  objc_storeStrong((id *)&self->_cachedRadius2Functions, 0);
  objc_storeStrong((id *)&self->_cachedRadiusFunctions, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkBehavior identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKInkBehavior version](self, "version");
  -[PKInkBehavior variant](self, "variant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ %lu %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)inkFunctions
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *cachedRadiusFunctions;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *cachedRadius2Functions;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *cachedOpacityFunctions;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *cachedEdgeWidthFunctions;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *cachedAspectRatioFunctions;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_cachedRadiusFunctions)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithArray:", v5);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedRadiusFunctions = self->_cachedRadiusFunctions;
    self->_cachedRadiusFunctions = v6;

  }
  if (!self->_cachedRadius2Functions)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v9);
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedRadius2Functions = self->_cachedRadius2Functions;
    self->_cachedRadius2Functions = v10;

  }
  if (!self->_cachedOpacityFunctions)
  {
    v12 = (void *)MEMORY[0x1E0C99DE8];
    -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithArray:", v13);
    v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedOpacityFunctions = self->_cachedOpacityFunctions;
    self->_cachedOpacityFunctions = v14;

  }
  if (!self->_cachedEdgeWidthFunctions)
  {
    v16 = (void *)MEMORY[0x1E0C99DE8];
    -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithArray:", v17);
    v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedEdgeWidthFunctions = self->_cachedEdgeWidthFunctions;
    self->_cachedEdgeWidthFunctions = v18;

  }
  if (!self->_cachedAspectRatioFunctions)
  {
    v20 = (void *)MEMORY[0x1E0C99DE8];
    -[PKInkBehavior inkFunctionsForProperty:]((uint64_t)self, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayWithArray:", v21);
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    cachedAspectRatioFunctions = self->_cachedAspectRatioFunctions;
    self->_cachedAspectRatioFunctions = v22;

  }
  objc_msgSend(v3, "addObjectsFromArray:", self->_cachedRadiusFunctions);
  objc_msgSend(v3, "addObjectsFromArray:", self->_cachedRadius2Functions);
  objc_msgSend(v3, "addObjectsFromArray:", self->_cachedOpacityFunctions);
  objc_msgSend(v3, "addObjectsFromArray:", self->_cachedEdgeWidthFunctions);
  objc_msgSend(v3, "addObjectsFromArray:", self->_cachedAspectRatioFunctions);
  return (NSArray *)v3;
}

- (id)inkFunctionsForProperty:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PKInkFunction *v34;
  id v36;
  uint64_t v38;
  uint64_t *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *__p;
  void *v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v39 = (uint64_t *)(a1 + *(_QWORD *)&aP_3[8 * a2]);
    if (v39[1] != *v39)
    {
      v3 = 0;
      v4 = 0;
      v5 = 0x1E0C99000uLL;
      do
      {
        v38 = v4;
        objc_opt_self();
        v41 = *v39;
        objc_msgSend(*(id *)(v5 + 3560), "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 3560), "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 3560), "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 3560), "array");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v41 + v3;
        if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(v41 + v3 + 32) + 16))(*(_QWORD *)(v41 + v3 + 32)) == 3)
        {
          v10 = *(_QWORD *)(v9 + 32);
          v52 = 0;
          v53 = 0;
          __p = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *(const void **)(v10 + 56), *(_QWORD *)(v10 + 64), (uint64_t)(*(_QWORD *)(v10 + 64) - *(_QWORD *)(v10 + 56)) >> 3);
          +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&__p);
          v11 = objc_claimAutoreleasedReturnValue();

          if (__p)
          {
            v52 = __p;
            operator delete(__p);
          }
          v49 = 0;
          v50 = 0;
          v48 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v48, *(const void **)(v10 + 8), *(_QWORD *)(v10 + 16), (uint64_t)(*(_QWORD *)(v10 + 16) - *(_QWORD *)(v10 + 8)) >> 3);
          +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v48);
          v12 = objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            v49 = v48;
            operator delete(v48);
          }
          v46 = 0;
          v47 = 0;
          v45 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v45, *(const void **)(v10 + 32), *(_QWORD *)(v10 + 40), (uint64_t)(*(_QWORD *)(v10 + 40) - *(_QWORD *)(v10 + 32)) >> 3);
          +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v45);
          v13 = objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            v46 = v45;
            operator delete(v45);
          }
          v43 = 0;
          v44 = 0;
          v42 = 0;
          std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v42, *(const void **)(v10 + 104), *(_QWORD *)(v10 + 112), (uint64_t)(*(_QWORD *)(v10 + 112) - *(_QWORD *)(v10 + 104)) >> 3);
          +[PKInkBehavior arrayFromVector:]((uint64_t)PKInkBehavior, (uint64_t *)&v42);
          v14 = objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v43 = v42;
            operator delete(v42);
          }
          v7 = (void *)v12;
          v8 = (void *)v13;
          v40 = (void *)v14;
          v6 = (void *)v11;
        }
        if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(v9 + 32) + 16))(*(_QWORD *)(v9 + 32)) == 1)
        {
          v15 = *(_QWORD *)(v9 + 32);
          +[PKInkProperties rangeForInput:](PKInkProperties, "rangeForInput:", *(_QWORD *)(v41 + v3 + 24));
          v17 = v16;
          v18 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = v19;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v56[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayWithArray:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v15 + 64));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v55[0] = v24;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v15 + 64));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "arrayWithArray:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v15 + 72));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = v29;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v15 + 72));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v54[1] = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "arrayWithArray:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E77ECA30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v27 = v7;
          v32 = v8;
          v22 = v6;
          v33 = v40;
        }
        v34 = -[PKInkFunction initWithProperty:input:inputMask:deviceMask:inputPoints:minOutputPoints:maxOutputPoints:outputPoints:controlPoints:functionType:]([PKInkFunction alloc], "initWithProperty:input:inputMask:deviceMask:inputPoints:minOutputPoints:maxOutputPoints:outputPoints:controlPoints:functionType:", a2, *(_QWORD *)(v41 + v3 + 24), *(_QWORD *)(v41 + v3), *(_QWORD *)(v41 + v3 + 8), v22, v27, v32, v27, 0, 0);
        -[PKInkFunction setControlPoints:](v34, "setControlPoints:", v33);

        objc_msgSend(v36, "addObject:", v34);
        v4 = v38 + 1;
        v3 += 40;
        v5 = 0x1E0C99000;
      }
      while (v38 + 1 < 0xCCCCCCCCCCCCCCCDLL * ((v39[1] - *v39) >> 3));
    }
  }
  else
  {
    v36 = 0;
  }
  return v36;
}

+ (id)arrayFromVector:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *a2;
  if (a2[1] != *a2)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v4 + 8 * v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v6);

      ++v5;
      v4 = *a2;
    }
    while (v5 < (a2[1] - *a2) >> 3);
  }
  return v3;
}

- (_QWORD)functionsForProperty:(_QWORD *)a1
{
  void *v2;

  if (a1)
  {
    switch(a2)
    {
      case 0:
        v2 = (void *)a1[4];
        goto LABEL_9;
      case 1:
        v2 = (void *)a1[6];
        goto LABEL_9;
      case 2:
        v2 = (void *)a1[7];
        goto LABEL_9;
      case 3:
        v2 = (void *)a1[8];
        goto LABEL_9;
      case 4:
        v2 = (void *)a1[5];
LABEL_9:
        a1 = v2;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return a1;
}

- (void)inkFunctionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  vector<PKOutputFunction, std::allocator<PKOutputFunction>> *p_radiusOutput;
  uint64_t v7;
  PKOutputFunction *begin;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  _OWORD v16[2];
  uint64_t v17;

  v15 = a3;
  -[PKInkBehavior functionsForProperty:](self, objc_msgSend(v15, "inkProperty"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v15, "inkProperty");
  if (self)
  {
    switch(v5)
    {
      case 0:
        p_radiusOutput = &self->_radiusOutput;
        break;
      case 1:
        p_radiusOutput = &self->_opacityOutput;
        break;
      case 2:
        p_radiusOutput = &self->_edgeWidthOutput;
        break;
      case 3:
        p_radiusOutput = &self->_aspectRatioOutput;
        break;
      case 4:
        p_radiusOutput = &self->_radius2Output;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    p_radiusOutput = 0;
  }
  v7 = objc_msgSend(v4, "indexOfObject:", v15);
  -[PKInkBehavior outputFunctionFromInkFunction:]((uint64_t)v16, (uint64_t)self, v15);
  begin = p_radiusOutput->__begin_;
  v9 = (_OWORD *)((char *)begin + 40 * v7);
  v10 = v16[1];
  *v9 = v16[0];
  v9[1] = v10;
  v11 = v17;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
  v13 = (char *)begin + 40 * v7;
  v14 = *((_QWORD *)v13 + 4);
  *((_QWORD *)v13 + 4) = v12;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 40))(v14);
  (*(void (**)(uint64_t))(*(_QWORD *)v11 + 40))(v11);

}

- (void)outputFunctionFromInkFunction:(void *)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (objc_msgSend(v5, "inkInput") == 2 || objc_msgSend(v6, "inkInput") == 3)
      *(_BYTE *)(a2 + 8) = 1;
    +[PKInkBehavior outputFunctionFromInkFunction:]((_QWORD *)a1, (uint64_t)PKInkBehavior, v6);
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

}

- (void)removeInkFunction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  vector<PKOutputFunction, std::allocator<PKOutputFunction>> *p_radiusOutput;
  uint64_t v8;
  PKOutputFunction *end;
  uint64_t v10;
  PKOutputFunction *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v4 = a3;
  -[PKInkBehavior functionsForProperty:](self, objc_msgSend(v4, "inkProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "inkProperty");
  if (self)
  {
    switch(v6)
    {
      case 0:
        p_radiusOutput = &self->_radiusOutput;
        break;
      case 1:
        p_radiusOutput = &self->_opacityOutput;
        break;
      case 2:
        p_radiusOutput = &self->_edgeWidthOutput;
        break;
      case 3:
        p_radiusOutput = &self->_aspectRatioOutput;
        break;
      case 4:
        p_radiusOutput = &self->_radius2Output;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    p_radiusOutput = 0;
  }
  v8 = objc_msgSend(v5, "indexOfObject:", v4);
  objc_msgSend(v5, "removeObjectAtIndex:", v8);
  end = p_radiusOutput->__end_;
  v10 = (uint64_t)p_radiusOutput->__begin_ + 40 * v8;
  v11 = (PKOutputFunction *)(v10 + 40);
  if ((PKOutputFunction *)(v10 + 40) != end)
  {
    do
    {
      PKOutputFunction::PKOutputFunction((PKOutputFunction *)v18, (const PKOutputFunction *)(v10 + 40));
      *(_OWORD *)v10 = v18[0];
      *(_OWORD *)(v10 + 16) = v18[1];
      v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
      v13 = *(_QWORD *)(v10 + 32);
      *(_QWORD *)(v10 + 32) = v12;
      if (v13)
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 40))(v13);
      v14 = v19;
      v19 = 0;
      if (v14)
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 40))(v14);
      v15 = v10 + 40;
      v16 = v10 + 80;
      v10 += 40;
    }
    while ((PKOutputFunction *)v16 != end);
    v11 = p_radiusOutput->__end_;
    v10 = v15;
  }
  while (v11 != (PKOutputFunction *)v10)
  {
    v17 = *((_QWORD *)v11 - 1);
    *((_QWORD *)v11 - 1) = 0;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 40))(v17);
    v11 = (PKOutputFunction *)((char *)v11 - 40);
  }
  p_radiusOutput->__end_ = (PKOutputFunction *)v10;

}

- (void)addNewInkFunction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[32];
  uint64_t v11;

  v4 = a3;
  -[PKInkBehavior outputFunctionFromInkFunction:]((uint64_t)v10, (uint64_t)self, v4);
  -[PKInkBehavior functionsForProperty:](self, objc_msgSend(v4, "inkProperty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "inkProperty");
  if (self)
  {
    switch(v6)
    {
      case 0:
        self = (PKInkBehavior *)((char *)self + 80);
        break;
      case 1:
        self = (PKInkBehavior *)((char *)self + 128);
        break;
      case 2:
        self = (PKInkBehavior *)((char *)self + 152);
        break;
      case 3:
        self = (PKInkBehavior *)((char *)self + 176);
        break;
      case 4:
        self = (PKInkBehavior *)((char *)self + 104);
        break;
      default:
        self = 0;
        break;
    }
  }
  objc_msgSend(v5, "addObject:", v4);
  v7 = *(_QWORD *)&self->_usesAzimuthOrAltitude;
  if (v7 >= *(_QWORD *)&self->_rulerOffsetScale)
  {
    v8 = std::vector<PKOutputFunction>::__push_back_slow_path<PKOutputFunction>((uint64_t *)self, (const PKOutputFunction *)v10);
  }
  else
  {
    PKOutputFunction::PKOutputFunction(*(PKOutputFunction **)&self->_usesAzimuthOrAltitude, (const PKOutputFunction *)v10);
    v8 = v7 + 40;
    *(_QWORD *)&self->_usesAzimuthOrAltitude = v7 + 40;
  }
  *(_QWORD *)&self->_usesAzimuthOrAltitude = v8;

  v9 = v11;
  v11 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 40))(v9);

}

- (double)brushOpacityForPoint:(uint64_t)a3 context:
{
  double v3;
  uint64_t **v5;
  void *v7;
  double v8;
  __int128 v10;

  v3 = 0.0;
  if (a1)
  {
    v5 = a1 + 25;
    if (a1[26] != a1[25])
    {
      objc_msgSend(*(id *)(a3 + 136), "ink", *a2, a2[1], a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "weight");
      v3 = -[PKInkBehavior solve:forPoint:context:weight:](a1, v5, (uint64_t)&v10, a3, v8);

    }
  }
  return v3;
}

- (double)solve:(uint64_t)a3 forPoint:(uint64_t)a4 context:(double)a5 weight:
{
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __n128 v20;
  uint64_t *v21;
  uint64_t *v22;
  double v23;
  double v24;
  uint64_t v25;
  double (***v26)(__n128, double);
  _QWORD *v27;
  double *v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;

  if (!a1)
    return 0.0;
  v10 = *(_QWORD *)(a4 + 96);
  v12 = *(double *)(a4 + 104);
  v11 = *(double *)(a4 + 112);
  v13 = *(double *)(a4 + 120);
  if (v10 == 1)
  {
    objc_msgSend(*(id *)(a4 + 136), "ink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "_isEraserInk"))
    {
      v15 = *(_QWORD *)(a4 + 144);

      if ((v15 & 2) != 0)
        v16 = 1;
      else
        v16 = 4;
    }
    else
    {

      v16 = 1;
    }
  }
  else if (*(double *)(a3 + 16) >= 0.0)
  {
    v16 = 2;
  }
  else
  {
    v16 = 4;
  }
  if (*(_BYTE *)(a4 + 88))
    v17 = 1;
  else
    v17 = 2;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "userInterfaceIdiom"))
    v19 = 2;
  else
    v19 = 1;

  v22 = *a2;
  v21 = a2[1];
  if (v22 == v21)
    return 1.0;
  if (v10)
    v23 = 1.0;
  else
    v23 = v11;
  v24 = 1.0;
  do
  {
    v25 = *v22;
    if ((*v22 & v16) != 0
      && (v22[2] & v17) != 0
      && (v22[1] & v19) != 0
      && ((v25 & 8) == 0 || (*(_BYTE *)(a4 + 144) & 4) == 0)
      && ((v25 & 0x10) == 0 || (*(_BYTE *)(a4 + 144) & 2) == 0))
    {
      switch(v22[3])
      {
        case 1:
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(_QWORD *)(a3 + 40);
          break;
        case 2:
          if (objc_msgSend(a1, "useUnclampedWeight") && (*(_BYTE *)(a4 + 144) & 2) == 0)
            goto LABEL_42;
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(_QWORD *)(a3 + 32);
          break;
        case 4:
          if (objc_msgSend(a1, "useUnclampedWeight") && (*(_BYTE *)(a4 + 144) & 4) == 0)
            goto LABEL_42;
          v20.n128_f64[0] = *(double *)(a3 + 16) / v23;
          v26 = (double (***)(__n128, double))v22[4];
          break;
        case 5:
          v24 = v24 * v12 + 2.0;
          goto LABEL_42;
        case 6:
          v26 = (double (***)(__n128, double))v22[4];
          v20.n128_u64[0] = *(_QWORD *)(a3 + 48);
          break;
        case 7:
          v27 = (_QWORD *)v22[4];
          v28 = (double *)v27[7];
          v29 = *v28;
          v30 = v28[1];
          v31 = (double *)v27[1];
          v32 = *v31;
          v33 = (double *)v27[4];
          v34 = *v33;
          v35 = *(double *)(a3 + 16);
          v36 = v30 - v29;
          v37 = v13 > v29 && v35 < v13;
          v38 = fmax(fmin((v35 - v29) / v36, 1.0), 0.0);
          v39 = v38 * (v38 * (v38 * -2.0)) + v38 * 3.0 * v38;
          v40 = v31[1] - v32;
          v41 = v32 + v39 * v40;
          v42 = fmax(fmin((v13 - v29) / v36, 1.0), 0.0);
          v43 = v32 + v42 * v40;
          v44 = fmax(fmin(v35 / v13, 1.0), 0.0);
          v45 = v44 * (v44 * (v44 * -2.0)) + v44 * 3.0 * v44;
          v46 = v32 + v45 * (v43 - v32);
          v47 = v34 + v42 * (v33[1] - v34);
          if (v37)
          {
            v48 = v45;
          }
          else
          {
            v47 = v33[1];
            v48 = v39;
          }
          if (!v37)
            v46 = v41;
          v20.n128_f64[0] = v46 + (v34 + v48 * (v47 - v34) - v46) * ((a5 + 1.0) * 0.5);
          goto LABEL_41;
        default:
          v20.n128_u64[0] = 0;
          v20.n128_f64[0] = (**(double (***)(__n128, double))v22[4])(v20, a5);
          goto LABEL_41;
      }
      v20.n128_f64[0] = (**v26)(v20, a5);
LABEL_41:
      v24 = v24 * v20.n128_f64[0];
    }
LABEL_42:
    v22 += 5;
  }
  while (v22 != v21);
  return v24;
}

- (double)alphaForStroke:(double *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  double v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = -[PKInkBehavior alphaForStrokeColor:](a1, (CGColor *)objc_msgSend(v6, "CGColor"));

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)alphaForStrokeColor:(double *)a1
{
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  if (a1)
  {
    if (a2)
    {
      objc_msgSend(a1, "renderingDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "type") == 1)
      {
        v5 = objc_msgSend(a1, "version");

        if (v5 <= 2)
          return CGColorGetAlpha(a2) * a1[35];
      }
      else
      {

      }
      objc_msgSend(a1, "renderingDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "blendMode");

      if (!v7)
        return CGColorGetAlpha(a2) * a1[35];
    }
    return a1[35];
  }
  return 0.0;
}

- (void)radiusForPoint:(uint64_t)a3 context:
{
  void *v6;
  double v7;
  double v8;
  double (***v9)(_QWORD, double, double);
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[8];
  _OWORD v21[8];

  if (a1)
  {
    objc_msgSend(*(id *)(a3 + 136), "ink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "weight");
    v8 = v7;

    v9 = *(double (****)(_QWORD, double, double))(a1 + 72);
    if (v9)
      v8 = (**v9)(v9, v8, v8);
    objc_msgSend((id)a1, "particleDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "particleSize");

    if (*(_QWORD *)(a1 + 88) != *(_QWORD *)(a1 + 80))
    {
      v12 = a2[5];
      v21[4] = a2[4];
      v21[5] = v12;
      v13 = a2[7];
      v21[6] = a2[6];
      v21[7] = v13;
      v14 = a2[1];
      v21[0] = *a2;
      v21[1] = v14;
      v15 = a2[3];
      v21[2] = a2[2];
      v21[3] = v15;
      -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 80), (uint64_t)v21, a3, v8);
    }
    if (*(_QWORD *)(a1 + 184) != *(_QWORD *)(a1 + 176))
    {
      v16 = a2[5];
      v20[4] = a2[4];
      v20[5] = v16;
      v17 = a2[7];
      v20[6] = a2[6];
      v20[7] = v17;
      v18 = a2[1];
      v20[0] = *a2;
      v20[1] = v18;
      v19 = a2[3];
      v20[2] = a2[2];
      v20[3] = v19;
      -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 176), (uint64_t)v20, a3, v8);
    }
  }
}

- (double)edgeWidthForPoint:(uint64_t)a3 context:
{
  double v3;
  void *v7;
  double v8;
  double v9;
  double (***v10)(_QWORD, double, double);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v16[8];

  v3 = 0.0;
  if (a1)
  {
    objc_msgSend(*(id *)(a3 + 136), "ink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "weight");
    v9 = v8;

    v10 = *(double (****)(_QWORD, double, double))(a1 + 72);
    if (v10)
      v9 = (**v10)(v10, v9, v9);
    if (*(_QWORD *)(a1 + 160) != *(_QWORD *)(a1 + 152))
    {
      v11 = a2[5];
      v16[4] = a2[4];
      v16[5] = v11;
      v12 = a2[7];
      v16[6] = a2[6];
      v16[7] = v12;
      v13 = a2[1];
      v16[0] = *a2;
      v16[1] = v13;
      v14 = a2[3];
      v16[2] = a2[2];
      v16[3] = v14;
      return -[PKInkBehavior solve:forPoint:context:weight:]((void *)a1, (uint64_t **)(a1 + 152), (uint64_t)v16, a3, v9);
    }
  }
  return v3;
}

- (uint64_t)outputForPoint:(uint64_t)a3@<X2> context:(uint64_t)a4@<X8>
{
  uint64_t v7;
  __int128 v8;
  double *v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double (***v21)(_QWORD, double, double);
  void *v22;
  float v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  int v57;
  double *v58;
  double v59;
  __int128 v60;
  double v61;
  _OWORD v62[8];
  _OWORD v63[8];
  _OWORD v64[8];
  _OWORD v65[8];
  _OWORD v66[8];
  _OWORD v67[8];
  _OWORD v68[8];

  if (result)
  {
    v7 = result;
    *(_QWORD *)a4 = *(_QWORD *)(a2 + 64);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)a2;
    *(_QWORD *)(a4 + 48) = *(_QWORD *)(a2 + 16);
    v8 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 56) = v8;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a4 + 72) = _Q0;
    *(_QWORD *)(a4 + 40) = 0;
    v14 = (double *)(a4 + 40);
    *(_OWORD *)(a4 + 24) = _Q0;
    v15 = *(unsigned __int8 *)(a3 + 88);
    if (*(_BYTE *)(a3 + 88) && *(_QWORD *)(a3 + 96) == 1)
    {
      *(_QWORD *)&v8 = *(_QWORD *)(a3 + 56);
      v16 = *(_QWORD *)(a3 + 64);
      *(_QWORD *)(a2 + 24) = v8;
      *(_QWORD *)(a2 + 32) = v16;
      *(_QWORD *)(a4 + 56) = v8;
      *(_QWORD *)(a4 + 64) = v16;
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    v60 = v8;
    objc_msgSend(*(id *)(a3 + 136), "ink", *(double *)(a2 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "weight");
    v20 = v19;

    v21 = *(double (****)(_QWORD, double, double))(v7 + 72);
    if (v21)
      v20 = (**v21)(v21, v20, v20);
    if (objc_msgSend((id)v7, "useUnclampedWeight", v60))
    {
      objc_msgSend(*(id *)(v7 + 320), "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v24 = v20 / v23 * 2.0 + -1.0;

      v25 = *(_OWORD *)(a2 + 80);
      v68[4] = *(_OWORD *)(a2 + 64);
      v68[5] = v25;
      v26 = *(_OWORD *)(a2 + 112);
      v68[6] = *(_OWORD *)(a2 + 96);
      v68[7] = v26;
      v27 = *(_OWORD *)(a2 + 16);
      v68[0] = *(_OWORD *)a2;
      v68[1] = v27;
      v28 = *(_OWORD *)(a2 + 48);
      v68[2] = *(_OWORD *)(a2 + 32);
      v68[3] = v28;
      v29 = v20
          * -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 80), (uint64_t)v68, a3, v24);
      *(double *)(a4 + 24) = v29;
      if (*(_QWORD *)(v7 + 112) != *(_QWORD *)(v7 + 104))
      {
        v30 = *(_OWORD *)(a2 + 80);
        v67[4] = *(_OWORD *)(a2 + 64);
        v67[5] = v30;
        v31 = *(_OWORD *)(a2 + 112);
        v67[6] = *(_OWORD *)(a2 + 96);
        v67[7] = v31;
        v32 = *(_OWORD *)(a2 + 16);
        v67[0] = *(_OWORD *)a2;
        v67[1] = v32;
        v33 = *(_OWORD *)(a2 + 48);
        v67[2] = *(_OWORD *)(a2 + 32);
        v67[3] = v33;
        *(double *)(a4 + 80) = v20
                             * -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 104), (uint64_t)v67, a3, v24);
      }
      objc_msgSend((id)v7, "renderingDescriptor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "type");

      if (!v35)
      {
        v29 = v29 + 2.0;
        *(double *)(a4 + 24) = v29;
      }
    }
    else
    {
      v36 = *(_OWORD *)(a2 + 80);
      v66[4] = *(_OWORD *)(a2 + 64);
      v66[5] = v36;
      v37 = *(_OWORD *)(a2 + 112);
      v66[6] = *(_OWORD *)(a2 + 96);
      v66[7] = v37;
      v38 = *(_OWORD *)(a2 + 16);
      v66[0] = *(_OWORD *)a2;
      v66[1] = v38;
      v39 = *(_OWORD *)(a2 + 48);
      v66[2] = *(_OWORD *)(a2 + 32);
      v66[3] = v39;
      v29 = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 80), (uint64_t)v66, a3, v20);
      *(double *)(a4 + 24) = v29;
      if (*(_QWORD *)(v7 + 112) != *(_QWORD *)(v7 + 104))
      {
        v40 = *(_OWORD *)(a2 + 80);
        v65[4] = *(_OWORD *)(a2 + 64);
        v65[5] = v40;
        v41 = *(_OWORD *)(a2 + 112);
        v65[6] = *(_OWORD *)(a2 + 96);
        v65[7] = v41;
        v42 = *(_OWORD *)(a2 + 16);
        v65[0] = *(_OWORD *)a2;
        v65[1] = v42;
        v43 = *(_OWORD *)(a2 + 48);
        v65[2] = *(_OWORD *)(a2 + 32);
        v65[3] = v43;
        *(double *)(a4 + 80) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 104), (uint64_t)v65, a3, v20);
      }
    }
    if (*(_QWORD *)(v7 + 160) != *(_QWORD *)(v7 + 152))
    {
      v44 = *(_OWORD *)(a2 + 80);
      v64[4] = *(_OWORD *)(a2 + 64);
      v64[5] = v44;
      v45 = *(_OWORD *)(a2 + 112);
      v64[6] = *(_OWORD *)(a2 + 96);
      v64[7] = v45;
      v46 = *(_OWORD *)(a2 + 16);
      v64[0] = *(_OWORD *)a2;
      v64[1] = v46;
      v47 = *(_OWORD *)(a2 + 48);
      v64[2] = *(_OWORD *)(a2 + 32);
      v64[3] = v47;
      *v14 = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 152), (uint64_t)v64, a3, v20);
    }
    if (*(_QWORD *)(v7 + 184) != *(_QWORD *)(v7 + 176))
    {
      v48 = *(_OWORD *)(a2 + 80);
      v63[4] = *(_OWORD *)(a2 + 64);
      v63[5] = v48;
      v49 = *(_OWORD *)(a2 + 112);
      v63[6] = *(_OWORD *)(a2 + 96);
      v63[7] = v49;
      v50 = *(_OWORD *)(a2 + 16);
      v63[0] = *(_OWORD *)a2;
      v63[1] = v50;
      v51 = *(_OWORD *)(a2 + 48);
      v63[2] = *(_OWORD *)(a2 + 32);
      v63[3] = v51;
      *(double *)(a4 + 32) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 176), (uint64_t)v63, a3, v20);
    }
    if (*(_QWORD *)(v7 + 136) != *(_QWORD *)(v7 + 128))
    {
      v52 = *(_OWORD *)(a2 + 80);
      v62[4] = *(_OWORD *)(a2 + 64);
      v62[5] = v52;
      v53 = *(_OWORD *)(a2 + 112);
      v62[6] = *(_OWORD *)(a2 + 96);
      v62[7] = v53;
      v54 = *(_OWORD *)(a2 + 16);
      v62[0] = *(_OWORD *)a2;
      v62[1] = v54;
      v55 = *(_OWORD *)(a2 + 48);
      v62[2] = *(_OWORD *)(a2 + 32);
      v62[3] = v55;
      *(double *)(a4 + 72) = -[PKInkBehavior solve:forPoint:context:weight:]((void *)v7, (uint64_t **)(v7 + 128), (uint64_t)v62, a3, v20);
    }
    objc_msgSend((id)v7, "particleDescriptor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "initialRandomRotation");

    if (v57)
      *(double *)(a4 + 56) = v61
                           + (double)objc_msgSend(*(id *)(a3 + 136), "randomSeed")
                           * 6.28318531
                           / 4294967300.0;
    v58 = (double *)(a3 + 40);
    if (!v15)
      v58 = (double *)(a4 + 40);
    *v14 = *v58;
    if (v15)
      v29 = fmax(*(double *)(a3 + 24), 2.0);
    *(double *)(a4 + 24) = v29;
    if (v17)
      *(_QWORD *)(a4 + 32) = *(_QWORD *)(a3 + 32);
    result = os_variant_has_internal_diagnostics();
    if ((_DWORD)result)
    {
      result = objc_msgSend((id)objc_opt_class(), "inkRadiusOverride");
      if (v59 > 0.0)
        *(double *)(a4 + 24) = v59;
    }
  }
  else
  {
    *(_QWORD *)(a4 + 80) = 0;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  return result;
}

- (BOOL)isEraser
{
  void *v2;
  BOOL v3;

  -[PKInkBehavior renderingDescriptor](self, "renderingDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blendMode") == 2;

  return v3;
}

- (id)particleTextureName
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "particleDescriptor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "textureName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
