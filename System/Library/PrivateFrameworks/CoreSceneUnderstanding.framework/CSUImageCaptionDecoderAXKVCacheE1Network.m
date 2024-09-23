@implementation CSUImageCaptionDecoderAXKVCacheE1Network

- (BOOL)loadDecoderNetworkfromConfiguration:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  void *v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  EspressoNet *v27;
  void **v28;
  void *v29;
  void **v30;
  void **v31;
  void *v32;
  void **v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int input_names;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void **v42;
  void **v43;
  std::__shared_weak_count *v44;
  void *v45;
  char *v46;
  char *v47;
  char v48;
  __int128 v49;
  uint64_t v50;
  void **v51;
  char *v52;
  uint64_t v53;
  void **v54;
  char *v55;
  void **v57;
  unint64_t v58;
  _OWORD *v59;
  uint64_t v60;
  _BYTE *v61;
  void **v62;
  __int128 *v63;
  _OWORD *v64;
  unint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  _QWORD *v70;
  uint64_t **v71;
  uint64_t *v72;
  int64_t v73;
  char *v74;
  char *v75;
  int64_t v76;
  void *v77;
  char *v78;
  uint64_t **v81;
  uint64_t *v82;
  _QWORD *v83;
  unint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t **v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t **v92;
  uint64_t *v93;
  unint64_t *v94;
  unint64_t v95;
  CSUImageCaptionDecoderAXKVCacheE1Network *v96;
  __shared_weak_count *cntrl;
  unint64_t *v98;
  unint64_t v99;
  uint64_t **p_stateInputEspressoBuffersShape;
  float *v101;
  float *v102;
  float *begin;
  unint64_t *p_shared_owners;
  unint64_t v105;
  id v108;
  void *v109;
  int64_t v110;
  unint64_t v111;
  void *v112;
  int64_t v113;
  int64_t v114;
  void *v115[2];
  uint64_t v116;
  __int128 *v117;
  __int128 v118;
  __int128 *v119;
  __int128 v120;
  __int128 *v121;
  __int128 v122;
  void *v123;
  void **v124;
  uint64_t v125;
  int v126;
  char v127;
  char v128;
  char v129;
  uint64_t v130;
  char v131;
  char v132;
  char v133;
  char v134;
  __int128 v135;
  __int128 v136;
  int v137;
  void *__p;
  char v139;
  EspressoNet *v140;
  std::__shared_weak_count *v141;
  void *__dst[2];
  int64_t v143;
  __int128 *v144[3];

  v5 = a3;
  v108 = v5;
  objc_msgSend_decoderNetworkPath(v5, v6, v7, v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13, v14);
  v16 = strlen(v15);
  if (v16 > 0x7FFFFFFFFFFFFFF7)
    sub_239FEBDE0();
  v17 = (void *)v16;
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v18 = (void **)operator new(v19 + 1);
    __dst[1] = v17;
    v143 = v20 | 0x8000000000000000;
    __dst[0] = v18;
    goto LABEL_8;
  }
  HIBYTE(v143) = v16;
  v18 = __dst;
  if (v16)
LABEL_8:
    memmove(v18, v15, (size_t)v17);
  *((_BYTE *)v17 + (_QWORD)v18) = 0;

  v25 = (uint64_t *)__dst;
  if (v143 < 0)
    v25 = (uint64_t *)__dst[0];
  v121 = (__int128 *)v25;
  v123 = 0;
  v124 = 0;
  v125 = 0;
  v126 = objc_msgSend_espressoExecutionEngine(v5, v21, v22, v23, v24);
  v127 = 1;
  v128 = 0;
  v129 = 0;
  v130 = 0xFFFFFFFFLL;
  v131 = 0;
  v132 = 0;
  v133 = 0;
  v134 = 0;
  v135 = 0u;
  v136 = 0u;
  v137 = 1065353216;
  v139 = 0;
  LOBYTE(__p) = 0;
  v26 = (char *)operator new(0x30uLL);
  *((_QWORD *)v26 + 1) = 0;
  *((_QWORD *)v26 + 2) = 0;
  *(_QWORD *)v26 = &off_250B0BF28;
  v27 = (EspressoNet *)(v26 + 24);
  sub_23A052710((_QWORD *)v26 + 3, (const char **)&v121, (uint64_t)&v123);
  v140 = (EspressoNet *)(v26 + 24);
  v141 = (std::__shared_weak_count *)v26;
  if (v139 < 0)
    operator delete(__p);
  v28 = (void **)v136;
  if ((_QWORD)v136)
  {
    do
    {
      v33 = (void **)*v28;
      if (*((char *)v28 + 39) < 0)
        operator delete(v28[2]);
      operator delete(v28);
      v28 = v33;
    }
    while (v33);
  }
  v29 = (void *)v135;
  *(_QWORD *)&v135 = 0;
  if (v29)
    operator delete(v29);
  v30 = (void **)v123;
  if (v123)
  {
    v31 = v124;
    v32 = v123;
    if (v124 != v123)
    {
      do
      {
        if (*((char *)v31 - 1) < 0)
          operator delete(*(v31 - 3));
        v31 -= 3;
      }
      while (v31 != v30);
      v32 = v123;
    }
    v124 = v30;
    operator delete(v32);
  }
  v123 = 0;
  v124 = 0;
  v125 = 0;
  input_names = c_network_get_input_names();
  if (input_names)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v34, (uint64_t)CFSTR("Not able to fetch decoder input names!"), v35, v36);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v38;
    objc_msgSend_logInternalError_(CSUError, v39, (uint64_t)v38, v40, v41);
    v42 = (void **)v123;
    if (!v123)
      goto LABEL_138;
    goto LABEL_29;
  }
  v122 = 0uLL;
  v121 = &v122;
  v119 = &v120;
  v120 = 0uLL;
  v118 = 0uLL;
  v117 = &v118;
  v46 = (char *)v123;
  v47 = (char *)v124;
  if (v123 == v124)
  {
LABEL_121:
    v94 = (unint64_t *)(v26 + 8);
    do
      v95 = __ldxr(v94);
    while (__stxr(v95 + 1, v94));
    v96 = self;
    cntrl = self->_decoderNet.__cntrl_;
    self->_decoderNet.__ptr_ = v27;
    self->_decoderNet.__cntrl_ = (__shared_weak_count *)v26;
    if (cntrl)
      goto LABEL_126;
LABEL_129:
    p_stateInputEspressoBuffersShape = (uint64_t **)&v96->_stateInputEspressoBuffersShape;
    if (&v96->_stateInputEspressoBuffersShape == (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&v117)
      goto LABEL_131;
    goto LABEL_130;
  }
  do
  {
    while (1)
    {
      if (v46[23] < 0)
      {
        sub_239FF1F64(v115, *(void **)v46, *((_QWORD *)v46 + 1));
      }
      else
      {
        v49 = *(_OWORD *)v46;
        v116 = *((_QWORD *)v46 + 2);
        *(_OWORD *)v115 = v49;
      }
      v48 = HIBYTE(v116);
      if (v116 >= 0)
        v50 = HIBYTE(v116);
      else
        v50 = (uint64_t)v115[1];
      if (v116 >= 0)
        v51 = v115;
      else
        v51 = (void **)v115[0];
      if (v50 >= 5)
      {
        v52 = (char *)v51 + v50;
        v53 = v50;
        v54 = v51;
        while (1)
        {
          v55 = (char *)memchr(v54, 95, v53 - 4);
          if (!v55)
            goto LABEL_43;
          if (*(_DWORD *)v55 == 1767863135 && v55[4] == 110)
            break;
          v54 = (void **)(v55 + 1);
          v53 = v52 - (char *)v54;
          if (v52 - (char *)v54 < 5)
            goto LABEL_43;
        }
        if (v55 == v52 || v55 - (char *)v51 == -1)
          goto LABEL_43;
        v57 = (void **)(v52 - 3);
        v58 = v50 - 3;
        if ((unint64_t)(v50 - 3) > 0x7FFFFFFFFFFFFFF7)
          sub_239FEBDE0();
        if (v58 > 0x16)
        {
          v67 = (v58 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v58 | 7) != 0x17)
            v67 = v58 | 7;
          v68 = v67 + 1;
          v59 = operator new(v67 + 1);
          v113 = v50 - 3;
          v114 = v68 | 0x8000000000000000;
          v112 = v59;
          if (v51 != v57)
          {
LABEL_70:
            v60 = v50 - 3;
            if ((unint64_t)(v50 - 3) < 0x20 || (unint64_t)((char *)v59 - (char *)v51) < 0x20)
            {
              v61 = v59;
              v62 = v51;
            }
            else
            {
              v61 = (char *)v59 + (v60 & 0xFFFFFFFFFFFFFFE0);
              v62 = (void **)((char *)v51 + (v60 & 0xFFFFFFFFFFFFFFE0));
              v63 = (__int128 *)(v51 + 2);
              v64 = v59 + 1;
              v65 = v60 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                v66 = *v63;
                *(v64 - 1) = *(v63 - 1);
                *v64 = v66;
                v63 += 2;
                v64 += 2;
                v65 -= 32;
              }
              while (v65);
              if (v60 == (v60 & 0xFFFFFFFFFFFFFFE0))
              {
LABEL_82:
                *v61 = 0;
                v70 = operator new(0x28uLL);
                v70[4] = 0;
                *(_OWORD *)v70 = 0u;
                *((_OWORD *)v70 + 1) = 0u;
                v109 = v115;
                v71 = sub_23A052844((uint64_t **)&v117, (const void **)v115, (uint64_t)&unk_23A0A31B0, (__int128 **)&v109);
                v72 = v71[7];
                if (v72)
                {
                  v71[8] = v72;
                  operator delete(v72);
                  v71[7] = 0;
                  v71[8] = 0;
                  v71[9] = 0;
                }
                v71[7] = v70;
                v71[8] = v70 + 5;
                v71[9] = v70 + 5;
                if (v114 >= 0)
                  v73 = HIBYTE(v114);
                else
                  v73 = v113;
                if (v114 >= 0)
                  v74 = (char *)&v112;
                else
                  v74 = (char *)v112;
                if (v73 >= 17)
                {
                  v75 = &v74[v73];
                  v76 = v73;
                  v77 = v74;
                  do
                  {
                    v78 = (char *)memchr(v77, 118, v76 - 16);
                    if (!v78)
                      break;
                    if (*(_QWORD *)v78 == 0x5F616C6C696E6176
                      && *((_QWORD *)v78 + 1) == 0x6F69746E65747461
                      && v78[16] == 110)
                    {
                      if (v78 == v75 || v78 - v74 == -1)
                        break;
                      v109 = v115;
                      v81 = sub_23A0529D4((uint64_t **)&v119, (const void **)v115, (uint64_t)&unk_23A0A31B0, (__int128 **)&v109);
                      v83 = v81 + 7;
                      v82 = v81[7];
                      if (v82)
                      {
                        v81[8] = v82;
                        operator delete(v82);
                        *v83 = 0;
                        v83[1] = 0;
                        v83[2] = 0;
                      }
                      *v83 = 0;
                      v83[1] = 0;
                      v83[2] = 0;
                      goto LABEL_40;
                    }
                    v77 = v78 + 1;
                    v76 = v75 - (_BYTE *)v77;
                  }
                  while (v75 - (_BYTE *)v77 >= 17);
                }
                v84 = v73 + 4;
                if ((unint64_t)(v73 + 4) > 0x7FFFFFFFFFFFFFF7)
                  sub_239FEBDE0();
                if (v84 >= 0x17)
                {
                  v86 = (v84 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v84 | 7) != 0x17)
                    v86 = v84 | 7;
                  v87 = v86 + 1;
                  v85 = operator new(v86 + 1);
                  v110 = v73 + 4;
                  v111 = v87 | 0x8000000000000000;
                  v109 = v85;
                }
                else
                {
                  v110 = 0;
                  v111 = 0;
                  v109 = 0;
                  v85 = &v109;
                  HIBYTE(v111) = v73 + 4;
                  if (!v73)
                  {
LABEL_114:
                    strcpy((char *)v85 + v73, "_out");
                    v88 = (uint64_t *)operator new(0xB800uLL);
                    bzero(v88, 0xB800uLL);
                    v144[0] = (__int128 *)v115;
                    v89 = sub_23A0529D4((uint64_t **)&v119, (const void **)v115, (uint64_t)&unk_23A0A31B0, v144);
                    v90 = v89[7];
                    if (v90)
                    {
                      v89[8] = v90;
                      operator delete(v90);
                      v89[7] = 0;
                      v89[8] = 0;
                      v89[9] = 0;
                    }
                    v89[7] = v88;
                    v89[8] = v88 + 5888;
                    v89[9] = v88 + 5888;
                    v91 = (uint64_t *)operator new(0x800uLL);
                    bzero(v91, 0x800uLL);
                    v144[0] = (__int128 *)&v109;
                    v92 = sub_23A0529D4((uint64_t **)&v121, (const void **)&v109, (uint64_t)&unk_23A0A31B0, v144);
                    v93 = v92[7];
                    if (v93)
                    {
                      v92[8] = v93;
                      operator delete(v93);
                      v92[7] = 0;
                      v92[8] = 0;
                      v92[9] = 0;
                    }
                    v92[7] = v91;
                    v92[8] = v91 + 256;
                    v92[9] = v91 + 256;
                    if (SHIBYTE(v111) < 0)
                      operator delete(v109);
LABEL_40:
                    if (SHIBYTE(v114) < 0)
                      operator delete(v112);
                    v48 = HIBYTE(v116);
                    goto LABEL_43;
                  }
                }
                memmove(v85, v74, v73);
                goto LABEL_114;
              }
            }
            do
            {
              v69 = *(_BYTE *)v62;
              v62 = (void **)((char *)v62 + 1);
              *v61++ = v69;
            }
            while (v62 != v57);
            goto LABEL_82;
          }
        }
        else
        {
          HIBYTE(v114) = v50 - 3;
          v59 = &v112;
          if (v51 != v57)
            goto LABEL_70;
        }
        v61 = v59;
        goto LABEL_82;
      }
LABEL_43:
      if (v48 < 0)
        break;
      v46 += 24;
      if (v46 == v47)
        goto LABEL_120;
    }
    operator delete(v115[0]);
    v46 += 24;
  }
  while (v46 != v47);
LABEL_120:
  v27 = v140;
  v26 = (char *)v141;
  if (v141)
    goto LABEL_121;
  v96 = self;
  cntrl = self->_decoderNet.__cntrl_;
  self->_decoderNet.__ptr_ = v140;
  self->_decoderNet.__cntrl_ = 0;
  if (!cntrl)
    goto LABEL_129;
LABEL_126:
  v98 = (unint64_t *)((char *)cntrl + 8);
  do
    v99 = __ldaxr(v98);
  while (__stlxr(v99 - 1, v98));
  if (v99)
    goto LABEL_129;
  (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  p_stateInputEspressoBuffersShape = (uint64_t **)&v96->_stateInputEspressoBuffersShape;
  if (&v96->_stateInputEspressoBuffersShape != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&v117)
LABEL_130:
    sub_23A052B64(p_stateInputEspressoBuffersShape, v117, &v118);
LABEL_131:
  if (&v96->_stateInputEspressoBuffers != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&v119)
    sub_23A0530A0((uint64_t **)&v96->_stateInputEspressoBuffers, v119, &v120);
  if (&v96->_stateOutputEspressoBuffers != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&v121)
    sub_23A0530A0((uint64_t **)&v96->_stateOutputEspressoBuffers, v121, &v122);
  *(_OWORD *)&v96->_sequenceLength = xmmword_23A0A4460;
  v101 = (float *)operator new(0x177000uLL);
  bzero(v101, 0x177000uLL);
  v102 = v101 + 384000;
  begin = v96->_wordProbs.__begin_;
  if (begin)
  {
    v96->_wordProbs.__end_ = begin;
    operator delete(begin);
    v96->_wordProbs.__begin_ = 0;
    v96->_wordProbs.__end_ = 0;
    v96->_wordProbs.__end_cap_.__value_ = 0;
  }
  v96->_wordProbs.__begin_ = v101;
  v96->_wordProbs.__end_ = v102;
  v96->_wordProbs.__end_cap_.__value_ = v102;
  sub_23A052488((uint64_t)&v117, (char *)v118);
  sub_23A052488((uint64_t)&v119, (char *)v120);
  sub_23A052488((uint64_t)&v121, (char *)v122);
  input_names = 0;
  v42 = (void **)v123;
  if (!v123)
  {
LABEL_138:
    v44 = v141;
    v45 = v108;
    if (v141)
      goto LABEL_139;
LABEL_142:
    if (SHIBYTE(v143) < 0)
      goto LABEL_143;
    goto LABEL_144;
  }
LABEL_29:
  v43 = v124;
  if (v124 == v42)
  {
    v124 = v42;
    operator delete(v42);
    v44 = v141;
    v45 = v108;
    if (!v141)
      goto LABEL_142;
  }
  else
  {
    do
    {
      if (*((char *)v43 - 1) < 0)
        operator delete(*(v43 - 3));
      v43 -= 3;
    }
    while (v43 != v42);
    v124 = v42;
    operator delete(v123);
    v44 = v141;
    v45 = v108;
    if (!v141)
      goto LABEL_142;
  }
LABEL_139:
  p_shared_owners = (unint64_t *)&v44->__shared_owners_;
  do
    v105 = __ldaxr(p_shared_owners);
  while (__stlxr(v105 - 1, p_shared_owners));
  if (v105)
    goto LABEL_142;
  ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
  std::__shared_weak_count::__release_weak(v44);
  if (SHIBYTE(v143) < 0)
LABEL_143:
    operator delete(__dst[0]);
LABEL_144:

  return input_names == 0;
}

