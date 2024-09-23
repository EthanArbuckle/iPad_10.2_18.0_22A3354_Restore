@implementation CVNLPVideoCaptioningModel

- (CVNLPVideoCaptioningModel)initWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;
  int v20;
  unint64_t v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  __shared_weak_count *cntrl;
  unint64_t *v27;
  unint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *p_shared_owners;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  BOOL v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  BOOL v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  int v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  __CFString *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  int v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  BOOL v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  __CFString *v89;
  id v90;
  __CFString *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  int v99;
  int v100;
  float v101;
  CVNLPVideoCaptioningModel *v102;
  unint64_t *v103;
  unint64_t v104;
  void *exception;
  __CFString *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  std::__shared_weak_count *v116;
  void *__p[2];
  uint64_t v118;
  CFTypeRef cf;
  void *v120;
  void *v121;
  char v122;
  char v123;
  char v124[8];
  void *v125;
  char v126;
  void *v127[2];
  uint64_t v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CVNLPVideoCaptioningModelURL, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    CFRetain(v9);
  sub_1B034AEC8(&cf, v10);

  sub_1B0348B9C((const __CFURL **)&cf, v127);
  if (cf)
    CFRelease(cf);
  if (SHIBYTE(v128) < 0)
  {
    sub_1B02EB0A8(__p, v127[0], (unint64_t)v127[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v127;
    v118 = v128;
  }
  sub_1B034B450((uint64_t)v124, (uint64_t)__p);
  if (SHIBYTE(v118) < 0)
    operator delete(__p[0]);
  if (!sub_1B03177C0((uint64_t)v124))
  {
    exception = __cxa_allocate_exception(0x28uLL);
    sub_1B037D53C((uint64_t)exception, (uint64_t)v127);
    __cxa_throw(exception, (struct type_info *)&unk_1E60CB170, (void (*)(void *))sub_1B0349514);
  }
  objc_msgSend_objectForKey_(v6, v11, (uint64_t)CVNLPVideoCaptioningModelEspressoEngine, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    v21 = 0;
    v19 = 0;
    v20 = 0;
  }
  else
  {
    objc_msgSend_objectForKey_(v6, v15, (uint64_t)CVNLPVideoCaptioningModelEspressoEngine, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0349558(v17, &v120);

    v18 = sub_1B0349660((uint64_t)&v120);
    v19 = v18;
    v20 = v18 & 0xFFFFFF00;
    v21 = v18 & 0xFFFFFFFF00000000;
    if (v122 < 0)
      operator delete(v120);
  }
  objc_storeStrong((id *)&self->_options, a3);
  v22 = (char *)operator new(0x268uLL);
  *((_QWORD *)v22 + 1) = 0;
  *((_QWORD *)v22 + 2) = 0;
  *(_QWORD *)v22 = &off_1E60CD770;
  sub_1B0317BEC((uint64_t)&v120, (uint64_t)v124);
  sub_1B031CF10((uint64_t)(v22 + 24), (uint64_t)&v120, v21 & 0xFF00000000 | v19 | v20 & 0xFFFFFF00);
  if (v123 < 0)
    operator delete(v121);
  cntrl = self->_model.__cntrl_;
  self->_model.__ptr_ = (VideoCaptioningModel *)(v22 + 24);
  self->_model.__cntrl_ = (__shared_weak_count *)v22;
  if (cntrl)
  {
    v27 = (unint64_t *)((char *)cntrl + 8);
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  objc_msgSend_model(self, v23, v24, v25);
  v32 = (std::__shared_weak_count *)*((_QWORD *)v120 + 73);
  v114 = *((_QWORD *)v120 + 72);
  v116 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v34 = __ldxr(p_shared_owners);
    while (__stxr(v34 + 1, p_shared_owners));
  }
  v35 = (std::__shared_weak_count *)v121;
  if (v121)
  {
    v36 = (unint64_t *)((char *)v121 + 8);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  objc_msgSend_options(self, v29, v30, v31, v114);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)CVNLPVideoCaptioningModelBeamSearchBeamWidth, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (!v42)
  {
    v46 = CVNLPVideoCaptioningModelBeamSearchBeamWidth;
    objc_msgSend_options(self, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = sub_1B037EE08(v50, v46);

    *(_DWORD *)(v115 + 48) = v51;
  }
  objc_msgSend_options(self, v43, v44, v45);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v52, v53, (uint64_t)CVNLPVideoCaptioningModelBeamSearchMaxSteps, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55 == 0;

  if (!v56)
  {
    v60 = CVNLPVideoCaptioningModelBeamSearchMaxSteps;
    objc_msgSend_options(self, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = sub_1B037EE08(v64, v60);

    *(_DWORD *)(v115 + 8) = v65;
    *(_BYTE *)(v115 + 12) = 1;
  }
  objc_msgSend_options(self, v57, v58, v59);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v66, v67, (uint64_t)CVNLPVideoCaptioningModelBeamSearchTopK, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69 == 0;

  if (!v70)
  {
    v74 = CVNLPVideoCaptioningModelBeamSearchTopK;
    objc_msgSend_options(self, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = sub_1B037EE08(v78, v74);

    *(_DWORD *)(v115 + 52) = v79;
  }
  objc_msgSend_options(self, v71, v72, v73);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v80, v81, (uint64_t)CVNLPVideoCaptioningModelBeamSearchLengthNormalizationAlpha, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83 == 0;

  if (!v84)
  {
    objc_msgSend_options(self, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = CVNLPVideoCaptioningModelBeamSearchLengthNormalizationAlpha;
    v90 = v88;
    v91 = v89;
    objc_msgSend_objectForKey_(v90, v92, (uint64_t)v91, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v94;
    if (!v94)
    {
      v107 = objc_retainAutorelease(v91);
      v111 = (char *)objc_msgSend_UTF8String(v107, v108, v109, v110);
      sub_1B02DCBB8(&v120, v111);
      v112 = __cxa_allocate_exception(0x28uLL);
      sub_1B037EF20((uint64_t)v112, (uint64_t)&v120);
      __cxa_throw(v112, (struct type_info *)&unk_1E60CB248, (void (*)(void *))sub_1B031C354);
    }
    objc_msgSend_floatValue(v94, v95, v96, v97);
    v100 = v99;

    *(_DWORD *)(v115 + 56) = v100;
    v101 = *(float *)(v115 + 56);
    if (v101 < 0.0 || v101 > 10.0)
    {
      v113 = __cxa_allocate_exception(0x28uLL);
      sub_1B037D754((uint64_t)v113);
      __cxa_throw(v113, (struct type_info *)&unk_1E60CB170, (void (*)(void *))sub_1B0349514);
    }
  }
  v102 = self;
  if (!v116)
    goto LABEL_44;
  v103 = (unint64_t *)&v116->__shared_owners_;
  do
    v104 = __ldaxr(v103);
  while (__stlxr(v104 - 1, v103));
  if (v104)
  {
LABEL_44:
    if ((v126 & 0x80000000) == 0)
      goto LABEL_45;
LABEL_48:
    operator delete(v125);
    if ((SHIBYTE(v128) & 0x80000000) == 0)
      goto LABEL_46;
LABEL_49:
    operator delete(v127[0]);
    goto LABEL_46;
  }
  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
  std::__shared_weak_count::__release_weak(v116);
  if (v126 < 0)
    goto LABEL_48;
LABEL_45:
  if (SHIBYTE(v128) < 0)
    goto LABEL_49;
LABEL_46:

  return v102;
}

- (id)generateCaption:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  __int128 *v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  int64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _BYTE *v49;
  _QWORD *v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *v55;
  __int128 *v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *p_shared_owners;
  unint64_t v70;
  id v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  uint64_t v80;
  std::__shared_weak_count *v81;
  _QWORD v82[2];
  void *v83;
  void *v84;
  std::__shared_weak_count *v85;
  void *v86;
  unint64_t v87;
  char *v88;
  void *__dst[2];
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  void *__p[2];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_model(self, v6, v7, v8);
  v9 = (char *)__p[0];
  if (*((char *)__p[0] + 23) < 0)
  {
    sub_1B02EB0A8(__dst, *(void **)__p[0], *((_QWORD *)__p[0] + 1));
  }
  else
  {
    v10 = *(_OWORD *)__p[0];
    v90 = *((_QWORD *)__p[0] + 2);
    *(_OWORD *)__dst = v10;
  }
  if (v9[47] < 0)
  {
    sub_1B02EB0A8(&v91, *((void **)v9 + 3), *((_QWORD *)v9 + 4));
  }
  else
  {
    v11 = *(_OWORD *)(v9 + 24);
    v92 = *((_QWORD *)v9 + 5);
    v91 = v11;
  }
  if (v9[71] < 0)
  {
    sub_1B02EB0A8(&v93, *((void **)v9 + 6), *((_QWORD *)v9 + 7));
  }
  else
  {
    v12 = *((_OWORD *)v9 + 3);
    v94 = *((_QWORD *)v9 + 8);
    v93 = v12;
  }
  v13 = *((_QWORD *)v9 + 9);
  v96 = *((_DWORD *)v9 + 20);
  v95 = v13;
  v14 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v15 = (unint64_t *)((char *)__p[1] + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = SHIDWORD(v95);
  v18 = operator new(8uLL);
  *v18 = 1;
  v19 = operator new(0x10uLL);
  *v19 = xmmword_1B03B1270;
  v20 = v19 + 1;
  v86 = v19;
  v88 = (char *)(v19 + 1);
  operator delete(v18);
  v87 = (unint64_t)(v19 + 1);
  v21 = 3;
  if ((unint64_t)((v88 - (_BYTE *)v86) >> 2) > 3)
    v21 = ((char *)(v19 + 1) - (_BYTE *)v86) >> 2;
  if ((unint64_t)(v88 - (_BYTE *)v86) >= 0x7FFFFFFFFFFFFFF8)
    v22 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v22 = v21;
  if (v22)
  {
    if (v22 >> 61)
      goto LABEL_101;
    v23 = operator new(8 * v22);
    v24 = (uint64_t)(v23 + 2);
    v25 = (char *)&v23[v22];
    v23[2] = v17;
    v26 = (unint64_t)(v23 + 3);
    if (v20 != v19)
      goto LABEL_24;
  }
  else
  {
    v23 = 0;
    v24 = 16;
    v25 = 0;
    MEMORY[0x10] = v17;
    v26 = 24;
    if (v20 != v19)
    {
LABEL_24:
      v24 = (uint64_t)v23;
      memcpy(v23, v19, 0x10uLL);
    }
  }
  v86 = (void *)v24;
  v87 = v26;
  v88 = v25;
  if (v19)
  {
    operator delete(v19);
    v25 = v88;
  }
  v87 = v26;
  if (v26 < (unint64_t)v25)
  {
    *(_QWORD *)v26 = 7;
    v27 = (char *)(v26 + 8);
    goto LABEL_50;
  }
  v28 = (char *)v86;
  v29 = (uint64_t)(v26 - (_QWORD)v86) >> 3;
  v30 = v29 + 1;
  if ((unint64_t)(v29 + 1) >> 61)
    goto LABEL_100;
  if ((v25 - (_BYTE *)v86) >> 2 > v30)
    v30 = (v25 - (_BYTE *)v86) >> 2;
  if ((unint64_t)(v25 - (_BYTE *)v86) >= 0x7FFFFFFFFFFFFFF8)
    v31 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v31 = v30;
  if (v31)
  {
    if (v31 >> 61)
      goto LABEL_101;
    v32 = (char *)operator new(8 * v31);
  }
  else
  {
    v32 = 0;
  }
  v33 = &v32[8 * v29];
  v25 = &v32[8 * v31];
  *(_QWORD *)v33 = 7;
  v27 = v33 + 8;
  if ((char *)v26 != v28)
  {
    v34 = v26 - (_QWORD)v28 - 8;
    if (v34 < 0x18)
    {
      v35 = (char *)v26;
      do
      {
LABEL_47:
        v42 = *((_QWORD *)v35 - 1);
        v35 -= 8;
        *((_QWORD *)v33 - 1) = v42;
        v33 -= 8;
      }
      while (v35 != v28);
      goto LABEL_48;
    }
    v36 = (v34 >> 3) + 1;
    v37 = 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
    v35 = (char *)(v26 - v37);
    v33 -= v37;
    v38 = &v32[8 * v29 - 16];
    v39 = (__int128 *)(v26 - 16);
    v40 = v36 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v41 = *v39;
      *((_OWORD *)v38 - 1) = *(v39 - 1);
      *(_OWORD *)v38 = v41;
      v38 -= 32;
      v39 -= 2;
      v40 -= 4;
    }
    while (v40);
    if (v36 != (v36 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_47;
  }
LABEL_48:
  v86 = v33;
  v87 = (unint64_t)v27;
  v88 = &v32[8 * v31];
  if (v28)
  {
    operator delete(v28);
    v25 = v88;
  }
LABEL_50:
  v87 = (unint64_t)v27;
  if (v27 < v25)
  {
    *(_QWORD *)v27 = 7;
    v43 = v27 + 8;
    goto LABEL_73;
  }
  v44 = (char *)v86;
  v45 = v27 - (_BYTE *)v86;
  v46 = (v27 - (_BYTE *)v86) >> 3;
  v47 = v46 + 1;
  if ((unint64_t)(v46 + 1) >> 61)
LABEL_100:
    sub_1B02D7758();
  if ((v25 - (_BYTE *)v86) >> 2 > v47)
    v47 = (v25 - (_BYTE *)v86) >> 2;
  if ((unint64_t)(v25 - (_BYTE *)v86) >= 0x7FFFFFFFFFFFFFF8)
    v48 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v48 = v47;
  if (v48)
  {
    if (!(v48 >> 61))
    {
      v49 = operator new(8 * v48);
      goto LABEL_62;
    }
LABEL_101:
    sub_1B02D72AC();
  }
  v49 = 0;
LABEL_62:
  v50 = &v49[8 * v46];
  *v50 = 7;
  v43 = v50 + 1;
  if (v27 == v44)
    goto LABEL_71;
  v51 = v27 - v44 - 8;
  if (v51 < 0x58)
  {
    v52 = v27;
    goto LABEL_70;
  }
  if ((unint64_t)(v27 - v49 - v45) < 0x20)
  {
    v52 = v27;
    do
    {
LABEL_70:
      v59 = *((_QWORD *)v52 - 1);
      v52 -= 8;
      *--v50 = v59;
    }
    while (v52 != v44);
    goto LABEL_71;
  }
  v53 = (v51 >> 3) + 1;
  v54 = 8 * (v53 & 0x3FFFFFFFFFFFFFFCLL);
  v52 = &v27[-v54];
  v50 = (_QWORD *)((char *)v50 - v54);
  v55 = &v49[8 * v46 - 16];
  v56 = (__int128 *)(v27 - 16);
  v57 = v53 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v58 = *v56;
    *(v55 - 1) = *(v56 - 1);
    *v55 = v58;
    v55 -= 2;
    v56 -= 2;
    v57 -= 4;
  }
  while (v57);
  if (v53 != (v53 & 0x3FFFFFFFFFFFFFFCLL))
    goto LABEL_70;
LABEL_71:
  v86 = v50;
  v87 = (unint64_t)v43;
  v88 = &v49[8 * v48];
  if (v44)
    operator delete(v44);
LABEL_73:
  v87 = (unint64_t)v43;
  v60 = v5;
  v107 = 0;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  *(_OWORD *)__p = 0u;
  v98 = 0u;
  espresso_buffer_pack_tensor_shape();
  LODWORD(v107) = 65568;
  v61 = objc_retainAutorelease(v60);
  __p[0] = (void *)objc_msgSend_bytes(v61, v62, v63, v64);
  LOWORD(v80) = 1;
  sub_1B0327978((uint64_t)v82, (uint64_t)__p, &v80);

  objc_msgSend_model(self, v65, v66, v67);
  sub_1B03207FC(v80, (uint64_t)v82);
  v68 = v81;
  if (v81)
  {
    p_shared_owners = (unint64_t *)&v81->__shared_owners_;
    do
      v70 = __ldaxr(p_shared_owners);
    while (__stlxr(v70 - 1, p_shared_owners));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v71 = objc_alloc(MEMORY[0x1E0CB3940]);
  if ((SBYTE7(v98) & 0x80u) == 0)
    v74 = objc_msgSend_initWithUTF8String_(v71, v72, (uint64_t)__p, v73);
  else
    v74 = objc_msgSend_initWithUTF8String_(v71, v72, (uint64_t)__p[0], v73);
  v75 = (void *)v74;
  if (SBYTE7(v98) < 0)
    operator delete(__p[0]);
  v82[0] = &unk_1E60CCA78;
  v76 = v85;
  if (v85)
  {
    v77 = (unint64_t *)&v85->__shared_owners_;
    do
      v78 = __ldaxr(v77);
    while (__stlxr(v78 - 1, v77));
    if (!v78)
    {
      ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
      std::__shared_weak_count::__release_weak(v76);
    }
  }
  if (v83)
  {
    v84 = v83;
    operator delete(v83);
  }
  if (v86)
  {
    v87 = (unint64_t)v86;
    operator delete(v86);
  }
  if (SHIBYTE(v94) < 0)
  {
    operator delete((void *)v93);
    if ((SHIBYTE(v92) & 0x80000000) == 0)
    {
LABEL_94:
      if (SHIBYTE(v90) < 0)
        goto LABEL_98;
      goto LABEL_99;
    }
  }
  else if ((SHIBYTE(v92) & 0x80000000) == 0)
  {
    goto LABEL_94;
  }
  operator delete((void *)v91);
  if (SHIBYTE(v90) < 0)
LABEL_98:
    operator delete(__dst[0]);
LABEL_99:

  return v75;
}

- (shared_ptr<cvnlp::vidcap::VideoCaptioningModel>)model
{
  VideoCaptioningModel **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<cvnlp::vidcap::VideoCaptioningModel> result;

  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (VideoCaptioningModel *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VideoCaptioningModel *)self;
  return result;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;

  cntrl = self->_model.__cntrl_;
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
    objc_storeStrong((id *)&self->_options, 0);
  }
  else
  {
LABEL_5:
    objc_storeStrong((id *)&self->_options, 0);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
