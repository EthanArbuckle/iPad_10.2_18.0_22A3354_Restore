@implementation CVNLPCaptionDecoderBlock

- (CVNLPCaptionDecoderBlock)initWithOptions:(id)a3 modelIndex:(unint64_t)a4 runTimeParams:(id)a5
{
  id v8;
  id v9;
  CVNLPCaptionDecoderBlock *v10;
  CVNLPCaptionDecoderBlock *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *decoderQueue;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *metricString;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *metricCopyString;
  CVNLPCaptionDecoderBlock *v27;
  objc_super v29;

  v8 = a3;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)CVNLPCaptionDecoderBlock;
  v10 = -[CVNLPCaptionModelBase initWithOptions:runTimeParams:](&v29, sel_initWithOptions_runTimeParams_, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_modelIndex = a4;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("decoder_queue", v12);
    decoderQueue = v11->_decoderQueue;
    v11->_decoderQueue = (OS_dispatch_queue *)v13;

    objc_msgSend_objectForKeyedSubscript_(v8, v15, (uint64_t)CVNLPCaptionModelPath, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend__loadNetwork_modelIndex_(v11, v18, (uint64_t)v17, a4) & 1) == 0)
    {

      v27 = 0;
      goto LABEL_6;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v19, (uint64_t)CFSTR("DecodeBlockExecute:%tu"), v20, v11->_modelIndex);
    v21 = objc_claimAutoreleasedReturnValue();
    metricString = v11->_metricString;
    v11->_metricString = (NSString *)v21;

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("DecodeBlockCopy:%tu"), v24, v11->_modelIndex);
    v25 = objc_claimAutoreleasedReturnValue();
    metricCopyString = v11->_metricCopyString;
    v11->_metricCopyString = (NSString *)v25;

  }
  v27 = v11;