- (void)buildNetworkForSequenceLength:(unint64_t)a3 error:(id *)a4
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  int v24;
  char *v25;
  char *v26;
  char *v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  __int128 v42;
  int v43;
  char *v44;
  char *v45;
  char *v46;
  int64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  __int128 v61;
  int v62;
  char *v63;
  char *v64;
  char *v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  __int128 v80;
  int v81;
  uint64_t v82;
  char *v83;
  const char *v84;
  size_t v85;
  void *v86;
  void *v87;
  void **v88;
  __int128 v89;
  char *v90;
  char *v91;
  char *v92;
  int64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  _BYTE *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  _DWORD *v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  _OWORD *v108;
  char *v109;
  uint64_t v110;
  __int128 v111;
  int v112;
  char *v113;
  char *v114;
  char *v115;
  int64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  _DWORD *v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  __int128 *v129;
  uint64_t v130;
  __int128 v131;
  int v132;
  char *v133;
  char *v134;
  char *v135;
  int64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char *v141;
  char *v142;
  _DWORD *v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  char *v149;
  uint64_t v150;
  __int128 v151;
  int v152;
  char *v153;
  char *v154;
  int64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  char *v160;
  char *v161;
  _DWORD *v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  __int128 v170;
  int v171;
  uint64_t v172;
  char *v173;
  std::string::size_type size;
  size_t v175;
  unint64_t v176;
  std::string *v177;
  size_t v178;
  unint64_t v179;
  std::string *v180;
  std::string::size_type v181;
  _BYTE *v182;
  unint64_t v183;
  uint64_t v184;
  _BYTE *v185;
  std::string::size_type v186;
  size_t v187;
  size_t v188;
  unint64_t v189;
  size_t v190;
  unint64_t v191;
  _BYTE *v192;
  size_t v193;
  unint64_t v194;
  _BYTE *v195;
  size_t v196;
  char *v197;
  unint64_t v198;
  uint64_t v199;
  char *v200;
  char *v201;
  unint64_t v202;
  char *v203;
  unint64_t v204;
  void **v205;
  size_t v206;
  unint64_t v207;
  void **v208;
  char *v209;
  char *v210;
  char *v211;
  unint64_t v212;
  uint64_t v213;
  char *v214;
  void *v215;
  char *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  _OWORD *v220;
  __int128 v221;
  int v222;
  char *v223;
  char *v224;
  char *v225;
  int64_t v226;
  uint64_t v227;
  unint64_t v228;
  uint64_t v229;
  unint64_t v230;
  _BYTE *v231;
  char *v232;
  char *v233;
  _DWORD *v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char *v238;
  _OWORD *v239;
  char *v240;
  uint64_t v241;
  __int128 v242;
  int v243;
  int v244;
  unint64_t v245;
  unint64_t v246;
  int v247;
  char *v248;
  char *v249;
  char *v250;
  int64_t v251;
  uint64_t v252;
  unint64_t v253;
  uint64_t v254;
  unint64_t v255;
  char *v256;
  char *v257;
  _DWORD *v258;
  unint64_t v259;
  uint64_t v260;
  uint64_t v261;
  char *v262;
  char *v263;
  char *v264;
  uint64_t v265;
  __int128 v266;
  int v267;
  int v268;
  char *v269;
  char *v270;
  char *v271;
  char *v272;
  int64_t v273;
  uint64_t v274;
  unint64_t v275;
  uint64_t v276;
  unint64_t v277;
  _BYTE *v278;
  char *v279;
  _DWORD *v280;
  unint64_t v281;
  uint64_t v282;
  uint64_t v283;
  char *v284;
  _OWORD *v285;
  char *v286;
  uint64_t v287;
  __int128 v288;
  int v289;
  char *v290;
  uint64_t v291;
  char *v292;
  int64_t v293;
  uint64_t v294;
  unint64_t v295;
  uint64_t v296;
  unint64_t v297;
  char *v298;
  char *v299;
  unint64_t v300;
  uint64_t v301;
  uint64_t v302;
  char *v303;
  char *v304;
  char *v305;
  uint64_t v306;
  __int128 v307;
  int v308;
  std::string::size_type v309;
  size_t v310;
  unint64_t v311;
  std::string *v312;
  size_t v313;
  unint64_t v314;
  std::string *v315;
  std::string::size_type v316;
  _BYTE *v317;
  unint64_t v318;
  uint64_t v319;
  _BYTE *v320;
  std::string::size_type v321;
  size_t v322;
  size_t v323;
  std::string::size_type v324;
  std::string::size_type v325;
  unint64_t v326;
  std::string *v327;
  size_t v328;
  unint64_t v329;
  std::string *v330;
  std::string::size_type v331;
  _BYTE *v332;
  unint64_t v333;
  uint64_t v334;
  void *v335;
  std::string::size_type v336;
  int64_t v337;
  unint64_t v338;
  size_t v339;
  unint64_t v340;
  _BYTE *v341;
  size_t v342;
  unint64_t v343;
  _BYTE *v344;
  _DWORD *v345;
  size_t v346;
  char *v347;
  unint64_t v348;
  uint64_t v349;
  char *v350;
  char *v351;
  char *v352;
  uint64_t v353;
  char v354;
  _OWORD *v355;
  __int128 v356;
  int v357;
  char *v358;
  char *v359;
  char *v360;
  int64_t v361;
  uint64_t v362;
  unint64_t v363;
  uint64_t v364;
  unint64_t v365;
  _BYTE *v366;
  char *v367;
  char *v368;
  _DWORD *v369;
  unint64_t v370;
  uint64_t v371;
  uint64_t v372;
  char *v373;
  _OWORD *v374;
  char *v375;
  uint64_t v376;
  __int128 v377;
  int v378;
  int v379;
  unint64_t v380;
  unint64_t v381;
  int v382;
  char *v383;
  char *v384;
  char *v385;
  int64_t v386;
  uint64_t v387;
  unint64_t v388;
  uint64_t v389;
  unint64_t v390;
  char *v391;
  char *v392;
  _DWORD *v393;
  unint64_t v394;
  uint64_t v395;
  uint64_t v396;
  char *v397;
  char *v398;
  char *v399;
  uint64_t v400;
  __int128 v401;
  int v402;
  int v403;
  char *v404;
  char *v405;
  char *v406;
  char *v407;
  int64_t v408;
  uint64_t v409;
  unint64_t v410;
  uint64_t v411;
  unint64_t v412;
  _BYTE *v413;
  char *v414;
  _DWORD *v415;
  unint64_t v416;
  uint64_t v417;
  uint64_t v418;
  char *v419;
  _OWORD *v420;
  char *v421;
  uint64_t v422;
  __int128 v423;
  int v424;
  char *v425;
  uint64_t v426;
  char *v427;
  int64_t v428;
  uint64_t v429;
  unint64_t v430;
  uint64_t v431;
  unint64_t v432;
  char *v433;
  char *v434;
  unint64_t v435;
  uint64_t v436;
  uint64_t v437;
  char *v438;
  char *v439;
  char *v440;
  uint64_t v441;
  __int128 v442;
  int v443;
  char *v444;
  unint64_t v445;
  size_t v446;
  void *v447;
  std::string::size_type v448;
  char *v449;
  unint64_t v450;
  void *v451;
  void **v452;
  void **v453;
  void *v454;
  char *v455;
  char *v456;
  char *v457;
  int64_t v458;
  uint64_t v459;
  unint64_t v460;
  uint64_t v461;
  unint64_t v462;
  _BYTE *v463;
  char *v464;
  const char *v465;
  unint64_t v466;
  char *v467;
  uint64_t v468;
  char **v469;
  uint64_t v470;
  uint64_t v471;
  _OWORD *v472;
  char *v473;
  uint64_t v474;
  __int128 v475;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v478;
  BOOL v479;
  CSUImageCaptionDecoderAXKVCacheE1Network *v480;
  __int128 *v481;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v482;
  const char *v483;
  uint64_t v484;
  uint64_t v485;
  int blob_shape;
  void **v487;
  void *v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  std::string::size_type v492;
  std::string::size_type v493;
  unint64_t v494;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v495;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v496;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v497;
  void **v498;
  void *v499;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v500;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v501;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v502;
  int left_high;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v504;
  size_t v505;
  size_t v506;
  int v507;
  int v508;
  char *v509;
  _BYTE *v510;
  void *v511;
  char *v512;
  char *v513;
  uint64_t v514;
  char *v515;
  uint64_t v516;
  _BYTE *v517;
  int v518;
  uint64_t v519;
  int v520;
  uint64_t *v521;
  uint64_t v522;
  uint64_t v523;
  char *v524;
  uint64_t v525;
  uint64_t **v526;
  uint64_t **v527;
  uint64_t *v528;
  unint64_t v529;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v530;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v531;
  uint64_t *v532;
  const char *v533;
  uint64_t v534;
  uint64_t v535;
  int v536;
  void *v537;
  const char *v538;
  uint64_t v539;
  uint64_t v540;
  unint64_t v541;
  unint64_t v542;
  unint64_t v543;
  std::string::size_type *p_size;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  std::string::size_type *v548;
  uint64_t v549;
  uint64_t **v550;
  uint64_t **v551;
  uint64_t *v552;
  unint64_t v553;
  uint64_t *v554;
  uint64_t **v555;
  uint64_t *v556;
  uint64_t *v557;
  std::__shared_weak_count *v558;
  uint64_t v559;
  unint64_t *p_shared_owners;
  unint64_t v561;
  std::__shared_weak_count *v562;
  unint64_t *v563;
  unint64_t v564;
  std::__shared_weak_count *v565;
  unint64_t *v566;
  unint64_t v567;
  uint64_t *v568;
  uint64_t *v569;
  uint64_t *v570;
  unsigned __int8 *v571;
  unsigned __int8 *v572;
  std::__shared_weak_count *v573;
  uint64_t v574;
  unint64_t *v575;
  unint64_t v576;
  std::__shared_weak_count *v577;
  unint64_t *v578;
  unint64_t v579;
  std::__shared_weak_count *v580;
  unint64_t *v581;
  unint64_t v582;
  void *v583;
  void *v584;
  uint64_t **p_stateInputEspressoBuffers;
  uint64_t **p_stateOutputEspressoBuffers;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *p_pair1;
  int __val;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *__vala;
  CSUImageCaptionDecoderAXKVCacheE1Network *v591;
  int v592;
  uint64_t v593;
  _BYTE v594[32];
  int v595;
  std::string v596;
  void *v597;
  char *v598;
  char *v599;
  void *v600;
  char *v601;
  char *v602;
  void *v603[2];
  void *v604;
  void *v605;
  char *v606;
  char *v607;
  void *v608;
  char *v609;
  char *v610;
  void *__p[3];
  void *v612;
  void *v613;
  uint64_t v614;
  std::__shared_weak_count *v615;
  uint64_t v616;
  std::string v617;
  _BYTE __dst[24];
  void *v619;
  void *v620;
  char *v621;
  const char *v622;
  char *v623;
  _BYTE v624[15];
  uint64_t v625;

  v592 = a3;
  v625 = *MEMORY[0x24BDAC8D0];
  espresso_plan_build_clean();
  v608 = 0;
  v609 = 0;
  v610 = 0;
  v605 = 0;
  v606 = 0;
  v607 = 0;
  v603[0] = 0;
  v603[1] = 0;
  v604 = 0;
  v600 = 0;
  v601 = 0;
  v602 = 0;
  v597 = 0;
  v598 = 0;
  HIBYTE(__p[2]) = 21;
  v599 = 0;
  strcpy((char *)__p, "att_feats_placeholder");
  v591 = self;
  v603[1] = sub_23A014A80(v603, (uint64_t)__p);
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    v6 = v606;
    v5 = v607;
    if (v606 < v607)
      goto LABEL_3;
LABEL_5:
    v8 = (char *)v605;
    v9 = v6 - (_BYTE *)v605;
    v10 = (v6 - (_BYTE *)v605) >> 2;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62)
      sub_239FEBE68();
    v12 = v5 - (_BYTE *)v605;
    if (v12 >> 1 > v11)
      v11 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      if (v13 >> 62)
        sub_239FF1A44();
      v14 = operator new(4 * v13);
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v10];
    *(_DWORD *)v15 = 512;
    v7 = v15 + 4;
    if (v6 != v8)
    {
      v16 = v6 - v8 - 4;
      if (v16 < 0x2C)
        goto LABEL_880;
      if ((unint64_t)(v6 - v14 - v9) < 0x20)
        goto LABEL_880;
      v17 = (v16 >> 2) + 1;
      v18 = 4 * (v17 & 0x7FFFFFFFFFFFFFF8);
      v19 = &v6[-v18];
      v15 -= v18;
      v20 = &v14[v9 - 16];
      v21 = v6 - 16;
      v22 = v17 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v23 = *(_OWORD *)v21;
        *(v20 - 1) = *((_OWORD *)v21 - 1);
        *v20 = v23;
        v20 -= 2;
        v21 -= 32;
        v22 -= 8;
      }
      while (v22);
      v6 = v19;
      if (v17 != (v17 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_880:
        do
        {
          v24 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v15 - 1) = v24;
          v15 -= 4;
        }
        while (v6 != v8);
      }
    }
    v605 = v15;
    v606 = v7;
    v607 = &v14[4 * v13];
    if (v8)
      operator delete(v8);
    goto LABEL_24;
  }
  v6 = v606;
  v5 = v607;
  if (v606 >= v607)
    goto LABEL_5;
LABEL_3:
  *(_DWORD *)v6 = 512;
  v7 = v6 + 4;
LABEL_24:
  v606 = v7;
  v25 = v609;
  if (v609 >= v610)
  {
    v27 = (char *)v608;
    v28 = v609 - (_BYTE *)v608;
    v29 = (v609 - (_BYTE *)v608) >> 2;
    v30 = v29 + 1;
    if ((unint64_t)(v29 + 1) >> 62)
      sub_239FEBE68();
    v31 = v610 - (_BYTE *)v608;
    if ((v610 - (_BYTE *)v608) >> 1 > v30)
      v30 = v31 >> 1;
    if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL)
      v32 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v32 = v30;
    if (v32)
    {
      if (v32 >> 62)
        sub_239FF1A44();
      v33 = (char *)operator new(4 * v32);
    }
    else
    {
      v33 = 0;
    }
    v34 = &v33[4 * v29];
    *(_DWORD *)v34 = 144;
    v26 = v34 + 4;
    if (v25 != v27)
    {
      v35 = v25 - v27 - 4;
      if (v35 < 0x2C)
        goto LABEL_881;
      if ((unint64_t)(v25 - v33 - v28) < 0x20)
        goto LABEL_881;
      v36 = (v35 >> 2) + 1;
      v37 = 4 * (v36 & 0x7FFFFFFFFFFFFFF8);
      v38 = &v25[-v37];
      v34 -= v37;
      v39 = &v33[v28 - 16];
      v40 = v25 - 16;
      v41 = v36 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v42 = *(_OWORD *)v40;
        *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
        *(_OWORD *)v39 = v42;
        v39 -= 32;
        v40 -= 32;
        v41 -= 8;
      }
      while (v41);
      v25 = v38;
      if (v36 != (v36 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_881:
        do
        {
          v43 = *((_DWORD *)v25 - 1);
          v25 -= 4;
          *((_DWORD *)v34 - 1) = v43;
          v34 -= 4;
        }
        while (v25 != v27);
      }
    }
    v608 = v34;
    v609 = v26;
    v610 = &v33[4 * v32];
    if (v27)
      operator delete(v27);
  }
  else
  {
    *(_DWORD *)v609 = 144;
    v26 = v25 + 4;
  }
  v609 = v26;
  v44 = v601;
  if (v601 >= v602)
  {
    v46 = (char *)v600;
    v47 = v601 - (_BYTE *)v600;
    v48 = (v601 - (_BYTE *)v600) >> 2;
    v49 = v48 + 1;
    if ((unint64_t)(v48 + 1) >> 62)
      sub_239FEBE68();
    v50 = v602 - (_BYTE *)v600;
    if ((v602 - (_BYTE *)v600) >> 1 > v49)
      v49 = v50 >> 1;
    if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL)
      v51 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v51 = v49;
    if (v51)
    {
      if (v51 >> 62)
        sub_239FF1A44();
      v52 = (char *)operator new(4 * v51);
    }
    else
    {
      v52 = 0;
    }
    v53 = &v52[4 * v48];
    *(_DWORD *)v53 = 1;
    v45 = v53 + 4;
    if (v44 != v46)
    {
      v54 = v44 - v46 - 4;
      if (v54 < 0x2C)
        goto LABEL_882;
      if ((unint64_t)(v44 - v52 - v47) < 0x20)
        goto LABEL_882;
      v55 = (v54 >> 2) + 1;
      v56 = 4 * (v55 & 0x7FFFFFFFFFFFFFF8);
      v57 = &v44[-v56];
      v53 -= v56;
      v58 = &v52[v47 - 16];
      v59 = v44 - 16;
      v60 = v55 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v61 = *(_OWORD *)v59;
        *((_OWORD *)v58 - 1) = *((_OWORD *)v59 - 1);
        *(_OWORD *)v58 = v61;
        v58 -= 32;
        v59 -= 32;
        v60 -= 8;
      }
      while (v60);
      v44 = v57;
      if (v55 != (v55 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_882:
        do
        {
          v62 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v53 - 1) = v62;
          v53 -= 4;
        }
        while (v44 != v46);
      }
    }
    v600 = v53;
    v601 = v45;
    v602 = &v52[4 * v51];
    if (v46)
      operator delete(v46);
  }
  else
  {
    *(_DWORD *)v601 = 1;
    v45 = v44 + 4;
  }
  v601 = v45;
  v63 = v598;
  if (v598 >= v599)
  {
    v65 = (char *)v597;
    v66 = v598 - (_BYTE *)v597;
    v67 = (v598 - (_BYTE *)v597) >> 2;
    v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 62)
      sub_239FEBE68();
    v69 = v599 - (_BYTE *)v597;
    if ((v599 - (_BYTE *)v597) >> 1 > v68)
      v68 = v69 >> 1;
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFFCLL)
      v70 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v70 = v68;
    if (v70)
    {
      if (v70 >> 62)
        sub_239FF1A44();
      v71 = (char *)operator new(4 * v70);
    }
    else
    {
      v71 = 0;
    }
    v72 = &v71[4 * v67];
    *(_DWORD *)v72 = 1;
    v64 = v72 + 4;
    if (v63 != v65)
    {
      v73 = v63 - v65 - 4;
      if (v73 < 0x2C)
        goto LABEL_883;
      if ((unint64_t)(v63 - v71 - v66) < 0x20)
        goto LABEL_883;
      v74 = (v73 >> 2) + 1;
      v75 = 4 * (v74 & 0x7FFFFFFFFFFFFFF8);
      v76 = &v63[-v75];
      v72 -= v75;
      v77 = &v71[v66 - 16];
      v78 = v63 - 16;
      v79 = v74 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v80 = *(_OWORD *)v78;
        *((_OWORD *)v77 - 1) = *((_OWORD *)v78 - 1);
        *(_OWORD *)v77 = v80;
        v77 -= 32;
        v78 -= 32;
        v79 -= 8;
      }
      while (v79);
      v63 = v76;
      if (v74 != (v74 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_883:
        do
        {
          v81 = *((_DWORD *)v63 - 1);
          v63 -= 4;
          *((_DWORD *)v72 - 1) = v81;
          v72 -= 4;
        }
        while (v63 != v65);
      }
    }
    v597 = v72;
    v598 = v64;
    v599 = &v71[4 * v70];
    if (v65)
      operator delete(v65);
  }
  else
  {
    *(_DWORD *)v598 = 1;
    v64 = v63 + 4;
  }
  v82 = 0;
  v598 = v64;
  do
  {
    v84 = off_250B0E628[v82];
    v85 = strlen(v84);
    if (v85 > 0x7FFFFFFFFFFFFFF7)
      sub_239FEBDE0();
    v86 = (void *)v85;
    if (v85 >= 0x17)
    {
      v101 = (v85 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v85 | 7) != 0x17)
        v101 = v85 | 7;
      v102 = v101 + 1;
      v87 = operator new(v101 + 1);
      __p[1] = v86;
      __p[2] = (void *)(v102 | 0x8000000000000000);
      __p[0] = v87;
    }
    else
    {
      HIBYTE(__p[2]) = v85;
      v87 = __p;
      if (!v85)
      {
        LOBYTE(__p[0]) = 0;
        v88 = (void **)v603[1];
        if (v603[1] < v604)
          goto LABEL_94;
        goto LABEL_109;
      }
    }
    memmove(v87, v84, (size_t)v86);
    *((_BYTE *)v86 + (_QWORD)v87) = 0;
    v88 = (void **)v603[1];
    if (v603[1] < v604)
    {
LABEL_94:
      v89 = *(_OWORD *)__p;
      v88[2] = __p[2];
      *(_OWORD *)v88 = v89;
      v603[1] = v88 + 3;
      v91 = v609;
      v90 = v610;
      if (v609 < v610)
        goto LABEL_111;
      goto LABEL_95;
    }
LABEL_109:
    v603[1] = sub_23A014A80(v603, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      v91 = v609;
      v90 = v610;
      if (v609 < v610)
      {
LABEL_111:
        *(_DWORD *)v91 = 1;
        v100 = v91 + 4;
        goto LABEL_123;
      }
    }
    else
    {
      v91 = v609;
      v90 = v610;
      if (v609 < v610)
        goto LABEL_111;
    }
LABEL_95:
    v92 = (char *)v608;
    v93 = v91 - (_BYTE *)v608;
    v94 = (v91 - (_BYTE *)v608) >> 2;
    v95 = v94 + 1;
    if ((unint64_t)(v94 + 1) >> 62)
      sub_239FEBE68();
    v96 = v90 - (_BYTE *)v608;
    if (v96 >> 1 > v95)
      v95 = v96 >> 1;
    if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFFCLL)
      v97 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v97 = v95;
    if (v97)
    {
      if (v97 >> 62)
        sub_239FF1A44();
      v98 = operator new(4 * v97);
      v99 = &v98[4 * v94];
      *(_DWORD *)v99 = 1;
      v100 = v99 + 4;
      if (v91 == v92)
        goto LABEL_121;
LABEL_115:
      v104 = v91 - 4 - v92;
      if (v104 < 0x2C)
        goto LABEL_884;
      if ((unint64_t)(v91 - &v98[v93]) < 0x20)
        goto LABEL_884;
      v105 = (v104 >> 2) + 1;
      v106 = 4 * (v105 & 0x7FFFFFFFFFFFFFF8);
      v107 = &v91[-v106];
      v99 -= v106;
      v108 = &v98[v93 - 16];
      v109 = v91 - 16;
      v110 = v105 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v111 = *(_OWORD *)v109;
        *(v108 - 1) = *((_OWORD *)v109 - 1);
        *v108 = v111;
        v108 -= 2;
        v109 -= 32;
        v110 -= 8;
      }
      while (v110);
      v91 = v107;
      if (v105 != (v105 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_884:
        do
        {
          v112 = *((_DWORD *)v91 - 1);
          v91 -= 4;
          *((_DWORD *)v99 - 1) = v112;
          v99 -= 4;
        }
        while (v91 != v92);
      }
      goto LABEL_121;
    }
    v98 = 0;
    v99 = (char *)(4 * v94);
    v103 = (_DWORD *)(4 * v94);
    *v103 = 1;
    v100 = (char *)(v103 + 1);
    if (v91 != v92)
      goto LABEL_115;
LABEL_121:
    v608 = v99;
    v609 = v100;
    v610 = &v98[4 * v97];
    if (v92)
      operator delete(v92);
LABEL_123:
    v609 = v100;
    v113 = v606;
    if (v606 < v607)
    {
      *(_DWORD *)v606 = 1;
      v114 = v113 + 4;
      goto LABEL_144;
    }
    v115 = (char *)v605;
    v116 = v606 - (_BYTE *)v605;
    v117 = (v606 - (_BYTE *)v605) >> 2;
    v118 = v117 + 1;
    if ((unint64_t)(v117 + 1) >> 62)
      sub_239FEBE68();
    v119 = v607 - (_BYTE *)v605;
    if ((v607 - (_BYTE *)v605) >> 1 > v118)
      v118 = v119 >> 1;
    if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFFCLL)
      v120 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v120 = v118;
    if (v120)
    {
      if (v120 >> 62)
        sub_239FF1A44();
      v121 = (char *)operator new(4 * v120);
      v122 = &v121[4 * v117];
      *(_DWORD *)v122 = 1;
      v114 = v122 + 4;
      if (v113 == v115)
        goto LABEL_142;
LABEL_136:
      v124 = v113 - 4 - v115;
      if (v124 < 0x2C)
        goto LABEL_885;
      if ((unint64_t)(v113 - &v121[v116]) < 0x20)
        goto LABEL_885;
      v125 = (v124 >> 2) + 1;
      v126 = 4 * (v125 & 0x7FFFFFFFFFFFFFF8);
      v127 = &v113[-v126];
      v122 -= v126;
      v128 = &v121[v116 - 16];
      v129 = (__int128 *)(v113 - 16);
      v130 = v125 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v131 = *v129;
        *((_OWORD *)v128 - 1) = *(v129 - 1);
        *(_OWORD *)v128 = v131;
        v128 -= 32;
        v129 -= 2;
        v130 -= 8;
      }
      while (v130);
      v113 = v127;
      if (v125 != (v125 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_885:
        do
        {
          v132 = *((_DWORD *)v113 - 1);
          v113 -= 4;
          *((_DWORD *)v122 - 1) = v132;
          v122 -= 4;
        }
        while (v113 != v115);
      }
      goto LABEL_142;
    }
    v121 = 0;
    v122 = (char *)(4 * v117);
    v123 = (_DWORD *)(4 * v117);
    *v123 = 1;
    v114 = (char *)(v123 + 1);
    if (v113 != v115)
      goto LABEL_136;
LABEL_142:
    v605 = v122;
    v606 = v114;
    v607 = &v121[4 * v120];
    if (v115)
      operator delete(v115);
LABEL_144:
    v606 = v114;
    v133 = v601;
    if (v601 < v602)
    {
      *(_DWORD *)v601 = 1;
      v134 = v133 + 4;
      goto LABEL_165;
    }
    v135 = (char *)v600;
    v136 = v601 - (_BYTE *)v600;
    v137 = (v601 - (_BYTE *)v600) >> 2;
    v138 = v137 + 1;
    if ((unint64_t)(v137 + 1) >> 62)
      sub_239FEBE68();
    v139 = v602 - (_BYTE *)v600;
    if ((v602 - (_BYTE *)v600) >> 1 > v138)
      v138 = v139 >> 1;
    if ((unint64_t)v139 >= 0x7FFFFFFFFFFFFFFCLL)
      v140 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v140 = v138;
    if (v140)
    {
      if (v140 >> 62)
        sub_239FF1A44();
      v141 = (char *)operator new(4 * v140);
      v142 = &v141[4 * v137];
      *(_DWORD *)v142 = 1;
      v134 = v142 + 4;
      if (v133 == v135)
        goto LABEL_163;
LABEL_157:
      v144 = v133 - 4 - v135;
      if (v144 < 0x2C)
        goto LABEL_886;
      if ((unint64_t)(v133 - &v141[v136]) < 0x20)
        goto LABEL_886;
      v145 = (v144 >> 2) + 1;
      v146 = 4 * (v145 & 0x7FFFFFFFFFFFFFF8);
      v147 = &v133[-v146];
      v142 -= v146;
      v148 = &v141[v136 - 16];
      v149 = v133 - 16;
      v150 = v145 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v151 = *(_OWORD *)v149;
        *((_OWORD *)v148 - 1) = *((_OWORD *)v149 - 1);
        *(_OWORD *)v148 = v151;
        v148 -= 32;
        v149 -= 32;
        v150 -= 8;
      }
      while (v150);
      v133 = v147;
      if (v145 != (v145 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_886:
        do
        {
          v152 = *((_DWORD *)v133 - 1);
          v133 -= 4;
          *((_DWORD *)v142 - 1) = v152;
          v142 -= 4;
        }
        while (v133 != v135);
      }
      goto LABEL_163;
    }
    v141 = 0;
    v142 = (char *)(4 * v137);
    v143 = (_DWORD *)(4 * v137);
    *v143 = 1;
    v134 = (char *)(v143 + 1);
    if (v133 != v135)
      goto LABEL_157;
