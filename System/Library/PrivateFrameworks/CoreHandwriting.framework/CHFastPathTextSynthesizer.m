@implementation CHFastPathTextSynthesizer

- (CHFastPathTextSynthesizer)initWithStyleInventory:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHFastPathTextSynthesizer *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  id v18;
  dispatch_queue_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void **p_begin;
  uint64_t *v24;
  uint64_t *v25;
  int64_t v26;
  unint64_t v27;
  uint64_t value;
  char *begin;
  char *v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  char *end;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *p_shared_owners;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  void **v65;
  char *v66;
  uint64_t *v67;
  uint64_t *v68;
  int64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  void *v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  char *v77;
  unint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t *v82;
  unint64_t v83;
  std::__shared_weak_count *v84;
  unint64_t *v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  unint64_t *v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t *v102;
  unint64_t v103;
  std::__shared_weak_count *v104;
  unint64_t *v105;
  unint64_t v106;
  CHAbstractFastPathStitchingStrategy *v107;
  CHAbstractFastPathStitchingStrategy *v108;
  uint64_t *v109;
  uint64_t *v110;
  void *v111;
  std::__shared_weak_count *v112;
  unint64_t *v113;
  unint64_t v114;
  uint64_t *v115;
  uint64_t *v116;
  void *v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  _QWORD *v122;
  uint64_t v123;
  void *v124;
  uint64_t *v125;
  void *__p;
  uint64_t *v127;

  v4 = a3;
  v10 = (CHFastPathTextSynthesizer *)objc_msgSend_init(self, v5, v6, v7, v8, v9);
  if (v10)
  {
    v11 = operator new();
    CoreHandwriting::synthesis::fast_path::CHFastPathCharacterHolderAppleStyle::CHFastPathCharacterHolderAppleStyle(v11, (const char *)1, 100, v12, v13, v14);
    v15 = (_QWORD *)operator new();
    v16 = v4;
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = 0xC800000002;
    *v15 = &off_1E77EF8E8;
    v15[1] = v15 + 2;
    v15[6] = 0;
    v15[7] = 0;
    v15[5] = v16;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = dispatch_queue_create("com.apple.CoreHandwriting.CHFPCharacterHolderStyleInventoryQueue", v17);
    v20 = (void *)v15[7];
    v15[7] = v19;

    CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::CHFastPathCharacterInventory((CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory *)&v124);
    v123 = v11;
    sub_1BE7CBB44((char **)&v124, &v123);
    v21 = v123;
    v123 = 0;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    v122 = v15;
    sub_1BE7CBB44((char **)&v124, (uint64_t *)&v122);
    v22 = (uint64_t)v122;
    v122 = 0;
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
    p_begin = &v10->_inventory._holders.__begin_;
    if (&v10->_inventory != (CHFastPathCharacterInventory *)&v124)
    {
      v25 = (uint64_t *)v124;
      v24 = v125;
      v26 = (char *)v125 - (_BYTE *)v124;
      v27 = ((char *)v125 - (_BYTE *)v124) >> 4;
      value = (uint64_t)v10->_inventory._holders.__end_cap_.__value_;
      begin = (char *)v10->_inventory._holders.__begin_;
      if (v27 <= (value - (uint64_t)begin) >> 4)
      {
        end = (char *)v10->_inventory._holders.__end_;
        v36 = (end - begin) >> 4;
        if (v36 >= v27)
        {
          if (v124 != v125)
          {
            do
            {
              v46 = *v25;
              v45 = v25[1];
              if (v45)
              {
                v47 = (unint64_t *)(v45 + 8);
                do
                  v48 = __ldxr(v47);
                while (__stxr(v48 + 1, v47));
              }
              v49 = (std::__shared_weak_count *)*((_QWORD *)begin + 1);
              *(_QWORD *)begin = v46;
              *((_QWORD *)begin + 1) = v45;
              if (v49)
              {
                p_shared_owners = (unint64_t *)&v49->__shared_owners_;
                do
                  v51 = __ldaxr(p_shared_owners);
                while (__stlxr(v51 - 1, p_shared_owners));
                if (!v51)
                {
                  ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
                  std::__shared_weak_count::__release_weak(v49);
                }
              }
              v25 += 2;
              begin += 16;
            }
            while (v25 != v24);
            end = (char *)v10->_inventory._holders.__end_;
          }
          while (end != begin)
          {
            v62 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
            if (v62)
            {
              v63 = (unint64_t *)&v62->__shared_owners_;
              do
                v64 = __ldaxr(v63);
              while (__stlxr(v64 - 1, v63));
              if (!v64)
              {
                ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
                std::__shared_weak_count::__release_weak(v62);
              }
            }
            end -= 16;
          }
          v10->_inventory._holders.__end_ = begin;
        }
        else
        {
          v37 = (uint64_t *)((char *)v124 + 16 * v36);
          if (end != begin)
          {
            do
            {
              v39 = *v25;
              v38 = v25[1];
              if (v38)
              {
                v40 = (unint64_t *)(v38 + 8);
                do
                  v41 = __ldxr(v40);
                while (__stxr(v41 + 1, v40));
              }
              v42 = (std::__shared_weak_count *)*((_QWORD *)begin + 1);
              *(_QWORD *)begin = v39;
              *((_QWORD *)begin + 1) = v38;
              if (v42)
              {
                v43 = (unint64_t *)&v42->__shared_owners_;
                do
                  v44 = __ldaxr(v43);
                while (__stlxr(v44 - 1, v43));
                if (!v44)
                {
                  ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
                  std::__shared_weak_count::__release_weak(v42);
                }
              }
              v25 += 2;
              begin += 16;
            }
            while (v25 != v37);
            begin = (char *)v10->_inventory._holders.__end_;
          }
          v58 = begin;
          if (v37 != v24)
          {
            v58 = begin;
            do
            {
              *(_QWORD *)v58 = *v37;
              v59 = v37[1];
              *((_QWORD *)v58 + 1) = v59;
              if (v59)
              {
                v60 = (unint64_t *)(v59 + 8);
                do
                  v61 = __ldxr(v60);
                while (__stxr(v61 + 1, v60));
              }
              v37 += 2;
              v58 += 16;
            }
            while (v37 != v24);
          }
          v10->_inventory._holders.__end_ = v58;
        }
      }
      else
      {
        if (begin)
        {
          v30 = (char *)v10->_inventory._holders.__end_;
          v31 = v10->_inventory._holders.__begin_;
          if (v30 != begin)
          {
            do
            {
              v32 = (std::__shared_weak_count *)*((_QWORD *)v30 - 1);
              if (v32)
              {
                v33 = (unint64_t *)&v32->__shared_owners_;
                do
                  v34 = __ldaxr(v33);
                while (__stlxr(v34 - 1, v33));
                if (!v34)
                {
                  ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
                  std::__shared_weak_count::__release_weak(v32);
                }
              }
              v30 -= 16;
            }
            while (v30 != begin);
            v31 = *p_begin;
          }
          v10->_inventory._holders.__end_ = begin;
          operator delete(v31);
          value = 0;
          *p_begin = 0;
          v10->_inventory._holders.__end_ = 0;
          v10->_inventory._holders.__end_cap_.__value_ = 0;
        }
        if (v26 < 0)
          goto LABEL_168;
        v52 = value >> 3;
        if (value >> 3 <= v27)
          v52 = v27;
        v53 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v52;
        if (v53 >> 60)
LABEL_168:
          sub_1BE61F930();
        v54 = operator new(16 * v53);
        v10->_inventory._holders.__begin_ = v54;
        v10->_inventory._holders.__end_ = v54;
        v10->_inventory._holders.__end_cap_.__value_ = &v54[2 * v53];
        while (v25 != v24)
        {
          *v54 = *v25;
          v55 = v25[1];
          v54[1] = v55;
          if (v55)
          {
            v56 = (unint64_t *)(v55 + 8);
            do
              v57 = __ldxr(v56);
            while (__stxr(v57 + 1, v56));
          }
          v25 += 2;
          v54 += 2;
        }
        v10->_inventory._holders.__end_ = v54;
      }
      v65 = &v10->_inventory._extensions.__begin_;
      v66 = (char *)v10->_inventory._extensions.__begin_;
      v68 = (uint64_t *)__p;
      v67 = v127;
      v69 = (char *)v127 - (_BYTE *)__p;
      v70 = ((char *)v127 - (_BYTE *)__p) >> 4;
      v71 = (uint64_t)v10->_inventory._extensions.__end_cap_.__value_;
      if (v70 <= (v71 - (uint64_t)v66) >> 4)
      {
        v77 = (char *)v10->_inventory._extensions.__end_;
        v78 = (v77 - v66) >> 4;
        if (v78 >= v70)
        {
          if (__p != v127)
          {
            do
            {
              v88 = *v68;
              v87 = v68[1];
              if (v87)
              {
                v89 = (unint64_t *)(v87 + 8);
                do
                  v90 = __ldxr(v89);
                while (__stxr(v90 + 1, v89));
              }
              v91 = (std::__shared_weak_count *)*((_QWORD *)v66 + 1);
              *(_QWORD *)v66 = v88;
              *((_QWORD *)v66 + 1) = v87;
              if (v91)
              {
                v92 = (unint64_t *)&v91->__shared_owners_;
                do
                  v93 = __ldaxr(v92);
                while (__stlxr(v93 - 1, v92));
                if (!v93)
                {
                  ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
                  std::__shared_weak_count::__release_weak(v91);
                }
              }
              v68 += 2;
              v66 += 16;
            }
            while (v68 != v67);
            v77 = (char *)v10->_inventory._extensions.__end_;
          }
          while (v77 != v66)
          {
            v104 = (std::__shared_weak_count *)*((_QWORD *)v77 - 1);
            if (v104)
            {
              v105 = (unint64_t *)&v104->__shared_owners_;
              do
                v106 = __ldaxr(v105);
              while (__stlxr(v106 - 1, v105));
              if (!v106)
              {
                ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
                std::__shared_weak_count::__release_weak(v104);
              }
            }
            v77 -= 16;
          }
          v10->_inventory._extensions.__end_ = v66;
        }
        else
        {
          v79 = (uint64_t *)((char *)__p + 16 * v78);
          if (v77 != v66)
          {
            do
            {
              v81 = *v68;
              v80 = v68[1];
              if (v80)
              {
                v82 = (unint64_t *)(v80 + 8);
                do
                  v83 = __ldxr(v82);
                while (__stxr(v83 + 1, v82));
              }
              v84 = (std::__shared_weak_count *)*((_QWORD *)v66 + 1);
              *(_QWORD *)v66 = v81;
              *((_QWORD *)v66 + 1) = v80;
              if (v84)
              {
                v85 = (unint64_t *)&v84->__shared_owners_;
                do
                  v86 = __ldaxr(v85);
                while (__stlxr(v86 - 1, v85));
                if (!v86)
                {
                  ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
                  std::__shared_weak_count::__release_weak(v84);
                }
              }
              v68 += 2;
              v66 += 16;
            }
            while (v68 != v79);
            v66 = (char *)v10->_inventory._extensions.__end_;
          }
          v100 = v66;
          if (v79 != v67)
          {
            v100 = v66;
            do
            {
              *(_QWORD *)v100 = *v79;
              v101 = v79[1];
              *((_QWORD *)v100 + 1) = v101;
              if (v101)
              {
                v102 = (unint64_t *)(v101 + 8);
                do
                  v103 = __ldxr(v102);
                while (__stxr(v103 + 1, v102));
              }
              v79 += 2;
              v100 += 16;
            }
            while (v79 != v67);
          }
          v10->_inventory._extensions.__end_ = v100;
        }
      }
      else
      {
        if (v66)
        {
          v72 = (char *)v10->_inventory._extensions.__end_;
          v73 = v10->_inventory._extensions.__begin_;
          if (v72 != v66)
          {
            do
            {
              v74 = (std::__shared_weak_count *)*((_QWORD *)v72 - 1);
              if (v74)
              {
                v75 = (unint64_t *)&v74->__shared_owners_;
                do
                  v76 = __ldaxr(v75);
                while (__stlxr(v76 - 1, v75));
                if (!v76)
                {
                  ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
                  std::__shared_weak_count::__release_weak(v74);
                }
              }
              v72 -= 16;
            }
            while (v72 != v66);
            v73 = *v65;
          }
          v10->_inventory._extensions.__end_ = v66;
          operator delete(v73);
          v71 = 0;
          *v65 = 0;
          v10->_inventory._extensions.__end_ = 0;
          v10->_inventory._extensions.__end_cap_.__value_ = 0;
        }
        if (v69 < 0)
          goto LABEL_169;
        v94 = v71 >> 3;
        if (v71 >> 3 <= v70)
          v94 = v70;
        v95 = (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v94;
        if (v95 >> 60)
LABEL_169:
          sub_1BE61F930();
        v96 = operator new(16 * v95);
        v10->_inventory._extensions.__begin_ = v96;
        v10->_inventory._extensions.__end_ = v96;
        v10->_inventory._extensions.__end_cap_.__value_ = &v96[2 * v95];
        while (v68 != v67)
        {
          *v96 = *v68;
          v97 = v68[1];
          v96[1] = v97;
          if (v97)
          {
            v98 = (unint64_t *)(v97 + 8);
            do
              v99 = __ldxr(v98);
            while (__stxr(v99 + 1, v98));
          }
          v68 += 2;
          v96 += 2;
        }
        v10->_inventory._extensions.__end_ = v96;
      }
    }
    v107 = (CHAbstractFastPathStitchingStrategy *)operator new();
    *(_QWORD *)v107 = &unk_1E77F3D30;
    v108 = v10->_stitchingStrategy.__ptr_.__value_;
    v10->_stitchingStrategy.__ptr_.__value_ = v107;
    if (v108)
      (*(void (**)(CHAbstractFastPathStitchingStrategy *))(*(_QWORD *)v108 + 16))(v108);
    v109 = (uint64_t *)__p;
    if (__p)
    {
      v110 = v127;
      v111 = __p;
      if (v127 != __p)
      {
        do
        {
          v112 = (std::__shared_weak_count *)*(v110 - 1);
          if (v112)
          {
            v113 = (unint64_t *)&v112->__shared_owners_;
            do
              v114 = __ldaxr(v113);
            while (__stlxr(v114 - 1, v113));
            if (!v114)
            {
              ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
              std::__shared_weak_count::__release_weak(v112);
            }
          }
          v110 -= 2;
        }
        while (v110 != v109);
        v111 = __p;
      }
      v127 = v109;
      operator delete(v111);
    }
    v115 = (uint64_t *)v124;
    if (v124)
    {
      v116 = v125;
      v117 = v124;
      if (v125 != v124)
      {
        do
        {
          v118 = (std::__shared_weak_count *)*(v116 - 1);
          if (v118)
          {
            v119 = (unint64_t *)&v118->__shared_owners_;
            do
              v120 = __ldaxr(v119);
            while (__stlxr(v120 - 1, v119));
            if (!v120)
            {
              ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
              std::__shared_weak_count::__release_weak(v118);
            }
          }
          v116 -= 2;
        }
        while (v116 != v115);
        v117 = v124;
      }
      v125 = v115;
      operator delete(v117);
    }
  }

  return v10;
}