LABEL_6:

  return v27;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_decoderPlan)
    espresso_plan_destroy();
  if (self->_decoderCtx)
    espresso_context_destroy();
  sub_1B03711E4((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  self->_stateInputEspressoBuffers.__tree_.__begin_node_ = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
  self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_ = 0;
  self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  sub_1B0379E60((char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
  self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_ = 0;
  self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_ = 0;
  sub_1B03711E4((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  self->_stateOutputEspressoBuffers.__tree_.__begin_node_ = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_ = 0;
  self->_stateOutputEspressoBuffers.__tree_.__pair3_.__value_ = 0;
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionDecoderBlock;
  -[CVNLPCaptionDecoderBlock dealloc](&v3, sel_dealloc);
}

- (BOOL)_loadNetwork:(id)a3 modelIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
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
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;
  BOOL v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  vector<std::string, std::allocator<std::string>> *p_decoderInputNames;
  char *begin;
  char *end;
  char v58;
  __int128 v59;
  uint64_t v60;
  void **v61;
  char *v62;
  uint64_t v63;
  void **v64;
  char *v65;
  void **v67;
  unint64_t v68;
  _OWORD *v69;
  uint64_t v70;
  _BYTE *v71;
  void **v72;
  __int128 *v73;
  _OWORD *v74;
  unint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  _QWORD *v80;
  uint64_t *v81;
  void *v82;
  int64_t v83;
  char *v84;
  char *v85;
  int64_t v86;
  void *v87;
  char *v88;
  uint64_t **v91;
  uint64_t *v92;
  _QWORD *v93;
  unint64_t v94;
  __int128 *p_dst;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t **v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t **v102;
  uint64_t *v103;
  std::runtime_error *v104;
  const char *v105;
  std::runtime_error *v106;
  const char *v107;
  std::runtime_error *v108;
  const char *v109;
  std::runtime_error *v110;
  const char *v111;
  std::runtime_error *v112;
  const char *v113;
  std::runtime_error *v114;
  const char *v115;
  std::runtime_error *exception;
  const char *v117;
  std::runtime_error *v118;
  const char *v119;
  std::runtime_error *v120;
  const char *v121;
  std::runtime_error *v122;
  const char *v123;
  std::runtime_error *v124;
  const char *v125;
  std::runtime_error *v126;
  const char *v127;
  std::runtime_error *v128;
  const char *v129;
  std::runtime_error *v130;
  const char *v131;
  char *v132;
  void *v133;
  void **__dst;
  int64_t v135;
  unint64_t v136;
  void *v137;
  int64_t v138;
  int64_t v139;
  void *__p[2];
  uint64_t v141;
  void **v142;

  v6 = a3;
  v133 = v6;
  self->_decoderCtx = (void *)espresso_create_context();
  self->_decoderPlan = (void *)espresso_create_plan();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("decoder_block%tu_opt.espresso.net"), v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByAppendingPathComponent_(v6, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v12, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_fileExistsAtPath_(v16, v21, (uint64_t)v20, v22);

  if (!v23)
  {
    if (!a4)
    {
      objc_msgSend_URLByAppendingPathComponent_(v133, v24, (uint64_t)CFSTR("decoder_opt.espresso.net"), v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v32, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend_fileExistsAtPath_(v38, v43, (uint64_t)v42, v44);

      if (v45)
      {
        objc_msgSend_path(v32, v46, v47, v48);
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend_UTF8String(v49, v50, v51, v52);
        v53 = espresso_plan_add_network();

        if (v53)
        {
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(exception, v117);
          __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        if (espresso_plan_build())
        {
          v118 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(v118, v119);
          __cxa_throw(v118, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        p_decoderInputNames = &self->_decoderInputNames;
        if (c_network_get_input_names())
        {
          v120 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          espresso_plan_get_error_info();
          std::runtime_error::runtime_error(v120, v121);
          __cxa_throw(v120, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        begin = (char *)p_decoderInputNames->__begin_;
        end = (char *)self->_decoderInputNames.__end_;
        if (end == p_decoderInputNames->__begin_ || 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3) < 5)
        {
LABEL_101:
          if (espresso_network_bind_buffer())
          {
            v122 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v122, v123);
            __cxa_throw(v122, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          if (espresso_network_bind_buffer())
          {
            v124 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v124, v125);
            __cxa_throw(v124, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          if (espresso_network_bind_buffer())
          {
            v126 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            espresso_plan_get_error_info();
            std::runtime_error::runtime_error(v126, v127);
            __cxa_throw(v126, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
          }
          if (0xAAAAAAAAAAAAAAABLL
             * (((char *)self->_decoderInputNames.__end_ - (char *)self->_decoderInputNames.__begin_) >> 3) >= 5)
          {
            if (espresso_network_bind_buffer())
            {
              v128 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v128, v129);
              __cxa_throw(v128, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            if (espresso_network_bind_buffer())
            {
              v130 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v130, v131);
              __cxa_throw(v130, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            if (espresso_network_bind_buffer())
            {
              v104 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              espresso_plan_get_error_info();
              std::runtime_error::runtime_error(v104, v105);
              __cxa_throw(v104, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
          }
          goto LABEL_8;
        }
        v132 = (char *)self->_decoderInputNames.__end_;
        while (1)
        {
          if (begin[23] < 0)
          {
            sub_1B02EB0A8(__p, *(void **)begin, *((_QWORD *)begin + 1));
          }
          else
          {
            v59 = *(_OWORD *)begin;
            v141 = *((_QWORD *)begin + 2);
            *(_OWORD *)__p = v59;
          }
          v58 = HIBYTE(v141);
          v60 = v141 >= 0 ? HIBYTE(v141) : (uint64_t)__p[1];
          v61 = v141 >= 0 ? __p : (void **)__p[0];
          if (v60 >= 5)
            break;
LABEL_24:
          if (v58 < 0)
          {
            operator delete(__p[0]);
            begin += 24;
            if (begin == end)
              goto LABEL_101;
          }
          else
          {
            begin += 24;
            if (begin == end)
              goto LABEL_101;
          }
        }
        v62 = (char *)v61 + v60;
        v63 = v60;
        v64 = v61;
        while (1)
        {
          v65 = (char *)memchr(v64, 95, v63 - 4);
          if (!v65)
            goto LABEL_24;
          if (*(_DWORD *)v65 == 1767863135 && v65[4] == 110)
            break;
          v64 = (void **)(v65 + 1);
          v63 = v62 - (char *)v64;
          if (v62 - (char *)v64 < 5)
            goto LABEL_24;
        }
        if (v65 == v62 || v65 - (char *)v61 == -1)
          goto LABEL_24;
        v67 = (void **)(v62 - 3);
        v68 = (char *)v67 - (char *)v61;
        if ((unint64_t)((char *)v67 - (char *)v61) > 0x7FFFFFFFFFFFFFF7)
          sub_1B02D78C4();
        if (v68 > 0x16)
        {
          v77 = (v68 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v68 | 7) != 0x17)
            v77 = v68 | 7;
          v78 = v77 + 1;
          v69 = operator new(v77 + 1);
          v138 = (char *)v67 - (char *)v61;
          v139 = v78 | 0x8000000000000000;
          v137 = v69;
          if (v61 != v67)
          {
LABEL_51:
            v70 = v60 - 3;
            if ((unint64_t)(v60 - 3) < 0x20 || (unint64_t)((char *)v69 - (char *)v61) < 0x20)
            {
              v71 = v69;
              v72 = v61;
            }
            else
            {
              v71 = (char *)v69 + (v70 & 0xFFFFFFFFFFFFFFE0);
              v72 = (void **)((char *)v61 + (v70 & 0xFFFFFFFFFFFFFFE0));
              v73 = (__int128 *)(v61 + 2);
              v74 = v69 + 1;
              v75 = v70 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                v76 = *v73;
                *(v74 - 1) = *(v73 - 1);
                *v74 = v76;
                v73 += 2;
                v74 += 2;
                v75 -= 32;
              }
              while (v75);
              if (v70 == (v70 & 0xFFFFFFFFFFFFFFE0))
              {
LABEL_63:
                *v71 = 0;
                v80 = operator new(0x28uLL);
                v80[4] = 0;
                *(_OWORD *)v80 = 0u;
                *((_OWORD *)v80 + 1) = 0u;
                v81 = sub_1B0379EC8((uint64_t **)&self->_stateInputEspressoBuffersShape, (const void **)__p, (uint64_t)__p);
                v82 = (void *)v81[7];
                if (v82)
                {
                  v81[8] = (uint64_t)v82;
                  operator delete(v82);
                  v81[7] = 0;
                  v81[8] = 0;
                  v81[9] = 0;
                }
                v81[7] = (uint64_t)v80;
                v81[8] = (uint64_t)(v80 + 5);
                v81[9] = (uint64_t)(v80 + 5);
                if (v139 >= 0)
                  v83 = HIBYTE(v139);
                else
                  v83 = v138;
                if (v139 >= 0)
                  v84 = (char *)&v137;
                else
                  v84 = (char *)v137;
                if (v83 >= 17)
                {
                  v85 = &v84[v83];
                  v86 = v83;
                  v87 = v84;
                  do
                  {
                    v88 = (char *)memchr(v87, 118, v86 - 16);
                    if (!v88)
                      break;
                    if (*(_QWORD *)v88 == 0x5F616C6C696E6176
                      && *((_QWORD *)v88 + 1) == 0x6F69746E65747461
                      && v88[16] == 110)
                    {
                      if (v88 == v85 || v88 - v84 == -1)
                        break;
                      __dst = __p;
                      v91 = sub_1B0351750((uint64_t **)&self->_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_1B03B0E24, (__int128 **)&__dst);
                      v93 = v91 + 7;
                      v92 = v91[7];
                      if (v92)
                      {
                        v91[8] = v92;
                        operator delete(v92);
                        *v93 = 0;
                        v93[1] = 0;
                        v93[2] = 0;
                      }
                      *v93 = 0;
                      v93[1] = 0;
                      v93[2] = 0;
                      goto LABEL_21;
                    }
                    v87 = v88 + 1;
                    v86 = v85 - (_BYTE *)v87;
                  }
                  while (v85 - (_BYTE *)v87 >= 17);
                }
                v94 = v83 + 4;
                if ((unint64_t)(v83 + 4) > 0x7FFFFFFFFFFFFFF7)
                  sub_1B02D78C4();
                if (v94 >= 0x17)
                {
                  v96 = (v94 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v94 | 7) != 0x17)
                    v96 = v94 | 7;
                  v97 = v96 + 1;
                  p_dst = (__int128 *)operator new(v96 + 1);
                  v135 = v83 + 4;
                  v136 = v97 | 0x8000000000000000;
                  __dst = (void **)p_dst;
                }
                else
                {
                  v135 = 0;
                  v136 = 0;
                  __dst = 0;
                  p_dst = (__int128 *)&__dst;
                  HIBYTE(v136) = v83 + 4;
                  if (!v83)
                  {
LABEL_95:
                    strcpy((char *)p_dst + v83, "_out");
                    v98 = (uint64_t *)operator new(0xB800uLL);
                    bzero(v98, 0xB800uLL);
                    v142 = __p;
                    v99 = sub_1B0351750((uint64_t **)&self->_stateInputEspressoBuffers, (const void **)__p, (uint64_t)&unk_1B03B0E24, (__int128 **)&v142);
                    v100 = v99[7];
                    if (v100)
                    {
                      v99[8] = v100;
                      operator delete(v100);
                      v99[7] = 0;
                      v99[8] = 0;
                      v99[9] = 0;
                    }
                    v99[7] = v98;
                    v99[8] = v98 + 5888;
                    v99[9] = v98 + 5888;
                    v101 = (uint64_t *)operator new(0x800uLL);
                    bzero(v101, 0x800uLL);
                    v142 = (void **)&__dst;
                    v102 = sub_1B0351750((uint64_t **)&self->_stateOutputEspressoBuffers, (const void **)&__dst, (uint64_t)&unk_1B03B0E24, (__int128 **)&v142);
                    v103 = v102[7];
                    if (v103)
                    {
                      v102[8] = v103;
                      operator delete(v103);
                      v102[7] = 0;
                      v102[8] = 0;
                      v102[9] = 0;
                    }
                    v102[7] = v101;
                    v102[8] = v101 + 256;
                    v102[9] = v101 + 256;
                    if (SHIBYTE(v136) < 0)
                      operator delete(__dst);
LABEL_21:
                    end = v132;
                    if (SHIBYTE(v139) < 0)
                      operator delete(v137);
                    v58 = HIBYTE(v141);
                    goto LABEL_24;
                  }
                }
                memmove(p_dst, v84, v83);
                goto LABEL_95;
              }
            }
            do
            {
              v79 = *(_BYTE *)v72;
              v72 = (void **)((char *)v72 + 1);
              *v71++ = v79;
            }
            while (v72 != v67);
            goto LABEL_63;
          }
        }
        else
        {
          HIBYTE(v139) = (_BYTE)v67 - (_BYTE)v61;
          v69 = &v137;
          if (v61 != v67)
            goto LABEL_51;
        }
        v71 = v69;
        goto LABEL_63;
      }
      v12 = v32;
    }
    v33 = v133;

    v34 = 0;
    goto LABEL_19;
  }
  objc_msgSend_path(v12, v24, v25, v26);
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend_UTF8String(v27, v28, v29, v30);
  v31 = espresso_plan_add_network();

  if (v31)
  {
    v106 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v106, v107);
    __cxa_throw(v106, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_plan_build())
  {
    v108 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v108, v109);
    __cxa_throw(v108, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v110 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v110, v111);
    __cxa_throw(v110, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v112 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v112, v113);
    __cxa_throw(v112, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v114 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v114, v115);
    __cxa_throw(v114, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v32 = v12;
LABEL_8:
  v33 = v133;

  v34 = 1;
LABEL_19:

  return v34;
}

- (void)buildNetworkForSequenceLength:(unint64_t)a3 imageFeatures:(id)a4
{
  id v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  int v26;
  char *v27;
  char *v28;
  char *v29;
  int64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  __int128 v45;
  int v46;
  char *v47;
  char *v48;
  char *v49;
  int64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  __int128 v65;
  int v66;
  char *v67;
  char *v68;
  char *v69;
  int64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  __int128 v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  CVNLPCaptionDecoderBlock *v89;
  const char *v90;
  size_t v91;
  size_t v92;
  _BYTE *v93;
  char *v94;
  __int128 v95;
  char *v96;
  char *v97;
  char *v98;
  int64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  _BYTE *v104;
  _DWORD *v105;
  uint64_t v106;
  int64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  _OWORD *v114;
  char *v115;
  uint64_t v116;
  __int128 v117;
  int v118;
  char *v119;
  uint64_t v120;
  char *v121;
  int64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  char *v128;
  int64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  __int128 v137;
  int v138;
  char *v139;
  uint64_t v140;
  char *v141;
  int64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  char *v148;
  int64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  __int128 v157;
  int v158;
  char *v159;
  char *v160;
  int64_t v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  char *v167;
  int64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  char *v173;
  char *v174;
  uint64_t v175;
  __int128 v176;
  int v177;
  char v178;
  uint64_t v179;
  char v180;
  const std::string::value_type *v181;
  std::string *v182;
  __int128 v183;
  std::string *v184;
  __int128 v185;
  std::string *v186;
  __int128 v187;
  char *v188;
  __int128 v189;
  int v190;
  char *v191;
  char *v192;
  char *v193;
  int64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  unint64_t v198;
  _BYTE *v199;
  _DWORD *v200;
  uint64_t v201;
  int64_t v202;
  unint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  _OWORD *v207;
  char *v208;
  uint64_t v209;
  __int128 v210;
  int v211;
  int v212;
  char *v213;
  uint64_t v214;
  char *v215;
  int64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  unint64_t v220;
  char *v221;
  char *v222;
  int64_t v223;
  unint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char *v227;
  char *v228;
  char *v229;
  uint64_t v230;
  __int128 v231;
  int v232;
  int v233;
  char *v234;
  uint64_t v235;
  char *v236;
  int64_t v237;
  uint64_t v238;
  unint64_t v239;
  uint64_t v240;
  unint64_t v241;
  char *v242;
  char *v243;
  int64_t v244;
  unint64_t v245;
  unint64_t v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  char *v250;
  char *v251;
  uint64_t v252;
  __int128 v253;
  int v254;
  char *v255;
  uint64_t v256;
  char *v257;
  int64_t v258;
  uint64_t v259;
  unint64_t v260;
  uint64_t v261;
  unint64_t v262;
  char *v263;
  char *v264;
  int64_t v265;
  unint64_t v266;
  uint64_t v267;
  uint64_t v268;
  char *v269;
  char *v270;
  char *v271;
  uint64_t v272;
  __int128 v273;
  int v274;
  std::string *v275;
  __int128 v276;
  std::string *v277;
  __int128 v278;
  std::string *v279;
  void *v280;
  char v281;
  char *v282;
  __int128 v283;
  int v284;
  char *v285;
  char *v286;
  char *v287;
  int64_t v288;
  uint64_t v289;
  unint64_t v290;
  uint64_t v291;
  unint64_t v292;
  _BYTE *v293;
  _DWORD *v294;
  uint64_t v295;
  int64_t v296;
  unint64_t v297;
  unint64_t v298;
  uint64_t v299;
  uint64_t v300;
  char *v301;
  _OWORD *v302;
  char *v303;
  uint64_t v304;
  __int128 v305;
  int v306;
  char *v307;
  uint64_t v308;
  char *v309;
  int64_t v310;
  uint64_t v311;
  unint64_t v312;
  uint64_t v313;
  unint64_t v314;
  char *v315;
  char *v316;
  int64_t v317;
  unint64_t v318;
  uint64_t v319;
  uint64_t v320;
  char *v321;
  char *v322;
  char *v323;
  uint64_t v324;
  __int128 v325;
  int v326;
  int v327;
  char *v328;
  uint64_t v329;
  char *v330;
  int64_t v331;
  uint64_t v332;
  unint64_t v333;
  uint64_t v334;
  unint64_t v335;
  char *v336;
  char *v337;
  int64_t v338;
  unint64_t v339;
  unint64_t v340;
  uint64_t v341;
  uint64_t v342;
  char *v343;
  char *v344;
  char *v345;
  uint64_t v346;
  __int128 v347;
  int v348;
  char *v349;
  uint64_t v350;
  char *v351;
  int64_t v352;
  uint64_t v353;
  unint64_t v354;
  uint64_t v355;
  unint64_t v356;
  char *v357;
  char *v358;
  int64_t v359;
  unint64_t v360;
  uint64_t v361;
  uint64_t v362;
  char *v363;
  char *v364;
  char *v365;
  uint64_t v366;
  __int128 v367;
  int v368;
  char *v369;
  unint64_t v370;
  unint64_t v371;
  size_t v372;
  char *v373;
  const char *v374;
  char *v375;
  unint64_t v376;
  char *v377;
  char *v378;
  char *v379;
  uint64_t v380;
  unint64_t v381;
  uint64_t v382;
  unint64_t v383;
  char *v384;
  char *v385;
  uint64_t v386;
  char *v387;
  unint64_t v388;
  char *v389;
  uint64_t v390;
  unint64_t v391;
  uint64_t v392;
  uint64_t v393;
  char *v394;
  char *v395;
  uint64_t v396;
  __int128 v397;
  CVNLPCaptionDecoderBlock *v398;
  uint64_t *begin_node;
  uint64_t *v400;
  uint64_t *v401;
  BOOL v402;
  id v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  __int128 *v407;
  unint64_t v408;
  unint64_t v409;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v410;
  unint64_t v411;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v413;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v414;
  std::string::size_type size;
  std::string *p_dst;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v417;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v418;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v419;
  int left_high;
  size_t v421;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v422;
  size_t v423;
  int v424;
  _BOOL4 v425;
  int v426;
  _BOOL4 v427;
  _QWORD *p_left;
  _BYTE *v429;
  unint64_t v430;
  uint64_t v431;
  _QWORD *v432;
  uint64_t *v433;
  uint64_t v434;
  uint64_t *v435;
  uint64_t v436;
  _BYTE *v437;
  int v438;
  uint64_t v439;
  int v440;
  uint64_t *v441;
  uint64_t v442;
  uint64_t v443;
  _QWORD *v444;
  uint64_t v445;
  uint64_t **v446;
  uint64_t **v447;
  uint64_t *v448;
  unint64_t v449;
  _QWORD *v450;
  _QWORD *v451;
  _QWORD *v452;
  uint64_t *v453;
  unint64_t v454;
  unint64_t v455;
  unint64_t v456;
  std::string::size_type *p_size;
  uint64_t v458;
  uint64_t v459;
  unint64_t v460;
  std::string::size_type *v461;
  uint64_t v462;
  uint64_t **v463;
  uint64_t **v464;
  uint64_t *v465;
  unint64_t v466;
  uint64_t *v467;
  uint64_t *v468;
  char *v469;
  char *v470;
  void *v471;
  std::runtime_error *exception;
  const char *v473;
  std::runtime_error *v474;
  const char *v475;
  std::runtime_error *v476;
  const char *v477;
  std::runtime_error *v478;
  const char *v479;
  std::runtime_error *v480;
  const char *v481;
  std::runtime_error *v482;
  const char *v483;
  std::runtime_error *v484;
  const char *v485;
  std::runtime_error *v486;
  const char *v487;
  std::runtime_error *v488;
  const char *v489;
  std::runtime_error *v490;
  const char *v491;
  std::runtime_error *v492;
  const char *v493;
  std::runtime_error *v494;
  const char *v495;
  std::runtime_error *v496;
  const char *v497;
  std::runtime_error *v498;
  const char *v499;
  void *v500;
  void *v501;
  uint64_t **p_stateInputEspressoBuffers;
  _QWORD v503[3];
  uint64_t *p_pair1;
  uint64_t **p_stateOutputEspressoBuffers;
  unint64_t p_stateInputEspressoBuffersShape;
  CVNLPCaptionDecoderBlock *v507;
  id v508;
  int __val[2];
  $81D76D3AE0848955339013A8156F227B *p_decoderNet;
  void *v511[2];
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  uint64_t v521;
  std::string __dst;
  void *v523;
  void *v524;
  _BYTE v525[21];
  char v526;
  char v527;
  void *v528;
  char *v529;
  char *v530;
  void *v531;
  char *v532;
  char *v533;
  void *v534;
  char *v535;
  unint64_t v536;
  void *v537;
  char *v538;
  char *v539;
  void *v540;
  char *v541;
  char *v542;
  std::string *v543;
  unint64_t v544;
  std::string v545;
  std::string v546;
  _BYTE __p[32];
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  uint64_t v556;
  __int128 v557;
  char *v558;
  char *v559;
  const char *v560;
  const char *v561;
  uint64_t v562;

  p_stateInputEspressoBuffersShape = a3;
  v562 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (0xAAAAAAAAAAAAAAABLL
     * (((char *)self->_decoderInputNames.__end_ - (char *)self->_decoderInputNames.__begin_) >> 3) < 5)
    goto LABEL_597;
  espresso_plan_build_clean();
  v540 = 0;
  v541 = 0;
  v542 = 0;
  v537 = 0;
  v538 = 0;
  v539 = 0;
  v534 = 0;
  v535 = 0;
  v536 = 0;
  v531 = 0;
  v532 = 0;
  v533 = 0;
  v528 = 0;
  v529 = 0;
  __p[23] = 21;
  v530 = 0;
  strcpy(__p, "att_feats_placeholder");
  v508 = v5;
  qmemcpy(v503, "ceholderatt_feats_placeh", sizeof(v503));
  v535 = sub_1B0318CBC(&v534, (uint64_t)__p);
  if ((__p[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__p);
    v7 = v538;
    v6 = v539;
    v507 = self;
    if (v538 < v539)
      goto LABEL_4;
LABEL_6:
    v9 = (char *)v537;
    v10 = v7 - (_BYTE *)v537;
    v11 = (v7 - (_BYTE *)v537) >> 2;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62)
      sub_1B02D7758();
    v13 = v6 - (_BYTE *)v537;
    if (v13 >> 1 > v12)
      v12 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
    {
      if (v14 >> 62)
        sub_1B02D72AC();
      v15 = operator new(4 * v14);
    }
    else
    {
      v15 = 0;
    }
    v16 = &v15[4 * v11];
    v17 = &v15[4 * v14];
    *(_DWORD *)v16 = 512;
    v8 = v16 + 4;
    if (v7 != v9)
    {
      v18 = v7 - v9 - 4;
      if (v18 < 0x2C)
        goto LABEL_650;
      if ((unint64_t)(v7 - v15 - v10) < 0x20)
        goto LABEL_650;
      v19 = (v18 >> 2) + 1;
      v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      v21 = &v7[-v20];
      v16 -= v20;
      v22 = &v15[4 * v11 - 16];
      v23 = v7 - 16;
      v24 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v25 = *(_OWORD *)v23;
        *(v22 - 1) = *((_OWORD *)v23 - 1);
        *v22 = v25;
        v22 -= 2;
        v23 -= 32;
        v24 -= 8;
      }
      while (v24);
      v7 = v21;
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_650:
        do
        {
          v26 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v16 - 1) = v26;
          v16 -= 4;
        }
        while (v7 != v9);
      }
    }
    v537 = v16;
    v538 = v8;
    v539 = v17;
    if (v9)
      operator delete(v9);
    goto LABEL_25;
  }
  v7 = v538;
  v6 = v539;
  v507 = self;
  if (v538 >= v539)
    goto LABEL_6;
LABEL_4:
  *(_DWORD *)v7 = 512;
  v8 = v7 + 4;
LABEL_25:
  v538 = v8;
  v27 = v541;
  if (v541 >= v542)
  {
    v29 = (char *)v540;
    v30 = v541 - (_BYTE *)v540;
    v31 = (v541 - (_BYTE *)v540) >> 2;
    v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 62)
      sub_1B02D7758();
    v33 = v542 - (_BYTE *)v540;
    if ((v542 - (_BYTE *)v540) >> 1 > v32)
      v32 = v33 >> 1;
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
      v34 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v34 = v32;
    if (v34)
    {
      if (v34 >> 62)
        sub_1B02D72AC();
      v35 = (char *)operator new(4 * v34);
    }
    else
    {
      v35 = 0;
    }
    v36 = &v35[4 * v31];
    v37 = &v35[4 * v34];
    *(_DWORD *)v36 = 144;
    v28 = v36 + 4;
    if (v27 != v29)
    {
      v38 = v27 - v29 - 4;
      if (v38 < 0x2C)
        goto LABEL_651;
      if ((unint64_t)(v27 - v35 - v30) < 0x20)
        goto LABEL_651;
      v39 = (v38 >> 2) + 1;
      v40 = 4 * (v39 & 0x7FFFFFFFFFFFFFF8);
      v41 = &v27[-v40];
      v36 -= v40;
      v42 = &v35[4 * v31 - 16];
      v43 = v27 - 16;
      v44 = v39 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v45 = *(_OWORD *)v43;
        *((_OWORD *)v42 - 1) = *((_OWORD *)v43 - 1);
        *(_OWORD *)v42 = v45;
        v42 -= 32;
        v43 -= 32;
        v44 -= 8;
      }
      while (v44);
      v27 = v41;
      if (v39 != (v39 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_651:
        do
        {
          v46 = *((_DWORD *)v27 - 1);
          v27 -= 4;
          *((_DWORD *)v36 - 1) = v46;
          v36 -= 4;
        }
        while (v27 != v29);
      }
    }
    v540 = v36;
    v541 = v28;
    v542 = v37;
    if (v29)
      operator delete(v29);
  }
  else
  {
    *(_DWORD *)v541 = 144;
    v28 = v27 + 4;
  }
  v541 = v28;
  v47 = v532;
  if (v532 >= v533)
  {
    v49 = (char *)v531;
    v50 = v532 - (_BYTE *)v531;
    v51 = (v532 - (_BYTE *)v531) >> 2;
    v52 = v51 + 1;
    if ((unint64_t)(v51 + 1) >> 62)
      sub_1B02D7758();
    v53 = v533 - (_BYTE *)v531;
    if ((v533 - (_BYTE *)v531) >> 1 > v52)
      v52 = v53 >> 1;
    if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL)
      v54 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v54 = v52;
    if (v54)
    {
      if (v54 >> 62)
        sub_1B02D72AC();
      v55 = (char *)operator new(4 * v54);
    }
    else
    {
      v55 = 0;
    }
    v56 = &v55[4 * v51];
    v57 = &v55[4 * v54];
    *(_DWORD *)v56 = 1;
    v48 = v56 + 4;
    if (v47 != v49)
    {
      v58 = v47 - v49 - 4;
      if (v58 < 0x2C)
        goto LABEL_652;
      if ((unint64_t)(v47 - v55 - v50) < 0x20)
        goto LABEL_652;
      v59 = (v58 >> 2) + 1;
      v60 = 4 * (v59 & 0x7FFFFFFFFFFFFFF8);
      v61 = &v47[-v60];
      v56 -= v60;
      v62 = &v55[4 * v51 - 16];
      v63 = v47 - 16;
      v64 = v59 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v65 = *(_OWORD *)v63;
        *((_OWORD *)v62 - 1) = *((_OWORD *)v63 - 1);
        *(_OWORD *)v62 = v65;
        v62 -= 32;
        v63 -= 32;
        v64 -= 8;
      }
      while (v64);
      v47 = v61;
      if (v59 != (v59 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_652:
        do
        {
          v66 = *((_DWORD *)v47 - 1);
          v47 -= 4;
          *((_DWORD *)v56 - 1) = v66;
          v56 -= 4;
        }
        while (v47 != v49);
      }
    }
    v531 = v56;
    v532 = v48;
    v533 = v57;
    if (v49)
      operator delete(v49);
  }
  else
  {
    *(_DWORD *)v532 = 1;
    v48 = v47 + 4;
  }
  v532 = v48;
  v67 = v529;
  if (v529 >= v530)
  {
    v69 = (char *)v528;
    v70 = v529 - (_BYTE *)v528;
    v71 = (v529 - (_BYTE *)v528) >> 2;
    v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 62)
      sub_1B02D7758();
    v73 = v530 - (_BYTE *)v528;
    if ((v530 - (_BYTE *)v528) >> 1 > v72)
      v72 = v73 >> 1;
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFFCLL)
      v74 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v74 = v72;
    if (v74)
    {
      if (v74 >> 62)
        sub_1B02D72AC();
      v75 = (char *)operator new(4 * v74);
    }
    else
    {
      v75 = 0;
    }
    v76 = &v75[4 * v71];
    v77 = &v75[4 * v74];
    *(_DWORD *)v76 = 1;
    v68 = v76 + 4;
    if (v67 != v69)
    {
      v78 = v67 - v69 - 4;
      if (v78 < 0x2C)
        goto LABEL_653;
      if ((unint64_t)(v67 - v75 - v70) < 0x20)
        goto LABEL_653;
      v79 = (v78 >> 2) + 1;
      v80 = 4 * (v79 & 0x7FFFFFFFFFFFFFF8);
      v81 = &v67[-v80];
      v76 -= v80;
      v82 = &v75[4 * v71 - 16];
      v83 = v67 - 16;
      v84 = v79 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v85 = *(_OWORD *)v83;
        *((_OWORD *)v82 - 1) = *((_OWORD *)v83 - 1);
        *(_OWORD *)v82 = v85;
        v82 -= 32;
        v83 -= 32;
        v84 -= 8;
      }
      while (v84);
      v67 = v81;
      if (v79 != (v79 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_653:
        do
        {
          v86 = *((_DWORD *)v67 - 1);
          v67 -= 4;
          *((_DWORD *)v76 - 1) = v86;
          v76 -= 4;
        }
        while (v67 != v69);
      }
    }
    v528 = v76;
    v529 = v68;
    v530 = v77;
    if (v69)
      operator delete(v69);
  }
  else
  {
    *(_DWORD *)v529 = 1;
    v68 = v67 + 4;
  }
  v87 = 0;
  v529 = v68;
  do
  {
    v90 = off_1E60CE148[v87];
    v91 = strlen(v90);
    if (v91 >= 0x7FFFFFFFFFFFFFF8)
      sub_1B02D78C4();
    v92 = v91;
    if (v91 >= 0x17)
    {
      v109 = (v91 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v91 | 7) != 0x17)
        v109 = v91 | 7;
      v110 = v109 + 1;
      v93 = operator new(v109 + 1);
      *(_QWORD *)&__p[16] = v110 | 0x8000000000000000;
      *(_QWORD *)__p = v93;
      *(_QWORD *)&__p[8] = v92;
    }
    else
    {
      __p[23] = v91;
      v93 = __p;
      if (!v91)
      {
        __p[0] = 0;
        v94 = v535;
        if ((unint64_t)v535 < v536)
          goto LABEL_95;
        goto LABEL_111;
      }
    }
    memmove(v93, v90, v92);
    v93[v92] = 0;
    v94 = v535;
    if ((unint64_t)v535 < v536)
    {
LABEL_95:
      v95 = *(_OWORD *)__p;
      *((_QWORD *)v94 + 2) = *(_QWORD *)&__p[16];
      *(_OWORD *)v94 = v95;
      v535 = v94 + 24;
      v97 = v541;
      v96 = v542;
      if (v541 < v542)
        goto LABEL_113;
      goto LABEL_96;
    }
LABEL_111:
    v535 = sub_1B0318CBC(&v534, (uint64_t)__p);
    if ((__p[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__p);
      v97 = v541;
      v96 = v542;
      if (v541 < v542)
      {
LABEL_113:
        *(_DWORD *)v97 = 1;
        v106 = (uint64_t)(v97 + 4);
        goto LABEL_125;
      }
    }
    else
    {
      v97 = v541;
      v96 = v542;
      if (v541 < v542)
        goto LABEL_113;
    }
LABEL_96:
    v98 = (char *)v540;
    v99 = v97 - (_BYTE *)v540;
    v100 = (v97 - (_BYTE *)v540) >> 2;
    v101 = v100 + 1;
    if ((unint64_t)(v100 + 1) >> 62)
      sub_1B02D7758();
    v102 = v96 - (_BYTE *)v540;
    if (v102 >> 1 > v101)
      v101 = v102 >> 1;
    if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFFCLL)
      v103 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v103 = v101;
    if (v103)
    {
      if (v103 >> 62)
        sub_1B02D72AC();
      v104 = operator new(4 * v103);
      v105 = &v104[4 * v100];
      *v105 = 1;
      v106 = (uint64_t)(v105 + 1);
      v107 = v97 - v98;
      if (v97 == v98)
        goto LABEL_123;
LABEL_105:
      v108 = v107 - 4;
      if (v108 < 0x2C)
        goto LABEL_654;
      if ((unint64_t)(v97 - v104 - v99) < 0x20)
        goto LABEL_654;
      v111 = (v108 >> 2) + 1;
      v112 = 4 * (v111 & 0x7FFFFFFFFFFFFFF8);
      v113 = &v97[-v112];
      v105 = (_DWORD *)((char *)v105 - v112);
      v114 = &v104[4 * v100 - 16];
      v115 = v97 - 16;
      v116 = v111 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v117 = *(_OWORD *)v115;
        *(v114 - 1) = *((_OWORD *)v115 - 1);
        *v114 = v117;
        v114 -= 2;
        v115 -= 32;
        v116 -= 8;
      }
      while (v116);
      v97 = v113;
      if (v111 != (v111 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_654:
        do
        {
          v118 = *((_DWORD *)v97 - 1);
          v97 -= 4;
          *--v105 = v118;
        }
        while (v97 != v98);
      }
      goto LABEL_123;
    }
    v104 = 0;
    v105 = (_DWORD *)(4 * v100);
    *(_DWORD *)(4 * v100) = 1;
    v106 = 4 * v100 + 4;
    v107 = v97 - v98;
    if (v97 != v98)
      goto LABEL_105;
LABEL_123:
    v540 = v105;
    v541 = (char *)v106;
    v542 = &v104[4 * v103];
    if (v98)
      operator delete(v98);
LABEL_125:
    v541 = (char *)v106;
    v119 = v538;
    if (v538 < v539)
    {
      *(_DWORD *)v538 = 1;
      v120 = (uint64_t)(v119 + 4);
      goto LABEL_147;
    }
    v121 = (char *)v537;
    v122 = v538 - (_BYTE *)v537;
    v123 = (v538 - (_BYTE *)v537) >> 2;
    v124 = v123 + 1;
    if ((unint64_t)(v123 + 1) >> 62)
      sub_1B02D7758();
    v125 = v539 - (_BYTE *)v537;
    if ((v539 - (_BYTE *)v537) >> 1 > v124)
      v124 = v125 >> 1;
    if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL)
      v126 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v126 = v124;
    if (v126)
    {
      if (v126 >> 62)
        sub_1B02D72AC();
      v127 = (char *)operator new(4 * v126);
      v128 = &v127[4 * v123];
      *(_DWORD *)v128 = 1;
      v120 = (uint64_t)(v128 + 4);
      v129 = v119 - v121;
      if (v119 == v121)
        goto LABEL_145;
LABEL_136:
      v130 = v129 - 4;
      if (v130 < 0x2C)
        goto LABEL_655;
      if ((unint64_t)(v119 - v127 - v122) < 0x20)
        goto LABEL_655;
      v131 = (v130 >> 2) + 1;
      v132 = 4 * (v131 & 0x7FFFFFFFFFFFFFF8);
      v133 = &v119[-v132];
      v128 -= v132;
      v134 = &v127[4 * v123 - 16];
      v135 = v119 - 16;
      v136 = v131 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v137 = *(_OWORD *)v135;
        *((_OWORD *)v134 - 1) = *((_OWORD *)v135 - 1);
        *(_OWORD *)v134 = v137;
        v134 -= 32;
        v135 -= 32;
        v136 -= 8;
      }
      while (v136);
      v119 = v133;
      if (v131 != (v131 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_655:
        do
        {
          v138 = *((_DWORD *)v119 - 1);
          v119 -= 4;
          *((_DWORD *)v128 - 1) = v138;
          v128 -= 4;
        }
        while (v119 != v121);
      }
      goto LABEL_145;
    }
    v127 = 0;
    v128 = (char *)(4 * v123);
    *(_DWORD *)(4 * v123) = 1;
    v120 = 4 * v123 + 4;
    v129 = v119 - v121;
    if (v119 != v121)
      goto LABEL_136;
LABEL_145:
    v537 = v128;
    v538 = (char *)v120;
    v539 = &v127[4 * v126];
    if (v121)
      operator delete(v121);
LABEL_147:
    v538 = (char *)v120;
    v139 = v532;
    if (v532 < v533)
    {
      *(_DWORD *)v532 = 1;
      v140 = (uint64_t)(v139 + 4);
      goto LABEL_169;
    }
    v141 = (char *)v531;
    v142 = v532 - (_BYTE *)v531;
    v143 = (v532 - (_BYTE *)v531) >> 2;
    v144 = v143 + 1;
    if ((unint64_t)(v143 + 1) >> 62)
      sub_1B02D7758();
    v145 = v533 - (_BYTE *)v531;
    if ((v533 - (_BYTE *)v531) >> 1 > v144)
      v144 = v145 >> 1;
    if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL)
      v146 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v146 = v144;
    if (v146)
    {
      if (v146 >> 62)
        sub_1B02D72AC();
      v147 = (char *)operator new(4 * v146);
      v148 = &v147[4 * v143];
      *(_DWORD *)v148 = 1;
      v140 = (uint64_t)(v148 + 4);
      v149 = v139 - v141;
      if (v139 == v141)
        goto LABEL_167;
LABEL_158:
      v150 = v149 - 4;
      if (v150 < 0x2C)
        goto LABEL_656;
      if ((unint64_t)(v139 - v147 - v142) < 0x20)
        goto LABEL_656;
      v151 = (v150 >> 2) + 1;
      v152 = 4 * (v151 & 0x7FFFFFFFFFFFFFF8);
      v153 = &v139[-v152];
      v148 -= v152;
      v154 = &v147[4 * v143 - 16];
      v155 = v139 - 16;
      v156 = v151 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v157 = *(_OWORD *)v155;
        *((_OWORD *)v154 - 1) = *((_OWORD *)v155 - 1);
        *(_OWORD *)v154 = v157;
        v154 -= 32;
        v155 -= 32;
        v156 -= 8;
      }
      while (v156);
      v139 = v153;
      if (v151 != (v151 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_656:
        do
        {
          v158 = *((_DWORD *)v139 - 1);
          v139 -= 4;
          *((_DWORD *)v148 - 1) = v158;
          v148 -= 4;
        }
        while (v139 != v141);
      }
      goto LABEL_167;
    }
    v147 = 0;
    v148 = (char *)(4 * v143);
    *(_DWORD *)(4 * v143) = 1;
    v140 = 4 * v143 + 4;
    v149 = v139 - v141;
    if (v139 != v141)
      goto LABEL_158;
LABEL_167:
    v531 = v148;
    v532 = (char *)v140;
    v533 = &v147[4 * v146];
    if (v141)
      operator delete(v141);
LABEL_169:
    v532 = (char *)v140;
    v159 = v529;
    if (v529 < v530)
    {
      *(_DWORD *)v529 = 1;
      v88 = (uint64_t)(v159 + 4);
      goto LABEL_90;
    }
    v160 = (char *)v528;
    v161 = v529 - (_BYTE *)v528;
    v162 = (v529 - (_BYTE *)v528) >> 2;
    v163 = v162 + 1;
    if ((unint64_t)(v162 + 1) >> 62)
      sub_1B02D7758();
    v164 = v530 - (_BYTE *)v528;
    if ((v530 - (_BYTE *)v528) >> 1 > v163)
      v163 = v164 >> 1;
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFFCLL)
      v165 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v165 = v163;
    if (v165)
    {
      if (v165 >> 62)
        sub_1B02D72AC();
      v166 = (char *)operator new(4 * v165);
      v167 = &v166[4 * v162];
      *(_DWORD *)v167 = 1;
      v88 = (uint64_t)(v167 + 4);
      v168 = v159 - v160;
      if (v159 == v160)
        goto LABEL_188;
LABEL_179:
      v169 = v168 - 4;
      if (v169 < 0x2C)
        goto LABEL_657;
      if ((unint64_t)(v159 - v166 - v161) < 0x20)
        goto LABEL_657;
      v170 = (v169 >> 2) + 1;
      v171 = 4 * (v170 & 0x7FFFFFFFFFFFFFF8);
      v172 = &v159[-v171];
      v167 -= v171;
      v173 = &v166[4 * v162 - 16];
      v174 = v159 - 16;
      v175 = v170 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v176 = *(_OWORD *)v174;
        *((_OWORD *)v173 - 1) = *((_OWORD *)v174 - 1);
        *(_OWORD *)v173 = v176;
        v173 -= 32;
        v174 -= 32;
        v175 -= 8;
      }
      while (v175);
      v159 = v172;
      if (v170 != (v170 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_657:
        do
        {
          v177 = *((_DWORD *)v159 - 1);
          v159 -= 4;
          *((_DWORD *)v167 - 1) = v177;
          v167 -= 4;
        }
        while (v159 != v160);
      }
      goto LABEL_188;
    }
    v166 = 0;
    v167 = (char *)(4 * v162);
    *(_DWORD *)(4 * v162) = 1;
    v88 = 4 * v162 + 4;
    v168 = v159 - v160;
    if (v159 != v160)
      goto LABEL_179;
LABEL_188:
    v528 = v167;
    v529 = (char *)v88;
    v530 = &v166[4 * v165];
    if (v160)
      operator delete(v160);
LABEL_90:
    v89 = v507;
    v529 = (char *)v88;
    ++v87;
  }
  while (v87 != 4);
  __val[0] = 0;
  p_stateOutputEspressoBuffers = (uint64_t **)&v511[1];
  do
  {
    v178 = 0;
    v179 = 0;
    v559 = "self_attention";
    v560 = "vanilla_attention";
    do
    {
      v180 = v178;
      v181 = (&v559)[v179];
      std::to_string(&v546, __val[0]);
      v182 = std::string::append(&v546, "/");
      v183 = *(_OWORD *)&v182->__r_.__value_.__l.__data_;
      __dst.__r_.__value_.__r.__words[2] = v182->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v183;
      v182->__r_.__value_.__l.__size_ = 0;
      v182->__r_.__value_.__r.__words[2] = 0;
      v182->__r_.__value_.__r.__words[0] = 0;
      v184 = std::string::append(&__dst, v181);
      v185 = *(_OWORD *)&v184->__r_.__value_.__l.__data_;
      *(_QWORD *)&__p[16] = *((_QWORD *)&v184->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v185;
      v184->__r_.__value_.__l.__size_ = 0;
      v184->__r_.__value_.__r.__words[2] = 0;
      v184->__r_.__value_.__r.__words[0] = 0;
      v186 = std::string::append((std::string *)__p, "_k_s_in");
      v187 = *(_OWORD *)&v186->__r_.__value_.__l.__data_;
      *(_QWORD *)&v512 = *((_QWORD *)&v186->__r_.__value_.__l + 2);
      *(_OWORD *)v511 = v187;
      v186->__r_.__value_.__l.__size_ = 0;
      v186->__r_.__value_.__r.__words[2] = 0;
      v186->__r_.__value_.__r.__words[0] = 0;
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_214:
          operator delete(__dst.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v546.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_197;
          goto LABEL_215;
        }
      }
      else if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_214;
      }
      if ((SHIBYTE(v546.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_197;
LABEL_215:
      operator delete(v546.__r_.__value_.__l.__data_);
LABEL_197:
      p_decoderNet = &v89->_decoderNet;
      if (espresso_network_query_blob_dimensions())
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(exception, v473);
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v188 = v535;
      if ((unint64_t)v535 >= v536)
      {
        v535 = sub_1B033552C((char **)&v534, (uint64_t)v511);
        v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533)
          goto LABEL_212;
      }
      else if (SBYTE7(v512) < 0)
      {
        sub_1B02EB0A8(v535, v511[0], (unint64_t)v511[1]);
        v535 = v188 + 24;
        v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533)
        {
LABEL_212:
          *(_DWORD *)v192 = v190;
          v201 = (uint64_t)(v192 + 4);
          goto LABEL_227;
        }
      }
      else
      {
        v189 = *(_OWORD *)v511;
        *((_QWORD *)v535 + 2) = v512;
        *(_OWORD *)v188 = v189;
        v535 = v188 + 24;
        v190 = *(_DWORD *)__p;
        v192 = v532;
        v191 = v533;
        if (v532 < v533)
          goto LABEL_212;
      }
      v193 = (char *)v531;
      v194 = v192 - (_BYTE *)v531;
      v195 = (v192 - (_BYTE *)v531) >> 2;
      v196 = v195 + 1;
      if ((unint64_t)(v195 + 1) >> 62)
        sub_1B02D7758();
      v197 = v191 - (_BYTE *)v531;
      if (v197 >> 1 > v196)
        v196 = v197 >> 1;
      if ((unint64_t)v197 >= 0x7FFFFFFFFFFFFFFCLL)
        v198 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v198 = v196;
      if (v198)
      {
        if (v198 >> 62)
          sub_1B02D72AC();
        v199 = operator new(4 * v198);
        v200 = &v199[4 * v195];
        *v200 = v190;
        v201 = (uint64_t)(v200 + 1);
        v202 = v192 - v193;
        if (v192 == v193)
          goto LABEL_225;
LABEL_219:
        v203 = v202 - 4;
        if (v203 < 0x2C)
          goto LABEL_658;
        if ((unint64_t)(v192 - v199 - v194) < 0x20)
          goto LABEL_658;
        v204 = (v203 >> 2) + 1;
        v205 = 4 * (v204 & 0x7FFFFFFFFFFFFFF8);
        v206 = &v192[-v205];
        v200 = (_DWORD *)((char *)v200 - v205);
        v207 = &v199[4 * v195 - 16];
        v208 = v192 - 16;
        v209 = v204 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v210 = *(_OWORD *)v208;
          *(v207 - 1) = *((_OWORD *)v208 - 1);
          *v207 = v210;
          v207 -= 2;
          v208 -= 32;
          v209 -= 8;
        }
        while (v209);
        v192 = v206;
        if (v204 != (v204 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_658:
          do
          {
            v211 = *((_DWORD *)v192 - 1);
            v192 -= 4;
            *--v200 = v211;
          }
          while (v192 != v193);
        }
        goto LABEL_225;
      }
      v199 = 0;
      v200 = (_DWORD *)(4 * v195);
      *(_DWORD *)(4 * v195) = v190;
      v201 = 4 * v195 + 4;
      v202 = v192 - v193;
      if (v192 != v193)
        goto LABEL_219;
LABEL_225:
      v531 = v200;
      v532 = (char *)v201;
      v533 = &v199[4 * v198];
      if (v193)
        operator delete(v193);
LABEL_227:
      v532 = (char *)v201;
      if (v181 == "vanilla_attention")
        v212 = 0;
      else
        v212 = p_stateInputEspressoBuffersShape;
      v213 = v529;
      if (v529 < v530)
      {
        *(_DWORD *)v529 = v212;
        v214 = (uint64_t)(v213 + 4);
        goto LABEL_251;
      }
      v215 = (char *)v528;
      v216 = v529 - (_BYTE *)v528;
      v217 = (v529 - (_BYTE *)v528) >> 2;
      v218 = v217 + 1;
      if ((unint64_t)(v217 + 1) >> 62)
        sub_1B02D7758();
      v219 = v530 - (_BYTE *)v528;
      if ((v530 - (_BYTE *)v528) >> 1 > v218)
        v218 = v219 >> 1;
      if ((unint64_t)v219 >= 0x7FFFFFFFFFFFFFFCLL)
        v220 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v220 = v218;
      if (v220)
      {
        if (v220 >> 62)
          sub_1B02D72AC();
        v221 = (char *)operator new(4 * v220);
        v222 = &v221[4 * v217];
        *(_DWORD *)v222 = v212;
        v214 = (uint64_t)(v222 + 4);
        v223 = v213 - v215;
        if (v213 == v215)
          goto LABEL_249;
LABEL_243:
        v224 = v223 - 4;
        if (v224 < 0x2C)
          goto LABEL_659;
        if ((unint64_t)(v213 - &v221[v216]) < 0x20)
          goto LABEL_659;
        v225 = (v224 >> 2) + 1;
        v226 = 4 * (v225 & 0x7FFFFFFFFFFFFFF8);
        v227 = &v213[-v226];
        v222 -= v226;
        v228 = &v221[4 * v217 - 16];
        v229 = v213 - 16;
        v230 = v225 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v231 = *(_OWORD *)v229;
          *((_OWORD *)v228 - 1) = *((_OWORD *)v229 - 1);
          *(_OWORD *)v228 = v231;
          v228 -= 32;
          v229 -= 32;
          v230 -= 8;
        }
        while (v230);
        v213 = v227;
        if (v225 != (v225 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_659:
          do
          {
            v232 = *((_DWORD *)v213 - 1);
            v213 -= 4;
            *((_DWORD *)v222 - 1) = v232;
            v222 -= 4;
          }
          while (v213 != v215);
        }
        goto LABEL_249;
      }
      v221 = 0;
      v222 = (char *)(4 * v217);
      *(_DWORD *)(4 * v217) = v212;
      v214 = 4 * v217 + 4;
      v223 = v213 - v215;
      if (v213 != v215)
        goto LABEL_243;
LABEL_249:
      v528 = v222;
      v529 = (char *)v214;
      v530 = &v221[4 * v220];
      if (v215)
        operator delete(v215);
LABEL_251:
      v529 = (char *)v214;
      v233 = *(_DWORD *)&__p[16];
      v234 = v541;
      if (v541 < v542)
      {
        *(_DWORD *)v541 = *(_DWORD *)&__p[16];
        v235 = (uint64_t)(v234 + 4);
        goto LABEL_273;
      }
      v236 = (char *)v540;
      v237 = v541 - (_BYTE *)v540;
      v238 = (v541 - (_BYTE *)v540) >> 2;
      v239 = v238 + 1;
      if ((unint64_t)(v238 + 1) >> 62)
        sub_1B02D7758();
      v240 = v542 - (_BYTE *)v540;
      if ((v542 - (_BYTE *)v540) >> 1 > v239)
        v239 = v240 >> 1;
      if ((unint64_t)v240 >= 0x7FFFFFFFFFFFFFFCLL)
        v241 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v241 = v239;
      if (v241)
      {
        if (v241 >> 62)
          sub_1B02D72AC();
        v242 = (char *)operator new(4 * v241);
        v243 = &v242[4 * v238];
        *(_DWORD *)v243 = v233;
        v235 = (uint64_t)(v243 + 4);
        v244 = v234 - v236;
        if (v234 == v236)
        {
LABEL_265:
          v89 = v507;
          goto LABEL_271;
        }
      }
      else
      {
        v242 = 0;
        v243 = (char *)(4 * v238);
        *(_DWORD *)(4 * v238) = *(_DWORD *)&__p[16];
        v235 = 4 * v238 + 4;
        v244 = v234 - v236;
        if (v234 == v236)
          goto LABEL_265;
      }
      v245 = v244 - 4;
      if (v245 < 0x2C)
      {
        v89 = v507;
        do
        {
LABEL_270:
          v254 = *((_DWORD *)v234 - 1);
          v234 -= 4;
          *((_DWORD *)v243 - 1) = v254;
          v243 -= 4;
        }
        while (v234 != v236);
        goto LABEL_271;
      }
      v246 = v234 - &v242[v237];
      v89 = v507;
      if (v246 < 0x20)
        goto LABEL_270;
      v247 = (v245 >> 2) + 1;
      v248 = 4 * (v247 & 0x7FFFFFFFFFFFFFF8);
      v249 = &v234[-v248];
      v243 -= v248;
      v250 = &v242[4 * v238 - 16];
      v251 = v234 - 16;
      v252 = v247 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v253 = *(_OWORD *)v251;
        *((_OWORD *)v250 - 1) = *((_OWORD *)v251 - 1);
        *(_OWORD *)v250 = v253;
        v250 -= 32;
        v251 -= 32;
        v252 -= 8;
      }
      while (v252);
      v234 = v249;
      if (v247 != (v247 & 0x7FFFFFFFFFFFFFF8))
        goto LABEL_270;
LABEL_271:
      v540 = v243;
      v541 = (char *)v235;
      v542 = &v242[4 * v241];
      if (v236)
        operator delete(v236);
LABEL_273:
      v541 = (char *)v235;
      v255 = v538;
      if (v538 < v539)
      {
        *(_DWORD *)v538 = 1;
        v256 = (uint64_t)(v255 + 4);
        goto LABEL_294;
      }
      v257 = (char *)v537;
      v258 = v538 - (_BYTE *)v537;
      v259 = (v538 - (_BYTE *)v537) >> 2;
      v260 = v259 + 1;
      if ((unint64_t)(v259 + 1) >> 62)
        sub_1B02D7758();
      v261 = v539 - (_BYTE *)v537;
      if ((v539 - (_BYTE *)v537) >> 1 > v260)
        v260 = v261 >> 1;
      if ((unint64_t)v261 >= 0x7FFFFFFFFFFFFFFCLL)
        v262 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v262 = v260;
      if (v262)
      {
        if (v262 >> 62)
          sub_1B02D72AC();
        v263 = (char *)operator new(4 * v262);
        v264 = &v263[4 * v259];
        *(_DWORD *)v264 = 1;
        v256 = (uint64_t)(v264 + 4);
        v265 = v255 - v257;
        if (v255 == v257)
          goto LABEL_292;
LABEL_286:
        v266 = v265 - 4;
        if (v266 < 0x2C)
          goto LABEL_660;
        if ((unint64_t)(v255 - v263 - v258) < 0x20)
          goto LABEL_660;
        v267 = (v266 >> 2) + 1;
        v268 = 4 * (v267 & 0x7FFFFFFFFFFFFFF8);
        v269 = &v255[-v268];
        v264 -= v268;
        v270 = &v263[4 * v259 - 16];
        v271 = v255 - 16;
        v272 = v267 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v273 = *(_OWORD *)v271;
          *((_OWORD *)v270 - 1) = *((_OWORD *)v271 - 1);
          *(_OWORD *)v270 = v273;
          v270 -= 32;
          v271 -= 32;
          v272 -= 8;
        }
        while (v272);
        v255 = v269;
        if (v267 != (v267 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_660:
          do
          {
            v274 = *((_DWORD *)v255 - 1);
            v255 -= 4;
            *((_DWORD *)v264 - 1) = v274;
            v264 -= 4;
          }
          while (v255 != v257);
        }
        goto LABEL_292;
      }
      v263 = 0;
      v264 = (char *)(4 * v259);
      *(_DWORD *)(4 * v259) = 1;
      v256 = 4 * v259 + 4;
      v265 = v255 - v257;
      if (v255 != v257)
        goto LABEL_286;
LABEL_292:
      v537 = v264;
      v538 = (char *)v256;
      v539 = &v263[4 * v262];
      if (v257)
        operator delete(v257);
LABEL_294:
      v5 = v508;
      v538 = (char *)v256;
      std::to_string(&v545, __val[0]);
      v275 = std::string::append(&v545, "/");
      v276 = *(_OWORD *)&v275->__r_.__value_.__l.__data_;
      v546.__r_.__value_.__r.__words[2] = v275->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v546.__r_.__value_.__l.__data_ = v276;
      v275->__r_.__value_.__l.__size_ = 0;
      v275->__r_.__value_.__r.__words[2] = 0;
      v275->__r_.__value_.__r.__words[0] = 0;
      v277 = std::string::append(&v546, v181);
      v278 = *(_OWORD *)&v277->__r_.__value_.__l.__data_;
      __dst.__r_.__value_.__r.__words[2] = v277->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v278;
      v277->__r_.__value_.__l.__size_ = 0;
      v277->__r_.__value_.__r.__words[2] = 0;
      v277->__r_.__value_.__r.__words[0] = 0;
      v279 = std::string::append(&__dst, "_v_s_in");
      v280 = (void *)v279->__r_.__value_.__r.__words[0];
      *(_QWORD *)&v557 = v279->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)&v557 + 7) = *(std::string::size_type *)((char *)&v279->__r_.__value_.__r.__words[1] + 7);
      v281 = HIBYTE(v279->__r_.__value_.__r.__words[2]);
      v279->__r_.__value_.__l.__size_ = 0;
      v279->__r_.__value_.__r.__words[2] = 0;
      v279->__r_.__value_.__r.__words[0] = 0;
      if (SBYTE7(v512) < 0)
        operator delete(v511[0]);
      v511[0] = v280;
      *p_stateOutputEspressoBuffers = (uint64_t *)v557;
      *(uint64_t **)((char *)p_stateOutputEspressoBuffers + 7) = *(uint64_t **)((char *)&v557 + 7);
      BYTE7(v512) = v281;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        if (SHIBYTE(v546.__r_.__value_.__r.__words[2]) < 0)
        {
LABEL_317:
          operator delete(v546.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v545.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_299;
          goto LABEL_318;
        }
      }
      else if (SHIBYTE(v546.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_317;
      }
      if ((SHIBYTE(v545.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_299;
LABEL_318:
      operator delete(v545.__r_.__value_.__l.__data_);
LABEL_299:
      if (espresso_network_query_blob_dimensions())
      {
        v474 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v474, v475);
        __cxa_throw(v474, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v282 = v535;
      if ((unint64_t)v535 >= v536)
      {
        v535 = sub_1B033552C((char **)&v534, (uint64_t)v511);
        v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533)
          goto LABEL_315;
      }
      else if (SBYTE7(v512) < 0)
      {
        sub_1B02EB0A8(v535, v511[0], (unint64_t)v511[1]);
        v535 = v282 + 24;
        v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533)
        {
LABEL_315:
          *(_DWORD *)v286 = v284;
          v295 = (uint64_t)(v286 + 4);
          goto LABEL_330;
        }
      }
      else
      {
        v283 = *(_OWORD *)v511;
        *((_QWORD *)v535 + 2) = v512;
        *(_OWORD *)v282 = v283;
        v535 = v282 + 24;
        v284 = *(_DWORD *)__p;
        v286 = v532;
        v285 = v533;
        if (v532 < v533)
          goto LABEL_315;
      }
      v287 = (char *)v531;
      v288 = v286 - (_BYTE *)v531;
      v289 = (v286 - (_BYTE *)v531) >> 2;
      v290 = v289 + 1;
      if ((unint64_t)(v289 + 1) >> 62)
        sub_1B02D7758();
      v291 = v285 - (_BYTE *)v531;
      if (v291 >> 1 > v290)
        v290 = v291 >> 1;
      if ((unint64_t)v291 >= 0x7FFFFFFFFFFFFFFCLL)
        v292 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v292 = v290;
      if (v292)
      {
        if (v292 >> 62)
          sub_1B02D72AC();
        v293 = operator new(4 * v292);
        v294 = &v293[4 * v289];
        *v294 = v284;
        v295 = (uint64_t)(v294 + 1);
        v296 = v286 - v287;
        if (v286 == v287)
        {
LABEL_322:
          v5 = v508;
          goto LABEL_328;
        }
      }
      else
      {
        v293 = 0;
        v294 = (_DWORD *)(4 * v289);
        *(_DWORD *)(4 * v289) = v284;
        v295 = 4 * v289 + 4;
        v296 = v286 - v287;
        if (v286 == v287)
          goto LABEL_322;
      }
      v297 = v296 - 4;
      if (v297 < 0x2C)
      {
        v5 = v508;
        do
        {
LABEL_327:
          v306 = *((_DWORD *)v286 - 1);
          v286 -= 4;
          *--v294 = v306;
        }
        while (v286 != v287);
        goto LABEL_328;
      }
      v298 = v286 - v293 - v288;
      v5 = v508;
      if (v298 < 0x20)
        goto LABEL_327;
      v299 = (v297 >> 2) + 1;
      v300 = 4 * (v299 & 0x7FFFFFFFFFFFFFF8);
      v301 = &v286[-v300];
      v294 = (_DWORD *)((char *)v294 - v300);
      v302 = &v293[4 * v289 - 16];
      v303 = v286 - 16;
      v304 = v299 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v305 = *(_OWORD *)v303;
        *(v302 - 1) = *((_OWORD *)v303 - 1);
        *v302 = v305;
        v302 -= 2;
        v303 -= 32;
        v304 -= 8;
      }
      while (v304);
      v286 = v301;
      if (v299 != (v299 & 0x7FFFFFFFFFFFFFF8))
        goto LABEL_327;
LABEL_328:
      v531 = v294;
      v532 = (char *)v295;
      v533 = &v293[4 * v292];
      if (v287)
        operator delete(v287);
LABEL_330:
      v532 = (char *)v295;
      v307 = v529;
      if (v529 < v530)
      {
        *(_DWORD *)v529 = v212;
        v308 = (uint64_t)(v307 + 4);
        goto LABEL_351;
      }
      v309 = (char *)v528;
      v310 = v529 - (_BYTE *)v528;
      v311 = (v529 - (_BYTE *)v528) >> 2;
      v312 = v311 + 1;
      if ((unint64_t)(v311 + 1) >> 62)
        sub_1B02D7758();
      v313 = v530 - (_BYTE *)v528;
      if ((v530 - (_BYTE *)v528) >> 1 > v312)
        v312 = v313 >> 1;
      if ((unint64_t)v313 >= 0x7FFFFFFFFFFFFFFCLL)
        v314 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v314 = v312;
      if (v314)
      {
        if (v314 >> 62)
          sub_1B02D72AC();
        v315 = (char *)operator new(4 * v314);
        v316 = &v315[4 * v311];
        *(_DWORD *)v316 = v212;
        v308 = (uint64_t)(v316 + 4);
        v317 = v307 - v309;
        if (v307 == v309)
          goto LABEL_349;
LABEL_343:
        v318 = v317 - 4;
        if (v318 < 0x2C)
          goto LABEL_661;
        if ((unint64_t)(v307 - &v315[v310]) < 0x20)
          goto LABEL_661;
        v319 = (v318 >> 2) + 1;
        v320 = 4 * (v319 & 0x7FFFFFFFFFFFFFF8);
        v321 = &v307[-v320];
        v316 -= v320;
        v322 = &v315[4 * v311 - 16];
        v323 = v307 - 16;
        v324 = v319 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v325 = *(_OWORD *)v323;
          *((_OWORD *)v322 - 1) = *((_OWORD *)v323 - 1);
          *(_OWORD *)v322 = v325;
          v322 -= 32;
          v323 -= 32;
          v324 -= 8;
        }
        while (v324);
        v307 = v321;
        if (v319 != (v319 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_661:
          do
          {
            v326 = *((_DWORD *)v307 - 1);
            v307 -= 4;
            *((_DWORD *)v316 - 1) = v326;
            v316 -= 4;
          }
          while (v307 != v309);
        }
        goto LABEL_349;
      }
      v315 = 0;
      v316 = (char *)(4 * v311);
      *(_DWORD *)(4 * v311) = v212;
      v308 = 4 * v311 + 4;
      v317 = v307 - v309;
      if (v307 != v309)
        goto LABEL_343;
LABEL_349:
      v528 = v316;
      v529 = (char *)v308;
      v530 = &v315[4 * v314];
      if (v309)
        operator delete(v309);
LABEL_351:
      v529 = (char *)v308;
      v327 = *(_DWORD *)&__p[16];
      v328 = v541;
      if (v541 < v542)
      {
        *(_DWORD *)v541 = *(_DWORD *)&__p[16];
        v329 = (uint64_t)(v328 + 4);
        goto LABEL_373;
      }
      v330 = (char *)v540;
      v331 = v541 - (_BYTE *)v540;
      v332 = (v541 - (_BYTE *)v540) >> 2;
      v333 = v332 + 1;
      if ((unint64_t)(v332 + 1) >> 62)
        sub_1B02D7758();
      v334 = v542 - (_BYTE *)v540;
      if ((v542 - (_BYTE *)v540) >> 1 > v333)
        v333 = v334 >> 1;
      if ((unint64_t)v334 >= 0x7FFFFFFFFFFFFFFCLL)
        v335 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v335 = v333;
      if (v335)
      {
        if (v335 >> 62)
          sub_1B02D72AC();
        v336 = (char *)operator new(4 * v335);
        v337 = &v336[4 * v332];
        *(_DWORD *)v337 = v327;
        v329 = (uint64_t)(v337 + 4);
        v338 = v328 - v330;
        if (v328 == v330)
        {
LABEL_365:
          v89 = v507;
          goto LABEL_371;
        }
      }
      else
      {
        v336 = 0;
        v337 = (char *)(4 * v332);
        *(_DWORD *)(4 * v332) = *(_DWORD *)&__p[16];
        v329 = 4 * v332 + 4;
        v338 = v328 - v330;
        if (v328 == v330)
          goto LABEL_365;
      }
      v339 = v338 - 4;
      if (v339 < 0x2C)
      {
        v89 = v507;
        do
        {
LABEL_370:
          v348 = *((_DWORD *)v328 - 1);
          v328 -= 4;
          *((_DWORD *)v337 - 1) = v348;
          v337 -= 4;
        }
        while (v328 != v330);
        goto LABEL_371;
      }
      v340 = v328 - &v336[v331];
      v89 = v507;
      if (v340 < 0x20)
        goto LABEL_370;
      v341 = (v339 >> 2) + 1;
      v342 = 4 * (v341 & 0x7FFFFFFFFFFFFFF8);
      v343 = &v328[-v342];
      v337 -= v342;
      v344 = &v336[4 * v332 - 16];
      v345 = v328 - 16;
      v346 = v341 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v347 = *(_OWORD *)v345;
        *((_OWORD *)v344 - 1) = *((_OWORD *)v345 - 1);
        *(_OWORD *)v344 = v347;
        v344 -= 32;
        v345 -= 32;
        v346 -= 8;
      }
      while (v346);
      v328 = v343;
      if (v341 != (v341 & 0x7FFFFFFFFFFFFFF8))
        goto LABEL_370;
LABEL_371:
      v540 = v337;
      v541 = (char *)v329;
      v542 = &v336[4 * v335];
      if (v330)
        operator delete(v330);
LABEL_373:
      v541 = (char *)v329;
      v349 = v538;
      if (v538 < v539)
      {
        *(_DWORD *)v538 = 1;
        v350 = (uint64_t)(v349 + 4);
        goto LABEL_394;
      }
      v351 = (char *)v537;
      v352 = v538 - (_BYTE *)v537;
      v353 = (v538 - (_BYTE *)v537) >> 2;
      v354 = v353 + 1;
      if ((unint64_t)(v353 + 1) >> 62)
        sub_1B02D7758();
      v355 = v539 - (_BYTE *)v537;
      if ((v539 - (_BYTE *)v537) >> 1 > v354)
        v354 = v355 >> 1;
      if ((unint64_t)v355 >= 0x7FFFFFFFFFFFFFFCLL)
        v356 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v356 = v354;
      if (v356)
      {
        if (v356 >> 62)
          sub_1B02D72AC();
        v357 = (char *)operator new(4 * v356);
        v358 = &v357[4 * v353];
        *(_DWORD *)v358 = 1;
        v350 = (uint64_t)(v358 + 4);
        v359 = v349 - v351;
        if (v349 == v351)
          goto LABEL_392;
LABEL_386:
        v360 = v359 - 4;
        if (v360 < 0x2C)
          goto LABEL_662;
        if ((unint64_t)(v349 - v357 - v352) < 0x20)
          goto LABEL_662;
        v361 = (v360 >> 2) + 1;
        v362 = 4 * (v361 & 0x7FFFFFFFFFFFFFF8);
        v363 = &v349[-v362];
        v358 -= v362;
        v364 = &v357[4 * v353 - 16];
        v365 = v349 - 16;
        v366 = v361 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v367 = *(_OWORD *)v365;
          *((_OWORD *)v364 - 1) = *((_OWORD *)v365 - 1);
          *(_OWORD *)v364 = v367;
          v364 -= 32;
          v365 -= 32;
          v366 -= 8;
        }
        while (v366);
        v349 = v363;
        if (v361 != (v361 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_662:
          do
          {
            v368 = *((_DWORD *)v349 - 1);
            v349 -= 4;
            *((_DWORD *)v358 - 1) = v368;
            v358 -= 4;
          }
          while (v349 != v351);
        }
        goto LABEL_392;
      }
      v357 = 0;
      v358 = (char *)(4 * v353);
      *(_DWORD *)(4 * v353) = 1;
      v350 = 4 * v353 + 4;
      v359 = v349 - v351;
      if (v349 != v351)
        goto LABEL_386;
LABEL_392:
      v537 = v358;
      v538 = (char *)v350;
      v539 = &v357[4 * v356];
      if (v351)
        operator delete(v351);
LABEL_394:
      v538 = (char *)v350;
      if (SBYTE7(v512) < 0)
        operator delete(v511[0]);
      v178 = 1;
      v179 = 1;
    }
    while ((v180 & 1) == 0);
    ++__val[0];
  }
  while (__val[0] != 4);
  v369 = (char *)v534;
  v370 = 0xAAAAAAAAAAAAAAABLL * ((v535 - (_BYTE *)v534) >> 3);
  v371 = 0xAAAAAAAB00000000 * ((v535 - (_BYTE *)v534) >> 3);
  v559 = 0;
  v560 = 0;
  v561 = 0;
  if (v371)
  {
    if ((v371 & 0x8000000000000000) != 0)
      sub_1B02D7758();
    v372 = (0x2AAAAAAACLL * ((v535 - (_BYTE *)v534) >> 3)) & 0x3FFFFFFFFLL;
    v373 = (char *)operator new(v372);
    v374 = &v373[4 * (int)v370];
    v559 = v373;
    v561 = v374;
    memset_pattern16(v373, &unk_1B03B1000, v372);
    v560 = v374;
    v501 = operator new(v372);
    memset_pattern16(v501, &unk_1B03B1260, v372);
  }
  else
  {
    v501 = 0;
  }
  v375 = 0;
  v376 = 0;
  v557 = 0uLL;
  v558 = 0;
  while (2)
  {
    v377 = &v369[24 * v376];
    if (v377[23] < 0)
    {
      v377 = *(char **)v377;
      v378 = v558;
      if (v375 >= v558)
        goto LABEL_407;
      goto LABEL_401;
    }
    v378 = v558;
    if (v375 < v558)
    {
LABEL_401:
      *(_QWORD *)v375 = v377;
      v375 += 8;
      goto LABEL_402;
    }
LABEL_407:
    v379 = (char *)v557;
    v380 = (uint64_t)&v375[-v557] >> 3;
    v381 = v380 + 1;
    if ((unint64_t)(v380 + 1) >> 61)
      sub_1B02D7758();
    v382 = (uint64_t)&v378[-v557];
    if (v382 >> 2 > v381)
      v381 = v382 >> 2;
    if ((unint64_t)v382 >= 0x7FFFFFFFFFFFFFF8)
      v383 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v383 = v381;
    if (!v383)
    {
      v384 = 0;
      v385 = (char *)(8 * v380);
      *(_QWORD *)(8 * v380) = v377;
      v386 = 8 * v380 + 8;
      v387 = (char *)(v375 - v379);
      if (v375 != v379)
        goto LABEL_416;
LABEL_422:
      *(_QWORD *)&v557 = v385;
      *((_QWORD *)&v557 + 1) = v386;
      v558 = &v384[8 * v383];
      if (!v375)
        goto LABEL_424;
      goto LABEL_423;
    }
    if (v383 >> 61)
      sub_1B02D72AC();
    v384 = (char *)operator new(8 * v383);
    v385 = &v384[8 * v380];
    *(_QWORD *)v385 = v377;
    v386 = (uint64_t)(v385 + 8);
    v387 = (char *)(v375 - v379);
    if (v375 == v379)
      goto LABEL_422;
LABEL_416:
    v388 = (unint64_t)(v387 - 8);
    if (v388 < 0x168)
    {
      v389 = v375;
      goto LABEL_418;
    }
    v391 = (v375 - 8 - v379) & 0xFFFFFFFFFFFFFFF8;
    if (&v384[v375 - v379 - 8 - v391] > &v384[v375 - v379 - 8])
    {
      v389 = v375;
      goto LABEL_418;
    }
    if (&v375[-v391 - 8] > v375 - 8)
    {
      v389 = v375;
      goto LABEL_418;
    }
    if ((unint64_t)(v379 - v384) < 0x20)
    {
      v389 = v375;
      goto LABEL_418;
    }
    v392 = (v388 >> 3) + 1;
    v393 = 8 * (v392 & 0x3FFFFFFFFFFFFFFCLL);
    v389 = &v375[-v393];
    v385 -= v393;
    v394 = &v384[8 * v380 - 16];
    v395 = v375 - 16;
    v396 = v392 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v397 = *(_OWORD *)v395;
      *((_OWORD *)v394 - 1) = *((_OWORD *)v395 - 1);
      *(_OWORD *)v394 = v397;
      v394 -= 32;
      v395 -= 32;
      v396 -= 4;
    }
    while (v396);
    if (v392 != (v392 & 0x3FFFFFFFFFFFFFFCLL))
    {
      do
      {
LABEL_418:
        v390 = *((_QWORD *)v389 - 1);
        v389 -= 8;
        *((_QWORD *)v385 - 1) = v390;
        v385 -= 8;
      }
      while (v389 != v379);
    }
    v375 = (char *)v557;
    *(_QWORD *)&v557 = v385;
    *((_QWORD *)&v557 + 1) = v386;
    v558 = &v384[8 * v383];
    if (v375)
LABEL_423:
      operator delete(v375);
LABEL_424:
    v375 = (char *)v386;
    v5 = v508;
LABEL_402:
    *((_QWORD *)&v557 + 1) = v375;
    ++v376;
    v369 = (char *)v534;
    if (0xAAAAAAAAAAAAAAABLL * ((v535 - (_BYTE *)v534) >> 3) > v376)
      continue;
    break;
  }
  v500 = v537;
  v398 = v507;
  if (espresso_network_change_input_blob_shapes_seq_rank())
  {
    v484 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v484, v485);
    __cxa_throw(v484, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  p_stateOutputEspressoBuffers = (uint64_t **)&v507->_stateOutputEspressoBuffers;
  begin_node = (uint64_t *)v507->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = (uint64_t *)&v507->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != (uint64_t *)&v507->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    while (2)
    {
      sub_1B0379220(__p, (__int128 *)begin_node + 2);
      espresso_network_declare_output();
      if (*(_QWORD *)&__p[24])
      {
        *(_QWORD *)&v548 = *(_QWORD *)&__p[24];
        operator delete(*(void **)&__p[24]);
      }
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        v400 = (uint64_t *)begin_node[1];
        if (v400)
          goto LABEL_445;
        do
        {
LABEL_447:
          v401 = (uint64_t *)begin_node[2];
          v402 = *v401 == (_QWORD)begin_node;
          begin_node = v401;
        }
        while (!v402);
      }
      else
      {
        v400 = (uint64_t *)begin_node[1];
        if (!v400)
          goto LABEL_447;
        do
        {
LABEL_445:
          v401 = v400;
          v400 = (uint64_t *)*v400;
        }
        while (v400);
      }
      begin_node = v401;
      if (v401 == p_pair1)
        break;
      continue;
    }
  }
  espresso_plan_build();
  v556 = 0;
  v554 = 0u;
  v555 = 0u;
  v552 = 0u;
  v553 = 0u;
  v550 = 0u;
  v551 = 0u;
  v548 = 0u;
  v549 = 0u;
  memset(__p, 0, sizeof(__p));
  v527 = 21;
  *(_OWORD *)v525 = *(_OWORD *)&v503[1];
  *(_QWORD *)&v525[13] = v503[0];
  v526 = 0;
  if (espresso_network_query_blob_shape())
  {
    v486 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v486, v487);
    __cxa_throw(v486, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  espresso_buffer_pack_tensor_shape();
  v403 = objc_retainAutorelease(v5);
  *(_QWORD *)__p = objc_msgSend_bytes(v403, v404, v405, v406, v500, v501);
  LODWORD(v556) = 65568;
  if (espresso_network_bind_buffer())
  {
    v488 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v488, v489);
    __cxa_throw(v488, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v490 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v490, v491);
    __cxa_throw(v490, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v492 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v492, v493);
    __cxa_throw(v492, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v494 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v494, v495);
    __cxa_throw(v494, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v496 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v496, v497);
    __cxa_throw(v496, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  if (espresso_network_bind_buffer())
  {
    v498 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v498, v499);
    __cxa_throw(v498, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v407 = (__int128 *)v507->_stateInputEspressoBuffers.__tree_.__begin_node_;
  v503[0] = &v507->_stateInputEspressoBuffers.__tree_.__pair1_;
  if (v407 != (__int128 *)&v507->_stateInputEspressoBuffers.__tree_.__pair1_)
  {
    p_stateInputEspressoBuffers = (uint64_t **)&v507->_stateInputEspressoBuffers;
    do
    {
      sub_1B0379220(&__dst, v407 + 2);
      if (espresso_network_query_blob_shape())
      {
        v480 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v480, v481);
        __cxa_throw(v480, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v408 = v544;
      v503[1] = v407;
      if (v544)
      {
        v409 = 0;
        p_stateInputEspressoBuffersShape = (unint64_t)&v398->_stateInputEspressoBuffersShape;
        v410 = &v398->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        v411 = 1;
        do
        {
          *(_QWORD *)__val = *((_QWORD *)&v545.__r_.__value_.__l.__data_ + v409);
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v410->__value_.__left_;
          v413 = v410;
          v414 = v410;
          if (v410->__value_.__left_)
          {
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
            else
              size = __dst.__r_.__value_.__l.__size_;
            if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_dst = &__dst;
            else
              p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
            while (1)
            {
              while (1)
              {
                v414 = left;
                v419 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
                v417 = left + 4;
                v418 = v419;
                left_high = SHIBYTE(v417[2].__value_.__left_);
                if (left_high >= 0)
                  v421 = HIBYTE(v417[2].__value_.__left_);
                else
                  v421 = (size_t)v417[1].__value_.__left_;
                if (left_high >= 0)
                  v422 = v417;
                else
                  v422 = v418;
                if (v421 >= size)
                  v423 = size;
                else
                  v423 = v421;
                v424 = memcmp(p_dst, v422, v423);
                v425 = size < v421;
                if (v424)
                  v425 = v424 < 0;
                if (!v425)
                  break;
                left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v414->__value_.__left_;
                v413 = v414;
                if (!v414->__value_.__left_)
                  goto LABEL_493;
              }
              v426 = memcmp(v422, p_dst, v423);
              v427 = v421 < size;
              if (v426)
                v427 = v426 < 0;
              if (!v427)
                break;
              left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v414[1].__value_.__left_;
              if (!left)
              {
                v413 = v414 + 1;
                goto LABEL_493;
              }
            }
            p_left = &v414->__value_.__left_;
            v5 = v508;
          }
          else
          {
LABEL_493:
            p_left = operator new(0x50uLL);
            v429 = p_left + 4;
            if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
            {
              sub_1B02EB0A8(v429, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)v429 = *(_OWORD *)&__dst.__r_.__value_.__l.__data_;
              p_left[6] = *((_QWORD *)&__dst.__r_.__value_.__l + 2);
            }
            v430 = p_stateInputEspressoBuffersShape;
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v414;
            v413->__value_.__left_ = p_left;
            v431 = **(_QWORD **)v430;
            v432 = p_left;
            v5 = v508;
            if (v431)
            {
              *(_QWORD *)v430 = v431;
              v432 = v413->__value_.__left_;
            }
            v433 = (uint64_t *)v410->__value_.__left_;
            v402 = v432 == v410->__value_.__left_;
            *((_BYTE *)v432 + 24) = v402;
            if (!v402)
            {
              do
              {
                v434 = v432[2];
                if (*(_BYTE *)(v434 + 24))
                  break;
                v435 = *(uint64_t **)(v434 + 16);
                v436 = *v435;
                if (*v435 == v434)
                {
                  v439 = v435[1];
                  if (!v439 || (v440 = *(unsigned __int8 *)(v439 + 24), v437 = (_BYTE *)(v439 + 24), v440))
                  {
                    if (*(_QWORD **)v434 == v432)
                    {
                      *(_BYTE *)(v434 + 24) = 1;
                      *((_BYTE *)v435 + 24) = 0;
                      v443 = *(_QWORD *)(v434 + 8);
                      *v435 = v443;
                      if (v443)
                        goto LABEL_513;
                    }
                    else
                    {
                      v441 = *(uint64_t **)(v434 + 8);
                      v442 = *v441;
                      *(_QWORD *)(v434 + 8) = *v441;
                      if (v442)
                      {
                        *(_QWORD *)(v442 + 16) = v434;
                        v435 = *(uint64_t **)(v434 + 16);
                      }
                      v441[2] = (uint64_t)v435;
                      *(_QWORD *)(*(_QWORD *)(v434 + 16) + 8 * (**(_QWORD **)(v434 + 16) != v434)) = v441;
                      *v441 = v434;
                      *(_QWORD *)(v434 + 16) = v441;
                      v435 = (uint64_t *)v441[2];
                      v434 = *v435;
                      *((_BYTE *)v441 + 24) = 1;
                      *((_BYTE *)v435 + 24) = 0;
                      v443 = *(_QWORD *)(v434 + 8);
                      *v435 = v443;
                      if (v443)
LABEL_513:
                        *(_QWORD *)(v443 + 16) = v435;
                    }
                    *(_QWORD *)(v434 + 16) = v435[2];
                    *(_QWORD *)(v435[2] + 8 * (*(_QWORD *)v435[2] != (_QWORD)v435)) = v434;
                    *(_QWORD *)(v434 + 8) = v435;
LABEL_465:
                    v435[2] = v434;
                    break;
                  }
                }
                else if (!v436 || (v438 = *(unsigned __int8 *)(v436 + 24), v437 = (_BYTE *)(v436 + 24), v438))
                {
                  if (*(_QWORD **)v434 == v432)
                  {
                    v445 = v432[1];
                    *(_QWORD *)v434 = v445;
                    if (v445)
                    {
                      *(_QWORD *)(v445 + 16) = v434;
                      v435 = *(uint64_t **)(v434 + 16);
                    }
                    v432[2] = v435;
                    *(_QWORD *)(*(_QWORD *)(v434 + 16) + 8 * (**(_QWORD **)(v434 + 16) != v434)) = v432;
                    v432[1] = v434;
                    *(_QWORD *)(v434 + 16) = v432;
                    v435 = (uint64_t *)v432[2];
                    *((_BYTE *)v432 + 24) = 1;
                    *((_BYTE *)v435 + 24) = 0;
                    v434 = v435[1];
                    v444 = *(_QWORD **)v434;
                    v435[1] = *(_QWORD *)v434;
                    if (!v444)
                      goto LABEL_464;
                  }
                  else
                  {
                    *(_BYTE *)(v434 + 24) = 1;
                    *((_BYTE *)v435 + 24) = 0;
                    v434 = v435[1];
                    v444 = *(_QWORD **)v434;
                    v435[1] = *(_QWORD *)v434;
                    if (!v444)
                      goto LABEL_464;
                  }
                  v444[2] = v435;
LABEL_464:
                  *(_QWORD *)(v434 + 16) = v435[2];
                  *(_QWORD *)(v435[2] + 8 * (*(_QWORD *)v435[2] != (_QWORD)v435)) = v434;
                  *(_QWORD *)v434 = v435;
                  goto LABEL_465;
                }
                *(_BYTE *)(v434 + 24) = 1;
                v432 = v435;
                *((_BYTE *)v435 + 24) = v435 == v433;
                *v437 = 1;
              }
              while (v435 != v433);
            }
            ++*(_QWORD *)(v430 + 16);
            v408 = v544;
          }
          v411 *= *(_QWORD *)__val;
          *(_QWORD *)(p_left[7] + 8 * (v408 + ~v409++)) = *(_QWORD *)__val;
          v408 = v544;
        }
        while (v544 > v409);
      }
      else
      {
        v411 = 1;
      }
      v511[0] = &__dst;
      v446 = sub_1B0351750(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)v511);
      if (v411 > ((char *)v446[8] - (char *)v446[7]) >> 2)
      {
        v511[0] = &__dst;
        v447 = sub_1B0351750(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)v511);
        v448 = v447[7];
        v449 = ((char *)v447[8] - (char *)v448) >> 2;
        if (v411 <= v449)
        {
          if (v411 < v449)
            v447[8] = (uint64_t *)((char *)v448 + 4 * v411);
        }
        else
        {
          sub_1B036A5F0((uint64_t)(v447 + 7), v411 - v449);
        }
      }
      v521 = 0;
      v519 = 0u;
      v520 = 0u;
      v517 = 0u;
      v518 = 0u;
      v515 = 0u;
      v516 = 0u;
      v513 = 0u;
      v514 = 0u;
      *(_OWORD *)v511 = 0u;
      v512 = 0u;
      espresso_buffer_pack_tensor_shape();
      v543 = &__dst;
      v511[0] = sub_1B0351750(p_stateInputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)&v543)[7];
      LODWORD(v521) = 65568;
      v398 = v507;
      if (espresso_network_bind_buffer())
      {
        v482 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v482, v483);
        __cxa_throw(v482, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v450 = (_QWORD *)v503[1];
      if (v523)
      {
        v524 = v523;
        operator delete(v523);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        v451 = *(_QWORD **)(v503[1] + 8);
        if (v451)
        {
          do
          {
LABEL_538:
            v452 = v451;
            v451 = (_QWORD *)*v451;
          }
          while (v451);
          goto LABEL_459;
        }
      }
      else
      {
        v451 = *(_QWORD **)(v503[1] + 8);
        if (v451)
          goto LABEL_538;
      }
      do
      {
        v452 = (_QWORD *)v450[2];
        v402 = *v452 == (_QWORD)v450;
        v450 = v452;
      }
      while (!v402);
LABEL_459:
      v407 = (__int128 *)v452;
    }
    while (v452 != (_QWORD *)v503[0]);
  }
  v453 = *p_stateOutputEspressoBuffers;
  if (*p_stateOutputEspressoBuffers != p_pair1)
  {
    while (2)
    {
      sub_1B0379220(&__dst, (__int128 *)v453 + 2);
      if (espresso_network_query_blob_shape())
      {
        v478 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v478, v479);
        __cxa_throw(v478, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (v544)
      {
        if (v544 == 1)
        {
          v454 = 0;
          v455 = 1;
          goto LABEL_554;
        }
        v454 = v544 & 0xFFFFFFFFFFFFFFFELL;
        v456 = v544 & 0xFFFFFFFFFFFFFFFELL;
        p_size = &v545.__r_.__value_.__l.__size_;
        v458 = 1;
        v459 = 1;
        do
        {
          v458 *= *(p_size - 1);
          v459 *= *p_size;
          p_size += 2;
          v456 -= 2;
        }
        while (v456);
        v455 = v459 * v458;
        if (v544 != v454)
        {
LABEL_554:
          v460 = v544 - v454;
          v461 = &v545.__r_.__value_.__r.__words[v454];
          do
          {
            v462 = *v461++;
            v455 *= v462;
            --v460;
          }
          while (v460);
        }
      }
      else
      {
        v455 = 1;
      }
      v511[0] = &__dst;
      v463 = sub_1B0351750(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)v511);
      if (v455 > ((char *)v463[8] - (char *)v463[7]) >> 2)
      {
        v511[0] = &__dst;
        v464 = sub_1B0351750(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)v511);
        v465 = v464[7];
        v466 = ((char *)v464[8] - (char *)v465) >> 2;
        if (v455 <= v466)
        {
          if (v455 < v466)
            v464[8] = (uint64_t *)((char *)v465 + 4 * v455);
        }
        else
        {
          sub_1B036A5F0((uint64_t)(v464 + 7), v455 - v466);
        }
      }
      v521 = 0;
      v519 = 0u;
      v520 = 0u;
      v517 = 0u;
      v518 = 0u;
      v515 = 0u;
      v516 = 0u;
      v513 = 0u;
      v514 = 0u;
      *(_OWORD *)v511 = 0u;
      v512 = 0u;
      espresso_buffer_pack_tensor_shape();
      v543 = &__dst;
      v511[0] = sub_1B0351750(p_stateOutputEspressoBuffers, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&unk_1B03B0E24, (__int128 **)&v543)[7];
      LODWORD(v521) = 65568;
      if (espresso_network_bind_buffer())
      {
        v476 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(v476, v477);
        __cxa_throw(v476, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (v523)
      {
        v524 = v523;
        operator delete(v523);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__dst.__r_.__value_.__l.__data_);
        v467 = (uint64_t *)v453[1];
        if (v467)
          goto LABEL_568;
        do
        {
LABEL_570:
          v468 = (uint64_t *)v453[2];
          v402 = *v468 == (_QWORD)v453;
          v453 = v468;
        }
        while (!v402);
      }
      else
      {
        v467 = (uint64_t *)v453[1];
        if (!v467)
          goto LABEL_570;
        do
        {
LABEL_568:
          v468 = v467;
          v467 = (uint64_t *)*v467;
        }
        while (v467);
      }
      v453 = v468;
      if (v468 == p_pair1)
        break;
      continue;
    }
  }
  if (v527 < 0)
    operator delete(*(void **)v525);
  if ((_QWORD)v557)
    operator delete((void *)v557);
  if (v501)
    operator delete(v501);
  if (v559)
    operator delete(v559);
  if (v528)
  {
    v529 = (char *)v528;
    operator delete(v528);
  }
  if (v531)
  {
    v532 = (char *)v531;
    operator delete(v531);
  }
  v469 = (char *)v534;
  if (v534)
  {
    v470 = v535;
    v471 = v534;
    if (v535 != v534)
    {
      do
      {
        if (*(v470 - 1) < 0)
          operator delete(*((void **)v470 - 3));
        v470 -= 24;
      }
      while (v470 != v469);
      v471 = v534;
    }
    v535 = v469;
    operator delete(v471);
  }
  if (v537)
  {
    v538 = (char *)v537;
    operator delete(v537);
  }
  if (v540)
  {
    v541 = (char *)v540;
    operator delete(v540);
  }
LABEL_597:

}

- (void)copyInputState:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  size_t v11;
  std::string::size_type v12;
  std::string *p_dst;
  uint64_t v14;
  uint64_t v15;
  std::string *v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *p_stateInputEspressoBuffersShape;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v24;
  std::string::size_type v25;
  std::string *v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v27;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v29;
  int v30;
  size_t v31;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v32;
  size_t v33;
  int v34;
  _BOOL4 v35;
  int v36;
  _BOOL4 v37;
  _QWORD *v38;
  _BYTE *v39;
  void *v40;
  _QWORD *v41;
  uint64_t *v42;
  BOOL v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  _BYTE *v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v55;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v56;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v57;
  std::string::size_type size;
  std::string *p_p;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v60;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v61;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v62;
  int left_high;
  size_t v64;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v65;
  size_t v66;
  int v67;
  _BOOL4 v68;
  int v69;
  _BOOL4 v70;
  _QWORD *p_left;
  _BYTE *v72;
  void *v73;
  _QWORD *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  _BYTE *v79;
  int v80;
  uint64_t v81;
  int v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *p_stateInputEspressoBuffers;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v90;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v91;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v92;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v93;
  std::string::size_type v94;
  std::string *v95;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v96;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v97;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v98;
  int v99;
  size_t v100;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v101;
  size_t v102;
  int v103;
  _BOOL4 v104;
  int v105;
  _BOOL4 v106;
  _QWORD *v107;
  _BYTE *v108;
  void *v109;
  _QWORD *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  _BYTE *v115;
  int v116;
  uint64_t v117;
  int v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v123;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v124;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v125;
  std::string::size_type v126;
  std::string *v127;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v128;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v129;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v130;
  int v131;
  size_t v132;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v133;
  size_t v134;
  int v135;
  _BOOL4 v136;
  int v137;
  _BOOL4 v138;
  char *v139;
  _BYTE *v140;
  void *v141;
  _BYTE *v142;
  _BYTE *v143;
  uint64_t v144;
  _BYTE *v145;
  uint64_t v146;
  _BYTE *v147;
  int v148;
  uint64_t v149;
  int v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  _BYTE *v154;
  char *v155;
  _BYTE *v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  char *v163;
  size_t v164;
  char *v165;
  uint64_t v166;
  unint64_t v167;
  char *v168;
  char *v169;
  uint64_t v170;
  char *v171;
  size_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  char *v177;
  __int128 *v178;
  uint64_t v179;
  __int128 v180;
  int v181;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v182;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v183;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v184;
  std::string::size_type v185;
  std::string *v186;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v187;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v188;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v189;
  int v190;
  size_t v191;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v192;
  size_t v193;
  int v194;
  _BOOL4 v195;
  int v196;
  _BOOL4 v197;
  _QWORD *v198;
  _BYTE *v199;
  void *v200;
  _QWORD *v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  _BYTE *v206;
  int v207;
  uint64_t v208;
  int v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t v212;
  _QWORD *v213;
  void *v214;
  id v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  id obj;
  uint64_t v229;
  id v230;
  unint64_t i;
  std::string __dst;
  std::string __p;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  _BYTE v238[128];
  uint64_t v239;

  v239 = *MEMORY[0x1E0C80C00];
  v234 = 0u;
  v235 = 0u;
  v236 = 0u;
  v237 = 0u;
  obj = a3;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v234, (uint64_t)v238, 16);
  if (v4)
  {
    v225 = *(_QWORD *)v235;
    do
    {
      v5 = 0;
      v226 = v4;
      do
      {
        if (*(_QWORD *)v235 != v225)
          objc_enumerationMutation(obj);
        v229 = v5;
        v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v234 + 1) + 8 * v5));
        v10 = (const char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
        v11 = strlen(v10);
        if (v11 >= 0x7FFFFFFFFFFFFFF8)
          sub_1B02D78C4();
        v12 = v11;
        if (v11 >= 0x17)
        {
          v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v11 | 7) != 0x17)
            v14 = v11 | 7;
          v15 = v14 + 1;
          p_dst = (std::string *)operator new(v14 + 1);
          __dst.__r_.__value_.__l.__size_ = v12;
          __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
        }
        else
        {
          *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v11;
          p_dst = &__dst;
          if (!v11)
            goto LABEL_15;
        }
        memmove(p_dst, v10, v12);