LABEL_163:
    v600 = v142;
    v601 = v134;
    v602 = &v141[4 * v140];
    if (v135)
      operator delete(v135);
LABEL_165:
    v601 = v134;
    v153 = v598;
    if (v598 < v599)
    {
      *(_DWORD *)v598 = 1;
      v83 = v153 + 4;
      goto LABEL_89;
    }
    v154 = (char *)v597;
    v155 = v598 - (_BYTE *)v597;
    v156 = (v598 - (_BYTE *)v597) >> 2;
    v157 = v156 + 1;
    if ((unint64_t)(v156 + 1) >> 62)
      sub_239FEBE68();
    v158 = v599 - (_BYTE *)v597;
    if ((v599 - (_BYTE *)v597) >> 1 > v157)
      v157 = v158 >> 1;
    if ((unint64_t)v158 >= 0x7FFFFFFFFFFFFFFCLL)
      v159 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v159 = v157;
    if (v159)
    {
      if (v159 >> 62)
        sub_239FF1A44();
      v160 = (char *)operator new(4 * v159);
      v161 = &v160[4 * v156];
      *(_DWORD *)v161 = 1;
      v83 = v161 + 4;
      if (v153 == v154)
        goto LABEL_183;
LABEL_177:
      v163 = v153 - 4 - v154;
      if (v163 < 0x2C)
        goto LABEL_887;
      if ((unint64_t)(v153 - &v160[v155]) < 0x20)
        goto LABEL_887;
      v164 = (v163 >> 2) + 1;
      v165 = 4 * (v164 & 0x7FFFFFFFFFFFFFF8);
      v166 = &v153[-v165];
      v161 -= v165;
      v167 = &v160[v155 - 16];
      v168 = v153 - 16;
      v169 = v164 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v170 = *(_OWORD *)v168;
        *((_OWORD *)v167 - 1) = *((_OWORD *)v168 - 1);
        *(_OWORD *)v167 = v170;
        v167 -= 32;
        v168 -= 32;
        v169 -= 8;
      }
      while (v169);
      v153 = v166;
      if (v164 != (v164 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_887:
        do
        {
          v171 = *((_DWORD *)v153 - 1);
          v153 -= 4;
          *((_DWORD *)v161 - 1) = v171;
          v161 -= 4;
        }
        while (v153 != v154);
      }
      goto LABEL_183;
    }
    v160 = 0;
    v161 = (char *)(4 * v156);
    v162 = (_DWORD *)(4 * v156);
    *v162 = 1;
    v83 = (char *)(v162 + 1);
    if (v153 != v154)
      goto LABEL_177;
LABEL_183:
    v597 = v161;
    v598 = v83;
    v599 = &v160[4 * v159];
    if (v154)
      operator delete(v154);
