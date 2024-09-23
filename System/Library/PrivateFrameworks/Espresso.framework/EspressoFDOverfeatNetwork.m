@implementation EspressoFDOverfeatNetwork

- (shared_ptr<Espresso::fast_pyramid_resizer>)resizerAtIndex:(int)a3
{
  _OWORD *v3;
  __int128 v4;
  unint64_t *v5;
  unint64_t v6;
  shared_ptr<Espresso::fast_pyramid_resizer> result;

  v4 = *((_OWORD *)self->resizers_for_batching.__begin_ + a3);
  *v3 = v4;
  if (*((_QWORD *)&v4 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (fast_pyramid_resizer *)self;
  return result;
}

- (int)resizerCount
{
  return (unint64_t)((char *)self->resizers_for_batching.__end_ - (char *)self->resizers_for_batching.__begin_) >> 4;
}

- (shared_ptr<Espresso::net>)gpu_net:(int)a3
{
  _OWORD *v3;
  __int128 v4;
  unint64_t *v5;
  unint64_t v6;
  shared_ptr<Espresso::net> result;

  v4 = *((_OWORD *)self->gpu_nets.__begin_ + a3);
  *v3 = v4;
  if (*((_QWORD *)&v4 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (shared_ptr<Espresso::net>)cpu_net:(int)a3
{
  _OWORD *v3;
  __int128 v4;
  unint64_t *v5;
  unint64_t v6;
  shared_ptr<Espresso::net> result;

  v4 = *((_OWORD *)self->ecpu_nets.__begin_ + a3);
  *v3 = v4;
  if (*((_QWORD *)&v4 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (net *)self;
  return result;
}

- (EspressoFDOverfeatNetwork)init
{
  EspressoFDOverfeatNetwork *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *cpu_semaphore;
  dispatch_queue_t v5;
  OS_dispatch_queue *cpu_queue_0;
  EspressoFDOverfeatNetwork *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EspressoFDOverfeatNetwork;
  v2 = -[EspressoFDOverfeatNetwork init](&v9, sel_init);
  if (v2)
  {
    v2->colorSpace = CGColorSpaceCreateDeviceRGB();
    v3 = dispatch_semaphore_create(0);
    cpu_semaphore = v2->cpu_semaphore;
    v2->cpu_semaphore = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_queue_create("com.apple.espresso.cpu_queue_0", 0);
    cpu_queue_0 = v2->cpu_queue_0;
    v2->cpu_queue_0 = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)EspressoFDOverfeatNetwork;
  -[EspressoFDOverfeatNetwork dealloc](&v3, sel_dealloc);
}

- (double)getScale:(int)a3
{
  return self->scalesc.__begin_[a3];
}

- (net_strides_configuration)strideConfiguration
{
  retstr->num_layer = self->strideConf.num_layer;
  retstr->kernel_size.__begin_ = 0;
  retstr->kernel_size.__end_ = 0;
  retstr->kernel_size.__end_cap_.__value_ = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->kernel_size.__begin_, self->strideConf.kernel_size.__begin_, (uint64_t)self->strideConf.kernel_size.__end_, self->strideConf.kernel_size.__end_ - self->strideConf.kernel_size.__begin_);
  retstr->stride.__begin_ = 0;
  retstr->stride.__end_ = 0;
  retstr->stride.__end_cap_.__value_ = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->stride.__begin_, self->strideConf.stride.__begin_, (uint64_t)self->strideConf.stride.__end_, self->strideConf.stride.__end_ - self->strideConf.stride.__begin_);
  retstr->pad.__begin_ = 0;
  retstr->pad.__end_ = 0;
  retstr->pad.__end_cap_.__value_ = 0;
  return (net_strides_configuration *)std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&retstr->pad.__begin_, self->strideConf.pad.__begin_, (uint64_t)self->strideConf.pad.__end_, self->strideConf.pad.__end_ - self->strideConf.pad.__begin_);
}

- (void)autoResizeForAspectRatio:(float)a3 useLowPriorityMode:(BOOL)a4 gpuPriority:(unsigned int)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;

  -[EspressoFDOverfeatNetwork basename](self, "basename");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[EspressoFDOverfeatNetwork weights](self, "weights");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EspressoFDOverfeatNetwork scaleConfig](self, "scaleConfig");
  v11 = -[EspressoFDOverfeatNetwork mode](self, "mode");
  v12 = -[EspressoFDOverfeatNetwork cpin](self, "cpin");
  HIDWORD(v14) = a5;
  LOBYTE(v14) = a4;
  *(float *)&v13 = a3;
  -[EspressoFDOverfeatNetwork autoSetupNetBaseName:weights:scaleConfig:setupMode:computePath:autoAspectRatio:forceReset:useLowPriorityMode:gpuPriority:](self, "autoSetupNetBaseName:weights:scaleConfig:setupMode:computePath:autoAspectRatio:forceReset:useLowPriorityMode:gpuPriority:", v15, v9, v10, v11, v12, 0, v13, v14);

}

- (void)reset
{
  uint64_t end;
  void *begin;
  uint64_t i;
  void *v6;

  end = (uint64_t)self->probBlobs.__end_;
  begin = self->probBlobs.__begin_;
  while ((void *)end != begin)
    end = std::shared_ptr<void>::~shared_ptr[abi:ne180100](end - 16);
  self->probBlobs.__end_ = begin;
  v6 = self->boxBlobs.__begin_;
  for (i = (uint64_t)self->boxBlobs.__end_; (void *)i != v6; i = std::shared_ptr<void>::~shared_ptr[abi:ne180100](i - 16))
    ;
  self->boxBlobs.__end_ = v6;
}

- (void)wipeLayersMemory
{
  char *begin;
  char *end;
  Espresso::net *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  char *v12;
  Espresso::net *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;

  begin = (char *)self->gpu_nets.__begin_;
  end = (char *)self->gpu_nets.__end_;
  while (begin != end)
  {
    v5 = *(Espresso::net **)begin;
    v6 = (std::__shared_weak_count *)*((_QWORD *)begin + 1);
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    if (v5)
      Espresso::net::wipe_layers_blobs(v5);
    if (v6)
    {
      v9 = (unint64_t *)&v6->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v6->__on_zero_shared)(v6, a2);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    begin += 16;
  }
  v11 = (char *)self->ecpu_nets.__begin_;
  v12 = (char *)self->ecpu_nets.__end_;
  while (v11 != v12)
  {
    v13 = *(Espresso::net **)v11;
    v14 = (std::__shared_weak_count *)*((_QWORD *)v11 + 1);
    if (v14)
    {
      v15 = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    if (v13)
      Espresso::net::wipe_layers_blobs(v13);
    if (v14)
    {
      v17 = (unint64_t *)&v14->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *, SEL))v14->__on_zero_shared)(v14, a2);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v11 += 16;
  }
}

- (void)autoSetupNetBaseName:(id)a3 weights:(id)a4 scaleConfig:(int)a5 setupMode:(int)a6 computePath:(int)a7 autoAspectRatio:(float)a8 forceReset:(BOOL)a9 useLowPriorityMode:(BOOL)a10 gpuPriority:(unsigned int)a11
{
  _BOOL4 v11;
  uint64_t v13;
  uint64_t v14;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  _BOOL4 v23;
  char v24;
  id v25;
  _DWORD *v26;
  _DWORD *v27;
  unsigned int v28;
  unint64_t v29;
  int v30;
  int v31;
  float v32;
  _DWORD *v33;
  _DWORD *v34;
  _DWORD *v35;
  _DWORD *v36;
  _DWORD *v37;
  _DWORD *v38;
  _DWORD *v39;
  _DWORD *v40;
  unint64_t v41;
  _DWORD *v42;
  _DWORD *v44;
  void *v45;
  unint64_t v46;
  _DWORD *v47;
  unint64_t v49;
  uint64_t i;
  void *begin;
  uint64_t j;
  void *v53;
  abstract_context *ptr;
  void *v55;
  id v56;
  _QWORD *v57;
  __shared_weak_count *cntrl;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  int *v65;
  int *v66;
  vector<int, std::allocator<int>> *p_pad;
  int *v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t tile_w_1;
  float tile_h_1;
  float v74;
  uint64_t v75;
  vector<std::pair<unsigned long long, unsigned long long>, std::allocator<std::pair<unsigned long long, unsigned long long>>> *p_net_scales;
  unint64_t v77;
  unint64_t v78;
  char *value;
  char *end;
  void *v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  BOOL v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t *v97;
  void *v98;
  unint64_t v99;
  unint64_t v100;
  char *v101;
  char *v102;
  void *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t *v110;
  void *v111;
  __int128 *v112;
  __int128 *v113;
  int8x16_t v114;
  uint64x2_t *v115;
  void *v116;
  int *v117;
  void *v118;
  uint64_t v119;
  int v120;
  int *v121;
  int v122;
  uint64_t k;
  void *v124;
  int v125;
  std::__shared_weak_count *v126;
  unint64_t *p_shared_owners;
  char *v128;
  char *v129;
  unint64_t v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  unint64_t *v139;
  unint64_t v140;
  char *v141;
  __int128 v142;
  int64x2_t v143;
  void *v144;
  uint64_t v145;
  void *v146;
  unint64_t *v147;
  unint64_t v148;
  int64x2_t *v149;
  unint64_t v150;
  int v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t *v154;
  Espresso::net **v155;
  std::__shared_weak_count *v156;
  uint64_t v157;
  unint64_t *v158;
  unint64_t v159;
  unint64_t *v160;
  unint64_t v161;
  float v162;
  unint64_t *v163;
  unint64_t v164;
  unint64_t v165;
  int v166;
  std::string *v167;
  std::string::size_type v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  int v172;
  std::string *v173;
  std::string::size_type v174;
  char v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  int v179;
  std::__shared_weak_count *v180;
  unint64_t *v181;
  unint64_t v182;
  std::__shared_weak_count *v183;
  unint64_t *v184;
  unint64_t v185;
  __shared_weak_count *v186;
  unint64_t *v187;
  unint64_t v188;
  std::__shared_weak_count *v189;
  unint64_t *v190;
  unint64_t v191;
  uint64_t v192;
  Espresso::net *v193;
  unint64_t *v194;
  unint64_t v195;
  unint64_t *v196;
  unint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t *v200;
  std::__shared_weak_count **v201;
  std::__shared_weak_count *v202;
  uint64_t v203;
  unint64_t *v204;
  unint64_t v205;
  unint64_t *v206;
  unint64_t v207;
  Espresso *v208;
  std::__shared_weak_count *v209;
  unint64_t *v210;
  unint64_t v211;
  unint64_t *v212;
  unint64_t v213;
  vector<std::shared_ptr<Espresso::net>, std::allocator<std::shared_ptr<Espresso::net>>> *v214;
  id v215;
  std::__shared_weak_count *size;
  unint64_t *v217;
  unint64_t v218;
  __shared_weak_count *v219;
  unint64_t *v220;
  unint64_t v221;
  std::__shared_weak_count *v222;
  unint64_t *v223;
  unint64_t v224;
  double v225;
  std::string::size_type *v226;
  std::string::size_type *m;
  std::string::size_type v228;
  std::__shared_weak_count *v229;
  unint64_t *v230;
  unint64_t v231;
  _QWORD *v232;
  unint64_t *v233;
  unint64_t v234;
  void *v235;
  int64_t v236;
  unint64_t v237;
  uint64_t v238;
  unint64_t v239;
  char *v240;
  uint64_t v241;
  char *v242;
  std::string::size_type v243;
  unint64_t *v244;
  unint64_t v245;
  _QWORD *v246;
  _QWORD *v247;
  char *v248;
  __int128 v249;
  int64x2_t v250;
  char *v251;
  unint64_t *v252;
  unint64_t v253;
  std::__shared_weak_count *v254;
  unint64_t *v255;
  unint64_t v256;
  double v257;
  unint64_t v258;
  Espresso::net **v259;
  Espresso::net **v260;
  std::__shared_weak_count *v261;
  unint64_t *v262;
  unint64_t v263;
  std::__shared_weak_count *v264;
  unint64_t *v265;
  unint64_t v266;
  std::__shared_weak_count *v267;
  unint64_t *v268;
  unint64_t v269;
  uint64_t v270;
  vector<std::pair<unsigned long long, unsigned long long>, std::allocator<std::pair<unsigned long long, unsigned long long>>> *v271;
  unint64_t v272;
  unint64_t v273;
  char *v274;
  char *v275;
  char *v276;
  _BYTE *v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  unint64_t v281;
  uint64_t v282;
  unint64_t *v283;
  void *v284;
  unint64_t v285;
  unint64_t v286;
  char *v287;
  uint64_t v288;
  unint64_t v289;
  uint64_t v290;
  unint64_t v291;
  uint64_t v292;
  unint64_t *v293;
  uint64_t *p_context_metal;
  uint64_t *p_context_cpu;
  id v296;
  int v297;
  id v299;
  char *p_scalesc;
  int v301;
  unsigned int v302;
  vector<std::shared_ptr<Espresso::net>, std::allocator<std::shared_ptr<Espresso::net>>> *p_ecpu_nets;
  vector<std::shared_ptr<Espresso::net>, std::allocator<std::shared_ptr<Espresso::net>>> *p_gpu_nets;
  char v305[16];
  std::__shared_weak_count *v306;
  Espresso *v307;
  std::__shared_weak_count *v308;
  uint64_t v309[2];
  abstract_context *v310;
  __shared_weak_count *v311;
  Espresso::net *v312[2];
  uint64_t v313[2];
  abstract_context *v314;
  __shared_weak_count *v315;
  void *v316[2];
  char *v317;
  char **v318;
  char *v319;
  uint64_t v320;
  std::string v321;
  __int128 v322;
  void *__p[2];
  char v324;
  abstract_context *v325;
  __shared_weak_count *v326;
  void *v327;
  _BYTE *v328;
  char *v329;
  void *v330;
  _BYTE *v331;
  char *v332;
  void *v333;
  char v334;
  _BYTE v335[15];
  char v336;
  _BYTE __src[56];
  __int128 v338;
  int *v339;
  __int128 v340;

  v11 = a9;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  *((_QWORD *)&v340 + 1) = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v296 = a4;
  -[EspressoFDOverfeatNetwork reset](self, "reset", v17);
  -[EspressoFDOverfeatNetwork basename](self, "basename");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v17);

  if (!v296)
  {
    -[EspressoFDOverfeatNetwork weights](self, "weights");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      if (v19)
        goto LABEL_5;
LABEL_10:
      v24 = 0;
      v23 = 0;
      goto LABEL_11;
    }
  }
  if (!v19)
    goto LABEL_10;
  -[EspressoFDOverfeatNetwork weights](self, "weights");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", v296);

  if ((v22 & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v23 = -[EspressoFDOverfeatNetwork mode](self, "mode") == (_DWORD)v13
     && -[EspressoFDOverfeatNetwork cpin](self, "cpin") == a7;
  v24 = 1;
LABEL_11:
  -[EspressoFDOverfeatNetwork setBasename:](self, "setBasename:", v17);
  -[EspressoFDOverfeatNetwork setWeights:](self, "setWeights:", v296);
  -[EspressoFDOverfeatNetwork setScaleConfig:](self, "setScaleConfig:", v14);
  -[EspressoFDOverfeatNetwork setMode:](self, "setMode:", v13);
  -[EspressoFDOverfeatNetwork setCpin:](self, "setCpin:", a7);
  v25 = objc_retainAutorelease(v17);
  std::string::basic_string[abi:ne180100]<0>(&v333, (char *)objc_msgSend(v25, "UTF8String"));
  v26 = operator new(0x14uLL);
  v331 = v26 + 5;
  v332 = (char *)(v26 + 5);
  v26[4] = 1;
  *(_OWORD *)v26 = xmmword_191ACE738;
  v330 = v26;
  v27 = operator new(0x14uLL);
  v328 = v27 + 5;
  v329 = (char *)(v27 + 5);
  v27[4] = 0;
  *(_OWORD *)v27 = xmmword_191ACE894;
  v327 = v27;
  *(_OWORD *)__src = xmmword_191ACE710;
  *(_OWORD *)&__src[16] = unk_191ACE720;
  *(_QWORD *)&__src[32] = 0x4000000000000000;
  p_scalesc = (char *)&self->scalesc;
  std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>((char *)&self->scalesc, __src, (uint64_t)&__src[40]);
  HIDWORD(v29) = v14;
  LODWORD(v29) = v14 - 2;
  v28 = v29 >> 1;
  if (v28 <= 7 && ((1 << v28) & 0x8B) != 0)
  {
    switch((int)v13)
    {
      case 0:
        memset(__src, 0, 20);
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191AD0DEC;
        *(_DWORD *)&__src[16] = 1;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 1:
      case 7:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_191ACE818;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE82C;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 2:
        *(_DWORD *)&__src[16] = 0;
        *(_OWORD *)__src = xmmword_191ACE760;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE760;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 5:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_191ACE738;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE894;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        break;
      case 6:
        *(_DWORD *)&__src[16] = 1;
        *(_OWORD *)__src = xmmword_191ACE74C;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE760;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        break;
      default:
        break;
    }
    self->_maxScale = 16.0;
    switch(v28)
    {
      case 0u:
        v33 = v327;
        *((_DWORD *)v327 + 4) = 0;
        v34 = v330;
        *((_DWORD *)v330 + 4) = 0;
        v33[3] = 0;
        v34[3] = 0;
        v33[2] = 0;
        if ((_DWORD)v13 == 7 || (_DWORD)v13 == 1)
        {
          *(_DWORD *)&__src[16] = 0;
          *(_OWORD *)__src = xmmword_191ACE774;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
          *(_OWORD *)__src = xmmword_191ACE7C4;
          *(_DWORD *)&__src[16] = 0;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        }
        break;
      case 1u:
        v35 = v327;
        *((_DWORD *)v327 + 4) = 0;
        v36 = v330;
        *((_DWORD *)v330 + 4) = 0;
        v35[3] = 0;
        v36[3] = 0;
        if ((_DWORD)v13 == 7 || (_DWORD)v13 == 1)
        {
          *(_DWORD *)&__src[16] = 0;
          *(_OWORD *)__src = xmmword_191ACE7B0;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
          *(_OWORD *)__src = xmmword_191ACE7C4;
          *(_DWORD *)&__src[16] = 0;
          std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        }
        break;
      case 3u:
        v37 = v327;
        *((_DWORD *)v327 + 4) = 0;
        v38 = v330;
        *((_DWORD *)v330 + 4) = 0;
        if ((_DWORD)v13 == 7 || (_DWORD)v13 == 1)
        {
          v38[2] = 1;
          v37[2] = 0;
        }
        break;
      case 4u:
        goto LABEL_28;
      default:
        break;
    }
    if ((_DWORD)v14 != 9)
    {
      if ((_DWORD)v14 == 20)
        goto LABEL_37;
      v30 = 0;
      goto LABEL_39;
    }
LABEL_45:
    *(_QWORD *)&__src[32] = 0x4000000000000000;
    *(_OWORD *)__src = xmmword_191ACE858;
    *(_OWORD *)&__src[16] = unk_191ACE868;
    std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
    *(_OWORD *)__src = xmmword_191ACE840;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_191ACE894;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
    v31 = 0;
    v30 = 0;
    self->_maxScale = 10.0;
    v301 = 1;
    goto LABEL_46;
  }
  *(_DWORD *)&__src[16] = 0;
  *(_OWORD *)__src = xmmword_191ACE880;
  std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
  *(_OWORD *)__src = xmmword_191ACE894;
  *(_DWORD *)&__src[16] = 0;
  std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
  *(_OWORD *)__src = xmmword_191ACE788;
  *(_OWORD *)&__src[16] = unk_191ACE798;
  *(_QWORD *)&__src[32] = 0x4000000000000000;
  std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
  v30 = 0;
  self->_maxScale = 12.0;
  if ((int)v14 > 9)
  {
    switch((_DWORD)v14)
    {
      case 0xA:
LABEL_28:
        *(_QWORD *)&__src[32] = 0x4000000000000000;
        *(_OWORD *)__src = xmmword_191ACE7F0;
        *(_OWORD *)&__src[16] = unk_191ACE800;
        std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
        *(_OWORD *)__src = xmmword_191ACE7D8;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE82C;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        self->_maxScale = 10.0;
        v30 = 1;
        break;
      case 0x14:
LABEL_37:
        *(_QWORD *)&__src[32] = 0x4000000000000000;
        *(_OWORD *)__src = xmmword_191ACE7F0;
        *(_OWORD *)&__src[16] = unk_191ACE800;
        std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
        *(_OWORD *)__src = xmmword_191ACE818;
        *(_DWORD *)&__src[16] = 1;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
        *(_OWORD *)__src = xmmword_191ACE82C;
        *(_DWORD *)&__src[16] = 0;
        std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
        v31 = 0;
        v30 = 0;
        v301 = 0;
        v32 = 20.0;
        goto LABEL_41;
      case 0x18:
        v30 = 0;
        v301 = 0;
        v31 = 1;
        *((_DWORD *)v330 + 4) = 1;
        *((_DWORD *)v327 + 4) = 0;
        v32 = 24.0;
LABEL_41:
        self->_maxScale = v32;
        goto LABEL_46;
    }
    goto LABEL_39;
  }
  if ((_DWORD)v14 == 6)
  {
    *(_DWORD *)&__src[16] = 0;
    *(_OWORD *)__src = xmmword_191ACE7B0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_191ACE7C4;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
    v31 = 0;
    v30 = 0;
    v301 = 0;
    v32 = 6.0;
    goto LABEL_41;
  }
  if ((_DWORD)v14 == 9)
    goto LABEL_45;
LABEL_39:
  if ((_DWORD)v14 == 18)
  {
    *(_QWORD *)&__src[32] = 0x4000000000000000;
    *(_OWORD *)__src = xmmword_191ACE858;
    *(_OWORD *)&__src[16] = unk_191ACE868;
    std::vector<double>::__assign_with_size[abi:ne180100]<double const*,double const*>(p_scalesc, __src, (uint64_t)&__src[40]);
    *(_OWORD *)__src = xmmword_191ACE880;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v330, __src, (uint64_t)&__src[20], 5uLL);
    *(_OWORD *)__src = xmmword_191ACE894;
    *(_DWORD *)&__src[16] = 0;
    std::vector<int>::__assign_with_size[abi:ne180100]<int const*,int const*>((char *)&v327, __src, (uint64_t)&__src[20], 5uLL);
    v31 = 0;
    v301 = 0;
    v32 = 18.0;
    goto LABEL_41;
  }
  v31 = 0;
  v301 = 0;
LABEL_46:
  if ((_DWORD)v13 == 8)
  {
    v45 = v327;
    v40 = v330;
    if (v328 != v327)
    {
      v46 = (v328 - (_BYTE *)v327) >> 2;
      if (v46 <= 1)
        v46 = 1;
      v47 = v327;
      do
      {
        if (*v47++)
          *v40 = 1;
        ++v40;
        --v46;
      }
      while (v46);
      v40 = v330;
    }
    v44 = v331;
  }
  else
  {
    if ((_DWORD)v13)
      goto LABEL_69;
    v39 = v327;
    v40 = v330;
    if (v328 != v327)
    {
      v41 = (v328 - (_BYTE *)v327) >> 2;
      if (v41 <= 1)
        v41 = 1;
      v42 = v330;
      do
      {
        if (*v42++)
          *v39 = 1;
        ++v39;
        --v41;
      }
      while (v41);
    }
    v44 = v331;
    v45 = v40;
  }
  if (v44 != v40)
  {
    v49 = v44 - v40;
    if (v49 <= 1)
      v49 = 1;
    bzero(v45, 4 * v49);
  }
LABEL_69:
  if (!v23 || v11)
  {
    begin = self->ecpu_nets.__begin_;
    for (i = (uint64_t)self->ecpu_nets.__end_;
          (void *)i != begin;
    self->ecpu_nets.__end_ = begin;
    v53 = self->gpu_nets.__begin_;
    for (j = (uint64_t)self->gpu_nets.__end_; (void *)j != v53; j = std::shared_ptr<void>::~shared_ptr[abi:ne180100](j - 16))
      ;
    self->gpu_nets.__end_ = v53;
  }
  self->_maxScale = (float)v14;
  p_ecpu_nets = &self->ecpu_nets;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((int64x2_t *)&self->ecpu_nets, (v328 - (_BYTE *)v327) >> 2);
  p_gpu_nets = &self->gpu_nets;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((int64x2_t *)&self->gpu_nets, (v331 - (_BYTE *)v330) >> 2);
  p_context_metal = (uint64_t *)&self->_context_metal;
  ptr = self->_context_metal.__ptr_;
  if (ptr)
    goto LABEL_79;
  if (self->_mode)
  {
    LODWORD(v316[0]) = 20000;
    Espresso::create_context((int *)v316, __src);
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)p_context_metal, (__int128 *)__src);
    v82 = *(std::__shared_weak_count **)&__src[8];
    if (*(_QWORD *)&__src[8])
    {
      v83 = (unint64_t *)(*(_QWORD *)&__src[8] + 8);
      do
        v84 = __ldaxr(v83);
      while (__stlxr(v84 - 1, v83));
      if (!v84)
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
    }
    ptr = (abstract_context *)*p_context_metal;
    if (*p_context_metal)
    {
LABEL_79:
      (*(void (**)(void *, BOOL, _QWORD, float))(*(_QWORD *)v55 + 16))(v55, a10, a11, 4.0);
    }
  }
  p_context_cpu = (uint64_t *)&self->_context_cpu;
  if (!self->_context_cpu.__ptr_)
  {
    LODWORD(v316[0]) = 0;
    Espresso::create_context((int *)v316, __src);
    std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)p_context_cpu, (__int128 *)__src);
    v85 = *(std::__shared_weak_count **)&__src[8];
    if (*(_QWORD *)&__src[8])
    {
      v86 = (unint64_t *)(*(_QWORD *)&__src[8] + 8);
      do
        v87 = __ldaxr(v86);
      while (__stlxr(v87 - 1, v86));
      if (!v87)
      {
        ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
        std::__shared_weak_count::__release_weak(v85);
      }
    }
  }
  v299 = v25;
  if ((v24 & 1) == 0)
  {
    v56 = objc_retainAutorelease(v299);
    v57 = std::string::basic_string[abi:ne180100]<0>(__src, (char *)objc_msgSend(v56, "UTF8String"));
    Espresso::load_network((uint64_t)v57, p_context_cpu, 0, 0, (uint64_t *)v316);
    if ((__src[23] & 0x80000000) != 0)
      operator delete(*(void **)__src);
    cntrl = self->_context_cpu.__cntrl_;
    v325 = self->_context_cpu.__ptr_;
    v326 = cntrl;
    if (cntrl)
    {
      v59 = (unint64_t *)((char *)cntrl + 8);
      do
        v60 = __ldxr(v59);
      while (__stxr(v60 + 1, v59));
    }
    -[EspressoFDOverfeatNetwork retryLoadingCaffeNet:name:weights:context:cp:](self, "retryLoadingCaffeNet:name:weights:context:cp:", v316, v56, v296, &v325, 0);
    v61 = (std::__shared_weak_count *)v326;
    if (v326)
    {
      v62 = (unint64_t *)((char *)v326 + 8);
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    v64 = v316[0];
    std::string::basic_string[abi:ne180100]<0>(__p, "prob_student");
    Espresso::net::get_stride_configuration((uint64_t)v64, (unsigned __int8 *)__p, (uint64_t)__src);
    v65 = self->strideConf.kernel_size.__begin_;
    self->strideConf.num_layer = *(_DWORD *)__src;
    if (v65)
    {
      self->strideConf.kernel_size.__end_ = v65;
      operator delete(v65);
      self->strideConf.kernel_size.__begin_ = 0;
      self->strideConf.kernel_size.__end_ = 0;
      self->strideConf.kernel_size.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->strideConf.kernel_size.__begin_ = *(_OWORD *)&__src[8];
    self->strideConf.kernel_size.__end_cap_.__value_ = *(int **)&__src[24];
    memset(&__src[8], 0, 24);
    v66 = self->strideConf.stride.__begin_;
    if (v66)
    {
      self->strideConf.stride.__end_ = v66;
      operator delete(v66);
      self->strideConf.stride.__begin_ = 0;
      self->strideConf.stride.__end_ = 0;
      self->strideConf.stride.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&self->strideConf.stride.__begin_ = *(_OWORD *)&__src[32];
    self->strideConf.stride.__end_cap_.__value_ = *(int **)&__src[48];
    memset(&__src[32], 0, 24);
    p_pad = &self->strideConf.pad;
    v68 = self->strideConf.pad.__begin_;
    if (v68)
    {
      self->strideConf.pad.__end_ = v68;
      operator delete(v68);
      p_pad->__begin_ = 0;
      self->strideConf.pad.__end_ = 0;
      self->strideConf.pad.__end_cap_.__value_ = 0;
      v68 = *(int **)&__src[32];
    }
    *(_OWORD *)&p_pad->__begin_ = v338;
    self->strideConf.pad.__end_cap_.__value_ = v339;
    v339 = 0;
    v338 = 0uLL;
    if (v68)
    {
      *(_QWORD *)&__src[40] = v68;
      operator delete(v68);
    }
    if (*(_QWORD *)&__src[8])
    {
      *(_QWORD *)&__src[16] = *(_QWORD *)&__src[8];
      operator delete(*(void **)&__src[8]);
    }
    if (v324 < 0)
      operator delete(__p[0]);
    Espresso::abstract_blob_container::shape(__src, **(_QWORD **)(**((_QWORD **)v316[0] + 4) + 80));
    self->tile_w_1 = *(_DWORD *)__src;
    if (*(_QWORD *)&__src[40])
    {
      *(_QWORD *)&__src[48] = *(_QWORD *)&__src[40];
      operator delete(*(void **)&__src[40]);
    }
    Espresso::abstract_blob_container::shape(__src, **(_QWORD **)(**((_QWORD **)v316[0] + 4) + 80));
    self->tile_h_1 = *(_DWORD *)&__src[4];
    if (*(_QWORD *)&__src[40])
    {
      *(_QWORD *)&__src[48] = *(_QWORD *)&__src[40];
      operator delete(*(void **)&__src[40]);
    }
    v69 = (std::__shared_weak_count *)v316[1];
    if (v316[1])
    {
      v70 = (unint64_t *)((char *)v316[1] + 8);
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
  }
  tile_w_1 = self->tile_w_1;
  if (a8 <= 1.0)
  {
    v74 = (float)(int)tile_w_1;
    tile_h_1 = (float)(int)tile_w_1 * a8;
  }
  else
  {
    tile_h_1 = (float)self->tile_h_1;
    v74 = tile_h_1 / a8;
  }
  if (v14 <= 0x18 && ((1 << v14) & 0x1001040) != 0)
  {
    v75 = self->tile_h_1;
    *(_QWORD *)__src = self->tile_w_1;
    *(_QWORD *)&__src[8] = v75;
    *(_QWORD *)&__src[16] = (unint64_t)(float)(v74 * 3.0);
    *(_QWORD *)&__src[24] = (unint64_t)(float)(tile_h_1 * 3.0);
    *(_QWORD *)&__src[32] = (unint64_t)(float)(v74 * 6.0);
    *(_QWORD *)&__src[40] = (unint64_t)(float)(tile_h_1 * 6.0);
    p_net_scales = &self->net_scales;
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (__int128 *)__src, (__int128 *)&__src[48], 3uLL);
    if ((_DWORD)v14 == 24 || (_DWORD)v14 == 12)
    {
      v77 = (unint64_t)(float)(v74 * 12.0);
      v78 = (unint64_t)(float)(tile_h_1 * 12.0);
      end = (char *)self->net_scales.__end_;
      value = (char *)self->net_scales.__end_cap_.__value_;
      if (end >= value)
      {
        v89 = (char *)p_net_scales->__begin_;
        v90 = (end - (char *)p_net_scales->__begin_) >> 4;
        v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 60)
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v92 = value - v89;
        if (v92 >> 3 > v91)
          v91 = v92 >> 3;
        v93 = (unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0;
        v94 = 0xFFFFFFFFFFFFFFFLL;
        if (!v93)
          v94 = v91;
        if (v94)
        {
          v94 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v94);
          v89 = (char *)self->net_scales.__begin_;
          end = (char *)self->net_scales.__end_;
        }
        else
        {
          v95 = 0;
        }
        v97 = (unint64_t *)(v94 + 16 * v90);
        v98 = (void *)(v94 + 16 * v95);
        *v97 = v77;
        v97[1] = v78;
        v81 = v97 + 2;
        if (end != v89)
        {
          do
          {
            *((_OWORD *)v97 - 1) = *((_OWORD *)end - 1);
            v97 -= 2;
            end -= 16;
          }
          while (end != v89);
          v89 = (char *)p_net_scales->__begin_;
        }
        self->net_scales.__begin_ = v97;
        self->net_scales.__end_ = v81;
        self->net_scales.__end_cap_.__value_ = v98;
        if (v89)
          operator delete(v89);
      }
      else
      {
        *(_QWORD *)end = v77;
        *((_QWORD *)end + 1) = v78;
        v81 = end + 16;
      }
      self->net_scales.__end_ = v81;
    }
    if (!v31)
      goto LABEL_171;
    v99 = (unint64_t)(float)(v74 * 24.0);
    v100 = (unint64_t)(float)(tile_h_1 * 24.0);
    v102 = (char *)self->net_scales.__end_;
    v101 = (char *)self->net_scales.__end_cap_.__value_;
    if (v102 < v101)
    {
      *(_QWORD *)v102 = v99;
      *((_QWORD *)v102 + 1) = v100;
      v103 = v102 + 16;
LABEL_170:
      self->net_scales.__end_ = v103;
      goto LABEL_171;
    }
    v104 = (char *)p_net_scales->__begin_;
    v105 = (v102 - (char *)p_net_scales->__begin_) >> 4;
    v106 = v105 + 1;
    if ((unint64_t)(v105 + 1) >> 60)
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    v107 = v101 - v104;
    if (v107 >> 3 > v106)
      v106 = v107 >> 3;
    v93 = (unint64_t)v107 >= 0x7FFFFFFFFFFFFFF0;
    v108 = 0xFFFFFFFFFFFFFFFLL;
    if (!v93)
      v108 = v106;
    if (v108)
    {
      v108 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v108);
      v104 = (char *)self->net_scales.__begin_;
      v102 = (char *)self->net_scales.__end_;
    }
    else
    {
      v109 = 0;
    }
    v110 = (unint64_t *)(v108 + 16 * v105);
    v111 = (void *)(v108 + 16 * v109);
    *v110 = v99;
    v110[1] = v100;
    v103 = v110 + 2;
    if (v102 != v104)
    {
      do
      {
        *((_OWORD *)v110 - 1) = *((_OWORD *)v102 - 1);
        v110 -= 2;
        v102 -= 16;
      }
      while (v102 != v104);
      v104 = (char *)p_net_scales->__begin_;
    }
    self->net_scales.__begin_ = v110;
    goto LABEL_168;
  }
  if (v30)
  {
    v88 = self->tile_h_1;
    *(_QWORD *)__src = self->tile_w_1;
    *(_QWORD *)&__src[8] = v88;
    *(_QWORD *)&__src[16] = 2 * tile_w_1;
    *(_QWORD *)&__src[24] = 2 * v88;
    *(_QWORD *)&__src[32] = (unint64_t)(float)(v74 * 5.0);
    *(_QWORD *)&__src[40] = (unint64_t)(float)(tile_h_1 * 5.0);
    *(_QWORD *)&__src[48] = (unint64_t)(float)(v74 * 10.0);
    *(_QWORD *)&v338 = (unint64_t)(float)(tile_h_1 * 10.0);
    *((_QWORD *)&v338 + 1) = (unint64_t)(float)(v74 * 20.0);
    v339 = (int *)(float)(tile_h_1 * 20.0);
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (__int128 *)__src, &v340, 5uLL);
  }
  else
  {
    if (!v301)
    {
      v270 = self->tile_h_1;
      *(_QWORD *)__src = self->tile_w_1;
      *(_QWORD *)&__src[8] = v270;
      *(_QWORD *)&__src[16] = 2 * (int)tile_w_1;
      *(_QWORD *)&__src[24] = 2 * v270;
      *(_QWORD *)&__src[32] = vcvts_n_u32_f32(v74, 2uLL);
      *(_QWORD *)&__src[40] = vcvts_n_u32_f32(tile_h_1, 2uLL);
      v271 = &self->net_scales;
      std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (__int128 *)__src, (__int128 *)&__src[48], 3uLL);
      if ((_DWORD)v14 != 16 && (_DWORD)v14 != 8)
        goto LABEL_171;
      v272 = vcvts_n_u32_f32(v74, 3uLL);
      v273 = vcvts_n_u32_f32(tile_h_1, 3uLL);
      v275 = (char *)self->net_scales.__end_;
      v274 = (char *)self->net_scales.__end_cap_.__value_;
      if (v275 >= v274)
      {
        v277 = v271->__begin_;
        v278 = (v275 - (char *)v271->__begin_) >> 4;
        v279 = v278 + 1;
        if ((unint64_t)(v278 + 1) >> 60)
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v280 = v274 - v277;
        if (v280 >> 3 > v279)
          v279 = v280 >> 3;
        v93 = (unint64_t)v280 >= 0x7FFFFFFFFFFFFFF0;
        v281 = 0xFFFFFFFFFFFFFFFLL;
        if (!v93)
          v281 = v279;
        if (v281)
        {
          v281 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v281);
          v277 = self->net_scales.__begin_;
          v275 = (char *)self->net_scales.__end_;
        }
        else
        {
          v282 = 0;
        }
        v283 = (unint64_t *)(v281 + 16 * v278);
        v284 = (void *)(v281 + 16 * v282);
        *v283 = v272;
        v283[1] = v273;
        v276 = (char *)(v283 + 2);
        if (v275 != v277)
        {
          do
          {
            *((_OWORD *)v283 - 1) = *((_OWORD *)v275 - 1);
            v283 -= 2;
            v275 -= 16;
          }
          while (v275 != v277);
          v277 = v271->__begin_;
        }
        self->net_scales.__begin_ = v283;
        self->net_scales.__end_ = v276;
        self->net_scales.__end_cap_.__value_ = v284;
        if (v277)
          operator delete(v277);
      }
      else
      {
        *(_QWORD *)v275 = v272;
        *((_QWORD *)v275 + 1) = v273;
        v276 = v275 + 16;
      }
      self->net_scales.__end_ = v276;
      if ((_DWORD)v14 != 16)
        goto LABEL_171;
      v285 = vcvts_n_u32_f32(v74, 4uLL);
      v286 = vcvts_n_u32_f32(tile_h_1, 4uLL);
      v287 = (char *)self->net_scales.__end_cap_.__value_;
      if (v276 < v287)
      {
        *(_QWORD *)v276 = v285;
        *((_QWORD *)v276 + 1) = v286;
        v103 = v276 + 16;
        goto LABEL_170;
      }
      v104 = (char *)v271->__begin_;
      v288 = (v276 - (char *)v271->__begin_) >> 4;
      v289 = v288 + 1;
      if ((unint64_t)(v288 + 1) >> 60)
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      v290 = v287 - v104;
      if (v290 >> 3 > v289)
        v289 = v290 >> 3;
      v93 = (unint64_t)v290 >= 0x7FFFFFFFFFFFFFF0;
      v291 = 0xFFFFFFFFFFFFFFFLL;
      if (!v93)
        v291 = v289;
      if (v291)
      {
        v291 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v291);
        v104 = (char *)self->net_scales.__begin_;
        v276 = (char *)self->net_scales.__end_;
      }
      else
      {
        v292 = 0;
      }
      v293 = (unint64_t *)(v291 + 16 * v288);
      v111 = (void *)(v291 + 16 * v292);
      *v293 = v285;
      v293[1] = v286;
      v103 = v293 + 2;
      if (v276 != v104)
      {
        do
        {
          *((_OWORD *)v293 - 1) = *((_OWORD *)v276 - 1);
          v293 -= 2;
          v276 -= 16;
        }
        while (v276 != v104);
        v104 = (char *)v271->__begin_;
      }
      self->net_scales.__begin_ = v293;