- (BOOL)shouldUsePersonalization
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v6, v7, (uint64_t)CFSTR("com.apple.corehandwriting"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v11, v12, (uint64_t)CFSTR("CHDisablePersonalizedUseFastPathSynthesis"), v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_BOOLValue(v16, v17, v18, v19, v20, v21);

  return v22 ^ 1;
}

- (id)generateDrawingForText:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  const __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t **v32;
  uint64_t *v33;
  unsigned int v34;
  const __CFString *v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  void **v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CHSynthesisResult *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  _OWORD v56[8];
  _QWORD v57[9];
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  _QWORD *(*v74)(_QWORD *, _QWORD *);
  void (*v75)(uint64_t);
  void *v76;
  _QWORD **v77;
  _QWORD *v78[2];
  _BYTE buf[24];
  _BYTE v80[32];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *__p;
  void *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v55 = v7;
  if (objc_msgSend_shouldUsePersonalization(self, v8, v9, v10, v11, v12))
    v18 = objc_msgSend_fastPathUseDefaultStyle(v7, v13, v14, v15, v16, v17) ^ 1;
  else
    v18 = 0;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("false");
    if (v18)
      v20 = CFSTR("true");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: usePersonalization is %@", buf, 0xCu);
  }

  v71 = 0;
  v72 = &v71;
  v73 = 0x4812000000;
  v74 = sub_1BE7CC510;
  v75 = sub_1BE7CC54C;
  v78[0] = 0;
  v78[1] = 0;
  v76 = &unk_1BE94989A;
  v77 = v78;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v26 = objc_msgSend_length(v6, v21, v22, v23, v24, v25);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = sub_1BE7CC55C;
  v57[3] = &unk_1E77F51E8;
  v58 = v18;
  v57[4] = self;
  v57[5] = &v71;
  v57[6] = &v63;
  v57[7] = &v59;
  v57[8] = &v67;
  objc_msgSend_enumerateCodepointsInRange_usingBlock_(v6, v27, 0, v26, (uint64_t)v57, v28);
  if (!v60[3])
  {
    v35 = CFSTR("NO");
    goto LABEL_34;
  }
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::collectFastPathCharactersFromHolders((uint64_t)&self->_inventory, 9633, 1, (char **)buf);
  v29 = *(_QWORD *)buf;
  if (*(_QWORD *)&buf[8] == *(_QWORD *)buf)
  {
    v35 = CFSTR("NO");
    v29 = *(_QWORD *)&buf[8];
    if (!*(_QWORD *)&buf[8])
      goto LABEL_34;
    goto LABEL_30;
  }
  v30 = v72;
  v32 = (uint64_t **)(v72 + 7);
  v31 = (uint64_t *)v72[7];
  if (!v31)
  {
    v33 = v72 + 7;
LABEL_23:
    v36 = (char *)operator new(0x40uLL);
    *((_DWORD *)v36 + 8) = 9633;
    *((_QWORD *)v36 + 6) = 0;
    *((_QWORD *)v36 + 7) = 0;
    *((_QWORD *)v36 + 5) = 0;
    *(_QWORD *)v36 = 0;
    *((_QWORD *)v36 + 1) = 0;
    *((_QWORD *)v36 + 2) = v33;
    *v32 = (uint64_t *)v36;
    v37 = *(_QWORD *)v30[6];
    v38 = (uint64_t *)v36;
    if (v37)
    {
      v30[6] = v37;
      v38 = *v32;
    }
    sub_1BE61F5C0((uint64_t *)v30[7], v38);
    ++v30[8];
    v29 = *(_QWORD *)buf;
    v39 = (void **)(v36 + 40);
    if (v36 + 40 == buf)
      goto LABEL_29;
LABEL_26:
    sub_1BE7CD478(v39, v29, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)&buf[8] - v29) >> 3));
    v35 = CFSTR("YES");
    v29 = *(_QWORD *)buf;
    if (!*(_QWORD *)buf)
      goto LABEL_34;
    goto LABEL_30;
  }
  while (1)
  {
    while (1)
    {
      v33 = v31;
      v34 = *((_DWORD *)v31 + 8);
      if (v34 < 0x25A2)
        break;
      v31 = (uint64_t *)*v33;
      v32 = (uint64_t **)v33;
      if (!*v33)
        goto LABEL_23;
    }
    if (v34 == 9633)
      break;
    v31 = (uint64_t *)v33[1];
    if (!v31)
    {
      v32 = (uint64_t **)(v33 + 1);
      goto LABEL_23;
    }
  }
  v39 = (void **)(v33 + 5);
  if (v33 + 5 != (uint64_t *)buf)
    goto LABEL_26;