LABEL_89:
    v598 = v83;
    ++v82;
  }
  while (v82 != 4);
  for (__val = 0; __val != 4; ++__val)
  {
    v172 = 0;
    v621 = "self_attention";
    v622 = "vanilla_attention";
    do
    {
      v173 = (&v621)[v172];
      std::to_string(&v617, __val);
      size = HIBYTE(v617.__r_.__value_.__r.__words[2]);
      if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v175 = 22;
      else
        v175 = (v617.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = v617.__r_.__value_.__l.__size_;
      if (v175 == size)
      {
        if (v175 == 0x7FFFFFFFFFFFFFF6)
          sub_239FEBDE0();
        v176 = v175 + 1;
        if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v177 = &v617;
        else
          v177 = (std::string *)v617.__r_.__value_.__r.__words[0];
        v178 = 0x7FFFFFFFFFFFFFF7;
        if (v175 < 0x3FFFFFFFFFFFFFF3)
        {
          v179 = 2 * v175;
          if (v176 > 2 * v175)
            v179 = v175 + 1;
          if (v179 >= 0x17)
          {
            v183 = (v179 & 0xFFFFFFFFFFFFFFF8) + 8;
            v184 = v179 | 7;
            if (v184 == 23)
              v184 = v183;
            v178 = v184 + 1;
          }
          else
          {
            v178 = 23;
          }
        }
        v185 = operator new(v178);
        v186 = (std::string::size_type)v185;
        if (v175)
        {
          memmove(v185, v177, v175);
          *(_BYTE *)(v186 + v175) = 47;
          if (v175 == 22)
            goto LABEL_217;
        }
        else
        {
          *v185 = 47;
        }
        operator delete(v177);
LABEL_217:
        v617.__r_.__value_.__l.__size_ = v175 + 1;
        v617.__r_.__value_.__r.__words[2] = v178 | 0x8000000000000000;
        v617.__r_.__value_.__r.__words[0] = v186;
        v182 = (_BYTE *)(v186 + v176);
        goto LABEL_218;
      }
      v180 = &v617;
      if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v180 = (std::string *)v617.__r_.__value_.__r.__words[0];
      v180->__r_.__value_.__s.__data_[size] = 47;
      v181 = size + 1;
      if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
        v617.__r_.__value_.__l.__size_ = v181;
      else
        *((_BYTE *)&v617.__r_.__value_.__s + 23) = v181 & 0x7F;
      v182 = (char *)v180 + v181;
LABEL_218:
      *v182 = 0;
      *(std::string *)v594 = v617;
      memset(&v617, 0, sizeof(v617));
      v187 = strlen(v173);
      v188 = v187;
      if (v594[23] >= 0)
        v189 = 22;
      else
        v189 = (*(_QWORD *)&v594[16] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v594[23] >= 0)
        v190 = v594[23];
      else
        v190 = *(_QWORD *)&v594[8];
      if (v189 - v190 >= v187)
      {
        if (!v187)
          goto LABEL_250;
        if (v594[23] >= 0)
          v195 = v594;
        else
          v195 = *(_BYTE **)v594;
        memmove(&v195[v190], v173, v187);
        v196 = v190 + v188;
        if ((v594[23] & 0x80000000) != 0)
          *(_QWORD *)&v594[8] = v190 + v188;
        else
          v594[23] = v196 & 0x7F;
        v197 = &v195[v196];
      }
      else
      {
        v191 = v190 + v187;
        if (0x7FFFFFFFFFFFFFF6 - v189 < v190 + v187 - v189)
          sub_239FEBDE0();
        if (v594[23] >= 0)
          v192 = v594;
        else
          v192 = *(_BYTE **)v594;
        v193 = 0x7FFFFFFFFFFFFFF7;
        if (v189 < 0x3FFFFFFFFFFFFFF3)
        {
          v194 = 2 * v189;
          if (v191 > 2 * v189)
            v194 = v190 + v187;
          if (v194 >= 0x17)
          {
            v198 = (v194 & 0xFFFFFFFFFFFFFFF8) + 8;
            v199 = v194 | 7;
            if (v199 == 23)
              v199 = v198;
            v193 = v199 + 1;
          }
          else
          {
            v193 = 23;
          }
        }
        v200 = (char *)operator new(v193);
        v201 = v200;
        if (v190)
          memmove(v200, v192, v190);
        memcpy(&v201[v190], v173, v188);
        if (v189 != 22)
          operator delete(v192);
        *(_QWORD *)&v594[8] = v190 + v188;
        *(_QWORD *)&v594[16] = v193 | 0x8000000000000000;
        *(_QWORD *)v594 = v201;
        v197 = &v201[v191];
      }
      *v197 = 0;
LABEL_250:
      __p[2] = *(void **)&v594[16];
      *(_OWORD *)__p = *(_OWORD *)v594;
      memset(v594, 0, 24);
      if (SHIBYTE(__p[2]) >= 0)
        v202 = 22;
      else
        v202 = ((unint64_t)__p[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (SHIBYTE(__p[2]) >= 0)
        v203 = (char *)((unint64_t)__p[2] >> 56);
      else
        v203 = (char *)__p[1];
      if (v202 - (unint64_t)v203 >= 7)
      {
        v208 = __p;
        if (SHIBYTE(__p[2]) < 0)
          v208 = (void **)__p[0];
        v209 = &v203[(_QWORD)v208];
        *(_DWORD *)(v209 + 3) = 1852399475;
        *(_DWORD *)v209 = 1935633247;
        v210 = v203 + 7;
        if (SHIBYTE(__p[2]) < 0)
          __p[1] = v203 + 7;
        else
          HIBYTE(__p[2]) = v210 & 0x7F;
        v211 = &v210[(_QWORD)v208];
      }
      else
      {
        v204 = (unint64_t)(v203 + 7);
        if (0x7FFFFFFFFFFFFFF6 - v202 < (unint64_t)&v203[-v202 + 7])
          sub_239FEBDE0();
        if (SHIBYTE(__p[2]) >= 0)
          v205 = __p;
        else
          v205 = (void **)__p[0];
        v206 = 0x7FFFFFFFFFFFFFF7;
        if (v202 < 0x3FFFFFFFFFFFFFF3)
        {
          v207 = 2 * v202;
          if (v204 > 2 * v202)
            v207 = (unint64_t)(v203 + 7);
          if (v207 >= 0x17)
          {
            v212 = (v207 & 0xFFFFFFFFFFFFFFF8) + 8;
            v213 = v207 | 7;
            if (v213 == 23)
              v213 = v212;
            v206 = v213 + 1;
          }
          else
          {
            v206 = 23;
          }
        }
        v214 = (char *)operator new(v206);
        v215 = v214;
        if (v203)
          memmove(v214, v205, (size_t)v203);
        v216 = &v203[(_QWORD)v215];
        *(_DWORD *)(v216 + 3) = 1852399475;
        *(_DWORD *)v216 = 1935633247;
        if (v202 != 22)
          operator delete(v205);
        __p[1] = v203 + 7;
        __p[2] = (void *)(v206 | 0x8000000000000000);
        __p[0] = v215;
        v211 = (char *)v215 + v204;
      }
      *v211 = 0;
      *(_OWORD *)__dst = *(_OWORD *)__p;
      *(void **)&__dst[16] = __p[2];
      memset(__p, 0, sizeof(__p));
      if ((v594[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v594);
        if ((SHIBYTE(v617.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_282;
      }
      else if ((SHIBYTE(v617.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_282;
      }
      operator delete(v617.__r_.__value_.__l.__data_);
LABEL_282:
      if (espresso_network_query_blob_dimensions())
        goto LABEL_596;
      v220 = v603[1];
      if (v603[1] >= v604)
      {
        v603[1] = sub_23A051B5C((char **)v603, (uint64_t)__dst);
        v222 = (int)__p[0];
        v224 = v601;
        v223 = v602;
        if (v601 < v602)
          goto LABEL_297;
      }
      else if ((__dst[23] & 0x80000000) != 0)
      {
        sub_239FF1F64((_BYTE *)v603[1], *(void **)__dst, *(unint64_t *)&__dst[8]);
        v603[1] = (char *)v220 + 24;
        v222 = (int)__p[0];
        v224 = v601;
        v223 = v602;
        if (v601 < v602)
        {
LABEL_297:
          *(_DWORD *)v224 = v222;
          v233 = v224 + 4;
          goto LABEL_311;
        }
      }
      else
      {
        v221 = *(_OWORD *)__dst;
        *((_QWORD *)v603[1] + 2) = *(_QWORD *)&__dst[16];
        *v220 = v221;
        v603[1] = (char *)v220 + 24;
        v222 = (int)__p[0];
        v224 = v601;
        v223 = v602;
        if (v601 < v602)
          goto LABEL_297;
      }
      v225 = (char *)v600;
      v226 = v224 - (_BYTE *)v600;
      v227 = (v224 - (_BYTE *)v600) >> 2;
      v228 = v227 + 1;
      if ((unint64_t)(v227 + 1) >> 62)
        sub_239FEBE68();
      v229 = v223 - (_BYTE *)v600;
      if (v229 >> 1 > v228)
        v228 = v229 >> 1;
      if ((unint64_t)v229 >= 0x7FFFFFFFFFFFFFFCLL)
        v230 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v230 = v228;
      if (v230)
      {
        if (v230 >> 62)
          sub_239FF1A44();
        v231 = operator new(4 * v230);
        v232 = &v231[4 * v227];
        *(_DWORD *)v232 = v222;
        v233 = v232 + 4;
        if (v224 == v225)
          goto LABEL_309;
LABEL_303:
        v235 = v224 - 4 - v225;
        if (v235 < 0x2C)
          goto LABEL_888;
        if ((unint64_t)(v224 - &v231[v226]) < 0x20)
          goto LABEL_888;
        v236 = (v235 >> 2) + 1;
        v237 = 4 * (v236 & 0x7FFFFFFFFFFFFFF8);
        v238 = &v224[-v237];
        v232 -= v237;
        v239 = &v231[v226 - 16];
        v240 = v224 - 16;
        v241 = v236 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v242 = *(_OWORD *)v240;
          *(v239 - 1) = *((_OWORD *)v240 - 1);
          *v239 = v242;
          v239 -= 2;
          v240 -= 32;
          v241 -= 8;
        }
        while (v241);
        v224 = v238;
        if (v236 != (v236 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_888:
          do
          {
            v243 = *((_DWORD *)v224 - 1);
            v224 -= 4;
            *((_DWORD *)v232 - 1) = v243;
            v232 -= 4;
          }
          while (v224 != v225);
        }
        goto LABEL_309;
      }
      v231 = 0;
      v232 = (char *)(4 * v227);
      v234 = (_DWORD *)(4 * v227);
      *v234 = v222;
      v233 = (char *)(v234 + 1);
      if (v224 != v225)
        goto LABEL_303;
LABEL_309:
      v600 = v232;
      v601 = v233;
      v602 = &v231[4 * v230];
      if (v225)
        operator delete(v225);
LABEL_311:
      v601 = v233;
      v594[23] = 17;
      strcpy(v594, "vanilla_attention");
      v244 = v592;
      if (strlen(v173) == 17)
      {
        v245 = bswap64(*(unint64_t *)v594);
        v246 = bswap64(*(_QWORD *)v173);
        if (v245 == v246
          && (v245 = bswap64(*(unint64_t *)&v594[8]), v246 = bswap64(*((_QWORD *)v173 + 1)), v245 == v246))
        {
          v247 = v594[16] - v173[16];
        }
        else if (v245 < v246)
        {
          v247 = -1;
        }
        else
        {
          v247 = 1;
        }
        if (v247)
          v244 = v592;
        else
          v244 = 0;
      }
      v248 = v598;
      if (v598 < v599)
      {
        *(_DWORD *)v598 = v244;
        v249 = v248 + 4;
        goto LABEL_342;
      }
      v250 = (char *)v597;
      v251 = v598 - (_BYTE *)v597;
      v252 = (v598 - (_BYTE *)v597) >> 2;
      v253 = v252 + 1;
      if ((unint64_t)(v252 + 1) >> 62)
        sub_239FEBE68();
      v254 = v599 - (_BYTE *)v597;
      if ((v599 - (_BYTE *)v597) >> 1 > v253)
        v253 = v254 >> 1;
      if ((unint64_t)v254 >= 0x7FFFFFFFFFFFFFFCLL)
        v255 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v255 = v253;
      if (v255)
      {
        if (v255 >> 62)
          sub_239FF1A44();
        v256 = (char *)operator new(4 * v255);
        v257 = &v256[4 * v252];
        *(_DWORD *)v257 = v244;
        v249 = v257 + 4;
        if (v248 == v250)
          goto LABEL_340;
LABEL_334:
        v259 = v248 - 4 - v250;
        if (v259 < 0x2C)
          goto LABEL_889;
        if ((unint64_t)(v248 - &v256[v251]) < 0x20)
          goto LABEL_889;
        v260 = (v259 >> 2) + 1;
        v261 = 4 * (v260 & 0x7FFFFFFFFFFFFFF8);
        v262 = &v248[-v261];
        v257 -= v261;
        v263 = &v256[v251 - 16];
        v264 = v248 - 16;
        v265 = v260 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v266 = *(_OWORD *)v264;
          *((_OWORD *)v263 - 1) = *((_OWORD *)v264 - 1);
          *(_OWORD *)v263 = v266;
          v263 -= 32;
          v264 -= 32;
          v265 -= 8;
        }
        while (v265);
        v248 = v262;
        if (v260 != (v260 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_889:
          do
          {
            v267 = *((_DWORD *)v248 - 1);
            v248 -= 4;
            *((_DWORD *)v257 - 1) = v267;
            v257 -= 4;
          }
          while (v248 != v250);
        }
        goto LABEL_340;
      }
      v256 = 0;
      v257 = (char *)(4 * v252);
      v258 = (_DWORD *)(4 * v252);
      *v258 = v244;
      v249 = (char *)(v258 + 1);
      if (v248 != v250)
        goto LABEL_334;
LABEL_340:
      v597 = v257;
      v598 = v249;
      v599 = &v256[4 * v255];
      if (v250)
        operator delete(v250);
LABEL_342:
      v598 = v249;
      if ((v594[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v594);
        v268 = (int)__p[2];
        v270 = v609;
        v269 = v610;
        if (v609 < v610)
        {
LABEL_344:
          *(_DWORD *)v270 = v268;
          v271 = v270 + 4;
          goto LABEL_365;
        }
      }
      else
      {
        v268 = (int)__p[2];
        v270 = v609;
        v269 = v610;
        if (v609 < v610)
          goto LABEL_344;
      }
      v272 = (char *)v608;
      v273 = v270 - (_BYTE *)v608;
      v274 = (v270 - (_BYTE *)v608) >> 2;
      v275 = v274 + 1;
      if ((unint64_t)(v274 + 1) >> 62)
        sub_239FEBE68();
      v276 = v269 - (_BYTE *)v608;
      if (v276 >> 1 > v275)
        v275 = v276 >> 1;
      if ((unint64_t)v276 >= 0x7FFFFFFFFFFFFFFCLL)
        v277 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v277 = v275;
      if (v277)
      {
        if (v277 >> 62)
          sub_239FF1A44();
        v278 = operator new(4 * v277);
        v279 = &v278[4 * v274];
        *(_DWORD *)v279 = v268;
        v271 = v279 + 4;
        if (v270 == v272)
          goto LABEL_363;
LABEL_357:
        v281 = v270 - 4 - v272;
        if (v281 < 0x2C)
          goto LABEL_890;
        if ((unint64_t)(v270 - &v278[v273]) < 0x20)
          goto LABEL_890;
        v282 = (v281 >> 2) + 1;
        v283 = 4 * (v282 & 0x7FFFFFFFFFFFFFF8);
        v284 = &v270[-v283];
        v279 -= v283;
        v285 = &v278[v273 - 16];
        v286 = v270 - 16;
        v287 = v282 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v288 = *(_OWORD *)v286;
          *(v285 - 1) = *((_OWORD *)v286 - 1);
          *v285 = v288;
          v285 -= 2;
          v286 -= 32;
          v287 -= 8;
        }
        while (v287);
        v270 = v284;
        if (v282 != (v282 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_890:
          do
          {
            v289 = *((_DWORD *)v270 - 1);
            v270 -= 4;
            *((_DWORD *)v279 - 1) = v289;
            v279 -= 4;
          }
          while (v270 != v272);
        }
        goto LABEL_363;
      }
      v278 = 0;
      v279 = (char *)(4 * v274);
      v280 = (_DWORD *)(4 * v274);
      *v280 = v268;
      v271 = (char *)(v280 + 1);
      if (v270 != v272)
        goto LABEL_357;
LABEL_363:
      v608 = v279;
      v609 = v271;
      v610 = &v278[4 * v277];
      if (v272)
        operator delete(v272);
LABEL_365:
      v609 = v271;
      v290 = v606;
      if (v606 < v607)
      {
        *(_DWORD *)v606 = 1;
        v291 = (uint64_t)(v290 + 4);
        goto LABEL_386;
      }
      v292 = (char *)v605;
      v293 = v606 - (_BYTE *)v605;
      v294 = (v606 - (_BYTE *)v605) >> 2;
      v295 = v294 + 1;
      if ((unint64_t)(v294 + 1) >> 62)
        sub_239FEBE68();
      v296 = v607 - (_BYTE *)v605;
      if ((v607 - (_BYTE *)v605) >> 1 > v295)
        v295 = v296 >> 1;
      if ((unint64_t)v296 >= 0x7FFFFFFFFFFFFFFCLL)
        v297 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v297 = v295;
      if (v297)
      {
        if (v297 >> 62)
          sub_239FF1A44();
        v298 = (char *)operator new(4 * v297);
        v299 = &v298[4 * v294];
        *(_DWORD *)v299 = 1;
        v291 = (uint64_t)(v299 + 4);
        if (v290 == v292)
          goto LABEL_384;
LABEL_378:
        v300 = v290 - 4 - v292;
        if (v300 < 0x2C)
          goto LABEL_891;
        if ((unint64_t)(v290 - &v298[v293]) < 0x20)
          goto LABEL_891;
        v301 = (v300 >> 2) + 1;
        v302 = 4 * (v301 & 0x7FFFFFFFFFFFFFF8);
        v303 = &v290[-v302];
        v299 -= v302;
        v304 = &v298[v293 - 16];
        v305 = v290 - 16;
        v306 = v301 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v307 = *(_OWORD *)v305;
          *((_OWORD *)v304 - 1) = *((_OWORD *)v305 - 1);
          *(_OWORD *)v304 = v307;
          v304 -= 32;
          v305 -= 32;
          v306 -= 8;
        }
        while (v306);
        v290 = v303;
        if (v301 != (v301 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_891:
          do
          {
            v308 = *((_DWORD *)v290 - 1);
            v290 -= 4;
            *((_DWORD *)v299 - 1) = v308;
            v299 -= 4;
          }
          while (v290 != v292);
        }
        goto LABEL_384;
      }
      v298 = 0;
      v299 = (char *)(4 * v294);
      *(_DWORD *)(4 * v294) = 1;
      v291 = 4 * v294 + 4;
      if (v290 != v292)
        goto LABEL_378;
LABEL_384:
      v605 = v299;
      v606 = (char *)v291;
      v607 = &v298[4 * v297];
      if (v292)
        operator delete(v292);
LABEL_386:
      v606 = (char *)v291;
      std::to_string(&v596, __val);
      v309 = HIBYTE(v596.__r_.__value_.__r.__words[2]);
      if ((v596.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v310 = 22;
      else
        v310 = (v596.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((v596.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v309 = v596.__r_.__value_.__l.__size_;
      if (v310 == v309)
      {
        if (v310 == 0x7FFFFFFFFFFFFFF6)
          sub_239FEBDE0();
        v311 = v310 + 1;
        if ((v596.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v312 = &v596;
        else
          v312 = (std::string *)v596.__r_.__value_.__r.__words[0];
        v313 = 0x7FFFFFFFFFFFFFF7;
        if (v310 < 0x3FFFFFFFFFFFFFF3)
        {
          v314 = 2 * v310;
          if (v311 > 2 * v310)
            v314 = v310 + 1;
          if (v314 >= 0x17)
          {
            v318 = (v314 & 0xFFFFFFFFFFFFFFF8) + 8;
            v319 = v314 | 7;
            if (v319 == 23)
              v319 = v318;
            v313 = v319 + 1;
          }
          else
          {
            v313 = 23;
          }
        }
        v320 = operator new(v313);
        v321 = (std::string::size_type)v320;
        if (v310)
        {
          memmove(v320, v312, v310);
          *(_BYTE *)(v321 + v310) = 47;
          if (v310 == 22)
            goto LABEL_415;
        }
        else
        {
          *v320 = 47;
        }
        operator delete(v312);
LABEL_415:
        v596.__r_.__value_.__l.__size_ = v310 + 1;
        v596.__r_.__value_.__r.__words[2] = v313 | 0x8000000000000000;
        v596.__r_.__value_.__r.__words[0] = v321;
        v317 = (_BYTE *)(v321 + v311);
        goto LABEL_416;
      }
      v315 = &v596;
      if ((v596.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v315 = (std::string *)v596.__r_.__value_.__r.__words[0];
      v315->__r_.__value_.__s.__data_[v309] = 47;
      v316 = v309 + 1;
      if (SHIBYTE(v596.__r_.__value_.__r.__words[2]) < 0)
        v596.__r_.__value_.__l.__size_ = v316;
      else
        *((_BYTE *)&v596.__r_.__value_.__s + 23) = v316 & 0x7F;
      v317 = (char *)v315 + v316;
LABEL_416:
      *v317 = 0;
      v617 = v596;
      memset(&v596, 0, sizeof(v596));
      v322 = strlen(v173);
      v323 = v322;
      if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v324 = 22;
      else
        v324 = (v617.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v325 = HIBYTE(v617.__r_.__value_.__r.__words[2]);
      else
        v325 = v617.__r_.__value_.__l.__size_;
      if (v324 - v325 >= v322)
      {
        if (!v322)
          goto LABEL_448;
        if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v330 = &v617;
        else
          v330 = (std::string *)v617.__r_.__value_.__r.__words[0];
        memmove((char *)v330 + v325, v173, v322);
        v331 = v325 + v323;
        if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
          v617.__r_.__value_.__l.__size_ = v325 + v323;
        else
          *((_BYTE *)&v617.__r_.__value_.__s + 23) = v331 & 0x7F;
        v332 = (char *)v330 + v331;
      }
      else
      {
        v326 = v325 + v322;
        if (0x7FFFFFFFFFFFFFF6 - v324 < v325 + v322 - v324)
          sub_239FEBDE0();
        if ((v617.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v327 = &v617;
        else
          v327 = (std::string *)v617.__r_.__value_.__r.__words[0];
        v328 = 0x7FFFFFFFFFFFFFF7;
        if (v324 < 0x3FFFFFFFFFFFFFF3)
        {
          v329 = 2 * v324;
          if (v326 > 2 * v324)
            v329 = v325 + v322;
          if (v329 >= 0x17)
          {
            v333 = (v329 & 0xFFFFFFFFFFFFFFF8) + 8;
            v334 = v329 | 7;
            if (v334 == 23)
              v334 = v333;
            v328 = v334 + 1;
          }
          else
          {
            v328 = 23;
          }
        }
        v335 = operator new(v328);
        v336 = (std::string::size_type)v335;
        if (v325)
          memmove(v335, v327, v325);
        memcpy((void *)(v336 + v325), v173, v323);
        if (v324 != 22)
          operator delete(v327);
        v617.__r_.__value_.__l.__size_ = v325 + v323;
        v617.__r_.__value_.__r.__words[2] = v328 | 0x8000000000000000;
        v617.__r_.__value_.__r.__words[0] = v336;
        v332 = (_BYTE *)(v336 + v326);
      }
      *v332 = 0;
LABEL_448:
      *(std::string *)v594 = v617;
      v337 = v617.__r_.__value_.__r.__words[2];
      memset(&v617, 0, sizeof(v617));
      if (v337 >= 0)
        v338 = 22;
      else
        v338 = (v337 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (v337 >= 0)
        v339 = HIBYTE(v337);
      else
        v339 = *(_QWORD *)&v594[8];
      if (v338 - v339 >= 7)
      {
        v344 = v594;
        if (v337 < 0)
          v344 = *(_BYTE **)v594;
        v345 = &v344[v339];
        *(_DWORD *)((char *)v345 + 3) = 1852399475;
        *v345 = 1935636063;
        v346 = v339 + 7;
        if ((v594[23] & 0x80000000) != 0)
          *(_QWORD *)&v594[8] = v339 + 7;
        else
          v594[23] = v346 & 0x7F;
        v347 = &v344[v346];
      }
      else
      {
        v340 = v339 + 7;
        if (0x7FFFFFFFFFFFFFF6 - v338 < v339 + 7 - v338)
          sub_239FEBDE0();
        if (v337 >= 0)
          v341 = v594;
        else
          v341 = *(_BYTE **)v594;
        v342 = 0x7FFFFFFFFFFFFFF7;
        if (v338 < 0x3FFFFFFFFFFFFFF3)
        {
          v343 = 2 * v338;
          if (v340 > 2 * v338)
            v343 = v339 + 7;
          if (v343 >= 0x17)
          {
            v348 = (v343 & 0xFFFFFFFFFFFFFFF8) + 8;
            v349 = v343 | 7;
            if (v349 == 23)
              v349 = v348;
            v342 = v349 + 1;
          }
          else
          {
            v342 = 23;
          }
        }
        v350 = (char *)operator new(v342);
        v351 = v350;
        if (v339)
          memmove(v350, v341, v339);
        v352 = &v351[v339];
        *(_DWORD *)(v352 + 3) = 1852399475;
        *(_DWORD *)v352 = 1935636063;
        if (v338 != 22)
          operator delete(v341);
        *(_QWORD *)&v594[8] = v339 + 7;
        *(_QWORD *)&v594[16] = v342 | 0x8000000000000000;
        *(_QWORD *)v594 = v351;
        v347 = &v351[v340];
      }
      *v347 = 0;
      v353 = *(_QWORD *)v594;
      *(_QWORD *)v624 = *(_QWORD *)&v594[8];
      *(_QWORD *)&v624[7] = *(_QWORD *)&v594[15];
      v354 = v594[23];
      memset(v594, 0, 24);
      if ((__dst[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__dst);
        *(_QWORD *)__dst = v353;
        *(_QWORD *)&__dst[8] = *(_QWORD *)v624;
        *(_QWORD *)&__dst[15] = *(_QWORD *)&v624[7];
        __dst[23] = v354;
        if ((v594[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)v594);
          if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
          {
LABEL_480:
            operator delete(v617.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v596.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_485;
LABEL_481:
            operator delete(v596.__r_.__value_.__l.__data_);
            goto LABEL_485;
          }
        }
        else if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
        {
          goto LABEL_480;
        }
      }
      else
      {
        *(_QWORD *)__dst = v353;
        *(_QWORD *)&__dst[8] = *(_QWORD *)v624;
        *(_QWORD *)&__dst[15] = *(_QWORD *)&v624[7];
        __dst[23] = v354;
        if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
          goto LABEL_480;
      }
      if (SHIBYTE(v596.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_481;
LABEL_485:
      if (espresso_network_query_blob_dimensions())
      {
LABEL_596:
        if (a4)
        {
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v217, (uint64_t)CFSTR("Not able to fetch decoder input names!"), v218, v219);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if ((__dst[23] & 0x80000000) == 0)
          goto LABEL_601;
        v451 = *(void **)__dst;
LABEL_600:
        operator delete(v451);
        goto LABEL_601;
      }
      v355 = v603[1];
      if (v603[1] >= v604)
      {
        v603[1] = sub_23A051B5C((char **)v603, (uint64_t)__dst);
        v357 = (int)__p[0];
        v359 = v601;
        v358 = v602;
        if (v601 < v602)
          goto LABEL_500;
      }
      else if ((__dst[23] & 0x80000000) != 0)
      {
        sub_239FF1F64((_BYTE *)v603[1], *(void **)__dst, *(unint64_t *)&__dst[8]);
        v603[1] = (char *)v355 + 24;
        v357 = (int)__p[0];
        v359 = v601;
        v358 = v602;
        if (v601 < v602)
        {
LABEL_500:
          *(_DWORD *)v359 = v357;
          v368 = v359 + 4;
          goto LABEL_512;
        }
      }
      else
      {
        v356 = *(_OWORD *)__dst;
        *((_QWORD *)v603[1] + 2) = *(_QWORD *)&__dst[16];
        *v355 = v356;
        v603[1] = (char *)v355 + 24;
        v357 = (int)__p[0];
        v359 = v601;
        v358 = v602;
        if (v601 < v602)
          goto LABEL_500;
      }
      v360 = (char *)v600;
      v361 = v359 - (_BYTE *)v600;
      v362 = (v359 - (_BYTE *)v600) >> 2;
      v363 = v362 + 1;
      if ((unint64_t)(v362 + 1) >> 62)
        sub_239FEBE68();
      v364 = v358 - (_BYTE *)v600;
      if (v364 >> 1 > v363)
        v363 = v364 >> 1;
      if ((unint64_t)v364 >= 0x7FFFFFFFFFFFFFFCLL)
        v365 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v365 = v363;
      if (v365)
      {
        if (v365 >> 62)
          sub_239FF1A44();
        v366 = operator new(4 * v365);
        v367 = &v366[4 * v362];
        *(_DWORD *)v367 = v357;
        v368 = v367 + 4;
        if (v359 == v360)
          goto LABEL_510;
LABEL_504:
        v370 = v359 - 4 - v360;
        if (v370 < 0x2C)
          goto LABEL_892;
        if ((unint64_t)(v359 - &v366[v361]) < 0x20)
          goto LABEL_892;
        v371 = (v370 >> 2) + 1;
        v372 = 4 * (v371 & 0x7FFFFFFFFFFFFFF8);
        v373 = &v359[-v372];
        v367 -= v372;
        v374 = &v366[v361 - 16];
        v375 = v359 - 16;
        v376 = v371 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v377 = *(_OWORD *)v375;
          *(v374 - 1) = *((_OWORD *)v375 - 1);
          *v374 = v377;
          v374 -= 2;
          v375 -= 32;
          v376 -= 8;
        }
        while (v376);
        v359 = v373;
        if (v371 != (v371 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_892:
          do
          {
            v378 = *((_DWORD *)v359 - 1);
            v359 -= 4;
            *((_DWORD *)v367 - 1) = v378;
            v367 -= 4;
          }
          while (v359 != v360);
        }
        goto LABEL_510;
      }
      v366 = 0;
      v367 = (char *)(4 * v362);
      v369 = (_DWORD *)(4 * v362);
      *v369 = v357;
      v368 = (char *)(v369 + 1);
      if (v359 != v360)
        goto LABEL_504;
LABEL_510:
      v600 = v367;
      v601 = v368;
      v602 = &v366[4 * v365];
      if (v360)
        operator delete(v360);
LABEL_512:
      v601 = v368;
      v594[23] = 17;
      strcpy(v594, "vanilla_attention");
      v379 = v592;
      if (strlen(v173) == 17)
      {
        v380 = bswap64(*(unint64_t *)v594);
        v381 = bswap64(*(_QWORD *)v173);
        if (v380 == v381
          && (v380 = bswap64(*(unint64_t *)&v594[8]), v381 = bswap64(*((_QWORD *)v173 + 1)), v380 == v381))
        {
          v382 = v594[16] - v173[16];
        }
        else if (v380 < v381)
        {
          v382 = -1;
        }
        else
        {
          v382 = 1;
        }
        if (v382)
          v379 = v592;
        else
          v379 = 0;
      }
      v383 = v598;
      if (v598 < v599)
      {
        *(_DWORD *)v598 = v379;
        v384 = v383 + 4;
        goto LABEL_543;
      }
      v385 = (char *)v597;
      v386 = v598 - (_BYTE *)v597;
      v387 = (v598 - (_BYTE *)v597) >> 2;
      v388 = v387 + 1;
      if ((unint64_t)(v387 + 1) >> 62)
        sub_239FEBE68();
      v389 = v599 - (_BYTE *)v597;
      if ((v599 - (_BYTE *)v597) >> 1 > v388)
        v388 = v389 >> 1;
      if ((unint64_t)v389 >= 0x7FFFFFFFFFFFFFFCLL)
        v390 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v390 = v388;
      if (v390)
      {
        if (v390 >> 62)
          sub_239FF1A44();
        v391 = (char *)operator new(4 * v390);
        v392 = &v391[4 * v387];
        *(_DWORD *)v392 = v379;
        v384 = v392 + 4;
        if (v383 == v385)
          goto LABEL_541;
LABEL_535:
        v394 = v383 - 4 - v385;
        if (v394 < 0x2C)
          goto LABEL_893;
        if ((unint64_t)(v383 - &v391[v386]) < 0x20)
          goto LABEL_893;
        v395 = (v394 >> 2) + 1;
        v396 = 4 * (v395 & 0x7FFFFFFFFFFFFFF8);
        v397 = &v383[-v396];
        v392 -= v396;
        v398 = &v391[v386 - 16];
        v399 = v383 - 16;
        v400 = v395 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v401 = *(_OWORD *)v399;
          *((_OWORD *)v398 - 1) = *((_OWORD *)v399 - 1);
          *(_OWORD *)v398 = v401;
          v398 -= 32;
          v399 -= 32;
          v400 -= 8;
        }
        while (v400);
        v383 = v397;
        if (v395 != (v395 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_893:
          do
          {
            v402 = *((_DWORD *)v383 - 1);
            v383 -= 4;
            *((_DWORD *)v392 - 1) = v402;
            v392 -= 4;
          }
          while (v383 != v385);
        }
        goto LABEL_541;
      }
      v391 = 0;
      v392 = (char *)(4 * v387);
      v393 = (_DWORD *)(4 * v387);
      *v393 = v379;
      v384 = (char *)(v393 + 1);
      if (v383 != v385)
        goto LABEL_535;
LABEL_541:
      v597 = v392;
      v598 = v384;
      v599 = &v391[4 * v390];
      if (v385)
        operator delete(v385);
LABEL_543:
      v598 = v384;
      if ((v594[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)v594);
        v403 = (int)__p[2];
        v405 = v609;
        v404 = v610;
        if (v609 < v610)
        {
LABEL_545:
          *(_DWORD *)v405 = v403;
          v406 = v405 + 4;
          goto LABEL_566;
        }
      }
      else
      {
        v403 = (int)__p[2];
        v405 = v609;
        v404 = v610;
        if (v609 < v610)
          goto LABEL_545;
      }
      v407 = (char *)v608;
      v408 = v405 - (_BYTE *)v608;
      v409 = (v405 - (_BYTE *)v608) >> 2;
      v410 = v409 + 1;
      if ((unint64_t)(v409 + 1) >> 62)
        sub_239FEBE68();
      v411 = v404 - (_BYTE *)v608;
      if (v411 >> 1 > v410)
        v410 = v411 >> 1;
      if ((unint64_t)v411 >= 0x7FFFFFFFFFFFFFFCLL)
        v412 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v412 = v410;
      if (v412)
      {
        if (v412 >> 62)
          sub_239FF1A44();
        v413 = operator new(4 * v412);
        v414 = &v413[4 * v409];
        *(_DWORD *)v414 = v403;
        v406 = v414 + 4;
        if (v405 == v407)
          goto LABEL_564;
LABEL_558:
        v416 = v405 - 4 - v407;
        if (v416 < 0x2C)
          goto LABEL_894;
        if ((unint64_t)(v405 - &v413[v408]) < 0x20)
          goto LABEL_894;
        v417 = (v416 >> 2) + 1;
        v418 = 4 * (v417 & 0x7FFFFFFFFFFFFFF8);
        v419 = &v405[-v418];
        v414 -= v418;
        v420 = &v413[v408 - 16];
        v421 = v405 - 16;
        v422 = v417 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v423 = *(_OWORD *)v421;
          *(v420 - 1) = *((_OWORD *)v421 - 1);
          *v420 = v423;
          v420 -= 2;
          v421 -= 32;
          v422 -= 8;
        }
        while (v422);
        v405 = v419;
        if (v417 != (v417 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_894:
          do
          {
            v424 = *((_DWORD *)v405 - 1);
            v405 -= 4;
            *((_DWORD *)v414 - 1) = v424;
            v414 -= 4;
          }
          while (v405 != v407);
        }
        goto LABEL_564;
      }
      v413 = 0;
      v414 = (char *)(4 * v409);
      v415 = (_DWORD *)(4 * v409);
      *v415 = v403;
      v406 = (char *)(v415 + 1);
      if (v405 != v407)
        goto LABEL_558;
LABEL_564:
      v608 = v414;
      v609 = v406;
      v610 = &v413[4 * v412];
      if (v407)
        operator delete(v407);
LABEL_566:
      v609 = v406;
      v425 = v606;
      if (v606 < v607)
      {
        *(_DWORD *)v606 = 1;
        v426 = (uint64_t)(v425 + 4);
        goto LABEL_587;
      }
      v427 = (char *)v605;
      v428 = v606 - (_BYTE *)v605;
      v429 = (v606 - (_BYTE *)v605) >> 2;
      v430 = v429 + 1;
      if ((unint64_t)(v429 + 1) >> 62)
        sub_239FEBE68();
      v431 = v607 - (_BYTE *)v605;
      if ((v607 - (_BYTE *)v605) >> 1 > v430)
        v430 = v431 >> 1;
      if ((unint64_t)v431 >= 0x7FFFFFFFFFFFFFFCLL)
        v432 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v432 = v430;
      if (v432)
      {
        if (v432 >> 62)
          sub_239FF1A44();
        v433 = (char *)operator new(4 * v432);
        v434 = &v433[4 * v429];
        *(_DWORD *)v434 = 1;
        v426 = (uint64_t)(v434 + 4);
        if (v425 == v427)
          goto LABEL_585;
LABEL_579:
        v435 = v425 - 4 - v427;
        if (v435 < 0x2C)
          goto LABEL_895;
        if ((unint64_t)(v425 - &v433[v428]) < 0x20)
          goto LABEL_895;
        v436 = (v435 >> 2) + 1;
        v437 = 4 * (v436 & 0x7FFFFFFFFFFFFFF8);
        v438 = &v425[-v437];
        v434 -= v437;
        v439 = &v433[v428 - 16];
        v440 = v425 - 16;
        v441 = v436 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v442 = *(_OWORD *)v440;
          *((_OWORD *)v439 - 1) = *((_OWORD *)v440 - 1);
          *(_OWORD *)v439 = v442;
          v439 -= 32;
          v440 -= 32;
          v441 -= 8;
        }
        while (v441);
        v425 = v438;
        if (v436 != (v436 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_895:
          do
          {
            v443 = *((_DWORD *)v425 - 1);
            v425 -= 4;
            *((_DWORD *)v434 - 1) = v443;
            v434 -= 4;
          }
          while (v425 != v427);
        }
        goto LABEL_585;
      }
      v433 = 0;
      v434 = (char *)(4 * v429);
      *(_DWORD *)(4 * v429) = 1;
      v426 = 4 * v429 + 4;
      if (v425 != v427)
        goto LABEL_579;
LABEL_585:
      v605 = v434;
      v606 = (char *)v426;
      v607 = &v433[4 * v432];
      if (v427)
        operator delete(v427);
LABEL_587:
      v606 = (char *)v426;
      if ((__dst[23] & 0x80000000) != 0)
        operator delete(*(void **)__dst);
      ++v172;
    }
    while (v172 != 2);
  }
  v444 = (char *)v603[0];
  v445 = ((char *)v603[1] - (char *)v603[0]) / 24;
  memset(&v596, 0, sizeof(v596));
  if (v445 >> 62)
    sub_239FEBE68();
  v446 = 4 * v445;
  v447 = operator new(4 * v445);
  v448 = (std::string::size_type)v447 + 4 * v445;
  v596.__r_.__value_.__r.__words[0] = (std::string::size_type)v447;
  v596.__r_.__value_.__r.__words[2] = v448;
  memset_pattern16(v447, &unk_23A0A4470, v446);
  v596.__r_.__value_.__l.__size_ = v448;
  v584 = operator new(v446);
  memset_pattern16(v584, &unk_23A0A4480, v446);
  v449 = 0;
  v450 = 0;
  v621 = 0;
  v622 = 0;
  v623 = 0;
  while (2)
  {
    v455 = &v444[24 * v450];
    if (v455[23] < 0)
    {
      v455 = *(char **)v455;
      v456 = v623;
      if (v449 >= v623)
        goto LABEL_624;
      goto LABEL_618;
    }
    v456 = v623;
    if (v449 < v623)
    {
LABEL_618:
      *(_QWORD *)v449 = v455;
      v449 += 8;
      goto LABEL_619;
    }
LABEL_624:
    v457 = v621;
    v458 = v449 - v621;
    v459 = (v449 - v621) >> 3;
    v460 = v459 + 1;
    if ((unint64_t)(v459 + 1) >> 61)
      sub_239FEBE68();
    v461 = v456 - v621;
    if (v461 >> 2 > v460)
      v460 = v461 >> 2;
    if ((unint64_t)v461 >= 0x7FFFFFFFFFFFFFF8)
      v462 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v462 = v460;
    if (!v462)
    {
      v463 = 0;
      v464 = (char *)(8 * v459);
      v469 = (char **)(8 * v459);
      *v469 = v455;
      v465 = (const char *)(v469 + 1);
      if (v449 != v457)
        goto LABEL_633;
LABEL_639:
      v621 = v464;
      v622 = v465;
      v623 = &v463[8 * v462];
      if (!v449)
        goto LABEL_641;
      goto LABEL_640;
    }
    if (v462 >> 61)
      sub_239FF1A44();
    v463 = operator new(8 * v462);
    v464 = &v463[8 * v459];
    *(_QWORD *)v464 = v455;
    v465 = v464 + 8;
    if (v449 == v457)
      goto LABEL_639;
LABEL_633:
    v466 = v449 - 8 - v457;
    if (v466 < 0x168)
    {
      v467 = v449;
      goto LABEL_635;
    }
    if (&v463[v458 - 8 - (v466 & 0xFFFFFFFFFFFFFFF8)] > &v463[v458 - 8])
    {
      v467 = v449;
      goto LABEL_635;
    }
    if (&v449[-(v466 & 0xFFFFFFFFFFFFFFF8) - 8] > v449 - 8)
    {
      v467 = v449;
      goto LABEL_635;
    }
    if ((unint64_t)(v457 - v463) < 0x20)
    {
      v467 = v449;
      goto LABEL_635;
    }
    v470 = (v466 >> 3) + 1;
    v471 = 8 * (v470 & 0x3FFFFFFFFFFFFFFCLL);
    v467 = &v449[-v471];
    v464 -= v471;
    v472 = &v463[v458 - 16];
    v473 = v449 - 16;
    v474 = v470 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v475 = *(_OWORD *)v473;
      *(v472 - 1) = *((_OWORD *)v473 - 1);
      *v472 = v475;
      v472 -= 2;
      v473 -= 32;
      v474 -= 4;
    }
    while (v474);
    if (v470 != (v470 & 0x3FFFFFFFFFFFFFFCLL))
    {
      do
      {
LABEL_635:
        v468 = *((_QWORD *)v467 - 1);
        v467 -= 8;
        *((_QWORD *)v464 - 1) = v468;
        v464 -= 8;
      }
      while (v467 != v457);
    }
    v449 = v621;
    v621 = v464;
    v622 = v465;
    v623 = &v463[8 * v462];
    if (v449)
LABEL_640:
      operator delete(v449);
LABEL_641:
    v449 = (char *)v465;
LABEL_619:
    v622 = v449;
    ++v450;
    v444 = (char *)v603[0];
    if (v450 < 0xAAAAAAAAAAAAAAABLL * (((char *)v603[1] - (char *)v603[0]) >> 3))
      continue;
    break;
  }
  v583 = v584;
  espresso_network_change_input_blob_shapes_seq_rank();
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v591->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_stateOutputEspressoBuffers = (uint64_t **)&v591->_stateOutputEspressoBuffers;
  if (begin_node != &v591->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    while (2)
    {
      sub_23A051D30(__p, (__int128 *)&begin_node[4]);
      espresso_network_declare_output();
      if (v612)
      {
        v613 = v612;
        operator delete(v612);
      }
      if (SHIBYTE(__p[2]) < 0)
      {
        operator delete(__p[0]);
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
        if (left)
          goto LABEL_661;
        do
        {
LABEL_663:
          v478 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
          v479 = v478->__value_.__left_ == begin_node;
          begin_node = v478;
        }
        while (!v479);
      }
      else
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
        if (!left)
          goto LABEL_663;
        do
        {
LABEL_661:
          v478 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      begin_node = v478;
      if (v478 == &v591->_stateOutputEspressoBuffers.__tree_.__pair1_)
        break;
      continue;
    }
  }
  p_pair1 = &v591->_stateOutputEspressoBuffers.__tree_.__pair1_;
  v480 = v591;
  espresso_plan_build();
  v481 = (__int128 *)v591->_stateInputEspressoBuffers.__tree_.__begin_node_;
  p_stateInputEspressoBuffers = (uint64_t **)&v591->_stateInputEspressoBuffers;
  v482 = &v591->_stateInputEspressoBuffers.__tree_.__pair1_;
  if (v481 != (__int128 *)&v591->_stateInputEspressoBuffers.__tree_.__pair1_)
  {
    __vala = &v591->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    do
    {
      sub_23A051D30(__p, v481 + 2);
      blob_shape = espresso_network_query_blob_shape();
      if (blob_shape)
      {
        if (a4)
        {
          v487 = __p;
          if (SHIBYTE(__p[2]) < 0)
            v487 = (void **)__p[0];
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v483, (uint64_t)CFSTR("Not able to fetch shape for blob %s!"), v484, v485, v487, v583);
          v488 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v489, (uint64_t)v488, v490, v491);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v492 = v617.__r_.__value_.__r.__words[0];
        if (v617.__r_.__value_.__r.__words[0])
        {
          v493 = 0;
          v494 = 1;
          while (1)
          {
            v593 = *(_QWORD *)&__dst[8 * v493];
            v495 = &v591->_stateInputEspressoBuffersShape.__tree_.__pair1_;
            v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)__vala->__value_.__left_;
            v497 = &v591->_stateInputEspressoBuffersShape.__tree_.__pair1_;
            if (__vala->__value_.__left_)
              break;
LABEL_708:
            v509 = (char *)operator new(0x50uLL);
            v510 = v509 + 32;
            if (SHIBYTE(__p[2]) < 0)
            {
              sub_239FF1F64(v510, __p[0], (unint64_t)__p[1]);
            }
            else
            {
              *(_OWORD *)v510 = *(_OWORD *)__p;
              *((void **)v509 + 6) = __p[2];
            }
            *((_QWORD *)v509 + 7) = 0;
            *((_QWORD *)v509 + 8) = 0;
            *((_QWORD *)v509 + 9) = 0;
            *(_QWORD *)v509 = 0;
            *((_QWORD *)v509 + 1) = 0;
            *((_QWORD *)v509 + 2) = v495;
            v497->__value_.__left_ = v509;
            v511 = *(void **)v591->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
            v512 = v509;
            if (v511)
            {
              v591->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v511;
              v512 = (char *)v497->__value_.__left_;
            }
            v513 = (char *)__vala->__value_.__left_;
            v479 = v512 == __vala->__value_.__left_;
            v512[24] = v479;
            if (!v479)
            {
              do
              {
                v514 = *((_QWORD *)v512 + 2);
                if (*(_BYTE *)(v514 + 24))
                  break;
                v515 = *(char **)(v514 + 16);
                v516 = *(_QWORD *)v515;
                if (*(_QWORD *)v515 == v514)
                {
                  v519 = *((_QWORD *)v515 + 1);
                  if (!v519 || (v520 = *(unsigned __int8 *)(v519 + 24), v517 = (_BYTE *)(v519 + 24), v520))
                  {
                    if (*(char **)v514 == v512)
                    {
                      *(_BYTE *)(v514 + 24) = 1;
                      v515[24] = 0;
                      v523 = *(_QWORD *)(v514 + 8);
                      *(_QWORD *)v515 = v523;
                      if (v523)
                        goto LABEL_728;
                    }
                    else
                    {
                      v521 = *(uint64_t **)(v514 + 8);
                      v522 = *v521;
                      *(_QWORD *)(v514 + 8) = *v521;
                      if (v522)
                      {
                        *(_QWORD *)(v522 + 16) = v514;
                        v515 = *(char **)(v514 + 16);
                      }
                      v521[2] = (uint64_t)v515;
                      *(_QWORD *)(*(_QWORD *)(v514 + 16) + 8 * (**(_QWORD **)(v514 + 16) != v514)) = v521;
                      *v521 = v514;
                      *(_QWORD *)(v514 + 16) = v521;
                      v515 = (char *)v521[2];
                      v514 = *(_QWORD *)v515;
                      *((_BYTE *)v521 + 24) = 1;
                      v515[24] = 0;
                      v523 = *(_QWORD *)(v514 + 8);
                      *(_QWORD *)v515 = v523;
                      if (v523)
LABEL_728:
                        *(_QWORD *)(v523 + 16) = v515;
                    }
                    *(_QWORD *)(v514 + 16) = *((_QWORD *)v515 + 2);
                    *(_QWORD *)(*((_QWORD *)v515 + 2) + 8 * (**((_QWORD **)v515 + 2) != (_QWORD)v515)) = v514;
                    *(_QWORD *)(v514 + 8) = v515;
LABEL_678:
                    *((_QWORD *)v515 + 2) = v514;
                    break;
                  }
                }
                else if (!v516 || (v518 = *(unsigned __int8 *)(v516 + 24), v517 = (_BYTE *)(v516 + 24), v518))
                {
                  if (*(char **)v514 == v512)
                  {
                    v525 = *((_QWORD *)v512 + 1);
                    *(_QWORD *)v514 = v525;
                    if (v525)
                    {
                      *(_QWORD *)(v525 + 16) = v514;
                      v515 = *(char **)(v514 + 16);
                    }
                    *((_QWORD *)v512 + 2) = v515;
                    *(_QWORD *)(*(_QWORD *)(v514 + 16) + 8 * (**(_QWORD **)(v514 + 16) != v514)) = v512;
                    *((_QWORD *)v512 + 1) = v514;
                    *(_QWORD *)(v514 + 16) = v512;
                    v515 = (char *)*((_QWORD *)v512 + 2);
                    v512[24] = 1;
                    v515[24] = 0;
                    v514 = *((_QWORD *)v515 + 1);
                    v524 = *(char **)v514;
                    *((_QWORD *)v515 + 1) = *(_QWORD *)v514;
                    if (!v524)
                      goto LABEL_677;
                  }
                  else
                  {
                    *(_BYTE *)(v514 + 24) = 1;
                    v515[24] = 0;
                    v514 = *((_QWORD *)v515 + 1);
                    v524 = *(char **)v514;
                    *((_QWORD *)v515 + 1) = *(_QWORD *)v514;
                    if (!v524)
                      goto LABEL_677;
                  }
                  *((_QWORD *)v524 + 2) = v515;
LABEL_677:
                  *(_QWORD *)(v514 + 16) = *((_QWORD *)v515 + 2);
                  *(_QWORD *)(*((_QWORD *)v515 + 2) + 8 * (**((_QWORD **)v515 + 2) != (_QWORD)v515)) = v514;
                  *(_QWORD *)v514 = v515;
                  goto LABEL_678;
                }
                *(_BYTE *)(v514 + 24) = 1;
                v512 = v515;
                v515[24] = v515 == v513;
                *v517 = 1;
              }
              while (v515 != v513);
            }
            ++v591->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
            v492 = v617.__r_.__value_.__r.__words[0];
LABEL_680:
            v494 *= v593;
            *(_QWORD *)(*((_QWORD *)v509 + 7) + 8 * (v492 + ~v493++)) = v593;
            v492 = v617.__r_.__value_.__r.__words[0];
            if (v493 >= v617.__r_.__value_.__r.__words[0])
              goto LABEL_741;
          }
          if (SHIBYTE(__p[2]) >= 0)
            v498 = __p;
          else
            v498 = (void **)__p[0];
          if (SHIBYTE(__p[2]) >= 0)
            v499 = (void *)HIBYTE(__p[2]);
          else
            v499 = __p[1];
          while (1)
          {
            v495 = v496;
            v502 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v496[4].__value_.__left_;
            v500 = v496 + 4;
            v501 = v502;
            left_high = SHIBYTE(v500[2].__value_.__left_);
            if (left_high >= 0)
              v504 = v500;
            else
              v504 = v501;
            if (left_high >= 0)
              v505 = HIBYTE(v500[2].__value_.__left_);
            else
              v505 = (size_t)v500[1].__value_.__left_;
            if (v505 >= (unint64_t)v499)
              v506 = (size_t)v499;
            else
              v506 = v505;
            v507 = memcmp(v498, v504, v506);
            if (v507)
            {
              if (v507 < 0)
                goto LABEL_688;
            }
            else if ((unint64_t)v499 < v505)
            {
LABEL_688:
              v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v495->__value_.__left_;
              v497 = v495;
              if (!v495->__value_.__left_)
                goto LABEL_708;
              continue;
            }
            v508 = memcmp(v504, v498, v506);
            if (v508)
            {
              if ((v508 & 0x80000000) == 0)
                goto LABEL_730;
            }
            else if (v505 >= (unint64_t)v499)
            {
LABEL_730:
              v509 = (char *)v495;
              goto LABEL_680;
            }
            v496 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v495[1].__value_.__left_;
            if (!v496)
            {
              v497 = v495 + 1;
              goto LABEL_708;
            }
          }
        }
        v494 = 1;
LABEL_741:
        *(_QWORD *)v594 = __p;
        v526 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_23A0A31B0, (__int128 **)v594);
        v482 = &v591->_stateInputEspressoBuffers.__tree_.__pair1_;
        blob_shape = 0;
        if (v494 > ((char *)v526[8] - (char *)v526[7]) >> 2)
        {
          *(_QWORD *)v594 = __p;
          v527 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_23A0A31B0, (__int128 **)v594);
          v528 = v527[7];
          v529 = ((char *)v527[8] - (char *)v528) >> 2;
          if (v494 <= v529)
          {
            if (v494 < v529)
              v527[8] = (uint64_t *)((char *)v528 + 4 * v494);
          }
          else
          {
            sub_23A051E20((uint64_t)(v527 + 7), v494 - v529);
          }
        }
      }
      if (v612)
      {
        v613 = v612;
        operator delete(v612);
      }
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      v480 = v591;
      if (blob_shape)
        goto LABEL_832;
      v530 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)*((_QWORD *)v481 + 1);
      if (v530)
      {
        do
        {
          v531 = v530;
          v530 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v530->__value_.__left_;
        }
        while (v530);
      }
      else
      {
        do
        {
          v531 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)*((_QWORD *)v481 + 2);
          v479 = v531->__value_.__left_ == v481;
          v481 = (__int128 *)v531;
        }
        while (!v479);
      }
      v481 = (__int128 *)v531;
    }
    while (v531 != v482);
  }
  memset(v594, 0, sizeof(v594));
  v595 = 1065353216;
  v532 = *p_stateOutputEspressoBuffers;
  if (*p_stateOutputEspressoBuffers != (uint64_t *)p_pair1)
  {
    while (2)
    {
      sub_23A051D30(__dst, (__int128 *)v532 + 2);
      v536 = espresso_network_query_blob_shape();
      if (v536)
      {
        if (a4)
        {
          if (__dst[23] >= 0)
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v533, (uint64_t)CFSTR("Not able to fetch shape for blob %s!"), v534, v535, __dst);
          else
            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v533, (uint64_t)CFSTR("Not able to fetch shape for blob %s!"), v534, v535, *(_QWORD *)__dst);
          v537 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v538, (uint64_t)v537, v539, v540);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_797:
        if (v619)
        {
          v620 = v619;
          operator delete(v619);
        }
        if ((__dst[23] & 0x80000000) != 0)
          operator delete(*(void **)__dst);
        if (v536)
          goto LABEL_831;
        v568 = (uint64_t *)v532[1];
        if (v568)
        {
          do
          {
            v569 = v568;
            v568 = (uint64_t *)*v568;
          }
          while (v568);
        }
        else
        {
          do
          {
            v569 = (uint64_t *)v532[2];
            v479 = *v569 == (_QWORD)v532;
            v532 = v569;
          }
          while (!v479);
        }
        v532 = v569;
        if (v569 == (uint64_t *)p_pair1)
          goto LABEL_808;
        continue;
      }
      break;
    }
    if (v616)
    {
      if (v616 == 1)
      {
        v541 = 0;
        v542 = 1;
        goto LABEL_773;
      }
      v541 = v616 & 0xFFFFFFFFFFFFFFFELL;
      v543 = v616 & 0xFFFFFFFFFFFFFFFELL;
      p_size = &v617.__r_.__value_.__l.__size_;
      v545 = 1;
      v546 = 1;
      do
      {
        v545 *= *(p_size - 1);
        v546 *= *p_size;
        p_size += 2;
        v543 -= 2;
      }
      while (v543);
      v542 = v546 * v545;
      if (v616 != v541)
      {
LABEL_773:
        v547 = v616 - v541;
        v548 = &v617.__r_.__value_.__r.__words[v541];
        do
        {
          v549 = *v548++;
          v542 *= v549;
          --v547;
        }
        while (v547);
      }
    }
    else
    {
      v542 = 1;
    }
    __p[0] = __dst;
    v550 = sub_23A0529D4(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)__p);
    if (v542 > ((char *)v550[8] - (char *)v550[7]) >> 2)
    {
      __p[0] = __dst;
      v551 = sub_23A0529D4(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)__p);
      v552 = v551[7];
      v553 = ((char *)v551[8] - (char *)v552) >> 2;
      if (v542 <= v553)
      {
        if (v542 < v553)
          v551[8] = (uint64_t *)((char *)v552 + 4 * v542);
      }
      else
      {
        sub_23A051E20((uint64_t)(v551 + 7), v542 - v553);
      }
    }
    v554 = (uint64_t *)*((_QWORD *)v591->_decoderNet.__ptr_ + 1);
    *(_QWORD *)v624 = __dst;
    v555 = sub_23A0529D4(p_stateOutputEspressoBuffers, (const void **)__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)v624);
    sub_23A04EBE4((uint64_t)__p, *v554, v554[1], (uint64_t)__dst, (uint64_t)v555[7]);
    *(_QWORD *)v624 = __dst;
    v556 = sub_239FF42F8((uint64_t)v594, (uint64_t)__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)v624);
    v557 = v556;
    *((_DWORD *)v556 + 12) = __p[1];
    if (v556 + 5 != (uint64_t *)__p)
      sub_239FF49DC(v556 + 7, (char *)__p[2], (char *)v612, (int64_t)((uint64_t)v612 - (unint64_t)__p[2]) >> 3);
    v559 = v614;
    v558 = v615;
    v480 = v591;
    if (v615)
    {
      p_shared_owners = (unint64_t *)&v615->__shared_owners_;
      do
        v561 = __ldxr(p_shared_owners);
      while (__stxr(v561 + 1, p_shared_owners));
    }
    v562 = (std::__shared_weak_count *)v557[11];
    v557[10] = v559;
    v557[11] = (uint64_t)v558;
    if (v562)
    {
      v563 = (unint64_t *)&v562->__shared_owners_;
      do
        v564 = __ldaxr(v563);
      while (__stlxr(v564 - 1, v563));
      if (!v564)
      {
        ((void (*)(std::__shared_weak_count *))v562->__on_zero_shared)(v562);
        std::__shared_weak_count::__release_weak(v562);
      }
    }
    __p[0] = &off_250B0DCE8;
    v565 = v615;
    if (v615)
    {
      v566 = (unint64_t *)&v615->__shared_owners_;
      do
        v567 = __ldaxr(v566);
      while (__stlxr(v567 - 1, v566));
      if (!v567)
      {
        ((void (*)(std::__shared_weak_count *))v565->__on_zero_shared)(v565);
        std::__shared_weak_count::__release_weak(v565);
      }
    }
    if (__p[2])
    {
      v612 = __p[2];
      operator delete(__p[2]);
    }
    goto LABEL_797;
  }
LABEL_808:
  v570 = (uint64_t *)*((_QWORD *)v480->_decoderNet.__ptr_ + 1);
  __dst[23] = 10;
  strcpy(__dst, "word_probs");
  sub_23A04EBE4((uint64_t)__p, *v570, v570[1], (uint64_t)__dst, (uint64_t)v480->_wordProbs.__begin_);
  *((_BYTE *)&v617.__r_.__value_.__s + 23) = 10;
  strcpy((char *)&v617, "word_probs");
  *(_QWORD *)v624 = &v617;
  v571 = sub_23A0001E0((uint64_t)v594, (uint64_t)&v617, (uint64_t)&unk_23A0A31B0, (__int128 **)v624);
  v572 = v571;
  *((_DWORD *)v571 + 12) = __p[1];
  if (v571 + 40 != (unsigned __int8 *)__p)
    sub_239FF49DC((_QWORD *)v571 + 7, (char *)__p[2], (char *)v612, (int64_t)((uint64_t)v612 - (unint64_t)__p[2]) >> 3);
  v574 = v614;
  v573 = v615;
  if (v615)
  {
    v575 = (unint64_t *)&v615->__shared_owners_;
    do
      v576 = __ldxr(v575);
    while (__stxr(v576 + 1, v575));
  }
  v577 = (std::__shared_weak_count *)*((_QWORD *)v572 + 11);
  *((_QWORD *)v572 + 10) = v574;
  *((_QWORD *)v572 + 11) = v573;
  if (v577)
  {
    v578 = (unint64_t *)&v577->__shared_owners_;
    do
      v579 = __ldaxr(v578);
    while (__stlxr(v579 - 1, v578));
    if (!v579)
    {
      ((void (*)(std::__shared_weak_count *))v577->__on_zero_shared)(v577);
      std::__shared_weak_count::__release_weak(v577);
    }
  }
  if (SHIBYTE(v617.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v617.__r_.__value_.__l.__data_);
  __p[0] = &off_250B0DCE8;
  v580 = v615;
  if (v615)
  {
    v581 = (unint64_t *)&v615->__shared_owners_;
    do
      v582 = __ldaxr(v581);
    while (__stlxr(v582 - 1, v581));
    if (!v582)
    {
      ((void (*)(std::__shared_weak_count *))v580->__on_zero_shared)(v580);
      std::__shared_weak_count::__release_weak(v580);
    }
  }
  if (__p[2])
  {
    v612 = __p[2];
    operator delete(__p[2]);
  }
  if ((__dst[23] & 0x80000000) != 0)
    operator delete(*(void **)__dst);
  if (&v591->_outputTensors != (unordered_map<std::string, ik::EspressoTensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::EspressoTensor>>> *)v594)
  {
    LODWORD(v591->_outputTensors.__table_.__p3_.__value_) = v595;
    sub_23A053488(&v591->_outputTensors.__table_.__bucket_list_.__ptr_.__value_, *(_QWORD **)&v594[16], 0);
  }
LABEL_831:
  sub_239FF5234((uint64_t)v594);
LABEL_832:
  if (v621)
    operator delete(v621);
  operator delete(v584);
  v451 = (void *)v596.__r_.__value_.__r.__words[0];
  if (v596.__r_.__value_.__r.__words[0])
    goto LABEL_600;
LABEL_601:
  if (v597)
  {
    v598 = (char *)v597;
    operator delete(v597);
  }
  if (v600)
  {
    v601 = (char *)v600;
    operator delete(v600);
  }
  v452 = (void **)v603[0];
  if (v603[0])
  {
    v453 = (void **)v603[1];
    v454 = v603[0];
    if (v603[1] != v603[0])
    {
      do
      {
        if (*((char *)v453 - 1) < 0)
          operator delete(*(v453 - 3));
        v453 -= 3;
      }
      while (v453 != v452);
      v454 = v603[0];
    }
    v603[1] = v452;
    operator delete(v454);
  }
  if (v605)
  {
    v606 = (char *)v605;
    operator delete(v605);
  }
  if (v608)
  {
    v609 = (char *)v608;
    operator delete(v608);
  }
}

- (void)copyInputContextIDs:(const void *)a3 EncoderFeatures:(const void *)a4 KVCache:(const void *)a5 MaskPosition:(unint64_t)a6
{
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  _DWORD *v21;
  _DWORD *v22;
  uint32x4_t *v23;
  unint64_t v24;
  _DWORD *v25;
  unsigned int *v26;
  unint64_t v27;
  uint64_t v28;
  uint32x4_t *v29;
  float32x4_t *v30;
  uint64_t v31;
  float32x4_t v32;
  unsigned int *v33;
  float *v34;
  unsigned int v35;
  uint64_t *v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  char *v49;
  char *v50;
  float v51;
  uint64_t *v52;
  unsigned __int8 *v53;
  unsigned __int8 *v54;
  std::__shared_weak_count *v55;
  uint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  float *v65;
  _BYTE *v66;
  char *v67;
  uint64_t *v68;
  unsigned __int8 *v69;
  unsigned __int8 *v70;
  std::__shared_weak_count *v71;
  uint64_t v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  char *v81;
  uint64_t *v82;
  unsigned __int8 *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int8 *v87;
  std::__shared_weak_count *v88;
  uint64_t v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *p_inputTensors;
  void *v99[4];
  void *v100[4];
  _BYTE __p[24];
  char *v102;
  uint64_t v103;
  std::__shared_weak_count *v104;
  void *v105;
  float *v106;
  _DWORD *v107;
  __int128 v108;
  __int128 v109;
  float v110;
  void **v111;

  v108 = 0u;
  v109 = 0u;
  v110 = 1.0;
  __p[23] = 21;
  strcpy(__p, "att_feats_placeholder");
  v105 = __p;
  v11 = sub_23A053FC4((uint64_t)&v108, (uint64_t)__p, (uint64_t)&unk_23A0A31B0, (__int128 **)&v105);
  v12 = v11;
  *((_DWORD *)v11 + 12) = *((_DWORD *)a4 + 2);
  if (v11 + 40 != a4)
    sub_239FF49DC((_QWORD *)v11 + 7, *((char **)a4 + 2), *((char **)a4 + 3), (uint64_t)(*((_QWORD *)a4 + 3) - *((_QWORD *)a4 + 2)) >> 3);
  v14 = *((_QWORD *)a4 + 5);
  v13 = *((_QWORD *)a4 + 6);
  if (v13)
  {
    v15 = (unint64_t *)(v13 + 8);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  v17 = (std::__shared_weak_count *)*((_QWORD *)v12 + 11);
  *((_QWORD *)v12 + 10) = v14;
  *((_QWORD *)v12 + 11) = v13;
  if (!v17)
    goto LABEL_10;
  p_shared_owners = (unint64_t *)&v17->__shared_owners_;
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (v19)
  {
LABEL_10:
    if ((__p[23] & 0x80000000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
  std::__shared_weak_count::__release_weak(v17);
  if ((__p[23] & 0x80000000) != 0)
LABEL_11:
    operator delete(*(void **)__p);
LABEL_12:
  v20 = a6 + 1;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  if ((a6 + 1) >> 62)
    sub_239FEBE68();
  v21 = operator new(4 * v20);
  v22 = &v21[v20];
  v105 = v21;
  v107 = v22;
  bzero(v21, 4 * a6 + 4);
  v106 = (float *)v22;
  *v21 = 0;
  v23 = *(uint32x4_t **)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    if (a6)
    {
      v24 = (a6 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      v25 = v21;
      v26 = *(unsigned int **)a3;
      if (v24 < 7)
        goto LABEL_19;
      v27 = v24 + 1;
      v28 = v27 & 0x7FFFFFFFFFFFFFF8;
      v25 = &v21[v28];
      v26 = &v23->u32[v28];
      v29 = v23 + 1;
      v30 = (float32x4_t *)(v21 + 5);
      v31 = v27 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v32 = vcvtq_f32_u32(*v29);
        v30[-1] = vcvtq_f32_u32(v29[-1]);
        *v30 = v32;
        v29 += 2;
        v30 += 2;
        v31 -= 8;
      }
      while (v31);
      if (v27 != (v27 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_19:
        v33 = (unsigned int *)v23 + a6;
        v34 = (float *)(v25 + 1);
        do
        {
          v35 = *v26++;
          *v34++ = (float)v35;
        }
        while (v26 != v33);
      }
    }
  }
  *(_DWORD *)__p = v21[a6];
  sub_23A01DF14(&self->_inWords.__begin_, __p, &__p[4], 1uLL);
  v36 = (uint64_t *)*((_QWORD *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v100[2]) = 11;
  strcpy((char *)v100, "in_word_ids");
  sub_23A04EBE4((uint64_t)__p, *v36, v36[1], (uint64_t)v100, (uint64_t)self->_inWords.__begin_);
  HIBYTE(v99[2]) = 11;
  strcpy((char *)v99, "in_word_ids");
  v111 = v99;
  v37 = sub_23A053FC4((uint64_t)&v108, (uint64_t)v99, (uint64_t)&unk_23A0A31B0, (__int128 **)&v111);
  v38 = v37;
  *((_DWORD *)v37 + 12) = *(_DWORD *)&__p[8];
  if (v37 + 40 != __p)
    sub_239FF49DC((_QWORD *)v37 + 7, *(char **)&__p[16], v102, (uint64_t)&v102[-*(_QWORD *)&__p[16]] >> 3);
  v40 = v103;
  v39 = v104;
  if (v104)
  {
    v41 = (unint64_t *)&v104->__shared_owners_;
    do
      v42 = __ldxr(v41);
    while (__stxr(v42 + 1, v41));
  }
  v43 = (std::__shared_weak_count *)*((_QWORD *)v38 + 11);
  *((_QWORD *)v38 + 10) = v40;
  *((_QWORD *)v38 + 11) = v39;
  if (v43)
  {
    v44 = (unint64_t *)&v43->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
      if ((SHIBYTE(v99[2]) & 0x80000000) == 0)
        goto LABEL_32;
      goto LABEL_31;
    }
  }
  if (SHIBYTE(v99[2]) < 0)
LABEL_31:
    operator delete(v99[0]);
LABEL_32:
  *(_QWORD *)__p = &off_250B0DCE8;
  v46 = v104;
  if (v104)
  {
    v47 = (unint64_t *)&v104->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  if (*(_QWORD *)&__p[16])
  {
    v102 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v100[2]) < 0)
    operator delete(v100[0]);
  v49 = (char *)operator new(4uLL);
  v50 = v49;
  *(_DWORD *)v49 = 1065353216;
  v51 = 0.0;
  if (*(v106 - 1) != 0.0)
    v51 = 1.0;
  *(float *)v49 = v51;
  sub_23A01DF14(&self->_inputMask.__begin_, v49, v49 + 4, 1uLL);
  v52 = (uint64_t *)*((_QWORD *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v100[2]) = 16;
  strcpy((char *)v100, "in_word_ids_mask");
  sub_23A04EBE4((uint64_t)__p, *v52, v52[1], (uint64_t)v100, (uint64_t)self->_inputMask.__begin_);
  HIBYTE(v99[2]) = 16;
  strcpy((char *)v99, "in_word_ids_mask");
  v111 = v99;
  v53 = sub_23A053FC4((uint64_t)&v108, (uint64_t)v99, (uint64_t)&unk_23A0A31B0, (__int128 **)&v111);
  v54 = v53;
  *((_DWORD *)v53 + 12) = *(_DWORD *)&__p[8];
  if (v53 + 40 != __p)
    sub_239FF49DC((_QWORD *)v53 + 7, *(char **)&__p[16], v102, (uint64_t)&v102[-*(_QWORD *)&__p[16]] >> 3);
  v56 = v103;
  v55 = v104;
  if (v104)
  {
    v57 = (unint64_t *)&v104->__shared_owners_;
    do
      v58 = __ldxr(v57);
    while (__stxr(v58 + 1, v57));
  }
  v59 = (std::__shared_weak_count *)*((_QWORD *)v54 + 11);
  *((_QWORD *)v54 + 10) = v56;
  *((_QWORD *)v54 + 11) = v55;
  if (v59)
  {
    v60 = (unint64_t *)&v59->__shared_owners_;
    do
      v61 = __ldaxr(v60);
    while (__stlxr(v61 - 1, v60));
    if (!v61)
    {
      ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
      std::__shared_weak_count::__release_weak(v59);
      if ((SHIBYTE(v99[2]) & 0x80000000) == 0)
        goto LABEL_54;
      goto LABEL_53;
    }
  }
  if (SHIBYTE(v99[2]) < 0)
LABEL_53:
    operator delete(v99[0]);
LABEL_54:
  *(_QWORD *)__p = &off_250B0DCE8;
  v62 = v104;
  if (v104)
  {
    v63 = (unint64_t *)&v104->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }
  if (*(_QWORD *)&__p[16])
  {
    v102 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v100[2]) < 0)
    operator delete(v100[0]);
  v66 = v105;
  v65 = v106;
  v67 = (char *)operator new(4uLL);
  *(float *)v67 = (float)(unint64_t)((((char *)v65 - v66) >> 2) - 1);
  sub_23A01DF14(&self->_positionInput.__begin_, v67, v67 + 4, 1uLL);
  v68 = (uint64_t *)*((_QWORD *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v100[2]) = 8;
  strcpy((char *)v100, "position");
  sub_23A04EBE4((uint64_t)__p, *v68, v68[1], (uint64_t)v100, (uint64_t)self->_positionInput.__begin_);
  HIBYTE(v99[2]) = 8;
  strcpy((char *)v99, "position");
  v111 = v99;
  v69 = sub_23A053FC4((uint64_t)&v108, (uint64_t)v99, (uint64_t)&unk_23A0A31B0, (__int128 **)&v111);
  v70 = v69;
  *((_DWORD *)v69 + 12) = *(_DWORD *)&__p[8];
  if (v69 + 40 != __p)
    sub_239FF49DC((_QWORD *)v69 + 7, *(char **)&__p[16], v102, (uint64_t)&v102[-*(_QWORD *)&__p[16]] >> 3);
  v72 = v103;
  v71 = v104;
  if (v104)
  {
    v73 = (unint64_t *)&v104->__shared_owners_;
    do
      v74 = __ldxr(v73);
    while (__stxr(v74 + 1, v73));
  }
  v75 = (std::__shared_weak_count *)*((_QWORD *)v70 + 11);
  *((_QWORD *)v70 + 10) = v72;
  *((_QWORD *)v70 + 11) = v71;
  if (v75)
  {
    v76 = (unint64_t *)&v75->__shared_owners_;
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    if (!v77)
    {
      ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
      std::__shared_weak_count::__release_weak(v75);
      if ((SHIBYTE(v99[2]) & 0x80000000) == 0)
        goto LABEL_74;
      goto LABEL_73;
    }
  }
  if (SHIBYTE(v99[2]) < 0)
LABEL_73:
    operator delete(v99[0]);
LABEL_74:
  *(_QWORD *)__p = &off_250B0DCE8;
  v78 = v104;
  if (v104)
  {
    v79 = (unint64_t *)&v104->__shared_owners_;
    do
      v80 = __ldaxr(v79);
    while (__stlxr(v80 - 1, v79));
    if (!v80)
    {
      ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
      std::__shared_weak_count::__release_weak(v78);
    }
  }
  if (*(_QWORD *)&__p[16])
  {
    v102 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v100[2]) < 0)
    operator delete(v100[0]);
  v81 = (char *)operator new(4uLL);
  *(_DWORD *)v81 = 1102382323;
  sub_23A01DF14(&self->_scaleInput.__begin_, v81, v81 + 4, 1uLL);
  v82 = (uint64_t *)*((_QWORD *)self->_decoderNet.__ptr_ + 1);
  HIBYTE(v100[2]) = 5;
  strcpy((char *)v100, "scale");
  sub_23A04EBE4((uint64_t)__p, *v82, v82[1], (uint64_t)v100, (uint64_t)self->_scaleInput.__begin_);
  HIBYTE(v99[2]) = 5;
  strcpy((char *)v99, "scale");
  v111 = v99;
  v83 = sub_23A053FC4((uint64_t)&v108, (uint64_t)v99, (uint64_t)&unk_23A0A31B0, (__int128 **)&v111);
  v87 = v83;
  *((_DWORD *)v83 + 12) = *(_DWORD *)&__p[8];
  if (v83 + 40 != __p)
    sub_239FF49DC((_QWORD *)v83 + 7, *(char **)&__p[16], v102, (uint64_t)&v102[-*(_QWORD *)&__p[16]] >> 3);
  v89 = v103;
  v88 = v104;
  if (v104)
  {
    v90 = (unint64_t *)&v104->__shared_owners_;
    do
      v91 = __ldxr(v90);
    while (__stxr(v91 + 1, v90));
  }
  v92 = (std::__shared_weak_count *)*((_QWORD *)v87 + 11);
  *((_QWORD *)v87 + 10) = v89;
  *((_QWORD *)v87 + 11) = v88;
  if (v92)
  {
    v93 = (unint64_t *)&v92->__shared_owners_;
    do
      v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
      if ((SHIBYTE(v99[2]) & 0x80000000) == 0)
        goto LABEL_94;
      goto LABEL_93;
    }
  }
  if (SHIBYTE(v99[2]) < 0)
LABEL_93:
    operator delete(v99[0]);
LABEL_94:
  *(_QWORD *)__p = &off_250B0DCE8;
  v95 = v104;
  if (v104)
  {
    v96 = (unint64_t *)&v104->__shared_owners_;
    do
      v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }
  if (*(_QWORD *)&__p[16])
  {
    v102 = *(char **)&__p[16];
    operator delete(*(void **)&__p[16]);
  }
  if (SHIBYTE(v100[2]) < 0)
  {
    operator delete(v100[0]);
    p_inputTensors = &self->_inputTensors;
    if (&self->_inputTensors == (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)&v108)
      goto LABEL_106;
    goto LABEL_105;
  }
  p_inputTensors = &self->_inputTensors;
  if (&self->_inputTensors != (unordered_map<std::string, ik::Tensor, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, ik::Tensor>>> *)&v108)
  {
LABEL_105:
    self->_inputTensors.__table_.__p3_.__value_ = v110;
    sub_23A05440C(p_inputTensors, (_QWORD *)v109, 0);
  }
LABEL_106:
  objc_msgSend_copyInputState_(self, v84, (uint64_t)a5, v85, v86, *(_QWORD *)"in_word_ids_mask", *(_QWORD *)"ids_mask");
  operator delete(v81);
  operator delete(v67);
  operator delete(v50);
  if (v105)
    operator delete(v105);
  sub_239FF5234((uint64_t)&v108);
}

- (void)copyInputState:(const void *)a3
{
  char *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *p_pair1;
  int v6;
  size_t v7;
  unint64_t v8;
  __int128 *p_dst;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  unint64_t v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v16;
  __int128 *v17;
  unint64_t v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v21;
  int left_high;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v23;
  void *v24;
  size_t v25;
  int v26;
  int v27;
  _QWORD *v28;
  _BYTE *v29;
  void *v30;
  _QWORD *v31;
  uint64_t *v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  _BYTE *v37;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v45;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v46;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v47;
  __int128 *v48;
  size_t v49;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v50;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v51;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v52;
  int v53;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v54;
  size_t v55;
  size_t v56;
  int v57;
  int v58;
  _QWORD *p_left;
  _BYTE *v60;
  void *v61;
  _QWORD *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  _BYTE *v67;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t **v77;
  uint64_t **v78;
  uint64_t *v79;
  unint64_t v80;
  uint64_t **v81;
  uint64_t *v82;
  uint64_t **v83;
  uint64_t *v84;
  uint64_t *v85;
  std::__shared_weak_count *v86;
  uint64_t v87;
  unint64_t *p_shared_owners;
  unint64_t v89;
  std::__shared_weak_count *v90;
  unint64_t *v91;
  unint64_t v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  char *v96;
  char *v97;
  void *v98;
  char *v99;
  void *v100;
  NSObject *v101;
  uint64_t **p_stateInputEspressoBuffers;
  char **v103;
  unint64_t v104;
  uint8_t buf[8];
  int v106;
  void *__p;
  char *v108;
  uint64_t v109;
  std::__shared_weak_count *v110;
  __int128 __dst;
  int64_t v112;
  void *v113[2];
  unsigned __int8 v114;
  void *v115;
  char *v116;
  void *v117;
  char *v118;
  __int128 *v119[2];

  if (!*(_QWORD *)a3)
  {
    sub_23A016E78();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239FE9000, v101, OS_LOG_TYPE_INFO, "No input state to be copied!", buf, 2u);
    }

    return;
  }
  sub_23A05479C((uint64_t)&v117, *(_QWORD *)a3);
  v4 = v118;
  if (!v118)
    goto LABEL_180;
  p_pair1 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
  p_stateInputEspressoBuffers = (uint64_t **)&self->_stateInputEspressoBuffers;
  while (2)
  {
    v103 = (char **)v4;
    sub_23A0521B0(v113, (__int128 *)v4 + 1);
    v6 = (char)v114;
    if ((v114 & 0x80u) == 0)
      v7 = v114;
    else
      v7 = (size_t)v113[1];
    v8 = v7 + 3;
    if (v7 + 3 >= 0x7FFFFFFFFFFFFFF8)
      sub_239FEBDE0();
    if (v8 >= 0x17)
    {
      v10 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v10 = v8 | 7;
      v11 = v10 + 1;
      p_dst = (__int128 *)operator new(v10 + 1);
      *((_QWORD *)&__dst + 1) = v7 + 3;
      v112 = v11 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      v112 = 0;
      __dst = 0uLL;
      p_dst = &__dst;
      HIBYTE(v112) = v7 + 3;
      if (!v7)
        goto LABEL_19;
    }
    if (v6 >= 0)
      v12 = v113;
    else
      v12 = (void **)v113[0];
    memmove(p_dst, v12, v7);
LABEL_19:
    v13 = 0;
    *(_DWORD *)((char *)p_dst + v7) = 7235935;
    v104 = 1;
LABEL_25:
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
    v15 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    v16 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    if (!p_pair1->__value_.__left_)
      goto LABEL_52;
    if (v112 >= 0)
      v17 = &__dst;
    else
      v17 = (__int128 *)__dst;
    if (v112 >= 0)
      v18 = HIBYTE(v112);
    else
      v18 = *((_QWORD *)&__dst + 1);
    while (1)
    {
      while (1)
      {
        v16 = left;
        v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
        v19 = left + 4;
        v20 = v21;
        left_high = SHIBYTE(v19[2].__value_.__left_);
        v23 = left_high >= 0 ? v19 : v20;
        v24 = left_high >= 0 ? (void *)HIBYTE(v19[2].__value_.__left_) : v19[1].__value_.__left_;
        v25 = (unint64_t)v24 >= v18 ? v18 : (size_t)v24;
        v26 = memcmp(v17, v23, v25);
        if (v26)
          break;
        if (v18 >= (unint64_t)v24)
          goto LABEL_46;
LABEL_32:
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16->__value_.__left_;
        v15 = v16;
        if (!v16->__value_.__left_)
          goto LABEL_52;
      }
      if (v26 < 0)
        goto LABEL_32;
LABEL_46:
      v27 = memcmp(v23, v17, v25);
      if (v27)
      {
        if ((v27 & 0x80000000) == 0)
          break;
        goto LABEL_50;
      }
      if ((unint64_t)v24 >= v18)
        break;
LABEL_50:
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16[1].__value_.__left_;
      if (!left)
      {
        v15 = v16 + 1;
LABEL_52:
        v28 = operator new(0x50uLL);
        v29 = v28 + 4;
        if (SHIBYTE(v112) < 0)
        {
          sub_239FF1F64(v29, (void *)__dst, *((unint64_t *)&__dst + 1));
        }
        else
        {
          *(_OWORD *)v29 = __dst;
          v28[6] = v112;
        }
        v28[7] = 0;
        v28[8] = 0;
        v28[9] = 0;
        *v28 = 0;
        v28[1] = 0;
        v28[2] = v16;
        v15->__value_.__left_ = v28;
        v30 = *(void **)self->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
        v31 = v28;
        if (v30)
        {
          self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v30;
          v31 = v15->__value_.__left_;
        }
        v32 = (uint64_t *)p_pair1->__value_.__left_;
        v33 = v31 == p_pair1->__value_.__left_;
        *((_BYTE *)v31 + 24) = v33;
        if (!v33)
        {
          do
          {
            v34 = v31[2];
            if (*(_BYTE *)(v34 + 24))
              break;
            v35 = *(uint64_t **)(v34 + 16);
            v36 = *v35;
            if (*v35 == v34)
            {
              v39 = v35[1];
              if (!v39 || (v40 = *(unsigned __int8 *)(v39 + 24), v37 = (_BYTE *)(v39 + 24), v40))
              {
                if (*(_QWORD **)v34 == v31)
                {
                  *(_BYTE *)(v34 + 24) = 1;
                  *((_BYTE *)v35 + 24) = 0;
                  v43 = *(_QWORD *)(v34 + 8);
                  *v35 = v43;
                  if (v43)
                    goto LABEL_72;
                }
                else
                {
                  v41 = *(uint64_t **)(v34 + 8);
                  v42 = *v41;
                  *(_QWORD *)(v34 + 8) = *v41;
                  if (v42)
                  {
                    *(_QWORD *)(v42 + 16) = v34;
                    v35 = *(uint64_t **)(v34 + 16);
                  }
                  v41[2] = (uint64_t)v35;
                  *(_QWORD *)(*(_QWORD *)(v34 + 16) + 8 * (**(_QWORD **)(v34 + 16) != v34)) = v41;
                  *v41 = v34;
                  *(_QWORD *)(v34 + 16) = v41;
                  v35 = (uint64_t *)v41[2];
                  v34 = *v35;
                  *((_BYTE *)v41 + 24) = 1;
                  *((_BYTE *)v35 + 24) = 0;
                  v43 = *(_QWORD *)(v34 + 8);
                  *v35 = v43;
                  if (v43)
LABEL_72:
                    *(_QWORD *)(v43 + 16) = v35;
                }
                *(_QWORD *)(v34 + 16) = v35[2];
                *(_QWORD *)(v35[2] + 8 * (*(_QWORD *)v35[2] != (_QWORD)v35)) = v34;
                *(_QWORD *)(v34 + 8) = v35;
LABEL_80:
                v35[2] = v34;
                break;
              }
            }
            else if (!v36 || (v38 = *(unsigned __int8 *)(v36 + 24), v37 = (_BYTE *)(v36 + 24), v38))
            {
              if (*(_QWORD **)v34 == v31)
              {
                v75 = v31[1];
                *(_QWORD *)v34 = v75;
                if (v75)
                {
                  *(_QWORD *)(v75 + 16) = v34;
                  v35 = *(uint64_t **)(v34 + 16);
                }
                v31[2] = v35;
                *(_QWORD *)(*(_QWORD *)(v34 + 16) + 8 * (**(_QWORD **)(v34 + 16) != v34)) = v31;
                v31[1] = v34;
                *(_QWORD *)(v34 + 16) = v31;
                v35 = (uint64_t *)v31[2];
                *((_BYTE *)v31 + 24) = 1;
                *((_BYTE *)v35 + 24) = 0;
                v34 = v35[1];
                v44 = *(_QWORD **)v34;
                v35[1] = *(_QWORD *)v34;
                if (v44)
LABEL_78:
                  v44[2] = v35;
              }
              else
              {
                *(_BYTE *)(v34 + 24) = 1;
                *((_BYTE *)v35 + 24) = 0;
                v34 = v35[1];
                v44 = *(_QWORD **)v34;
                v35[1] = *(_QWORD *)v34;
                if (v44)
                  goto LABEL_78;
              }
              *(_QWORD *)(v34 + 16) = v35[2];
              *(_QWORD *)(v35[2] + 8 * (*(_QWORD *)v35[2] != (_QWORD)v35)) = v34;
              *(_QWORD *)v34 = v35;
              goto LABEL_80;
            }
            *(_BYTE *)(v34 + 24) = 1;
            v31 = v35;
            *((_BYTE *)v35 + 24) = v35 == v32;
            *v37 = 1;
          }
          while (v35 != v32);
        }
        ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
        if (v13 >= (uint64_t)(v28[8] - v28[7]) >> 3)
          goto LABEL_147;
LABEL_82:
        v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
        v46 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        v47 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        if (p_pair1->__value_.__left_)
        {
          if (v112 >= 0)
            v48 = &__dst;
          else
            v48 = (__int128 *)__dst;
          if (v112 >= 0)
            v49 = HIBYTE(v112);
          else
            v49 = *((_QWORD *)&__dst + 1);
          while (1)
          {
            v47 = v45;
            v52 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v45[4].__value_.__left_;
            v50 = v45 + 4;
            v51 = v52;
            v53 = SHIBYTE(v50[2].__value_.__left_);
            if (v53 >= 0)
              v54 = v50;
            else
              v54 = v51;
            if (v53 >= 0)
              v55 = HIBYTE(v50[2].__value_.__left_);
            else
              v55 = (size_t)v50[1].__value_.__left_;
            if (v55 >= v49)
              v56 = v49;
            else
              v56 = v55;
            v57 = memcmp(v48, v54, v56);
            if (v57)
            {
              if (v57 < 0)
                goto LABEL_89;
LABEL_103:
              v58 = memcmp(v54, v48, v56);
              if (v58)
              {
                if ((v58 & 0x80000000) == 0)
                  goto LABEL_131;
              }
              else if (v55 >= v49)
              {
LABEL_131:
                p_left = &v47->__value_.__left_;
                goto LABEL_24;
              }
              v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v47[1].__value_.__left_;
              if (!v45)
              {
                v46 = v47 + 1;
                break;
              }
            }
            else
            {
              if (v49 >= v55)
                goto LABEL_103;
LABEL_89:
              v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v47->__value_.__left_;
              v46 = v47;
              if (!v47->__value_.__left_)
                break;
            }
          }
        }
        p_left = operator new(0x50uLL);
        v60 = p_left + 4;
        if (SHIBYTE(v112) < 0)
        {
          sub_239FF1F64(v60, (void *)__dst, *((unint64_t *)&__dst + 1));
        }
        else
        {
          *(_OWORD *)v60 = __dst;
          p_left[6] = v112;
        }
        p_left[7] = 0;
        p_left[8] = 0;
        p_left[9] = 0;
        *p_left = 0;
        p_left[1] = 0;
        p_left[2] = v47;
        v46->__value_.__left_ = p_left;
        v61 = *(void **)self->_stateInputEspressoBuffersShape.__tree_.__begin_node_;
        v62 = p_left;
        if (v61)
        {
          self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = v61;
          v62 = v46->__value_.__left_;
        }
        v63 = (uint64_t *)p_pair1->__value_.__left_;
        v33 = v62 == p_pair1->__value_.__left_;
        *((_BYTE *)v62 + 24) = v33;
        if (!v33)
        {
          do
          {
            v64 = v62[2];
            if (*(_BYTE *)(v64 + 24))
              break;
            v65 = *(uint64_t **)(v64 + 16);
            v66 = *v65;
            if (*v65 == v64)
            {
              v69 = v65[1];
              if (!v69 || (v70 = *(unsigned __int8 *)(v69 + 24), v67 = (_BYTE *)(v69 + 24), v70))
              {
                if (*(_QWORD **)v64 == v62)
                {
                  *(_BYTE *)(v64 + 24) = 1;
                  *((_BYTE *)v65 + 24) = 0;
                  v73 = *(_QWORD *)(v64 + 8);
                  *v65 = v73;
                  if (v73)
                    goto LABEL_129;
                }
                else
                {
                  v71 = *(uint64_t **)(v64 + 8);
                  v72 = *v71;
                  *(_QWORD *)(v64 + 8) = *v71;
                  if (v72)
                  {
                    *(_QWORD *)(v72 + 16) = v64;
                    v65 = *(uint64_t **)(v64 + 16);
                  }
                  v71[2] = (uint64_t)v65;
                  *(_QWORD *)(*(_QWORD *)(v64 + 16) + 8 * (**(_QWORD **)(v64 + 16) != v64)) = v71;
                  *v71 = v64;
                  *(_QWORD *)(v64 + 16) = v71;
                  v65 = (uint64_t *)v71[2];
                  v64 = *v65;
                  *((_BYTE *)v71 + 24) = 1;
                  *((_BYTE *)v65 + 24) = 0;
                  v73 = *(_QWORD *)(v64 + 8);
                  *v65 = v73;
                  if (v73)
LABEL_129:
                    *(_QWORD *)(v73 + 16) = v65;
                }
                *(_QWORD *)(v64 + 16) = v65[2];
                *(_QWORD *)(v65[2] + 8 * (*(_QWORD *)v65[2] != (_QWORD)v65)) = v64;
                *(_QWORD *)(v64 + 8) = v65;
LABEL_22:
                v65[2] = v64;
                break;
              }
            }
            else if (!v66 || (v68 = *(unsigned __int8 *)(v66 + 24), v67 = (_BYTE *)(v66 + 24), v68))
            {
              if (*(_QWORD **)v64 == v62)
              {
                v76 = v62[1];
                *(_QWORD *)v64 = v76;
                if (v76)
                {
                  *(_QWORD *)(v76 + 16) = v64;
                  v65 = *(uint64_t **)(v64 + 16);
                }
                v62[2] = v65;
                *(_QWORD *)(*(_QWORD *)(v64 + 16) + 8 * (**(_QWORD **)(v64 + 16) != v64)) = v62;
                v62[1] = v64;
                *(_QWORD *)(v64 + 16) = v62;
                v65 = (uint64_t *)v62[2];
                *((_BYTE *)v62 + 24) = 1;
                *((_BYTE *)v65 + 24) = 0;
                v64 = v65[1];
                v74 = *(_QWORD **)v64;
                v65[1] = *(_QWORD *)v64;
                if (!v74)
                  goto LABEL_21;
              }
              else
              {
                *(_BYTE *)(v64 + 24) = 1;
                *((_BYTE *)v65 + 24) = 0;
                v64 = v65[1];
                v74 = *(_QWORD **)v64;
                v65[1] = *(_QWORD *)v64;
                if (!v74)
                  goto LABEL_21;
              }
              v74[2] = v65;
LABEL_21:
              *(_QWORD *)(v64 + 16) = v65[2];
              *(_QWORD *)(v65[2] + 8 * (*(_QWORD *)v65[2] != (_QWORD)v65)) = v64;
              *(_QWORD *)v64 = v65;
              goto LABEL_22;
            }
            *(_BYTE *)(v64 + 24) = 1;
            v62 = v65;
            *((_BYTE *)v65 + 24) = v65 == v63;
            *v67 = 1;
          }
          while (v65 != v63);
        }
        ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
LABEL_24:
        v104 *= *(_QWORD *)(p_left[7] + 8 * v13++);
        goto LABEL_25;
      }
    }
    if (v13 < ((char *)v16[8].__value_.__left_ - (char *)v16[7].__value_.__left_) >> 3)
      goto LABEL_82;
LABEL_147:
    if (v104)
    {
      *(_QWORD *)buf = &__dst;
      v77 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)buf);
      if (v104 > ((char *)v77[8] - (char *)v77[7]) >> 2)
      {
        *(_QWORD *)buf = &__dst;
        v78 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)buf);
        v79 = v78[7];
        v80 = ((char *)v78[8] - (char *)v79) >> 2;
        if (v104 <= v80)
        {
          if (v104 < v80)
            v78[8] = (uint64_t *)((char *)v79 + 4 * v104);
        }
        else
        {
          sub_23A051E20((uint64_t)(v78 + 7), v104 - v80);
        }
      }
      *(_QWORD *)buf = &__dst;
      v81 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)buf)
          + 7;
      if (v81 != (uint64_t **)&v115)
        sub_23A01DF14(v81, (char *)v115, v116, (v116 - (_BYTE *)v115) >> 2);
      v82 = (uint64_t *)*((_QWORD *)self->_decoderNet.__ptr_ + 1);
      v119[0] = &__dst;
      v83 = sub_23A0529D4(p_stateInputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, v119);
      sub_23A04EBE4((uint64_t)buf, *v82, v82[1], (uint64_t)&__dst, (uint64_t)v83[7]);
      v119[0] = &__dst;
      v84 = sub_23A054D88((uint64_t)&self->_inputTensors, (uint64_t)&__dst, (uint64_t)&unk_23A0A31B0, v119);
      v85 = v84;
      *((_DWORD *)v84 + 12) = v106;
      if (v84 + 5 != (uint64_t *)buf)
        sub_239FF49DC(v84 + 7, (char *)__p, v108, (v108 - (_BYTE *)__p) >> 3);
      v87 = v109;
      v86 = v110;
      if (v110)
      {
        p_shared_owners = (unint64_t *)&v110->__shared_owners_;
        do
          v89 = __ldxr(p_shared_owners);
        while (__stxr(v89 + 1, p_shared_owners));
      }
      v90 = (std::__shared_weak_count *)v85[11];
      v85[10] = v87;
      v85[11] = (uint64_t)v86;
      if (!v90)
        goto LABEL_164;
      v91 = (unint64_t *)&v90->__shared_owners_;
      do
        v92 = __ldaxr(v91);
      while (__stlxr(v92 - 1, v91));
      if (!v92)
      {
        ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
        std::__shared_weak_count::__release_weak(v90);
        *(_QWORD *)buf = &off_250B0DCE8;
        v93 = v110;
        if (v110)
        {
LABEL_165:
          v94 = (unint64_t *)&v93->__shared_owners_;
          do
            v95 = __ldaxr(v94);
          while (__stlxr(v95 - 1, v94));
          if (!v95)
          {
            ((void (*)(std::__shared_weak_count *))v93->__on_zero_shared)(v93);
            std::__shared_weak_count::__release_weak(v93);
          }
        }
      }
      else
      {
LABEL_164:
        *(_QWORD *)buf = &off_250B0DCE8;
        v93 = v110;
        if (v110)
          goto LABEL_165;
      }
      if (__p)
      {
        v108 = (char *)__p;
        operator delete(__p);
      }
    }
    if (SHIBYTE(v112) < 0)
    {
      operator delete((void *)__dst);
      v96 = (char *)v115;
      if (v115)
      {
LABEL_174:
        v116 = v96;
        operator delete(v96);
      }
    }
    else
    {
      v96 = (char *)v115;
      if (v115)
        goto LABEL_174;
    }
    if ((char)v114 < 0)
      operator delete(v113[0]);
    v4 = *v103;
    if (*v103)
      continue;
    break;
  }
  v97 = v118;
  if (v118)
  {
    do
    {
      v99 = *(char **)v97;
      v100 = (void *)*((_QWORD *)v97 + 5);
      if (v100)
      {
        *((_QWORD *)v97 + 6) = v100;
        operator delete(v100);
      }
      if (v97[39] < 0)
        operator delete(*((void **)v97 + 2));
      operator delete(v97);
      v97 = v99;
    }
    while (v99);
  }
LABEL_180:
  v98 = v117;
  v117 = 0;
  if (v98)
    operator delete(v98);
}

- (ModelOutput)predict
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float *begin;
  unint64_t vocabSize;
  size_t v11;
  ModelOutput *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __shared_weak_count *v16;
  void *v17;
  unint64_t *v18;
  unint64_t v19;
  int64_t v20;
  float *v21;
  float *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  ModelOutput *result;
  void *__p;
  void *v30;
  std::__shared_weak_count *v31;
  ModelOutput *v32;
  _BYTE v33[40];

  sub_23A0505A4((uint64_t)self->_decoderNet.__ptr_, (uint64_t)&self->_outputTensors);
  sub_239FF1424((uint64_t)self->_decoderNet.__ptr_, (uint64_t)&self->_inputTensors, (uint64_t)v33);
  sub_239FF5234((uint64_t)v33);
  begin = self->_wordProbs.__begin_;
  vocabSize = self->_vocabSize;
  v32 = 0;
  if (vocabSize)
  {
    if ((vocabSize & 0x8000000000000000) != 0)
      sub_239FEBE68();
    v11 = 4 * vocabSize;
    v12 = (ModelOutput *)operator new(4 * vocabSize);
    vocabSize = (unint64_t)v12 + 4 * vocabSize;
    v32 = v12;
    memcpy(v12, begin, v11);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend_getOutputState(self, v5, v6, v7, v8);
  __p = 0;
  v13 = vocabSize - (_QWORD)v12;
  if ((ModelOutput *)vocabSize == v12)
  {
    v15 = 0;
    v14 = 0;
    v17 = v30;
    v16 = (__shared_weak_count *)v31;
    if (!v31)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v13 < 0)
    sub_239FEBE68();
  v14 = (char *)operator new(vocabSize - (_QWORD)v12);
  v15 = &v14[4 * (v13 >> 2)];
  __p = v14;
  memcpy(v14, v12, vocabSize - (_QWORD)v12);
  v17 = v30;
  v16 = (__shared_weak_count *)v31;
  if (v31)
  {
LABEL_10:
    v18 = (unint64_t *)((char *)v16 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
LABEL_12:
  retstr->var0.__begin_ = 0;
  retstr->var0.__end_ = 0;
  retstr->var0.__end_cap_.__value_ = 0;
  v20 = v15 - v14;
  if (v20)
  {
    if (v20 < 0)
      sub_239FEBE68();
    v21 = (float *)operator new(v20);
    retstr->var0.__begin_ = v21;
    v22 = &v21[v20 >> 2];
    retstr->var0.__end_cap_.__value_ = v22;
    memcpy(v21, v14, v20);
    retstr->var0.__end_ = v22;
  }
  retstr->var1.var0 = v17;
  retstr->var1.var1 = v16;
  if (v16)
  {
    v23 = (unint64_t *)((char *)v16 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
    retstr->var2 = 1;
    do
      v25 = __ldaxr(v23);
    while (__stlxr(v25 - 1, v23));
    if (!v25)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)v16 + 16))(v16);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
    }
  }
  else
  {
    retstr->var2 = 1;
  }
  if (__p)
    operator delete(__p);
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)())v31->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  result = v32;
  if (v32)
    operator delete(v32);
  return result;
}

- (shared_ptr<std::unordered_map<std::string,)getOutputState
{
  uint64_t *v2;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *begin_node;
  char *left;
  char *left_high;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  _BYTE *v9;
  char *v10;
  __int128 *v11;
  _OWORD *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  size_t v19;
  unint64_t v20;
  __int128 *p_dst;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  CSUImageCaptionDecoderAXKVCacheE1Network *v31;
  uint64_t v32;
  uint64_t v33;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v34;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v35;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v36;
  __int128 *v37;
  size_t v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v39;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v40;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v41;
  int v42;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v43;
  size_t v44;
  size_t v45;
  int v46;
  int v47;
  _QWORD *p_left;
  _BYTE *v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t *v53;
  BOOL v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  _BYTE *v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v67;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v68;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v69;
  char v70;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v71;
  size_t v72;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v73;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v74;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v75;
  int v76;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v77;
  size_t v78;
  size_t v79;
  int v80;
  int v81;
  _QWORD *v82;
  _BYTE *v83;
  __int128 v84;
  void *v85;
  _QWORD *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  _BYTE *v92;
  int v93;
  uint64_t v94;
  int v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v103;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v104;
  _QWORD *v105;
  __shared_weak_count *v106;
  char *v107;
  void *v108;
  char *v109;
  void *v110;
  uint64_t *v111;
  uint64_t **p_stateInputEspressoBuffersShape;
  uint64_t v113;
  uint64_t v114;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *p_pair1;
  void *__p;
  char *v122;
  char *v123;
  __int128 __dst;
  int64_t v125;
  void *v126;
  size_t v127;
  int64_t v128;
  __int128 v129;
  __int128 v130;
  int v131;
  void **v132;
  shared_ptr<std::unordered_map<std::string, std::vector<float>>> result;

  v111 = v2;
  v129 = 0u;
  v130 = 0u;
  v131 = 1065353216;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != &self->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    p_stateInputEspressoBuffersShape = (uint64_t **)&self->_stateInputEspressoBuffersShape;
    v116 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
    do
    {
      left = (char *)&begin_node[4];
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        left = (char *)begin_node[4].__value_.__left_;
        left_high = (char *)begin_node[5].__value_.__left_;
      }
      else
      {
        left_high = (char *)HIBYTE(begin_node[6].__value_.__left_);
      }
      v6 = (uint64_t)&left_high[(_QWORD)left - 4];
      v7 = (unint64_t)(left_high - 4);
      if ((unint64_t)(left_high - 4) > 0x7FFFFFFFFFFFFFF7)
        sub_239FEBDE0();
      if (v7 > 0x16)
      {
        v15 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v7 | 7) != 0x17)
          v15 = v7 | 7;
        v16 = v15 + 1;
        v8 = operator new(v15 + 1);
        v127 = v7;
        v128 = v16 | 0x8000000000000000;
        v126 = v8;
        if (left == (char *)v6)
        {
LABEL_19:
          v9 = v8;
          goto LABEL_22;
        }
      }
      else
      {
        HIBYTE(v128) = (_BYTE)left_high - 4;
        v8 = &v126;
        if (left == (char *)v6)
          goto LABEL_19;
      }
      if (v7 < 0x20 || (unint64_t)((char *)v8 - left) < 0x20)
      {
        v9 = v8;
        v10 = left;
      }
      else
      {
        v9 = (char *)v8 + (v7 & 0xFFFFFFFFFFFFFFE0);
        v10 = &left[v7 & 0xFFFFFFFFFFFFFFE0];
        v11 = (__int128 *)(left + 16);
        v12 = v8 + 1;
        v13 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v14 = *v11;
          *(v12 - 1) = *(v11 - 1);
          *v12 = v14;
          v11 += 2;
          v12 += 2;
          v13 -= 32;
        }
        while (v13);
        if (v7 == (v7 & 0xFFFFFFFFFFFFFFE0))
          goto LABEL_22;
      }
      do
      {
        v17 = *v10++;
        *v9++ = v17;
      }
      while (v10 != (char *)v6);
LABEL_22:
      *v9 = 0;
      v18 = SHIBYTE(v128);
      if (v128 >= 0)
        v19 = HIBYTE(v128);
      else
        v19 = v127;
      v20 = v19 + 3;
      if (v19 + 3 > 0x7FFFFFFFFFFFFFF7)
        sub_239FEBDE0();
      if (v20 >= 0x17)
      {
        v22 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v20 | 7) != 0x17)
          v22 = v20 | 7;
        v23 = v22 + 1;
        p_dst = (__int128 *)operator new(v22 + 1);
        *((_QWORD *)&__dst + 1) = v19 + 3;
        v125 = v23 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        v125 = 0;
        __dst = 0uLL;
        p_dst = &__dst;
        HIBYTE(v125) = v19 + 3;
        if (!v19)
          goto LABEL_36;
      }
      if (v18 >= 0)
        v24 = &v126;
      else
        v24 = v126;
      memmove(p_dst, v24, v19);
LABEL_36:
      *(_DWORD *)((char *)p_dst + v19) = 7235935;
      __p = &__dst;
      v25 = sub_23A052844(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)&__p)[7][1];
      __p = &__dst;
      v26 = sub_23A052844(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)&__p)[7][2];
      __p = &__dst;
      v27 = v25 + 1;
      v117 = *sub_23A052844(p_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&unk_23A0A31B0, (__int128 **)&__p)[7];
      v28 = v26 * (v25 + 1) * v117;
      __p = 0;
      v122 = 0;
      v123 = 0;
      if (v28)
      {
        if (v28 >> 62)
          sub_239FEBE68();
        v29 = (char *)operator new(4 * v28);
        v30 = &v29[4 * v28];
        __p = v29;
        v123 = v30;
        bzero(v29, 4 * v26 * v117 * v27);
        v122 = v30;
      }
      v31 = self;
      if (v26)
      {
        v32 = 0;
        v33 = v117 * v25;
        v118 = v117 * v27;
        v119 = v117 * v25;
        v113 = 4 * v117 * v25;
        v114 = v26;
        while (1)
        {
          if (v33)
          {
            v34 = v116;
            v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v116->__value_.__left_;
            v36 = v116;
            if (v116->__value_.__left_)
            {
              if (v125 >= 0)
                v37 = &__dst;
              else
                v37 = (__int128 *)__dst;
              if (v125 >= 0)
                v38 = HIBYTE(v125);
              else
                v38 = *((_QWORD *)&__dst + 1);
              while (1)
              {
                v34 = v35;
                v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v35[4].__value_.__left_;
                v39 = v35 + 4;
                v40 = v41;
                v42 = SHIBYTE(v39[2].__value_.__left_);
                if (v42 >= 0)
                  v43 = v39;
                else
                  v43 = v40;
                if (v42 >= 0)
                  v44 = HIBYTE(v39[2].__value_.__left_);
                else
                  v44 = (size_t)v39[1].__value_.__left_;
                if (v44 >= v38)
                  v45 = v38;
                else
                  v45 = v44;
                v46 = memcmp(v37, v43, v45);
                if (v46)
                {
                  if (v46 < 0)
                    goto LABEL_54;
LABEL_68:
                  v47 = memcmp(v43, v37, v45);
                  if (v47)
                  {
                    if ((v47 & 0x80000000) == 0)
                      goto LABEL_96;
                  }
                  else if (v44 >= v38)
                  {
LABEL_96:
                    p_left = &v34->__value_.__left_;
                    v52 = v119;
                    goto LABEL_103;
                  }
                  v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v34[1].__value_.__left_;
                  if (!v35)
                  {
                    v36 = v34 + 1;
                    break;
                  }
                }
                else
                {
                  if (v38 >= v44)
                    goto LABEL_68;
LABEL_54:
                  v35 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v34->__value_.__left_;
                  v36 = v34;
                  if (!v34->__value_.__left_)
                    break;
                }
              }
            }
            p_left = operator new(0x50uLL);
            v49 = p_left + 4;
            if (SHIBYTE(v125) < 0)
            {
              sub_239FF1F64(v49, (void *)__dst, *((unint64_t *)&__dst + 1));
            }
            else
            {
              *(_OWORD *)v49 = __dst;
              p_left[6] = v125;
            }
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v34;
            v36->__value_.__left_ = p_left;
            v50 = *(void **)v31->_stateInputEspressoBuffers.__tree_.__begin_node_;
            v51 = p_left;
            v52 = v119;
            if (v50)
            {
              v31->_stateInputEspressoBuffers.__tree_.__begin_node_ = v50;
              v51 = v36->__value_.__left_;
            }
            v53 = (uint64_t *)v116->__value_.__left_;
            v54 = v51 == v116->__value_.__left_;
            *((_BYTE *)v51 + 24) = v54;
            if (!v54)
            {
              do
              {
                v55 = v51[2];
                if (*(_BYTE *)(v55 + 24))
                  break;
                v56 = *(uint64_t **)(v55 + 16);
                v57 = *v56;
                if (*v56 == v55)
                {
                  v60 = v56[1];
                  if (!v60 || (v61 = *(unsigned __int8 *)(v60 + 24), v58 = (_BYTE *)(v60 + 24), v61))
                  {
                    if (*(_QWORD **)v55 == v51)
                    {
                      *(_BYTE *)(v55 + 24) = 1;
                      *((_BYTE *)v56 + 24) = 0;
                      v64 = *(_QWORD *)(v55 + 8);
                      *v56 = v64;
                      if (v64)
                        goto LABEL_94;
                    }
                    else
                    {
                      v62 = *(uint64_t **)(v55 + 8);
                      v63 = *v62;
                      *(_QWORD *)(v55 + 8) = *v62;
                      if (v63)
                      {
                        *(_QWORD *)(v63 + 16) = v55;
                        v56 = *(uint64_t **)(v55 + 16);
                      }
                      v62[2] = (uint64_t)v56;
                      *(_QWORD *)(*(_QWORD *)(v55 + 16) + 8 * (**(_QWORD **)(v55 + 16) != v55)) = v62;
                      *v62 = v55;
                      *(_QWORD *)(v55 + 16) = v62;
                      v56 = (uint64_t *)v62[2];
                      v55 = *v56;
                      *((_BYTE *)v62 + 24) = 1;
                      *((_BYTE *)v56 + 24) = 0;
                      v64 = *(_QWORD *)(v55 + 8);
                      *v56 = v64;
                      if (v64)
LABEL_94:
                        *(_QWORD *)(v64 + 16) = v56;
                    }
                    *(_QWORD *)(v55 + 16) = v56[2];
                    *(_QWORD *)(v56[2] + 8 * (*(_QWORD *)v56[2] != (_QWORD)v56)) = v55;
                    *(_QWORD *)(v55 + 8) = v56;
LABEL_101:
                    v56[2] = v55;
                    break;
                  }
                }
                else if (!v57 || (v59 = *(unsigned __int8 *)(v57 + 24), v58 = (_BYTE *)(v57 + 24), v59))
                {
                  if (*(_QWORD **)v55 == v51)
                  {
                    v101 = v51[1];
                    *(_QWORD *)v55 = v101;
                    if (v101)
                    {
                      *(_QWORD *)(v101 + 16) = v55;
                      v56 = *(uint64_t **)(v55 + 16);
                    }
                    v51[2] = v56;
                    *(_QWORD *)(*(_QWORD *)(v55 + 16) + 8 * (**(_QWORD **)(v55 + 16) != v55)) = v51;
                    v51[1] = v55;
                    *(_QWORD *)(v55 + 16) = v51;
                    v56 = (uint64_t *)v51[2];
                    *((_BYTE *)v51 + 24) = 1;
                    *((_BYTE *)v56 + 24) = 0;
                    v55 = v56[1];
                    v65 = *(_QWORD **)v55;
                    v56[1] = *(_QWORD *)v55;
                    if (v65)
LABEL_99:
                      v65[2] = v56;
                  }
                  else
                  {
                    *(_BYTE *)(v55 + 24) = 1;
                    *((_BYTE *)v56 + 24) = 0;
                    v55 = v56[1];
                    v65 = *(_QWORD **)v55;
                    v56[1] = *(_QWORD *)v55;
                    if (v65)
                      goto LABEL_99;
                  }
                  *(_QWORD *)(v55 + 16) = v56[2];
                  *(_QWORD *)(v56[2] + 8 * (*(_QWORD *)v56[2] != (_QWORD)v56)) = v55;
                  *(_QWORD *)v55 = v56;
                  goto LABEL_101;
                }
                *(_BYTE *)(v55 + 24) = 1;
                v51 = v56;
                *((_BYTE *)v56 + 24) = v56 == v53;
                *v58 = 1;
              }
              while (v56 != v53);
            }
            ++v31->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
LABEL_103:
            memcpy((char *)__p + 4 * v118 * v32, (const void *)(p_left[7] + 4 * v32 * v52), v113);
          }
          v67 = p_pair1;
          v66 = (char *)__p;
          v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
          v69 = p_pair1;
          if (p_pair1->__value_.__left_)
            break;
LABEL_131:
          v82 = operator new(0x50uLL);
          v83 = v82 + 4;
          if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
          {
            sub_239FF1F64(v83, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
          }
          else
          {
            v84 = *(_OWORD *)&begin_node[4].__value_.__left_;
            v82[6] = begin_node[6].__value_.__left_;
            *(_OWORD *)v83 = v84;
          }
          v31 = self;
          v82[7] = 0;
          v82[8] = 0;
          v82[9] = 0;
          *v82 = 0;
          v82[1] = 0;
          v82[2] = v67;
          v69->__value_.__left_ = v82;
          v85 = *(void **)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
          v86 = v82;
          v33 = v119;
          if (v85)
          {
            self->_stateOutputEspressoBuffers.__tree_.__begin_node_ = v85;
            v86 = v69->__value_.__left_;
          }
          v87 = (uint64_t *)p_pair1->__value_.__left_;
          v54 = v86 == p_pair1->__value_.__left_;
          *((_BYTE *)v86 + 24) = v54;
          v88 = v114;
          if (!v54)
          {
            do
            {
              v89 = v86[2];
              if (*(_BYTE *)(v89 + 24))
                break;
              v90 = *(uint64_t **)(v89 + 16);
              v91 = *v90;
              if (*v90 == v89)
              {
                v94 = v90[1];
                if (!v94 || (v95 = *(unsigned __int8 *)(v94 + 24), v92 = (_BYTE *)(v94 + 24), v95))
                {
                  if (*(_QWORD **)v89 == v86)
                  {
                    *(_BYTE *)(v89 + 24) = 1;
                    *((_BYTE *)v90 + 24) = 0;
                    v98 = *(_QWORD *)(v89 + 8);
                    *v90 = v98;
                    if (v98)
                      goto LABEL_151;
                  }
                  else
                  {
                    v96 = *(uint64_t **)(v89 + 8);
                    v97 = *v96;
                    *(_QWORD *)(v89 + 8) = *v96;
                    if (v97)
                    {
                      *(_QWORD *)(v97 + 16) = v89;
                      v90 = *(uint64_t **)(v89 + 16);
                    }
                    v96[2] = (uint64_t)v90;
                    *(_QWORD *)(*(_QWORD *)(v89 + 16) + 8 * (**(_QWORD **)(v89 + 16) != v89)) = v96;
                    *v96 = v89;
                    *(_QWORD *)(v89 + 16) = v96;
                    v90 = (uint64_t *)v96[2];
                    v89 = *v90;
                    *((_BYTE *)v96 + 24) = 1;
                    *((_BYTE *)v90 + 24) = 0;
                    v98 = *(_QWORD *)(v89 + 8);
                    *v90 = v98;
                    if (v98)
LABEL_151:
                      *(_QWORD *)(v98 + 16) = v90;
                  }
                  *(_QWORD *)(v89 + 16) = v90[2];
                  *(_QWORD *)(v90[2] + 8 * (*(_QWORD *)v90[2] != (_QWORD)v90)) = v89;
                  *(_QWORD *)(v89 + 8) = v90;
LABEL_43:
                  v90[2] = v89;
                  break;
                }
              }
              else if (!v91 || (v93 = *(unsigned __int8 *)(v91 + 24), v92 = (_BYTE *)(v91 + 24), v93))
              {
                if (*(_QWORD **)v89 == v86)
                {
                  v100 = v86[1];
                  *(_QWORD *)v89 = v100;
                  if (v100)
                  {
                    *(_QWORD *)(v100 + 16) = v89;
                    v90 = *(uint64_t **)(v89 + 16);
                  }
                  v86[2] = v90;
                  *(_QWORD *)(*(_QWORD *)(v89 + 16) + 8 * (**(_QWORD **)(v89 + 16) != v89)) = v86;
                  v86[1] = v89;
                  *(_QWORD *)(v89 + 16) = v86;
                  v90 = (uint64_t *)v86[2];
                  *((_BYTE *)v86 + 24) = 1;
                  *((_BYTE *)v90 + 24) = 0;
                  v89 = v90[1];
                  v99 = *(_QWORD **)v89;
                  v90[1] = *(_QWORD *)v89;
                  if (!v99)
                    goto LABEL_42;
                }
                else
                {
                  *(_BYTE *)(v89 + 24) = 1;
                  *((_BYTE *)v90 + 24) = 0;
                  v89 = v90[1];
                  v99 = *(_QWORD **)v89;
                  v90[1] = *(_QWORD *)v89;
                  if (!v99)
                    goto LABEL_42;
                }
                v99[2] = v90;
LABEL_42:
                *(_QWORD *)(v89 + 16) = v90[2];
                *(_QWORD *)(v90[2] + 8 * (*(_QWORD *)v90[2] != (_QWORD)v90)) = v89;
                *(_QWORD *)v89 = v90;
                goto LABEL_43;
              }
              *(_BYTE *)(v89 + 24) = 1;
              v86 = v90;
              *((_BYTE *)v90 + 24) = v90 == v87;
              *v92 = 1;
            }
            while (v90 != v87);
          }
          ++self->_stateOutputEspressoBuffers.__tree_.__pair3_.__value_;
LABEL_45:
          memcpy(&v66[4 * v118 * v32 + 4 * v33], (const void *)(v82[7] + 4 * v32 * v117), 4 * v117);
          if (++v32 == v88)
            goto LABEL_169;
        }
        v70 = HIBYTE(begin_node[6].__value_.__left_);
        if (v70 >= 0)
          v71 = begin_node + 4;
        else
          v71 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[4].__value_.__left_;
        if (v70 >= 0)
          v72 = HIBYTE(begin_node[6].__value_.__left_);
        else
          v72 = (size_t)begin_node[5].__value_.__left_;
        while (1)
        {
          v67 = v68;
          v75 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v68[4].__value_.__left_;
          v73 = v68 + 4;
          v74 = v75;
          v76 = SHIBYTE(v73[2].__value_.__left_);
          if (v76 >= 0)
            v77 = v73;
          else
            v77 = v74;
          if (v76 >= 0)
            v78 = HIBYTE(v73[2].__value_.__left_);
          else
            v78 = (size_t)v73[1].__value_.__left_;
          if (v78 >= v72)
            v79 = v72;
          else
            v79 = v78;
          v80 = memcmp(v71, v77, v79);
          if (v80)
          {
            if (v80 < 0)
              goto LABEL_111;
          }
          else if (v72 < v78)
          {
LABEL_111:
            v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v67->__value_.__left_;
            v69 = v67;
            if (!v67->__value_.__left_)
              goto LABEL_131;
            continue;
          }
          v81 = memcmp(v77, v71, v79);
          if (v81)
          {
            if ((v81 & 0x80000000) == 0)
              goto LABEL_153;
          }
          else if (v78 >= v72)
          {
LABEL_153:
            v82 = &v67->__value_.__left_;
            v31 = self;
            v88 = v114;
            v33 = v119;
            goto LABEL_45;
          }
          v68 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v67[1].__value_.__left_;
          if (!v68)
          {
            v69 = v67 + 1;
            goto LABEL_131;
          }
        }
      }
LABEL_169:
      v132 = &v126;
      v102 = sub_23A055218((uint64_t)&v129, (uint64_t)&v126, (uint64_t)&unk_23A0A31B0, (__int128 **)&v132) + 5;
      if (v102 != (uint64_t *)&__p)
        sub_23A01DF14(v102, (char *)__p, v122, (v122 - (_BYTE *)__p) >> 2);
      if (__p)
      {
        v122 = (char *)__p;
        operator delete(__p);
      }
      if (SHIBYTE(v125) < 0)
      {
        operator delete((void *)__dst);
        if ((SHIBYTE(v128) & 0x80000000) == 0)
        {
LABEL_175:
          v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v103)
            goto LABEL_179;
          goto LABEL_181;
        }
      }
      else if ((SHIBYTE(v128) & 0x80000000) == 0)
      {
        goto LABEL_175;
      }
      operator delete(v126);
      v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v103)
      {
        do
        {
LABEL_179:
          v104 = v103;
          v103 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v103->__value_.__left_;
        }
        while (v103);
        goto LABEL_3;
      }
      do
      {
LABEL_181:
        v104 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
        v54 = v104->__value_.__left_ == begin_node;
        begin_node = v104;
      }
      while (!v54);