LABEL_15:
        p_dst->__r_.__value_.__s.__data_[v12] = 0;
        v16 = std::string::append(&__dst, "_in");
        __p = *v16;
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst.__r_.__value_.__l.__data_);
        objc_msgSend_objectForKey_(obj, v17, (uint64_t)v6, v18, v223);
        v230 = (id)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        p_stateInputEspressoBuffersShape = &self->_stateInputEspressoBuffersShape;
        p_pair1 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
        for (i = 1; ; i *= *(_QWORD *)(p_left[7] + 8 * v19++))
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
          v23 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          v24 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          if (p_pair1->__value_.__left_)
            break;
LABEL_48:
          v38 = operator new(0x50uLL);
          v39 = v38 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B02EB0A8(v39, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v39 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v38[6] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          }
          v38[7] = 0;
          v38[8] = 0;
          v38[9] = 0;
          *v38 = 0;
          v38[1] = 0;
          v38[2] = v24;
          v23->__value_.__left_ = v38;
          v40 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
          v41 = v38;
          if (v40)
          {
            p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v40;
            v41 = v23->__value_.__left_;
          }
          v42 = (uint64_t *)p_pair1->__value_.__left_;
          v43 = v41 == p_pair1->__value_.__left_;
          *((_BYTE *)v41 + 24) = v43;
          if (!v43)
          {
            do
            {
              v44 = v41[2];
              if (*(_BYTE *)(v44 + 24))
                break;
              v45 = *(uint64_t **)(v44 + 16);
              v46 = *v45;
              if (*v45 == v44)
              {
                v49 = v45[1];
                if (!v49 || (v50 = *(unsigned __int8 *)(v49 + 24), v47 = (_BYTE *)(v49 + 24), v50))
                {
                  if (*(_QWORD **)v44 == v41)
                  {
                    *(_BYTE *)(v44 + 24) = 1;
                    *((_BYTE *)v45 + 24) = 0;
                    v53 = *(_QWORD *)(v44 + 8);
                    *v45 = v53;
                    if (v53)
                      goto LABEL_68;
                  }
                  else
                  {
                    v51 = *(uint64_t **)(v44 + 8);
                    v52 = *v51;
                    *(_QWORD *)(v44 + 8) = *v51;
                    if (v52)
                    {
                      *(_QWORD *)(v52 + 16) = v44;
                      v45 = *(uint64_t **)(v44 + 16);
                    }
                    v51[2] = (uint64_t)v45;
                    *(_QWORD *)(*(_QWORD *)(v44 + 16) + 8 * (**(_QWORD **)(v44 + 16) != v44)) = v51;
                    *v51 = v44;
                    *(_QWORD *)(v44 + 16) = v51;
                    v45 = (uint64_t *)v51[2];
                    v44 = *v45;
                    *((_BYTE *)v51 + 24) = 1;
                    *((_BYTE *)v45 + 24) = 0;
                    v53 = *(_QWORD *)(v44 + 8);
                    *v45 = v53;
                    if (v53)
LABEL_68:
                      *(_QWORD *)(v53 + 16) = v45;
                  }
                  *(_QWORD *)(v44 + 16) = v45[2];
                  *(_QWORD *)(v45[2] + 8 * (*(_QWORD *)v45[2] != (_QWORD)v45)) = v44;
                  *(_QWORD *)(v44 + 8) = v45;
LABEL_76:
                  v45[2] = v44;
                  break;
                }
              }
              else if (!v46 || (v48 = *(unsigned __int8 *)(v46 + 24), v47 = (_BYTE *)(v46 + 24), v48))
              {
                if (*(_QWORD **)v44 == v41)
                {
                  v87 = v41[1];
                  *(_QWORD *)v44 = v87;
                  if (v87)
                  {
                    *(_QWORD *)(v87 + 16) = v44;
                    v45 = *(uint64_t **)(v44 + 16);
                  }
                  v41[2] = v45;
                  *(_QWORD *)(*(_QWORD *)(v44 + 16) + 8 * (**(_QWORD **)(v44 + 16) != v44)) = v41;
                  v41[1] = v44;
                  *(_QWORD *)(v44 + 16) = v41;
                  v45 = (uint64_t *)v41[2];
                  *((_BYTE *)v41 + 24) = 1;
                  *((_BYTE *)v45 + 24) = 0;
                  v44 = v45[1];
                  v54 = *(_QWORD **)v44;
                  v45[1] = *(_QWORD *)v44;
                  if (v54)
LABEL_74:
                    v54[2] = v45;
                }
                else
                {
                  *(_BYTE *)(v44 + 24) = 1;
                  *((_BYTE *)v45 + 24) = 0;
                  v44 = v45[1];
                  v54 = *(_QWORD **)v44;
                  v45[1] = *(_QWORD *)v44;
                  if (v54)
                    goto LABEL_74;
                }
                *(_QWORD *)(v44 + 16) = v45[2];
                *(_QWORD *)(v45[2] + 8 * (*(_QWORD *)v45[2] != (_QWORD)v45)) = v44;
                *(_QWORD *)v44 = v45;
                goto LABEL_76;
              }
              *(_BYTE *)(v44 + 24) = 1;
              v41 = v45;
              *((_BYTE *)v45 + 24) = v45 == v42;
              *v47 = 1;
            }
            while (v45 != v42);
          }
          ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
          if (v19 >= (uint64_t)(v38[8] - v38[7]) >> 3)
            goto LABEL_141;
