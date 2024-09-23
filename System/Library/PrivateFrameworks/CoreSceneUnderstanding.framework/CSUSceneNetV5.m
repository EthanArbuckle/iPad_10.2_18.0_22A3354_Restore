@implementation CSUSceneNetV5

- (CSUSceneNetV5)initWithConfiguration:(id)a3
{
  id v5;
  CSUSceneNetV5 *v6;
  CSUSceneNetV5 *v7;
  CSUSceneNetV5 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUSceneNetV5;
  v6 = -[CSUSceneNetV5 init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  EspressoNet *v32;
  EspressoNet *value;
  EspressoNet *v34;
  void **v35;
  void *v36;
  void **v37;
  void **v38;
  void *v39;
  void **v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  EspressoNet *v49;
  EspressoNet *v50;
  EspressoNet *v51;
  void **v52;
  void *v53;
  void **v54;
  void **v55;
  void *v56;
  void **v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  BOOL v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  char IsSoftmax;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD *v78;
  unint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  ObjectDetectionConfiguration *v84;
  _QWORD *v85;
  _QWORD *v86;
  void *v87;
  void *v88;
  _QWORD *v89;
  _QWORD *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  BOOL v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  size_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  ImageDescriptorProcessorHyperplaneLSH *v112;
  ImageDescriptorProcessorHyperplaneLSH *v113;
  _QWORD *v114;
  uint64_t v115;
  void *v117[2];
  unint64_t v118;
  void *v119;
  unint64_t v120;
  void *v121;
  uint64_t v122;
  int v123;
  void *v124;
  void *v125[2];
  void *v126[2];
  int v127;
  void *__p;
  char v129;
  const char *v130;
  EspressoNet *v131;
  _QWORD v132[3];
  _QWORD *v133;
  uint64_t v134;

  v134 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  sub_23A016E78();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v117[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CSUSceneNetLoadResources", ", (uint8_t *)v117, 2u);
  }

  v132[0] = &off_250B0DF98;
  v132[1] = v6;
  v13 = v132;
  v133 = v132;
  if (self->_net.__ptr_.__value_)
  {
    v14 = 1;
    goto LABEL_84;
  }
  if (objc_msgSend_revision(self->_configuration, v9, v10, v11, v12) == 3
    && objc_msgSend_espressoExecutionEngine(self->_configuration, v15, v16, v17, v18) == 10007)
  {
    objc_msgSend_espressoNetworkPath(self->_configuration, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v19, v20, (uint64_t)CFSTR(".espresso.net"), (uint64_t)CFSTR("_dev_op.espresso.net"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    v130 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26, v27);
    v117[0] = 0;
    v117[1] = 0;
    v118 = 0;
    LODWORD(v119) = objc_msgSend_espressoExecutionEngine(self->_configuration, v28, v29, v30, v31);
    BYTE4(v119) = 1;
    LOBYTE(v120) = 0;
    BYTE4(v120) = 0;
    v121 = (void *)0xFFFFFFFFLL;
    LOBYTE(v122) = 0;
    BYTE4(v122) = 0;
    LOBYTE(v123) = 0;
    LOBYTE(v124) = 0;
    *(_OWORD *)v125 = 0u;
    *(_OWORD *)v126 = 0u;
    v127 = 1065353216;
    v129 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v130, (uint64_t)v117, &v131);
    v32 = v131;
    v131 = 0;
    value = self->_net.__ptr_.__value_;
    self->_net.__ptr_.__value_ = v32;
    if (value)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)value + 8))(value);
      v34 = v131;
      v131 = 0;
      if (v34)
        (*(void (**)(EspressoNet *))(*(_QWORD *)v34 + 8))(v34);
    }
    if (v129 < 0)
      operator delete(__p);
    v35 = (void **)v126[0];
    if (v126[0])
    {
      do
      {
        v40 = (void **)*v35;
        if (*((char *)v35 + 39) < 0)
          operator delete(v35[2]);
        operator delete(v35);
        v35 = v40;
      }
      while (v40);
    }
    v36 = v125[0];
    v125[0] = 0;
    if (v36)
      operator delete(v36);
    v37 = (void **)v117[0];
    if (v117[0])
    {
      v38 = (void **)v117[1];
      v39 = v117[0];
      if (v117[1] != v117[0])
      {
        do
        {
          if (*((char *)v38 - 1) < 0)
            operator delete(*(v38 - 3));
          v38 -= 3;
        }
        while (v38 != v37);
        v39 = v117[0];
      }
      v117[1] = v37;
      operator delete(v39);
    }
  }
  else
  {
    objc_msgSend_espressoNetworkPath(self->_configuration, v15, v16, v17, v18);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v130 = (const char *)objc_msgSend_UTF8String(v23, v41, v42, v43, v44);
    v117[0] = 0;
    v117[1] = 0;
    v118 = 0;
    LODWORD(v119) = objc_msgSend_espressoExecutionEngine(self->_configuration, v45, v46, v47, v48);
    BYTE4(v119) = 1;
    LOBYTE(v120) = 0;
    BYTE4(v120) = 0;
    v121 = (void *)0xFFFFFFFFLL;
    LOBYTE(v122) = 0;
    BYTE4(v122) = 0;
    LOBYTE(v123) = 0;
    LOBYTE(v124) = 0;
    *(_OWORD *)v125 = 0u;
    *(_OWORD *)v126 = 0u;
    v127 = 1065353216;
    v129 = 0;
    LOBYTE(__p) = 0;
    sub_239FEE07C(&v130, (uint64_t)v117, &v131);
    v49 = v131;
    v131 = 0;
    v50 = self->_net.__ptr_.__value_;
    self->_net.__ptr_.__value_ = v49;
    if (v50)
    {
      (*(void (**)(EspressoNet *))(*(_QWORD *)v50 + 8))(v50);
      v51 = v131;
      v131 = 0;
      if (v51)
        (*(void (**)(EspressoNet *))(*(_QWORD *)v51 + 8))(v51);
    }
    if (v129 < 0)
      operator delete(__p);
    v52 = (void **)v126[0];
    if (v126[0])
    {
      do
      {
        v57 = (void **)*v52;
        if (*((char *)v52 + 39) < 0)
          operator delete(v52[2]);
        operator delete(v52);
        v52 = v57;
      }
      while (v57);
    }
    v53 = v125[0];
    v125[0] = 0;
    if (v53)
      operator delete(v53);
    v54 = (void **)v117[0];
    if (v117[0])
    {
      v55 = (void **)v117[1];
      v56 = v117[0];
      if (v117[1] != v117[0])
      {
        do
        {
          if (*((char *)v55 - 1) < 0)
            operator delete(*(v55 - 3));
          v55 -= 3;
        }
        while (v55 != v54);
        v56 = v117[0];
      }
      v117[1] = v54;
      operator delete(v56);
    }
  }

  objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v58, (uint64_t)a3, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61 == 0;

  if (v62)
  {
    v14 = 0;
    goto LABEL_83;
  }
  objc_msgSend_detectionTaxonomyWithError_(self->_configuration, v63, (uint64_t)a3, v64, v65);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {
    IsSoftmax = objc_msgSend_detectionHeadIsSoftmax(self->_configuration, v66, v67, v68, v69);
    objc_msgSend_detectionVocabularyName(self->_configuration, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    sub_23A0215E0(IsSoftmax, v70, v76, 0, (uint64_t)v117);
    v77 = operator new();
    *(_OWORD *)v77 = *(_OWORD *)v117;
    v78 = v119;
    v79 = v120;
    v80 = v121;
    v119 = 0;
    v120 = 0;
    *(_QWORD *)(v77 + 16) = v118;
    *(_QWORD *)(v77 + 24) = v78;
    *(_QWORD *)(v77 + 32) = v79;
    *(_QWORD *)(v77 + 40) = v80;
    v81 = v122;
    *(_QWORD *)(v77 + 48) = v122;
    *(_DWORD *)(v77 + 56) = v123;
    if (v81)
    {
      v82 = v80[1];
      if ((v79 & (v79 - 1)) != 0)
      {
        if (v82 >= v79)
          v82 %= v79;
      }
      else
      {
        v82 &= v79 - 1;
      }
      v78[v82] = v77 + 40;
      v121 = 0;
      v122 = 0;
    }
    v83 = v124;
    v124 = 0;
    *(_QWORD *)(v77 + 64) = v83;
    v84 = self->_objectDetectionConfiguration.__ptr_.__value_;
    self->_objectDetectionConfiguration.__ptr_.__value_ = (ObjectDetectionConfiguration *)v77;
    if (v84)
    {

      v85 = (_QWORD *)*((_QWORD *)v84 + 5);
      if (v85)
      {
        do
        {
          v86 = (_QWORD *)*v85;
          operator delete(v85);
          v85 = v86;
        }
        while (v86);
      }
      v87 = (void *)*((_QWORD *)v84 + 3);
      *((_QWORD *)v84 + 3) = 0;
      if (v87)
        operator delete(v87);
      MEMORY[0x23B83FE88](v84, 0x10A0C4038C3C9F3);
      v88 = v124;
    }
    else
    {
      v88 = 0;
    }

    v89 = v121;
    if (v121)
    {
      do
      {
        v90 = (_QWORD *)*v89;
        operator delete(v89);
        v89 = v90;
      }
      while (v90);
    }
    v91 = v119;
    v119 = 0;
    if (v91)
      operator delete(v91);

    objc_msgSend_aestheticsTaxonomyWithError_(self->_configuration, v92, (uint64_t)a3, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95 == 0;

    if (!v96)
    {
      objc_msgSend_fingerprintModelPath(self->_configuration, v97, v98, v99, v100);
      v101 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v106 = (const char *)objc_msgSend_UTF8String(v101, v102, v103, v104, v105);
      v107 = strlen(v106);
      if (v107 >= 0x7FFFFFFFFFFFFFF8)
        sub_239FEBDE0();
      v108 = (void *)v107;
      if (v107 >= 0x17)
      {
        v110 = (v107 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v107 | 7) != 0x17)
          v110 = v107 | 7;
        v111 = v110 + 1;
        v109 = operator new(v110 + 1);
        v117[1] = v108;
        v118 = v111 | 0x8000000000000000;
        v117[0] = v109;
      }
      else
      {
        HIBYTE(v118) = v107;
        v109 = v117;
        if (!v107)
          goto LABEL_77;
      }
      memmove(v109, v106, (size_t)v108);
LABEL_77:
      *((_BYTE *)v108 + (_QWORD)v109) = 0;

      v112 = (ImageDescriptorProcessorHyperplaneLSH *)operator new();
      sub_23A0331AC(v112);
      v113 = self->_fingerprinter.__ptr_.__value_;
      self->_fingerprinter.__ptr_.__value_ = v112;
      if (v113)
        (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *))(*(_QWORD *)v113 + 8))(v113);
      if (SHIBYTE(v118) < 0)
        operator delete(v117[0]);
      v14 = 1;
      goto LABEL_82;
    }
  }
  v14 = 0;