LABEL_168:
      self->net_scales.__end_ = v103;
      self->net_scales.__end_cap_.__value_ = v111;
      if (v104)
        operator delete(v104);
      goto LABEL_170;
    }
    v96 = self->tile_h_1;
    *(_QWORD *)__src = self->tile_w_1;
    *(_QWORD *)&__src[8] = v96;
    *(_QWORD *)&__src[16] = (unint64_t)(float)(v74 * 3.0);
    *(_QWORD *)&__src[24] = (unint64_t)(float)(tile_h_1 * 3.0);
    *(_QWORD *)&__src[32] = (unint64_t)(float)(v74 * 9.0);
    *(_QWORD *)&__src[40] = (unint64_t)(float)(tile_h_1 * 9.0);
    *(_QWORD *)&__src[48] = (unint64_t)(float)(v74 * 18.0);
    *(_QWORD *)&v338 = (unint64_t)(float)(tile_h_1 * 18.0);
    std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long> const*,std::pair<unsigned long long,unsigned long long> const*>(&self->net_scales.__begin_, (__int128 *)__src, (__int128 *)((char *)&v338 + 8), 4uLL);
  }
LABEL_171:
  v112 = (__int128 *)self->net_scales.__begin_;
  v113 = (__int128 *)self->net_scales.__end_;
  if (v112 != v113)
  {
    v114 = (int8x16_t)vdupq_n_s64(0x1CuLL);
    v115 = (uint64x2_t *)self->net_scales.__begin_;
    do
    {
      *(int8x16_t *)v115 = vbslq_s8((int8x16_t)vcgtq_u64(*v115, (uint64x2_t)v114), *(int8x16_t *)v115, v114);
      ++v115;
    }
    while (v115 != (uint64x2_t *)v113);
  }
  std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>(&self->full_scales.__begin_, v112, v113, v113 - v112);
  -[EspressoFDOverfeatNetwork strideConfiguration](self, "strideConfiguration");
  v116 = *(void **)&__src[8];
  memset(&__src[8], 0, 24);
  if ((_QWORD)v338)
  {
    *((_QWORD *)&v338 + 1) = v338;
    operator delete((void *)v338);
  }
  if (*(_QWORD *)&__src[32])
  {
    *(_QWORD *)&__src[40] = *(_QWORD *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(_QWORD *)&__src[8])
  {
    *(_QWORD *)&__src[16] = *(_QWORD *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  -[EspressoFDOverfeatNetwork strideConfiguration](self, "strideConfiguration");
  v117 = *(int **)&__src[32];
  memset(&__src[32], 0, 24);
  if ((_QWORD)v338)
  {
    *((_QWORD *)&v338 + 1) = v338;
    operator delete((void *)v338);
    if (*(_QWORD *)&__src[32])
    {
      *(_QWORD *)&__src[40] = *(_QWORD *)&__src[32];
      operator delete(*(void **)&__src[32]);
    }
  }
  if (*(_QWORD *)&__src[8])
  {
    *(_QWORD *)&__src[16] = *(_QWORD *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  -[EspressoFDOverfeatNetwork strideConfiguration](self, "strideConfiguration");
  v339 = 0;
  v118 = (void *)v338;
  v338 = 0uLL;
  if (*(_QWORD *)&__src[32])
  {
    *(_QWORD *)&__src[40] = *(_QWORD *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(_QWORD *)&__src[8])
  {
    *(_QWORD *)&__src[16] = *(_QWORD *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  -[EspressoFDOverfeatNetwork strideConfiguration](self, "strideConfiguration");
  v119 = *(unsigned int *)__src;
  if ((_QWORD)v338)
  {
    *((_QWORD *)&v338 + 1) = v338;
    operator delete((void *)v338);
  }
  if (*(_QWORD *)&__src[32])
  {
    *(_QWORD *)&__src[40] = *(_QWORD *)&__src[32];
    operator delete(*(void **)&__src[32]);
  }
  if (*(_QWORD *)&__src[8])
  {
    *(_QWORD *)&__src[16] = *(_QWORD *)&__src[8];
    operator delete(*(void **)&__src[8]);
  }
  v120 = 1;
  if ((int)v119 >= 1)
  {
    v121 = v117;
    do
    {
      v122 = *v121++;
      v120 *= v122;
      --v119;
    }
    while (v119);
  }
  self->retile_stride = v120;
  self->retile_tile_sz = self->tile_w_1;
  std::vector<int>::resize((std::vector<int> *)&self->retile_n_outputs_v, ((char *)self->full_scales.__end_ - (char *)self->full_scales.__begin_) >> 4);
  if (v118)
    operator delete(v118);
  if (v117)
    operator delete(v117);
  if (v116)
    operator delete(v116);
  -[EspressoFDOverfeatNetwork setup_retile](self, "setup_retile");
  self->cropDims.first = (unint64_t)v74;
  self->cropDims.second = (unint64_t)tile_h_1;
  v124 = self->resizers_for_batching.__begin_;
  for (k = (uint64_t)self->resizers_for_batching.__end_;
        (void *)k != v124;
  v125 = 0;
  self->resizers_for_batching.__end_ = v124;
  self->n_resizers_for_batching = 8;
  do
  {
    v126 = (std::__shared_weak_count *)operator new(0xB8uLL);
    v126->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v126->__shared_owners_;
    v126->__shared_weak_owners_ = 0;
    v126->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBC120;
    *(_OWORD *)&v126[1].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v126[2].__shared_owners_ = 0u;
    v126[3].std::__shared_count = 0u;
    *(_OWORD *)&v126[3].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v126[4].__shared_owners_ = 0u;
    v126[5].std::__shared_count = 0u;
    *(_OWORD *)&v126[5].__shared_weak_owners_ = 0u;
    v126[6].__shared_owners_ = 0;
    v126[1].std::__shared_count = 0u;
    LOBYTE(v126[7].__shared_owners_) = 1;
    LODWORD(v126[6].__shared_weak_owners_) = 0;
    v126[7].__vftable = 0;
    *(_QWORD *)__src = v126 + 1;
    *(_QWORD *)&__src[8] = v126;
    if (&v126[4] != (std::__shared_weak_count *)&self->full_scales)
      std::vector<std::pair<unsigned long long,unsigned long long>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long long,unsigned long long>*,std::pair<unsigned long long,unsigned long long>*>(&v126[4].__vftable, (__int128 *)self->full_scales.__begin_, (__int128 *)self->full_scales.__end_, ((char *)self->full_scales.__end_ - (char *)self->full_scales.__begin_) >> 4);
    v129 = (char *)self->resizers_for_batching.__end_;
    v128 = (char *)self->resizers_for_batching.__end_cap_.__value_;
    if (v129 < v128)
    {
      *(_QWORD *)v129 = *(_QWORD *)__src;
      *((_QWORD *)v129 + 1) = v126;
      do
        v130 = __ldxr(p_shared_owners);
      while (__stxr(v130 + 1, p_shared_owners));
      self->resizers_for_batching.__end_ = v129 + 16;
LABEL_236:
      v147 = (unint64_t *)&v126->__shared_owners_;
      do
        v148 = __ldaxr(v147);
      while (__stlxr(v148 - 1, v147));
      if (!v148)
      {
        ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
        std::__shared_weak_count::__release_weak(v126);
      }
      goto LABEL_240;
    }
    v131 = (char *)self->resizers_for_batching.__begin_;
    v132 = (v129 - v131) >> 4;
    v133 = v132 + 1;
    if ((unint64_t)(v132 + 1) >> 60)
      std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
    v134 = v128 - v131;
    if (v134 >> 3 > v133)
      v133 = v134 >> 3;
    if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFF0)
      v135 = 0xFFFFFFFFFFFFFFFLL;
    else
      v135 = v133;
    if (v135 >> 60)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v136 = (char *)operator new(16 * v135);
    v137 = &v136[16 * v132];
    v138 = *(_QWORD *)&__src[8];
    *(_OWORD *)v137 = *(_OWORD *)__src;
    if (v138)
    {
      v139 = (unint64_t *)(v138 + 8);
      do
        v140 = __ldxr(v139);
      while (__stxr(v140 + 1, v139));
      v131 = (char *)self->resizers_for_batching.__begin_;
      v129 = (char *)self->resizers_for_batching.__end_;
    }
    if (v129 == v131)
    {
      v143 = vdupq_n_s64((unint64_t)v129);
      v141 = &v136[16 * v132];
    }
    else
    {
      v141 = &v136[16 * v132];
      do
      {
        v142 = *((_OWORD *)v129 - 1);
        v129 -= 16;
        *((_OWORD *)v141 - 1) = v142;
        v141 -= 16;
        *(_QWORD *)v129 = 0;
        *((_QWORD *)v129 + 1) = 0;
      }
      while (v129 != v131);
      v143 = *(int64x2_t *)&self->resizers_for_batching.__begin_;
    }
    v144 = v137 + 16;
    self->resizers_for_batching.__begin_ = v141;
    self->resizers_for_batching.__end_ = v137 + 16;
    self->resizers_for_batching.__end_cap_.__value_ = &v136[16 * v135];
    v145 = v143.i64[1];
    v146 = (void *)v143.i64[0];
    while ((void *)v145 != v146)
      v145 = std::shared_ptr<void>::~shared_ptr[abi:ne180100](v145 - 16);
    if (v146)
      operator delete(v146);
    v126 = *(std::__shared_weak_count **)&__src[8];
    self->resizers_for_batching.__end_ = v144;
    if (v126)
      goto LABEL_236;
LABEL_240:
    ++v125;
  }
  while (v125 < self->n_resizers_for_batching);
  std::vector<std::shared_ptr<Espresso::blob<float,3>>>::resize((uint64_t)&self->probBlobs, ((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4);
  std::vector<std::shared_ptr<Espresso::blob<float,3>>>::resize((uint64_t)&self->boxBlobs, ((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4);
  v149 = (int64x2_t *)self->net_scales.__begin_;
  if (self->net_scales.__end_ == v149)
  {
    v151 = 1;
  }
  else
  {
    v150 = 0;
    v151 = 1;
    v152 = 0xFFFFFFFFLL;
    v297 = -1;
    do
    {
      *(_QWORD *)&v338 = 0;
      memset(&__src[24], 0, 32);
      *(int32x2_t *)__src = vmovn_s64(v149[v150]);
      *(_OWORD *)&__src[8] = xmmword_191A939B0;
      if (*((_DWORD *)v330 + v150))
      {
        v302 = v152;
        v153 = (char *)p_gpu_nets->__begin_ + 16 * v150;
        v154 = v153;
        if (!*v153)
        {
          objc_msgSend(v299, "pathExtension");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v179 = objc_msgSend(v178, "isEqualToString:", CFSTR("net"));

          if (v179)
          {
            std::string::basic_string[abi:ne180100]<0>(&v321, (char *)objc_msgSend(objc_retainAutorelease(v299), "UTF8String"));
            v316[1] = 0;
            v317 = 0;
            v319 = 0;
            v320 = 0;
            v316[0] = &v316[1];
            v318 = &v319;
            std::string::basic_string[abi:ne180100]<0>(v335, "json");
            Espresso::load_network_layers(&v321, p_context_metal, (uint64_t)v316, a7, v335, (uint64_t *)&v322);
            std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)v153, &v322);
            v180 = (std::__shared_weak_count *)*((_QWORD *)&v322 + 1);
            if (*((_QWORD *)&v322 + 1))
            {
              v181 = (unint64_t *)(*((_QWORD *)&v322 + 1) + 8);
              do
                v182 = __ldaxr(v181);
              while (__stlxr(v182 - 1, v181));
              if (!v182)
              {
                ((void (*)(std::__shared_weak_count *))v180->__on_zero_shared)(v180);
                std::__shared_weak_count::__release_weak(v180);
              }
            }
            if (v336 < 0)
              operator delete(*(void **)v335);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v318, v319);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v316, (char *)v316[1]);
            if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v321.__r_.__value_.__l.__data_);
          }
          if (!*v153)
          {
            std::string::basic_string[abi:ne180100]<0>(&v321, (char *)objc_msgSend(objc_retainAutorelease(v299), "UTF8String"));
            std::string::basic_string[abi:ne180100]<0>(v335, "");
            v316[1] = 0;
            v317 = 0;
            v319 = 0;
            v320 = 0;
            v316[0] = &v316[1];
            v318 = &v319;
            Espresso::load_network_layers_binserializer((uint64_t)&v321, (const void **)v335, p_context_metal, (uint64_t)v316, a7, v297 != -1, (uint64_t *)&v322);
            std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)v153, &v322);
            v183 = (std::__shared_weak_count *)*((_QWORD *)&v322 + 1);
            if (*((_QWORD *)&v322 + 1))
            {
              v184 = (unint64_t *)(*((_QWORD *)&v322 + 1) + 8);
              do
                v185 = __ldaxr(v184);
              while (__stlxr(v185 - 1, v184));
              if (!v185)
              {
                ((void (*)(std::__shared_weak_count *))v183->__on_zero_shared)(v183);
                std::__shared_weak_count::__release_weak(v183);
              }
            }
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v318, v319);
            std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v316, (char *)v316[1]);
            if (v336 < 0)
              operator delete(*(void **)v335);
            if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v321.__r_.__value_.__l.__data_);
          }
          v186 = self->_context_metal.__cntrl_;
          v314 = self->_context_metal.__ptr_;
          v315 = v186;
          if (v186)
          {
            v187 = (unint64_t *)((char *)v186 + 8);
            do
              v188 = __ldxr(v187);
            while (__stxr(v188 + 1, v187));
          }
          -[EspressoFDOverfeatNetwork retryLoadingCaffeNet:name:weights:context:cp:](self, "retryLoadingCaffeNet:name:weights:context:cp:", v153, v299, v296, &v314, a7);
          v189 = (std::__shared_weak_count *)v315;
          if (v315)
          {
            v190 = (unint64_t *)((char *)v315 + 8);
            do
              v191 = __ldaxr(v190);
            while (__stlxr(v191 - 1, v190));
            if (!v191)
            {
              ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
              std::__shared_weak_count::__release_weak(v189);
            }
          }
        }
        v313[0] = *v153;
        v157 = v153[1];
        v155 = (Espresso::net **)(v153 + 1);
        v156 = (std::__shared_weak_count *)v157;
        v313[1] = v157;
        if (v157)
        {
          v158 = (unint64_t *)&v156->__shared_owners_;
          do
            v159 = __ldxr(v158);
          while (__stxr(v159 + 1, v158));
        }
        Espresso::compute_network_shape_starting_from_data_shape(v313, (__int128 *)__src, (uint64_t)v316);
        if (v156)
        {
          v160 = (unint64_t *)&v156->__shared_owners_;
          do
            v161 = __ldaxr(v160);
          while (__stlxr(v161 - 1, v160));
          if (!v161)
          {
            ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
            std::__shared_weak_count::__release_weak(v156);
          }
        }
        v162 = (float)*(int *)__src / (float)*(int *)&__src[4];
        v163 = (unint64_t *)((char *)self->net_scales.__begin_ + 16 * v150);
        v165 = *v163;
        v164 = v163[1];
        if (v165 <= v164)
          v166 = v164;
        else
          v166 = v165;
        if (fabsf(v162) <= 1.2)
        {
          if (v162 >= 0.83333)
          {
            MEMORY[0x19401C808](*v154 + 424, "");
            v172 = 0;
          }
          else
          {
            std::to_string(&v321, v166);
            v173 = std::string::insert(&v321, 0, "fd-");
            v174 = v173->__r_.__value_.__r.__words[0];
            *(_QWORD *)v335 = v173->__r_.__value_.__l.__size_;
            *(_QWORD *)&v335[7] = *(std::string::size_type *)((char *)&v173->__r_.__value_.__r.__words[1] + 7);
            v175 = HIBYTE(v173->__r_.__value_.__r.__words[2]);
            v173->__r_.__value_.__l.__size_ = 0;
            v173->__r_.__value_.__r.__words[2] = 0;
            v173->__r_.__value_.__r.__words[0] = 0;
            v176 = *v154;
            if (*(char *)(*v154 + 447) < 0)
              operator delete(*(void **)(v176 + 424));
            v177 = *(_QWORD *)v335;
            *(_QWORD *)(v176 + 424) = v174;
            *(_QWORD *)(v176 + 432) = v177;
            *(_QWORD *)(v176 + 439) = *(_QWORD *)&v335[7];
            *(_BYTE *)(v176 + 447) = v175;
            if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v321.__r_.__value_.__l.__data_);
            v172 = 1;
          }
        }
        else
        {
          std::to_string(&v321, v166);
          v167 = std::string::insert(&v321, 0, "fd-");
          v168 = v167->__r_.__value_.__r.__words[0];
          *(_QWORD *)v335 = v167->__r_.__value_.__l.__size_;
          *(_QWORD *)&v335[7] = *(std::string::size_type *)((char *)&v167->__r_.__value_.__r.__words[1] + 7);
          v169 = HIBYTE(v167->__r_.__value_.__r.__words[2]);
          v167->__r_.__value_.__l.__size_ = 0;
          v167->__r_.__value_.__r.__words[2] = 0;
          v167->__r_.__value_.__r.__words[0] = 0;
          v170 = *v154;
          if (*(char *)(*v154 + 447) < 0)
            operator delete(*(void **)(v170 + 424));
          v171 = *(_QWORD *)v335;
          *(_QWORD *)(v170 + 424) = v168;
          *(_QWORD *)(v170 + 432) = v171;
          *(_QWORD *)(v170 + 439) = *(_QWORD *)&v335[7];
          *(_BYTE *)(v170 + 447) = v169;
          if (SHIBYTE(v321.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v321.__r_.__value_.__l.__data_);
          v172 = 0;
        }
        v192 = *v154;
        *(_DWORD *)(v192 + 496) = v172;
        *(_BYTE *)(v192 + 500) = 0;
        v312[0] = (Espresso::net *)v192;
        v193 = *v155;
        v312[1] = v193;
        if (v193)
        {
          v194 = (unint64_t *)((char *)v193 + 8);
          do
            v195 = __ldxr(v194);
          while (__stxr(v195 + 1, v194));
        }
        Espresso::prepare_network_reshape_graph_coloring(v312, (uint64_t)v316);
        if (v193)
        {
          v196 = (unint64_t *)((char *)v193 + 8);
          do
            v197 = __ldaxr(v196);
          while (__stlxr(v197 - 1, v196));
          if (!v197)
          {
            (*(void (**)(Espresso::net *))(*(_QWORD *)v193 + 16))(v193);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v193);
          }
        }
        if (v297 == -1)
          v297 = v150;
        else
          Espresso::net::share_weights(*v154, (uint64_t)p_gpu_nets->__begin_ + 16 * v297);
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)p_gpu_nets->__begin_ + 2 * v150, *v154, v154[1]);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v318, v319);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v316, (char *)v316[1]);
        v152 = v302;
      }
      if (*((_DWORD *)v327 + v150))
      {
        v198 = v152;
        v199 = (char *)p_ecpu_nets->__begin_ + 16 * v150;
        v200 = v199;
        if (!*v199)
        {
          v215 = objc_retainAutorelease(v299);
          std::string::basic_string[abi:ne180100]<0>(v316, (char *)objc_msgSend(v215, "UTF8String"));
          Espresso::load_network((uint64_t)v316, p_context_cpu, a7, 0, (uint64_t *)&v321);
          std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)v199, (__int128 *)&v321);
          size = (std::__shared_weak_count *)v321.__r_.__value_.__l.__size_;
          if (v321.__r_.__value_.__l.__size_)
          {
            v217 = (unint64_t *)(v321.__r_.__value_.__l.__size_ + 8);
            do
              v218 = __ldaxr(v217);
            while (__stlxr(v218 - 1, v217));
            if (!v218)
            {
              ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
              std::__shared_weak_count::__release_weak(size);
            }
          }
          if (SHIBYTE(v317) < 0)
            operator delete(v316[0]);
          v219 = self->_context_cpu.__cntrl_;
          v310 = self->_context_cpu.__ptr_;
          v311 = v219;
          if (v219)
          {
            v220 = (unint64_t *)((char *)v219 + 8);
            do
              v221 = __ldxr(v220);
            while (__stxr(v221 + 1, v220));
          }
          -[EspressoFDOverfeatNetwork retryLoadingCaffeNet:name:weights:context:cp:](self, "retryLoadingCaffeNet:name:weights:context:cp:", v199, v215, v296, &v310, a7);
          v222 = (std::__shared_weak_count *)v311;
          if (v311)
          {
            v223 = (unint64_t *)((char *)v311 + 8);
            do
              v224 = __ldaxr(v223);
            while (__stlxr(v224 - 1, v223));
            if (!v224)
            {
              ((void (*)(std::__shared_weak_count *))v222->__on_zero_shared)(v222);
              std::__shared_weak_count::__release_weak(v222);
            }
          }
        }
        v309[0] = *v199;
        v203 = v199[1];
        v201 = (std::__shared_weak_count **)(v199 + 1);
        v202 = (std::__shared_weak_count *)v203;
        v309[1] = v203;
        if (v203)
        {
          v204 = (unint64_t *)&v202->__shared_owners_;
          do
            v205 = __ldxr(v204);
          while (__stxr(v205 + 1, v204));
        }
        Espresso::compute_network_shape_starting_from_data_shape(v309, (__int128 *)__src, (uint64_t)v316);
        if (v202)
        {
          v206 = (unint64_t *)&v202->__shared_owners_;
          do
            v207 = __ldaxr(v206);
          while (__stlxr(v207 - 1, v206));
          if (!v207)
          {
            ((void (*)(std::__shared_weak_count *))v202->__on_zero_shared)(v202);
            std::__shared_weak_count::__release_weak(v202);
          }
        }
        v208 = (Espresso *)*v200;
        *((_BYTE *)v208 + 500) = 0;
        v307 = v208;
        v209 = *v201;
        v308 = v209;
        if (v209)
        {
          v210 = (unint64_t *)&v209->__shared_owners_;
          do
            v211 = __ldxr(v210);
          while (__stxr(v211 + 1, v210));
        }
        Espresso::shape_network_recursive(v208, (Espresso::net *)v316, 0, 0);
        v152 = v198;
        if (v209)
        {
          v212 = (unint64_t *)&v209->__shared_owners_;
          do
            v213 = __ldaxr(v212);
          while (__stlxr(v213 - 1, v212));
          if (!v213)
          {
            ((void (*)(std::__shared_weak_count *))v209->__on_zero_shared)(v209);
            std::__shared_weak_count::__release_weak(v209);
          }
        }
        if ((_DWORD)v198 == -1)
        {
          v152 = v150;
          v214 = &self->ecpu_nets;
        }
        else
        {
          v214 = &self->ecpu_nets;
          Espresso::net::share_weights(*v200, (uint64_t)p_ecpu_nets->__begin_ + 16 * (int)v152);
        }
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)v214->__begin_ + 2 * v150, *v200, v200[1]);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v318, v319);
        std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)v316, (char *)v316[1]);
      }
      v225 = *(double *)(*(_QWORD *)p_scalesc + 8 * v150);
      if (*(_QWORD *)&__src[40])
      {
        *(_QWORD *)&__src[48] = *(_QWORD *)&__src[40];
        operator delete(*(void **)&__src[40]);
      }
      v151 = (int)(v225 * (double)v151);
      ++v150;
      v149 = (int64x2_t *)self->net_scales.__begin_;
    }
    while (v150 < ((char *)self->net_scales.__end_ - (char *)v149) >> 4);
  }
  v316[0] = 0;
  v316[1] = 0;
  v317 = 0;
  v226 = (std::string::size_type *)self->gpu_nets.__begin_;
  for (m = (std::string::size_type *)self->gpu_nets.__end_; v226 != m; v226 += 2)
  {
    v228 = *v226;
    v229 = (std::__shared_weak_count *)v226[1];
    v321.__r_.__value_.__r.__words[0] = *v226;
    v321.__r_.__value_.__l.__size_ = (std::string::size_type)v229;
    if (v229)
    {
      v230 = (unint64_t *)&v229->__shared_owners_;
      do
        v231 = __ldxr(v230);
      while (__stxr(v231 + 1, v230));
    }
    if (v228)
    {
      *(_BYTE *)(v228 + 500) = 0;
      v232 = v316[1];
      if (v316[1] >= v317)
      {
        v236 = ((char *)v316[1] - (char *)v316[0]) >> 4;
        v237 = v236 + 1;
        if ((unint64_t)(v236 + 1) >> 60)
          std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
        v238 = v317 - (char *)v316[0];
        if ((v317 - (char *)v316[0]) >> 3 > v237)
          v237 = v238 >> 3;
        if ((unint64_t)v238 >= 0x7FFFFFFFFFFFFFF0)
          v239 = 0xFFFFFFFFFFFFFFFLL;
        else
          v239 = v237;
        *(_QWORD *)&__src[32] = &v317;
        v240 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v239);
        v242 = &v240[16 * v236];
        v243 = v321.__r_.__value_.__l.__size_;
        *(_OWORD *)v242 = *(_OWORD *)&v321.__r_.__value_.__l.__data_;
        if (v243)
        {
          v244 = (unint64_t *)(v243 + 8);
          do
            v245 = __ldxr(v244);
          while (__stxr(v245 + 1, v244));
        }
        v247 = v316[0];
        v246 = v316[1];
        if (v316[1] == v316[0])
        {
          v250 = vdupq_n_s64((unint64_t)v316[1]);
          v248 = &v240[16 * v236];
        }
        else
        {
          v248 = &v240[16 * v236];
          do
          {
            v249 = *((_OWORD *)v246 - 1);
            v246 -= 2;
            *((_OWORD *)v248 - 1) = v249;
            v248 -= 16;
            *v246 = 0;
            v246[1] = 0;
          }
          while (v246 != v247);
          v250 = *(int64x2_t *)v316;
        }
        v235 = v242 + 16;
        v316[0] = v248;
        v316[1] = v242 + 16;
        *(int64x2_t *)&__src[8] = v250;
        v251 = v317;
        v317 = &v240[16 * v241];
        *(_QWORD *)&__src[24] = v251;
        *(_QWORD *)__src = v250.i64[0];
        std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)__src);
        v229 = (std::__shared_weak_count *)v321.__r_.__value_.__l.__size_;
      }
      else
      {
        *(_QWORD *)v316[1] = v321.__r_.__value_.__r.__words[0];
        v232[1] = v229;
        if (v229)
        {
          v233 = (unint64_t *)&v229->__shared_owners_;
          do
            v234 = __ldxr(v233);
          while (__stxr(v234 + 1, v233));
        }
        v235 = v232 + 2;
      }
      v316[1] = v235;
    }
    if (v229)
    {
      v252 = (unint64_t *)&v229->__shared_owners_;
      do
        v253 = __ldaxr(v252);
      while (__stlxr(v253 - 1, v252));
      if (!v253)
      {
        ((void (*)(std::__shared_weak_count *))v229->__on_zero_shared)(v229);
        std::__shared_weak_count::__release_weak(v229);
      }
    }
  }
  *(_QWORD *)&__src[8] = 0;
  *(_QWORD *)&__src[16] = 0;
  *(_QWORD *)__src = &off_1E2D854F0;
  v254 = (std::__shared_weak_count *)operator new(0x30uLL);
  v254->__shared_owners_ = 0;
  v255 = (unint64_t *)&v254->__shared_owners_;
  v254->__shared_weak_owners_ = 0;
  v254->__vftable = (std::__shared_weak_count_vtbl *)&off_1E2DBD8F8;
  v254[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E2D94720;
  v254[1].__shared_weak_owners_ = 0;
  v321.__r_.__value_.__r.__words[0] = (std::string::size_type)&v254[1];
  v321.__r_.__value_.__l.__size_ = (std::string::size_type)v254;
  v254[1].__shared_owners_ = 0x100000003;
  do
    v256 = __ldxr(v255);
  while (__stxr(v256 + 1, v255));
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&__src[8], (uint64_t)&v254[1], (uint64_t)v254);
  do
    v258 = __ldaxr(v255);
  while (__stlxr(v258 - 1, v255));
  if (!v258)
  {
    ((void (*)(std::__shared_weak_count *))v254->__on_zero_shared)(v254);
    std::__shared_weak_count::__release_weak(v254);
  }
  v259 = (Espresso::net **)v316[0];
  v260 = (Espresso::net **)v316[1];
  while (v259 != v260)
  {
    Espresso::pass_graph_coloring::run_on_network((Espresso::pass_graph_coloring *)__src, *v259, (uint64_t)v305);
    v261 = v306;
    if (v306)
    {
      v262 = (unint64_t *)&v306->__shared_owners_;
      do
        v263 = __ldaxr(v262);
      while (__stlxr(v263 - 1, v262));
      if (!v263)
      {
        ((void (*)(std::__shared_weak_count *))v261->__on_zero_shared)(v261);
        std::__shared_weak_count::__release_weak(v261);
      }
    }
    v259 += 2;
  }
  *(float *)&v257 = (float)v151;
  Espresso::print_mem_stats((Espresso *)-[EspressoFDOverfeatNetwork setMaxScale:](self, "setMaxScale:", v257));
  v264 = (std::__shared_weak_count *)v321.__r_.__value_.__l.__size_;
  if (v321.__r_.__value_.__l.__size_)
  {
    v265 = (unint64_t *)(v321.__r_.__value_.__l.__size_ + 8);
    do
      v266 = __ldaxr(v265);
    while (__stlxr(v266 - 1, v265));
    if (!v266)
    {
      ((void (*)(std::__shared_weak_count *))v264->__on_zero_shared)(v264);
      std::__shared_weak_count::__release_weak(v264);
    }
  }
  *(_QWORD *)__src = off_1E2DA6C90;
  v267 = *(std::__shared_weak_count **)&__src[16];
  if (*(_QWORD *)&__src[16])
  {
    v268 = (unint64_t *)(*(_QWORD *)&__src[16] + 8);
    do
      v269 = __ldaxr(v268);
    while (__stlxr(v269 - 1, v268));
    if (!v269)
    {
      ((void (*)(std::__shared_weak_count *))v267->__on_zero_shared)(v267);
      std::__shared_weak_count::__release_weak(v267);
    }
  }
  *(_QWORD *)__src = v316;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)__src);

  if (v327)
  {
    v328 = v327;
    operator delete(v327);
  }
  if (v330)
  {
    v331 = v330;
    operator delete(v330);
  }
  if (v334 < 0)
    operator delete(v333);

}