LABEL_78:
          v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
          v56 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          v57 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
          if (p_pair1->__value_.__left_)
          {
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            else
              size = __p.__r_.__value_.__l.__size_;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              p_p = &__p;
            else
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            while (1)
            {
              while (1)
              {
                v57 = v55;
                v62 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v55[4].__value_.__left_;
                v60 = v55 + 4;
                v61 = v62;
                left_high = SHIBYTE(v60[2].__value_.__left_);
                if (left_high >= 0)
                  v64 = HIBYTE(v60[2].__value_.__left_);
                else
                  v64 = (size_t)v60[1].__value_.__left_;
                if (left_high >= 0)
                  v65 = v60;
                else
                  v65 = v61;
                if (v64 >= size)
                  v66 = size;
                else
                  v66 = v64;
                v67 = memcmp(p_p, v65, v66);
                v68 = size < v64;
                if (v67)
                  v68 = v67 < 0;
                if (!v68)
                  break;
                v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v57->__value_.__left_;
                v56 = v57;
                if (!v57->__value_.__left_)
                  goto LABEL_103;
              }
              v69 = memcmp(v65, p_p, v66);
              v70 = v64 < size;
              if (v69)
                v70 = v69 < 0;
              if (!v70)
                break;
              v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v57[1].__value_.__left_;
              if (!v55)
              {
                v56 = v57 + 1;
                goto LABEL_103;
              }
            }
            p_left = &v57->__value_.__left_;
          }
          else
          {
LABEL_103:
            p_left = operator new(0x50uLL);
            v72 = p_left + 4;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              sub_1B02EB0A8(v72, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)v72 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              p_left[6] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
            }
            p_left[7] = 0;
            p_left[8] = 0;
            p_left[9] = 0;
            *p_left = 0;
            p_left[1] = 0;
            p_left[2] = v57;
            v56->__value_.__left_ = p_left;
            v73 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
            v74 = p_left;
            if (v73)
            {
              p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v73;
              v74 = v56->__value_.__left_;
            }
            v75 = (uint64_t *)p_pair1->__value_.__left_;
            v43 = v74 == p_pair1->__value_.__left_;
            *((_BYTE *)v74 + 24) = v43;
            if (!v43)
            {
              do
              {
                v76 = v74[2];
                if (*(_BYTE *)(v76 + 24))
                  break;
                v77 = *(uint64_t **)(v76 + 16);
                v78 = *v77;
                if (*v77 == v76)
                {
                  v81 = v77[1];
                  if (!v81 || (v82 = *(unsigned __int8 *)(v81 + 24), v79 = (_BYTE *)(v81 + 24), v82))
                  {
                    if (*(_QWORD **)v76 == v74)
                    {
                      *(_BYTE *)(v76 + 24) = 1;
                      *((_BYTE *)v77 + 24) = 0;
                      v85 = *(_QWORD *)(v76 + 8);
                      *v77 = v85;
                      if (v85)
                        goto LABEL_123;
                    }
                    else
                    {
                      v83 = *(uint64_t **)(v76 + 8);
                      v84 = *v83;
                      *(_QWORD *)(v76 + 8) = *v83;
                      if (v84)
                      {
                        *(_QWORD *)(v84 + 16) = v76;
                        v77 = *(uint64_t **)(v76 + 16);
                      }
                      v83[2] = (uint64_t)v77;
                      *(_QWORD *)(*(_QWORD *)(v76 + 16) + 8 * (**(_QWORD **)(v76 + 16) != v76)) = v83;
                      *v83 = v76;
                      *(_QWORD *)(v76 + 16) = v83;
                      v77 = (uint64_t *)v83[2];
                      v76 = *v77;
                      *((_BYTE *)v83 + 24) = 1;
                      *((_BYTE *)v77 + 24) = 0;
                      v85 = *(_QWORD *)(v76 + 8);
                      *v77 = v85;
                      if (v85)
LABEL_123:
                        *(_QWORD *)(v85 + 16) = v77;
                    }
                    *(_QWORD *)(v76 + 16) = v77[2];
                    *(_QWORD *)(v77[2] + 8 * (*(_QWORD *)v77[2] != (_QWORD)v77)) = v76;
                    *(_QWORD *)(v76 + 8) = v77;
LABEL_20:
                    v77[2] = v76;
                    break;
                  }
                }
                else if (!v78 || (v80 = *(unsigned __int8 *)(v78 + 24), v79 = (_BYTE *)(v78 + 24), v80))
                {
                  if (*(_QWORD **)v76 == v74)
                  {
                    v88 = v74[1];
                    *(_QWORD *)v76 = v88;
                    if (v88)
                    {
                      *(_QWORD *)(v88 + 16) = v76;
                      v77 = *(uint64_t **)(v76 + 16);
                    }
                    v74[2] = v77;
                    *(_QWORD *)(*(_QWORD *)(v76 + 16) + 8 * (**(_QWORD **)(v76 + 16) != v76)) = v74;
                    v74[1] = v76;
                    *(_QWORD *)(v76 + 16) = v74;
                    v77 = (uint64_t *)v74[2];
                    *((_BYTE *)v74 + 24) = 1;
                    *((_BYTE *)v77 + 24) = 0;
                    v76 = v77[1];
                    v86 = *(_QWORD **)v76;
                    v77[1] = *(_QWORD *)v76;
                    if (!v86)
                      goto LABEL_19;
                  }
                  else
                  {
                    *(_BYTE *)(v76 + 24) = 1;
                    *((_BYTE *)v77 + 24) = 0;
                    v76 = v77[1];
                    v86 = *(_QWORD **)v76;
                    v77[1] = *(_QWORD *)v76;
                    if (!v86)
                      goto LABEL_19;
                  }
                  v86[2] = v77;
LABEL_19:
                  *(_QWORD *)(v76 + 16) = v77[2];
                  *(_QWORD *)(v77[2] + 8 * (*(_QWORD *)v77[2] != (_QWORD)v77)) = v76;
                  *(_QWORD *)v76 = v77;
                  goto LABEL_20;
                }
                *(_BYTE *)(v76 + 24) = 1;
                v74 = v77;
                *((_BYTE *)v77 + 24) = v77 == v75;
                *v79 = 1;
              }
              while (v77 != v75);
            }
            ++self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_;
          }
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v25 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v25 = __p.__r_.__value_.__l.__size_;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v26 = &__p;
        else
          v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
        while (1)
        {
          while (1)
          {
            v24 = left;
            v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)left[4].__value_.__left_;
            v27 = left + 4;
            v28 = v29;
            v30 = SHIBYTE(v27[2].__value_.__left_);
            if (v30 >= 0)
              v31 = HIBYTE(v27[2].__value_.__left_);
            else
              v31 = (size_t)v27[1].__value_.__left_;
            if (v30 >= 0)
              v32 = v27;
            else
              v32 = v28;
            if (v31 >= v25)
              v33 = v25;
            else
              v33 = v31;
            v34 = memcmp(v26, v32, v33);
            v35 = v25 < v31;
            if (v34)
              v35 = v34 < 0;
            if (!v35)
              break;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v24->__value_.__left_;
            v23 = v24;
            if (!v24->__value_.__left_)
              goto LABEL_48;
          }
          v36 = memcmp(v32, v26, v33);
          v37 = v31 < v25;
          if (v36)
            v37 = v36 < 0;
          if (!v37)
            break;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v24[1].__value_.__left_;
          if (!left)
          {
            v23 = v24 + 1;
            goto LABEL_48;
          }
        }
        if (v19 < ((char *)v24[8].__value_.__left_ - (char *)v24[7].__value_.__left_) >> 3)
          goto LABEL_78;