LABEL_82:

LABEL_83:
  v13 = v133;
  if (!v133)
    sub_239FF19E8();
LABEL_84:
  (*(void (**)(_QWORD *))(*v13 + 48))(v13);
  v114 = v133;
  if (v133 == v132)
  {
    v115 = 4;
    v114 = v132;
    goto LABEL_88;
  }
  if (v133)
  {
    v115 = 5;
LABEL_88:
    (*(void (**)(void))(*v114 + 8 * v115))();
  }
  return v14;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  VTPixelTransferSessionRef **value;
  PixelBufferTransfer *v13;
  CFTypeRef *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[3];
  _QWORD *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_23A016E78();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  sub_23A016E78();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v20[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CSUSceneNetResampleImage", ", (uint8_t *)v20, 2u);
  }

  v20[0] = &off_250B0E038;
  v20[1] = v9;
  v21 = v20;
  value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
  if (!value)
  {
    value = (VTPixelTransferSessionRef **)operator new();
    sub_239FF7DAC(value);
    v13 = self->_transferSession.__ptr_.__value_;
    self->_transferSession.__ptr_.__value_ = (PixelBufferTransfer *)value;
    if (v13)
    {
      v14 = *(CFTypeRef **)v13;
      *(_QWORD *)v13 = 0;
      if (v14)
      {
        if (*v14)
          CFRelease(*v14);
        MEMORY[0x23B83FE88](v14, 0x20C4093837F09);
      }
      MEMORY[0x23B83FE88](v13, 0x20C4093837F09);
      value = (VTPixelTransferSessionRef **)self->_transferSession.__ptr_.__value_;
    }
  }
  v15 = VTPixelTransferSessionTransferImage(**value, a3, a4);
  sub_239FF1B38(v15, "Image Transfer");
  if (!v21)
    sub_239FF19E8();
  (*(void (**)(_QWORD *))(*v21 + 48))(v21);
  v17 = v21;
  if (v21 == v20)
  {
    v18 = 4;
    v17 = v20;
    goto LABEL_16;
  }
  if (v21)
  {
    v18 = 5;
LABEL_16:
    (*(void (**)(_QWORD *, uint64_t))(*v17 + 8 * v18))(v17, v16);
  }
  return 1;
}

