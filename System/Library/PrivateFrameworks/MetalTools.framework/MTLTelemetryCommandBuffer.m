@implementation MTLTelemetryCommandBuffer

- (void)dealloc
{
  objc_super v3;

  free(self->encoderCount);
  free(self->parallellRenderEncoderDistribution);
  free(self->attachmentCount);
  free(self->textureBindCount);
  free(self->drawDistribution);
  free(self->dispatchDistribution);
  free(self->renderEncoderDrawCallDistribution);
  free(self->computeEncoderDispatchDistribution);
  free(self->blitEncoderBlitDistribution);
  free(self->renderTargetArrayLengthDistribution);
  free(self->viewportDistribution);
  free(self->scissorRectDistribution);
  free(self->anisoClippedCounts);
  v3.receiver = self;
  v3.super_class = (Class)MTLTelemetryCommandBuffer;
  -[MTLToolsCommandBuffer dealloc](&v3, sel_dealloc);
}

- (void)initDistributions
{
  self->encoderCount = (MTLTelemetryEncoderCountRec *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  self->parallellRenderEncoderDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->attachmentCount = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->textureBindCount = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->drawDistribution = (MTLTelemetryDrawDistributionRec *)malloc_type_calloc(1uLL, 0x9D8uLL, 0x100004010114EAEuLL);
  self->dispatchDistribution = (MTLTelemetryDispatchDistributionRec *)malloc_type_calloc(1uLL, 0xF8uLL, 0x10000406AFDB319uLL);
  self->cbDraws = 0;
  self->cbDispatches = 0;
  self->cbBlits = 0;
  self->cbMemoryBarriers = 0;
  self->renderEncoderDrawCallDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->computeEncoderDispatchDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->blitEncoderBlitDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->renderTargetArrayLengthDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->viewportDistribution = (MTLTelemetryViewportDistributionRec *)malloc_type_calloc(1uLL, 0x58uLL, 0x100004038113C5CuLL);
  self->scissorRectDistribution = (MTLTelemetryScissorRectDistributionRec *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
  self->anisoClippedCounts = (MTLTelemetryAnisoClippedCountsRec *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  getKernelTelemetryState(&self->_initKernelState);
}

- (MTLTelemetryCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  MTLTelemetryCommandBuffer *v5;
  MTLTelemetryCommandBuffer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLTelemetryCommandBuffer;
  v5 = -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:](&v8, sel_initWithCommandBuffer_parent_descriptor_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_telemetryDevice = (MTLTelemetryDevice *)-[MTLToolsObject device](v5, "device");
    -[MTLTelemetryCommandBuffer initDistributions](v6, "initDistributions");
  }
  return v6;
}

- (void)mergeDistributions
{
  MTLTelemetryEncoderCountRec *encoderCount;
  uint64_t var0;
  MTLTelemetryEncoderDistributionRec *encoderDistribution;
  uint64_t var2;
  MTLTelemetryEncoderDistributionRec *v6;
  MTLTelemetryStatisticUIRec *p_var2;
  unsigned int min;
  uint64_t var1;
  MTLTelemetryEncoderDistributionRec *v10;
  MTLTelemetryStatisticUIRec *p_var1;
  unsigned int v12;
  uint64_t var3;
  MTLTelemetryEncoderDistributionRec *v14;
  MTLTelemetryStatisticUIRec *p_var3;
  unsigned int v16;
  unsigned int v17;
  MTLTelemetryEncoderDistributionRec *v18;
  MTLTelemetryStatisticUIRec *p_var4;
  unsigned int v20;
  MTLTelemetryStatisticUIRec *parallellRenderEncoderDistribution;
  unsigned int count;
  MTLTelemetryStatisticUIRec *v23;
  unsigned int v24;
  unsigned int max;
  MTLTelemetryStatisticUIRec *attachmentCount;
  unsigned int v27;
  MTLTelemetryStatisticUIRec *v28;
  unsigned int v29;
  unsigned int v30;
  MTLTelemetryStatisticUIRec *textureBindCount;
  unsigned int v32;
  MTLTelemetryStatisticUIRec *v33;
  unsigned int v34;
  unsigned int v35;
  MTLTelemetryStatisticUIRec *renderTargetArrayLengthDistribution;
  unsigned int v37;
  MTLTelemetryStatisticUIRec *v38;
  unsigned int v39;
  unsigned int v40;
  MTLTelemetryViewportDistributionRec *viewportDistribution;
  unsigned int v42;
  MTLTelemetryViewportDistributionRec *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  MTLTelemetryViewportDistributionRec *v47;
  float v48;
  float v49;
  unsigned int v50;
  MTLTelemetryViewportDistributionRec *v51;
  float v52;
  float v53;
  unsigned int v54;
  MTLTelemetryViewportDistributionRec *v55;
  float v56;
  float v57;
  unsigned int v58;
  MTLTelemetryViewportDistributionRec *v59;
  float v60;
  float v61;
  MTLTelemetryScissorRectDistributionRec *scissorRectDistribution;
  unsigned int v63;
  MTLTelemetryScissorRectDistributionRec *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  MTLTelemetryScissorRectDistributionRec *v68;
  float v69;
  float v70;
  unsigned int v71;
  MTLTelemetryScissorRectDistributionRec *v72;
  float v73;
  float v74;
  _QWORD *next;
  char *v76;
  char *v77;
  unordered_map<MTLPixelFormat, MTLTelemetryRenderTargetDistribution, std::hash<unsigned long long>, std::equal_to<MTLPixelFormat>, std::allocator<std::pair<const MTLPixelFormat, MTLTelemetryRenderTargetDistribution>>> *p_renderTargetMap;
  _QWORD *v79;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t v84;
  char v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  int v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  int v98;
  int v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  int v103;
  unsigned int v104;
  unsigned int v105;
  int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  int v111;
  unsigned int v112;
  unsigned int v113;
  int v114;
  int v115;
  unsigned int v116;
  unsigned int v117;
  uint64_t cbDraws;
  MTLTelemetryStatisticUIRec *commandBufferDrawCallDistribution;
  MTLTelemetryStatisticUIRec *renderEncoderDrawCallDistribution;
  unsigned int v121;
  MTLTelemetryStatisticUIRec *v122;
  unsigned int v123;
  unsigned int v124;
  uint64_t cbDispatches;
  MTLTelemetryStatisticUIRec *commandBufferDispatchDistribution;
  MTLTelemetryStatisticUIRec *computeEncoderDispatchDistribution;
  unsigned int v128;
  MTLTelemetryStatisticUIRec *v129;
  unsigned int v130;
  unsigned int v131;
  uint64_t cbBlits;
  MTLTelemetryStatisticUIRec *commandBufferBlitDistribution;
  MTLTelemetryStatisticUIRec *blitEncoderBlitDistribution;
  unsigned int v135;
  MTLTelemetryStatisticUIRec *v136;
  unsigned int v137;
  unsigned int v138;
  uint64_t cbMemoryBarriers;
  MTLTelemetryStatisticUIRec *commandBufferMemoryBarrierDistribution;
  uint64_t v141;
  uint64_t v142;
  MTLTelemetryDrawDistributionRec *drawDistribution;
  uint64_t v144;
  MTLTelemetryDrawDistributionRec *v145;
  uint64_t v146;
  unint64_t v147;
  unsigned int v148;
  char *v149;
  char *v150;
  unsigned int v151;
  MTLTelemetryDrawDistributionRec *v152;
  char *v153;
  unsigned int v154;
  unsigned int v155;
  char *v156;
  char *v157;
  char *v158;
  int v159;
  MTLTelemetryDrawDistributionRec *v160;
  char *v161;
  unsigned int v162;
  unsigned int v163;
  char *v164;
  char *v165;
  char *v166;
  MTLTelemetryDispatchDistributionRec *dispatchDistribution;
  unsigned int v168;
  MTLTelemetryDispatchDistributionRec *v169;
  unsigned int v170;
  unsigned int v171;
  unsigned int v172;
  MTLTelemetryDispatchDistributionRec *v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  MTLTelemetryDispatchDistributionRec *v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  MTLTelemetryDispatchDistributionRec *v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  MTLTelemetryDispatchDistributionRec *v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  MTLTelemetryDispatchDistributionRec *v189;
  unsigned int v190;
  unsigned int v191;
  unsigned int v192;
  MTLTelemetryDispatchDistributionRec *v193;
  unsigned int v194;
  unsigned int v195;
  unsigned int v196;
  MTLTelemetryDispatchDistributionRec *v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  MTLTelemetryDispatchDistributionRec *v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  MTLTelemetryDispatchDistributionRec *v205;
  unsigned int v206;
  unsigned int v207;
  _QWORD *v208;
  unordered_map<MTLPixelFormat, MTLTelemetryBlitDistribution, std::hash<unsigned long long>, std::equal_to<MTLPixelFormat>, std::allocator<std::pair<const MTLPixelFormat, MTLTelemetryBlitDistribution>>> *p_blitMap;
  _QWORD *v210;
  uint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  _QWORD *v214;
  _QWORD *v215;
  uint64_t n;
  int v217;
  _QWORD *v218;
  int v219;
  int v220;
  unsigned int v221;
  unsigned int v222;
  _QWORD *v223;
  _QWORD *v224;
  int v225;
  _DWORD *v226;
  int v227;
  unsigned int v228;
  unsigned int v229;
  int v230;
  _DWORD *v231;
  int v232;
  unsigned int v233;
  unsigned int v234;
  int v235;
  _DWORD *v236;
  int v237;
  unsigned int v238;
  unsigned int v239;
  uint64_t depthClipModeClampCount;
  MTLTelemetryStatisticUIRec *depthClipModeClampDistribution;
  int pbAlloc;
  int v243;
  MTLTelemetryKernelDistributionRec *kernelDistribution;
  uint64_t v245;
  MTLTelemetryKernelDistributionRec *v246;
  MTLTelemetryStatisticIRec *v247;
  int v248;
  int tiledSceneBytes;
  int v250;
  MTLTelemetryKernelDistributionRec *v251;
  MTLTelemetryStatisticIRec *v252;
  int v253;
  int v254;
  MTLTelemetryKernelDistributionRec *v255;
  MTLTelemetryStatisticIRec *v256;
  int v257;
  uint64_t v258;
  MTLTelemetryAnisoClippedCountsRec *anisoClippedCounts;
  _QWORD *v261;
  MTLTelemetryKernelStateRec v262;

  encoderCount = self->encoderCount;
  var0 = encoderCount->var0;
  if ((_DWORD)var0)
  {
    encoderDistribution = self->_telemetryDevice->encoderDistribution;
    if (encoderDistribution->var0.count)
    {
      if (var0 > encoderDistribution->var0.max)
      {
        encoderDistribution->var0.max = var0;
        encoderDistribution = self->_telemetryDevice->encoderDistribution;
      }
      if (var0 >= encoderDistribution->var0.min)
        goto LABEL_9;
    }
    else
    {
      encoderDistribution->var0.max = var0;
      encoderDistribution = self->_telemetryDevice->encoderDistribution;
    }
    encoderDistribution->var0.min = var0;
LABEL_9:
    self->_telemetryDevice->encoderDistribution->var0.total += var0;
    ++self->_telemetryDevice->encoderDistribution->var0.count;
  }
  var2 = encoderCount->var2;
  if (!(_DWORD)var2)
    goto LABEL_19;
  v6 = self->_telemetryDevice->encoderDistribution;
  if (v6->var2.count)
  {
    if (var2 > v6->var2.max)
    {
      v6->var2.max = var2;
      v6 = self->_telemetryDevice->encoderDistribution;
    }
    min = v6->var2.min;
    p_var2 = &v6->var2;
    if (var2 >= min)
      goto LABEL_18;
  }
  else
  {
    v6->var2.max = var2;
    p_var2 = &self->_telemetryDevice->encoderDistribution->var2;
  }
  p_var2->min = var2;
LABEL_18:
  self->_telemetryDevice->encoderDistribution->var2.total += var2;
  ++self->_telemetryDevice->encoderDistribution->var2.count;
LABEL_19:
  var1 = encoderCount->var1;
  if (!(_DWORD)var1)
    goto LABEL_28;
  v10 = self->_telemetryDevice->encoderDistribution;
  if (v10->var1.count)
  {
    if (var1 > v10->var1.max)
    {
      v10->var1.max = var1;
      v10 = self->_telemetryDevice->encoderDistribution;
    }
    v12 = v10->var1.min;
    p_var1 = &v10->var1;
    if (var1 >= v12)
      goto LABEL_27;
  }
  else
  {
    v10->var1.max = var1;
    p_var1 = &self->_telemetryDevice->encoderDistribution->var1;
  }
  p_var1->min = var1;
LABEL_27:
  self->_telemetryDevice->encoderDistribution->var1.total += var1;
  ++self->_telemetryDevice->encoderDistribution->var1.count;
LABEL_28:
  var3 = encoderCount->var3;
  if (!(_DWORD)var3)
    goto LABEL_37;
  v14 = self->_telemetryDevice->encoderDistribution;
  if (v14->var3.count)
  {
    if (var3 > v14->var3.max)
    {
      v14->var3.max = var3;
      v14 = self->_telemetryDevice->encoderDistribution;
    }
    v16 = v14->var3.min;
    p_var3 = &v14->var3;
    if (var3 >= v16)
      goto LABEL_36;
  }
  else
  {
    v14->var3.max = var3;
    p_var3 = &self->_telemetryDevice->encoderDistribution->var3;
  }
  p_var3->min = var3;
LABEL_36:
  self->_telemetryDevice->encoderDistribution->var3.total += var3;
  ++self->_telemetryDevice->encoderDistribution->var3.count;
LABEL_37:
  v17 = var2 + var0 + var1 + var3;
  if (!v17)
    goto LABEL_46;
  v18 = self->_telemetryDevice->encoderDistribution;
  if (v18->var4.count)
  {
    if (v17 > v18->var4.max)
    {
      v18->var4.max = v17;
      v18 = self->_telemetryDevice->encoderDistribution;
    }
    v20 = v18->var4.min;
    p_var4 = &v18->var4;
    if (v17 >= v20)
      goto LABEL_45;
  }
  else
  {
    v18->var4.max = v17;
    p_var4 = &self->_telemetryDevice->encoderDistribution->var4;
  }
  p_var4->min = v17;
LABEL_45:
  self->_telemetryDevice->encoderDistribution->var4.total += v17;
  ++self->_telemetryDevice->encoderDistribution->var4.count;
LABEL_46:
  parallellRenderEncoderDistribution = self->parallellRenderEncoderDistribution;
  count = parallellRenderEncoderDistribution->count;
  if (count)
  {
    v23 = self->_telemetryDevice->parallellRenderEncoderDistribution;
    v24 = parallellRenderEncoderDistribution->min;
    if (v23->count)
    {
      if (v24 < v23->min)
      {
        v23->min = v24;
        v23 = self->_telemetryDevice->parallellRenderEncoderDistribution;
      }
      max = parallellRenderEncoderDistribution->max;
      if (max > v23->max)
        v23->max = max;
    }
    else
    {
      v23->min = v24;
      self->_telemetryDevice->parallellRenderEncoderDistribution->max = parallellRenderEncoderDistribution->max;
    }
    self->_telemetryDevice->parallellRenderEncoderDistribution->total += parallellRenderEncoderDistribution->total;
    self->_telemetryDevice->parallellRenderEncoderDistribution->count += count;
  }
  attachmentCount = self->attachmentCount;
  v27 = attachmentCount->count;
  if (v27)
  {
    v28 = self->_telemetryDevice->attachmentCount;
    v29 = attachmentCount->min;
    if (v28->count)
    {
      if (v29 < v28->min)
      {
        v28->min = v29;
        v28 = self->_telemetryDevice->attachmentCount;
      }
      v30 = attachmentCount->max;
      if (v30 > v28->max)
        v28->max = v30;
    }
    else
    {
      v28->min = v29;
      self->_telemetryDevice->attachmentCount->max = attachmentCount->max;
    }
    self->_telemetryDevice->attachmentCount->total += attachmentCount->total;
    self->_telemetryDevice->attachmentCount->count += v27;
  }
  textureBindCount = self->textureBindCount;
  v32 = textureBindCount->count;
  if (v32)
  {
    v33 = self->_telemetryDevice->textureBindCount;
    v34 = textureBindCount->min;
    if (v33->count)
    {
      if (v34 < v33->min)
      {
        v33->min = v34;
        v33 = self->_telemetryDevice->textureBindCount;
      }
      v35 = textureBindCount->max;
      if (v35 > v33->max)
        v33->max = v35;
    }
    else
    {
      v33->min = v34;
      self->_telemetryDevice->textureBindCount->max = textureBindCount->max;
    }
    self->_telemetryDevice->textureBindCount->total += textureBindCount->total;
    self->_telemetryDevice->textureBindCount->count += v32;
  }
  renderTargetArrayLengthDistribution = self->renderTargetArrayLengthDistribution;
  v37 = renderTargetArrayLengthDistribution->count;
  if (v37)
  {
    v38 = self->_telemetryDevice->renderTargetArrayLengthDistribution;
    v39 = renderTargetArrayLengthDistribution->min;
    if (v38->count)
    {
      if (v39 < v38->min)
      {
        v38->min = v39;
        v38 = self->_telemetryDevice->renderTargetArrayLengthDistribution;
      }
      v40 = renderTargetArrayLengthDistribution->max;
      if (v40 > v38->max)
        v38->max = v40;
    }
    else
    {
      v38->min = v39;
      self->_telemetryDevice->renderTargetArrayLengthDistribution->max = renderTargetArrayLengthDistribution->max;
    }
    self->_telemetryDevice->renderTargetArrayLengthDistribution->total += renderTargetArrayLengthDistribution->total;
    self->_telemetryDevice->renderTargetArrayLengthDistribution->count += v37;
  }
  viewportDistribution = self->viewportDistribution;
  v42 = viewportDistribution->var0.count;
  if (v42)
  {
    v43 = self->_telemetryDevice->viewportDistribution;
    v44 = viewportDistribution->var0.min;
    if (v43->var0.count)
    {
      if (v44 < v43->var0.min)
      {
        v43->var0.min = v44;
        v43 = self->_telemetryDevice->viewportDistribution;
      }
      v45 = viewportDistribution->var0.max;
      if (v45 > v43->var0.max)
        v43->var0.max = v45;
    }
    else
    {
      v43->var0.min = v44;
      self->_telemetryDevice->viewportDistribution->var0.max = viewportDistribution->var0.max;
    }
    self->_telemetryDevice->viewportDistribution->var0.total += viewportDistribution->var0.total;
    self->_telemetryDevice->viewportDistribution->var0.count += v42;
  }
  v46 = viewportDistribution->var1.var3;
  if (v46)
  {
    v47 = self->_telemetryDevice->viewportDistribution;
    v48 = viewportDistribution->var1.var0;
    if (v47->var1.var3)
    {
      if (v48 < v47->var1.var0)
      {
        v47->var1.var0 = v48;
        v47 = self->_telemetryDevice->viewportDistribution;
      }
      v49 = viewportDistribution->var1.var1;
      if (v49 <= v47->var1.var1)
        goto LABEL_94;
    }
    else
    {
      v47->var1.var0 = v48;
      v49 = viewportDistribution->var1.var1;
      v47 = self->_telemetryDevice->viewportDistribution;
    }
    v47->var1.var1 = v49;
LABEL_94:
    self->_telemetryDevice->viewportDistribution->var1.var2 = viewportDistribution->var1.var2
                                                            + self->_telemetryDevice->viewportDistribution->var1.var2;
    self->_telemetryDevice->viewportDistribution->var1.var3 += v46;
  }
  v50 = viewportDistribution->var2.var3;
  if (!v50)
    goto LABEL_104;
  v51 = self->_telemetryDevice->viewportDistribution;
  v52 = viewportDistribution->var2.var0;
  if (v51->var2.var3)
  {
    if (v52 < v51->var2.var0)
    {
      v51->var2.var0 = v52;
      v51 = self->_telemetryDevice->viewportDistribution;
    }
    v53 = viewportDistribution->var2.var1;
    if (v53 <= v51->var2.var1)
      goto LABEL_103;
  }
  else
  {
    v51->var2.var0 = v52;
    v53 = viewportDistribution->var2.var1;
    v51 = self->_telemetryDevice->viewportDistribution;
  }
  v51->var2.var1 = v53;
LABEL_103:
  self->_telemetryDevice->viewportDistribution->var2.var2 = viewportDistribution->var2.var2
                                                          + self->_telemetryDevice->viewportDistribution->var2.var2;
  self->_telemetryDevice->viewportDistribution->var2.var3 += v50;
LABEL_104:
  v54 = viewportDistribution->var3.var3;
  if (!v54)
    goto LABEL_113;
  v55 = self->_telemetryDevice->viewportDistribution;
  v56 = viewportDistribution->var3.var0;
  if (v55->var3.var3)
  {
    if (v56 < v55->var3.var0)
    {
      v55->var3.var0 = v56;
      v55 = self->_telemetryDevice->viewportDistribution;
    }
    v57 = viewportDistribution->var3.var1;
    if (v57 <= v55->var3.var1)
      goto LABEL_112;
  }
  else
  {
    v55->var3.var0 = v56;
    v57 = viewportDistribution->var3.var1;
    v55 = self->_telemetryDevice->viewportDistribution;
  }
  v55->var3.var1 = v57;
LABEL_112:
  self->_telemetryDevice->viewportDistribution->var3.var2 = viewportDistribution->var3.var2
                                                          + self->_telemetryDevice->viewportDistribution->var3.var2;
  self->_telemetryDevice->viewportDistribution->var3.var3 += v54;
LABEL_113:
  v58 = viewportDistribution->var4.var3;
  if (!v58)
    goto LABEL_122;
  v59 = self->_telemetryDevice->viewportDistribution;
  v60 = viewportDistribution->var4.var0;
  if (v59->var4.var3)
  {
    if (v60 < v59->var4.var0)
    {
      v59->var4.var0 = v60;
      v59 = self->_telemetryDevice->viewportDistribution;
    }
    v61 = viewportDistribution->var4.var1;
    if (v61 <= v59->var4.var1)
      goto LABEL_121;
  }
  else
  {
    v59->var4.var0 = v60;
    v61 = viewportDistribution->var4.var1;
    v59 = self->_telemetryDevice->viewportDistribution;
  }
  v59->var4.var1 = v61;
LABEL_121:
  self->_telemetryDevice->viewportDistribution->var4.var2 = viewportDistribution->var4.var2
                                                          + self->_telemetryDevice->viewportDistribution->var4.var2;
  self->_telemetryDevice->viewportDistribution->var4.var3 += v58;
LABEL_122:
  scissorRectDistribution = self->scissorRectDistribution;
  v63 = scissorRectDistribution->var0.count;
  if (v63)
  {
    v64 = self->_telemetryDevice->scissorRectDistribution;
    v65 = scissorRectDistribution->var0.min;
    if (v64->var0.count)
    {
      if (v65 < v64->var0.min)
      {
        v64->var0.min = v65;
        v64 = self->_telemetryDevice->scissorRectDistribution;
      }
      v66 = scissorRectDistribution->var0.max;
      if (v66 > v64->var0.max)
        v64->var0.max = v66;
    }
    else
    {
      v64->var0.min = v65;
      self->_telemetryDevice->scissorRectDistribution->var0.max = scissorRectDistribution->var0.max;
    }
    self->_telemetryDevice->scissorRectDistribution->var0.total += scissorRectDistribution->var0.total;
    self->_telemetryDevice->scissorRectDistribution->var0.count += v63;
  }
  v67 = scissorRectDistribution->var1.var3;
  if (v67)
  {
    v68 = self->_telemetryDevice->scissorRectDistribution;
    v69 = scissorRectDistribution->var1.var0;
    if (v68->var1.var3)
    {
      if (v69 < v68->var1.var0)
      {
        v68->var1.var0 = v69;
        v68 = self->_telemetryDevice->scissorRectDistribution;
      }
      v70 = scissorRectDistribution->var1.var1;
      if (v70 <= v68->var1.var1)
        goto LABEL_138;
    }
    else
    {
      v68->var1.var0 = v69;
      v70 = scissorRectDistribution->var1.var1;
      v68 = self->_telemetryDevice->scissorRectDistribution;
    }
    v68->var1.var1 = v70;
LABEL_138:
    self->_telemetryDevice->scissorRectDistribution->var1.var2 = scissorRectDistribution->var1.var2
                                                               + self->_telemetryDevice->scissorRectDistribution->var1.var2;
    self->_telemetryDevice->scissorRectDistribution->var1.var3 += v67;
  }
  v71 = scissorRectDistribution->var2.var3;
  if (!v71)
    goto LABEL_148;
  v72 = self->_telemetryDevice->scissorRectDistribution;
  v73 = scissorRectDistribution->var2.var0;
  if (v72->var2.var3)
  {
    if (v73 < v72->var2.var0)
    {
      v72->var2.var0 = v73;
      v72 = self->_telemetryDevice->scissorRectDistribution;
    }
    v74 = scissorRectDistribution->var2.var1;
    if (v74 <= v72->var2.var1)
      goto LABEL_147;
  }
  else
  {
    v72->var2.var0 = v73;
    v74 = scissorRectDistribution->var2.var1;
    v72 = self->_telemetryDevice->scissorRectDistribution;
  }
  v72->var2.var1 = v74;
LABEL_147:
  self->_telemetryDevice->scissorRectDistribution->var2.var2 = scissorRectDistribution->var2.var2
                                                             + self->_telemetryDevice->scissorRectDistribution->var2.var2;
  self->_telemetryDevice->scissorRectDistribution->var2.var3 += v71;
LABEL_148:
  next = self->renderTargetMap.__table_.__p1_.__value_.__next_;
  if (!next)
    goto LABEL_230;
  do
  {
    v76 = (char *)(next + 2);
    v261 = next;
    v77 = (char *)(next + 3);
    p_renderTargetMap = &self->_telemetryDevice->renderTargetMap;
    *(_QWORD *)&v262.pbAlloc = next + 2;
    v79 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>((uint64_t)p_renderTargetMap, next + 2, (uint64_t)&std::piecewise_construct, &v262);
    for (i = 0; i != 10; ++i)
    {
      for (j = 0; j != 8; ++j)
      {
        for (k = 0; k != 3; ++k)
        {
          for (m = 0; m != 6; ++m)
          {
            v84 = 0;
            v85 = 1;
            do
            {
              v86 = v85;
              if (i != 9 && (v85 & 1) == 0)
                break;
              v87 = (uint64_t)&v76[3168 * j + 202760 + 1056 * k + 176 * m];
              v88 = (uint64_t)&v79[396 * j + 25347 + 132 * k + 22 * m];
              if ((_DWORD)i != 8)
              {
                if ((_DWORD)i == 9)
                {
                  v89 = 352 * m + 176 * v84;
                  v87 = (uint64_t)&v76[6336 * j + 228104 + 2112 * k + v89];
                  v88 = (uint64_t)&v79[792 * j + 28515 + 264 * k] + v89;
                }
                else
                {
                  v87 = (uint64_t)&v77[25344 * i + 3168 * j + 1056 * k + 176 * m];
                  v88 = (uint64_t)&v79[3168 * i + 3 + 396 * j + 132 * k + 22 * m];
                }
              }
              if (!*(_DWORD *)v87)
                goto LABEL_224;
              *(_DWORD *)v88 += *(_DWORD *)v87;
              v90 = *(_DWORD *)(v87 + 24);
              if (v90)
              {
                v91 = *(_DWORD *)(v88 + 24);
                v92 = *(_DWORD *)(v87 + 8);
                if (v91)
                {
                  if (v92 < *(_DWORD *)(v88 + 8))
                    *(_DWORD *)(v88 + 8) = v92;
                  v93 = *(_DWORD *)(v87 + 12);
                  if (v93 <= *(_DWORD *)(v88 + 12))
                    goto LABEL_169;
                }
                else
                {
                  *(_DWORD *)(v88 + 8) = v92;
                  v93 = *(_DWORD *)(v87 + 12);
                }
                *(_DWORD *)(v88 + 12) = v93;
LABEL_169:
                *(_QWORD *)(v88 + 16) += *(_QWORD *)(v87 + 16);
                *(_DWORD *)(v88 + 24) = v91 + v90;
              }
              v94 = *(_DWORD *)(v87 + 48);
              if (!v94)
                goto LABEL_179;
              v95 = *(_DWORD *)(v88 + 48);
              v96 = *(_DWORD *)(v87 + 32);
              if (v95)
              {
                if (v96 < *(_DWORD *)(v88 + 32))
                  *(_DWORD *)(v88 + 32) = v96;
                v97 = *(_DWORD *)(v87 + 36);
                if (v97 <= *(_DWORD *)(v88 + 36))
                  goto LABEL_178;
              }
              else
              {
                *(_DWORD *)(v88 + 32) = v96;
                v97 = *(_DWORD *)(v87 + 36);
              }
              *(_DWORD *)(v88 + 36) = v97;
LABEL_178:
              *(_QWORD *)(v88 + 40) += *(_QWORD *)(v87 + 40);
              *(_DWORD *)(v88 + 48) = v95 + v94;
LABEL_179:
              v98 = *(_DWORD *)(v87 + 72);
              if (!v98)
                goto LABEL_188;
              v99 = *(_DWORD *)(v88 + 72);
              v100 = *(_DWORD *)(v87 + 56);
              if (v99)
              {
                if (v100 < *(_DWORD *)(v88 + 56))
                  *(_DWORD *)(v88 + 56) = v100;
                v101 = *(_DWORD *)(v87 + 60);
                if (v101 <= *(_DWORD *)(v88 + 60))
                  goto LABEL_187;
              }
              else
              {
                *(_DWORD *)(v88 + 56) = v100;
                v101 = *(_DWORD *)(v87 + 60);
              }
              *(_DWORD *)(v88 + 60) = v101;
LABEL_187:
              *(_QWORD *)(v88 + 64) += *(_QWORD *)(v87 + 64);
              *(_DWORD *)(v88 + 72) = v99 + v98;
LABEL_188:
              v102 = *(_DWORD *)(v87 + 96);
              if (!v102)
                goto LABEL_197;
              v103 = *(_DWORD *)(v88 + 96);
              v104 = *(_DWORD *)(v87 + 80);
              if (v103)
              {
                if (v104 < *(_DWORD *)(v88 + 80))
                  *(_DWORD *)(v88 + 80) = v104;
                v105 = *(_DWORD *)(v87 + 84);
                if (v105 <= *(_DWORD *)(v88 + 84))
                  goto LABEL_196;
              }
              else
              {
                *(_DWORD *)(v88 + 80) = v104;
                v105 = *(_DWORD *)(v87 + 84);
              }
              *(_DWORD *)(v88 + 84) = v105;
LABEL_196:
              *(_QWORD *)(v88 + 88) += *(_QWORD *)(v87 + 88);
              *(_DWORD *)(v88 + 96) = v103 + v102;
LABEL_197:
              v106 = *(_DWORD *)(v87 + 120);
              if (!v106)
                goto LABEL_206;
              v107 = *(_DWORD *)(v88 + 120);
              v108 = *(_DWORD *)(v87 + 104);
              if (v107)
              {
                if (v108 < *(_DWORD *)(v88 + 104))
                  *(_DWORD *)(v88 + 104) = v108;
                v109 = *(_DWORD *)(v87 + 108);
                if (v109 <= *(_DWORD *)(v88 + 108))
                  goto LABEL_205;
              }
              else
              {
                *(_DWORD *)(v88 + 104) = v108;
                v109 = *(_DWORD *)(v87 + 108);
              }
              *(_DWORD *)(v88 + 108) = v109;
LABEL_205:
              *(_QWORD *)(v88 + 112) += *(_QWORD *)(v87 + 112);
              *(_DWORD *)(v88 + 120) = v107 + v106;
LABEL_206:
              v110 = *(_DWORD *)(v87 + 144);
              if (!v110)
                goto LABEL_215;
              v111 = *(_DWORD *)(v88 + 144);
              v112 = *(_DWORD *)(v87 + 128);
              if (v111)
              {
                if (v112 < *(_DWORD *)(v88 + 128))
                  *(_DWORD *)(v88 + 128) = v112;
                v113 = *(_DWORD *)(v87 + 132);
                if (v113 <= *(_DWORD *)(v88 + 132))
                  goto LABEL_214;
              }
              else
              {
                *(_DWORD *)(v88 + 128) = v112;
                v113 = *(_DWORD *)(v87 + 132);
              }
              *(_DWORD *)(v88 + 132) = v113;
LABEL_214:
              *(_QWORD *)(v88 + 136) += *(_QWORD *)(v87 + 136);
              *(_DWORD *)(v88 + 144) = v111 + v110;
LABEL_215:
              v114 = *(_DWORD *)(v87 + 168);
              if (v114)
              {
                v115 = *(_DWORD *)(v88 + 168);
                v116 = *(_DWORD *)(v87 + 152);
                if (v115)
                {
                  if (v116 < *(_DWORD *)(v88 + 152))
                    *(_DWORD *)(v88 + 152) = v116;
                  v117 = *(_DWORD *)(v87 + 156);
                  if (v117 <= *(_DWORD *)(v88 + 156))
                    goto LABEL_223;
                }
                else
                {
                  *(_DWORD *)(v88 + 152) = v116;
                  v117 = *(_DWORD *)(v87 + 156);
                }
                *(_DWORD *)(v88 + 156) = v117;
LABEL_223:
                *(_QWORD *)(v88 + 160) += *(_QWORD *)(v87 + 160);
                *(_DWORD *)(v88 + 168) = v115 + v114;
              }
LABEL_224:
              v85 = 0;
              v84 = 1;
            }
            while ((v86 & 1) != 0);
          }
        }
      }
    }
    next = (_QWORD *)*v261;
  }
  while (*v261);
LABEL_230:
  cbDraws = self->cbDraws;
  if (!(_DWORD)cbDraws)
    goto LABEL_239;
  commandBufferDrawCallDistribution = self->_telemetryDevice->commandBufferDrawCallDistribution;
  if (!commandBufferDrawCallDistribution->count)
  {
    commandBufferDrawCallDistribution->max = cbDraws;
    commandBufferDrawCallDistribution = self->_telemetryDevice->commandBufferDrawCallDistribution;
LABEL_237:
    commandBufferDrawCallDistribution->min = cbDraws;
    goto LABEL_238;
  }
  if (cbDraws > commandBufferDrawCallDistribution->max)
  {
    commandBufferDrawCallDistribution->max = cbDraws;
    commandBufferDrawCallDistribution = self->_telemetryDevice->commandBufferDrawCallDistribution;
  }
  if (cbDraws < commandBufferDrawCallDistribution->min)
    goto LABEL_237;
LABEL_238:
  self->_telemetryDevice->commandBufferDrawCallDistribution->total += cbDraws;
  ++self->_telemetryDevice->commandBufferDrawCallDistribution->count;
LABEL_239:
  renderEncoderDrawCallDistribution = self->renderEncoderDrawCallDistribution;
  v121 = renderEncoderDrawCallDistribution->count;
  if (v121)
  {
    v122 = self->_telemetryDevice->renderEncoderDrawCallDistribution;
    v123 = renderEncoderDrawCallDistribution->min;
    if (v122->count)
    {
      if (v123 < v122->min)
      {
        v122->min = v123;
        v122 = self->_telemetryDevice->renderEncoderDrawCallDistribution;
      }
      v124 = renderEncoderDrawCallDistribution->max;
      if (v124 > v122->max)
        v122->max = v124;
    }
    else
    {
      v122->min = v123;
      self->_telemetryDevice->renderEncoderDrawCallDistribution->max = renderEncoderDrawCallDistribution->max;
    }
    self->_telemetryDevice->renderEncoderDrawCallDistribution->total += renderEncoderDrawCallDistribution->total;
    self->_telemetryDevice->renderEncoderDrawCallDistribution->count += v121;
  }
  cbDispatches = self->cbDispatches;
  if ((_DWORD)cbDispatches)
  {
    commandBufferDispatchDistribution = self->_telemetryDevice->commandBufferDispatchDistribution;
    if (commandBufferDispatchDistribution->count)
    {
      if (cbDispatches > commandBufferDispatchDistribution->max)
      {
        commandBufferDispatchDistribution->max = cbDispatches;
        commandBufferDispatchDistribution = self->_telemetryDevice->commandBufferDispatchDistribution;
      }
      if (cbDispatches >= commandBufferDispatchDistribution->min)
      {
LABEL_255:
        self->_telemetryDevice->commandBufferDispatchDistribution->total += cbDispatches;
        ++self->_telemetryDevice->commandBufferDispatchDistribution->count;
        goto LABEL_256;
      }
    }
    else
    {
      commandBufferDispatchDistribution->max = cbDispatches;
      commandBufferDispatchDistribution = self->_telemetryDevice->commandBufferDispatchDistribution;
    }
    commandBufferDispatchDistribution->min = cbDispatches;
    goto LABEL_255;
  }
LABEL_256:
  computeEncoderDispatchDistribution = self->computeEncoderDispatchDistribution;
  v128 = computeEncoderDispatchDistribution->count;
  if (v128)
  {
    v129 = self->_telemetryDevice->computeEncoderDispatchDistribution;
    v130 = computeEncoderDispatchDistribution->min;
    if (v129->count)
    {
      if (v130 < v129->min)
      {
        v129->min = v130;
        v129 = self->_telemetryDevice->computeEncoderDispatchDistribution;
      }
      v131 = computeEncoderDispatchDistribution->max;
      if (v131 > v129->max)
        v129->max = v131;
    }
    else
    {
      v129->min = v130;
      self->_telemetryDevice->computeEncoderDispatchDistribution->max = computeEncoderDispatchDistribution->max;
    }
    self->_telemetryDevice->computeEncoderDispatchDistribution->total += computeEncoderDispatchDistribution->total;
    self->_telemetryDevice->computeEncoderDispatchDistribution->count += v128;
  }
  cbBlits = self->cbBlits;
  if ((_DWORD)cbBlits)
  {
    commandBufferBlitDistribution = self->_telemetryDevice->commandBufferBlitDistribution;
    if (commandBufferBlitDistribution->count)
    {
      if (cbBlits > commandBufferBlitDistribution->max)
      {
        commandBufferBlitDistribution->max = cbBlits;
        commandBufferBlitDistribution = self->_telemetryDevice->commandBufferBlitDistribution;
      }
      if (cbBlits >= commandBufferBlitDistribution->min)
      {
LABEL_272:
        self->_telemetryDevice->commandBufferBlitDistribution->total += cbBlits;
        ++self->_telemetryDevice->commandBufferBlitDistribution->count;
        goto LABEL_273;
      }
    }
    else
    {
      commandBufferBlitDistribution->max = cbBlits;
      commandBufferBlitDistribution = self->_telemetryDevice->commandBufferBlitDistribution;
    }
    commandBufferBlitDistribution->min = cbBlits;
    goto LABEL_272;
  }
LABEL_273:
  blitEncoderBlitDistribution = self->blitEncoderBlitDistribution;
  v135 = blitEncoderBlitDistribution->count;
  if (v135)
  {
    v136 = self->_telemetryDevice->blitEncoderBlitDistribution;
    v137 = blitEncoderBlitDistribution->min;
    if (v136->count)
    {
      if (v137 < v136->min)
      {
        v136->min = v137;
        v136 = self->_telemetryDevice->blitEncoderBlitDistribution;
      }
      v138 = blitEncoderBlitDistribution->max;
      if (v138 > v136->max)
        v136->max = v138;
    }
    else
    {
      v136->min = v137;
      self->_telemetryDevice->blitEncoderBlitDistribution->max = blitEncoderBlitDistribution->max;
    }
    self->_telemetryDevice->blitEncoderBlitDistribution->total += blitEncoderBlitDistribution->total;
    self->_telemetryDevice->blitEncoderBlitDistribution->count += v135;
  }
  cbMemoryBarriers = self->cbMemoryBarriers;
  if ((_DWORD)cbMemoryBarriers)
  {
    commandBufferMemoryBarrierDistribution = self->_telemetryDevice->commandBufferMemoryBarrierDistribution;
    if (commandBufferMemoryBarrierDistribution->count)
    {
      if (cbMemoryBarriers > commandBufferMemoryBarrierDistribution->max)
      {
        commandBufferMemoryBarrierDistribution->max = cbMemoryBarriers;
        commandBufferMemoryBarrierDistribution = self->_telemetryDevice->commandBufferMemoryBarrierDistribution;
      }
      if (cbMemoryBarriers >= commandBufferMemoryBarrierDistribution->min)
      {
LABEL_289:
        self->_telemetryDevice->commandBufferMemoryBarrierDistribution->total += cbMemoryBarriers;
        ++self->_telemetryDevice->commandBufferMemoryBarrierDistribution->count;
        goto LABEL_290;
      }
    }
    else
    {
      commandBufferMemoryBarrierDistribution->max = cbMemoryBarriers;
      commandBufferMemoryBarrierDistribution = self->_telemetryDevice->commandBufferMemoryBarrierDistribution;
    }
    commandBufferMemoryBarrierDistribution->min = cbMemoryBarriers;
    goto LABEL_289;
  }
LABEL_290:
  v141 = 0;
  v142 = 0;
  drawDistribution = self->drawDistribution;
  while (2)
  {
    v144 = 0;
    v145 = drawDistribution;
    v146 = v141;
    while (2)
    {
      v147 = 0;
      while (2)
      {
        v148 = v145->var0[0][0][v147 / 0x38].var0;
        if (v148)
        {
          v149 = (char *)self->_telemetryDevice->drawDistribution + v146;
          *(_DWORD *)&v149[v147] += v148;
          v150 = (char *)v145 + v147;
          v151 = v145->var0[0][0][v147 / 0x38].var1.count;
          if (v151)
          {
            v152 = self->_telemetryDevice->drawDistribution;
            v153 = (char *)v152 + v146 + v147;
            v154 = *((_DWORD *)v150 + 2);
            if (*((_DWORD *)v153 + 6))
            {
              if (v154 < *((_DWORD *)v153 + 2))
              {
                *((_DWORD *)v153 + 2) = v154;
                v152 = self->_telemetryDevice->drawDistribution;
              }
              v155 = v145->var0[0][0][v147 / 0x38].var1.max;
              v156 = (char *)v152 + v146 + v147;
              if (v155 > *((_DWORD *)v156 + 3))
                *((_DWORD *)v156 + 3) = v155;
            }
            else
            {
              *((_DWORD *)v153 + 2) = v154;
              *(unsigned int *)((char *)&self->_telemetryDevice->drawDistribution->var0[0][0][0].var1.max + v146 + v147) = v145->var0[0][0][v147 / 0x38].var1.max;
            }
            v157 = (char *)self->_telemetryDevice->drawDistribution + v146 + v147;
            *((_QWORD *)v157 + 2) += v145->var0[0][0][v147 / 0x38].var1.total;
            v158 = (char *)self->_telemetryDevice->drawDistribution + v146 + v147;
            *((_DWORD *)v158 + 6) += v151;
          }
          v159 = *((_DWORD *)v150 + 12);
          if (v159)
          {
            v160 = self->_telemetryDevice->drawDistribution;
            v161 = (char *)v160 + v146 + v147;
            v162 = v145->var0[0][0][v147 / 0x38].var2.min;
            if (*((_DWORD *)v161 + 12))
            {
              if (v162 < *((_DWORD *)v161 + 8))
              {
                *((_DWORD *)v161 + 8) = v162;
                v160 = self->_telemetryDevice->drawDistribution;
              }
              v163 = v145->var0[0][0][v147 / 0x38].var2.max;
              v164 = (char *)v160 + v146 + v147;
              if (v163 <= *((_DWORD *)v164 + 9))
              {
LABEL_310:
                v165 = (char *)self->_telemetryDevice->drawDistribution + v146 + v147;
                *((_QWORD *)v165 + 5) += v145->var0[0][0][v147 / 0x38].var2.total;
                v166 = (char *)self->_telemetryDevice->drawDistribution + v146 + v147;
                *((_DWORD *)v166 + 12) += v159;
                goto LABEL_311;
              }
            }
            else
            {
              *((_DWORD *)v161 + 8) = v162;
              v163 = v145->var0[0][0][v147 / 0x38].var2.max;
              v164 = (char *)self->_telemetryDevice->drawDistribution + v146 + v147;
            }
            *((_DWORD *)v164 + 9) = v163;
            goto LABEL_310;
          }
        }
LABEL_311:
        v147 += 56;
        if (v147 != 168)
          continue;
        break;
      }
      ++v144;
      v146 += 168;
      v145 = (MTLTelemetryDrawDistributionRec *)((char *)v145 + 168);
      if (v144 != 3)
        continue;
      break;
    }
    ++v142;
    v141 += 504;
    drawDistribution = (MTLTelemetryDrawDistributionRec *)((char *)drawDistribution + 504);
    if (v142 != 5)
      continue;
    break;
  }
  dispatchDistribution = self->dispatchDistribution;
  if (dispatchDistribution->var0)
  {
    self->_telemetryDevice->dispatchDistribution->var0 += dispatchDistribution->var0;
    v168 = dispatchDistribution->var1.count;
    if (v168)
    {
      v169 = self->_telemetryDevice->dispatchDistribution;
      v170 = dispatchDistribution->var1.min;
      if (v169->var1.count)
      {
        if (v170 < v169->var1.min)
        {
          v169->var1.min = v170;
          v169 = self->_telemetryDevice->dispatchDistribution;
        }
        v171 = dispatchDistribution->var1.max;
        if (v171 > v169->var1.max)
          v169->var1.max = v171;
      }
      else
      {
        v169->var1.min = v170;
        self->_telemetryDevice->dispatchDistribution->var1.max = dispatchDistribution->var1.max;
      }
      self->_telemetryDevice->dispatchDistribution->var1.total += dispatchDistribution->var1.total;
      self->_telemetryDevice->dispatchDistribution->var1.count += v168;
    }
    v172 = dispatchDistribution->var2.count;
    if (v172)
    {
      v173 = self->_telemetryDevice->dispatchDistribution;
      v174 = dispatchDistribution->var2.min;
      if (v173->var2.count)
      {
        if (v174 < v173->var2.min)
        {
          v173->var2.min = v174;
          v173 = self->_telemetryDevice->dispatchDistribution;
        }
        v175 = dispatchDistribution->var2.max;
        if (v175 > v173->var2.max)
          v173->var2.max = v175;
      }
      else
      {
        v173->var2.min = v174;
        self->_telemetryDevice->dispatchDistribution->var2.max = dispatchDistribution->var2.max;
      }
      self->_telemetryDevice->dispatchDistribution->var2.total += dispatchDistribution->var2.total;
      self->_telemetryDevice->dispatchDistribution->var2.count += v172;
    }
    v176 = dispatchDistribution->var3.count;
    if (v176)
    {
      v177 = self->_telemetryDevice->dispatchDistribution;
      v178 = dispatchDistribution->var3.min;
      if (v177->var3.count)
      {
        if (v178 < v177->var3.min)
        {
          v177->var3.min = v178;
          v177 = self->_telemetryDevice->dispatchDistribution;
        }
        v179 = dispatchDistribution->var3.max;
        if (v179 > v177->var3.max)
          v177->var3.max = v179;
      }
      else
      {
        v177->var3.min = v178;
        self->_telemetryDevice->dispatchDistribution->var3.max = dispatchDistribution->var3.max;
      }
      self->_telemetryDevice->dispatchDistribution->var3.total += dispatchDistribution->var3.total;
      self->_telemetryDevice->dispatchDistribution->var3.count += v176;
    }
    v180 = dispatchDistribution->var4.count;
    if (v180)
    {
      v181 = self->_telemetryDevice->dispatchDistribution;
      v182 = dispatchDistribution->var4.min;
      if (v181->var4.count)
      {
        if (v182 < v181->var4.min)
        {
          v181->var4.min = v182;
          v181 = self->_telemetryDevice->dispatchDistribution;
        }
        v183 = dispatchDistribution->var4.max;
        if (v183 > v181->var4.max)
          v181->var4.max = v183;
      }
      else
      {
        v181->var4.min = v182;
        self->_telemetryDevice->dispatchDistribution->var4.max = dispatchDistribution->var4.max;
      }
      self->_telemetryDevice->dispatchDistribution->var4.total += dispatchDistribution->var4.total;
      self->_telemetryDevice->dispatchDistribution->var4.count += v180;
    }
    v184 = dispatchDistribution->var5.count;
    if (v184)
    {
      v185 = self->_telemetryDevice->dispatchDistribution;
      v186 = dispatchDistribution->var5.min;
      if (v185->var5.count)
      {
        if (v186 < v185->var5.min)
        {
          v185->var5.min = v186;
          v185 = self->_telemetryDevice->dispatchDistribution;
        }
        v187 = dispatchDistribution->var5.max;
        if (v187 > v185->var5.max)
          v185->var5.max = v187;
      }
      else
      {
        v185->var5.min = v186;
        self->_telemetryDevice->dispatchDistribution->var5.max = dispatchDistribution->var5.max;
      }
      self->_telemetryDevice->dispatchDistribution->var5.total += dispatchDistribution->var5.total;
      self->_telemetryDevice->dispatchDistribution->var5.count += v184;
    }
    v188 = dispatchDistribution->var6.count;
    if (v188)
    {
      v189 = self->_telemetryDevice->dispatchDistribution;
      v190 = dispatchDistribution->var6.min;
      if (v189->var6.count)
      {
        if (v190 < v189->var6.min)
        {
          v189->var6.min = v190;
          v189 = self->_telemetryDevice->dispatchDistribution;
        }
        v191 = dispatchDistribution->var6.max;
        if (v191 > v189->var6.max)
          v189->var6.max = v191;
      }
      else
      {
        v189->var6.min = v190;
        self->_telemetryDevice->dispatchDistribution->var6.max = dispatchDistribution->var6.max;
      }
      self->_telemetryDevice->dispatchDistribution->var6.total += dispatchDistribution->var6.total;
      self->_telemetryDevice->dispatchDistribution->var6.count += v188;
    }
    v192 = dispatchDistribution->var7.count;
    if (v192)
    {
      v193 = self->_telemetryDevice->dispatchDistribution;
      v194 = dispatchDistribution->var7.min;
      if (v193->var7.count)
      {
        if (v194 < v193->var7.min)
        {
          v193->var7.min = v194;
          v193 = self->_telemetryDevice->dispatchDistribution;
        }
        v195 = dispatchDistribution->var7.max;
        if (v195 > v193->var7.max)
          v193->var7.max = v195;
      }
      else
      {
        v193->var7.min = v194;
        self->_telemetryDevice->dispatchDistribution->var7.max = dispatchDistribution->var7.max;
      }
      self->_telemetryDevice->dispatchDistribution->var7.total += dispatchDistribution->var7.total;
      self->_telemetryDevice->dispatchDistribution->var7.count += v192;
    }
    v196 = dispatchDistribution->var8.count;
    if (v196)
    {
      v197 = self->_telemetryDevice->dispatchDistribution;
      v198 = dispatchDistribution->var8.min;
      if (v197->var8.count)
      {
        if (v198 < v197->var8.min)
        {
          v197->var8.min = v198;
          v197 = self->_telemetryDevice->dispatchDistribution;
        }
        v199 = dispatchDistribution->var8.max;
        if (v199 > v197->var8.max)
          v197->var8.max = v199;
      }
      else
      {
        v197->var8.min = v198;
        self->_telemetryDevice->dispatchDistribution->var8.max = dispatchDistribution->var8.max;
      }
      self->_telemetryDevice->dispatchDistribution->var8.total += dispatchDistribution->var8.total;
      self->_telemetryDevice->dispatchDistribution->var8.count += v196;
    }
    v200 = dispatchDistribution->var9.count;
    if (v200)
    {
      v201 = self->_telemetryDevice->dispatchDistribution;
      v202 = dispatchDistribution->var9.min;
      if (v201->var9.count)
      {
        if (v202 < v201->var9.min)
        {
          v201->var9.min = v202;
          v201 = self->_telemetryDevice->dispatchDistribution;
        }
        v203 = dispatchDistribution->var9.max;
        if (v203 > v201->var9.max)
          v201->var9.max = v203;
      }
      else
      {
        v201->var9.min = v202;
        self->_telemetryDevice->dispatchDistribution->var9.max = dispatchDistribution->var9.max;
      }
      self->_telemetryDevice->dispatchDistribution->var9.total += dispatchDistribution->var9.total;
      self->_telemetryDevice->dispatchDistribution->var9.count += v200;
    }
    v204 = dispatchDistribution->var10.count;
    if (v204)
    {
      v205 = self->_telemetryDevice->dispatchDistribution;
      v206 = dispatchDistribution->var10.min;
      if (v205->var10.count)
      {
        if (v206 < v205->var10.min)
        {
          v205->var10.min = v206;
          v205 = self->_telemetryDevice->dispatchDistribution;
        }
        v207 = dispatchDistribution->var10.max;
        if (v207 > v205->var10.max)
          v205->var10.max = v207;
      }
      else
      {
        v205->var10.min = v206;
        self->_telemetryDevice->dispatchDistribution->var10.max = dispatchDistribution->var10.max;
      }
      self->_telemetryDevice->dispatchDistribution->var10.total += dispatchDistribution->var10.total;
      self->_telemetryDevice->dispatchDistribution->var10.count += v204;
    }
  }
  v208 = self->blitMap.__table_.__p1_.__value_.__next_;
  if (v208)
  {
LABEL_396:
    p_blitMap = &self->_telemetryDevice->blitMap;
    *(_QWORD *)&v262.pbAlloc = v208 + 2;
    v210 = std::__hash_table<std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::__unordered_map_hasher<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::hash<unsigned long long>,std::equal_to<MTLPixelFormat>,true>,std::__unordered_map_equal<MTLPixelFormat,std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>,std::equal_to<MTLPixelFormat>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<MTLPixelFormat,MTLTelemetryBlitDistribution>>>::__emplace_unique_key_args<MTLPixelFormat,std::piecewise_construct_t const&,std::tuple<MTLPixelFormat const&>,std::tuple<>>((uint64_t)p_blitMap, v208 + 2, (uint64_t)&std::piecewise_construct, &v262);
    v211 = 0;
    v212 = v208;
    while (1)
    {
      v213 = 0;
      v214 = v212;
      v215 = v210;
      do
      {
        for (n = 0; n != 39; n += 13)
        {
          v217 = v214[n + 3];
          if (!v217)
            continue;
          v218 = &v215[n];
          LODWORD(v215[n + 3]) += v217;
          v219 = v214[n + 6];
          if (v219)
          {
            v220 = *((_DWORD *)v218 + 12);
            v221 = v214[n + 4];
            if (v220)
            {
              if (v221 < *((_DWORD *)v218 + 8))
                *((_DWORD *)v218 + 8) = v221;
              v222 = HIDWORD(v214[n + 4]);
              v223 = &v215[n];
              if (v222 <= HIDWORD(v215[n + 4]))
                goto LABEL_408;
            }
            else
            {
              *((_DWORD *)v218 + 8) = v221;
              v222 = HIDWORD(v214[n + 4]);
              v223 = &v215[n];
            }
            *((_DWORD *)v223 + 9) = v222;
LABEL_408:
            v215[n + 5] += v214[n + 5];
            *((_DWORD *)v218 + 12) = v220 + v219;
          }
          v224 = &v214[n];
          v225 = v214[n + 9];
          if (v225)
          {
            v226 = &v215[n];
            v227 = v215[n + 9];
            v228 = *((_DWORD *)v224 + 14);
            if (v227)
            {
              if (v228 < v226[14])
                v226[14] = v228;
              v229 = HIDWORD(v214[n + 7]);
              if (v229 > HIDWORD(v215[n + 7]))
                HIDWORD(v215[n + 7]) = v229;
            }
            else
            {
              v226[14] = v228;
              v226[15] = HIDWORD(v214[n + 7]);
            }
            v215[n + 8] += v214[n + 8];
            v226[18] = v227 + v225;
          }
          v230 = *((_DWORD *)v224 + 24);
          if (v230)
          {
            v231 = &v215[n];
            v232 = v215[n + 12];
            v233 = v214[n + 10];
            if (v232)
            {
              if (v233 < v231[20])
                v231[20] = v233;
              v234 = HIDWORD(v214[n + 10]);
              if (v234 > HIDWORD(v215[n + 10]))
                HIDWORD(v215[n + 10]) = v234;
            }
            else
            {
              v231[20] = v233;
              v231[21] = HIDWORD(v214[n + 10]);
            }
            v215[n + 11] += v214[n + 11];
            v231[24] = v232 + v230;
          }
          v235 = v214[n + 15];
          if (v235)
          {
            v236 = &v215[n];
            v237 = v215[n + 15];
            v238 = v214[n + 13];
            if (v237)
            {
              if (v238 < v236[26])
                v236[26] = v238;
              v239 = HIDWORD(v214[n + 13]);
              if (v239 > HIDWORD(v215[n + 13]))
                HIDWORD(v215[n + 13]) = v239;
            }
            else
            {
              v236[26] = v238;
              v236[27] = HIDWORD(v214[n + 13]);
            }
            v215[n + 14] += v214[n + 14];
            v236[30] = v237 + v235;
          }
        }
        ++v213;
        v215 += 39;
        v214 += 39;
      }
      while (v213 != 3);
      ++v211;
      v210 += 117;
      v212 += 117;
      if (v211 == 6)
      {
        v208 = (_QWORD *)*v208;
        if (!v208)
          break;
        goto LABEL_396;
      }
    }
  }
  depthClipModeClampCount = self->depthClipModeClampCount;
  if ((_DWORD)depthClipModeClampCount)
  {
    depthClipModeClampDistribution = self->_telemetryDevice->depthClipModeClampDistribution;
    if (depthClipModeClampDistribution->count)
    {
      if (depthClipModeClampCount > depthClipModeClampDistribution->max)
      {
        depthClipModeClampDistribution->max = depthClipModeClampCount;
        depthClipModeClampDistribution = self->_telemetryDevice->depthClipModeClampDistribution;
      }
      if (depthClipModeClampCount >= depthClipModeClampDistribution->min)
        goto LABEL_445;
    }
    else
    {
      depthClipModeClampDistribution->max = depthClipModeClampCount;
      depthClipModeClampDistribution = self->_telemetryDevice->depthClipModeClampDistribution;
    }
    depthClipModeClampDistribution->min = depthClipModeClampCount;
LABEL_445:
    self->_telemetryDevice->depthClipModeClampDistribution->total += depthClipModeClampCount;
    ++self->_telemetryDevice->depthClipModeClampDistribution->count;
  }
  getKernelTelemetryState(&v262);
  pbAlloc = self->_initKernelState.pbAlloc;
  v243 = v262.pbAlloc - pbAlloc;
  if (v262.pbAlloc == pbAlloc)
    goto LABEL_455;
  kernelDistribution = self->_telemetryDevice->kernelDistribution;
  if (kernelDistribution->var0.var3)
  {
    if (v243 > kernelDistribution->var0.var1)
    {
      kernelDistribution->var0.var1 = v243;
      kernelDistribution = self->_telemetryDevice->kernelDistribution;
    }
    if (v243 >= kernelDistribution->var0.var0)
      goto LABEL_454;
  }
  else
  {
    kernelDistribution->var0.var1 = v243;
    kernelDistribution = self->_telemetryDevice->kernelDistribution;
  }
  kernelDistribution->var0.var0 = v243;
LABEL_454:
  self->_telemetryDevice->kernelDistribution->var0.var2 += v243;
  ++self->_telemetryDevice->kernelDistribution->var0.var3;
LABEL_455:
  v245 = v262.spmRenderCount - (uint64_t)self->_initKernelState.spmRenderCount;
  v246 = self->_telemetryDevice->kernelDistribution;
  if (!v246->var1.var3)
  {
    v246->var1.var1 = v245;
    v247 = &self->_telemetryDevice->kernelDistribution->var1;
LABEL_461:
    v247->var0 = v245;
    goto LABEL_462;
  }
  if ((int)v245 > v246->var1.var1)
  {
    v246->var1.var1 = v245;
    v246 = self->_telemetryDevice->kernelDistribution;
  }
  v248 = v246->var1.var0;
  v247 = &v246->var1;
  if ((int)v245 < v248)
    goto LABEL_461;
LABEL_462:
  self->_telemetryDevice->kernelDistribution->var1.var2 += v245;
  ++self->_telemetryDevice->kernelDistribution->var1.var3;
  tiledSceneBytes = self->_initKernelState.tiledSceneBytes;
  v250 = v262.tiledSceneBytes - tiledSceneBytes;
  if (v262.tiledSceneBytes == tiledSceneBytes)
    goto LABEL_471;
  v251 = self->_telemetryDevice->kernelDistribution;
  if (v251->var2.var3)
  {
    if (v250 > v251->var2.var1)
    {
      v251->var2.var1 = v250;
      v251 = self->_telemetryDevice->kernelDistribution;
    }
    v253 = v251->var2.var0;
    v252 = &v251->var2;
    if (v250 >= v253)
      goto LABEL_470;
  }
  else
  {
    v251->var2.var1 = v250;
    v252 = &self->_telemetryDevice->kernelDistribution->var2;
  }
  v252->var0 = v250;
LABEL_470:
  self->_telemetryDevice->kernelDistribution->var2.var2 += v250;
  ++self->_telemetryDevice->kernelDistribution->var2.var3;
LABEL_471:
  v254 = v262.renderCount - self->_initKernelState.renderCount;
  if (v254)
  {
    v255 = self->_telemetryDevice->kernelDistribution;
    if (v255->var3.var3)
    {
      if (v254 > v255->var3.var1)
      {
        v255->var3.var1 = v254;
        v255 = self->_telemetryDevice->kernelDistribution;
      }
      v257 = v255->var3.var0;
      v256 = &v255->var3;
      if (v254 >= v257)
        goto LABEL_479;
    }
    else
    {
      v255->var3.var1 = v254;
      v256 = &self->_telemetryDevice->kernelDistribution->var3;
    }
    v256->var0 = v254;
LABEL_479:
    self->_telemetryDevice->kernelDistribution->var3.var2 += v254;
    ++self->_telemetryDevice->kernelDistribution->var3.var3;
  }
  v258 = 0;
  anisoClippedCounts = self->anisoClippedCounts;
  do
  {
    self->_telemetryDevice->anisoClippedCounts->var0[v258] += anisoClippedCounts->var0[v258];
    ++v258;
  }
  while (v258 != 4);
}

- (void)postCompletionHandlers
{
  unsigned __int8 v3;
  NSObject *queue;
  objc_super v5;
  _QWORD block[5];

  if (-[MTLTelemetryDevice enableTelemetry](self->_telemetryDevice, "enableTelemetry"))
  {
    if ((v3 & 1) == 0
    {
      -[MTLTelemetryCommandBuffer postCompletionHandlers]::forceEmit = (uint64_t)getenv("MTL_TELEMETRY_EMIT_ON_COMMIT");
    }
    queue = self->_telemetryDevice->queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__MTLTelemetryCommandBuffer_postCompletionHandlers__block_invoke;
    block[3] = &unk_24F795440;
    block[4] = self;
    dispatch_sync(queue, block);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLTelemetryCommandBuffer;
  -[MTLToolsCommandBuffer postCompletionHandlers](&v5, sel_postCompletionHandlers);
}

uint64_t __51__MTLTelemetryCommandBuffer_postCompletionHandlers__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "mergeDistributions");
  if (-[MTLTelemetryCommandBuffer postCompletionHandlers]::forceEmit)
  {
    if (*(_BYTE *)-[MTLTelemetryCommandBuffer postCompletionHandlers]::forceEmit == 49)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "emitTelemetry");
  }
  return result;
}

- (id)blitCommandEncoder
{
  id result;
  MTLTelemetryBlitCommandEncoder *v4;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (result)
  {
    v4 = -[MTLTelemetryBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLTelemetryBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", result, self, 0);
    ++self->encoderCount->var1;
    return v4;
  }
  return result;
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id result;
  MTLTelemetryRenderCommandEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:"));
  if (result)
  {
    v6 = -[MTLTelemetryRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLTelemetryRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", result, self, a3);
    ++self->encoderCount->var0;
    return v6;
  }
  return result;
}

- (id)computeCommandEncoder
{
  id result;
  MTLTelemetryComputeCommandEncoder *v4;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (result)
  {
    v4 = -[MTLTelemetryComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLTelemetryComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", result, self, 0);
    ++self->encoderCount->var2;
    return v4;
  }
  return result;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  id result;
  MTLTelemetryComputeCommandEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:"));
  if (result)
  {
    v6 = -[MTLTelemetryComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLTelemetryComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", result, self, a3);
    ++self->encoderCount->var2;
    return v6;
  }
  return result;
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  id result;
  MTLTelemetryBlitCommandEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLBlitPassDescriptor:](self, "unwrapMTLBlitPassDescriptor:"));
  if (result)
  {
    v6 = -[MTLTelemetryBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLTelemetryBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", result, self, a3);
    ++self->encoderCount->var1;
    return v6;
  }
  return result;
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  id result;
  MTLTelemetryParallelRenderCommandEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:"));
  if (result)
  {
    v6 = -[MTLTelemetryParallelRenderCommandEncoder initWithBaseRenderPass:commandBuffer:descriptor:]([MTLTelemetryParallelRenderCommandEncoder alloc], "initWithBaseRenderPass:commandBuffer:descriptor:", result, self, a3);
    ++self->encoderCount->var3;
    return v6;
  }
  return result;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->blitMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->renderTargetMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_DWORD *)self + 72) = 1065353216;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_DWORD *)self + 82) = 1065353216;
  return self;
}

@end