LABEL_141:
        if (!i)
          goto LABEL_333;
        p_stateInputEspressoBuffers = &self->_stateInputEspressoBuffers;
        v91 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_;
        v92 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v93 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (!v90)
        {
LABEL_167:
          v107 = operator new(0x50uLL);
          v108 = v107 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B02EB0A8(v108, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v108 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v107[6] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          }
          v107[7] = 0;
          v107[8] = 0;
          v107[9] = 0;
          *v107 = 0;
          v107[1] = 0;
          v107[2] = v93;
          v92->__value_.__left_ = v107;
          v109 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          v110 = v107;
          if (v109)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v109;
            v110 = v92->__value_.__left_;
          }
          v111 = (uint64_t *)v91->__value_.__left_;
          v43 = v110 == v91->__value_.__left_;
          *((_BYTE *)v110 + 24) = v43;
          if (!v43)
          {
            do
            {
              v112 = v110[2];
              if (*(_BYTE *)(v112 + 24))
                break;
              v113 = *(uint64_t **)(v112 + 16);
              v114 = *v113;
              if (*v113 == v112)
              {
                v117 = v113[1];
                if (!v117 || (v118 = *(unsigned __int8 *)(v117 + 24), v115 = (_BYTE *)(v117 + 24), v118))
                {
                  if (*(_QWORD **)v112 == v110)
                  {
                    *(_BYTE *)(v112 + 24) = 1;
                    *((_BYTE *)v113 + 24) = 0;
                    v121 = *(_QWORD *)(v112 + 8);
                    *v113 = v121;
                    if (v121)
                      goto LABEL_187;
                  }
                  else
                  {
                    v119 = *(uint64_t **)(v112 + 8);
                    v120 = *v119;
                    *(_QWORD *)(v112 + 8) = *v119;
                    if (v120)
                    {
                      *(_QWORD *)(v120 + 16) = v112;
                      v113 = *(uint64_t **)(v112 + 16);
                    }
                    v119[2] = (uint64_t)v113;
                    *(_QWORD *)(*(_QWORD *)(v112 + 16) + 8 * (**(_QWORD **)(v112 + 16) != v112)) = v119;
                    *v119 = v112;
                    *(_QWORD *)(v112 + 16) = v119;
                    v113 = (uint64_t *)v119[2];
                    v112 = *v113;
                    *((_BYTE *)v119 + 24) = 1;
                    *((_BYTE *)v113 + 24) = 0;
                    v121 = *(_QWORD *)(v112 + 8);
                    *v113 = v121;
                    if (v121)
LABEL_187:
                      *(_QWORD *)(v121 + 16) = v113;
                  }
                  *(_QWORD *)(v112 + 16) = v113[2];
                  *(_QWORD *)(v113[2] + 8 * (*(_QWORD *)v113[2] != (_QWORD)v113)) = v112;
                  *(_QWORD *)(v112 + 8) = v113;
LABEL_195:
                  v113[2] = v112;
                  break;
                }
              }
              else if (!v114 || (v116 = *(unsigned __int8 *)(v114 + 24), v115 = (_BYTE *)(v114 + 24), v116))
              {
                if (*(_QWORD **)v112 == v110)
                {
                  v173 = v110[1];
                  *(_QWORD *)v112 = v173;
                  if (v173)
                  {
                    *(_QWORD *)(v173 + 16) = v112;
                    v113 = *(uint64_t **)(v112 + 16);
                  }
                  v110[2] = v113;
                  *(_QWORD *)(*(_QWORD *)(v112 + 16) + 8 * (**(_QWORD **)(v112 + 16) != v112)) = v110;
                  v110[1] = v112;
                  *(_QWORD *)(v112 + 16) = v110;
                  v113 = (uint64_t *)v110[2];
                  *((_BYTE *)v110 + 24) = 1;
                  *((_BYTE *)v113 + 24) = 0;
                  v112 = v113[1];
                  v122 = *(_QWORD **)v112;
                  v113[1] = *(_QWORD *)v112;
                  if (v122)
LABEL_193:
                    v122[2] = v113;
                }
                else
                {
                  *(_BYTE *)(v112 + 24) = 1;
                  *((_BYTE *)v113 + 24) = 0;
                  v112 = v113[1];
                  v122 = *(_QWORD **)v112;
                  v113[1] = *(_QWORD *)v112;
                  if (v122)
                    goto LABEL_193;
                }
                *(_QWORD *)(v112 + 16) = v113[2];
                *(_QWORD *)(v113[2] + 8 * (*(_QWORD *)v113[2] != (_QWORD)v113)) = v112;
                *(_QWORD *)v112 = v113;
                goto LABEL_195;
              }
              *(_BYTE *)(v112 + 24) = 1;
              v110 = v113;
              *((_BYTE *)v113 + 24) = v113 == v111;
              *v115 = 1;
            }
            while (v113 != v111);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
          if (i > (uint64_t)(v107[8] - v107[7]) >> 2)
            goto LABEL_197;
          goto LABEL_278;
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v94 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v94 = __p.__r_.__value_.__l.__size_;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v95 = &__p;
        else
          v95 = (std::string *)__p.__r_.__value_.__r.__words[0];
        while (1)
        {
          while (1)
          {
            v93 = v90;
            v98 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v90[4].__value_.__left_;
            v96 = v90 + 4;
            v97 = v98;
            v99 = SHIBYTE(v96[2].__value_.__left_);
            if (v99 >= 0)
              v100 = HIBYTE(v96[2].__value_.__left_);
            else
              v100 = (size_t)v96[1].__value_.__left_;
            if (v99 >= 0)
              v101 = v96;
            else
              v101 = v97;
            if (v100 >= v94)
              v102 = v94;
            else
              v102 = v100;
            v103 = memcmp(v95, v101, v102);
            v104 = v94 < v100;
            if (v103)
              v104 = v103 < 0;
            if (!v104)
              break;
            v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v93->__value_.__left_;
            v92 = v93;
            if (!v93->__value_.__left_)
              goto LABEL_167;
          }
          v105 = memcmp(v101, v95, v102);
          v106 = v100 < v94;
          if (v105)
            v106 = v105 < 0;
          if (!v106)
            break;
          v90 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v93[1].__value_.__left_;
          if (!v90)
          {
            v92 = v93 + 1;
            goto LABEL_167;
          }
        }
        if (i <= ((char *)v93[8].__value_.__left_ - (char *)v93[7].__value_.__left_) >> 2)
          goto LABEL_278;
LABEL_197:
        v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v91->__value_.__left_;
        v124 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v125 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (v91->__value_.__left_)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v126 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            v126 = __p.__r_.__value_.__l.__size_;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v127 = &__p;
          else
            v127 = (std::string *)__p.__r_.__value_.__r.__words[0];
          while (1)
          {
            while (1)
            {
              v125 = v123;
              v130 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v123[4].__value_.__left_;
              v128 = v123 + 4;
              v129 = v130;
              v131 = SHIBYTE(v128[2].__value_.__left_);
              if (v131 >= 0)
                v132 = HIBYTE(v128[2].__value_.__left_);
              else
                v132 = (size_t)v128[1].__value_.__left_;
              if (v131 >= 0)
                v133 = v128;
              else
                v133 = v129;
              if (v132 >= v126)
                v134 = v126;
              else
                v134 = v132;
              v135 = memcmp(v127, v133, v134);
              v136 = v126 < v132;
              if (v135)
                v136 = v135 < 0;
              if (!v136)
                break;
              v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v125->__value_.__left_;
              v124 = v125;
              if (!v125->__value_.__left_)
                goto LABEL_222;
            }
            v137 = memcmp(v133, v127, v134);
            v138 = v132 < v126;
            if (v137)
              v138 = v137 < 0;
            if (!v138)
              break;
            v123 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v125[1].__value_.__left_;
            if (!v123)
            {
              v124 = v125 + 1;
              goto LABEL_222;
            }
          }
          v139 = (char *)v125;
        }
        else
        {
LABEL_222:
          v139 = (char *)operator new(0x50uLL);
          v140 = v139 + 32;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B02EB0A8(v140, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v140 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *((_QWORD *)v139 + 6) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          }
          *((_QWORD *)v139 + 7) = 0;
          *((_QWORD *)v139 + 8) = 0;
          *((_QWORD *)v139 + 9) = 0;
          *(_QWORD *)v139 = 0;
          *((_QWORD *)v139 + 1) = 0;
          *((_QWORD *)v139 + 2) = v125;
          v124->__value_.__left_ = v139;
          v141 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          v142 = v139;
          if (v141)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v141;
            v142 = v124->__value_.__left_;
          }
          v143 = v91->__value_.__left_;
          v43 = v142 == v91->__value_.__left_;
          v142[24] = v43;
          if (!v43)
          {
            do
            {
              v144 = *((_QWORD *)v142 + 2);
              if (*(_BYTE *)(v144 + 24))
                break;
              v145 = *(_BYTE **)(v144 + 16);
              v146 = *(_QWORD *)v145;
              if (*(_QWORD *)v145 == v144)
              {
                v149 = *((_QWORD *)v145 + 1);
                if (!v149 || (v150 = *(unsigned __int8 *)(v149 + 24), v147 = (_BYTE *)(v149 + 24), v150))
                {
                  if (*(_BYTE **)v144 == v142)
                  {
                    *(_BYTE *)(v144 + 24) = 1;
                    v145[24] = 0;
                    v153 = *(_QWORD *)(v144 + 8);
                    *(_QWORD *)v145 = v153;
                    if (v153)
                      goto LABEL_242;
                  }
                  else
                  {
                    v151 = *(uint64_t **)(v144 + 8);
                    v152 = *v151;
                    *(_QWORD *)(v144 + 8) = *v151;
                    if (v152)
                    {
                      *(_QWORD *)(v152 + 16) = v144;
                      v145 = *(_BYTE **)(v144 + 16);
                    }
                    v151[2] = (uint64_t)v145;
                    *(_QWORD *)(*(_QWORD *)(v144 + 16) + 8 * (**(_QWORD **)(v144 + 16) != v144)) = v151;
                    *v151 = v144;
                    *(_QWORD *)(v144 + 16) = v151;
                    v145 = (_BYTE *)v151[2];
                    v144 = *(_QWORD *)v145;
                    *((_BYTE *)v151 + 24) = 1;
                    v145[24] = 0;
                    v153 = *(_QWORD *)(v144 + 8);
                    *(_QWORD *)v145 = v153;
                    if (v153)
LABEL_242:
                      *(_QWORD *)(v153 + 16) = v145;
                  }
                  *(_QWORD *)(v144 + 16) = *((_QWORD *)v145 + 2);
                  *(_QWORD *)(*((_QWORD *)v145 + 2) + 8 * (**((_QWORD **)v145 + 2) != (_QWORD)v145)) = v144;
                  *(_QWORD *)(v144 + 8) = v145;
LABEL_249:
                  *((_QWORD *)v145 + 2) = v144;
                  break;
                }
              }
              else if (!v146 || (v148 = *(unsigned __int8 *)(v146 + 24), v147 = (_BYTE *)(v146 + 24), v148))
              {
                if (*(_BYTE **)v144 == v142)
                {
                  v222 = *((_QWORD *)v142 + 1);
                  *(_QWORD *)v144 = v222;
                  if (v222)
                  {
                    *(_QWORD *)(v222 + 16) = v144;
                    v145 = *(_BYTE **)(v144 + 16);
                  }
                  *((_QWORD *)v142 + 2) = v145;
                  *(_QWORD *)(*(_QWORD *)(v144 + 16) + 8 * (**(_QWORD **)(v144 + 16) != v144)) = v142;
                  *((_QWORD *)v142 + 1) = v144;
                  *(_QWORD *)(v144 + 16) = v142;
                  v145 = (_BYTE *)*((_QWORD *)v142 + 2);
                  v142[24] = 1;
                  v145[24] = 0;
                  v144 = *((_QWORD *)v145 + 1);
                  v154 = *(_BYTE **)v144;
                  *((_QWORD *)v145 + 1) = *(_QWORD *)v144;
                  if (v154)
LABEL_247:
                    *((_QWORD *)v154 + 2) = v145;
                }
                else
                {
                  *(_BYTE *)(v144 + 24) = 1;
                  v145[24] = 0;
                  v144 = *((_QWORD *)v145 + 1);
                  v154 = *(_BYTE **)v144;
                  *((_QWORD *)v145 + 1) = *(_QWORD *)v144;
                  if (v154)
                    goto LABEL_247;
                }
                *(_QWORD *)(v144 + 16) = *((_QWORD *)v145 + 2);
                *(_QWORD *)(*((_QWORD *)v145 + 2) + 8 * (**((_QWORD **)v145 + 2) != (_QWORD)v145)) = v144;
                *(_QWORD *)v144 = v145;
                goto LABEL_249;
              }
              *(_BYTE *)(v144 + 24) = 1;
              v142 = v145;
              v145[24] = v145 == v143;
              *v147 = 1;
            }
            while (v145 != v143);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
        }
        v155 = (char *)*((_QWORD *)v139 + 7);
        v156 = (_BYTE *)*((_QWORD *)v139 + 8);
        v157 = (v156 - v155) >> 2;
        v158 = i - v157;
        if (i <= v157)
        {
          if (i >= v157)
            goto LABEL_278;
          v171 = &v155[4 * i];
          goto LABEL_265;
        }
        v159 = *((_QWORD *)v139 + 9);
        if (v158 <= (v159 - (uint64_t)v156) >> 2)
        {
          v172 = 4 * v158;
          bzero(*((void **)v139 + 8), v172);
          v171 = &v156[v172];
LABEL_265:
          *((_QWORD *)v139 + 8) = v171;
          goto LABEL_278;
        }
        if (i >> 62)
          sub_1B02D7758();
        v160 = v159 - (_QWORD)v155;
        v161 = v160 >> 1;
        if (v160 >> 1 <= i)
          v161 = i;
        if ((unint64_t)v160 >= 0x7FFFFFFFFFFFFFFCLL)
          v161 = 0x3FFFFFFFFFFFFFFFLL;
        if (v161 >> 62)
          sub_1B02D72AC();
        v162 = v161;
        v163 = (char *)operator new(4 * v161);
        v164 = 4 * v158;
        v223 = v163;
        v224 = 4 * v158;
        v165 = &v163[4 * v157];
        bzero(v165, v164);
        v166 = v156 - v155;
        if (v156 == v155)
        {
          v168 = v165;
          v169 = v223;
          v170 = v224;
        }
        else
        {
          v167 = v166 - 4;
          if ((unint64_t)(v166 - 4) < 0x2C)
          {
            v168 = v165;
            v169 = v223;
            v170 = v224;
            goto LABEL_275;
          }
          v169 = v223;
          v170 = v224;
          v168 = v165;
          if ((unint64_t)(v155 - v223) < 0x20)
            goto LABEL_356;
          v174 = (v167 >> 2) + 1;
          v175 = 4 * (v174 & 0x7FFFFFFFFFFFFFF8);
          v176 = &v156[-v175];
          v168 = &v165[-v175];
          v177 = &v223[4 * v157 - 16];
          v178 = (__int128 *)(v156 - 16);
          v179 = v174 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v180 = *v178;
            *((_OWORD *)v177 - 1) = *(v178 - 1);
            *(_OWORD *)v177 = v180;
            v177 -= 32;
            v178 -= 2;
            v179 -= 8;
          }
          while (v179);
          v156 = v176;
          if (v174 != (v174 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_356:
            do
            {
LABEL_275:
              v181 = *((_DWORD *)v156 - 1);
              v156 -= 4;
              *((_DWORD *)v168 - 1) = v181;
              v168 -= 4;
            }
            while (v156 != v155);
          }
        }
        *((_QWORD *)v139 + 7) = v168;
        *((_QWORD *)v139 + 8) = &v165[v170];
        *((_QWORD *)v139 + 9) = &v169[4 * v162];
        if (v155)
          operator delete(v155);