- (void)runOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint8_t buf[8];
  os_signpost_id_t v16;
  uint8_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  sub_23A016E78();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  sub_23A016E78();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_239FE9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CSUSceneNetRunOnInputImage", ", buf, 2u);
  }

  *(_QWORD *)buf = &off_250B0E0B8;
  v16 = v8;
  v17 = buf;
  objc_msgSend__unsafeRunOnInputImage_completion_(self, v11, (uint64_t)a3, (uint64_t)v6, v12);
  if (!v17)
    sub_239FF19E8();
  (*(void (**)(uint8_t *))(*(_QWORD *)v17 + 48))(v17);
  v13 = v17;
  if (v17 == buf)
  {
    v14 = 4;
    v13 = buf;
    goto LABEL_9;
  }
  if (v17)
  {
    v14 = 5;
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
  }

}

- (vector<float,)computeAllSceneClassificationLikelihoods:(CSUSceneNetV5 *)self
{
  id v6;
  CSUSceneNetV5Configuration *configuration;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  vector<float, std::allocator<float>> *result;
  std::runtime_error *exception;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  std::runtime_error *v40;
  _QWORD *v41;
  std::runtime_error *v42;
  std::string *v43;
  std::string::size_type size;
  std::string *v45;
  __int128 v46;
  std::string v47;
  std::string v48;
  std::string v49;
  std::string v50;
  std::string v51;
  id v52;

  v6 = a4;
  configuration = self->_configuration;
  v52 = 0;
  objc_msgSend_sceneTaxonomyWithError_(configuration, v8, (uint64_t)&v52, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v52;
  if (v16)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    objc_msgSend_localizedDescription(v16, v30, v31, v32, v33);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v39 = (char *)objc_msgSend_UTF8String(v34, v35, v36, v37, v38);
    sub_239FEE1FC(&v50, v39);
    sub_239FEEC54("SceneNet taxonomy could not be loaded: ", &v50, &v51);
    std::runtime_error::runtime_error(exception, &v51);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v12, v13, v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (_QWORD *)sub_239FEECB0(v6);
  objc_msgSend__vocabularyNamed_(v11, v19, (uint64_t)v17, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_internalCount(v22, v23, v24, v25, v26);

  if (v18[12] != v27)
  {
    v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v41 = v18;
    v42 = v40;
    std::to_string(&v48, v41[12]);
    sub_239FEEC54("Number of channels ", &v48, &v49);
    sub_239FEED88(" in supplied likelihood buffer does not match the expected number ", &v49, &v50);
    std::to_string(&v47, v27);
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v43 = &v47;
    else
      v43 = (std::string *)v47.__r_.__value_.__r.__words[0];
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v47.__r_.__value_.__r.__words[2]);
    else
      size = v47.__r_.__value_.__l.__size_;
    v45 = std::string::append(&v50, (const std::string::value_type *)v43, size);
    v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
    v51.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v46;
    v45->__r_.__value_.__l.__size_ = 0;
    v45->__r_.__value_.__r.__words[2] = 0;
    v45->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v42, &v51);
    __cxa_throw(v42, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  sub_23A02126C(v11, v17, v18, (uint64_t *)retstr);

  return result;
}

- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  void *v47;
  id obj;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD v59[4];
  _QWORD v60[7];
  _QWORD v61[2];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v49 = a4;
  objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v9, (uint64_t)a5, v10, v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v12, v13, v14, v15);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_hierarchicalSceneClassificationVocabularyName(self->_configuration, v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_computeAllSceneClassificationLikelihoods_(self, v22, (uint64_t)v8, v23, v24);
    v25 = (char *)v60[0];
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v61[0] = v46;
    v61[1] = v21;
    v47 = (void *)v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v26, (uint64_t)v61, 2, v27);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v51, (uint64_t)v62, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v52 != v33)
            objc_enumerationMutation(obj);
          objc_msgSend__vocabularyNamed_(v50, v29, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i), v30, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = &v25[4 * objc_msgSend_startIndex(v35, v36, v37, v38, v39)];
          v41 = v49;
          v60[0] = 0;
          v60[1] = v60;
          v60[2] = 0x3812000000;
          v60[3] = sub_239FF7FE8;
          v60[4] = nullsub_7;
          v60[5] = &unk_23A0C154D;
          v60[6] = v40;
          v59[0] = 0;
          v59[1] = v59;
          v59[2] = 0x2020000000;
          v59[3] = 0;
          v55[0] = MEMORY[0x24BDAC760];
          v55[1] = 3221225472;
          v55[2] = sub_239FF7FF8;
          v55[3] = &unk_250B0E130;
          v57 = v60;
          v58 = v59;
          v56 = v41;
          objc_msgSend__enumerateVisibleLabelsAndIndicesInVocabularyUsingBlock_(v35, v42, (uint64_t)v55, v43, v44);

          _Block_object_dispose(v59, 8);
          _Block_object_dispose(v60, 8);

        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v51, (uint64_t)v62, 16);
      }
      while (v32);
    }

    if (v25)
      operator delete(v25);
    v16 = 1;

  }
  return v16;
}