LABEL_29:
  v35 = CFSTR("YES");
  if (!v29)
    goto LABEL_34;
LABEL_30:
  v40 = *(_QWORD *)&buf[8];
  v41 = (void *)v29;
  if (*(_QWORD *)&buf[8] != v29)
  {
    do
    {
      v42 = *(void **)(v40 - 24);
      v40 -= 24;

    }
    while (v40 != v29);
    v41 = *(void **)buf;
  }
  *(_QWORD *)&buf[8] = v29;
  operator delete(v41);
LABEL_34:
  if (qword_1EF568E88 == -1)
  {
    v43 = (id)qword_1EF568E60;
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    goto LABEL_36;
  }
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v43 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
LABEL_36:
    v44 = v68[3];
    v45 = v64[3];
    v46 = v60[3];
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v44;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v45;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)v80 = v46;
    *(_WORD *)&v80[8] = 2112;
    *(_QWORD *)&v80[10] = v35;
    _os_log_impl(&dword_1BE607000, v43, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: statistics of collected codepoints. USER_STYLE %ld, DEFAULT_STYLE %ld, MISSED %ld, NOTDEF_LOADED %@", buf, 0x2Au);
  }
LABEL_37:

  (**(void (***)(_BYTE *__return_ptr, CHAbstractFastPathStitchingStrategy *, id, uint64_t))self->_stitchingStrategy.__ptr_.__value_)(buf, self->_stitchingStrategy.__ptr_.__value_, v6, (uint64_t)(v72 + 6));
  v47 = [CHSynthesisResult alloc];
  v49 = (void *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v47, v48, (uint64_t)v6, *(uint64_t *)buf, (uint64_t)v86, (uint64_t)v87, v89 + v88);
  v56[4] = v82;
  v56[5] = v83;
  v56[6] = v84;
  v56[7] = v85;
  v56[0] = *(_OWORD *)&buf[8];
  v56[1] = *(_OWORD *)v80;
  v56[2] = *(_OWORD *)&v80[16];
  v56[3] = v81;
  objc_msgSend_setPrincipalLines_(v49, v50, (uint64_t)v56, v51, v52, v53);
  if (__p)
  {
    v91 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  sub_1BE6E7EB4((uint64_t)&v77, v78[0]);

  return v49;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  id v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  NSObject *v57;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v62;
  id v63;
  uint8_t *v64;
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v8 = a3;
  v9 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v10 = (id)qword_1EF568E60;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: start synthesizeDrawingForString", buf, 2u);
  }

  if (objc_msgSend_length(v8, v11, v12, v13, v14, v15))
  {
    objc_msgSend_supportedCharacterIndexesForString_options_(self, v16, (uint64_t)v8, (uint64_t)v9, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24);
    if (v25 == objc_msgSend_length(v8, v26, v27, v28, v29, v30))
      goto LABEL_11;
    if (qword_1EF568E88 == -1)
    {
      v35 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        *(_QWORD *)buf = 0;
        v66 = buf;
        v67 = 0x3032000000;
        v68 = sub_1BE7CCD74;
        v69 = sub_1BE7CCD84;
        v70 = objc_alloc_init(MEMORY[0x1E0CB3940]);
        v41 = objc_msgSend_length(v8, v36, v37, v38, v39, v40);
        v59 = MEMORY[0x1E0C809B0];
        v60 = 3221225472;
        v61 = sub_1BE7CCD8C;
        v62 = &unk_1E77F3EB8;
        v63 = v19;
        v64 = buf;
        objc_msgSend_enumerateCodepointsInRange_usingBlock_(v8, v42, 0, v41, (uint64_t)&v59, v43);
        v44 = *((id *)v66 + 5);

        _Block_object_dispose(buf, 8);
        v8 = v44;
LABEL_11:
        objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v31, (uint64_t)v9, v32, v33, v34, v59, v60, v61, v62);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_generateDrawingForText_options_(self, v46, (uint64_t)v8, (uint64_t)v45, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawing(v49, v50, v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          v56 = v49;
LABEL_18:

          goto LABEL_19;
        }
        if (qword_1EF568E88 == -1)
        {
          v57 = (id)qword_1EF568E60;
          if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
LABEL_17:

            v56 = 0;
            goto LABEL_18;
          }
        }
        else
        {
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v57 = (id)qword_1EF568E60;
          if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            goto LABEL_17;
        }
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v57, OS_LOG_TYPE_ERROR, "CHFastPathTextSynthesizer: result drawing is nil", buf, 2u);
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v35 = (id)qword_1EF568E60;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v35, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: not all characters in the string have native support. Decompose unsupported unicode characters.", buf, 2u);
    goto LABEL_10;
  }
  v56 = 0;