LABEL_278:
        v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v91->__value_.__left_;
        v183 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        v184 = &self->_stateInputEspressoBuffers.__tree_.__pair1_;
        if (v91->__value_.__left_)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v185 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          else
            v185 = __p.__r_.__value_.__l.__size_;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v186 = &__p;
          else
            v186 = (std::string *)__p.__r_.__value_.__r.__words[0];
          while (1)
          {
            while (1)
            {
              v184 = v182;
              v189 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v182[4].__value_.__left_;
              v187 = v182 + 4;
              v188 = v189;
              v190 = SHIBYTE(v187[2].__value_.__left_);
              if (v190 >= 0)
                v191 = HIBYTE(v187[2].__value_.__left_);
              else
                v191 = (size_t)v187[1].__value_.__left_;
              if (v190 >= 0)
                v192 = v187;
              else
                v192 = v188;
              if (v191 >= v185)
                v193 = v185;
              else
                v193 = v191;
              v194 = memcmp(v186, v192, v193);
              v195 = v185 < v191;
              if (v194)
                v195 = v194 < 0;
              if (!v195)
                break;
              v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v184->__value_.__left_;
              v183 = v184;
              if (!v184->__value_.__left_)
                goto LABEL_303;
            }
            v196 = memcmp(v192, v186, v193);
            v197 = v191 < v185;
            if (v196)
              v197 = v196 < 0;
            if (!v197)
              break;
            v182 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v184[1].__value_.__left_;
            if (!v182)
            {
              v183 = v184 + 1;
              goto LABEL_303;
            }
          }
          v198 = &v184->__value_.__left_;
        }
        else
        {
LABEL_303:
          v198 = operator new(0x50uLL);
          v199 = v198 + 4;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1B02EB0A8(v199, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v199 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v198[6] = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          }
          v198[7] = 0;
          v198[8] = 0;
          v198[9] = 0;
          *v198 = 0;
          v198[1] = 0;
          v198[2] = v184;
          v183->__value_.__left_ = v198;
          v200 = *(void **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
          v201 = v198;
          if (v200)
          {
            p_stateInputEspressoBuffers->__tree_.__begin_node_ = v200;
            v201 = v183->__value_.__left_;
          }
          v202 = (uint64_t *)v91->__value_.__left_;
          v43 = v201 == v91->__value_.__left_;
          *((_BYTE *)v201 + 24) = v43;
          if (!v43)
          {
            do
            {
              v203 = v201[2];
              if (*(_BYTE *)(v203 + 24))
                break;
              v204 = *(uint64_t **)(v203 + 16);
              v205 = *v204;
              if (*v204 == v203)
              {
                v208 = v204[1];
                if (!v208 || (v209 = *(unsigned __int8 *)(v208 + 24), v206 = (_BYTE *)(v208 + 24), v209))
                {
                  if (*(_QWORD **)v203 == v201)
                  {
                    *(_BYTE *)(v203 + 24) = 1;
                    *((_BYTE *)v204 + 24) = 0;
                    v212 = *(_QWORD *)(v203 + 8);
                    *v204 = v212;
                    if (v212)
                      goto LABEL_323;
                  }
                  else
                  {
                    v210 = *(uint64_t **)(v203 + 8);
                    v211 = *v210;
                    *(_QWORD *)(v203 + 8) = *v210;
                    if (v211)
                    {
                      *(_QWORD *)(v211 + 16) = v203;
                      v204 = *(uint64_t **)(v203 + 16);
                    }
                    v210[2] = (uint64_t)v204;
                    *(_QWORD *)(*(_QWORD *)(v203 + 16) + 8 * (**(_QWORD **)(v203 + 16) != v203)) = v210;
                    *v210 = v203;
                    *(_QWORD *)(v203 + 16) = v210;
                    v204 = (uint64_t *)v210[2];
                    v203 = *v204;
                    *((_BYTE *)v210 + 24) = 1;
                    *((_BYTE *)v204 + 24) = 0;
                    v212 = *(_QWORD *)(v203 + 8);
                    *v204 = v212;
                    if (v212)
LABEL_323:
                      *(_QWORD *)(v212 + 16) = v204;
                  }
                  *(_QWORD *)(v203 + 16) = v204[2];
                  *(_QWORD *)(v204[2] + 8 * (*(_QWORD *)v204[2] != (_QWORD)v204)) = v203;
                  *(_QWORD *)(v203 + 8) = v204;
LABEL_330:
                  v204[2] = v203;
                  break;
                }
              }
              else if (!v205 || (v207 = *(unsigned __int8 *)(v205 + 24), v206 = (_BYTE *)(v205 + 24), v207))
              {
                if (*(_QWORD **)v203 == v201)
                {
                  v221 = v201[1];
                  *(_QWORD *)v203 = v221;
                  if (v221)
                  {
                    *(_QWORD *)(v221 + 16) = v203;
                    v204 = *(uint64_t **)(v203 + 16);
                  }
                  v201[2] = v204;
                  *(_QWORD *)(*(_QWORD *)(v203 + 16) + 8 * (**(_QWORD **)(v203 + 16) != v203)) = v201;
                  v201[1] = v203;
                  *(_QWORD *)(v203 + 16) = v201;
                  v204 = (uint64_t *)v201[2];
                  *((_BYTE *)v201 + 24) = 1;
                  *((_BYTE *)v204 + 24) = 0;
                  v203 = v204[1];
                  v213 = *(_QWORD **)v203;
                  v204[1] = *(_QWORD *)v203;
                  if (v213)
LABEL_328:
                    v213[2] = v204;
                }
                else
                {
                  *(_BYTE *)(v203 + 24) = 1;
                  *((_BYTE *)v204 + 24) = 0;
                  v203 = v204[1];
                  v213 = *(_QWORD **)v203;
                  v204[1] = *(_QWORD *)v203;
                  if (v213)
                    goto LABEL_328;
                }
                *(_QWORD *)(v203 + 16) = v204[2];
                *(_QWORD *)(v204[2] + 8 * (*(_QWORD *)v204[2] != (_QWORD)v204)) = v203;
                *(_QWORD *)v203 = v204;
                goto LABEL_330;
              }
              *(_BYTE *)(v203 + 24) = 1;
              v201 = v204;
              *((_BYTE *)v204 + 24) = v204 == v202;
              *v206 = 1;
            }
            while (v204 != v202);
          }
          ++self->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
        }
        v214 = (void *)v198[7];
        v215 = objc_retainAutorelease(v230);
        v219 = (const void *)objc_msgSend_bytes(v215, v216, v217, v218);
        memcpy(v214, v219, 4 * i);
LABEL_333:

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v5 = v229 + 1;
      }
      while (v229 + 1 != v226);
      v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v220, (uint64_t)&v234, (uint64_t)v238, 16);
    }
    while (v4);
  }

}

- (void)copyOutputState:(id)a3
{
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *p_stateOutputEspressoBuffers;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *begin_node;
  char *left;
  char *left_high;
  uint64_t v8;
  unint64_t v9;
  void **v10;
  _BYTE *v11;
  char *v12;
  __int128 *v13;
  _OWORD *v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  size_t v21;
  unint64_t v22;
  __int128 *p_dst;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  unint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *p_stateInputEspressoBuffers;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v37;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v39;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v40;
  size_t v41;
  __int128 *v42;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v43;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v44;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v45;
  int v46;
  size_t v47;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v48;
  size_t v49;
  int v50;
  _BOOL4 v51;
  int v52;
  _BOOL4 v53;
  _QWORD *p_left;
  _BYTE *v55;
  char *v56;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v57;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v58;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t *v63;
  BOOL v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  _BYTE *v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  int v76;
  size_t v77;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v78;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v79;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v80;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v81;
  int v82;
  size_t v83;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v84;
  size_t v85;
  int v86;
  _BOOL4 v87;
  int v88;
  _BOOL4 v89;
  _QWORD *v90;
  _BYTE *v91;
  __int128 v92;
  void *v93;
  _QWORD *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  _BYTE *v100;
  int v101;
  uint64_t v102;
  int v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v115;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *v116;
  id v117;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *v118;
  uint64_t v119;
  CVNLPCaptionDecoderBlock *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *p_pair1;
  char *__p;
  char *v127;
  uint64_t v128;
  __int128 __dst;
  int64_t v130;
  void **v131;
  size_t v132;
  int64_t v133;

  v117 = a3;
  v120 = self;
  p_stateOutputEspressoBuffers = &self->_stateOutputEspressoBuffers;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)self->_stateOutputEspressoBuffers.__tree_.__begin_node_;
  p_pair1 = &self->_stateOutputEspressoBuffers.__tree_.__pair1_;
  if (begin_node != &self->_stateOutputEspressoBuffers.__tree_.__pair1_)
  {
    v118 = &self->_stateOutputEspressoBuffers;
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
      v8 = (uint64_t)&left_high[(_QWORD)left - 4];
      v9 = (unint64_t)(left_high - 4);
      if ((unint64_t)(left_high - 4) > 0x7FFFFFFFFFFFFFF7)
        sub_1B02D78C4();
      if (v9 > 0x16)
      {
        v17 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v9 | 7) != 0x17)
          v17 = v9 | 7;
        v18 = v17 + 1;
        v10 = (void **)operator new(v17 + 1);
        v132 = v9;
        v133 = v18 | 0x8000000000000000;
        v131 = v10;
        if (left == (char *)v8)
        {
LABEL_19:
          v11 = v10;
          goto LABEL_22;
        }
      }
      else
      {
        HIBYTE(v133) = (_BYTE)left_high - 4;
        v10 = (void **)&v131;
        if (left == (char *)v8)
          goto LABEL_19;
      }
      if (v9 < 0x20 || (unint64_t)((char *)v10 - left) < 0x20)
      {
        v11 = v10;
        v12 = left;
      }
      else
      {
        v11 = (char *)v10 + (v9 & 0xFFFFFFFFFFFFFFE0);
        v12 = &left[v9 & 0xFFFFFFFFFFFFFFE0];
        v13 = (__int128 *)(left + 16);
        v14 = v10 + 2;
        v15 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v16 = *v13;
          *(v14 - 1) = *(v13 - 1);
          *v14 = v16;
          v13 += 2;
          v14 += 2;
          v15 -= 32;
        }
        while (v15);
        if (v9 == (v9 & 0xFFFFFFFFFFFFFFE0))
          goto LABEL_22;
      }
      do
      {
        v19 = *v12++;
        *v11++ = v19;
      }
      while (v12 != (char *)v8);