- (int)getNumScales
{
  int forceMaxNScales;
  int v3;

  forceMaxNScales = self->_forceMaxNScales;
  if (forceMaxNScales >= (int)((unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4))
    v3 = (unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4;
  else
    v3 = self->_forceMaxNScales;
  if (forceMaxNScales <= 0)
    return (unint64_t)((char *)self->net_scales.__end_ - (char *)self->net_scales.__begin_) >> 4;
  else
    return v3;
}

- (shared_ptr<Espresso::blob<float,)probBlobForScale:(int)a3
{
  _OWORD *v3;
  __int128 v4;
  unint64_t *v5;
  unint64_t v6;
  shared_ptr<Espresso::blob<float, 3>> result;

  v4 = *((_OWORD *)self->probBlobs.__begin_ + a3);
  *v3 = v4;
  if (*((_QWORD *)&v4 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (shared_ptr<Espresso::blob<float,)boxBlobForScale:(int)a3
{
  _OWORD *v3;
  __int128 v4;
  unint64_t *v5;
  unint64_t v6;
  shared_ptr<Espresso::blob<float, 3>> result;

  v4 = *((_OWORD *)self->boxBlobs.__begin_ + a3);
  *v3 = v4;
  if (*((_QWORD *)&v4 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v4 + 1) + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = self;
  return result;
}

- (void)generatePyramid:(const void *)a3 tex:(id)a4
{
  double v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  int v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12[2];

  v5 = *(_QWORD *)self->resizers_for_batching.__begin_;
  v6 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v7 = 4 * *(_DWORD *)(*(_QWORD *)a3 + 8);
  v12[0] = *(_QWORD *)a3;
  v12[1] = (uint64_t)v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  Espresso::fast_pyramid_resizer::build_pyramid(v5, v7, v12, 1, 1, v4);
  if (v6)
  {
    v10 = (unint64_t *)&v6->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)processBlob:(const void *)a3 tex:(id)a4
{
  id v6;
  double v7;
  uint64_t *begin;
  std::__shared_weak_count *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  _BYTE v18[64];

  v6 = a4;
  Espresso::print_mem_stats((Espresso *)-[EspressoFDOverfeatNetwork generatePyramid:tex:](self, "generatePyramid:tex:", a3, v6));
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v18, "processBlob", v7);
  begin = (uint64_t *)self->resizers_for_batching.__begin_;
  v10 = *begin;
  v9 = (std::__shared_weak_count *)begin[1];
  v16 = v10;
  v17 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  -[EspressoFDOverfeatNetwork processPyramid:](self, "processPyramid:", &v16);
  v13 = v17;
  if (v17)
  {
    v14 = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v18);

}

- (void)processVimageNoRotation:(const vImage_Buffer *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  vImagePixelCount width;
  char *v10;
  void *data;
  vImagePixelCount height;
  char *v13;
  vImagePixelCount v14;
  size_t v15;
  void *v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  vImagePixelCount v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  __int128 v28;

  v5 = a5;
  v8 = a4;
  v28 = 0uLL;
  width = a3->width;
  if (a3->rowBytes == 4 * width)
  {
    v10 = (char *)operator new(0x58uLL);
    *((_QWORD *)v10 + 1) = 0;
    *((_QWORD *)v10 + 2) = 0;
    *(_QWORD *)v10 = &off_1E2DBEAB0;
    data = a3->data;
    height = a3->height;
    *((_QWORD *)v10 + 3) = &off_1E2DA10D0;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *((_DWORD *)v10 + 8) = width;
    *((_DWORD *)v10 + 9) = height;
    *((_QWORD *)v10 + 5) = data;
    v10[48] = 0;
    *(_QWORD *)&v28 = v10 + 24;
    *((_QWORD *)&v28 + 1) = v10;
  }
  else
  {
    v13 = (char *)operator new(0x58uLL);
    *((_QWORD *)v13 + 1) = 0;
    *((_QWORD *)v13 + 2) = 0;
    *((_QWORD *)v13 + 3) = &off_1E2DA10D0;
    *(_QWORD *)v13 = &off_1E2DBEAB0;
    v14 = a3->height;
    *(_OWORD *)(v13 + 56) = 0u;
    *(_OWORD *)(v13 + 72) = 0u;
    *((_DWORD *)v13 + 8) = width;
    *((_DWORD *)v13 + 9) = v14;
    v15 = (int)v14 * 4 * (int)width;
    v16 = Espresso::kern_alloc_uninitialized((Espresso *)v15);
    bzero(v16, v15);
    *((_QWORD *)v13 + 5) = v16;
    v13[48] = 1;
    *(_QWORD *)&v17 = v13 + 24;
    *((_QWORD *)&v17 + 1) = v13;
    v18 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    v28 = v17;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if (SLODWORD(a3->height) >= 1)
    {
      v21 = 0;
      v22 = (char *)a3->data;
      v23 = *(char **)(v28 + 16);
      v24 = a3->width;
      do
      {
        memcpy(v23, v22, 4 * v24);
        v24 = a3->width;
        v23 += 4 * v24;
        v22 += a3->rowBytes;
        ++v21;
      }
      while (v21 < SLODWORD(a3->height));
    }
  }
  -[EspressoFDOverfeatNetwork processBlobNoRotation:tex:doBGRA2RGBA:](self, "processBlobNoRotation:tex:doBGRA2RGBA:", &v28, v8, v5);
  v25 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
  if (*((_QWORD *)&v28 + 1))
  {
    v26 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

}

- (void)processBlobNoRotation:(const void *)a3 tex:(id)a4 doBGRA2RGBA:(BOOL)a5
{
  double v5;
  double v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  int v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *begin;
  std::__shared_weak_count *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28[2];
  _BYTE v29[64];

  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v29, "processBlob", v5);
  v10 = *(_QWORD *)self->resizers_for_batching.__begin_;
  v11 = *(_QWORD *)a3;
  v12 = (std::__shared_weak_count *)*((_QWORD *)a3 + 1);
  v13 = 4 * *(_DWORD *)(v11 + 8);
  v28[0] = v11;
  v28[1] = (uint64_t)v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  Espresso::fast_pyramid_resizer::build_pyramid(v10, v13, v28, 0, a5, v9);
  if (v12)
  {
    v16 = (unint64_t *)&v12->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  begin = (uint64_t *)self->resizers_for_batching.__begin_;
  v20 = *begin;
  v19 = (std::__shared_weak_count *)begin[1];
  v26 = v20;
  v27 = v19;
  if (v19)
  {
    v21 = (unint64_t *)&v19->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  -[EspressoFDOverfeatNetwork processPyramid:](self, "processPyramid:", &v26);
  v23 = v27;
  if (v27)
  {
    v24 = (unint64_t *)&v27->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v29);
}

- (void)processPyramid:(shared_ptr<Espresso::fast_pyramid_resizer>)a3
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = (std::__shared_weak_count *)*((_QWORD *)a3.var0 + 1);
  v9 = *(_QWORD *)a3.var0;
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  -[EspressoFDOverfeatNetwork processPyramid:gpu_resizer:](self, "processPyramid:gpu_resizer:", &v9, 0);
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)processPyramid:(shared_ptr<Espresso:(id)a4 :fast_pyramid_resizer>)a3 gpu_resizer:
{
  fast_pyramid_resizer *var0;
  __shared_weak_count *v6;
  double v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  int forceMaxNScales;
  uint64_t v13;
  uint64_t v14;
  NSObject *cpu_queue_0;
  unint64_t *p_shared_owners;
  unint64_t v17;
  double v18;
  _QWORD *begin;
  _BYTE *end;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  abstract_context *ptr;
  std::__shared_weak_count *v28;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v35;
  char v36;
  double v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t j;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  __int128 v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  void *v52;
  __int128 v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  const void **v61;
  uint64_t v62;
  _QWORD **v63;
  uint64_t v64;
  _QWORD **v65;
  uint64_t v66;
  uint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  __int128 v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  __int128 v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  __shared_weak_count *v105;
  void *v106;
  void **v107;
  std::__shared_weak_count *v108;
  const void **v109;
  std::__shared_weak_count *v110;
  void *__p[2];
  char v112;
  uint64_t v113;
  std::__shared_weak_count *v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[8];
  std::__shared_weak_count *v118;
  int v119;
  void **v120[8];
  void **v121;
  void ***v122;
  uint64_t v123;
  __n128 (*v124)(__n128 *, __n128 *);
  void (*v125)(uint64_t);
  const char *v126;
  _QWORD v127[3];
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  __n128 (*v131)(__n128 *, __n128 *);
  void (*v132)(uint64_t);
  const char *v133;
  _QWORD v134[3];
  _QWORD block[6];
  std::__shared_weak_count *v136;
  int v137;
  _BYTE v138[72];

  var0 = a3.var0;
  v6 = a3.var1;
  +[EspressoMetalSingleton shared](EspressoMetalSingleton, "shared");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v138, "> processPyramid", v7);
  v105 = v6;
  v9 = *(_QWORD *)var0;
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v10 = (*(_QWORD *)(*(_QWORD *)var0 + 56) - *(_QWORD *)(*(_QWORD *)var0 + 48)) >> 4;
  forceMaxNScales = self->_forceMaxNScales;
  if (forceMaxNScales > (int)v10 || forceMaxNScales < 1)
    v13 = v10;
  else
    v13 = forceMaxNScales;
  v14 = MEMORY[0x1E0C809B0];
  block[2] = __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke;
  block[3] = &unk_1E2DC40B8;
  cpu_queue_0 = self->cpu_queue_0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  v137 = v13;
  block[5] = v9;
  v136 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  block[4] = self;
  dispatch_async(cpu_queue_0, block);
  v128 = 0;
  v129 = &v128;
  v130 = 0x4812000000;
  v131 = __Block_byref_object_copy__19351;
  v132 = __Block_byref_object_dispose__19352;
  v133 = "";
  std::vector<std::shared_ptr<Espresso::blob<float,4>>>::vector(v134, (int)v13);
  v121 = 0;
  v122 = &v121;
  v123 = 0x4812000000;
  v124 = __Block_byref_object_copy__19351;
  v125 = __Block_byref_object_dispose__19352;
  v126 = "";
  std::vector<std::shared_ptr<Espresso::blob<float,4>>>::vector(v127, (int)v13);
  begin = self->gpu_nets.__begin_;
  end = self->gpu_nets.__end_;
  v21 = end - (_BYTE *)begin;
  if (end != (_BYTE *)begin)
  {
    v22 = 0;
    v23 = v21 >> 4;
    if (v23 <= 1)
      v23 = 1;
    do
    {
      v24 = *begin;
      begin += 2;
      v22 |= v24 != 0;
      --v23;
    }
    while (v23);
    if ((v22 & 1) != 0)
    {
      Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v120, ">> GPU layers", v18);
      if ((objc_msgSend(v106, "is_memory_tight") & 4) != 0 && (int)v13 >= 1)
      {
        v25 = 0;
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)((char *)self->gpu_nets.__begin_ + v25)
            && -[EspressoFDOverfeatNetwork needRetiling:](self, "needRetiling:", i))
          {
            -[EspressoFDOverfeatNetwork retile_and_forward_espresso_gpu_network_at_index:net:pyr:](self, "retile_and_forward_espresso_gpu_network_at_index:net:pyr:", i, (char *)self->gpu_nets.__begin_ + v25, var0);
          }
          v25 += 16;
        }
      }
      ptr = self->_context_metal.__ptr_;
      v117[0] = v14;
      v117[1] = 3321888768;
      v117[2] = __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke_65;
      v117[3] = &unk_1E2DC4320;
      v119 = v13;
      v29 = *(_QWORD *)var0;
      v28 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
      v117[4] = self;
      v117[7] = v29;
      v118 = v28;
      if (v28)
      {
        v30 = (unint64_t *)&v28->__shared_owners_;
        do
          v31 = __ldxr(v30);
        while (__stxr(v31 + 1, v30));
      }
      v117[5] = &v128;
      v117[6] = &v121;
      Espresso::abstract_context::compute_batch_sync(ptr, v117);
      v32 = v118;
      if (v118)
      {
        v33 = (unint64_t *)&v118->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v120);
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->cpu_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  +[EspressoMetalSingleton shared](EspressoMetalSingleton, "shared");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "is_memory_tight");

  if ((v36 & 1) != 0)
  {
    v38 = *(_QWORD *)var0;
    +[EspressoMetalSingleton shared](EspressoMetalSingleton, "shared");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "is_memory_tight");

    if ((v40 & 1) != 0)
    {
      v42 = *(_QWORD *)(v38 + 48);
      for (j = *(_QWORD *)(v38 + 56); j != v42; j = std::shared_ptr<void>::~shared_ptr[abi:ne180100](j - 16))
        ;
      *(_QWORD *)(v38 + 56) = v42;
    }
  }
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v120, ">> prob", v37);
  if ((int)v13 >= 1)
  {
    for (k = 0; k != v13; ++k)
    {
      v116 = 0uLL;
      v115 = 0uLL;
      v44 = *(_QWORD *)(v129[6] + 16 * k);
      if (v44)
      {
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(__p, v44 + 8);
        v45 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        v46 = (std::__shared_weak_count *)*((_QWORD *)&v116 + 1);
        v116 = v45;
        if (v46)
        {
          v47 = (unint64_t *)&v46->__shared_owners_;
          do
            v48 = __ldaxr(v47);
          while (__stlxr(v48 - 1, v47));
          if (!v48)
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
          }
        }
        v49 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          v50 = (unint64_t *)((char *)__p[1] + 8);
          do
            v51 = __ldaxr(v50);
          while (__stlxr(v51 - 1, v50));
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
            std::__shared_weak_count::__release_weak(v49);
          }
        }
      }
      v52 = v122[6][2 * k];
      if (v52)
      {
        std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(__p, (uint64_t)v52 + 8);
        v53 = *(_OWORD *)__p;
        __p[0] = 0;
        __p[1] = 0;
        v54 = (std::__shared_weak_count *)*((_QWORD *)&v115 + 1);
        v115 = v53;
        if (v54)
        {
          v55 = (unint64_t *)&v54->__shared_owners_;
          do
            v56 = __ldaxr(v55);
          while (__stlxr(v56 - 1, v55));
          if (!v56)
          {
            ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
            std::__shared_weak_count::__release_weak(v54);
          }
        }
        v57 = (std::__shared_weak_count *)__p[1];
        if (__p[1])
        {
          v58 = (unint64_t *)((char *)__p[1] + 8);
          do
            v59 = __ldaxr(v58);
          while (__stlxr(v59 - 1, v58));
          if (!v59)
          {
            ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
            std::__shared_weak_count::__release_weak(v57);
          }
        }
      }
      v60 = *(_QWORD *)(v129[6] + 16 * k);
      if (v60)
        memcpy(*(void **)(v116 + 24), *(const void **)(v60 + 24), 4 * *(int *)(v116 + 8) * (uint64_t)*(int *)(v116 + 12) * *(int *)(v116 + 16));
      v61 = (const void **)v122[6][2 * k];
      if (v61)
        memcpy(*(void **)(v115 + 24), v61[3], 4 * *(int *)(v115 + 8) * (uint64_t)*(int *)(v115 + 12) * *(int *)(v115 + 16));
      if (!(_QWORD)v116)
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v116, *((_QWORD *)self->probBlobs.__begin_ + 2 * k), *((_QWORD *)self->probBlobs.__begin_ + 2 * k + 1));
      if (!(_QWORD)v115)
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v115, *((_QWORD *)self->boxBlobs.__begin_ + 2 * k), *((_QWORD *)self->boxBlobs.__begin_ + 2 * k + 1));
      if (*((_QWORD *)self->ecpu_nets.__begin_ + 2 * k))
      {
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v116, *((_QWORD *)self->probBlobs.__begin_ + 2 * k), *((_QWORD *)self->probBlobs.__begin_ + 2 * k + 1));
        std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&v115, *((_QWORD *)self->boxBlobs.__begin_ + 2 * k), *((_QWORD *)self->boxBlobs.__begin_ + 2 * k + 1));
        if (!-[EspressoFDOverfeatNetwork needRetiling:](self, "needRetiling:", k))
        {
          v62 = *((_QWORD *)self->ecpu_nets.__begin_ + 2 * k);
          std::string::basic_string[abi:ne180100]<0>(__p, "prob_student");
          v109 = (const void **)__p;
          v63 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v62 + 136, (unsigned __int8 *)__p, (__int128 **)&v109);
          (*(void (**)(uint64_t *__return_ptr))(*v63[5] + 56))(&v113);
          if (v112 < 0)
            operator delete(__p[0]);
          v64 = *((_QWORD *)self->ecpu_nets.__begin_ + 2 * k);
          std::string::basic_string[abi:ne180100]<0>(__p, "fc4-conv_student");
          v107 = __p;
          v65 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v64 + 136, (unsigned __int8 *)__p, (__int128 **)&v107);
          (*(void (**)(const void ***__return_ptr))(*v65[5] + 56))(&v109);
          if (v112 < 0)
            operator delete(__p[0]);
          v66 = *((_QWORD *)self->ecpu_nets.__begin_ + 2 * k);
          std::string::basic_string[abi:ne180100]<0>(__p, "prob_student");
          v107 = __p;
          v67 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v66 + 136, (unsigned __int8 *)__p, (__int128 **)&v107)+ 5);
          v107 = 0;
          v108 = 0;
          (*(void (**)(uint64_t, void ***, uint64_t *))(*(_QWORD *)v67 + 40))(v67, &v107, &v113);
          v68 = v108;
          if (v108)
          {
            v69 = (unint64_t *)&v108->__shared_owners_;
            do
              v70 = __ldaxr(v69);
            while (__stlxr(v70 - 1, v69));
            if (!v70)
            {
              ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
              std::__shared_weak_count::__release_weak(v68);
            }
          }
          if (v112 < 0)
            operator delete(__p[0]);
          v71 = *((_QWORD *)self->ecpu_nets.__begin_ + 2 * k);
          std::string::basic_string[abi:ne180100]<0>(__p, "fc4-conv_student");
          v107 = __p;
          v72 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v71 + 136, (unsigned __int8 *)__p, (__int128 **)&v107)+ 5);
          v107 = 0;
          v108 = 0;
          (*(void (**)(uint64_t, void ***, const void ***))(*(_QWORD *)v72 + 40))(v72, &v107, &v109);
          v73 = v108;
          if (v108)
          {
            v74 = (unint64_t *)&v108->__shared_owners_;
            do
              v75 = __ldaxr(v74);
            while (__stlxr(v75 - 1, v74));
            if (!v75)
            {
              ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
              std::__shared_weak_count::__release_weak(v73);
            }
          }
          if (v112 < 0)
            operator delete(__p[0]);
          if (!(_QWORD)v116)
          {
            std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(__p, v113 + 8);
            v88 = *(_OWORD *)__p;
            __p[0] = 0;
            __p[1] = 0;
            v89 = (std::__shared_weak_count *)*((_QWORD *)&v116 + 1);
            v116 = v88;
            if (v89)
            {
              v90 = (unint64_t *)&v89->__shared_owners_;
              do
                v91 = __ldaxr(v90);
              while (__stlxr(v91 - 1, v90));
              if (!v91)
              {
                ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
                std::__shared_weak_count::__release_weak(v89);
              }
            }
            v92 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v93 = (unint64_t *)((char *)__p[1] + 8);
              do
                v94 = __ldaxr(v93);
              while (__stlxr(v94 - 1, v93));
              if (!v94)
              {
                ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
                std::__shared_weak_count::__release_weak(v92);
              }
            }
          }
          if (!(_QWORD)v115)
          {
            std::allocate_shared[abi:ne180100]<Espresso::blob<float,3>,std::allocator<Espresso::blob<float,3>>,int const*&,void>(__p, (uint64_t)(v109 + 1));
            v95 = *(_OWORD *)__p;
            __p[0] = 0;
            __p[1] = 0;
            v96 = (std::__shared_weak_count *)*((_QWORD *)&v115 + 1);
            v115 = v95;
            if (v96)
            {
              v97 = (unint64_t *)&v96->__shared_owners_;
              do
                v98 = __ldaxr(v97);
              while (__stlxr(v98 - 1, v97));
              if (!v98)
              {
                ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
                std::__shared_weak_count::__release_weak(v96);
              }
            }
            v99 = (std::__shared_weak_count *)__p[1];
            if (__p[1])
            {
              v100 = (unint64_t *)((char *)__p[1] + 8);
              do
                v101 = __ldaxr(v100);
              while (__stlxr(v101 - 1, v100));
              if (!v101)
              {
                ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
                std::__shared_weak_count::__release_weak(v99);
              }
            }
          }
          memcpy(*(void **)(v116 + 24), *(const void **)(v113 + 24), 4 * *(int *)(v116 + 8) * (uint64_t)*(int *)(v116 + 12) * *(int *)(v116 + 16));
          memcpy(*(void **)(v115 + 24), v109[3], 4 * *(int *)(v115 + 8) * (uint64_t)*(int *)(v115 + 12) * *(int *)(v115 + 16));
          v76 = v110;
          if (v110)
          {
            v77 = (unint64_t *)&v110->__shared_owners_;
            do
              v78 = __ldaxr(v77);
            while (__stlxr(v78 - 1, v77));
            if (!v78)
            {
              ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
              std::__shared_weak_count::__release_weak(v76);
            }
          }
          v79 = v114;
          if (v114)
          {
            v80 = (unint64_t *)&v114->__shared_owners_;
            do
              v81 = __ldaxr(v80);
            while (__stlxr(v81 - 1, v80));
            if (!v81)
            {
              ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
              std::__shared_weak_count::__release_weak(v79);
            }
          }
        }
      }
      std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)self->probBlobs.__begin_ + 2 * k, v116, *((uint64_t *)&v116 + 1));
      std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100]((_QWORD *)self->boxBlobs.__begin_ + 2 * k, v115, *((uint64_t *)&v115 + 1));
      v82 = (std::__shared_weak_count *)*((_QWORD *)&v115 + 1);
      if (*((_QWORD *)&v115 + 1))
      {
        v83 = (unint64_t *)(*((_QWORD *)&v115 + 1) + 8);
        do
          v84 = __ldaxr(v83);
        while (__stlxr(v84 - 1, v83));
        if (!v84)
        {
          ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
          std::__shared_weak_count::__release_weak(v82);
        }
      }
      v85 = (std::__shared_weak_count *)*((_QWORD *)&v116 + 1);
      if (*((_QWORD *)&v116 + 1))
      {
        v86 = (unint64_t *)(*((_QWORD *)&v116 + 1) + 8);
        do
          v87 = __ldaxr(v86);
        while (__stlxr(v87 - 1, v86));
        if (!v87)
        {
          ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
          std::__shared_weak_count::__release_weak(v85);
        }
      }
    }
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v120);
  _Block_object_dispose(&v121, 8);
  v120[0] = (void **)v127;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](v120);
  _Block_object_dispose(&v128, 8);
  v121 = (void **)v134;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&v121);
  v102 = v136;
  if (v136)
  {
    v103 = (unint64_t *)&v136->__shared_owners_;
    do
      v104 = __ldaxr(v103);
    while (__stlxr(v104 - 1, v103));
    if (!v104)
    {
      ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
      std::__shared_weak_count::__release_weak(v102);
    }
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v138);

}