- (BOOL)enumerateSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateSceneClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)allSceneClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_239FEF38C;
  v13[3] = &unk_250B0DF68;
  v14 = v7;
  v8 = v7;
  if (objc_msgSend_enumerateSceneClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)allSceneClassificationLikelihoods:(id)a3
{
  uint64_t v3;

  objc_msgSend_allSceneClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  std::runtime_error *exception;

  v8 = a3;
  v9 = a4;
  objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v25 = 0;
    goto LABEL_9;
  }
  objc_msgSend_leafSceneClassificationVocabularyName(self->_configuration, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v24 = (_QWORD *)objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_23A020B0C(v17, v18, v24, v9);
  v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateLeafSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return MEMORY[0x24BEDD108](self, sel_enumerateLeafSceneClassificationLikelihoods_usingBlock_error_, a3, a4, 0);
}

- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t started;
  BOOL v31;
  void *v33;

  v8 = a3;
  v9 = a4;
  objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend_hierarchicalSceneClassificationVocabularyName(self->_configuration, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_computeAllSceneClassificationLikelihoods_(self, v19, (uint64_t)v8, v20, v21);
    objc_msgSend__vocabularyNamed_(v17, v22, (uint64_t)v18, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    started = objc_msgSend_startIndex(v25, v26, v27, v28, v29);
    sub_239FEF190(v25, (uint64_t)v33 + 4 * started, v9);

    if (v33)
      operator delete(v33);
    v31 = 1;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)enumerateHierarchicalSceneClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return MEMORY[0x24BEDD108](self, sel_enumerateHierarchicalSceneClassificationLikelihoods_usingBlock_error_, a3, a4, 0);
}