LABEL_3:
      begin_node = v104;
    }
    while (v104 != p_pair1);
  }
  v105 = operator new(0x40uLL);
  v105[2] = 0;
  *v105 = &unk_250B0BFD0;
  v105[1] = 0;
  *v111 = sub_23A05479C((uint64_t)(v105 + 3), (uint64_t)&v129);
  v111[1] = (uint64_t)v105;
  v107 = (char *)v130;
  if ((_QWORD)v130)
  {
    do
    {
      v109 = *(char **)v107;
      v110 = (void *)*((_QWORD *)v107 + 5);
      if (v110)
      {
        *((_QWORD *)v107 + 6) = v110;
        operator delete(v110);
      }
      if (v107[39] < 0)
        operator delete(*((void **)v107 + 2));
      operator delete(v107);
      v107 = v109;
    }
    while (v109);
  }
  v108 = (void *)v129;
  *(_QWORD *)&v129 = 0;
  if (v108)
    operator delete(v108);
  result.var1 = v106;
  result.var0 = v108;
  return result;
}

- (shared_ptr<ik::EspressoNet>)decoderNet
{
  EspressoNet **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<ik::EspressoNet> result;

  cntrl = self->_decoderNet.__cntrl_;
  *v2 = self->_decoderNet.__ptr_;
  v2[1] = (EspressoNet *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EspressoNet *)self;
  return result;
}