- (int)default_retile_outputs
{
  if (-[EspressoFDOverfeatNetwork mode](self, "mode"))
    return 14;
  else
    return 9;
}

- (void)setup_retile
{
  void *v3;
  char v4;
  unint64_t *end;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int *begin;
  int retile_tile_sz;
  int retile_stride;
  unint64_t *v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  int v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  int v22;
  BOOL v23;
  unint64_t v24;
  float v25;
  unint64_t v26;
  float v27;
  unint64_t v28;
  double *v29;
  unint64_t *v30;
  unint64_t v31;
  float v32;
  unint64_t v33;

  +[EspressoMetalSingleton shared](EspressoMetalSingleton, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "is_memory_tight");

  if ((v4 & 4) != 0)
  {
    end = (unint64_t *)self->full_scales.__end_;
    if (end == self->full_scales.__begin_)
    {
      v7 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        self->retile_n_outputs_v.__begin_[v6++] = -[EspressoFDOverfeatNetwork default_retile_outputs](self, "default_retile_outputs");
        end = (unint64_t *)self->full_scales.__begin_;
        v7 = ((char *)self->full_scales.__end_ - (char *)end) >> 4;
      }
      while (v7 > v6);
      if (v7)
      {
        v8 = 0;
        begin = self->retile_n_outputs_v.__begin_;
        retile_tile_sz = self->retile_tile_sz;
        retile_stride = self->retile_stride;
        v12 = end + 1;
        v13 = ((char *)self->full_scales.__end_ - (char *)end) >> 4;
        while (1)
        {
          v14 = v12 - 1;
          v15 = *(v12 - 1);
          v16 = begin[v8];
          v17 = retile_tile_sz + retile_stride * (v16 - 1);
          v18 = (double)v15;
          v19 = (double)v17 * 1.2;
          if (v19 >= (double)v15)
          {
            if (v8 >= 3)
            {
              v20 = *v12;
              v21 = (double)*v12;
              if (v19 < v21)
                goto LABEL_12;
            }
          }
          else if (v8 >= 3)
          {
            v20 = *v12;
            v21 = (double)*v12;
LABEL_12:
            v22 = retile_stride * v16;
            if (v7 <= (int)v13)
              LODWORD(v13) = v8;
            v23 = v15 > v20;
            if (v15 < v20)
              v14 = v12;
            v24 = retile_tile_sz
                - retile_stride
                + v22
                + v22 * ((retile_stride + ~retile_tile_sz + *(_DWORD *)v14) / v22);
            v25 = v18 / v21;
            v26 = (unint64_t)(float)(v25 * (float)v24);
            v27 = v21 / v18;
            if (v23)
              v26 = v24;
            if (v23)
              v24 = (unint64_t)(float)(v27 * (float)v24);
            *(v12 - 1) = v26;
            *v12 = v24;
            *((int64x2_t *)self->net_scales.__begin_ + v8) = vdupq_n_s64(v17);
          }
          ++v8;
          v12 += 2;
          if (v7 == v8)
            goto LABEL_27;
        }
      }
    }
    LODWORD(v13) = 0;
LABEL_27:
    if (v7 > (int)v13)
    {
      v28 = v7 - (int)v13;
      v29 = &self->scalesc.__begin_[(int)v13 - 1];
      v30 = &end[2 * (int)v13];
      do
      {
        v31 = *v30;
        if (*v30 <= v30[1])
          v31 = v30[1];
        v32 = (float)v31;
        v33 = *(v30 - 2);
        if (v33 <= *(v30 - 1))
          v33 = *(v30 - 1);
        *v29++ = (float)(v32 / (float)v33);
        v30 += 2;
        --v28;
      }
      while (v28);
    }
  }
}

