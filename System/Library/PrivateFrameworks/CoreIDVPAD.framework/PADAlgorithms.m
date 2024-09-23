@implementation PADAlgorithms

- (PADAlgorithms)initWithPADModelConfiguration:(id)a3
{
  id v4;
  PADAlgorithms *v5;
  id v6;
  char *v7;
  LivenessCheck_Options *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v80;
  const LivenessCheck_Options *ptr;
  _QWORD *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  PADAlgorithms *v87;
  NSObject *v89;
  objc_super v90;

  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)PADAlgorithms;
  v5 = -[PADAlgorithms init](&v90, sel_init);

  if (!v5)
    goto LABEL_64;
  v6 = v4;
  v7 = (char *)operator new(0x88uLL);
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &unk_24D0CF2A8;
  *((_QWORD *)v7 + 1) = 0;
  *(_OWORD *)(v7 + 24) = xmmword_213C14140;
  v8 = (LivenessCheck_Options *)(v7 + 24);
  *(_OWORD *)(v7 + 40) = xmmword_213C14150;
  *((_DWORD *)v7 + 14) = 1043730740;
  *(_OWORD *)(v7 + 60) = xmmword_213C14160;
  *((_DWORD *)v7 + 19) = 10;
  *((_OWORD *)v7 + 5) = xmmword_213C14170;
  *((_OWORD *)v7 + 6) = xmmword_213C14180;
  *((_QWORD *)v7 + 14) = 0x3E19999A3E99999ALL;
  *(_OWORD *)(v7 + 120) = xmmword_213C14190;
  objc_msgSend(v6, "objectForKey:", CFSTR("leftPoseDegree"), v7 + 24, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("leftPoseDegree"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)v8 = v11;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("rightPoseDegree"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("rightPoseDegree"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    *((_DWORD *)v7 + 7) = v14;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("upPoseDegree"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("upPoseDegree"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    *((_DWORD *)v7 + 8) = v17;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("downPoseDegree"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("downPoseDegree"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    *((_DWORD *)v7 + 9) = v20;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("eyebrowRatio"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("eyebrowRatio"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    *((_DWORD *)v7 + 12) = v23;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("mouthRatio"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("mouthRatio"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    *((_DWORD *)v7 + 14) = v26;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("eyeRatio"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("eyeRatio"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    *((_DWORD *)v7 + 13) = v29;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("consecutiveFrame"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("consecutiveFrame"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 15) = objc_msgSend(v31, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("eyeConsecutiveFrame"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("eyeConsecutiveFrame"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 16) = objc_msgSend(v33, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bufferFAC"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("bufferFAC"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 17) = objc_msgSend(v35, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bufferFACEye"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("bufferFACEye"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 18) = objc_msgSend(v37, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("secDiffTAThreshold"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("secDiffTAThreshold"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "floatValue");
    *((_DWORD *)v7 + 20) = v40;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("bufferTA"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("bufferTA"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 19) = objc_msgSend(v42, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("prdThresholdFake"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("prdThresholdFake"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "floatValue");
    *((_DWORD *)v7 + 23) = v45;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("prdFrameThresholdFake"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("prdFrameThresholdFake"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "floatValue");
    *((_DWORD *)v7 + 24) = v48;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("prdThresholdLive"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("prdThresholdLive"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "floatValue");
    *((_DWORD *)v7 + 25) = v51;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("prdFrameThresholdLive"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("prdFrameThresholdLive"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "floatValue");
    *((_DWORD *)v7 + 26) = v54;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("facThreshold"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("facThreshold"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "floatValue");
    *((_DWORD *)v7 + 21) = v57;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("taThreshold"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("taThreshold"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "floatValue");
    *((_DWORD *)v7 + 22) = v60;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("idThreshold"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("idThreshold"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "floatValue");
    *((_DWORD *)v7 + 27) = v63;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorImageHeight"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorImageHeight"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 30) = objc_msgSend(v65, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorImageWidth"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorImageWidth"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 31) = objc_msgSend(v67, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorNccThreshold"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorNccThreshold"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "floatValue");
    *((_DWORD *)v7 + 28) = v70;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorNccThreshold2"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorNccThreshold2"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "floatValue");
    *((_DWORD *)v7 + 29) = v73;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorZonesH"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorZonesH"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 32) = objc_msgSend(v75, "intValue");

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorZonesW"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("stitchDetectorZonesW"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)v7 + 33) = objc_msgSend(v77, "intValue");

  }
  cntrl = (std::__shared_weak_count *)v5->_config.__cntrl_;
  v5->_config.__ptr_ = v8;
  v5->_config.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v80 = __ldaxr(p_shared_owners);
    while (__stlxr(v80 - 1, p_shared_owners));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  ptr = v5->_config.__ptr_;
  v82 = operator new(0x230uLL);
  v82[2] = 0;
  *v82 = &unk_24D0CF2F8;
  v82[1] = 0;
  v83 = vision::mod::LivenessCheckPredictor::LivenessCheckPredictor((vision::mod::LivenessCheckPredictor *)(v82 + 3), ptr);
  v84 = (std::__shared_weak_count *)v5->_predictor.__cntrl_;
  v5->_predictor.__ptr_ = (LivenessCheckPredictor *)v83;
  v5->_predictor.__cntrl_ = (__shared_weak_count *)v82;
  if (!v84)
    goto LABEL_64;
  v85 = (unint64_t *)&v84->__shared_owners_;
  do
    v86 = __ldaxr(v85);
  while (__stlxr(v86 - 1, v85));
  if (v86)
  {
    if (v5->_predictor.__ptr_)
    {
LABEL_64:
      v87 = v5;
      goto LABEL_65;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
    std::__shared_weak_count::__release_weak(v84);
    if (v5->_predictor.__ptr_)
      goto LABEL_64;
  }
  v89 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
    -[PADAlgorithms initWithPADModelConfiguration:].cold.1(v89);

  v87 = 0;
LABEL_65:

  return v87;
}

- (id)getFACVersion
{
  return CFSTR("8.0");
}

- (unint64_t)requiredObservationSetSizeFAC:(int64_t)a3
{
  if (a3 == 9 || a3 == 4)
    return *((int *)self->_config.__ptr_ + 12);
  else
    return *((int *)self->_config.__ptr_ + 11);
}

- (id)processFacePoseInput:(id)a3 gesture:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  int v11;
  char *v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  LivenessCheckPredictor *ptr;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  PADAlgorithmFACResult *v45;
  void *v46;
  char *v47;
  char *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  __int128 v54;
  uint64_t v55;
  void *__p;
  char *v57;
  uint64_t v58;
  void *v59;
  char *v60;
  uint64_t v61;
  void *v62;
  char *v63;
  uint64_t v64;
  void *v65;
  char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "facePoseValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = LivenessActionFromGesture(a4);
  v68 = 0;
  v69 = 0;
  v70 = 0;
  v65 = 0;
  v66 = 0;
  v67 = 0;
  v62 = 0;
  v63 = 0;
  v64 = 0;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  __p = 0;
  v57 = 0;
  v58 = 0;
  if (v10)
  {
    std::vector<float>::__append((uint64_t)&v68, v10);
    v12 = (char *)v65;
    v13 = (v66 - (_BYTE *)v65) >> 2;
    v14 = v10 >= v13;
    if (v10 > v13)
    {
      std::vector<float>::__append((uint64_t)&v65, v10 - v13);
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
    v14 = 1;
  }
  if (!v14)
    v66 = &v12[4 * v10];
LABEL_7:
  v15 = (v63 - (_BYTE *)v62) >> 2;
  if (v10 <= v15)
  {
    if (v10 < v15)
      v63 = (char *)v62 + 4 * v10;
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v62, v10 - v15);
  }
  v16 = (v60 - (_BYTE *)v59) >> 2;
  if (v10 <= v16)
  {
    if (v10 < v16)
      v60 = (char *)v59 + 4 * v10;
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v59, v10 - v16);
  }
  v17 = v57;
  v18 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (_BYTE *)__p) >> 3);
  if (v10 > v18)
  {
    std::vector<std::vector<float>>::__append((uint64_t)&__p, v10 - v18);
LABEL_25:
    v23 = 0;
    v24 = 0;
    do
    {
      objc_msgSend(v8, "facePoseValues");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "roll");
      *(float *)&v27 = v27;
      *((_DWORD *)v62 + v24) = LODWORD(v27);
      objc_msgSend(v26, "pitch");
      *(float *)&v28 = v28;
      *((_DWORD *)v65 + v24) = LODWORD(v28);
      objc_msgSend(v26, "yaw");
      *(float *)&v29 = v29;
      *((_DWORD *)v59 + v24) = LODWORD(v29);
      objc_msgSend(v26, "smile");
      *(float *)&v30 = v30;
      *((_DWORD *)v68 + v24) = LODWORD(v30);
      objc_msgSend(v26, "roll");
      if (fabs(v31) < 20.0)
      {
        objc_msgSend(v26, "pitch");
        if (fabs(v32) < 20.0)
          objc_msgSend(v26, "yaw");
      }
      objc_msgSend(v26, "landmarks");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33 == 0;

      if (v34)
      {
        v38 = (char *)__p + v23;
        v39 = *(void **)((char *)__p + v23);
        if (v39)
        {
          v38[1] = v39;
          operator delete(v39);
          *v38 = 0;
          v38[1] = 0;
          v38[2] = 0;
        }
        *v38 = 0;
        v38[1] = 0;
        v38[2] = 0;
      }
      else
      {
        objc_msgSend(v26, "landmarks");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        NSArrayAsVector(&v54, v35);
        v36 = (char *)__p + v23;
        v37 = *(void **)((char *)__p + v23);
        if (v37)
        {
          v36[1] = v37;
          operator delete(v37);
          *v36 = 0;
          v36[1] = 0;
          v36[2] = 0;
        }
        *(_OWORD *)v36 = v54;
        v36[2] = v55;
        v54 = 0uLL;
        v55 = 0;

      }
      ++v24;
      v23 += 24;
    }
    while (v10 != v24);
    goto LABEL_37;
  }
  if (v10 < v18)
  {
    v19 = (char *)__p + 24 * v10;
    if (v57 != v19)
    {
      v20 = v57;
      do
      {
        v22 = (void *)*((_QWORD *)v20 - 3);
        v20 -= 24;
        v21 = v22;
        if (v22)
        {
          *((_QWORD *)v17 - 2) = v21;
          operator delete(v21);
        }
        v17 = v20;
      }
      while (v20 != v19);
    }
    v57 = v19;
  }
  if (v10)
    goto LABEL_25;
LABEL_37:
  ptr = self->_predictor.__ptr_;
  LODWORD(v54) = v11;
  v41 = vision::mod::LivenessCheckPredictor::processFacePoseData((uint64_t)ptr, (uint64_t)&v68, (uint64_t *)&v65, &v59, &v62, &__p, (int *)&v54);
  if ((_DWORD)v41)
  {
    if (!a5)
    {
      v45 = 0;
      v47 = (char *)__p;
      if (!__p)
        goto LABEL_49;
      goto LABEL_42;
    }
    v42 = (void *)MEMORY[0x24BDD1540];
    v71 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FAC classifier failed with status: %d"), v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v44);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v45 = 0;
  }
  else
  {
    v45 = objc_alloc_init(PADAlgorithmFACResult);
    -[PADAlgorithms _retrieveFaceprintsFromPredictorUsingFACInput:](self, "_retrieveFaceprintsFromPredictorUsingFACInput:", v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PADAlgorithmFACResult setFaceprints:](v45, "setFaceprints:", v46);

    -[PADAlgorithms _retrieveReferenceFramesFromPredictor](self, "_retrieveReferenceFramesFromPredictor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PADAlgorithmFACResult setReferenceFrameIndices:](v45, "setReferenceFrameIndices:", v43);
  }

  v47 = (char *)__p;
  if (!__p)
    goto LABEL_49;
LABEL_42:
  v48 = v57;
  v49 = v47;
  if (v57 != v47)
  {
    v50 = v57;
    do
    {
      v52 = (void *)*((_QWORD *)v50 - 3);
      v50 -= 24;
      v51 = v52;
      if (v52)
      {
        *((_QWORD *)v48 - 2) = v51;
        operator delete(v51);
      }
      v48 = v50;
    }
    while (v50 != v47);
    v49 = __p;
  }
  v57 = v47;
  operator delete(v49);
LABEL_49:
  if (v59)
  {
    v60 = (char *)v59;
    operator delete(v59);
  }
  if (v62)
  {
    v63 = (char *)v62;
    operator delete(v62);
  }
  if (v65)
  {
    v66 = (char *)v65;
    operator delete(v65);
  }
  if (v68)
  {
    v69 = v68;
    operator delete(v68);
  }

  return v45;
}

- (id)performFAC:(id)a3 gesture:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PADAlgorithmFACResult *v14;
  int v15;
  char *v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  unint64_t v22;
  char *v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  BOOL v40;
  void *v41;
  _QWORD *v42;
  void *v43;
  _QWORD *v44;
  void *v45;
  LivenessCheckPredictor *ptr;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char *v53;
  char *v54;
  void *v55;
  char *v56;
  void *v57;
  void *v58;
  __int128 v61;
  uint64_t v62;
  void *__p;
  char *v64;
  uint64_t v65;
  void *v66;
  char *v67;
  uint64_t v68;
  void *v69;
  char *v70;
  uint64_t v71;
  void *v72;
  char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  _QWORD v81[3];

  v81[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "facePoseValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = -[PADAlgorithms requiredObservationSetSizeFAC:](self, "requiredObservationSetSizeFAC:", a4);
  if (v9 < v10)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v80 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Insufficient observations: %d. Expected at least: %d"), v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, &v80, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = 0;
    goto LABEL_65;
  }
  v15 = LivenessActionFromGesture(a4);
  v75 = 0;
  v76 = 0;
  v77 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  __p = 0;
  v64 = 0;
  v65 = 0;
  if (v9)
  {
    std::vector<float>::__append((uint64_t)&v75, v9);
    v16 = (char *)v72;
    v17 = (v73 - (_BYTE *)v72) >> 2;
    v18 = v9 >= v17;
    if (v9 > v17)
    {
      std::vector<float>::__append((uint64_t)&v72, v9 - v17);
      goto LABEL_11;
    }
  }
  else
  {
    v16 = 0;
    v18 = 1;
  }
  if (!v18)
    v73 = &v16[4 * v9];
LABEL_11:
  v19 = (v70 - (_BYTE *)v69) >> 2;
  if (v9 <= v19)
  {
    if (v9 < v19)
      v70 = (char *)v69 + 4 * v9;
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v69, v9 - v19);
  }
  v20 = (v67 - (_BYTE *)v66) >> 2;
  if (v9 <= v20)
  {
    if (v9 < v20)
      v67 = (char *)v66 + 4 * v9;
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v66, v9 - v20);
  }
  v21 = v64;
  v22 = 0xAAAAAAAAAAAAAAABLL * ((v64 - (_BYTE *)__p) >> 3);
  if (v9 <= v22)
  {
    if (v9 < v22)
    {
      v23 = (char *)__p + 24 * v9;
      if (v64 != v23)
      {
        v24 = v64;
        do
        {
          v26 = (void *)*((_QWORD *)v24 - 3);
          v24 -= 24;
          v25 = v26;
          if (v26)
          {
            *((_QWORD *)v21 - 2) = v25;
            operator delete(v25);
          }
          v21 = v24;
        }
        while (v24 != v23);
      }
      v64 = v23;
    }
    if (!v9)
    {
      v29 = 0;
      goto LABEL_42;
    }
  }
  else
  {
    std::vector<std::vector<float>>::__append((uint64_t)&__p, v9 - v22);
  }
  v27 = 0;
  v28 = 0;
  v29 = 0;
  do
  {
    objc_msgSend(v7, "facePoseValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "roll");
    *(float *)&v32 = v32;
    *((_DWORD *)v69 + v28) = LODWORD(v32);
    objc_msgSend(v31, "pitch");
    *(float *)&v33 = v33;
    *((_DWORD *)v72 + v28) = LODWORD(v33);
    objc_msgSend(v31, "yaw");
    *(float *)&v34 = v34;
    *((_DWORD *)v66 + v28) = LODWORD(v34);
    objc_msgSend(v31, "smile");
    *(float *)&v35 = v35;
    *((_DWORD *)v75 + v28) = LODWORD(v35);
    objc_msgSend(v31, "roll");
    if (fabs(v36) < 20.0)
    {
      objc_msgSend(v31, "pitch");
      if (fabs(v37) < 20.0)
      {
        objc_msgSend(v31, "yaw");
        if (fabs(v38) < 20.0)
          ++v29;
      }
    }
    objc_msgSend(v31, "landmarks");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39 == 0;

    if (v40)
    {
      v44 = (char *)__p + v27;
      v45 = *(void **)((char *)__p + v27);
      if (v45)
      {
        v44[1] = v45;
        operator delete(v45);
        *v44 = 0;
        v44[1] = 0;
        v44[2] = 0;
      }
      *v44 = 0;
      v44[1] = 0;
      v44[2] = 0;
    }
    else
    {
      objc_msgSend(v31, "landmarks");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSArrayAsVector(&v61, v41);
      v42 = (char *)__p + v27;
      v43 = *(void **)((char *)__p + v27);
      if (v43)
      {
        v42[1] = v43;
        operator delete(v43);
        *v42 = 0;
        v42[1] = 0;
        v42[2] = 0;
      }
      *(_OWORD *)v42 = v61;
      v42[2] = v62;
      v61 = 0uLL;
      v62 = 0;

    }
    ++v28;
    v27 += 24;
  }
  while (v9 != v28);
LABEL_42:
  ptr = self->_predictor.__ptr_;
  LODWORD(v61) = v15;
  v47 = vision::mod::LivenessCheckPredictor::runFaceActionClassification((float32x2_t *)ptr, &v75, (uint64_t *)&v72, &v66, &v69, (uint64_t *)&__p, (int *)&v61);
  if ((_DWORD)v47)
  {
    if (!a5)
    {
      v14 = 0;
      v53 = (char *)__p;
      if (__p)
        goto LABEL_50;
      goto LABEL_57;
    }
    v48 = (void *)MEMORY[0x24BDD1540];
    v78 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FAC classifier failed with status: %d"), v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v50);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v14 = objc_alloc_init(PADAlgorithmFACResult);
    if (vision::mod::LivenessCheckPredictor::getActionFinish((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_))
      v51 = &unk_24D0D6100;
    else
      v51 = &unk_24D0D6118;
    -[PADAlgorithmFACResult setAssessment:](v14, "setAssessment:", v51);
    -[PADAlgorithmFACResult setIsHeadMovementDetected:](v14, "setIsHeadMovementDetected:", v29 < v9 >> 1);
    -[PADAlgorithms _retrieveFaceprintsFromPredictorUsingFACInput:](self, "_retrieveFaceprintsFromPredictorUsingFACInput:", v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PADAlgorithmFACResult setFaceprints:](v14, "setFaceprints:", v52);

    -[PADAlgorithms _retrieveReferenceFramesFromPredictor](self, "_retrieveReferenceFramesFromPredictor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PADAlgorithmFACResult setReferenceFrameIndices:](v14, "setReferenceFrameIndices:", v49);
  }

  v53 = (char *)__p;
  if (__p)
  {
LABEL_50:
    v54 = v64;
    v55 = v53;
    if (v64 != v53)
    {
      v56 = v64;
      do
      {
        v58 = (void *)*((_QWORD *)v56 - 3);
        v56 -= 24;
        v57 = v58;
        if (v58)
        {
          *((_QWORD *)v54 - 2) = v57;
          operator delete(v57);
        }
        v54 = v56;
      }
      while (v56 != v53);
      v55 = __p;
    }
    v64 = v53;
    operator delete(v55);
  }
LABEL_57:
  if (v66)
  {
    v67 = (char *)v66;
    operator delete(v66);
  }
  if (v69)
  {
    v70 = (char *)v69;
    operator delete(v69);
  }
  if (v72)
  {
    v73 = (char *)v72;
    operator delete(v72);
  }
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
LABEL_65:

  return v14;
}

- (id)_retrieveFaceprintsFromPredictorUsingFACInput:(id)a3
{
  id v4;
  void *v5;
  int *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  PADAlgorithmFACFaceprintResult *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__p;
  int *v25;

  v4 = a3;
  vision::mod::LivenessCheckPredictor::getIDmatchingFrameIndex(self->_predictor.__ptr_, &__p);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v6 = v25;
  if (v25 != __p)
  {
    v7 = 0;
    v6 = (int *)__p;
    while (1)
    {
      v8 = v6[v7];
      objc_msgSend(v4, "facePoseValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 <= v8)
        break;
      objc_msgSend(v4, "facePoseValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "faceprint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;
        v15 = objc_alloc_init(PADAlgorithmFACFaceprintResult);
        -[PADAlgorithmFACFaceprintResult setFaceprint:](v15, "setFaceprint:", v14);
        -[PADAlgorithmFACFaceprintResult setIndex:](v15, "setIndex:", v8);
        objc_msgSend(v5, "addObject:", v15);

      }
      ++v7;
      v6 = (int *)__p;
      if (v7 >= ((char *)v25 - (_BYTE *)__p) >> 2)
        goto LABEL_10;
    }
    v16 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PADAlgorithms _retrieveFaceprintsFromPredictorUsingFACInput:].cold.1(v8, v16, v17, v18, v19, v20, v21, v22);

    v6 = (int *)__p;
  }
LABEL_10:
  if (v6)
  {
    v25 = v6;
    operator delete(v6);
  }

  return v5;
}

- (id)_retrieveReferenceFramesFromPredictor
{
  void *v2;
  NSObject *v3;
  int *v4;
  unint64_t v5;
  void *v6;
  void *__p;
  _BYTE *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  vision::mod::LivenessCheckPredictor::getRaiseEyebrowsReferenceIndex(self->_predictor.__ptr_, &__p);
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  if (v9 != __p)
  {
    v3 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v11 = (v9 - (_BYTE *)__p) >> 2;
      _os_log_impl(&dword_213BCD000, v3, OS_LOG_TYPE_INFO, "FAC used %lu frames as reference frames for the current gesture.", buf, 0xCu);
    }

    v4 = (int *)__p;
    if (v9 != __p)
    {
      v5 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4[v5]);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v6);

        ++v5;
        v4 = (int *)__p;
      }
      while (v5 < (v9 - (_BYTE *)__p) >> 2);
    }
  }
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  return v2;
}

- (void)performTA:(__CVBuffer *)a3 nccSignal:(double *)a4 stitchDetected:(BOOL *)a5 isSensitive:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  size_t PlaneCount;
  CVReturn v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  BOOL v23;
  vImage_Buffer src;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v8 = a6;
  v28[1] = *MEMORY[0x24BDAC8D0];
  PlaneCount = CVPixelBufferGetPlaneCount(a3);
  v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (PlaneCount)
  {
    if (v14
      || (src.data = CVPixelBufferGetBaseAddressOfPlane(a3, 0),
          src.height = CVPixelBufferGetHeightOfPlane(a3, 0),
          src.width = CVPixelBufferGetWidthOfPlane(a3, 0),
          src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0),
          CVPixelBufferUnlockBaseAddress(a3, 1uLL)))
    {
      if (a7)
      {
        v15 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TA could not convert image to required type."));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v17);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      return;
    }
  }
  else
  {
    src.data = CVPixelBufferGetBaseAddress(a3);
    src.height = CVPixelBufferGetHeight(a3);
    src.width = CVPixelBufferGetWidth(a3);
    src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  v23 = 0;
  v22 = 0.0;
  v18 = vision::mod::LivenessCheckPredictor::runStitchDetector((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_, &src, &v23, &v22, v8);
  if ((_DWORD)v18)
  {
    if (a7)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TA model failed with status: %d"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v21);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    *a4 = v22;
    *a5 = v23;
  }
}

- (int64_t)performSC:(id)a3 assessmentTA:(id)a4 assessmentFakePRD:(id)a5 assessmentLivePRD:(id)a6 assessmentID:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  LivenessCheckPredictor *ptr;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int SpoofType;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  ptr = self->_predictor.__ptr_;
  objc_msgSend(v14, "floatValue");
  v35 = v20;
  objc_msgSend(v15, "floatValue");
  v34 = v21;
  objc_msgSend(v16, "floatValue");
  v33 = v22;
  objc_msgSend(v17, "floatValue");
  v32 = v23;
  objc_msgSend(v18, "floatValue");
  v31 = v24;
  v25 = vision::mod::LivenessCheckPredictor::runSpoofingClassification((vision::mod::LivenessCheckPredictor *)ptr, &v35, &v34, &v33, &v32, &v31);
  if ((_DWORD)v25)
  {
    if (a8)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SC model failed with status: %d"), v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v28);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
  }
  else
  {
    SpoofType = vision::mod::LivenessCheckPredictor::getSpoofType((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_);
    if (SpoofType == 2)
      a8 = (id *)2;
    else
      a8 = (id *)(SpoofType == 1);
  }

  return (int64_t)a8;
}

- (double)performIDMatching:(id)a3 toFaceprints:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double IDmatchingScore;
  uint64_t v32;
  unint64_t i;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t j;
  __n128 v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  char *v61;
  void *v62;
  char *v63;
  void *v64;
  void *v65;
  void *__p[2];
  uint64_t v68;
  void *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v78 = *MEMORY[0x24BDD0BA0];
      v79[0] = CFSTR("Faceprints must contain at least 1 value.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PADAlgorithms performIDMatching:toFaceprints:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_15;
  }
  if (!objc_msgSend(v8, "count"))
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v76 = *MEMORY[0x24BDD0BA0];
      v77 = CFSTR("Baseline faceprint must contain at least 1 dimension.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[PADAlgorithms performIDMatching:toFaceprints:error:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

LABEL_15:
    IDmatchingScore = 0.0;
    goto LABEL_47;
  }
  v69 = 0;
  v70 = 0;
  v71 = 0;
  v10 = objc_msgSend(v9, "count");
  if (v10)
    std::vector<std::vector<float>>::__append((uint64_t)&v69, v10);
  v32 = 0;
  for (i = 0; i < objc_msgSend(v9, "count"); ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");
    LOBYTE(v35) = v35 == objc_msgSend(v8, "count");

    if ((v35 & 1) == 0)
    {
      if (a5)
      {
        v41 = (void *)MEMORY[0x24BDD1540];
        v74 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Dimension mismatch on faceprint %d."), i);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v42;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v43);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v44 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[PADAlgorithms performIDMatching:toFaceprints:error:].cold.3(i, v44, v45, v46, v47, v48, v49, v50);

      IDmatchingScore = 0.0;
      goto LABEL_39;
    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSArrayAsVector(__p, v36);
    v37 = (char *)v69 + v32;
    v38 = *(void **)((char *)v69 + v32);
    if (v38)
    {
      v37[1] = v38;
      operator delete(v38);
      *v37 = 0;
      v37[1] = 0;
      v37[2] = 0;
    }
    *(_OWORD *)v37 = *(_OWORD *)__p;
    v37[2] = v68;
    __p[0] = 0;
    __p[1] = 0;
    v68 = 0;

    v32 += 24;
  }
  __p[0] = 0;
  __p[1] = 0;
  v68 = 0;
  v39 = objc_msgSend(v8, "count");
  v40 = ((char *)__p[1] - (char *)__p[0]) >> 2;
  if (v39 <= v40)
  {
    if (v39 < v40)
      __p[1] = (char *)__p[0] + 4 * v39;
  }
  else
  {
    std::vector<float>::__append((uint64_t)__p, v39 - v40);
  }
  for (j = 0; j < objc_msgSend(v8, "count"); ++j)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", j);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "floatValue");
    *((_DWORD *)__p[0] + j) = v54;

  }
  v55 = vision::mod::LivenessCheckPredictor::runIDMatching((uint64_t)self->_predictor.__ptr_, (uint64_t *)&v69, (uint64_t *)__p, v52);
  if (!(_DWORD)v55)
  {
    IDmatchingScore = vision::mod::LivenessCheckPredictor::getIDmatchingScore((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_);
    v59 = __p[0];
    if (!__p[0])
      goto LABEL_39;
LABEL_38:
    __p[1] = v59;
    operator delete(v59);
    goto LABEL_39;
  }
  IDmatchingScore = 0.0;
  if (a5)
  {
    v56 = (void *)MEMORY[0x24BDD1540];
    v72 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ID model failed with status: %d"), v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v57;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreidv.CoreIDVPAD.PADErrorDomain"), 3, v58);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v59 = __p[0];
  if (__p[0])
    goto LABEL_38;
LABEL_39:
  v60 = (char *)v69;
  if (v69)
  {
    v61 = v70;
    v62 = v69;
    if (v70 != v69)
    {
      v63 = v70;
      do
      {
        v65 = (void *)*((_QWORD *)v63 - 3);
        v63 -= 24;
        v64 = v65;
        if (v65)
        {
          *((_QWORD *)v61 - 2) = v64;
          operator delete(v64);
        }
        v61 = v63;
      }
      while (v63 != v60);
      v62 = v69;
    }
    v70 = v60;
    operator delete(v62);
  }
LABEL_47:

  return IDmatchingScore;
}

- (double)getPRDFakeFrameThreshold
{
  return *((float *)self->_config.__ptr_ + 18);
}

- (double)getPRDLiveFrameThreshold
{
  return *((float *)self->_config.__ptr_ + 20);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  __shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;

  cntrl = self->_predictor.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v6 = self->_config.__cntrl_;
    if (!v6)
      return;
  }
  else
  {
LABEL_5:
    v6 = self->_config.__cntrl_;
    if (!v6)
      return;
  }
  v7 = (unint64_t *)((char *)v6 + 8);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (!v8)
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)v6 + 16))(v6, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)initWithPADModelConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_213BCD000, log, OS_LOG_TYPE_DEBUG, "Could not create predictor object.", v1, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_retrieveFaceprintsFromPredictorUsingFACInput:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_213BCD000, a2, a3, "Invalid frame index %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)performIDMatching:(uint64_t)a3 toFaceprints:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_213BCD000, a1, a3, "Faceprints must contain at least 1 value.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)performIDMatching:(uint64_t)a3 toFaceprints:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_213BCD000, a1, a3, "Baseline faceprint must contain at least 1 dimension.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)performIDMatching:(uint64_t)a3 toFaceprints:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_213BCD000, a2, a3, "Dimension mismatch on faceprint %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

@end