- (id)allAestheticsAttributeScores:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_239FEF8A4;
  v13[3] = &unk_250B0DF68;
  v14 = v7;
  v8 = v7;
  if (objc_msgSend_enumerateAestheticsAttributeScores_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)allAestheticsAttributeScores:(id)a3
{
  uint64_t v3;

  objc_msgSend_allAestheticsAttributeScores_error_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allAestheticsGlobalScores:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_239FEFA34;
  v13[3] = &unk_250B0DF68;
  v14 = v7;
  v8 = v7;
  if (objc_msgSend_enumerateAestheticsGlobalScores_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)allAestheticsGlobalScores:(id)a3
{
  uint64_t v3;

  objc_msgSend_allAestheticsGlobalScores_error_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  std::runtime_error *exception;

  v8 = a3;
  v9 = a4;
  objc_msgSend_aestheticsTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v25 = 0;
    goto LABEL_9;
  }
  objc_msgSend_aestheticsAttributeVocabularyName(self->_configuration, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v24 = (_QWORD *)objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_23A020B0C(v17, v18, v24, v9);
  v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateAestheticsAttributeScores:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateAestheticsAttributeScores_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  std::runtime_error *exception;

  v8 = a3;
  v9 = a4;
  objc_msgSend_aestheticsTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v25 = 0;
    goto LABEL_9;
  }
  objc_msgSend_aestheticsGlobalScoreVocabularyName(self->_configuration, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v24 = (_QWORD *)objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_23A020B0C(v17, v18, v24, v9);
  v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateAestheticsGlobalScores:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateAestheticsGlobalScores_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)detectionResultFromScoreHeatMap:(id)a3 coordinateOffsetMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  void **v15;
  void **v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void **v21;
  void **v22;
  void *v23;
  void **v24;
  void **v25;
  void *v26;
  void *v28;
  void **v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  void *__p;
  __int128 v34;

  v6 = a3;
  v7 = a4;
  v8 = sub_239FEECB0(v6);
  v9 = sub_239FEECB0(v7);
  sub_23A021CAC(v8, v9, (uint64_t)self->_objectDetectionConfiguration.__ptr_.__value_, (uint64_t)&__p);
  objc_msgSend_detectionNMSThreshold(self->_configuration, v10, v11, v12, v13);
  if (v14 >= 1.0)
  {
    v18 = __p;
    v19 = v34;
  }
  else
  {
    sub_23A02293C((char *)&__p, (uint64_t)&v31, v14);
    v15 = (void **)__p;
    if (__p)
    {
      v16 = (void **)v34;
      v17 = __p;
      if ((void *)v34 != __p)
      {
        do
        {
          if (*((char *)v16 - 1) < 0)
            operator delete(*(v16 - 3));
          v16 -= 6;
        }
        while (v16 != v15);
        v17 = __p;
      }
      *(_QWORD *)&v34 = v15;
      operator delete(v17);
    }
    v18 = v31;
    __p = v31;
    v34 = v32;
    v19 = v32;
  }
  v28 = 0;
  v29 = 0;
  v30 = 0;
  sub_239FF1D84(&v28, (uint64_t)v18, v19, 0xAAAAAAAAAAAAAAABLL * ((v19 - (uint64_t)v18) >> 4));
  sub_23A022D14(&v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void **)v28;
  if (v28)
  {
    v22 = v29;
    v23 = v28;
    if (v29 != v28)
    {
      do
      {
        if (*((char *)v22 - 1) < 0)
          operator delete(*(v22 - 3));
        v22 -= 6;
      }
      while (v22 != v21);
      v23 = v28;
    }
    v29 = v21;
    operator delete(v23);
  }
  v24 = (void **)__p;
  if (__p)
  {
    v25 = (void **)v34;
    v26 = __p;
    if ((void *)v34 != __p)
    {
      do
      {
        if (*((char *)v25 - 1) < 0)
          operator delete(*(v25 - 3));
        v25 -= 6;
      }
      while (v25 != v24);
      v26 = __p;
    }
    *(_QWORD *)&v34 = v24;
    operator delete(v26);
  }

  return v20;
}