LABEL_22:
      *v11 = 0;
      v20 = SHIBYTE(v133);
      if (v133 >= 0)
        v21 = HIBYTE(v133);
      else
        v21 = v132;
      v22 = v21 + 3;
      if (v21 + 3 > 0x7FFFFFFFFFFFFFF7)
        sub_1B02D78C4();
      if (v22 >= 0x17)
      {
        v24 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v22 | 7) != 0x17)
          v24 = v22 | 7;
        v25 = v24 + 1;
        p_dst = (__int128 *)operator new(v24 + 1);
        *((_QWORD *)&__dst + 1) = v21 + 3;
        v130 = v25 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        v130 = 0;
        __dst = 0uLL;
        p_dst = &__dst;
        HIBYTE(v130) = v21 + 3;
        if (!v21)
          goto LABEL_36;
      }
      if (v20 >= 0)
        v26 = (void **)&v131;
      else
        v26 = v131;
      memmove(p_dst, v26, v21);
LABEL_36:
      *(_DWORD *)((char *)p_dst + v21) = 7235935;
      v27 = *(_QWORD *)(sub_1B0379EC8((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7]+ 8);
      v28 = *(_QWORD *)(sub_1B0379EC8((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7]+ 16);
      v29 = v27 + 1;
      v122 = *(_QWORD *)sub_1B0379EC8((uint64_t **)&v120->_stateInputEspressoBuffersShape, (const void **)&__dst, (uint64_t)&__dst)[7];
      v31 = v28 * (v27 + 1) * v122;
      __p = 0;
      v127 = 0;
      HIDWORD(v128) = 0;
      if (!v31)
      {
        v33 = 0;
        v32 = 0;
        if (!v28)
          goto LABEL_168;
LABEL_41:
        v34 = 0;
        v35 = v122 * v27;
        v123 = v122 * v29;
        v124 = v122 * v27;
        v119 = 4 * v122 * v27;
        v121 = v28;
        while (2)
        {
          if (v35)
          {
            p_stateInputEspressoBuffers = &v120->_stateInputEspressoBuffers;
            v38 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v120->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_;
            v39 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            v40 = &v120->_stateInputEspressoBuffers.__tree_.__pair1_;
            if (v37)
            {
              if (v130 >= 0)
                v41 = HIBYTE(v130);
              else
                v41 = *((_QWORD *)&__dst + 1);
              if (v130 >= 0)
                v42 = &__dst;
              else
                v42 = (__int128 *)__dst;
              while (1)
              {
                while (1)
                {
                  v40 = v37;
                  v45 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v37[4].__value_.__left_;
                  v43 = v37 + 4;
                  v44 = v45;
                  v46 = SHIBYTE(v43[2].__value_.__left_);
                  if (v46 >= 0)
                    v47 = HIBYTE(v43[2].__value_.__left_);
                  else
                    v47 = (size_t)v43[1].__value_.__left_;
                  if (v46 >= 0)
                    v48 = v43;
                  else
                    v48 = v44;
                  if (v47 >= v41)
                    v49 = v41;
                  else
                    v49 = v47;
                  v50 = memcmp(v42, v48, v49);
                  v51 = v41 < v47;
                  if (v50)
                    v51 = v50 < 0;
                  if (!v51)
                    break;
                  v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v40->__value_.__left_;
                  v39 = v40;
                  if (!v40->__value_.__left_)
                    goto LABEL_73;
                }
                v52 = memcmp(v48, v42, v49);
                v53 = v47 < v41;
                if (v52)
                  v53 = v52 < 0;
                if (!v53)
                  break;
                v37 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v40[1].__value_.__left_;
                if (!v37)
                {
                  v39 = v40 + 1;
                  goto LABEL_73;
                }
              }
              p_left = &v40->__value_.__left_;
              v62 = v124;
            }
            else
            {
LABEL_73:
              p_left = operator new(0x50uLL);
              v55 = p_left + 4;
              if (SHIBYTE(v130) < 0)
              {
                sub_1B02EB0A8(v55, (void *)__dst, *((unint64_t *)&__dst + 1));
              }
              else
              {
                *(_OWORD *)v55 = __dst;
                p_left[6] = v130;
              }
              p_left[7] = 0;
              p_left[8] = 0;
              p_left[9] = 0;
              *p_left = 0;
              p_left[1] = 0;
              p_left[2] = v40;
              v39->__value_.__left_ = p_left;
              v60 = *(_QWORD **)p_stateInputEspressoBuffers->__tree_.__begin_node_;
              v61 = p_left;
              v62 = v124;
              if (v60)
              {
                p_stateInputEspressoBuffers->__tree_.__begin_node_ = v60;
                v61 = v39->__value_.__left_;
              }
              v63 = (uint64_t *)v38->__value_.__left_;
              v64 = v61 == v38->__value_.__left_;
              *((_BYTE *)v61 + 24) = v64;
              if (!v64)
              {
                do
                {
                  v65 = v61[2];
                  if (*(_BYTE *)(v65 + 24))
                    break;
                  v66 = *(uint64_t **)(v65 + 16);
                  v67 = *v66;
                  if (*v66 == v65)
                  {
                    v70 = v66[1];
                    if (!v70 || (v71 = *(unsigned __int8 *)(v70 + 24), v68 = (_BYTE *)(v70 + 24), v71))
                    {
                      if (*(_QWORD **)v65 == v61)
                      {
                        *(_BYTE *)(v65 + 24) = 1;
                        *((_BYTE *)v66 + 24) = 0;
                        v74 = *(_QWORD *)(v65 + 8);
                        *v66 = v74;
                        if (v74)
                          goto LABEL_95;
                      }
                      else
                      {
                        v72 = *(uint64_t **)(v65 + 8);
                        v73 = *v72;
                        *(_QWORD *)(v65 + 8) = *v72;
                        if (v73)
                        {
                          *(_QWORD *)(v73 + 16) = v65;
                          v66 = *(uint64_t **)(v65 + 16);
                        }
                        v72[2] = (uint64_t)v66;
                        *(_QWORD *)(*(_QWORD *)(v65 + 16) + 8 * (**(_QWORD **)(v65 + 16) != v65)) = v72;
                        *v72 = v65;
                        *(_QWORD *)(v65 + 16) = v72;
                        v66 = (uint64_t *)v72[2];
                        v65 = *v66;
                        *((_BYTE *)v72 + 24) = 1;
                        *((_BYTE *)v66 + 24) = 0;
                        v74 = *(_QWORD *)(v65 + 8);
                        *v66 = v74;
                        if (v74)
LABEL_95:
                          *(_QWORD *)(v74 + 16) = v66;
                      }
                      *(_QWORD *)(v65 + 16) = v66[2];
                      *(_QWORD *)(v66[2] + 8 * (*(_QWORD *)v66[2] != (_QWORD)v66)) = v65;
                      *(_QWORD *)(v65 + 8) = v66;
LABEL_102:
                      v66[2] = v65;
                      break;
                    }
                  }
                  else if (!v67 || (v69 = *(unsigned __int8 *)(v67 + 24), v68 = (_BYTE *)(v67 + 24), v69))
                  {
                    if (*(_QWORD **)v65 == v61)
                    {
                      v109 = v61[1];
                      *(_QWORD *)v65 = v109;
                      if (v109)
                      {
                        *(_QWORD *)(v109 + 16) = v65;
                        v66 = *(uint64_t **)(v65 + 16);
                      }
                      v61[2] = v66;
                      *(_QWORD *)(*(_QWORD *)(v65 + 16) + 8 * (**(_QWORD **)(v65 + 16) != v65)) = v61;
                      v61[1] = v65;
                      *(_QWORD *)(v65 + 16) = v61;
                      v66 = (uint64_t *)v61[2];
                      *((_BYTE *)v61 + 24) = 1;
                      *((_BYTE *)v66 + 24) = 0;
                      v65 = v66[1];
                      v75 = *(_QWORD **)v65;
                      v66[1] = *(_QWORD *)v65;
                      if (v75)
LABEL_100:
                        v75[2] = v66;
                    }
                    else
                    {
                      *(_BYTE *)(v65 + 24) = 1;
                      *((_BYTE *)v66 + 24) = 0;
                      v65 = v66[1];
                      v75 = *(_QWORD **)v65;
                      v66[1] = *(_QWORD *)v65;
                      if (v75)
                        goto LABEL_100;
                    }
                    *(_QWORD *)(v65 + 16) = v66[2];
                    *(_QWORD *)(v66[2] + 8 * (*(_QWORD *)v66[2] != (_QWORD)v66)) = v65;
                    *(_QWORD *)v65 = v66;
                    goto LABEL_102;
                  }
                  *(_BYTE *)(v65 + 24) = 1;
                  v61 = v66;
                  *((_BYTE *)v66 + 24) = v66 == v63;
                  *v68 = 1;
                }
                while (v66 != v63);
              }
              ++v120->_stateInputEspressoBuffers.__tree_.__pair3_.__value_;
            }
            v56 = __p;
            memcpy(&__p[4 * v34 * v123], (const void *)(p_left[7] + 4 * v34 * v62), v119);
            p_stateOutputEspressoBuffers = v118;
            v57 = p_pair1;
            v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
            v59 = p_pair1;
            if (p_pair1->__value_.__left_)
            {
LABEL_105:
              v76 = SHIBYTE(begin_node[6].__value_.__left_);
              if (v76 >= 0)
                v77 = HIBYTE(begin_node[6].__value_.__left_);
              else
                v77 = (size_t)begin_node[5].__value_.__left_;
              if (v76 >= 0)
                v78 = begin_node + 4;
              else
                v78 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[4].__value_.__left_;
              while (1)
              {
                while (1)
                {
                  v57 = v58;
                  v81 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v58[4].__value_.__left_;
                  v79 = v58 + 4;
                  v80 = v81;
                  v82 = SHIBYTE(v79[2].__value_.__left_);
                  if (v82 >= 0)
                    v83 = HIBYTE(v79[2].__value_.__left_);
                  else
                    v83 = (size_t)v79[1].__value_.__left_;
                  if (v82 >= 0)
                    v84 = v79;
                  else
                    v84 = v80;
                  if (v83 >= v77)
                    v85 = v77;
                  else
                    v85 = v83;
                  v86 = memcmp(v78, v84, v85);
                  v87 = v77 < v83;
                  if (v86)
                    v87 = v86 < 0;
                  if (!v87)
                    break;
                  v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v57->__value_.__left_;
                  v59 = v57;
                  if (!v57->__value_.__left_)
                    goto LABEL_129;
                }
                v88 = memcmp(v84, v78, v85);
                v89 = v83 < v77;
                if (v88)
                  v89 = v88 < 0;
                if (!v89)
                  break;
                v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v57[1].__value_.__left_;
                if (!v58)
                {
                  v59 = v57 + 1;
                  goto LABEL_129;
                }
              }
              v90 = &v57->__value_.__left_;
              v96 = v121;
              v35 = v124;
LABEL_46:
              memcpy(&v56[4 * v34 * v123 + 4 * v35], (const void *)(v90[7] + 4 * v34 * v122), 4 * v122);
              if (++v34 == v96)
              {
                v32 = __p;
                v33 = v127;
                goto LABEL_168;
              }
              continue;
            }
          }
          else
          {
            v57 = p_pair1;
            v56 = __p;
            v58 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)p_pair1->__value_.__left_;
            v59 = p_pair1;
            if (p_pair1->__value_.__left_)
              goto LABEL_105;
          }
          break;
        }
LABEL_129:
        v90 = operator new(0x50uLL);
        v91 = v90 + 4;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
        {
          sub_1B02EB0A8(v91, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
        }
        else
        {
          v92 = *(_OWORD *)&begin_node[4].__value_.__left_;
          v90[6] = begin_node[6].__value_.__left_;
          *(_OWORD *)v91 = v92;
        }
        v90[7] = 0;
        v90[8] = 0;
        v90[9] = 0;
        *v90 = 0;
        v90[1] = 0;
        v90[2] = v57;
        v59->__value_.__left_ = v90;
        v93 = *(void **)p_stateOutputEspressoBuffers->__tree_.__begin_node_;
        v94 = v90;
        v35 = v124;
        if (v93)
        {
          p_stateOutputEspressoBuffers->__tree_.__begin_node_ = v93;
          v94 = v59->__value_.__left_;
        }
        v95 = (uint64_t *)p_pair1->__value_.__left_;
        v64 = v94 == p_pair1->__value_.__left_;
        *((_BYTE *)v94 + 24) = v64;
        v96 = v121;
        if (!v64)
        {
          do
          {
            v97 = v94[2];
            if (*(_BYTE *)(v97 + 24))
              break;
            v98 = *(uint64_t **)(v97 + 16);
            v99 = *v98;
            if (*v98 == v97)
            {
              v102 = v98[1];
              if (!v102 || (v103 = *(unsigned __int8 *)(v102 + 24), v100 = (_BYTE *)(v102 + 24), v103))
              {
                if (*(_QWORD **)v97 == v94)
                {
                  *(_BYTE *)(v97 + 24) = 1;
                  *((_BYTE *)v98 + 24) = 0;
                  v106 = *(_QWORD *)(v97 + 8);
                  *v98 = v106;
                  if (v106)
                    goto LABEL_149;
                }
                else
                {
                  v104 = *(uint64_t **)(v97 + 8);
                  v105 = *v104;
                  *(_QWORD *)(v97 + 8) = *v104;
                  if (v105)
                  {
                    *(_QWORD *)(v105 + 16) = v97;
                    v98 = *(uint64_t **)(v97 + 16);
                  }
                  v104[2] = (uint64_t)v98;
                  *(_QWORD *)(*(_QWORD *)(v97 + 16) + 8 * (**(_QWORD **)(v97 + 16) != v97)) = v104;
                  *v104 = v97;
                  *(_QWORD *)(v97 + 16) = v104;
                  v98 = (uint64_t *)v104[2];
                  v97 = *v98;
                  *((_BYTE *)v104 + 24) = 1;
                  *((_BYTE *)v98 + 24) = 0;
                  v106 = *(_QWORD *)(v97 + 8);
                  *v98 = v106;
                  if (v106)
LABEL_149:
                    *(_QWORD *)(v106 + 16) = v98;
                }
                *(_QWORD *)(v97 + 16) = v98[2];
                *(_QWORD *)(v98[2] + 8 * (*(_QWORD *)v98[2] != (_QWORD)v98)) = v97;
                *(_QWORD *)(v97 + 8) = v98;
LABEL_44:
                v98[2] = v97;
                break;
              }
            }
            else if (!v99 || (v101 = *(unsigned __int8 *)(v99 + 24), v100 = (_BYTE *)(v99 + 24), v101))
            {
              if (*(_QWORD **)v97 == v94)
              {
                v108 = v94[1];
                *(_QWORD *)v97 = v108;
                if (v108)
                {
                  *(_QWORD *)(v108 + 16) = v97;
                  v98 = *(uint64_t **)(v97 + 16);
                }
                v94[2] = v98;
                *(_QWORD *)(*(_QWORD *)(v97 + 16) + 8 * (**(_QWORD **)(v97 + 16) != v97)) = v94;
                v94[1] = v97;
                *(_QWORD *)(v97 + 16) = v94;
                v98 = (uint64_t *)v94[2];
                *((_BYTE *)v94 + 24) = 1;
                *((_BYTE *)v98 + 24) = 0;
                v97 = v98[1];
                v107 = *(_QWORD **)v97;
                v98[1] = *(_QWORD *)v97;
                if (!v107)
                  goto LABEL_43;
              }
              else
              {
                *(_BYTE *)(v97 + 24) = 1;
                *((_BYTE *)v98 + 24) = 0;
                v97 = v98[1];
                v107 = *(_QWORD **)v97;
                v98[1] = *(_QWORD *)v97;
                if (!v107)
                  goto LABEL_43;
              }
              v107[2] = v98;
LABEL_43:
              *(_QWORD *)(v97 + 16) = v98[2];
              *(_QWORD *)(v98[2] + 8 * (*(_QWORD *)v98[2] != (_QWORD)v98)) = v97;
              *(_QWORD *)v97 = v98;
              goto LABEL_44;
            }
            *(_BYTE *)(v97 + 24) = 1;
            v94 = v98;
            *((_BYTE *)v98 + 24) = v98 == v95;
            *v100 = 1;
          }
          while (v98 != v95);
        }
        ++p_stateOutputEspressoBuffers->__tree_.__pair3_.__value_;
        goto LABEL_46;
      }
      if (v31 >> 62)
        sub_1B02D7758();
      v32 = (char *)operator new(4 * v31);
      v33 = &v32[4 * v31];
      __p = v32;
      HIDWORD(v128) = HIDWORD(v33);
      bzero(v32, 4 * v29 * v28 * v122);
      v127 = v33;
      if (v28)
        goto LABEL_41;
LABEL_168:
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v30, (uint64_t)v32, v33 - v32);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (v133 >= 0)
        objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v110, (uint64_t)&v131, v111);
      else
        objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v110, (uint64_t)v131, v111);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v117, v114, (uint64_t)v112, (uint64_t)v113);

      if (__p)
        operator delete(__p);
      if (SHIBYTE(v130) < 0)
      {
        operator delete((void *)__dst);
        if ((SHIBYTE(v133) & 0x80000000) == 0)
        {
LABEL_175:
          v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v115)
            goto LABEL_179;
          goto LABEL_181;
        }
      }
      else if ((SHIBYTE(v133) & 0x80000000) == 0)
      {
        goto LABEL_175;
      }
      operator delete(v131);
      v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[1].__value_.__left_;
      if (v115)
      {
        do
        {
LABEL_179:
          v116 = v115;
          v115 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)v115->__value_.__left_;
        }
        while (v115);
        goto LABEL_3;
      }
      do
      {
LABEL_181:
        v116 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<float>>, void *>>> *)begin_node[2].__value_.__left_;
        v64 = v116->__value_.__left_ == begin_node;
        begin_node = v116;
      }
      while (!v64);
LABEL_3:
      begin_node = v116;
    }
    while (v116 != p_pair1);
  }

}

- (void)runBlockWithCopyInputBlock:(id)a3 copyOutputBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD block[4];
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend_decoderQueue(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0377F10;
  block[3] = &unk_1E60CE170;
  v13 = v6;
  v22 = v13;
  dispatch_sync(v11, block);

  objc_msgSend_decoderQueue(self, v14, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = sub_1B0377F1C;
  v19[3] = &unk_1E60CE198;
  v19[4] = self;
  v20 = v7;
  v18 = v7;
  dispatch_async(v17, v19);

}

- (void)runBlockWithCopyInput:(float *)a3 copyOutputBlock:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  float *v14;

  v6 = a4;
  objc_msgSend_decoderQueue(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0377FD8;
  block[3] = &unk_1E60CE1C0;
  v13 = v6;
  v14 = a3;
  block[4] = self;
  v11 = v6;
  dispatch_async(v10, block);

}

- (void)_runBlockWithCopyOutputBlock:(id)a3
{
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _BYTE v33[168];
  _BYTE v34[216];
  _QWORD v35[5];

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend_perfResults(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metricString(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1B03782E0;
  v35[3] = &unk_1E60CE1E8;
  v35[4] = self;
  objc_msgSend_run_block_(v8, v13, (uint64_t)v12, (uint64_t)v35);

  objc_msgSend_nextBlock(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_blockOutput(self, v18, v19, v20);
    objc_msgSend__blob_size_(self, v21, (uint64_t)v34, v22);
    v23 = operator new[]();
    objc_msgSend_blockOutput(self, v24, v25, v26);
    objc_msgSend__copy_data_from_blob_toPtr_(self, v27, (uint64_t)v33, v23);
    objc_msgSend_nextBlock(self, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_runBlockWithCopyInput_copyOutputBlock_(v31, v32, v23, (uint64_t)v4);

  }
  else
  {
    v4[2](v4);
  }

}

- (unint64_t)modelIndex
{
  return self->_modelIndex;
}

- (void)setModelIndex:(unint64_t)a3
{
  self->_modelIndex = a3;
}

- (void)decoderPlan
{
  return self->_decoderPlan;
}

- (void)setDecoderPlan:(void *)a3
{
  self->_decoderPlan = a3;
}

- (void)decoderCtx
{
  return self->_decoderCtx;
}

- (void)setDecoderCtx:(void *)a3
{
  self->_decoderCtx = a3;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)decoderNet
{
  $81D76D3AE0848955339013A8156F227B *p_decoderNet;
  void *plan;
  uint64_t v4;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  p_decoderNet = &self->_decoderNet;
  plan = self->_decoderNet.plan;
  v4 = *(_QWORD *)&p_decoderNet->network_index;
  result.var1 = v4;
  result.var0 = plan;
  return result;
}

- (void)setDecoderNet:(id)a3
{
  self->_decoderNet = ($81D76D3AE0848955339013A8156F227B)a3;
}

- ($FD4688982923A924290ECB669CAF1EC2)attFeatsPlaceholderBlob
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[1].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[2].var2[1];
  v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[1].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[1].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setAttFeatsPlaceholderBlob:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_attFeatsPlaceholderBlob.dim = v4;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.channels = v5;
  *(_OWORD *)self->_attFeatsPlaceholderBlob.stride = v7;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_attFeatsPlaceholderBlob.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride_height = v9;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.stride_batch_number = v8;
  *(_OWORD *)&self->_attFeatsPlaceholderBlob.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)scaleInput
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[2].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[3].var2[1];
  v4 = *(_OWORD *)&self[2].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[2].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[2].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[2].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[2].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setScaleInput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_scaleInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_scaleInput.dim = v4;
  *(_OWORD *)&self->_scaleInput.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_scaleInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_scaleInput.channels = v5;
  *(_OWORD *)self->_scaleInput.stride = v7;
  *(_OWORD *)&self->_scaleInput.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_scaleInput.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_scaleInput.stride_height = v9;
  *(_OWORD *)&self->_scaleInput.stride_batch_number = v8;
  *(_OWORD *)&self->_scaleInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)positionInput
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[3].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[4].var2[1];
  v4 = *(_OWORD *)&self[3].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[3].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[3].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[3].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[3].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[3].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setPositionInput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_positionInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_positionInput.dim = v4;
  *(_OWORD *)&self->_positionInput.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_positionInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_positionInput.channels = v5;
  *(_OWORD *)self->_positionInput.stride = v7;
  *(_OWORD *)&self->_positionInput.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_positionInput.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_positionInput.stride_height = v9;
  *(_OWORD *)&self->_positionInput.stride_batch_number = v8;
  *(_OWORD *)&self->_positionInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)maskInput
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[5].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[4].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[5].var2[1];
  v4 = *(_OWORD *)&self[4].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[4].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[4].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[4].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[4].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[4].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setMaskInput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_maskInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_maskInput.dim = v4;
  *(_OWORD *)&self->_maskInput.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_maskInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_maskInput.channels = v5;
  *(_OWORD *)self->_maskInput.stride = v7;
  *(_OWORD *)&self->_maskInput.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_maskInput.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_maskInput.stride_height = v9;
  *(_OWORD *)&self->_maskInput.stride_batch_number = v8;
  *(_OWORD *)&self->_maskInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)blockInput
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[6].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[5].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[6].var2[1];
  v4 = *(_OWORD *)&self[5].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[5].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[5].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[5].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[5].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setBlockInput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_blockInput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_blockInput.dim = v4;
  *(_OWORD *)&self->_blockInput.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_blockInput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_blockInput.channels = v5;
  *(_OWORD *)self->_blockInput.stride = v7;
  *(_OWORD *)&self->_blockInput.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_blockInput.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_blockInput.stride_height = v9;
  *(_OWORD *)&self->_blockInput.stride_batch_number = v8;
  *(_OWORD *)&self->_blockInput.sequence_length = v10;
}