- (EspressoTensor)inputTokens
{
  EspressoTensor *v3;
  int ptr;
  void **v6;
  __shared_weak_count *cntrl;
  int64_t v8;
  unint64_t *v9;
  unint64_t *v10;
  __shared_weak_count *end;
  unint64_t *v12;
  unint64_t v13;

  v3 = self;
  retstr->_vptr$Tensor = (void **)&off_250B0DCE8;
  ptr = (int)self[5].storage_.__ptr_;
  retstr->shape_.sizes_.__begin_ = 0;
  retstr->type_ = ptr;
  retstr->shape_.sizes_.__end_ = 0;
  retstr->shape_.sizes_.__end_cap_.__value_ = 0;
  cntrl = self[5].storage_.__cntrl_;
  v6 = self[6]._vptr$Tensor;
  v8 = (char *)v6 - (char *)cntrl;
  if (v6 != (void **)cntrl)
  {
    if (v8 < 0)
      sub_239FEBE68();
    v9 = (unint64_t *)operator new((char *)v6 - (char *)cntrl);
    retstr->shape_.sizes_.__begin_ = v9;
    v10 = &v9[v8 >> 3];
    retstr->shape_.sizes_.__end_cap_.__value_ = v10;
    self = (EspressoTensor *)memcpy(v9, cntrl, v8);
    retstr->shape_.sizes_.__end_ = v10;
  }
  end = (__shared_weak_count *)v3[6].shape_.sizes_.__end_;
  retstr->storage_.__ptr_ = (TensorStorage *)v3[6].shape_.sizes_.__begin_;
  retstr->storage_.__cntrl_ = end;
  if (end)
  {
    v12 = (unint64_t *)((char *)end + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  retstr->_vptr$Tensor = (void **)&off_250B0DB88;
  return self;
}

- (map<std::string,)stateOutputEspressoBuffers
{
  uint64_t *p_pair1;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v5;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *left;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **value;
  BOOL v9;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[5].__tree_.__begin_node_;
  v5 = &self[5].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[5].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_23A052354((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (__int128 *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node->__tree_.__pair3_.__value_;
          v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)v5);
  }
  return self;
}

- (map<std::string,)stateInputEspressoBuffers
{
  uint64_t *p_pair1;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v5;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *left;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **value;
  BOOL v9;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[6].__tree_.__begin_node_;
  v5 = &self[6].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[6].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_23A052354((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (__int128 *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node->__tree_.__pair3_.__value_;
          v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)v5);
  }
  return self;
}

- (map<std::string,)stateInputEspressoBuffersShape
{
  uint64_t *p_pair1;
  map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v5;
  map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *left;
  map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **value;
  BOOL v9;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = (uint64_t *)&retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)self[7].__tree_.__begin_node_;
  v5 = &self[7].__tree_.__pair1_;
  if (begin_node != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)&self[7].__tree_.__pair1_)
  {
    do
    {
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)sub_23A0524F8((uint64_t **)retstr, p_pair1, (const void **)&begin_node[1].__tree_.__pair1_.__value_.__left_, (__int128 *)&begin_node[1].__tree_.__pair1_);
      left = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)begin_node->__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        do
        {
          value = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)left;
          left = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)left->__tree_.__begin_node_;
        }
        while (left);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)begin_node->__tree_.__pair3_.__value_;
          v9 = *value == begin_node;
          begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)value;
        }
        while (!v9);
      }
      begin_node = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)value;
    }
    while (value != (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> **)v5);
  }
  return self;
}