- (__CVBuffer)pixelBufferForSaliencyMap:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t *v5;
  size_t v6;
  size_t v7;
  BOOL v8;
  const __CFAllocator *v9;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v11;
  const void *v12;
  CVReturn v13;
  __CVBuffer *v14;
  uint64_t v15;
  size_t BytesPerRow;
  uint64_t v17;
  char *BaseAddress;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  unint64_t v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  char *v37;
  std::runtime_error *exception;
  std::runtime_error *v40;
  std::runtime_error *v41;
  std::string v42;
  std::string v43;
  __CFDictionary *v44;
  CVPixelBufferRef pixelBufferOut;

  v4 = a3;
  v5 = (uint64_t *)sub_239FEECB0(v4);
  v6 = v5[10];
  v7 = v5[11];
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid dimensions requested for CVPixelBuffer creation.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  pixelBufferOut = 0;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v44 = Mutable;
  v11 = CFDictionaryCreateMutable(v9, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = (const void *)*MEMORY[0x24BDC5668];
  v43.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
  CFDictionarySetValue(Mutable, v12, v11);
  if (v11)
    CFRelease(v11);
  v13 = CVPixelBufferCreate(v9, v6, v7, 0x4C303066u, Mutable, &pixelBufferOut);
  if (v13)
  {
    v40 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v42, v13);
    sub_239FEEC54("Failed to create CVPixelBuffer. Status = ", &v42, &v43);
    std::runtime_error::runtime_error(v40, &v43);
    __cxa_throw(v40, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v14 = pixelBufferOut;
  if (Mutable)
    CFRelease(Mutable);
  if (CVPixelBufferLockBaseAddress(v14, 0))
  {
    v41 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v41, "Failed to lock pixel buffer.");
    goto LABEL_41;
  }
  v15 = v5[16];
  BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  v17 = *v5;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v14);
  v19 = 4 * v15;
  if (v6 > 7)
  {
    if (v6 == (v6 & 0xFFFFFFFFFFFFFFF8))
    {
      v22 = 0;
      v23 = BaseAddress;
      v24 = v17;
      do
      {
        if ((unint64_t)&BaseAddress[BytesPerRow * v22 - v17 - v19 * v22] >= 0x20)
        {
          v26 = 0;
          v27 = v6 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v28 = *(_OWORD *)(v24 + v26 + 16);
            v29 = &v23[v26];
            *(_OWORD *)v29 = *(_OWORD *)(v24 + v26);
            *((_OWORD *)v29 + 1) = v28;
            v26 += 32;
            v27 -= 8;
          }
          while (v27);
        }
        else
        {
          for (i = 0; i != v6; ++i)
            *(_DWORD *)&v23[4 * i] = *(_DWORD *)(v24 + 4 * i);
        }
        v24 += v19;
        v23 += BytesPerRow;
        ++v22;
      }
      while (v22 != v7);
    }
    else
    {
      v30 = 0;
      v31 = BaseAddress;
      v32 = v17;
      do
      {
        if ((unint64_t)&BaseAddress[BytesPerRow * v30 - v17 - v19 * v30] >= 0x20)
        {
          v34 = 0;
          v35 = v6 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v36 = *(_OWORD *)(v32 + v34 + 16);
            v37 = &v31[v34];
            *(_OWORD *)v37 = *(_OWORD *)(v32 + v34);
            *((_OWORD *)v37 + 1) = v36;
            v34 += 32;
            v35 -= 8;
          }
          while (v35);
          v33 = v6 & 0xFFFFFFFFFFFFFFF8;
        }
        else
        {
          v33 = 0;
        }
        do
        {
          *(_DWORD *)&v31[4 * v33] = *(_DWORD *)(v32 + 4 * v33);
          ++v33;
        }
        while (v6 != v33);
        v32 += v19;
        v31 += BytesPerRow;
        ++v30;
      }
      while (v30 != v7);
    }
  }
  else
  {
    v20 = 0;
    do
    {
      v21 = 0;
      do
      {
        *(_DWORD *)&BaseAddress[4 * v21] = *(_DWORD *)(v17 + 4 * v21);
        ++v21;
      }
      while (v6 != v21);
      v17 += v19;
      BaseAddress += BytesPerRow;
      ++v20;
    }
    while (v20 != v7);
  }
  if (CVPixelBufferUnlockBaseAddress(v14, 0))
  {
    v41 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v41, "Failed to unlock pixel buffer.");
LABEL_41:
    __cxa_throw(v41, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }

  return v14;
}