- ($FD4688982923A924290ECB669CAF1EC2)blockOutput
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[7].var1;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[6].var14;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[7].var2[1];
  v4 = *(_OWORD *)&self[6].var8;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[6].var6;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[6].var12;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[6].var10;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)self[6].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var2[2];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[6].var4;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[6].var3[2];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setBlockOutput:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)a3->var2;
  v3 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)&self->_blockOutput.data = *(_OWORD *)&a3->var0;
  *(_OWORD *)self->_blockOutput.dim = v4;
  *(_OWORD *)&self->_blockOutput.dim[2] = v3;
  v5 = *(_OWORD *)&a3->var6;
  v7 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  *(_OWORD *)&self->_blockOutput.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_blockOutput.channels = v5;
  *(_OWORD *)self->_blockOutput.stride = v7;
  *(_OWORD *)&self->_blockOutput.stride[2] = v6;
  v9 = *(_OWORD *)&a3->var10;
  v8 = *(_OWORD *)&a3->var12;
  v10 = *(_OWORD *)&a3->var8;
  *(_QWORD *)&self->_blockOutput.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_blockOutput.stride_height = v9;
  *(_OWORD *)&self->_blockOutput.stride_batch_number = v8;
  *(_OWORD *)&self->_blockOutput.sequence_length = v10;
}

- (map<std::string,)stateOutputEspressoBuffers
{
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<float>>, std::less<std::string>>> *p_pair3;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *left;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *begin_node;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **value;
  BOOL v8;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  p_pair3 = &self[4].__tree_.__pair3_;
  left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[4].__tree_.__pair1_.__value_.__left_;
  if (left != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[4].__tree_.__pair3_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_1B0379328((uint64_t *)retstr, (uint64_t)&retstr->__tree_.__pair1_, (const void **)&left[1].__tree_.__pair1_.__value_.__left_, (__int128 *)&left[1].__tree_.__pair1_);
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__pair1_.__value_.__left_;
      if (begin_node)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__begin_node_;
        }
        while (begin_node);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left->__tree_.__pair3_.__value_;
          v8 = *value == left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v8);
      }
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)p_pair3);
  }
  return self;
}

- (void)setStateOutputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string
{
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *p_stateOutputEspressoBuffers;

  p_stateOutputEspressoBuffers = &self->_stateOutputEspressoBuffers;
  if (p_stateOutputEspressoBuffers != a3)
    sub_1B037977C((uint64_t)p_stateOutputEspressoBuffers, (__int128 *)a3->__tree_.__begin_node_, (__int128 *)&a3->__tree_.__pair1_);
}

- (map<std::string,)stateInputEspressoBuffers
{
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<float>>, std::less<std::string>>> *p_pair3;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *left;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *begin_node;
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **value;
  BOOL v8;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  p_pair3 = &self[5].__tree_.__pair3_;
  left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)self[5].__tree_.__pair1_.__value_.__left_;
  if (left != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)&self[5].__tree_.__pair3_)
  {
    do
    {
      self = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)sub_1B0379328((uint64_t *)retstr, (uint64_t)&retstr->__tree_.__pair1_, (const void **)&left[1].__tree_.__pair1_.__value_.__left_, (__int128 *)&left[1].__tree_.__pair1_);
      begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)left->__tree_.__pair1_.__value_.__left_;
      if (begin_node)
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)begin_node;
          begin_node = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)begin_node->__tree_.__begin_node_;
        }
        while (begin_node);
      }
      else
      {
        do
        {
          value = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)left->__tree_.__pair3_.__value_;
          v8 = *value == left;
          left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
        }
        while (!v8);
      }
      left = (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *)value;
    }
    while (value != (map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> **)p_pair3);
  }
  return self;
}

- (void)setStateInputEspressoBuffers:()map<std:()std:()std:(std:(std::vector<float>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<float> :string
{
  map<std::string, std::vector<float>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<float>>>> *p_stateInputEspressoBuffers;

  p_stateInputEspressoBuffers = &self->_stateInputEspressoBuffers;
  if (p_stateInputEspressoBuffers != a3)
    sub_1B037977C((uint64_t)p_stateInputEspressoBuffers, (__int128 *)a3->__tree_.__begin_node_, (__int128 *)&a3->__tree_.__pair1_);
}

- (map<std::string,)stateInputEspressoBuffersShape
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *p_pair1;
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v9;
  BOOL v10;
  int value_high;
  int left_high;
  size_t v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v14;
  size_t value;
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *v16;
  size_t v17;
  BOOL v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v19;
  uint64_t **v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v21;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v22;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v24;
  int v25;
  size_t v26;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v27;
  size_t v28;
  int v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t *v32;
  void *v33;
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *v34;
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *v35;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v36;
  __compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *p_pair3;

  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &retstr->__tree_.__pair1_;
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  left = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)self[6].__tree_.__pair1_.__value_.__left_;
  p_pair3 = &self[6].__tree_.__pair3_;
  if (left != &self[6].__tree_.__pair3_)
  {
    begin_node = &retstr->__tree_.__pair1_;
    while (1)
    {
      v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
      v7 = p_pair1;
      if (begin_node == p_pair1)
        break;
      v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)p_pair1->__value_.__left_;
      v9 = p_pair1;
      if (v6)
      {
        do
        {
          v7 = v8;
          v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v8[1].__value_.__left_;
        }
        while (v8);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v9[2].__value_.__left_;
          v10 = v7->__value_.__left_ == v9;
          v9 = v7;
        }
        while (v10);
      }
      value_high = SHIBYTE(left[6].__value_);
      left_high = SHIBYTE(v7[6].__value_.__left_);
      if (left_high >= 0)
        v13 = HIBYTE(v7[6].__value_.__left_);
      else
        v13 = (size_t)v7[5].__value_.__left_;
      if (left_high >= 0)
        v14 = v7 + 4;
      else
        v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v7[4].__value_.__left_;
      if (value_high >= 0)
        value = HIBYTE(left[6].__value_);
      else
        value = left[5].__value_;
      if (value_high >= 0)
        v16 = left + 4;
      else
        v16 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[4].__value_;
      if (value >= v13)
        v17 = v13;
      else
        v17 = value;
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)memcmp(v14, v16, v17);
      v18 = v13 < value;
      if ((_DWORD)self)
        v18 = (int)self < 0;
      if (v18)
        break;
      v36 = begin_node;
      v20 = (uint64_t **)p_pair1;
      v19 = p_pair1;
      if (!v6)
        goto LABEL_55;
      v21 = v6;
      while (1)
      {
        while (1)
        {
          v19 = v21;
          v24 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v21[4].__value_.__left_;
          v22 = v21 + 4;
          v23 = v24;
          v25 = SHIBYTE(v22[2].__value_.__left_);
          if (v25 >= 0)
            v26 = HIBYTE(v22[2].__value_.__left_);
          else
            v26 = (size_t)v22[1].__value_.__left_;
          if (v25 >= 0)
            v27 = v22;
          else
            v27 = v23;
          if (v26 >= value)
            v28 = value;
          else
            v28 = v26;
          v29 = memcmp(v16, v27, v28);
          v30 = value < v26;
          if (v29)
            v30 = v29 < 0;
          if (!v30)
            break;
          v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v19->__value_.__left_;
          v20 = (uint64_t **)v19;
          if (!v19->__value_.__left_)
            goto LABEL_55;
        }
        self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)memcmp(v27, v16, v28);
        v31 = v26 < value;
        if ((_DWORD)self)
          v31 = (int)self < 0;
        if (!v31)
          break;
        v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v19[1].__value_.__left_;
        if (!v21)
        {
          v20 = (uint64_t **)&v19[1];
          goto LABEL_55;
        }
      }
      begin_node = v36;
      v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[1].__value_;
      if (!v34)
      {
        do
        {
LABEL_62:
          v35 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[2].__value_;
          v10 = v35->__value_ == (_QWORD)left;
          left = v35;
        }
        while (!v10);
        goto LABEL_3;
      }
      do
      {
LABEL_59:
        v35 = v34;
        v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)v34->__value_;
      }
      while (v34);
LABEL_3:
      left = v35;
      if (v35 == p_pair3)
        return self;
    }
    if (v6)
      v19 = v7;
    else
      v19 = p_pair1;
    if (v6)
      v20 = (uint64_t **)&v7[1];
    else
      v20 = (uint64_t **)p_pair1;
    if (!*v20)
    {
LABEL_55:
      v32 = (uint64_t *)operator new(0x50uLL);
      sub_1B0379D58(v32 + 4, (__int128 *)&left[4]);
      *v32 = 0;
      v32[1] = 0;
      v32[2] = (uint64_t)v19;
      *v20 = v32;
      v33 = *(void **)retstr->__tree_.__begin_node_;
      if (v33)
      {
        retstr->__tree_.__begin_node_ = v33;
        v32 = *v20;
      }
      self = (map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *)sub_1B02D8180((uint64_t *)retstr->__tree_.__pair1_.__value_.__left_, v32);
      ++retstr->__tree_.__pair3_.__value_;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)retstr->__tree_.__begin_node_;
    }
    v34 = (__compressed_pair<unsigned long, std::__map_value_compare<std::string, std::__value_type<std::string, std::vector<unsigned long>>, std::less<std::string>>> *)left[1].__value_;
    if (!v34)
      goto LABEL_62;
    goto LABEL_59;
  }
  return self;
}

- (void)setStateInputEspressoBuffersShape:()map<std:(std:()std:(std:(std::vector<unsigned long>>>> *)a3 :allocator<std::pair<const)std::string :less<std::string> :vector<unsigned)long> :string
{
  map<std::string, std::vector<unsigned long>, std::less<std::string>, std::allocator<std::pair<const std::string, std::vector<unsigned long>>>> *p_stateInputEspressoBuffersShape;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *begin_node;
  _QWORD *v6;
  _QWORD *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v8;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v9;
  char *v10;
  char *v11;
  char *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v13;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v14;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v15;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v16;
  int left_high;
  size_t v18;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v19;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v20;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v21;
  int v22;
  size_t v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v24;
  size_t v25;
  int v26;
  _BOOL4 v27;
  void *v28;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v29;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v30;
  BOOL v31;
  char *v32;
  char *v33;
  char *i;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v35;
  _QWORD *v36;
  _QWORD *v37;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v39;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v40;
  int v41;
  size_t v42;
  const void *v43;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v44;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v45;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v46;
  int v47;
  size_t v48;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v49;
  size_t v50;
  int v51;
  _BOOL4 v52;
  void *v53;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v54;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *v55;
  char *v56;

  p_stateInputEspressoBuffersShape = &self->_stateInputEspressoBuffersShape;
  if (&self->_stateInputEspressoBuffersShape != a3)
  {
    p_pair1 = &a3->__tree_.__pair1_;
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)a3->__tree_.__begin_node_;
    if (!self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_)
      goto LABEL_60;
    v6 = p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
    v8 = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    left = self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_;
    self->_stateInputEspressoBuffersShape.__tree_.__begin_node_ = &self->_stateInputEspressoBuffersShape.__tree_.__pair1_;
    left[2] = 0;
    self->_stateInputEspressoBuffersShape.__tree_.__pair3_.__value_ = 0;
    self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_ = 0;
    v9 = v6[1]
       ? (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v6[1]
       : (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v6;
    if (v9)
    {
      v10 = (char *)v9[2].__value_.__left_;
      if (v10)
      {
        v11 = *(char **)v10;
        if (*(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> **)v10 == v9)
        {
          *(_QWORD *)v10 = 0;
          while (1)
          {
            v56 = (char *)*((_QWORD *)v10 + 1);
            if (!v56)
              break;
            do
            {
              v10 = v56;
              v56 = *(char **)v56;
            }
            while (v56);
          }
        }
        else
        {
          for (*((_QWORD *)v10 + 1) = 0; v11; v11 = (char *)*((_QWORD *)v10 + 1))
          {
            do
            {
              v10 = v11;
              v11 = *(char **)v11;
            }
            while (v11);
          }
        }
      }
      if (begin_node != p_pair1)
      {
        while (1)
        {
          v12 = v10;
          v13 = v9 + 4;
          std::string::operator=((std::string *)&v9[4], (const std::string *)&begin_node[4]);
          if (v9 != begin_node)
            sub_1B03267E8(&v9[7].__value_.__left_, (char *)begin_node[7].__value_.__left_, (char *)begin_node[8].__value_.__left_, ((char *)begin_node[8].__value_.__left_ - (char *)begin_node[7].__value_.__left_) >> 3);
          v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v8->__value_.__left_;
          v15 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
          v16 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
          if (v8->__value_.__left_)
            break;
LABEL_36:
          v9->__value_.__left_ = 0;
          v9[1].__value_.__left_ = 0;
          v9[2].__value_.__left_ = v15;
          v16->__value_.__left_ = v9;
          v28 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
          if (v28)
            goto LABEL_37;
LABEL_38:
          sub_1B02D8180((uint64_t *)p_stateInputEspressoBuffersShape->__tree_.__pair1_.__value_.__left_, (uint64_t *)v9);
          ++p_stateInputEspressoBuffersShape->__tree_.__pair3_.__value_;
          if (v12)
          {
            v10 = (char *)*((_QWORD *)v12 + 2);
            if (v10)
            {
              v32 = *(char **)v10;
              if (*(char **)v10 == v12)
              {
                *(_QWORD *)v10 = 0;
                while (1)
                {
                  v33 = (char *)*((_QWORD *)v10 + 1);
                  if (!v33)
                    break;
                  do
                  {
                    v10 = v33;
                    v33 = *(char **)v33;
                  }
                  while (v33);
                }
              }
              else
              {
                for (*((_QWORD *)v10 + 1) = 0; v32; v32 = (char *)*((_QWORD *)v10 + 1))
                {
                  do
                  {
                    v10 = v32;
                    v32 = *(char **)v32;
                  }
                  while (v32);
                }
              }
            }
          }
          else
          {
            v10 = 0;
          }
          v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)begin_node[1].__value_.__left_;
          if (v29)
          {
            do
            {
              v30 = v29;
              v29 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v29->__value_.__left_;
            }
            while (v29);
          }
          else
          {
            do
            {
              v30 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)begin_node[2].__value_.__left_;
              v31 = v30->__value_.__left_ == begin_node;
              begin_node = v30;
            }
            while (!v31);
          }
          if (v12)
          {
            v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v12;
            begin_node = v30;
            if (v30 != p_pair1)
              continue;
          }
          goto LABEL_62;
        }
        left_high = SHIBYTE(v9[6].__value_.__left_);
        if (left_high >= 0)
          v18 = HIBYTE(v9[6].__value_.__left_);
        else
          v18 = (size_t)v9[5].__value_.__left_;
        if (left_high < 0)
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v9[4].__value_.__left_;
        do
        {
          while (1)
          {
            v15 = v14;
            v21 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v14[4].__value_.__left_;
            v19 = v14 + 4;
            v20 = v21;
            v22 = SHIBYTE(v19[2].__value_.__left_);
            if (v22 >= 0)
              v23 = HIBYTE(v19[2].__value_.__left_);
            else
              v23 = (size_t)v19[1].__value_.__left_;
            if (v22 >= 0)
              v24 = v19;
            else
              v24 = v20;
            if (v23 >= v18)
              v25 = v18;
            else
              v25 = v23;
            v26 = memcmp(v13, v24, v25);
            v27 = v18 < v23;
            if (v26)
              v27 = v26 < 0;
            if (!v27)
              break;
            v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v15->__value_.__left_;
            v16 = v15;
            if (!v15->__value_.__left_)
              goto LABEL_36;
          }
          v14 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v15[1].__value_.__left_;
        }
        while (v14);
        v16 = v15 + 1;
        v9->__value_.__left_ = 0;
        v9[1].__value_.__left_ = 0;
        v9[2].__value_.__left_ = v15;
        v15[1].__value_.__left_ = v9;
        v28 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
        if (!v28)
          goto LABEL_38;
LABEL_37:
        p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v28;
        v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v16->__value_.__left_;
        goto LABEL_38;
      }
      v30 = begin_node;
      v12 = (char *)v9;
LABEL_62:
      sub_1B0379E60(v12);
      if (v10)
      {
        for (i = (char *)*((_QWORD *)v10 + 2); i; i = (char *)*((_QWORD *)i + 2))
          v10 = i;
        sub_1B0379E60(v10);
      }
    }
    else
    {
LABEL_60:
      v30 = begin_node;
    }
    if (v30 != p_pair1)
    {
      v35 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
      while (1)
      {
        v36 = operator new(0x50uLL);
        v37 = sub_1B0379D58(v36 + 4, (__int128 *)&v30[4]);
        v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v35->__value_.__left_;
        v39 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
        v40 = &p_stateInputEspressoBuffersShape->__tree_.__pair1_;
        if (v35->__value_.__left_)
          break;
LABEL_90:
        *v36 = 0;
        v36[1] = 0;
        v36[2] = v39;
        v40->__value_.__left_ = v36;
        v53 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
        if (v53)
          goto LABEL_91;
LABEL_92:
        sub_1B02D8180((uint64_t *)p_stateInputEspressoBuffersShape->__tree_.__pair1_.__value_.__left_, v36);
        ++p_stateInputEspressoBuffersShape->__tree_.__pair3_.__value_;
        v54 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v30[1].__value_.__left_;
        if (v54)
        {
          do
          {
            v55 = v54;
            v54 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v54->__value_.__left_;
          }
          while (v54);
        }
        else
        {
          do
          {
            v55 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v30[2].__value_.__left_;
            v31 = v55->__value_.__left_ == v30;
            v30 = v55;
          }
          while (!v31);
        }
        v30 = v55;
        if (v55 == p_pair1)
          return;
      }
      v41 = *((char *)v36 + 55);
      if (v41 >= 0)
        v42 = *((unsigned __int8 *)v36 + 55);
      else
        v42 = v36[5];
      if (v41 >= 0)
        v43 = v37;
      else
        v43 = (const void *)v36[4];
      do
      {
        while (1)
        {
          v39 = v38;
          v46 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v38[4].__value_.__left_;
          v44 = v38 + 4;
          v45 = v46;
          v47 = SHIBYTE(v44[2].__value_.__left_);
          if (v47 >= 0)
            v48 = HIBYTE(v44[2].__value_.__left_);
          else
            v48 = (size_t)v44[1].__value_.__left_;
          if (v47 >= 0)
            v49 = v44;
          else
            v49 = v45;
          if (v48 >= v42)
            v50 = v42;
          else
            v50 = v48;
          v51 = memcmp(v43, v49, v50);
          v52 = v42 < v48;
          if (v51)
            v52 = v51 < 0;
          if (!v52)
            break;
          v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v39->__value_.__left_;
          v40 = v39;
          if (!v39->__value_.__left_)
            goto LABEL_90;
        }
        v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::vector<unsigned long>>, void *>>> *)v39[1].__value_.__left_;
      }
      while (v38);
      v40 = v39 + 1;
      *v36 = 0;
      v36[1] = 0;
      v36[2] = v39;
      v39[1].__value_.__left_ = v36;
      v53 = *(void **)p_stateInputEspressoBuffersShape->__tree_.__begin_node_;
      if (!v53)
        goto LABEL_92;
LABEL_91:
      p_stateInputEspressoBuffersShape->__tree_.__begin_node_ = v53;
      v36 = v40->__value_.__left_;
      goto LABEL_92;
    }
  }
}

- (OS_dispatch_queue)decoderQueue
{
  return self->_decoderQueue;
}

- (void)setDecoderQueue:(id)a3
{
  objc_storeStrong((id *)&self->_decoderQueue, a3);
}

- (CVNLPCaptionDecoderBlock)nextBlock
{
  return self->_nextBlock;
}

- (void)setNextBlock:(id)a3
{
  objc_storeStrong((id *)&self->_nextBlock, a3);
}

- (NSString)metricString
{
  return self->_metricString;
}

- (void)setMetricString:(id)a3
{
  objc_storeStrong((id *)&self->_metricString, a3);
}

- (NSString)metricCopyString
{
  return self->_metricCopyString;
}

- (void)setMetricCopyString:(id)a3
{
  objc_storeStrong((id *)&self->_metricCopyString, a3);
}

- (vector<std::string,)decoderInputNames
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::string, std::allocator<std::string>> *)sub_1B02EB2B0((char *)retstr, (__int128 *)self->_decoderInputNames.__begin_, (__int128 *)self->_decoderInputNames.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_decoderInputNames.__end_- (char *)self->_decoderInputNames.__begin_) >> 3));
}

- (void)setDecoderInputNames:()vector<std:(std::allocator<std::string>> *)a3 :string
{
  vector<std::string, std::allocator<std::string>> *p_decoderInputNames;

  p_decoderInputNames = &self->_decoderInputNames;
  if (p_decoderInputNames != a3)
    sub_1B0336EE0((uint64_t)p_decoderInputNames, (std::string *)a3->__begin_, (std::string *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
}

- (void).cxx_destruct
{
  vector<std::string, std::allocator<std::string>> *p_decoderInputNames;
  void **begin;
  void **end;
  void *v6;

  p_decoderInputNames = &self->_decoderInputNames;
  begin = (void **)self->_decoderInputNames.__begin_;
  if (begin)
  {
    end = (void **)self->_decoderInputNames.__end_;
    v6 = self->_decoderInputNames.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0)
          operator delete(*(end - 3));
        end -= 3;
      }
      while (end != begin);
      v6 = p_decoderInputNames->__begin_;
    }
    p_decoderInputNames->__end_ = begin;
    operator delete(v6);
  }
  sub_1B0379E60((char *)self->_stateInputEspressoBuffersShape.__tree_.__pair1_.__value_.__left_);
  sub_1B03711E4((uint64_t)&self->_stateInputEspressoBuffers, (char *)self->_stateInputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  sub_1B03711E4((uint64_t)&self->_stateOutputEspressoBuffers, (char *)self->_stateOutputEspressoBuffers.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_metricCopyString, 0);
  objc_storeStrong((id *)&self->_metricString, 0);
  objc_storeStrong((id *)&self->_nextBlock, 0);
  objc_storeStrong((id *)&self->_decoderQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 16) = (char *)self + 136;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 19) = (char *)self + 160;
  *((_QWORD *)self + 23) = 0;
  *((_QWORD *)self + 24) = 0;
  *((_QWORD *)self + 22) = 0;
  return self;
}

@end
