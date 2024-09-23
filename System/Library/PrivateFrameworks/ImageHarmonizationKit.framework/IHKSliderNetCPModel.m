@implementation IHKSliderNetCPModel

- (unint64_t)product:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v3);
        v11 *= objc_msgSend_unsignedIntValue(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i), v5, v6, v7, v8, (_QWORD)v14);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)loadJSonFrom:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  id v17;
  id v18;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v18 = 0;
  v6 = (void *)objc_msgSend_initWithContentsOfFile_encoding_error_(v4, v5, (uint64_t)v3, 4, (uint64_t)&v18);
  v7 = v18;
  v11 = v7;
  if (v7)
    NSLog(CFSTR("Error: %@"), v7);
  objc_msgSend_dataUsingEncoding_(v6, v8, 4, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v13, (uint64_t)v12, 0, (uint64_t)&v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;

  if (v15)
    NSLog(CFSTR("Error: %@"), v15);

  return v14;
}

- (CGColorSpace)extractColorSpaceFromInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  CFStringRef *v24;
  CGColorSpace *v25;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("colorspace"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_info(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("colorspace"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v17, v18, (uint64_t)CFSTR("sRGB"), v19, v20) & 1) != 0)
    {
      v24 = (CFStringRef *)MEMORY[0x24BDBF318];
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v17, v21, (uint64_t)CFSTR("P3"), v22, v23))
      {
        NSLog(CFSTR("Unrecognized color space: %@"), v17);
        v25 = 0;
        goto LABEL_9;
      }
      v24 = (CFStringRef *)MEMORY[0x24BDBF228];
    }
    v25 = CGColorSpaceCreateWithName(*v24);
LABEL_9:

    goto LABEL_10;
  }
  v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
LABEL_10:

  return v25;
}

- (IHKSliderNetCPModel)initWithModel:(id)a3
{
  return (IHKSliderNetCPModel *)objc_msgSend_initWithModel_options_error_(self, a2, (uint64_t)a3, 0, 0);
}