- (id)hashesFromFingerprintEmbedding:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *__p;
  uint64_t *v24;
  uint64_t v25;

  v4 = a3;
  v5 = (uint64_t *)sub_239FEECB0(v4);
  v6 = *v5;
  __p = 0;
  v24 = 0;
  v25 = 0;
  sub_239FFA010(self->_fingerprinter.__ptr_.__value_, v6, v5[11] * v5[10] * v5[12], (uint64_t)&__p);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = (uint64_t *)__p;
  v11 = v24;
  if (__p != v24)
  {
    do
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v7, *v10, v10[1] - *v10, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v9, v13, (uint64_t)v12, v14, v15);

      v10 += 3;
    }
    while (v10 != v11);
  }
  v16 = (uint64_t *)__p;
  if (__p)
  {
    v17 = v24;
    v18 = __p;
    if (v24 != __p)
    {
      v19 = v24;
      do
      {
        v21 = (void *)*(v19 - 3);
        v19 -= 3;
        v20 = v21;
        if (v21)
        {
          *(v17 - 2) = (uint64_t)v20;
          operator delete(v20);
        }
        v17 = v19;
      }
      while (v19 != v16);
      v18 = __p;
    }
    v24 = v16;
    operator delete(v18);
  }

  return v9;
}

- (id)base64HashesFromFingerprintEmbedding:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  char *v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  void *p_p;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  void *v19;
  char *v20;
  void *v21;
  void *v22;
  void *__p;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;

  v4 = a3;
  v5 = (uint64_t *)sub_239FEECB0(v4);
  v6 = *v5;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  sub_239FFA010(self->_fingerprinter.__ptr_.__value_, v6, v5[11] * v5[10] * v5[12], (uint64_t)&v27);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = (char *)v27;
  v9 = v28;
  if (v27 != v28)
  {
    do
    {
      __p = 0;
      v25 = 0;
      v26 = 0;
      (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *, _QWORD, void **))(*(_QWORD *)self->_fingerprinter.__ptr_.__value_
                                                                                       + 24))(self->_fingerprinter.__ptr_.__value_, *(_QWORD *)v8, &__p);
      if (v26 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      if (v26 >= 0)
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)p_p, HIBYTE(v26), v11);
      else
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v10, (uint64_t)p_p, v25, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v7, v14, (uint64_t)v13, v15, v16);

      if (SHIBYTE(v26) < 0)
        operator delete(__p);
      v8 += 24;
    }
    while (v8 != v9);
  }
  v17 = (char *)v27;
  if (v27)
  {
    v18 = v28;
    v19 = v27;
    if (v28 != v27)
    {
      v20 = v28;
      do
      {
        v22 = (void *)*((_QWORD *)v20 - 3);
        v20 -= 24;
        v21 = v22;
        if (v22)
        {
          *((_QWORD *)v18 - 2) = v21;
          operator delete(v21);
        }
        v18 = v20;
      }
      while (v20 != v17);
      v19 = v27;
    }
    v28 = v17;
    operator delete(v19);
  }

  return v7;
}

- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  std::runtime_error *exception;

  v8 = a3;
  v9 = a4;
  objc_msgSend_sceneTaxonomyWithError_(self->_configuration, v10, (uint64_t)a5, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v25 = 0;
    goto LABEL_9;
  }
  objc_msgSend_entityNetVocabularyName(self->_configuration, v13, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (!v19)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer instance is nil.");
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "The given CSUBuffer is not an instance of CSUEspressoBuffer.");
LABEL_7:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  v24 = (_QWORD *)objc_msgSend_espressoBuffer(v19, v20, v21, v22, v23);

  sub_23A020B0C(v17, v18, v24, v9);
  v25 = 1;
LABEL_9:

  return v25;
}