- (void)retile_and_forward_espresso_gpu_network_at_index:(int)a3 net:(const void *)a4 pyr:(const void *)a5
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "You ended up in an unsupported path, the legacy low memory mode");
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
}

- (void)forward_cpu_network_at_index:(int)a3 pyr:(const void *)a4
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD **v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void **p_p;
  std::__shared_weak_count *v34;
  void *__p;
  std::__shared_weak_count *v36;
  char v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  std::__shared_weak_count *v41;

  v40 = 0;
  v41 = 0;
  v4 = (uint64_t *)((char *)self->ecpu_nets.__begin_ + 16 * a3);
  v5 = *v4;
  if (*v4)
  {
    v7 = *(_QWORD *)&a3;
    std::string::basic_string[abi:ne180100]<0>(&__p, "data");
    p_p = &__p;
    v9 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v5 + 136, (unsigned __int8 *)&__p, (__int128 **)&p_p);
    (*(void (**)(uint64_t *__return_ptr))(*v9[5] + 56))(&v38);
    if (v37 < 0)
      operator delete(__p);
    if (-[EspressoFDOverfeatNetwork needRetiling:](self, "needRetiling:", v7))
    {
      -[EspressoFDOverfeatNetwork retile_and_forward_espresso_network_at_index:net:pyr:](self, "retile_and_forward_espresso_network_at_index:net:pyr:", v7, v4, a4);
    }
    else
    {
      Espresso::fast_pyramid_resizer::get_f32_level(*(_QWORD **)a4, v7, &v40);
      v10 = (char *)self->net_scales.__begin_ + 16 * (int)v7;
      v11 = 16 * (int)v7;
      memcpy(*(void **)(v38 + 24), *(const void **)(v40 + 24), 12 * *v10 * v10[1]);
      v12 = *(_QWORD *)((char *)self->ecpu_nets.__begin_ + v11);
      std::string::basic_string[abi:ne180100]<0>(&__p, "data");
      p_p = &__p;
      v13 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v12 + 136, (unsigned __int8 *)&__p, (__int128 **)&p_p)+ 5);
      p_p = 0;
      v34 = 0;
      (*(void (**)(uint64_t, void ***, uint64_t *))(*(_QWORD *)v13 + 48))(v13, &p_p, &v38);
      v14 = v34;
      if (v34)
      {
        p_shared_owners = (unint64_t *)&v34->__shared_owners_;
        do
          v16 = __ldaxr(p_shared_owners);
        while (__stlxr(v16 - 1, p_shared_owners));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      if (v37 < 0)
        operator delete(__p);
      v17 = v41;
      v40 = 0;
      v41 = 0;
      if (v17)
      {
        v18 = (unint64_t *)&v17->__shared_owners_;
        do
          v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      v20 = *(_QWORD *)((char *)self->ecpu_nets.__begin_ + v11);
      __p = 0;
      v36 = 0;
      Espresso::net::__forward(v20, &__p, 0, 0xFFFFFFFFLL);
      v21 = v36;
      if (v36)
      {
        v22 = (unint64_t *)&v36->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
    }
    v24 = v39;
    if (v39)
    {
      v25 = (unint64_t *)&v39->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = v41;
    v40 = 0;
    v41 = 0;
    if (v27)
    {
      v28 = (unint64_t *)&v27->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
      v30 = v41;
      if (v41)
      {
        v31 = (unint64_t *)&v41->__shared_owners_;
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
    }
  }
}

- (BOOL)needRetiling:(int)a3
{
  _QWORD *begin;
  _QWORD *v4;

  begin = self->full_scales.__begin_;
  v4 = self->net_scales.__begin_;
  return begin[2 * a3] != v4[2 * a3] || begin[2 * a3 + 1] != v4[2 * a3 + 1];
}

- (id)errorForLayers
{
  return self->_errorForLayers;
}

- (void)setContextMetal:(id)a3
{
  id v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "ctx");
  else
    v9 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_context_metal, &v9);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)setContextCpu:(id)a3
{
  id v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "ctx");
  else
    v9 = 0uLL;
  std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100]((uint64_t)&self->_context_cpu, &v9);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (BOOL)useGPUScaler
{
  return self->_useGPUScaler;
}