- (IHKSliderNetCPModel)initWithModel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  IHKSliderNetCPModel *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  IHKSliderNetCPModel *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)IHKSliderNetCPModel;
  v7 = -[IHKSliderNetCPModel init](&v29, sel_init);
  v11 = v7;
  if (v7)
  {
    objc_msgSend_setGatingMethod_(v7, v8, 0, v9, v10);
    if (v6)
    {
      objc_msgSend_objectForKeyedSubscript_(v6, v12, (uint64_t)CFSTR("slidernet_gating_method"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend_objectForKeyedSubscript_(v6, v16, (uint64_t)CFSTR("slidernet_gating_method"), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend_unsignedIntValue(v19, v20, v21, v22, v23);
        objc_msgSend_setGatingMethod_(v11, v25, v24, v26, v27);

      }
    }
  }

  return v11;
}

- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3
{
  return (IHKSliderNetCPModel *)MEMORY[0x24BEDD108](self, sel_initWithModelType_options_error_, a3, 0, 0);
}

- (IHKSliderNetCPModel)initWithModelType:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  void *v18;
  IHKSliderNetCPModel *v19;

  v8 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      v19 = 0;
      goto LABEL_10;
    }
    v9 = CFSTR("SliderNetCP_ColorBalance_Exposure_v2.1.1");
  }
  else
  {
    v9 = CFSTR("SliderNetCP_TempTint_Exposure_v2.0.1");
  }
  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_inDirectory_(v15, v16, (uint64_t)v9, (uint64_t)CFSTR("slidernetmodel"), (uint64_t)CFSTR("Models"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend_loadModelAtPath_options_error_(IHKSliderNetCPModel, v17, (uint64_t)v18, (uint64_t)v8, (uint64_t)a5);
    v19 = (IHKSliderNetCPModel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

LABEL_10:
  return v19;
}

- (BOOL)useClipEmbedding
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_gatingMethod(self, a2, v2, v3, v4);
  if (v6 != 1)
    LOBYTE(v6) = objc_msgSend_gatingMethod(self, v7, v8, v9, v10) == 2;
  return v6;
}

- (id)computeClipEmbeddingForImage:(__CVBuffer *)a3 error:(id *)a4
{
  void *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  Class (*v51)(uint64_t);
  void *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  v55 = &v54;
  v56 = 0x2050000000;
  v6 = (void *)qword_256DCCB60;
  v57 = qword_256DCCB60;
  if (!qword_256DCCB60)
  {
    v49 = MEMORY[0x24BDAC760];
    v50 = 3221225472;
    v51 = sub_23ECBCD98;
    v52 = &unk_250F5D8B0;
    v53 = &v54;
    sub_23ECBCD98((uint64_t)&v49);
    v6 = (void *)v55[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v54, 8);
  v8 = objc_alloc_init(v7);
  if ((objc_msgSend_setRevision_error_(v8, v9, 3737841671, (uint64_t)a4, v10) & 1) != 0)
  {
    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v11 = (void *)qword_256DCCB70;
    v57 = qword_256DCCB70;
    if (!qword_256DCCB70)
    {
      v49 = MEMORY[0x24BDAC760];
      v50 = 3221225472;
      v51 = sub_23ECBCE8C;
      v52 = &unk_250F5D8B0;
      v53 = &v54;
      sub_23ECBCE8C((uint64_t)&v49);
      v11 = (void *)v55[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v54, 8);
    v13 = [v12 alloc];
    v16 = (void *)objc_msgSend_initWithCVPixelBuffer_options_(v13, v14, (uint64_t)a3, MEMORY[0x24BDBD1B8], v15);
    v58[0] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v17, (uint64_t)v58, 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_performRequests_error_(v16, v20, (uint64_t)v19, (uint64_t)a4, v21);

    if ((v22 & 1) != 0)
    {
      objc_msgSend_results(v8, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v27, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_sceneprints(v32, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_descriptorData(v42, v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v47 = 0;
    }

  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)objc_msgSend_predictStyleVectorForPixelBuffer_scenePrint_error_(self, a2, (uint64_t)a3, 0, (uint64_t)a4);
}

- (id)predictStyleVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  IHKFeatureVector *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  IHKFeatureVector *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    if (v8)
    {
      v15 = [IHKFeatureVector alloc];
      v19 = (void *)objc_msgSend_initWithData_(v15, v16, (uint64_t)v8, v17, v18);

      return v19;
    }
    else
    {
      objc_msgSend_computeClipEmbeddingForImage_error_(self, v13, (uint64_t)a3, (uint64_t)a5, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 && *a5)
      {
        v22 = 0;
      }
      else
      {
        v23 = [IHKFeatureVector alloc];
        v22 = (void *)objc_msgSend_initWithData_(v23, v24, (uint64_t)v21, v25, v26);
      }

      return v22;
    }
  }
  else
  {

    return 0;
  }
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_predictContentVectorForPixelBuffer_scenePrint_error_, a3, 0, a4);
}

- (id)predictContentVectorForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  IHKFeatureVector *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  IHKFeatureVector *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a4;
  if (objc_msgSend_useClipEmbedding(self, v9, v10, v11, v12))
  {
    if (v8)
    {
      v15 = [IHKFeatureVector alloc];
      v19 = (void *)objc_msgSend_initWithData_(v15, v16, (uint64_t)v8, v17, v18);

      return v19;
    }
    else
    {
      objc_msgSend_computeClipEmbeddingForImage_error_(self, v13, (uint64_t)a3, (uint64_t)a5, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 && *a5)
      {
        v22 = 0;
      }
      else
      {
        v23 = [IHKFeatureVector alloc];
        v22 = (void *)objc_msgSend_initWithData_(v23, v24, (uint64_t)v21, v25, v26);
      }

      return v22;
    }
  }
  else
  {

    return 0;
  }
}

- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4
{
  float result;

  MEMORY[0x24BEDD108](self, sel_gatingScoreForStyleVector_contentVector_error_, a3, a4, 0);
  return result;
}

- (float)gatingScoreForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  float v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  float v52;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend_gatingMethod(self, v9, v10, v11, v12) && objc_msgSend_gatingMethod(self, v13, v14, v15, v16) != 2)
  {
    v29 = 0.0;
    if (objc_msgSend_gatingMethod(self, v13, v17, v15, v16) == 1)
    {
      objc_msgSend_subFeatureVectorWithRange_(v7, v33, 0, 768, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subFeatureVectorWithRange_(v8, v36, 0, 768, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cosineSimilarity_(v35, v39, (uint64_t)v38, v40, v41);
      v43 = v42;
      objc_msgSend_cosineSimilarity_(v35, v44, (uint64_t)v35, v45, v46);
      v48 = v47;
      objc_msgSend_cosineSimilarity_(v38, v49, (uint64_t)v38, v50, v51);
      v29 = (float)(v43 / (float)(v48 + 1.0e-10)) / (float)(v52 + 1.0e-10);

    }
  }
  else
  {
    objc_msgSend_cosineSimilarity_(v7, v13, (uint64_t)v8, v15, v16);
    v19 = v18;
    objc_msgSend_cosineSimilarity_(v7, v20, (uint64_t)v7, v21, v22);
    v24 = v23;
    objc_msgSend_cosineSimilarity_(v8, v25, (uint64_t)v8, v26, v27);
    v29 = (float)(v19 / (float)(v24 + 1.0e-10)) / (float)(v28 + 1.0e-10);
  }
  v30 = (float)(v29 * 0.5) + 0.5;
  if (v30 > 1.0)
    v30 = 1.0;
  if (v30 >= 0.0)
    v31 = v30;
  else
    v31 = 0.0;

  return v31;
}

- (id)predictSlidersForStyleVector:(id)a3 contentVector:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("The method %s must be overridden in a subclass/category"), v9, v10, "-[IHKSliderNetCPModel predictSlidersForStyleVector:contentVector:error:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithCode_message_(IHKError, v12, 1, (uint64_t)v11, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_predictStylePrintForPixelBuffer_scenePrint_error_, a3, 0, a4);
}

- (id)predictStylePrintForPixelBuffer:(__CVBuffer *)a3 scenePrint:(id)a4 error:(id *)a5
{
  objc_msgSend_predictStyleVectorForPixelBuffer_scenePrint_error_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (float)gatingScoreToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  float result;

  MEMORY[0x24BEDD108](self, sel_gatingScoreForStyleVector_contentVector_error_, a4, a3, a5);
  return result;
}

- (id)predictSlidersToTransferStyleFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  objc_msgSend_predictSlidersForStyleVector_contentVector_error_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (shared_ptr<ik::PixelBufferTransfer>)resampler
{
  PixelBufferTransfer **v2;
  IHKSliderNetCPModel *v3;
  PixelBufferTransfer **v4;
  __shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  VTPixelTransferSessionRef **v8;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v11;
  shared_ptr<ik::PixelBufferTransfer> result;

  v3 = self;
  v4 = v2;
  if (!self->_resampler.__ptr_)
  {
    v8 = (VTPixelTransferSessionRef **)operator new();
    sub_23ECBCF80(v8);
    self = (IHKSliderNetCPModel *)operator new();
    self->super.isa = (Class)&off_250F5D8F8;
    self->_resampler.__ptr_ = 0;
    self->_resampler.__cntrl_ = 0;
    self->_colorSpace = (CGColorSpace *)v8;
    cntrl = (std::__shared_weak_count *)v3->_resampler.__cntrl_;
    v3->_resampler.__ptr_ = (PixelBufferTransfer *)v8;
    v3->_resampler.__cntrl_ = (__shared_weak_count *)self;
    if (cntrl)
    {
      p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  v5 = v3->_resampler.__cntrl_;
  *v4 = v3->_resampler.__ptr_;
  v4[1] = (PixelBufferTransfer *)v5;
  if (v5)
  {
    v6 = (unint64_t *)((char *)v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PixelBufferTransfer *)self;
  return result;
}

- (PixelBufferTensor)preprocessTensor:(SEL)a3
{
  VTPixelTransferSessionRef *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  std::runtime_error *exception;
  _QWORD v22[2];
  int v23;
  char v24;
  char v25;
  char v26;
  VTPixelTransferSessionRef *v27;

  v7 = (VTPixelTransferSessionRef *)operator new();
  *v7 = 0;
  v8 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
  sub_23ECBD058(v8, "Session Creation");
  if (!*v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PixelBufferTransfer internal inconsistency: null session.");
    __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
  }
  v27 = v7;
  objc_msgSend_imageSize(self, v9, v10, v11, v12);
  objc_msgSend_imageSize(self, v14, v15, v16, v17, (unint64_t)v13);
  v22[1] = (unint64_t)v18;
  v23 = 1111970369;
  v24 = 1;
  v25 = 0;
  v26 = 0;
  sub_23ECBC5D4((uint64_t)retstr, (uint64_t)v22);
  v19 = VTPixelTransferSessionTransferImage(*v7, *((CVPixelBufferRef *)a4->storage_.__ptr_ + 1), *((CVPixelBufferRef *)retstr->storage_.__ptr_ + 1));
  sub_23ECBD058(v19, "Image Transfer");
  v27 = 0;
  if (*v7)
    CFRelease(*v7);
  return (PixelBufferTensor *)MEMORY[0x24265E1B4](v7, 0x20C4093837F09);
}

- (BOOL)checkColorspaceForPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  CGColorSpace *ColorSpace;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGColorSpace *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char isEqualToString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  char v22;
  void *v23;
  const char *v24;
  uint64_t v25;

  ColorSpace = CVImageBufferGetColorSpace(a3);
  CGColorSpaceGetName(ColorSpace);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (CGColorSpace *)objc_msgSend_colorSpace(self, v8, v9, v10, v11);
  CGColorSpaceGetName(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v7, v15, v16);
  v21 = isEqualToString;
  if (a4)
    v22 = isEqualToString;
  else
    v22 = 1;
  if ((v22 & 1) == 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("Buffer color space is %@, while network expects %@."), v19, v20, v7, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithCode_message_(IHKError, v24, 3, (uint64_t)v23, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (BOOL)pixelBufferShapesMatchRequirement:(__CVBuffer *)a3
{
  size_t Width;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  size_t Height;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  Width = CVPixelBufferGetWidth(a3);
  objc_msgSend_imageSize(self, v6, v7, v8, v9);
  if (Width != (unint64_t)v10)
    return 0;
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend_imageSize(self, v12, v13, v14, v15);
  return Height == (unint64_t)v16;
}

- (__CVBuffer)preprocessPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v4;
  __CVBuffer *v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  if (!objc_msgSend_checkColorspaceForPixelBuffer_error_(self, a2, (uint64_t)a3, (uint64_t)a4, v4))
    return 0;
  if ((objc_msgSend_pixelBufferShapesMatchRequirement_(self, v7, (uint64_t)v5, v8, v9) & 1) == 0)
  {
    objc_msgSend_imageSize(self, v10, v11, v12, v13);
    return (__CVBuffer *)MEMORY[0x24BEDD108](self, sel_resizePixelBuffer_targetSize_, v5, v14, v15);
  }
  return v5;
}

- (__CVBuffer)resizePixelBuffer:(__CVBuffer *)a3 targetSize:(CGSize)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  const __CFString *v14;
  CFTypeRef v15;
  CVAttachmentMode attachmentMode[2];
  std::__shared_weak_count *v18;
  CVPixelBufferRef pixelBufferOut;

  pixelBufferOut = 0;
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)a4.width, (unint64_t)a4.height, 0x42475241u, 0, &pixelBufferOut);
  objc_msgSend_resampler(self, v6, v7, v8, v9);
  v10 = VTPixelTransferSessionTransferImage(***(VTPixelTransferSessionRef ***)attachmentMode, a3, pixelBufferOut);
  sub_23ECBD058(v10, "Image Transfer");
  v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  attachmentMode[0] = kCVAttachmentMode_ShouldPropagate;
  v14 = (const __CFString *)*MEMORY[0x24BDC5410];
  v15 = CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x24BDC5410], attachmentMode);
  CVBufferSetAttachment(pixelBufferOut, v14, v15, kCVAttachmentMode_ShouldNotPropagate);
  return pixelBufferOut;
}