- (BOOL)enumerateEntityNetClassificationLikelihoods:(id)a3 usingBlock:(id)a4
{
  return objc_msgSend_enumerateEntityNetClassificationLikelihoods_usingBlock_error_(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

- (id)allEntityNetClassificationLikelihoods:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_239FF0D9C;
  v13[3] = &unk_250B0DF68;
  v14 = v7;
  v8 = v7;
  if (objc_msgSend_enumerateEntityNetClassificationLikelihoods_usingBlock_error_(self, v9, (uint64_t)v6, (uint64_t)v13, (uint64_t)a4))v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)allEntityNetClassificationLikelihoods:(id)a3
{
  uint64_t v3;

  objc_msgSend_allEntityNetClassificationLikelihoods_error_(self, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_unsafeRunOnInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char Resources;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  EspressoNet *value;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  CSUSceneNetV5NetworkOutput *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void (**v92)(id, void *, _QWORD);
  _QWORD v93[2];
  void *__p;
  void *v95;
  std::__shared_weak_count *v96;
  const char *v97;
  _OWORD v98[2];
  int v99;
  _BYTE v100[40];
  id v101;
  __int128 v102;
  char v103;
  uint64_t (**v104)();
  void *v105;
  void *v106;
  std::__shared_weak_count *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v92 = (void (**)(id, void *, _QWORD))a4;
  v101 = 0;
  Resources = objc_msgSend_loadResources_(self, v6, (uint64_t)&v101, v7, v8);
  v10 = v101;
  v15 = v10;
  if ((Resources & 1) != 0)
  {
    v86 = v10;
    value = self->_net.__ptr_.__value_;
    objc_msgSend_inputImageTensorName(self->_configuration, v11, v12, v13, v14);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v97 = (const char *)objc_msgSend_UTF8String(v17, v18, v19, v20, v21);
    sub_239FF5760((uint64_t)v93, a3);
    sub_239FF6364((uint64_t)&v102, &v97, (uint64_t)v93);
    memset(v98, 0, sizeof(v98));
    v99 = 1065353216;
    sub_239FF6528((uint64_t)v98, (uint64_t)&v102, &v102);
    sub_239FF1424((uint64_t)value, (uint64_t)v98, (uint64_t)v100);
    sub_239FF5234((uint64_t)v98);
    v104 = &off_250B0DCE8;
    v22 = v107;
    if (v107)
    {
      p_shared_owners = (unint64_t *)&v107->__shared_owners_;
      do
        v24 = __ldaxr(p_shared_owners);
      while (__stlxr(v24 - 1, p_shared_owners));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    if (v105)
    {
      v106 = v105;
      operator delete(v105);
    }
    if (v103 < 0)
      operator delete((void *)v102);
    v93[0] = &off_250B0DCE8;
    v25 = v96;
    if (v96)
    {
      v26 = (unint64_t *)&v96->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    if (__p)
    {
      v95 = __p;
      operator delete(__p);
    }

    *(_QWORD *)&v102 = v100;
    v28 = [CSUSceneNetV5NetworkOutput alloc];
    objc_msgSend_scenePrintTensorName(self->_configuration, v29, v30, v31, v32);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v85);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sceneClassificationTensorName(self->_configuration, v33, v34, v35, v36);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v84);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_aestheticsAttributesTensorName(self->_configuration, v37, v38, v39, v40);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v83);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_aestheticsGlobalScoresTensorName(self->_configuration, v41, v42, v43, v44);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v82);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_detectionScoreHeatMapName(self->_configuration, v45, v46, v47, v48);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v81);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_detectionCoordinateOffsetMapName(self->_configuration, v49, v50, v51, v52);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v80);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_saliencyAttentionTensorName(self->_configuration, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_saliencyObjectnessTensorName(self->_configuration, v60, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fingerprintEmbeddingTensorName(self->_configuration, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entityNetClassificationTensorName(self->_configuration, v72, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    sub_239FF162C((_QWORD **)&v102, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend_initWithScenePrint_sceneClassificationLikelihoods_aestheticsAttributeScores_aestheticsGlobalScores_detectionScoreHeatMap_detectionCoordinateOffsetMap_saliencyAttentionMap_saliencyObjectnessMap_fingerprintEmbedding_entityNetClassificationLikelihoods_(v28, v78, (uint64_t)v91, (uint64_t)v90, (uint64_t)v89, v88, v87, v53, v59, v65, v71, v77);

    ((void (**)(id, void *, id))v92)[2](v92, v79, v86);
    sub_239FF5234((uint64_t)v100);
    v15 = v86;
  }
  else
  {
    ((void (**)(id, void *, id))v92)[2](v92, 0, v10);
  }

}

- (CSUSceneNetV5Configuration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  ImageDescriptorProcessorHyperplaneLSH *value;
  ObjectDetectionConfiguration *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  PixelBufferTransfer *v8;
  CFTypeRef *v9;
  EspressoNet *v10;

  objc_storeStrong((id *)&self->_configuration, 0);
  value = self->_fingerprinter.__ptr_.__value_;
  self->_fingerprinter.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ImageDescriptorProcessorHyperplaneLSH *))(*(_QWORD *)value + 8))(value);
  v4 = self->_objectDetectionConfiguration.__ptr_.__value_;
  self->_objectDetectionConfiguration.__ptr_.__value_ = 0;
  if (v4)
  {

    v5 = (_QWORD *)*((_QWORD *)v4 + 5);
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    v7 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = 0;
    if (v7)
      operator delete(v7);
    MEMORY[0x23B83FE88](v4, 0x10A0C4038C3C9F3);
  }
  v8 = self->_transferSession.__ptr_.__value_;
  self->_transferSession.__ptr_.__value_ = 0;
  if (v8)
  {
    v9 = *(CFTypeRef **)v8;
    *(_QWORD *)v8 = 0;
    if (v9)
    {
      if (*v9)
        CFRelease(*v9);
      MEMORY[0x23B83FE88](v9, 0x20C4093837F09);
    }
    MEMORY[0x23B83FE88](v8, 0x20C4093837F09);
  }
  v10 = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (v10)
    (*(void (**)(EspressoNet *))(*(_QWORD *)v10 + 8))(v10);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