- (void)setUseGPUScaler:(BOOL)a3
{
  self->_useGPUScaler = a3;
}

- (int)scalingMode
{
  return self->_scalingMode;
}

- (void)setScalingMode:(int)a3
{
  self->_scalingMode = a3;
}

- (float)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(float)a3
{
  self->_maxScale = a3;
}

- (int)forceMaxNScales
{
  return self->_forceMaxNScales;
}

- (void)setForceMaxNScales:(int)a3
{
  self->_forceMaxNScales = a3;
}

- (NSString)basename
{
  return self->_basename;
}

- (void)setBasename:(id)a3
{
  objc_storeStrong((id *)&self->_basename, a3);
}

- (NSString)weights
{
  return self->_weights;
}

- (void)setWeights:(id)a3
{
  objc_storeStrong((id *)&self->_weights, a3);
}

- (int)scaleConfig
{
  return self->_scaleConfig;
}

- (void)setScaleConfig:(int)a3
{
  self->_scaleConfig = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)cpin
{
  return self->_cpin;
}

- (void)setCpin:(int)a3
{
  self->_cpin = a3;
}

- (shared_ptr<Espresso::abstract_context>)context_metal
{
  abstract_context **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Espresso::abstract_context> result;

  cntrl = self->_context_metal.__cntrl_;
  *v2 = self->_context_metal.__ptr_;
  v2[1] = (abstract_context *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

- (void)setContext_metal:(shared_ptr<Espresso::abstract_context>)a3
{
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->_context_metal.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (shared_ptr<Espresso::abstract_context>)context_cpu
{
  abstract_context **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<Espresso::abstract_context> result;

  cntrl = self->_context_cpu.__cntrl_;
  *v2 = self->_context_cpu.__ptr_;
  v2[1] = (abstract_context *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (abstract_context *)self;
  return result;
}

- (void)setContext_cpu:(shared_ptr<Espresso::abstract_context>)a3
{
  std::shared_ptr<Espresso::analysis_result>::operator=[abi:ne180100](&self->_context_cpu.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void).cxx_destruct
{
  int *begin;
  int *v4;
  int *v5;
  int *v6;
  void *v7;
  uint64_t end;
  void *v9;
  double *v10;
  void *v11;
  void *v12;
  void **p_begin;

  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_context_cpu);
  std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)&self->_context_metal);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_basename, 0);
  objc_storeStrong((id *)&self->cpu_semaphore, 0);
  objc_storeStrong((id *)&self->cpu_queue_0, 0);
  begin = self->retile_n_outputs_v.__begin_;
  if (begin)
  {
    self->retile_n_outputs_v.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->strideConf.pad.__begin_;
  if (v4)
  {
    self->strideConf.pad.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->strideConf.stride.__begin_;
  if (v5)
  {
    self->strideConf.stride.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->strideConf.kernel_size.__begin_;
  if (v6)
  {
    self->strideConf.kernel_size.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_errorForLayers, 0);
  p_begin = &self->boxBlobs.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->probBlobs.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  v7 = self->resizers_for_batching.__begin_;
  if (v7)
  {
    end = (uint64_t)self->resizers_for_batching.__end_;
    v9 = self->resizers_for_batching.__begin_;
    if ((void *)end != v7)
    {
      do
        end = std::shared_ptr<void>::~shared_ptr[abi:ne180100](end - 16);
      while ((void *)end != v7);
      v9 = self->resizers_for_batching.__begin_;
    }
    self->resizers_for_batching.__end_ = v7;
    operator delete(v9);
  }
  v10 = self->scalesc.__begin_;
  if (v10)
  {
    self->scalesc.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->full_scales.__begin_;
  if (v11)
  {
    self->full_scales.__end_ = v11;
    operator delete(v11);
  }
  v12 = self->net_scales.__begin_;
  if (v12)
  {
    self->net_scales.__end_ = v12;
    operator delete(v12);
  }
  p_begin = &self->ecpu_nets.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->gpu_nets.__begin_;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 27) = 0;
  *((_QWORD *)self + 28) = 0;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 43) = 0;
  *((_QWORD *)self + 41) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  return self;
}

intptr_t __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke(uint64_t a1, double a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[64];

  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v9, ">> CPU layers", a2);
  v3 = *(_DWORD *)(a1 + 56);
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = a1 + 40;
    do
    {
      v7 = *(_QWORD *)(*(_QWORD *)v6 + 48);
      if (v5 < (int)((unint64_t)(*(_QWORD *)(*(_QWORD *)v6 + 56) - v7) >> 4) && *(_QWORD *)(v7 + v4))
      {
        objc_msgSend(*(id *)(a1 + 32), "forward_cpu_network_at_index:pyr:", v5, a1 + 40);
        v3 = *(_DWORD *)(a1 + 56);
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < v3);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v9);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 368));
}