- (vector<float,)inWords
{
  float *end;
  float *begin;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[8].__begin_;
  end = self[8].__end_;
  v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0)
      sub_239FEBE68();
    v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)inputMask
{
  float *end;
  float *begin;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[9].__begin_;
  end = self[9].__end_;
  v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0)
      sub_239FEBE68();
    v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)positionInput
{
  float *end;
  float *begin;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[10].__begin_;
  end = self[10].__end_;
  v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0)
      sub_239FEBE68();
    v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)scaleInput
{
  float *end;
  float *begin;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[11].__begin_;
  end = self[11].__end_;
  v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0)
      sub_239FEBE68();
    v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (vector<float,)wordProbs
{
  float *end;
  float *begin;
  int64_t v6;
  float *v7;
  float *v8;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = self[12].__begin_;
  end = self[12].__end_;
  v6 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v6 < 0)
      sub_239FEBE68();
    v7 = (float *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v7;
    v8 = &v7[v6 >> 2];
    retstr->__end_cap_.__value_ = v8;
    self = (vector<float, std::allocator<float>> *)memcpy(v7, begin, v6);
    retstr->__end_ = v8;
  }
  return self;
}

- (unint64_t)sequenceLength
{
  return self->_sequenceLength;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *begin;
  float *v7;
  float *v8;
  float *v9;
  float *v10;
  float *v11;
  __shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;

  self->_inputTokens._vptr$Tensor = (void **)&off_250B0DCE8;
  cntrl = self->_inputTokens.storage_.__cntrl_;
  if (!cntrl)
    goto LABEL_5;
  v4 = (unint64_t *)((char *)cntrl + 8);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (v5)
  {
LABEL_5:
    begin = self->_inputTokens.shape_.sizes_.__begin_;
    if (!begin)
      goto LABEL_7;
    goto LABEL_6;
  }
  (*(void (**)(__shared_weak_count *, SEL))(*(_QWORD *)cntrl + 16))(cntrl, a2);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  begin = self->_inputTokens.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_6:
    self->_inputTokens.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_7:
  v7 = self->_wordProbs.__begin_;
  if (v7)
  {
    self->_wordProbs.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_scaleInput.__begin_;
  if (v8)
  {
    self->_scaleInput.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_positionInput.__begin_;
  if (v9)
  {
    self->_positionInput.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_inputMask.__begin_;
  if (v10)
  {
    self->_inputMask.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->_inWords.__begin_;
  if (v11)
  {
    self->_inWords.__end_ = v11;
    operator delete(v11);
  }
  sub_23A052488((uint64_t)&self->_stateInputEspressoBuffersShape, (char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  sub_23A052488((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  sub_23A052488((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  v12 = self->_decoderNet.__cntrl_;
  if (!v12)
    goto LABEL_21;
  v13 = (unint64_t *)((char *)v12 + 8);
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (!v14)
  {
    (*(void (**)(__shared_weak_count *))(*(_QWORD *)v12 + 16))(v12);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    sub_239FF5234((uint64_t)&self->_outputTensors);
    sub_239FF5234((uint64_t)&self->_inputTensors);
  }
  else
  {
LABEL_21:
    sub_239FF5234((uint64_t)&self->_outputTensors);
    sub_239FF5234((uint64_t)&self->_inputTensors);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 15) = (char *)self + 128;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = (char *)self + 152;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = (char *)self + 176;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 80) = 4;
  *((_QWORD *)self + 45) = 0;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = &off_250B0DB88;
  return self;
}

@end