- (id)applyAdjustments:(id)a3 toCIImage:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("The method %s must be overridden in a subclass/category"), v9, v10, "-[IHKSliderNetCPModel applyAdjustments:toCIImage:error:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithCode_message_(IHKError, v12, 1, (uint64_t)v11, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v14);
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (NSArray)sliderOrder
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)sliderSpecs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (IHKFilterSequence)filterSequence
{
  return (IHKFilterSequence *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)gatingMethod
{
  return self->_gatingMethod;
}

- (void)setGatingMethod:(unint64_t)a3
{
  self->_gatingMethod = a3;
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_filterSequence, 0);
  objc_storeStrong((id *)&self->_sliderSpecs, 0);
  objc_storeStrong((id *)&self->_sliderOrder, 0);
  cntrl = self->_resampler.__cntrl_;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)loadModelAtPath:(id)a3
{
  objc_msgSend_loadModelAtPath_options_error_(IHKSliderNetCPModel, a2, (uint64_t)a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadModelAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __objc2_class **v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  void *v36;
  void *v38;
  const char *v39;
  uint64_t v40;

  v7 = a3;
  v8 = a4;
  objc_msgSend_stringByAppendingPathComponent_(v7, v9, (uint64_t)CFSTR("net_info.json"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loadJSonFrom_(IHKSliderNetCPModel, v13, (uint64_t)v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)CFSTR("network_type"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v20, v21, (uint64_t)CFSTR("copy_paste_edit_3way_v1"), v22, v23) & 1) != 0)
  {
    v27 = off_250F5CD60;
LABEL_6:
    v34 = objc_alloc(*v27);
    v36 = (void *)objc_msgSend_initWithModel_options_error_(v34, v35, (uint64_t)v7, (uint64_t)v8, (uint64_t)a5);
    goto LABEL_7;
  }
  if ((objc_msgSend_isEqualToString_(v20, v24, (uint64_t)CFSTR("copy_paste_edit_3way_v2"), v25, v26) & 1) != 0
    || objc_msgSend_isEqualToString_(v20, v28, (uint64_t)CFSTR("copy_paste_edit_3way_v2.1"), v29, v30))
  {
    v27 = &off_250F5CD68;
    goto LABEL_6;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, (uint64_t)CFSTR("Unknown network type: %@"), v32, v33, v20);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v38);
  if (a5)
  {
    objc_msgSend_errorWithCode_message_(IHKError, v39, 8, (uint64_t)v38, v40);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v36 = 0;
LABEL_7:

  return v36;
}

@end