void __56__EspressoFDOverfeatNetwork_processPyramid_gpu_resizer___block_invoke_65(uint64_t a1, int64x2_t **a2)
{
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int64x2_t *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  _QWORD *v27;
  char *v28;
  __int128 v29;
  int64x2_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD **v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD **v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD **v44;
  uint64_t v45;
  _QWORD **v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  unsigned __int128 v53;
  char *v54;
  std::__shared_weak_count *v55;
  unint64_t v56;
  std::__shared_weak_count *v57;
  void **p_p;
  void *__p;
  int64x2_t v60;
  uint64_t v61;
  int64x2_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (*(int *)(a1 + 72) >= 1)
  {
    v4 = 0;
    v5 = "prob_student";
    do
    {
      v6 = *(_QWORD **)(a1 + 32);
      if (*(_QWORD *)(v6[1] + 16 * v4) && (objc_msgSend(v6, "needRetiling:", v4) & 1) == 0)
      {
        v56 = 0;
        v57 = 0;
        Espresso::fast_pyramid_resizer::get_f32_level(*(_QWORD **)(a1 + 56), v4, &v56);
        v7 = v5;
        v8 = v56;
        __p = *(void **)(v56 + 8);
        v60.i32[0] = *(_DWORD *)(v56 + 16);
        v9 = operator new(0x60uLL);
        v9[1] = 0;
        v9[2] = 0;
        *v9 = &off_1E2DBECA8;
        v10 = *(_QWORD *)(v8 + 24);
        v9[3] = &off_1E2DA11F0;
        *((_OWORD *)v9 + 4) = 0u;
        *((_OWORD *)v9 + 5) = 0u;
        v9[4] = __p;
        *((_DWORD *)v9 + 10) = v60.i32[0];
        *((_DWORD *)v9 + 11) = 1;
        v9[6] = v10;
        *((_BYTE *)v9 + 56) = 0;
        v54 = (char *)(v9 + 3);
        v55 = (std::__shared_weak_count *)v9;
        v11 = *a2;
        v12 = v57;
        v53 = __PAIR128__((unint64_t)v57, v8);
        if (v57)
        {
          p_shared_owners = (unint64_t *)&v57->__shared_owners_;
          do
            v14 = __ldxr(p_shared_owners);
          while (__stxr(v14 + 1, p_shared_owners));
        }
        v15 = v11[11].u64[0];
        v16 = (unint64_t *)v11[10].i64[1];
        if ((unint64_t)v16 >= v15)
        {
          v18 = v11[10].i64[0];
          v19 = ((uint64_t)v16 - v18) >> 4;
          v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 60)
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          v21 = v15 - v18;
          if (v21 >> 3 > v20)
            v20 = v21 >> 3;
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
            v22 = 0xFFFFFFFFFFFFFFFLL;
          else
            v22 = v20;
          v62 = v11 + 11;
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v22);
          v25 = &v23[16 * v19];
          *(_QWORD *)v25 = v8;
          *((_QWORD *)v25 + 1) = v12;
          v27 = (_QWORD *)v11[10].i64[0];
          v26 = (_QWORD *)v11[10].i64[1];
          if (v26 == v27)
          {
            v30 = vdupq_n_s64((unint64_t)v26);
            v28 = &v23[16 * v19];
            v5 = v7;
          }
          else
          {
            v28 = &v23[16 * v19];
            v5 = v7;
            do
            {
              v29 = *((_OWORD *)v26 - 1);
              v26 -= 2;
              *((_OWORD *)v28 - 1) = v29;
              v28 -= 16;
              *v26 = 0;
              v26[1] = 0;
            }
            while (v26 != v27);
            v30 = v11[10];
          }
          v17 = v25 + 16;
          v11[10].i64[0] = (uint64_t)v28;
          v11[10].i64[1] = (uint64_t)(v25 + 16);
          v60 = v30;
          v31 = v11[11].i64[0];
          v11[11].i64[0] = (uint64_t)&v23[16 * v24];
          v61 = v31;
          __p = (void *)v30.i64[0];
          std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__p);
        }
        else
        {
          *v16 = v8;
          v16[1] = (unint64_t)v12;
          v17 = v16 + 2;
          v5 = v7;
        }
        v11[10].i64[1] = (uint64_t)v17;
        v32 = **(_QWORD **)(**(_QWORD **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4) + 32) + 80);
        (*(void (**)(uint64_t, int64x2_t **, char **))(*(_QWORD *)v32 + 48))(v32, a2, &v54);
        Espresso::net::__forward(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4), a2, 0, 0xFFFFFFFFLL);
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, v5);
        p_p = &__p;
        v34 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v33 + 136, (unsigned __int8 *)&__p, (__int128 **)&p_p);
        (*(void (**)(unsigned __int128 *__return_ptr))(*v34[5] + 56))(&v53);
        std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + 16 * v4, (__int128 *)&v53);
        v35 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
        if (*((_QWORD *)&v53 + 1))
        {
          v36 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
          do
            v37 = __ldaxr(v36);
          while (__stlxr(v37 - 1, v36));
          if (!v37)
          {
            ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
            std::__shared_weak_count::__release_weak(v35);
          }
        }
        if (v60.i8[15] < 0)
          operator delete(__p);
        v38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
        p_p = &__p;
        v39 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v38 + 136, (unsigned __int8 *)&__p, (__int128 **)&p_p);
        (*(void (**)(unsigned __int128 *__return_ptr))(*v39[5] + 56))(&v53);
        std::shared_ptr<Espresso::blob<unsigned short,4>>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) + 16 * v4, (__int128 *)&v53);
        v40 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
        if (*((_QWORD *)&v53 + 1))
        {
          v41 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
          do
            v42 = __ldaxr(v41);
          while (__stlxr(v42 - 1, v41));
          if (!v42)
          {
            ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
            std::__shared_weak_count::__release_weak(v40);
          }
        }
        if (v60.i8[15] < 0)
          operator delete(__p);
        v43 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, v5);
        *(_QWORD *)&v53 = &__p;
        v44 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v43 + 136, (unsigned __int8 *)&__p, (__int128 **)&v53);
        (*(void (**)(_QWORD *, int64x2_t **, uint64_t))(*v44[5] + 40))(v44[5], a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) + 16 * v4);
        if (v60.i8[15] < 0)
          operator delete(__p);
        v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16 * v4);
        std::string::basic_string[abi:ne180100]<0>(&__p, "fc4-conv_student");
        *(_QWORD *)&v53 = &__p;
        v46 = (_QWORD **)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v45 + 136, (unsigned __int8 *)&__p, (__int128 **)&v53);
        (*(void (**)(_QWORD *, int64x2_t **, uint64_t))(*v46[5] + 40))(v46[5], a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) + 16 * v4);
        if (v60.i8[15] < 0)
          operator delete(__p);
        v47 = v55;
        if (v55)
        {
          v48 = (unint64_t *)&v55->__shared_owners_;
          do
            v49 = __ldaxr(v48);
          while (__stlxr(v49 - 1, v48));
          if (!v49)
          {
            ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
            std::__shared_weak_count::__release_weak(v47);
          }
        }
        v50 = v57;
        if (v57)
        {
          v51 = (unint64_t *)&v57->__shared_owners_;
          do
            v52 = __ldaxr(v51);
          while (__stlxr(v52 - 1, v51));
          if (!v52)
          {
            ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
            std::__shared_weak_count::__release_weak(v50);
          }
        }
      }
      ++v4;
    }
    while (v4 < *(int *)(a1 + 72));
  }
}

@end