LABEL_19:

  return v56;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  NSObject *v7;
  uint8_t v9[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_FAULT, "CHFastPathTextSynthesizer doesn't support refineDrawing!", v9, 2u);
  }

  return 0;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  NSObject *v8;
  uint8_t v10[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "CHFastPathTextSynthesizer doesn't support replacementDrawing!", v10, 2u);
  }

  return 0;
}

- (id)supportedCharacters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  id v24;
  void *__p;
  _QWORD *v26;

  objc_msgSend_set(MEMORY[0x1E0C99E20], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::getSupportedCharacters((CoreHandwriting::synthesis::fast_path::CHAbstractFastPathCharacterHolder ****)&self->_inventory, (uint64_t)&__p);
  v13 = v26;
  if (!v26)
  {
    v24 = v7;
    v22 = __p;
    __p = 0;
    if (!v22)
      goto LABEL_7;
    goto LABEL_6;
  }
  do
  {
    unicodeToNSString(*((_DWORD *)v13 + 4), v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v7, v15, (uint64_t)v14, v16, v17, v18);

    v13 = (_QWORD *)*v13;
  }
  while (v13);
  v19 = v26;
  v20 = v7;
  if (v19)
  {
    do
    {
      v21 = (_QWORD *)*v19;
      operator delete(v19);
      v19 = v21;
    }
    while (v21);
  }
  v22 = __p;
  __p = 0;
  if (v22)
LABEL_6:
    operator delete(v22);
LABEL_7:

  return v7;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
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

  v5 = a3;
  objc_msgSend_supportedCharacters(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v17, v18, (uint64_t)&stru_1E77F6F28, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v23, (uint64_t)v22, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexesOfCharacters_(v5, v28, (uint64_t)v27, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void).cxx_destruct
{
  CHAbstractFastPathStitchingStrategy *value;
  char *begin;
  char *end;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v16;

  value = self->_stitchingStrategy.__ptr_.__value_;
  self->_stitchingStrategy.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CHAbstractFastPathStitchingStrategy *, SEL))(*(_QWORD *)value + 16))(value, a2);
  begin = (char *)self->_inventory._extensions.__begin_;
  if (begin)
  {
    end = (char *)self->_inventory._extensions.__end_;
    v6 = self->_inventory._extensions.__begin_;
    if (end != begin)
    {
      do
      {
        v7 = (std::__shared_weak_count *)*((_QWORD *)end - 1);
        if (v7)
        {
          p_shared_owners = (unint64_t *)&v7->__shared_owners_;
          do
            v9 = __ldaxr(p_shared_owners);
          while (__stlxr(v9 - 1, p_shared_owners));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
        end -= 16;
      }
      while (end != begin);
      v6 = self->_inventory._extensions.__begin_;
    }
    self->_inventory._extensions.__end_ = begin;
    operator delete(v6);
  }
  v10 = (char *)self->_inventory._holders.__begin_;
  if (v10)
  {
    v11 = (char *)self->_inventory._holders.__end_;
    v12 = self->_inventory._holders.__begin_;
    if (v11 == v10)
    {
      self->_inventory._holders.__end_ = v10;
      operator delete(v12);
    }
    else
    {
      do
      {
        v13 = (std::__shared_weak_count *)*((_QWORD *)v11 - 1);
        if (v13)
        {
          v14 = (unint64_t *)&v13->__shared_owners_;
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 - 1, v14));
          if (!v15)
          {
            ((void (*)(std::__shared_weak_count *, SEL))v13->__on_zero_shared)(v13, a2);
            std::__shared_weak_count::__release_weak(v13);
          }
        }
        v11 -= 16;
      }
      while (v11 != v10);
      v16 = self->_inventory._holders.__begin_;
      self->_inventory._holders.__end_ = v10;
      operator delete(v16);
    }
  }
}

- (id).cxx_construct
{
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::CHFastPathCharacterInventory((CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory *)&self->_inventory);
  self->_stitchingStrategy.__ptr_.__value_ = 0;
  return self;
}

@end
