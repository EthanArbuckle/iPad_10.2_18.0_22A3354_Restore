@implementation PKMetalRenderer

void __33__PKMetalRenderer_useBlitEncoder__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  _MergedGlobals_135 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PKUseBlitEncoder"));

}

- (BOOL)shouldRenderDebugColorForStroke:(uint64_t)a1
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if (objc_msgSend(v3, "_isSynthesizedInk"))
    v4 = *(_BYTE *)(a1 + 928) != 0;
  else
    v4 = 0;

  return v4;
}

- (id)colorForStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (-[PKMetalRenderer shouldRenderDebugColorForStroke:](a1, v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "ink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __59__PKMetalRenderer_disableClearOriginalBackbufferWorkaround__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.PencilKit"));
  byte_1ECEE6279 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PKDisableClearOriginalBackbufferWorkaround"));

}

- (id)initWithDrawingPixelSize:(void *)a3 actualSize:(char)a4 device:(void *)a5 resourceHandler:(double)a6 sixChannelBlending:(double)a7 pixelFormat:(double)a8
{
  id v18;
  id v19;
  id *v20;
  id *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  _QWORD *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  id v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  int v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v45;
  __int128 v46;
  objc_super v47;

  v18 = a2;
  v19 = a3;
  if (a1)
  {
    v47.receiver = a1;
    v47.super_class = (Class)PKMetalRenderer;
    v20 = (id *)objc_msgSendSuper2(&v47, sel_init);
    v21 = v20;
    a1 = v20;
    if (v20)
    {
      v20[121] = (id)0x3FF0000000000000;
      objc_storeStrong(v20 + 3, a2);
      *((_BYTE *)a1 + 714) = a4;
      *((_BYTE *)a1 + 935) = 0;
      a1[125] = (id)0x3FF0000000000000;
      *((_OWORD *)a1 + 5) = 0u;
      *((_OWORD *)a1 + 6) = 0u;
      *((_BYTE *)a1 + 713) = 1;
      v22 = (_QWORD *)operator new();
      *v22 = 0;
      v22[1] = 0;
      v22[2] = 0;
      std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)(v21 + 74), &v46);
      v23 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
      if (*((_QWORD *)&v46 + 1))
      {
        v24 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
        do
          v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      v26 = (_QWORD *)operator new();
      *v26 = 0;
      v26[1] = 0;
      v26[2] = 0;
      std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::shared_ptr[abi:ne180100]<std::vector<PKMetalSDFStrokeVertex>,void>(&v46, (uint64_t)v26);
      std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100]((uint64_t)(v21 + 76), &v46);
      v27 = (std::__shared_weak_count *)*((_QWORD *)&v46 + 1);
      if (*((_QWORD *)&v46 + 1))
      {
        v28 = (unint64_t *)(*((_QWORD *)&v46 + 1) + 8);
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      std::vector<PKMetalSDFStrokeVertex>::resize((char **)v21[76]);
      objc_msgSend(v18, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Intel HD Graphics 4000"));

      if (v31)
        *((_WORD *)a1 + 356) = 1;
      v32 = objc_msgSend(v21[3], "newCommandQueue");
      v33 = a1[4];
      a1[4] = (id)v32;

      objc_msgSend(a1[4], "setBackgroundGPUPriority:", 2);
      v34 = v21 + 24;
      objc_storeStrong(v21 + 24, a3);
      v35 = (uint64_t)a1[24];
      if (!v35)
      {
        +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v18);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = *v34;
        *v34 = (void *)v36;

        v35 = (uint64_t)*v34;
      }
      *((_WORD *)v21 + 394) = 0;
      *((_DWORD *)v21 + 196) = ((v35 != 0) << 16) | ((v35 != 0) << 25) | ((v35 != 0) << 8) | (2 * (v35 != 0));
      if (a5 == (void *)10)
      {
        *((_BYTE *)a1 + 784) = 1;
        *((_BYTE *)a1 + 787) = 1;
      }
      if (v35)
      {
        if (*(_BYTE *)(v35 + 429))
          v38 = 3;
        else
          v38 = 2;
        v39 = 1;
      }
      else
      {
        v38 = 0;
        v39 = 0;
      }
      *((_WORD *)v21 + 397) = 0;
      *(_DWORD *)((char *)v21 + 790) = (v38 << 24) | (v39 << 16) | (v39 << 8) | v38;
      -[PKMetalResourceHandler reloadParticleTexturesIfNecessaryCommandQueue:](v35, a1[4]);
      a1[118] = a5;
      a1[59] = a5;
      a1[60] = (id)10;
      *((double *)a1 + 28) = a6;
      *((double *)a1 + 29) = a7;
      v40 = MEMORY[0x1E0C9BAA8];
      v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *((_OWORD *)a1 + 17) = *MEMORY[0x1E0C9BAA8];
      *((_OWORD *)a1 + 18) = v41;
      v42 = *MEMORY[0x1E0C9D628];
      v43 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *((_OWORD *)a1 + 19) = *(_OWORD *)(v40 + 32);
      *((_OWORD *)a1 + 20) = v42;
      *((_OWORD *)a1 + 21) = v43;
      *(_OWORD *)(v21 + 83) = v42;
      *(_OWORD *)(v21 + 85) = v43;
      a1[88] = (id)4;
      *((double *)a1 + 31) = a8;
      *((double *)a1 + 32) = a9;
      *((double *)a1 + 33) = a6 / a8;
      if (os_variant_has_internal_diagnostics())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)a1 + 928) = objc_msgSend(v45, "BOOLForKey:", CFSTR("internalSettings.drawing.debugColorForSynthesizedStrokes"));

      }
    }
  }

  return a1;
}

- (void)dealloc
{
  CGColor *backgroundColor;
  CGColor *liveRenderingOverrideColor;
  objc_super v5;

  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    CGColorRelease(backgroundColor);
  liveRenderingOverrideColor = self->_liveRenderingOverrideColor;
  if (liveRenderingOverrideColor)
    CGColorRelease(liveRenderingOverrideColor);
  v5.receiver = self;
  v5.super_class = (Class)PKMetalRenderer;
  -[PKMetalRenderer dealloc](&v5, sel_dealloc);
}

- (BOOL)generateBSplineInComputeForStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 932))
  {
    objc_msgSend(v3, "ink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "_isFountainPenInkV2");

      if ((v9 & 1) != 0)
      {
        v5 = 1;
        goto LABEL_3;
      }
    }
    if (*(_BYTE *)(a1 + 713) && (unint64_t)objc_msgSend(v4, "_pointsCount") >= 0x20)
    {
      objc_msgSend(v4, "ink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "behavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "renderingDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v12, "type") == 0;

      goto LABEL_3;
    }
  }
  v5 = 0;
LABEL_3:

  return v5;
}

- (void)flushMemoryIfPossible
{
  void *v2;

  if (a1)
  {
    -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLRUCache removeAllObjects]((uint64_t)v2);

    -[PKMetalResourceHandler deallocateReusableBuffers](*(_QWORD *)(a1 + 192));
    if (!*(_QWORD *)(a1 + 8))
      -[PKMetalRenderer teardownDrawingFramebuffers]((_QWORD *)a1);
  }
}

- (void)teardownDrawingFramebuffers
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[22];
    a1[22] = 0;

    v3 = (void *)a1[23];
    a1[23] = 0;

  }
}

- (BOOL)setViewScissor:(CGFloat)a3
{
  CGFloat v8;
  CGFloat *v9;
  CGRect v10;
  CGRect v11;

  if (result)
  {
    v8 = a2;
    v9 = (CGFloat *)result;
    result = CGRectIsNull(*(CGRect *)&a2);
    if (!result)
    {
      v11.size.width = v9[28];
      v11.size.height = v9[29];
      v11.origin.x = 0.0;
      v11.origin.y = 0.0;
      v10.origin.x = v8;
      v10.origin.y = a3;
      v10.size.width = a4;
      v10.size.height = a5;
      result = CGRectEqualToRect(v10, v11);
      if (result)
      {
        v8 = *MEMORY[0x1E0C9D628];
        a3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        a4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        a5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      }
    }
    v9[40] = v8;
    v9[41] = a3;
    v9[42] = a4;
    v9[43] = a5;
  }
  return result;
}

- (uint64_t)renderZoomFactorForStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  objc_msgSend(v3, "ink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "renderingDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");

  if (!v8)
    v9 = (uint64_t)fmax(round(*(double *)(a1 + 968)), 1.0);
  else
LABEL_3:
    v9 = 1;

  return v9;
}

- (void)drawingBeganWithStroke:(int)a3 forPreview:
{
  PKStroke *v6;
  PKStroke *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _anonymous_namespace_::AnimatingStroke *v19;
  unint64_t v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  _anonymous_namespace_::AnimatingStroke *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  __int128 v43;
  char *v44;
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
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  char *v59;
  char *v60;
  _OWORD *v61;
  _OWORD *v62;
  _OWORD *v63;
  _OWORD *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 *v67;
  __int128 v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _anonymous_namespace_::AnimatingStroke *v84;
  uint64_t v85;
  double v86;
  void (***v87)(_QWORD, void *, _QWORD, double);
  void *v88;
  PKMetalUnpurgeableStrokeRenderCache *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  PKStroke *v96;
  void *v97;
  void *v98;
  void *v99;
  id *v100;
  void *v101;
  _QWORD *v102;
  _QWORD *v103;
  id *v104;
  void *v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  std::__shared_weak_count *v114;
  unint64_t *p_shared_owners;
  unint64_t v116;
  std::__shared_weak_count *v117;
  unint64_t *v118;
  unint64_t v119;
  void *v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  void **v123;
  std::__shared_weak_count *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint8_t buf[16];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[2];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[30];
  uint64_t v145;
  __int128 v146;
  _OWORD v147[2];
  __int128 v148;

  v6 = a2;
  v7 = v6;
  if (a1)
  {
    -[PKStroke _renderMask](v6, "_renderMask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a1 + 352) = 0;
    if (*(_BYTE *)(a1 + 936))
    {
      v9 = *(void **)(a1 + 648);
      if (v9)
      {
        objc_msgSend(v9, "_renderGroupID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStroke _renderGroupID](v7, "_renderGroupID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
        {
          -[PKMetalRenderer purgePaintFramebuffers](a1);
          *(_BYTE *)(a1 + 121) = 1;
          *(_BYTE *)(a1 + 153) = 1;
          *(_BYTE *)(a1 + 137) = 1;
          *(_BYTE *)(a1 + 169) = 1;
          v13 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
          *(_OWORD *)(a1 + 680) = v13;
          v14 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Clearing paint framebuffers to switching to a new render group.", buf, 2u);
          }

        }
      }
    }
    objc_storeStrong((id *)(a1 + 648), a2);
    v15 = *(void **)(a1 + 656);
    *(_QWORD *)(a1 + 656) = 0;

    v16 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v7);
    v17 = (_QWORD *)operator new();
    *v17 = 0;
    v17[1] = 0;
    v17[2] = 0;
    v18 = (_QWORD *)operator new();
    *v18 = 0;
    v18[1] = 0;
    v18[2] = 0;
    std::shared_ptr<std::vector<PKMetalSDFStrokeVertex>>::shared_ptr[abi:ne180100]<std::vector<PKMetalSDFStrokeVertex>,void>(&v121, (uint64_t)v18);
    v19 = *(_anonymous_namespace_::AnimatingStroke **)(a1 + 632);
    v20 = *(_QWORD *)(a1 + 640);
    if ((unint64_t)v19 >= v20)
    {
      v38 = *(_anonymous_namespace_::AnimatingStroke **)(a1 + 624);
      v39 = 0x4FA4FA4FA4FA4FA5 * ((v19 - v38) >> 3) + 1;
      if (v39 > 0xB60B60B60B60B6)
        std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
      v40 = 0x4FA4FA4FA4FA4FA5 * ((uint64_t)(v20 - (_QWORD)v38) >> 3);
      if (2 * v40 > v39)
        v39 = 2 * v40;
      if (v40 >= 0x5B05B05B05B05BLL)
        v41 = 0xB60B60B60B60B6;
      else
        v41 = v39;
      if (v41 > 0xB60B60B60B60B6)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v42 = (char *)operator new(360 * v41);
      v43 = v129;
      v44 = &v42[8 * ((v19 - v38) >> 3)];
      *(_OWORD *)v44 = *(_OWORD *)buf;
      *((_OWORD *)v44 + 1) = v43;
      *(_OWORD *)buf = 0u;
      v129 = 0u;
      v45 = v131;
      *((_OWORD *)v44 + 2) = v130;
      *((_OWORD *)v44 + 3) = v45;
      v130 = 0u;
      v131 = 0u;
      *((_QWORD *)v44 + 8) = v132[0];
      *(_DWORD *)(v44 + 71) = *(_DWORD *)((char *)v132 + 7);
      v46 = v133;
      v47 = v134;
      v133 = 0u;
      v134 = 0u;
      *((_OWORD *)v44 + 5) = v46;
      *((_OWORD *)v44 + 6) = v47;
      v48 = v136;
      *((_OWORD *)v44 + 7) = v135;
      *((_OWORD *)v44 + 8) = v48;
      v49 = v137;
      v50 = v138;
      v51 = v140;
      *((_OWORD *)v44 + 11) = v139;
      *((_OWORD *)v44 + 12) = v51;
      *((_OWORD *)v44 + 9) = v49;
      *((_OWORD *)v44 + 10) = v50;
      v52 = v141;
      v53 = v142;
      *(_OWORD *)(v44 + 270) = *(_OWORD *)&v144[14];
      v54 = *(_OWORD *)v144;
      *((_OWORD *)v44 + 15) = v143;
      *((_OWORD *)v44 + 16) = v54;
      *((_OWORD *)v44 + 13) = v52;
      *((_OWORD *)v44 + 14) = v53;
      v55 = v145;
      v145 = 0;
      *((_QWORD *)v44 + 36) = v55;
      v56 = v147[0];
      *(_OWORD *)(v44 + 296) = v146;
      *(_OWORD *)(v44 + 312) = v56;
      *(_OWORD *)(v44 + 323) = *(_OWORD *)((char *)v147 + 11);
      v57 = v148;
      v148 = 0u;
      *(_OWORD *)(v44 + 344) = v57;
      if (v19 == v38)
      {
        v37 = v44 + 360;
        *(_QWORD *)(a1 + 624) = v44;
        *(_QWORD *)(a1 + 632) = v44 + 360;
        *(_QWORD *)(a1 + 640) = &v42[360 * v41];
      }
      else
      {
        v58 = 0;
        do
        {
          v59 = &v44[v58];
          v60 = (char *)v19 + v58;
          v61 = (_OWORD *)((char *)v19 + v58 - 360);
          *(_OWORD *)&v44[v58 - 360] = *v61;
          *v61 = 0uLL;
          v62 = (_OWORD *)((char *)v19 + v58 - 344);
          *(_OWORD *)&v44[v58 - 344] = *v62;
          *v62 = 0uLL;
          v63 = (_OWORD *)((char *)v19 + v58 - 328);
          *(_OWORD *)&v44[v58 - 328] = *v63;
          *v63 = 0uLL;
          v64 = (_OWORD *)((char *)v19 + v58 - 312);
          *(_OWORD *)&v44[v58 - 312] = *v64;
          v65 = (uint64_t)&v44[v58 - 296];
          *v64 = 0uLL;
          v66 = *(_QWORD *)((char *)v19 + v58 - 296);
          *(_DWORD *)(v65 + 7) = *(_DWORD *)((char *)v19 + v58 - 289);
          *(_QWORD *)v65 = v66;
          v67 = (__int128 *)((char *)v19 + v58 - 280);
          v68 = *v67;
          *v67 = 0uLL;
          *(_OWORD *)&v44[v58 - 280] = v68;
          v69 = (uint64_t *)((char *)v19 + v58 - 264);
          v70 = *v69;
          *v69 = 0;
          *(_QWORD *)&v44[v58 - 264] = v70;
          v71 = *(_QWORD *)((char *)v19 + v58 - 256);
          *((_QWORD *)v60 - 32) = 0;
          *((_QWORD *)v59 - 32) = v71;
          v72 = *(_OWORD *)((char *)v19 + v58 - 248);
          v73 = *(_OWORD *)((char *)v19 + v58 - 232);
          *(_OWORD *)(v59 - 216) = *(_OWORD *)((char *)v19 + v58 - 216);
          *(_OWORD *)(v59 - 232) = v73;
          *(_OWORD *)(v59 - 248) = v72;
          v74 = *(_OWORD *)((char *)v19 + v58 - 200);
          v75 = *(_OWORD *)((char *)v19 + v58 - 184);
          v76 = *(_OWORD *)((char *)v19 + v58 - 168);
          *(_OWORD *)(v59 - 152) = *(_OWORD *)((char *)v19 + v58 - 152);
          *(_OWORD *)(v59 - 168) = v76;
          *(_OWORD *)(v59 - 184) = v75;
          *(_OWORD *)(v59 - 200) = v74;
          v77 = *(_OWORD *)((char *)v19 + v58 - 136);
          v78 = *(_OWORD *)((char *)v19 + v58 - 120);
          v79 = *(_OWORD *)((char *)v19 + v58 - 104);
          *(_OWORD *)(v59 - 90) = *(_OWORD *)((char *)v19 + v58 - 90);
          *(_OWORD *)(v59 - 104) = v79;
          *(_OWORD *)(v59 - 120) = v78;
          *(_OWORD *)(v59 - 136) = v77;
          v80 = *(_QWORD *)((char *)v19 + v58 - 72);
          *((_QWORD *)v60 - 9) = 0;
          *((_QWORD *)v59 - 9) = v80;
          v81 = *(_OWORD *)((char *)v19 + v58 - 64);
          v82 = *(_OWORD *)((char *)v19 + v58 - 48);
          *(_OWORD *)(v59 - 37) = *(_OWORD *)((char *)v19 + v58 - 37);
          *((_OWORD *)v59 - 4) = v81;
          *((_OWORD *)v59 - 3) = v82;
          v83 = *(_OWORD *)((char *)v19 + v58 - 16);
          *((_OWORD *)v60 - 1) = 0uLL;
          *((_OWORD *)v59 - 1) = v83;
          v58 -= 360;
        }
        while ((_anonymous_namespace_::AnimatingStroke *)((char *)v19 + v58) != v38);
        v19 = *(_anonymous_namespace_::AnimatingStroke **)(a1 + 624);
        v84 = *(_anonymous_namespace_::AnimatingStroke **)(a1 + 632);
        v37 = v44 + 360;
        *(_QWORD *)(a1 + 624) = &v44[v58];
        *(_QWORD *)(a1 + 632) = v44 + 360;
        *(_QWORD *)(a1 + 640) = &v42[360 * v41];
        while (v84 != v19)
        {
          v84 = (_anonymous_namespace_::AnimatingStroke *)((char *)v84 - 360);
        }
      }
      if (v19)
        operator delete(v19);
    }
    else
    {
      *(_OWORD *)v19 = *(_OWORD *)buf;
      *((_OWORD *)v19 + 1) = v129;
      *(_OWORD *)buf = 0u;
      v129 = 0u;
      *((_OWORD *)v19 + 2) = v130;
      *((_OWORD *)v19 + 3) = v131;
      v130 = 0u;
      v131 = 0u;
      v21 = *(_DWORD *)((char *)v132 + 7);
      *((_QWORD *)v19 + 8) = v132[0];
      *(_DWORD *)((char *)v19 + 71) = v21;
      v22 = v133;
      v133 = 0u;
      *((_OWORD *)v19 + 5) = v22;
      v23 = v134;
      *(_QWORD *)&v134 = 0;
      *((_QWORD *)v19 + 12) = v23;
      v24 = *((_QWORD *)&v134 + 1);
      *((_QWORD *)&v134 + 1) = 0;
      *((_QWORD *)v19 + 13) = v24;
      v25 = v135;
      v26 = v137;
      *((_OWORD *)v19 + 8) = v136;
      *((_OWORD *)v19 + 9) = v26;
      *((_OWORD *)v19 + 7) = v25;
      v27 = v138;
      v28 = v139;
      v29 = v141;
      *((_OWORD *)v19 + 12) = v140;
      *((_OWORD *)v19 + 13) = v29;
      *((_OWORD *)v19 + 10) = v27;
      *((_OWORD *)v19 + 11) = v28;
      v30 = v142;
      v31 = v143;
      v32 = *(_OWORD *)v144;
      *(_OWORD *)((char *)v19 + 270) = *(_OWORD *)&v144[14];
      *((_OWORD *)v19 + 15) = v31;
      *((_OWORD *)v19 + 16) = v32;
      *((_OWORD *)v19 + 14) = v30;
      v33 = v145;
      v145 = 0;
      *((_QWORD *)v19 + 36) = v33;
      v34 = v146;
      v35 = v147[0];
      *(_OWORD *)((char *)v19 + 323) = *(_OWORD *)((char *)v147 + 11);
      *(_OWORD *)((char *)v19 + 296) = v34;
      *(_OWORD *)((char *)v19 + 312) = v35;
      v36 = v148;
      v148 = 0u;
      *(_OWORD *)((char *)v19 + 344) = v36;
      v37 = (char *)v19 + 360;
    }
    *(_QWORD *)(a1 + 632) = v37;
    v85 = *(_QWORD *)(a1 + 632);
    if (a3)
    {
      *(_BYTE *)(v85 - 23) = 1;
      v86 = *(double *)(a1 + 1008);
      if (v86 == 0.0)
        v86 = 2.0;
      *(_QWORD *)(v85 - 48) = (unint64_t)v86;
    }
    *(_BYTE *)(v85 - 75) = v8 != 0;
    *(_BYTE *)(v85 - 22) = *(_BYTE *)(a1 + 936);
    v87 = *(void (****)(_QWORD, void *, _QWORD, double))(v85 - 264);
    objc_msgSend(*(id *)(v85 - 280), "ink");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    (**v87)(v87, v88, 0, 1.0);

    v89 = [PKMetalUnpurgeableStrokeRenderCache alloc];
    -[PKStroke ink](v7, "ink");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[PKMetalUnpurgeableStrokeRenderCache initWithInk:renderZoomFactor:](v89, "initWithInk:renderZoomFactor:", v90, v16);
    v92 = *(void **)(v85 - 16);
    *(_QWORD *)(v85 - 16) = v91;

    v93 = *(_QWORD *)(a1 + 8);
    if (v93)
      -[PKMetalRenderState extendLifetimeUntilCompleted:](v93, *(void **)(*(_QWORD *)(a1 + 632) - 16));
    if (v8)
    {
      objc_msgSend(v8, "renderCache");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stroke");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v120;
      v96 = v94;
      objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "colorAttachments");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "objectAtIndexedSubscript:", 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v99, "setLoadAction:", 2);
      objc_msgSend(v99, "setStoreAction:", 1);
      if (!*(_QWORD *)(a1 + 176))
      {
        v100 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 480), *(void **)(a1 + 24), 0, 0, (void *)1, 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
        v101 = *(void **)(a1 + 176);
        *(_QWORD *)(a1 + 176) = v100;

        v102 = *(_QWORD **)(a1 + 176);
        if (v102)
          v102 = (_QWORD *)v102[3];
        v103 = v102;
        objc_msgSend(v103, "setLabel:", CFSTR("Paint Mask"));

      }
      if (*(_QWORD *)(a1 + 704) < 2uLL)
      {
        objc_msgSend(v99, "setStoreAction:", 1);
        v110 = *(_QWORD **)(a1 + 176);
        if (v110)
          v110 = (_QWORD *)v110[3];
        v109 = v110;
        objc_msgSend(v99, "setTexture:", v109);
      }
      else
      {
        if (!*(_QWORD *)(a1 + 184))
        {
          v104 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 480), *(void **)(a1 + 24), 1, 0, *(void **)(a1 + 704), 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
          v105 = *(void **)(a1 + 184);
          *(_QWORD *)(a1 + 184) = v104;

        }
        objc_msgSend(v99, "setStoreAction:", 2);
        v106 = *(_QWORD **)(a1 + 184);
        if (v106)
          v106 = (_QWORD *)v106[3];
        v107 = v106;
        objc_msgSend(v99, "setTexture:", v107);

        v108 = *(_QWORD **)(a1 + 176);
        if (v108)
          v108 = (_QWORD *)v108[3];
        v109 = v108;
        objc_msgSend(v99, "setResolveTexture:", v109);
      }

      objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "renderCommandEncoderWithDescriptor:", v97);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v96);
      v144[28] = 1;
      if (v96)
      {
        -[PKStroke _transform](v96, "_transform");
      }
      else
      {
        v126 = 0u;
        v127 = 0u;
        v125 = 0u;
      }
      v135 = v125;
      v136 = v126;
      v137 = v127;
      -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v95, v112, (uint64_t)buf, 0);
      objc_msgSend(v112, "endEncoding");
      objc_msgSend(v111, "commit");

    }
    v114 = v122;
    if (v122)
    {
      p_shared_owners = (unint64_t *)&v122->__shared_owners_;
      do
        v116 = __ldaxr(p_shared_owners);
      while (__stlxr(v116 - 1, p_shared_owners));
      if (!v116)
      {
        ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
        std::__shared_weak_count::__release_weak(v114);
      }
    }
    v117 = v124;
    if (v124)
    {
      v118 = (unint64_t *)&v124->__shared_owners_;
      do
        v119 = __ldaxr(v118);
      while (__stlxr(v119 - 1, v118));
      if (!v119)
      {
        ((void (*)(std::__shared_weak_count *))v117->__on_zero_shared)(v117);
        std::__shared_weak_count::__release_weak(v117);
      }
    }

  }
}

- (void)getAndRenderNewPoints:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    if (v5)
    {
      v3 = *(_QWORD *)(a1 + 632);
      if (*(_QWORD *)(a1 + 624) != v3)
      {
        if (*(_BYTE *)(v3 - 184))
        {
          kdebug_trace();
          kdebug_trace();
        }
      }
    }
    v4 = *(_QWORD *)(a1 + 632);
    if (*(_QWORD *)(a1 + 624) == v4 || !*(_BYTE *)(v4 - 23))
    {
      kdebug_trace();
      CACurrentMediaTime();
      -[PKMetalRenderer drawNewPointsAt:drawCount:](a1, 1);
      kdebug_trace();
    }
  }

}

- (void)drawingEnded:(void *)a3 finishStrokeBlock:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(_QWORD *)(a1 + 632);
    v8 = *(_QWORD *)(a1 + 624);
    if (v7 == v8)
    {
      if (v5)
        (*((void (**)(id))v5 + 2))(v5);
    }
    else
    {
      while (!*(_BYTE *)(v8 + 176))
      {
        v8 += 360;
        if (v8 == v7)
          goto LABEL_9;
      }
      v9 = v12;
      *(_BYTE *)(v8 + 176) = 0;
      (*(void (**)(_QWORD))(**(_QWORD **)(v8 + 96) + 8))(*(_QWORD *)(v8 + 96));

      v10 = _Block_copy(v6);
      v11 = *(void **)(v8 + 352);
      *(_QWORD *)(v8 + 352) = v10;

    }
  }
LABEL_9:

}

- (void)setAlternativeStrokes:(double)a3 alpha:(double)a4 originalStrokeAlpha:
{
  uint64_t v8;
  id *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  id v23;
  void *v24;
  id v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = x1_0;
  if (!a1)
    goto LABEL_29;
  v8 = *(_QWORD *)(a1 + 632);
  if (*(_QWORD *)(a1 + 624) == v8)
    goto LABEL_29;
  v9 = (id *)(v8 - 72);
  v23 = *(id *)(v8 - 72);
  if (v23)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v23;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "_bounds", v23);
          v14 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v31.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v31.c = v14;
          *(_OWORD *)&v31.tx = *(_OWORD *)(a1 + 304);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v11);
    }

  }
  if (objc_msgSend(*v9, "count", v23) || !objc_msgSend(v25, "count"))
  {
    if (objc_msgSend(v25, "count") || !objc_msgSend(*v9, "count"))
      goto LABEL_19;
    *(_QWORD *)&v15 = *(_QWORD *)(v8 - 84);
    DWORD2(v15) = *(_DWORD *)(v8 - 96);
    HIDWORD(v15) = DWORD2(v15);
  }
  else
  {
    v16 = *(_QWORD *)(v8 - 96);
    *(_QWORD *)&v17 = v16;
    *((_QWORD *)&v17 + 1) = HIDWORD(v16);
    v15 = v17;
    DWORD1(v15) = v17;
    HIDWORD(v15) = *(_DWORD *)(v8 - 88);
  }
  *(_OWORD *)(v8 - 92) = v15;
LABEL_19:
  objc_storeStrong((id *)(v8 - 72), x1_0);
  *(double *)(v8 - 64) = a3;
  *(double *)(v8 - 56) = a4;
  if (v25)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v25;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "_bounds");
          v22 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v26.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v26.c = v22;
          *(_OWORD *)&v26.tx = *(_OWORD *)(a1 + 304);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v19);
    }

  }
LABEL_29:

}

- (void)drawingCancelledForPreview:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  void (**v7)(void);

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 632);
    if (v3 != *(_QWORD *)(a1 + 624))
    {
      if (*(_BYTE *)(v3 - 184))
      {
        v7 = (void (**)(void))_Block_copy(*(const void **)(v3 - 8));
        *(_QWORD *)(a1 + 632) = v5;
        if (v5 == *(_QWORD *)(a1 + 624) && (a2 & 1) == 0)
        {
          -[PKMetalRenderer purgePaintFramebuffers](a1);
          *(_BYTE *)(a1 + 121) = 1;
          *(_BYTE *)(a1 + 153) = 1;
          *(_BYTE *)(a1 + 137) = 1;
          *(_BYTE *)(a1 + 169) = 1;
          v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
          *(_OWORD *)(a1 + 680) = v6;
        }
        if (v7)
          v7[2]();

      }
    }
  }
}

- (void)drawNewPointsAt:(uint64_t)a1 drawCount:(uint64_t)a2
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  unsigned __int8 *v36;
  int v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 632);
    if (v3 != *(_QWORD *)(a1 + 624)
      && *(_QWORD *)(*(_QWORD *)(v3 - 264) + 88) != *(_QWORD *)(*(_QWORD *)(v3 - 264) + 80)
      && *(_BYTE *)(v3 - 184))
    {
      v5 = *(_QWORD **)(a1 + 8);
      if (v5)
        v5 = (_QWORD *)v5[10];
      v47 = v5;
      v6 = *(_QWORD *)(a1 + 632);
      v7 = *(_QWORD *)(v6 - 264);
      if (!*(_BYTE *)(v6 - 23))
        goto LABEL_27;
      objc_msgSend(*(id *)(v6 - 280), "ink");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
      {
        std::vector<_PKStrokePoint>::resize(a1 + 760, 6uLL);
        v10 = 0;
        v11 = *(_QWORD *)(v7 + 88);
        v55 = *(_QWORD *)(v11 - 56);
        v50 = *(_QWORD *)(v11 - 24);
        v12 = *(_QWORD *)(v11 - 88);
        v52 = *(_OWORD *)(v11 - 72);
        v13 = *(double *)(v11 - 48);
        v48 = *(_OWORD *)(v11 - 40);
        v14 = *(_QWORD *)(v11 - 8);
        v15 = fmax(v13, 0.1);
        v16 = *(double *)(v11 - 16) * *(double *)(a1 + 1000);
        v17 = *(double *)(v11 - 80) - v15;
        v18 = v15 / 5.0;
        do
        {
          v19 = *(_QWORD *)(a1 + 760) + v10;
          *(_QWORD *)v19 = v12;
          *(double *)(v19 + 8) = v17;
          *(_OWORD *)(v19 + 16) = v52;
          *(_QWORD *)(v19 + 32) = v55;
          *(double *)(v19 + 40) = v13;
          *(_OWORD *)(v19 + 48) = v48;
          *(_QWORD *)(v19 + 64) = v50;
          v17 = v18 + v17;
          v10 += 88;
          *(double *)(v19 + 72) = v16;
          *(_QWORD *)(v19 + 80) = v14;
        }
        while (v10 != 528);
      }
      else
      {
        v20 = (uint64_t *)(a1 + 760);
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.crayon")))
        {
          std::vector<_PKStrokePoint>::resize(a1 + 760, 2uLL);
          v21 = 0;
          v22 = *(_QWORD *)(v7 + 88);
          v23 = *(_QWORD *)(v22 - 88);
          v53 = *(_OWORD *)(v22 - 72);
          v56 = *(_OWORD *)(v22 - 56);
          v58 = *(_OWORD *)(v22 - 40);
          v59 = *(_QWORD *)(v22 - 24);
          v24 = *(_QWORD *)(v22 - 8);
          v25 = *(_QWORD *)(a1 + 1000);
          v26 = *(double *)(v22 - 80) + -1.0;
          v27 = 1;
          do
          {
            v28 = v27;
            v29 = *v20 + 88 * v21;
            *(_QWORD *)v29 = v23;
            *(double *)(v29 + 8) = v26;
            *(_OWORD *)(v29 + 16) = v53;
            *(_OWORD *)(v29 + 32) = v56;
            *(_OWORD *)(v29 + 48) = v58;
            *(_QWORD *)(v29 + 64) = v59;
            *(_QWORD *)(v29 + 72) = v25;
            *(_QWORD *)(v29 + 80) = v24;
            v26 = v26 + 1.0;
            v21 = 1;
            v27 = 0;
          }
          while ((v28 & 1) != 0);
        }
        else
        {
          std::vector<_PKStrokePoint>::resize(a1 + 760, 2uLL);
          v30 = *(_QWORD *)(v7 + 88);
          v31 = *(_QWORD *)(v30 - 88);
          v32 = *(double *)(v30 - 80);
          v54 = *(_OWORD *)(v30 - 72);
          v57 = *(_QWORD *)(v30 - 56);
          v33 = *(_QWORD *)(v30 - 48);
          v49 = *(_OWORD *)(v30 - 40);
          v51 = *(_QWORD *)(v30 - 24);
          v35 = *(double *)(v30 - 16);
          v34 = *(_QWORD *)(v30 - 8);
          objc_msgSend(v8, "behavior");
          v36 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
          if (!v36)
            goto LABEL_20;
          v37 = v36[9];

          if (v37)
          {
            *(_QWORD *)(a1 + 360) = v31;
            *(double *)(a1 + 368) = v32;
            *(_QWORD *)(a1 + 392) = v57;
            *(_OWORD *)(a1 + 376) = v54;
            *(_QWORD *)(a1 + 400) = v33;
            *(_QWORD *)(a1 + 424) = v51;
            *(_OWORD *)(a1 + 408) = v49;
            *(double *)(a1 + 432) = v35;
            *(_QWORD *)(a1 + 440) = v34;
            *(_BYTE *)(a1 + 352) = 1;
            v38 = *(double *)(a1 + 1000);
            *(double *)(a1 + 992) = v38;
          }
          else
          {
LABEL_20:
            v38 = *(double *)(a1 + 1000);
          }
          v39 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.ink.watercolor"))
              ? *(double *)(a1 + 1000) * 0.25
              : v35 * v38;
          v40 = *v20;
          *(_QWORD *)v40 = v31;
          *(double *)(v40 + 8) = v32;
          *(_OWORD *)(v40 + 16) = v54;
          *(_OWORD *)(v40 + 48) = v49;
          *(_QWORD *)(v40 + 64) = v51;
          *(_QWORD *)(v40 + 32) = v57;
          *(_QWORD *)(v40 + 40) = 0;
          *(double *)(v40 + 72) = v39;
          *(_QWORD *)(v40 + 80) = v34;
          v41 = *v20;
          *(_QWORD *)(v41 + 88) = v31;
          *(double *)(v41 + 96) = v32 + 0.1;
          *(_OWORD *)(v41 + 104) = v54;
          *(_QWORD *)(v41 + 120) = v57;
          *(_QWORD *)(v41 + 128) = 0;
          *(_QWORD *)(v41 + 152) = v51;
          *(_OWORD *)(v41 + 136) = v49;
          *(double *)(v41 + 160) = v39;
          *(_QWORD *)(v41 + 168) = v34;
        }
      }

      if (*(_BYTE *)(v6 - 23))
      {
        v42 = *(_QWORD *)(a1 + 760);
        v43 = (unint64_t *)(a1 + 768);
      }
      else
      {
LABEL_27:
        v44 = *(_QWORD *)(v6 - 192);
        if (v44 <= *(_QWORD *)(v6 - 200))
          v44 = *(_QWORD *)(v6 - 200);
        if (v44 <= 1)
          v44 = 1;
        v42 = *(_QWORD *)(v7 + 80) + 88 * v44 - 88;
        v43 = (unint64_t *)(v7 + 88);
      }
      v45 = *v43;
      *(_QWORD *)(v6 - 296) = *(_QWORD *)(v6 - 32);
      *(_QWORD *)(v6 - 32) = 0;
      -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](a1, v47);
      if (a2 >= 1)
      {
        do
        {
          -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](a1, v42, v45, v6 - 360, v47, 0, 0);
          --a2;
        }
        while (a2);
      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v47);
      v46 = *(_QWORD *)(a1 + 8);
      if (v46)
        objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v46 + 80));
      *(CGRect *)(a1 + 720) = CGRectUnion(*(CGRect *)(a1 + 720), *(CGRect *)(v6 - 176));
      *(CGRect *)(a1 + 664) = CGRectUnion(*(CGRect *)(a1 + 664), *(CGRect *)(v6 - 176));

    }
  }
}

- (void)setupViewScissorClippingIfNecessaryForRenderEncoder:(uint64_t)a1
{
  _QWORD *v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _OWORD v14[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v20;
  CGRect v21;

  v3 = a2;
  if (!CGRectIsNull(*(CGRect *)(a1 + 320)))
  {
    v4 = *(double *)(a1 + 336);
    v5 = *(double *)(a1 + 344);
    v6 = *(double *)(a1 + 232);
    v7 = *(double *)(a1 + 320);
    v20.origin.y = *(CGFloat *)(a1 + 328);
    v20.origin.x = v7;
    v20.size.width = v4;
    v20.size.height = v5;
    v21.origin.y = v6 - CGRectGetMaxY(v20);
    v15 = 0u;
    v16 = 0u;
    v21.origin.x = v7;
    v21.size.width = v4;
    v21.size.height = v5;
    v8 = v16;
    if ((_QWORD)v16)
    {
      v9 = *((_QWORD *)&v16 + 1);
      if (*((_QWORD *)&v16 + 1))
      {
        v14[0] = v15;
        v14[1] = v16;
        objc_msgSend(v3, "setScissorRect:", v14);
        v10 = *(_QWORD **)(a1 + 8);
        if (v10)
          v10 = (_QWORD *)v10[10];
        v11 = v10;

        if (v11 == v3)
        {
          v12 = *(_QWORD *)(a1 + 8);
          if (v12)
          {
            *(_OWORD *)(v12 + 152) = v15;
            *(_QWORD *)(v12 + 168) = v8;
            *(_QWORD *)(v12 + 176) = v9;
            v13 = *(void **)(v12 + 80);
            if (v13)
            {
              v17 = v15;
              v18 = v8;
              v19 = v9;
              objc_msgSend(v13, "setScissorRect:", &v17);
            }
          }
        }
      }
    }
  }

}

- (uint64_t)renderStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5 computeEncoder:(void *)a6 renderCache:(void *)a7
{
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  _BYTE *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  float v38;
  uint64_t v39;
  uint64_t i;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  __int128 v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  id v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  unsigned int v76;
  float v77;
  unsigned int v78;
  float64x2_t v79;
  void *v80;
  float64x2_t v81;
  float64x2_t v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  char v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  _QWORD *v107;
  id v108;
  unint64_t v109;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  void *v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  _QWORD *v127;
  _BOOL4 v128;
  void *v129;
  id v130;
  id v131;
  void *v132;
  id v133;
  id *v134;
  uint64_t v135;
  unint64_t v136;
  id v137;
  unint64_t v138;
  id *v139;
  char *v140;
  id obj;
  id obja;
  id objb;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  _anonymous_namespace_::AnimatingStroke *v150;
  uint64_t v151;
  unint64_t v152;
  int64x2_t v153;
  unint64_t v154;
  int64x2_t v155;
  CGAffineTransform v156;
  CGAffineTransform v157;
  CGAffineTransform v158;
  CGAffineTransform v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  CGAffineTransform v166;
  __int128 v167;
  _BYTE v168[128];
  uint64_t v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;

  v169 = *MEMORY[0x1E0C80C00];
  v131 = a5;
  v130 = a6;
  v13 = a7;
  *(_BYTE *)(a1 + 352) = 0;
  v136 = x1_0;
  v138 = a3;
  v132 = v13;
  v14 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - x1_0) >> 3)) <= 1 && v13 == 0;
  if (v14 && !*(_BYTE *)(a4 + 336))
  {
    v28 = 0;
    goto LABEL_136;
  }
  v15 = *(_QWORD *)(a4 + 248);
  v16 = *(_QWORD *)(a4 + 256);
  v127 = (_QWORD *)(a4 + 268);
  v17 = *(_QWORD *)(a4 + 268);
  v18 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(a4 + 184) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(a4 + 200) = v18;
  objc_msgSend(*(id *)(a4 + 80), "ink");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "behavior");
  v20 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v20 && v20[9])
  {

    if (a3 != x1_0)
    {
      memmove((void *)(a1 + 360), (const void *)(a3 - 88), 0x58uLL);
      *(_BYTE *)(a1 + 352) = 1;
    }
  }
  else
  {

  }
  if (*(_BYTE *)(a4 + 336))
    v21 = 1;
  else
    v21 = *(_BYTE *)(a4 + 72) != 0;
  v128 = v21;
  objc_msgSend(*(id *)(a4 + 80), "ink");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "behavior");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "renderingDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "type");

  if (!v25)
  {
    v32 = objc_opt_class();
    PKDynamicCast(v32, v132);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_class();
    PKDynamicCast(v33, v132);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_class();
    PKDynamicCast(v34, v132);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = (_anonymous_namespace_::AnimatingStroke *)a4;
    v151 = a1;
    if (v129)
    {
      v134 = v129;
      v35 = v131;
      v36 = v130;
      -[PKMetalResourceHandler sdfPenShaderKernelPipelineState](*(_QWORD *)(a1 + 192));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setComputePipelineState:", v37);
      v38 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a4 + 80));
      *(float *)&v154 = v38;
      memset(&v159, 0, sizeof(v159));
      v160 = 0u;
      -[PKMetalSDFPenRenderCache buffers](v134);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
      if (v39)
      {
        v144 = **(_QWORD **)&v159.c;
        do
        {
          v147 = v39;
          for (i = 0; i != v147; ++i)
          {
            if (**(_QWORD **)&v159.c != v144)
              objc_enumerationMutation(obj);
            v41 = *(_QWORD **)(*(_QWORD *)&v159.b + 8 * i);
            v166.a = 0.0;
            if (v41)
              v42 = v41[5];
            else
              v42 = 0;
            v43 = *(_QWORD **)(a1 + 8);
            if (v43)
              v43 = (_QWORD *)v43[7];
            v44 = *(_QWORD *)(a1 + 192);
            v45 = v43;
            v46 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v44, 36 * v42, (uint64_t)&v166, v45);

            v47 = objc_msgSend(v37, "threadExecutionWidth");
            if (v41)
              v48 = v41[6];
            else
              v48 = 0;
            objc_msgSend(v36, "setComputePipelineState:", v37);
            objc_msgSend(v36, "setBytes:length:atIndex:", &v154, 4, 3);
            -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v41);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
              v50 = v41[3];
            else
              v50 = 0;
            objc_msgSend(v36, "setBuffer:offset:atIndex:", v49, v50, 0);

            -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v41);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
              v52 = v41[4];
            else
              v52 = 0;
            objc_msgSend(v36, "setBuffer:offset:atIndex:", v51, v52, 1);

            objc_msgSend(v36, "setBuffer:offset:atIndex:", v46, *(_QWORD *)&v166.a, 2);
            *(_QWORD *)&v158.a = vcvtpd_u64_f64((double)v48 / (double)v47);
            *(int64x2_t *)&v158.b = vdupq_n_s64(1uLL);
            *(_QWORD *)&v157.a = v47;
            *(_OWORD *)&v157.b = *(_OWORD *)&v158.b;
            objc_msgSend(v36, "dispatchThreadgroups:threadsPerThreadgroup:", &v158, &v157);
            -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:](v151, v35, (uint64_t)v150);
            objc_msgSend(v35, "setVertexBuffer:offset:atIndex:", v46, *(_QWORD *)&v166.a, 0);
            if (v41)
            {
              v53 = v41[5];
              v54 = ((3 * v53) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v54 = 0;
              v53 = 0;
            }
            v156.a = 0.0;
            -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(v151 + 192), v53, &v156);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v54, *(_QWORD *)&v156.a, v55, 0);

            a1 = v151;
          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
        }
        while (v39);
      }

      objc_msgSend(*((id *)v150 + 10), "_bounds");
      v56 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v166.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v166.c = v56;
      *(_OWORD *)&v166.tx = *(_OWORD *)(v151 + 304);

      a4 = (uint64_t)v150;
      a1 = v151;
    }
    if (v126)
    {
      v139 = v126;
      v57 = v131;
      v58 = v130;
      v59 = *(_QWORD *)(a1 + 192);
      if (*(_BYTE *)(a1 + 932))
        -[PKMetalResourceHandler paintShaderKernelPipelineStateWithLiveStrokeMode](v59);
      else
        -[PKMetalResourceHandler paintShaderKernelPipelineState](v59);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setComputePipelineState:");
      v160 = 0u;
      memset(&v159, 0, sizeof(v159));
      -[PKMetalSDFPenRenderCache buffers](v139);
      objb = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v101 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
      if (v101)
      {
        v146 = **(_QWORD **)&v159.c;
        do
        {
          v102 = 0;
          do
          {
            if (**(_QWORD **)&v159.c != v146)
              objc_enumerationMutation(objb);
            v103 = *(_QWORD **)(*(_QWORD *)&v159.b + 8 * v102);
            v166.a = 0.0;
            if (v103)
              v104 = v103[5];
            else
              v104 = 0;
            v105 = *(_QWORD **)(v151 + 8);
            if (v105)
              v105 = (_QWORD *)v105[7];
            v106 = *(_QWORD *)(v151 + 192);
            v107 = v105;
            v108 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v106, 20 * v104, (uint64_t)&v166, v107);

            v109 = objc_msgSend(v149, "threadExecutionWidth");
            if (v103)
              v110 = v103[6];
            else
              v110 = 0;
            objc_msgSend(v58, "setComputePipelineState:", v149);
            -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v103);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            if (v103)
              v112 = v103[3];
            else
              v112 = 0;
            objc_msgSend(v58, "setBuffer:offset:atIndex:", v111, v112, 0);

            -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v103);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            if (v103)
              v114 = v103[4];
            else
              v114 = 0;
            objc_msgSend(v58, "setBuffer:offset:atIndex:", v113, v114, 1);

            objc_msgSend(v58, "setBuffer:offset:atIndex:", v108, *(_QWORD *)&v166.a, 2);
            *(_QWORD *)&v158.a = vcvtpd_u64_f64((double)v110 / (double)v109);
            *(int64x2_t *)&v158.b = vdupq_n_s64(1uLL);
            *(_QWORD *)&v157.a = v109;
            *(_OWORD *)&v157.b = *(_OWORD *)&v158.b;
            objc_msgSend(v58, "dispatchThreadgroups:threadsPerThreadgroup:", &v158, &v157);
            -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:](v151, v57, (uint64_t)v150, 1.0);
            objc_msgSend(v57, "setVertexBuffer:offset:atIndex:", v108, *(_QWORD *)&v166.a, 0);
            if (v103)
            {
              v115 = v103[5];
              v116 = ((3 * v115) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v116 = 0;
              v115 = 0;
            }
            v156.a = 0.0;
            -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(v151 + 192), v115, &v156);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v116, *(_QWORD *)&v156.a, v117, 0);
            if (v103)
              v103 = (_QWORD *)v103[5];

            v28 += (uint64_t)v103;
            ++v102;
          }
          while (v101 != v102);
          v118 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v159, v168, 16);
          v101 = v118;
        }
        while (v118);
      }

      objc_msgSend(*((id *)v150 + 10), "_bounds");
      v119 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v166.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v166.c = v119;
      *(_OWORD *)&v166.tx = *(_OWORD *)(v151 + 304);

    }
    else
    {
      if (!v125)
      {
        if (v132)
        {
          v121 = objc_opt_class();
          PKDynamicCast(v121, v132);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v122, v131, a4, 1);

        }
        else
        {
            v123 = -[PKMetalRenderer renderSDFPenStroke:animatingStroke:renderEncoder:]((_OWORD *)a1, v136, v138, a4, v131);
          else
            v123 = -[PKMetalRenderer renderPenStroke:animatingStroke:renderEncoder:]((_OWORD *)a1, v136, v138, a4, v131);
          v28 = v123;
        }
        goto LABEL_131;
      }
      v140 = v125;
      v137 = v131;
      v62 = v130;
      -[PKMetalResourceHandler paintShaderKernelPipelineStateWithLiveStrokeParticles](*(_QWORD *)(a1 + 192));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setComputePipelineState:");
      v167 = 0u;
      memset(&v166, 0, sizeof(v166));
      -[PKMetalSDFPenRenderCache buffers]((id *)v140);
      v133 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v63 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v166, v168, 16);
      if (v63)
      {
        v135 = **(_QWORD **)&v166.c;
        do
        {
          v64 = 0;
          obja = (id)v63;
          do
          {
            if (**(_QWORD **)&v166.c != v135)
              objc_enumerationMutation(v133);
            v65 = *(_QWORD *)(*(_QWORD *)&v166.b + 8 * (_QWORD)v64);
            v165 = 0;
            if (v65)
              v66 = *(_QWORD *)(v65 + 40);
            else
              v66 = 0;
            v67 = *(_QWORD **)(a1 + 8);
            if (v67)
              v67 = (_QWORD *)v67[7];
            v68 = *(_QWORD *)(a1 + 192);
            v69 = v67;
            v70 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v68, 20 * v66, (uint64_t)&v165, v69);

            v71 = objc_msgSend(v148, "threadExecutionWidth");
            if (v65)
              v72 = *(_QWORD *)(v65 + 48);
            else
              v72 = 0;
            objc_msgSend(v62, "setComputePipelineState:", v148);
            v163 = 0u;
            v164 = 0u;
            v161 = 0u;
            v162 = 0u;
            *(_OWORD *)&v159.tx = 0u;
            v160 = 0u;
            LODWORD(v159.a) = 0;
            if (v65)
              v73 = *(_QWORD *)(v65 + 48);
            else
              LODWORD(v73) = 0;
            v145 = v72;
            v74 = *((double *)v140 + 5);
            v75 = *(double *)(v151 + 1016) - *((double *)v140 + 4);
            if (v75 >= v74)
              v75 = *((double *)v140 + 5);
            *(float *)&v76 = v75;
            v77 = v74;
            *(float *)&v159.c = v77;
            v78 = *((_DWORD *)v150 + 67);
            HIDWORD(v159.a) = v73;
            *(_QWORD *)&v159.b = __PAIR64__(v76, v78);
            v79 = 0uLL;
            memset(&v158, 0, sizeof(v158));
            v80 = (void *)*((_QWORD *)v150 + 10);
            if (v80)
            {
              objc_msgSend(v80, "_inkTransform");
              v82 = *(float64x2_t *)&v158.a;
              v81 = *(float64x2_t *)&v158.c;
              v79 = *(float64x2_t *)&v158.tx;
            }
            else
            {
              v81 = 0uLL;
              v82 = 0uLL;
            }
            LODWORD(v159.ty) = 0;
            *(float32x2_t *)&v159.tx = vcvt_f32_f64(v82);
            DWORD2(v160) = 0;
            *(float32x2_t *)&v160 = vcvt_f32_f64(v81);
            DWORD2(v161) = 1065353216;
            *(float32x2_t *)&v161 = vcvt_f32_f64(v79);
            v156 = v158;
            CGAffineTransformInvert(&v157, &v156);
            DWORD2(v162) = 0;
            *(float32x2_t *)&v162 = vcvt_f32_f64(*(float64x2_t *)&v157.a);
            DWORD2(v163) = 0;
            *(float32x2_t *)&v163 = vcvt_f32_f64(*(float64x2_t *)&v157.c);
            DWORD2(v164) = 1065353216;
            *(float32x2_t *)&v164 = vcvt_f32_f64(*(float64x2_t *)&v157.tx);
            objc_msgSend(v62, "setBytes:length:atIndex:", &v159, 128, 0);
            objc_msgSend(v62, "setBuffer:offset:atIndex:", *(_QWORD *)(v151 + 696), 0, 4);
            if (v65)
            {
              v83 = *(id *)(v65 + 24);
              v84 = *(_QWORD *)(v65 + 32);
            }
            else
            {
              v83 = 0;
              v84 = 0;
            }
            objc_msgSend(v62, "setBuffer:offset:atIndex:", v83, v84, 3);

            if (v65)
            {
              v85 = *(id *)(v65 + 8);
              v86 = *(_QWORD *)(v65 + 16);
            }
            else
            {
              v85 = 0;
              v86 = 0;
            }
            objc_msgSend(v62, "setBuffer:offset:atIndex:", v85, v86, 1);

            objc_msgSend(v62, "setBuffer:offset:atIndex:", v70, v165, 2);
            v154 = vcvtpd_u64_f64((double)v145 / (double)v71);
            v155 = vdupq_n_s64(1uLL);
            v152 = v71;
            v153 = v155;
            objc_msgSend(v62, "dispatchThreadgroups:threadsPerThreadgroup:", &v154, &v152);
            -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:](v151, v137, (uint64_t)v150, fmax(fmin((*((float *)&v159.b + 1) - *(float *)&v159.c * 0.5) / (0.0 - *(float *)&v159.c * 0.5), 1.0), 0.0));
            objc_msgSend(v137, "setVertexBuffer:offset:atIndex:", v70, v165, 0);
            if (v65)
            {
              v87 = *(_QWORD *)(v65 + 40);
              v88 = ((3 * v87) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
            }
            else
            {
              v88 = 0;
              v87 = 0;
            }
            v157.a = 0.0;
            -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(v151 + 192), v87, &v157);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v88, *(_QWORD *)&v157.a, v89, 0);
            if (v65)
              v65 = *(_QWORD *)(v65 + 40);

            v28 += v65;
            v64 = (char *)v64 + 1;
            a1 = v151;
          }
          while (obja != v64);
          v90 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v166, v168, 16);
          v63 = v90;
        }
        while (v90);
      }

      objc_msgSend(*((id *)v150 + 10), "_bounds");
      v91 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v159.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v159.c = v91;
      *(_OWORD *)&v159.tx = *(_OWORD *)(v151 + 304);
      v172 = *(CGRect *)(v140 + 48);
      v92 = *(_OWORD *)(v151 + 288);
      *(_OWORD *)&v158.a = *(_OWORD *)(v151 + 272);
      *(_OWORD *)&v158.c = v92;
      *(_OWORD *)&v158.tx = *(_OWORD *)(v151 + 304);

    }
    a4 = (uint64_t)v150;
    a1 = v151;
LABEL_131:

LABEL_132:
    goto LABEL_133;
  }
  v26 = objc_opt_class();
  PKDynamicCast(v26, v132);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = v27;
  if (v27)
  {
    v28 = -[PKMetalRenderer renderParticleRenderCache:renderEncoder:computeEncoder:animatingStroke:secondaryParticles:](a1, v27, v131, v130, (id *)a4, 0);
    objc_msgSend(*(id *)(a4 + 80), "ink");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "behavior");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "secondaryParticleDescriptor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      v28 += -[PKMetalRenderer renderParticleRenderCache:renderEncoder:computeEncoder:animatingStroke:secondaryParticles:](a1, v129, v131, v130, (id *)a4, 1);
    goto LABEL_132;
  }
  if (!v132)
  {
    objc_msgSend(*(id *)(a4 + 80), "ink");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "behavior");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "particleDescriptor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v61, "adjustEndCapParticleAlpha") && !*(_BYTE *)(a4 + 337))
    {
      v124 = *(_QWORD *)(a4 + 168);
      if (v124 <= *(_QWORD *)(a4 + 160))
        v124 = *(_QWORD *)(a4 + 160);
      v95 = v124 == 0;
    }
    else
    {
      v95 = 0;
    }
    if (!objc_msgSend(v61, "adjustEndCapParticleAlpha"))
      goto LABEL_97;
    v96 = *(_BYTE *)(a4 + 337) == 0;
    v97 = v128;
    if (*(_BYTE *)(a4 + 337))
      v97 = 0;
    if (!v97)
      goto LABEL_98;
    if (!*(_BYTE *)(a4 + 176))
      v96 = *(_QWORD *)(*(_QWORD *)(a4 + 96) + 88) == v138;
    else
LABEL_97:
      v96 = 0;
LABEL_98:
    v28 = -[PKMetalRenderer renderParticleStroke:animatingStroke:starts:ends:secondaryParticles:renderEncoder:](a1, v136, v138, a4, v95, v96, 0, v131);
    objc_msgSend(*(id *)(a4 + 80), "ink");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "behavior");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "secondaryParticleDescriptor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
      v28 += -[PKMetalRenderer renderParticleStroke:animatingStroke:starts:ends:secondaryParticles:renderEncoder:](a1, v136, v138, a4, 0, 0, 1, v131);
    goto LABEL_100;
  }
  v60 = objc_opt_class();
  PKDynamicCast(v60, v132);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v61, v131, a4, 1);
LABEL_100:

LABEL_133:
  if (!v128)
  {
    *(_QWORD *)(a4 + 248) = v15;
    *(_QWORD *)(a4 + 256) = v16;
    *v127 = v17;
  }
  *(CGRect *)(a1 + 720) = CGRectUnion(*(CGRect *)(a1 + 720), *(CGRect *)(a4 + 184));
LABEL_136:

  return v28;
}

- (void)disableClippingForRenderEncoder:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v7[32];
  CGSize v8;
  CGRect v9;

  v3 = a2;
  v9.size.width = *(CGFloat *)(a1 + 224);
  v9.size.height = *(CGFloat *)(a1 + 232);
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v8.width = v9.size.width;
  v8.height = v9.size.height;
  objc_msgSend(v3, "setScissorRect:", v7);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
    v4 = (_QWORD *)v4[10];
  v5 = v4;

  if (v5 == v3)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
    {
      *(_OWORD *)(v6 + 168) = 0u;
      *(_OWORD *)(v6 + 152) = 0u;
    }
  }

}

- (uint64_t)applyStrokeSpaceClipRect:(double)a3 strokeTransform:(double)a4
{
  __int128 v7;
  __int128 v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  _OWORD v17[2];
  CGRect v18;
  CGRect v19;

  v7 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v7;
  *(_OWORD *)&v16.tx = a2[2];
  v18 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v16);
  v19 = CGRectIntegral(v18);
  v14 = 0u;
  v15 = 0u;
  v8 = v15;
  if ((_QWORD)v15)
    v9 = *((_QWORD *)&v15 + 1) == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    v11 = *(_QWORD *)(a1 + 8);
    if (v11)
    {
      *(_OWORD *)(v11 + 152) = v14;
      *(_OWORD *)(v11 + 168) = v8;
      v12 = *(void **)(v11 + 80);
      if (v12)
      {
        v17[0] = v14;
        v17[1] = v8;
        objc_msgSend(v12, "setScissorRect:", v17);
      }
    }
  }
  return v10;
}

- (uint64_t)renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6
{
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _OWORD v23[3];
  _OWORD v24[3];

  v15 = a2;
  v16 = a4;
  if (a1
    && (v17 = a3[1],
        v24[0] = *a3,
        v24[1] = v17,
        v24[2] = a3[2],
        -[PKMetalRenderer applyStrokeSpaceClipRect:strokeTransform:](a1, v24, a5, a6, a7, a8)))
  {
    v18 = a3[1];
    v23[0] = *a3;
    v23[1] = v18;
    v23[2] = a3[2];
    v19 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v23, v16, a5, a6, a7, a8);
    v20 = *(_QWORD **)(a1 + 8);
    if (v20)
      v20 = (_QWORD *)v20[10];
    v21 = v20;
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v21);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (uint64_t)_renderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(double)a5 stopBlock:(double)a6
{
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  double v23;
  double v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _QWORD *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  PKStroke *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  BOOL v61;
  __int128 v62;
  _BYTE *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  uint64_t *v76;
  CGRect *v77;
  CGRect *v78;
  unint64_t v79;
  char *v80;
  _QWORD *v81;
  uint64_t v82;
  int v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  CGFloat *v90;
  CGFloat *v91;
  __int128 v92;
  char *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  BOOL v98;
  PKStroke *v99;
  PKMetalRenderMaskRenderCache *v100;
  char *v101;
  void *v102;
  void *v103;
  void *v104;
  char v105;
  void *v106;
  PKStroke *v107;
  PKMetalRenderMaskRenderCache *v108;
  void *v109;
  void *v110;
  PKMetalRenderMaskRenderCache *v111;
  PKStroke *v112;
  void *v113;
  _QWORD *v114;
  BOOL v115;
  void *v116;
  void *v117;
  PKMetalRenderMaskRenderCache *v118;
  PKMetalRenderMaskRenderCache *v119;
  void *v120;
  void *v121;
  void *v122;
  id *v123;
  PKStrokePath *v124;
  PKInk *v125;
  __int128 v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  id v131;
  char v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  char v142;
  void *v143;
  void *v144;
  void *v145;
  char v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  char v152;
  double *v153;
  BOOL v154;
  void *v155;
  BOOL v156;
  _BOOL4 v157;
  unint64_t v158;
  unint64_t v159;
  id v160;
  id v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  char v167;
  void *v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  BOOL v181;
  id v182;
  BOOL v183;
  id v184;
  uint64_t v185;
  unint64_t v186;
  int v187;
  void *v188;
  id v189;
  id v190;
  NSObject *v191;
  int v192;
  __int128 v193;
  NSObject *v194;
  __int128 v195;
  uint64_t v196;
  uint64_t v198;
  double v199;
  int v200;
  unsigned int (**v201)(void);
  void *v202;
  id v203;
  void (**v204)(void);
  void *v205;
  void *v206;
  void (**v207)(void *, PKStroke *);
  _OWORD *v208;
  uint64_t v209;
  void *v210;
  void *v211;
  uint64_t v212;
  id v213;
  id v214;
  _BYTE *v215;
  uint64_t v216;
  uint64_t v217;
  id v218;
  id v219;
  char v220;
  PKStroke *v221;
  float64x2_t v222;
  void *v223;
  uint64_t v224;
  _QWORD v226[2];
  uint64x2_t v227;
  CGAffineTransform v228;
  uint8_t v229[16];
  __int128 v230;
  __int128 v231;
  _QWORD v232[5];
  id v233;
  void (**v234)(void);
  uint64_t *v235;
  CGFloat v236;
  CGFloat v237;
  CGFloat v238;
  CGFloat v239;
  _QWORD aBlock[4];
  id v241;
  id v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t *v245;
  uint64_t v246;
  __n128 (*v247)(uint64_t, uint64_t);
  uint64_t (*v248)();
  const char *v249;
  __int128 v250;
  __int128 v251;
  uint64_t v252;
  uint64_t *v253;
  uint64_t v254;
  __n128 (*v255)(__n128 *, __n128 *);
  void (*v256)(uint64_t);
  const char *v257;
  void *__p;
  void *v259;
  uint64_t v260;
  id *v261;
  CGAffineTransform v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  uint8_t buf[4];
  uint64_t v267;
  __int16 v268;
  uint64_t v269;
  char v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  char v274;
  char v275;
  uint64_t v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;
  CGRect v282;
  CGRect v283;
  CGRect v284;

  v276 = *MEMORY[0x1E0C80C00];
  v214 = a2;
  v201 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = objc_msgSend(v14, "BOOLForKey:", CFSTR("internalSettings.drawing.slowRendering"));

  v15 = a1;
  if (!*(_BYTE *)(a1 + 932))
  {
    v16 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v267 = objc_msgSend(v214, "count");
      _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Metal Render %ld strokes.", buf, 0xCu);
    }

    v15 = a1;
  }
  v17 = *(id *)(v15 + 8);
  v224 = (uint64_t)v17;
  v216 = 0;
  if (!objc_msgSend(v214, "count") || !v17)
    goto LABEL_197;
  *(_QWORD *)(a1 + 16) = 0;
  v18 = *(_OWORD *)(a1 + 288);
  v263 = *(_OWORD *)(a1 + 272);
  v264 = v18;
  v265 = *(_OWORD *)(a1 + 304);
  v20 = a3[1];
  v19 = a3[2];
  *(_OWORD *)(a1 + 272) = *a3;
  *(_OWORD *)(a1 + 288) = v20;
  *(_OWORD *)(a1 + 304) = v19;
  objc_msgSend(v214, "count");
  kdebug_trace();
  v21 = a3[1];
  *(_OWORD *)&v262.a = *a3;
  *(_OWORD *)&v262.c = v21;
  *(_OWORD *)&v262.tx = a3[2];
  v22 = a5;
  *(double *)&v21 = a6;
  v23 = a7;
  v24 = a8;
  v277 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v21 - 8), &v262);
  v278 = CGRectIntegral(v277);
  x = v278.origin.x;
  y = v278.origin.y;
  width = v278.size.width;
  height = v278.size.height;
  v29 = (_QWORD *)operator new();
  *((_BYTE *)v29 + 16) = 0;
  v29[3] = 0x3FF0000000000000;
  *((_OWORD *)v29 + 2) = 0u;
  *((_OWORD *)v29 + 3) = 0u;
  *((_OWORD *)v29 + 4) = 0u;
  *((_OWORD *)v29 + 5) = 0u;
  v29[12] = 0;
  *v29 = &unk_1E7773C78;
  v29[1] = 0;
  *((_DWORD *)v29 + 26) = 0;
  *((_WORD *)v29 + 54) = 1;
  v29[14] = 0;
  *(_OWORD *)(v29 + 15) = xmmword_1BE4FB830;
  v29[17] = 0x4010000000000000;
  v29[18] = 1;
  *((_DWORD *)v29 + 38) = 2;
  v261 = (id *)v29;
  if (*(_BYTE *)(a1 + 932))
    *((_DWORD *)v29 + 26) = 4;
  -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17[42])
  {
    objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setLoadAction:", 2);
    if (*(_QWORD *)(a1 + 704) < 2uLL)
    {
      objc_msgSend(v31, "setStoreAction:", 1);
      v36 = *(_QWORD **)(a1 + 176);
      if (v36)
        v36 = (_QWORD *)v36[3];
      v35 = v36;
      objc_msgSend(v31, "setTexture:", v35);
    }
    else
    {
      objc_msgSend(v31, "setStoreAction:", 2);
      v32 = *(_QWORD **)(a1 + 184);
      if (v32)
        v32 = (_QWORD *)v32[3];
      v33 = v32;
      objc_msgSend(v31, "setTexture:", v33);

      v34 = *(_QWORD **)(a1 + 176);
      if (v34)
        v34 = (_QWORD *)v34[3];
      v35 = v34;
      objc_msgSend(v31, "setResolveTexture:", v35);
    }

    v17 = (_BYTE *)v224;
  }
  else
  {
    v211 = 0;
  }
  v252 = 0;
  v253 = &v252;
  v254 = 0x4812000000;
  v255 = __Block_byref_object_copy__94;
  v256 = __Block_byref_object_dispose__95;
  v257 = "";
  __p = 0;
  v260 = 0;
  v259 = 0;
  v208 = (_OWORD *)(a1 + 272);
  v212 = objc_msgSend(v214, "count");
  if (v212 < 1)
  {
    v216 = 0;
    goto LABEL_187;
  }
  v216 = 0;
  v37 = 0;
  v199 = 0.97;
  while (2)
  {
    v217 = v37;
    objc_msgSend(v214, "objectAtIndexedSubscript:", *(_QWORD *)&v199);
    v38 = (PKStroke *)objc_claimAutoreleasedReturnValue();
    -[PKStroke ink](v38, "ink");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqual:", CFSTR("com.apple.ink.lasso"));

    if (v41)
    {
      v42 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v42, OS_LOG_TYPE_DEBUG, "Should not render any lasso strokes", buf, 2u);
      }

      v43 = v217;
      ++v216;
      v17 = (_BYTE *)v224;
      goto LABEL_184;
    }
    v209 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v38);
    v261[18] = (id)v209;
    -[PKStroke ink](v38, "ink");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "_numPaintFramebuffers");

    if (v45 <= 1)
      v46 = 1;
    else
      v46 = v45;
    v47 = (_BYTE *)v224;
    v48 = *(_QWORD *)(v224 + 144);
    if (v46 != v48)
    {
      -[PKMetalRenderState commitAndPurgeResourceSet:](v224, v202);
      objc_msgSend(v202, "removeAllObjects");
      *(_QWORD *)(v224 + 144) = v46;
      v49 = v253[6];
      if (v253[7] != v49)
        v253[7] = v49;
      if (v46 > v48)
        -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
    }
    if (v217 + 1 >= v212)
    {
      v203 = 0;
    }
    else
    {
      objc_msgSend(v214, "objectAtIndexedSubscript:");
      v203 = (id)objc_claimAutoreleasedReturnValue();

      v47 = (_BYTE *)v224;
    }
    -[PKStroke _renderGroupID](v38, "_renderGroupID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v203, "_renderGroupID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKStroke _renderGroupID](v38, "_renderGroupID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "isEqual:", v52);

      if (v53)
      {
        v54 = v217;
        while (1)
        {
          objc_msgSend(v214, "objectAtIndexedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStroke _renderGroupID](v38, "_renderGroupID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_renderGroupID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v56, "isEqual:", v57);

          if ((v58 & 1) == 0)
          {
            v223 = 0;
            goto LABEL_50;
          }
          objc_msgSend(v55, "_strokeMask");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
            break;
          objc_msgSend(v55, "_renderMask");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v60 == 0;

          if (!v61)
            goto LABEL_49;

          ++v54;
          v47 = (_BYTE *)v224;
          if (v54 >= v212)
            goto LABEL_45;
        }

LABEL_49:
        -[PKStroke _renderGroupID](v38, "_renderGroupID");
        v223 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_50:

      }
      else
      {
        v223 = 0;
      }
      v47 = (_BYTE *)v224;
    }
    else
    {
LABEL_45:
      v223 = 0;
    }
    v47[43] = v223 != 0;
    v47[44] = v223 != 0;
    v244 = 0;
    v245 = &v244;
    v246 = 0x5012000000;
    v247 = __Block_byref_object_copy__80;
    v248 = __Block_byref_object_dispose__81;
    v249 = "";
    v62 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v250 = *MEMORY[0x1E0C9D628];
    v251 = v62;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke;
    aBlock[3] = &unk_1E777B180;
    v63 = v47;
    v241 = v63;
    v213 = v202;
    v242 = v213;
    v243 = &v252;
    v64 = _Block_copy(aBlock);
    v232[0] = MEMORY[0x1E0C809B0];
    v232[1] = 3221225472;
    v232[2] = __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke_2;
    v232[3] = &unk_1E777B1A8;
    v232[4] = a1;
    v235 = &v244;
    v236 = x;
    v237 = y;
    v238 = width;
    v239 = height;
    v215 = v63;
    v233 = v215;
    v204 = v64;
    v234 = v204;
    v207 = (void (**)(void *, PKStroke *))_Block_copy(v232);
    if (v47[43])
    {
      v204[2]();
      v270 = 1;
      *(_BYTE *)(v224 + 45) = 1;
      -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
    }
    v220 = 1;
    while (1)
    {
      if (!v211)
      {
LABEL_68:
        v83 = 0;
        goto LABEL_106;
      }
      -[PKStroke _strokeMask](v38, "_strokeMask");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {

      }
      else
      {
        -[PKStroke _renderMask](v38, "_renderMask");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v66 == 0;

        if (v67)
          goto LABEL_68;
      }
      -[PKStroke _bounds](v38, "_bounds");
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v76 = v253;
      v77 = (CGRect *)v253[6];
      v78 = (CGRect *)v253[7];
      if (v77 != v78)
      {
        while (1)
        {
          v283.origin.x = v69;
          v283.origin.y = v71;
          v283.size.width = v73;
          v283.size.height = v75;
          if (CGRectIntersectsRect(*v77, v283))
            break;
          if (++v77 == v78)
          {
            v76 = v253;
            goto LABEL_63;
          }
        }
LABEL_65:
        v204[2]();
        v76 = v253;
        goto LABEL_66;
      }
LABEL_63:
      if (*(_BYTE *)(a1 + 712) && v76[7] != v76[6])
        goto LABEL_65;
LABEL_66:
      v80 = (char *)v76[7];
      v79 = v76[8];
      if ((unint64_t)v80 >= v79)
      {
        v84 = (char *)v76[6];
        v85 = (v80 - v84) >> 5;
        v86 = v85 + 1;
        v82 = v224;
        if ((unint64_t)(v85 + 1) >> 59)
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v87 = v79 - (_QWORD)v84;
        if (v87 >> 4 > v86)
          v86 = v87 >> 4;
        if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFE0)
          v88 = 0x7FFFFFFFFFFFFFFLL;
        else
          v88 = v86;
        if (v88)
        {
          if (v88 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v89 = (char *)operator new(32 * v88);
          v84 = (char *)v76[6];
          v80 = (char *)v76[7];
          v82 = v224;
        }
        else
        {
          v89 = 0;
        }
        v90 = (CGFloat *)&v89[32 * v85];
        *v90 = v69;
        v90[1] = v71;
        v90[2] = v73;
        v90[3] = v75;
        v91 = v90;
        if (v80 != v84)
        {
          do
          {
            v92 = *((_OWORD *)v80 - 1);
            *((_OWORD *)v91 - 2) = *((_OWORD *)v80 - 2);
            *((_OWORD *)v91 - 1) = v92;
            v91 -= 4;
            v80 -= 32;
          }
          while (v80 != v84);
          v84 = (char *)v76[6];
        }
        v93 = &v89[32 * v88];
        v81 = v90 + 4;
        v76[6] = (uint64_t)v91;
        v76[7] = (uint64_t)(v90 + 4);
        v76[8] = (uint64_t)v93;
        if (v84)
          operator delete(v84);
      }
      else
      {
        *(CGFloat *)v80 = v69;
        *((CGFloat *)v80 + 1) = v71;
        v81 = v80 + 32;
        *((CGFloat *)v80 + 2) = v73;
        *((CGFloat *)v80 + 3) = v75;
        v82 = v224;
      }
      v76[7] = (uint64_t)v81;
      -[PKMetalRenderState maskCommandBufferCreateIfNecessary]((id *)v215);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = *(id *)(v82 + 96);
      if (!v95)
      {
        objc_msgSend(v94, "renderCommandEncoderWithDescriptor:", v211);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderState setMaskRenderEncoder:]((uint64_t)v215, v96);
        v95 = v96;
      }
      v274 = 1;
      if (v38)
      {
        -[PKStroke _transform](v38, "_transform");
      }
      else
      {
        v230 = 0u;
        v231 = 0u;
        *(_OWORD *)v229 = 0u;
      }
      v271 = *(_OWORD *)v229;
      v272 = v230;
      v273 = v231;
      -[PKStroke _renderMask](v38, "_renderMask");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v97 == 0;

      if (v98)
      {
        v99 = v38;
        v101 = v210;
        v218 = v213;
        -[PKStroke _strokeUUID](v99, "_strokeUUID");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKLRUCache objectForKey:](v101, v102);
        v100 = (PKMetalRenderMaskRenderCache *)objc_claimAutoreleasedReturnValue();

        if (v100)
        {
          -[PKMetalRenderMaskRenderCache strokeDataUUID](v100, "strokeDataUUID");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKStroke _strokeDataUUID](v99, "_strokeDataUUID");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v103, "isEqual:", v104);

          if ((v105 & 1) != 0)
          {
            if (-[PKMetalStrokeRenderCache lockPurgeableResourcesAddToSet:](v100, "lockPurgeableResourcesAddToSet:", v218))
            {
LABEL_104:

              goto LABEL_105;
            }
            -[PKStroke _strokeUUID](v99, "_strokeUUID");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKLRUCache removeObjectForKey:]((uint64_t)v101, v106);

          }
        }
        v107 = v99;
        v108 = [PKMetalRenderMaskRenderCache alloc];
        -[PKStroke ink](v107, "ink");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKStroke _strokeDataUUID](v107, "_strokeDataUUID");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = -[PKMetalRenderMaskRenderCache initWithInk:strokeDataUUID:](v108, "initWithInk:strokeDataUUID:", v109, v110);

        v112 = v107;
        v100 = v111;
        -[PKStroke _strokeMask](v112, "_strokeMask");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = (_QWORD *)objc_msgSend(v113, "maskPaths");
        v115 = v114[1] == *v114;

        if (!v115)
        {
          -[PKStroke _strokeMask](v112, "_strokeMask");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMetalRenderer generateRenderMaskForPaths:renderCache:](a1, (uint64_t *)objc_msgSend(v116, "maskPaths"), v100);

        }
        -[PKMetalStrokeRenderCache buffers](v100, "buffers");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v117, "count"))
          v118 = v100;
        else
          v118 = 0;
        v119 = v118;

        if (v119)
        {
          -[PKMetalStrokeRenderCache lockPurgeableResourcesAddToSet:](v119, "lockPurgeableResourcesAddToSet:", v218);
          -[PKStroke _strokeUUID](v112, "_strokeUUID");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKLRUCache setObject:forKey:cost:]((uint64_t)v101, v119, v120, -[PKMetalStrokeRenderCache cacheCost](v119, "cacheCost"));

        }
        else
        {
          v100 = 0;
        }
        goto LABEL_104;
      }
      -[PKStroke _renderMask](v38, "_renderMask");
      v99 = (PKStroke *)objc_claimAutoreleasedReturnValue();
      -[PKStroke renderCache](v99, "renderCache");
      v100 = (PKMetalRenderMaskRenderCache *)objc_claimAutoreleasedReturnValue();
LABEL_105:

      *(_QWORD *)(v224 + 104) += -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:]((_OWORD *)a1, v100, v95, (uint64_t)buf, 0);
      v274 = 0;

      v83 = 1;
LABEL_106:
      -[PKStroke ink](v38, "ink");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(v224 + 144) = objc_msgSend(v121, "_numPaintFramebuffers");

      if (!v223)
        v275 = v83;
      if (v38)
      {
        -[PKStroke _transform](v38, "_transform");
      }
      else
      {
        v230 = 0u;
        v231 = 0u;
        *(_OWORD *)v229 = 0u;
      }
      v271 = *(_OWORD *)v229;
      v272 = v230;
      v273 = v231;
      -[PKMetalRenderer renderCacheItemForStroke:bsplineFilter:purgeableResources:strokeRenderCache:](a1, (uint64_t)buf, (uint64_t)v261, v213, v210);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v122)
      {
        v123 = v261;
        -[PKStroke path](v38, "path");
        v124 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
        -[PKStroke ink](v38, "ink");
        v125 = (PKInk *)objc_claimAutoreleasedReturnValue();
        PKBSplineFilter::splineFromStroke(v123, v124, v125, -1.0);

      }
      -[PKMetalRenderer setupRenderState:needCompute:clearPaint:](a1, v215, objc_msgSend(v122, "needsCompute"), v220 & 1);
      -[PKStroke _bounds](v38, "_bounds");
      v126 = *(_OWORD *)(a1 + 288);
      *(_OWORD *)&v228.a = *v208;
      *(_OWORD *)&v228.c = v126;
      *(_OWORD *)&v228.tx = *(_OWORD *)(a1 + 304);
      v280 = CGRectApplyAffineTransform(v279, &v228);
      v127 = v280.origin.x;
      v128 = v280.origin.y;
      v129 = v280.size.width;
      v130 = v280.size.height;
      if (v223)
      {
        v281 = CGRectUnion(*(CGRect *)(v245 + 6), v280);
        *(CGRect *)(v245 + 6) = v281;
      }
      if (v83)
      {
        v131 = *(id *)(v224 + 80);
        v132 = -[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](a1, v131, 0, v127, v128, v129, v130, x, y, width, height);

        if ((v132 & 1) == 0)
          break;
      }
      if (v217 + 1 >= v212)
        goto LABEL_142;
      objc_msgSend(v214, "objectAtIndexedSubscript:", v217 + 1);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = v38;
      v219 = v133;
      if (!v223)
      {
        -[PKStroke _strokeMask](v221, "_strokeMask");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        if (v143)
        {

LABEL_139:
LABEL_142:
          v157 = 0;
          goto LABEL_143;
        }
        objc_msgSend(v219, "_strokeMask");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = v155 == 0;

        if (!v156)
          goto LABEL_139;
      }
      -[PKStroke ink](v221, "ink");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "behavior");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "renderingDescriptor");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = objc_msgSend(v136, "blendMode");

      -[PKStroke _renderGroupID](v221, "_renderGroupID");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v138)
        goto LABEL_126;
      objc_msgSend(v219, "_renderGroupID");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v139)
      {

LABEL_126:
        if (v137)
        {
LABEL_127:
          -[PKStroke _strokeDataUUID](v221, "_strokeDataUUID");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "_strokeDataUUID");
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = objc_msgSend(v144, "isEqual:", v145);

          if ((v146 & 1) == 0)
            goto LABEL_139;
        }
        v142 = 0;
        goto LABEL_129;
      }
      -[PKStroke _renderGroupID](v221, "_renderGroupID");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "_renderGroupID");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = objc_msgSend(v140, "isEqual:", v141);

      if (!(v142 & 1 | (v137 == 0)))
        goto LABEL_127;
LABEL_129:
      -[PKStroke ink](v221, "ink");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "ink");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "identifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "identifier");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v147, "isEqual:", v148))
        goto LABEL_141;
      -[PKMetalRenderer colorForStroke:](a1, v221);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMetalRenderer colorForStroke:](a1, v219);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v149, "isEqual:", v150))
      {

LABEL_141:
        goto LABEL_142;
      }
      v151 = objc_msgSend(v206, "_numPaintFramebuffers");
      LOBYTE(v151) = v151 == objc_msgSend(v205, "_numPaintFramebuffers");

      if ((v151 & 1) == 0
        || (v137 ? (v152 = 1) : (v152 = v142),
            (v152 & 1) == 0
         && (objc_msgSend(v205, "behavior"),
             v153 = (double *)objc_claimAutoreleasedReturnValue(),
             v154 = -[PKInkBehavior alphaForStroke:](v153, v219) < v199,
             v153,
             v154)))
      {
LABEL_137:

        goto LABEL_142;
      }
      objc_msgSend(v206, "identifier");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v163, "isEqualToString:", CFSTR("com.apple.ink.pen"))
        || objc_msgSend(v206, "version")
        || objc_msgSend(v205, "version"))
      {

      }
      else
      {
        -[PKStroke _bounds](v221, "_bounds");
        v170 = v169;
        v172 = v171;
        v174 = v173;
        v176 = v175;
        objc_msgSend(v219, "_bounds");
        v284.origin.x = v177;
        v284.origin.y = v178;
        v284.size.width = v179;
        v284.size.height = v180;
        v282.origin.x = v170;
        v282.origin.y = v172;
        v282.size.width = v174;
        v282.size.height = v176;
        v181 = CGRectIntersectsRect(v282, v284);

        if (v181)
          goto LABEL_137;
      }
      -[PKStroke _clipPlane](v221, "_clipPlane");
      v164 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "_clipPlane");
      v165 = objc_claimAutoreleasedReturnValue();
      v166 = (void *)v165;
      v167 = (v164 | v165) == 0;
      if (v164 && v165)
        v167 = objc_msgSend((id)v164, "isEqualToClipPlane:", v165);

      if ((v167 & 1) == 0)
        goto LABEL_142;
      -[PKStroke _renderGroupID](v221, "_renderGroupID");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      if (v168)
      {

        v157 = 1;
      }
      else
      {
        v157 = *(_QWORD *)(v224 + 104) < 0x3D091uLL;
      }
LABEL_143:
      v158 = (unint64_t)v261[10];
      v159 = (unint64_t)v261[11];
      v160 = *(id *)(v224 + 80);
      v161 = *(id *)(v224 + 88);
      *(_QWORD *)(v224 + 104) += -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](a1, v158, v159, (uint64_t)buf, v160, v161, v122);

      if (v223)
        v207[2](v207, v38);
      if (!v157)
        break;
      objc_msgSend(v214, "objectAtIndexedSubscript:", v217 + 1);
      v162 = objc_claimAutoreleasedReturnValue();

      v220 = 0;
      ++v216;
      ++v217;
      v38 = (PKStroke *)v162;
    }

    if (*(_BYTE *)(v224 + 43))
    {
      v204[2]();
      *(_BYTE *)(v224 + 43) = 0;
      -[PKMetalRenderer setupRenderState:needCompute:clearPaint:](a1, v215, 0, 0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v224 + 80));
    }
    v182 = *(id *)(v224 + 80);
    -[PKMetalRenderer finishRenderingNoTeardownForStroke:clippedToPixelSpaceRect:renderEncoder:](a1, (uint64_t)buf, v182, x, y, width, height);

    *(_BYTE *)(v224 + 44) = 0;
    v183 = *(_QWORD *)(v224 + 104) > 0x3D090uLL || v223 != 0;
    if (*(_BYTE *)(a1 + 712) || v183)
    {
      v204[2]();
    }
    else
    {
      v184 = *(id *)(v224 + 80);
      -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v184);

      v185 = v224;
      if (*(_QWORD *)(v224 + 144))
      {
        v186 = 0;
        do
        {
          if (v186)
            v187 = 4;
          else
            v187 = 1;
          -[PKMetalRenderer eraseShaderForAttachmentIndex:]((_QWORD *)a1, v187);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          v189 = *(id *)(v185 + 80);
          -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v188, v189);

          ++v186;
          v185 = v224;
        }
        while (v186 < *(_QWORD *)(v224 + 144));
      }
      v222 = *(float64x2_t *)(a1 + 224);
      v190 = *(id *)(v185 + 80);
      v226[0] = 0;
      v226[1] = 0;
      v227 = vcvtq_u64_f64(v222);
      objc_msgSend(v190, "setScissorRect:", v226);

    }
    if (v201 && v201[2]())
    {
      v191 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v191, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v229 = 0;
        _os_log_debug_impl(&dword_1BE213000, v191, OS_LOG_TYPE_DEBUG, "renderStrokes - Cancel", v229, 2u);
      }

      v192 = 0;
    }
    else
    {
      v192 = 1;
      if (v200)
        sleep(1u);
    }

    _Block_object_dispose(&v244, 8);

    v43 = v217;
    ++v216;
    v17 = (_BYTE *)v224;
    if (v192)
    {
LABEL_184:
      v37 = v43 + 1;
      if (v37 >= v212)
        break;
      continue;
    }
    break;
  }
LABEL_187:
  -[PKMetalRenderState commitAndPurgeResourceSet:]((uint64_t)v17, v202);
  -[PKMetalRenderer finishRendering](a1);
  if (!*(_BYTE *)(a1 + 932))
  {
    -[PKMetalRenderer purgePaintFramebuffers](a1);
    *(_BYTE *)(a1 + 121) = 1;
    *(_BYTE *)(a1 + 153) = 1;
    *(_BYTE *)(a1 + 137) = 1;
    *(_BYTE *)(a1 + 169) = 1;
    v193 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(a1 + 680) = v193;
    if (!*(_BYTE *)(a1 + 932))
    {
      v194 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v194, OS_LOG_TYPE_DEBUG))
      {
        v198 = objc_msgSend(v214, "count");
        *(_DWORD *)buf = 134218240;
        v267 = v216;
        v268 = 2048;
        v269 = v198;
        _os_log_debug_impl(&dword_1BE213000, v194, OS_LOG_TYPE_DEBUG, "renderStrokes - Done %ld/%ld", buf, 0x16u);
      }

    }
  }
  v195 = v264;
  *v208 = v263;
  *(_OWORD *)(a1 + 288) = v195;
  *(_OWORD *)(a1 + 304) = v265;
  objc_msgSend(v214, "count");
  kdebug_trace();
  _Block_object_dispose(&v252, 8);
  if (__p)
  {
    v259 = __p;
    operator delete(__p);
  }

  v196 = (uint64_t)v261;
  v261 = 0;
  if (v196)
    std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)&v261, v196);
  v17 = (_BYTE *)v224;
LABEL_197:

  return v216;
}

- (uint64_t)renderStrokes:(void *)a3 stopBlock:
{
  id v5;
  _OWORD *v6;
  __int128 v7;
  int v8;
  double *v9;
  id v10;
  uint64_t v11;
  char v12;
  char v13;
  _anonymous_namespace_::RendererFramebuffer *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t i;
  id v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v29 = a3;
  if (a1)
  {
    v34 = 0;
    v33 = 0;
    v35 = 0;
    v36 = 0;
    v6 = (_OWORD *)(a1 + 664);
    v7 = *(_OWORD *)(a1 + 680);
    v31 = *(_OWORD *)(a1 + 664);
    v32 = v7;
    v8 = *(unsigned __int8 *)(a1 + 932);
    v9 = (double *)MEMORY[0x1E0C9D628];
    if (*(_BYTE *)(a1 + 932))
    {
      v10 = *(id *)(a1 + 8);
      v11 = 0;
      v12 = 1;
      do
      {
        v13 = v12;
        v14 = (_anonymous_namespace_::RendererFramebuffer *)(a1 + 112 + 16 * v11);
        v12 = 0;
        v11 = 1;
      }
      while ((v13 & 1) != 0);
      v15 = *(id *)(a1 + 176);
      v16 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = 0;

      v17 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

      v18 = *((_OWORD *)v9 + 1);
      *v6 = *(_OWORD *)v9;
      *(_OWORD *)(a1 + 680) = v18;
    }
    else
    {
      v15 = 0;
      v10 = 0;
    }
    v19 = *(_QWORD *)(a1 + 8);
    if (!v19)
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v5);
    v20 = *v9;
    v21 = v9[1];
    v22 = v9[2];
    v23 = v9[3];
    v24 = *(_OWORD *)(a1 + 288);
    v30[0] = *(_OWORD *)(a1 + 272);
    v30[1] = v24;
    v30[2] = *(_OWORD *)(a1 + 304);
    v25 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v5, v30, v29, v20, v21, v22, v23);
    if (!v19)
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    if (v10)
      objc_storeStrong((id *)(a1 + 8), v10);
    if (v15)
      objc_storeStrong((id *)(a1 + 176), v15);
    if (v8)
    {
    }
    v26 = v32;
    *v6 = v31;
    *(_OWORD *)(a1 + 680) = v26;

    for (i = 16; i != -16; i -= 16)

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setupRenderStateForRenderingStrokes:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "_strokeMask", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 != 0;

        if (!v8)
        {
          objc_msgSend(v7, "_renderMask");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (v11)
            continue;
        }
        v12 = v8 == 0;
        goto LABEL_13;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v9 = 0;
      v12 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
    v12 = 0;
  }
LABEL_13:

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_numPaintFramebuffers");

  }
  else
  {
    v15 = 0;
  }
  -[PKMetalRenderer setupRenderStateForStrokeRenderingNumPaintBuffers:needRenderMask:](a1, v15, v9 || v12);

}

- (void)teardownRenderStateIfNecessary
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      -[PKMetalRenderState commitAndPurgeResourceSet:](v2, 0);
      v3 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

    }
  }
}

- (void)setupRenderStateWithLiveRenderConfig:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  PKMetalRenderState *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  _BYTE *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 && !*(_BYTE *)(v4 + 38))
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  v5 = *(id *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
  {
    v7 = [PKMetalRenderState alloc];
    v8 = 790;
    if (!*(_BYTE *)(a1 + 714))
      v8 = 784;
    v9 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)&v7->super.isa, *(void **)(a1 + 32), 1, *(unsigned int *)(a1 + v8) | ((unint64_t)*(unsigned __int16 *)(a1 + v8 + 4) << 32));
    v10 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v9;

    v6 = *(_QWORD *)(a1 + 8);
    if (*(_BYTE *)(a1 + 714))
    {
      if (!v6)
        goto LABEL_14;
      *(_QWORD *)(v6 + 128) = 1;
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (!v6)
      goto LABEL_14;
  }
  *(_QWORD *)(v6 + 144) = *(_QWORD *)(a2 + 72);
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    *(_BYTE *)(v11 + 42) = *(_BYTE *)(a2 + 64);
    v12 = *(_QWORD *)(a1 + 8);
    if (v12)
      *(_BYTE *)(v12 + 45) = *(_BYTE *)(a2 + 65);
  }
LABEL_14:
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = v14 != 1;
  if (v13 >= 1 && v14 == 1)
  {
    v16 = (unsigned __int8 *)(a1 + 121);
    v17 = 1;
    while (1)
    {
      v18 = *(_QWORD *)(v16 - 9);
      if (!v18 || *(_BYTE *)(v18 + 18) || !*(v16 - 1))
        break;
      v20 = *v16;
      v16 += 16;
      v19 = v20;
      v15 = v20 != 0;
      if (v17 < v13)
      {
        ++v17;
        if (!v19)
          continue;
      }
      goto LABEL_24;
    }
    v15 = 1;
  }
LABEL_24:
  v21 = *(_QWORD *)(a2 + 24);
  -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 0);
  if (v13 >= 1)
  {
    v22 = (_BYTE *)(a1 + 121);
    do
    {
      *v22 = 0;
      v22 += 16;
      --v13;
    }
    while (v13);
  }
  -[PKMetalRenderState setDestinationTexture:](*(_QWORD *)(a1 + 8), v5);
  v23 = *(_QWORD **)(a1 + 8);
  if (v23)
  {
    v23[15] = 3;
    v23 = *(_QWORD **)(a1 + 8);
    if (v23)
      v23 = (_QWORD *)v23[10];
  }
  v24 = v23;

  if (!v24)
  {
    -[PKMetalRenderState commandBufferCreateIfNecessary](*(id **)(a1 + 8));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLabel:", CFSTR("Live rendering command buffer"));
    v26 = 1;
    if (v15)
      v26 = 2;
    *(_QWORD *)(a2 + 32) = v26;
    v33 = *(id *)a2;
    v35 = *(_OWORD *)(a2 + 24);
    v36 = *(_OWORD *)(a2 + 40);
    v37 = *(_OWORD *)(a2 + 56);
    v38 = *(_QWORD *)(a2 + 72);
    v34 = *(_OWORD *)(a2 + 8);
    -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v25, (uint64_t)&v33, *(void **)(a1 + 8));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderState setRenderEncoder:](*(_QWORD *)(a1 + 8), v27);
    if (v21 == 1)
      *(_BYTE *)(a1 + 72) = 0;

  }
  v28 = *(_QWORD *)(a1 + 632);
  v29 = *(_QWORD *)(a1 + 624);
  if (v28 != v29)
  {
    v30 = 0;
    v31 = 344;
    do
    {
      v32 = *(void **)(v29 + v31);
      if (v32)
      {
        -[PKMetalRenderState extendLifetimeUntilCompleted:](*(_QWORD *)(a1 + 8), v32);
        v28 = *(_QWORD *)(a1 + 632);
        v29 = *(_QWORD *)(a1 + 624);
      }
      ++v30;
      v31 += 360;
    }
    while (v30 < 0x4FA4FA4FA4FA4FA5 * ((v28 - v29) >> 3));
  }

}

- (void)setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:(uint64_t)a1
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _BYTE **v10;
  uint64_t v11;
  _BYTE *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  _BYTE *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[16];

  -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
  v4 = *(_QWORD *)(a1 + 8);
  if (!v4)
    goto LABEL_50;
  if (*(_QWORD *)(v4 + 128) != 2)
    goto LABEL_13;
  v5 = *(unsigned __int8 *)(a1 + 64);
  if (!*(_QWORD *)(a1 + 56))
    goto LABEL_6;
  if (!*(_BYTE *)(a1 + 64))
  {
    v5 = -[PKMetalFramebuffer incrementNonPurgeableCount](*(_BYTE **)(a1 + 56));
    *(_BYTE *)(a1 + 64) = v5;
LABEL_6:
    if (!v5)
    {
      v6 = *(_QWORD *)(a1 + 56);
      if (v6
        && (*(_BYTE *)(a1 + 64)
         || (*(_BYTE *)(a1 + 64) = -[PKMetalFramebuffer incrementNonPurgeableCount]((_BYTE *)v6),
             (v6 = *(_QWORD *)(a1 + 56)) != 0)))
      {
        v7 = *(void **)(v6 + 24);
      }
      else
      {
        v7 = 0;
      }
      v8 = v7;
      objc_msgSend(v8, "setLabel:", CFSTR("Six channel multiply framebuffer"));

    }
  }
LABEL_13:
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9)
    goto LABEL_50;
  v10 = (_BYTE **)(a1 + 112);
  v11 = -1;
  while ((unint64_t)++v11 < *(_QWORD *)(v9 + 144))
  {
    v12 = *v10;
    if (*v10)
    {
      if ((v12[18] != 0) == a2
            (v12 = *v10) != 0))
      {
        if (!*((_BYTE *)v10 + 8))
          *((_BYTE *)v10 + 8) = -[PKMetalFramebuffer incrementNonPurgeableCount](v12);
      }
    }
    if (!*((_BYTE *)v10 + 8))
    {
      v13 = *v10;
      if (*v10)
        v13 = (_QWORD *)v13[3];
      v14 = v13;
      objc_msgSend(v14, "setLabel:", CFSTR("Paint framebuffer"));

      if (*v10 && !*((_BYTE *)v10 + 8))
        *((_BYTE *)v10 + 8) = -[PKMetalFramebuffer incrementNonPurgeableCount](*v10);
      *((_BYTE *)v10 + 9) = 1;
    }
    v15 = *(_QWORD *)(a1 + 8);
    if (!v15)
      goto LABEL_50;
    if (*(_BYTE *)(v15 + 45))
    {
      v16 = v10 + 4;
      v17 = *((unsigned __int8 *)v10 + 40);
      if (!v10[4])
        goto LABEL_33;
      if (!*((_BYTE *)v10 + 40))
      {
        v17 = -[PKMetalFramebuffer incrementNonPurgeableCount](v10[4]);
        *((_BYTE *)v10 + 40) = v17;
LABEL_33:
        if (!v17)
        {
          v18 = (_BYTE *)*v16;
          if (*v16
            && (*((_BYTE *)v10 + 40)
             || (*((_BYTE *)v10 + 40) = -[PKMetalFramebuffer incrementNonPurgeableCount](v18), (v18 = v10[4]) != 0)))
          {
            v19 = (void *)*((_QWORD *)v18 + 3);
          }
          else
          {
            v19 = 0;
          }
          v20 = v19;
          objc_msgSend(v20, "setLabel:", CFSTR("Accumulation framebuffer"));

          *((_BYTE *)v10 + 41) = 1;
        }
      }
    }
    v10 += 2;
    v9 = *(_QWORD *)(a1 + 8);
    if (!v9)
      goto LABEL_50;
  }
  if (!*(_BYTE *)(v9 + 42) || *(_QWORD *)(a1 + 176))
    goto LABEL_54;
  v21 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 480), *(void **)(a1 + 24), 0, 0, (void *)1, 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
  v22 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v21;

  v23 = *(_QWORD **)(a1 + 176);
  if (v23)
    v23 = (_QWORD *)v23[3];
  v24 = v23;
  objc_msgSend(v24, "setLabel:", CFSTR("Paint mask framebuffer"));

  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
LABEL_54:
    if (*(_BYTE *)(v9 + 42) && !*(_QWORD *)(a1 + 184))
    {
      v25 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 480), *(void **)(a1 + 24), 1, 0, *(void **)(a1 + 704), 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
      v26 = *(void **)(a1 + 184);
      *(_QWORD *)(a1 + 184) = v25;

    }
  }
LABEL_50:
  if (!*(_QWORD *)(a1 + 696))
  {
    -[PKMetalResourceHandler randomNumberBuffer](*(_QWORD *)(a1 + 192));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 696);
    *(_QWORD *)(a1 + 696) = v27;

  }
}

- (id)renderCommandEncoderForCommandBuffer:(uint64_t)a3 renderStateConfig:(void *)a4 renderState:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void **v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _BYTE *v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  id *v43;
  void *v44;
  _QWORD *v45;
  _QWORD *v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  CGColor *v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  id *v58;
  void *v59;
  _QWORD *v60;
  _QWORD *v61;
  void *v62;
  id v63;
  _QWORD *v64;
  _QWORD *v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v68 = a2;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "colorAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "setLoadAction:", *(_QWORD *)(a3 + 16));
  objc_msgSend(v70, "setStoreAction:", *(_QWORD *)(a3 + 24));
  if (v6 && *(_BYTE *)(a1 + 714) && *((_QWORD *)v6 + 16) == 2)
  {
    v10 = 1.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v11 = *(double *)(a1 + 80);
    v12 = *(double *)(a1 + 88);
    v13 = *(double *)(a1 + 96);
    v10 = *(double *)(a1 + 104);
  }
  objc_msgSend(v70, "setClearColor:", v11, v12, v13, v10);
  v14 = *(_QWORD **)(a1 + 40);
  if (v14)
    v14 = (_QWORD *)v14[3];
  v15 = v14;
  objc_msgSend(v70, "setTexture:", v15);

  -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *(void **)(a1 + 40));
  v16 = v7;
  if (*(uint64_t *)(a3 + 72) >= 1)
  {
    v17 = 0;
    v18 = a1 + 112;
    v19 = a1 + 200;
    do
    {
      objc_msgSend(v16, "colorAttachments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v17)
        v22 = 4;
      else
        v22 = 1;
      objc_msgSend(v20, "objectAtIndexedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v24 = (void **)(a1 + 144 + 16 * v17);
        if (*((_BYTE *)v6 + 44))
          v25 = v18 + 32;
        else
          v25 = v18;
      }
      else
      {
        v24 = (void **)(v18 + 32);
        v25 = v18;
      }
      v26 = *(_QWORD **)v25;
      if (*(_QWORD *)v25)
        v26 = (_QWORD *)v26[3];
      v27 = v26;
      objc_msgSend(v23, "setTexture:", v27);

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *(void **)v25);
      v28 = *(_BYTE **)v25;
      if (*(_BYTE *)(v25 + 9))
      {
        v29 = 2;
        if (!v28)
          goto LABEL_21;
      }
      else if (v28 && v28[18])
      {
        v29 = 2;
      }
      else
      {
        v29 = *(_QWORD *)(a3 + 32);
        if (!v28)
        {
LABEL_21:
          v30 = 0;
          goto LABEL_27;
        }
      }
      v30 = v28[18] != 0;
LABEL_27:
      objc_msgSend(v23, "setLoadAction:", v29);
      objc_msgSend(v23, "setStoreAction:", !v30);
      objc_msgSend(v23, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      *(_BYTE *)(v25 + 9) = 0;

      if ((!v6 || !*((_BYTE *)v6 + 44)) && *(_BYTE *)(a3 + 65) && *v24)
      {
        objc_msgSend(v16, "colorAttachments");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (v17)
          v39 = 5;
        else
          v39 = 2;
        objc_msgSend(v37, "objectAtIndexedSubscript:", v39);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (*(_BYTE *)(v18 + 41))
          v40 = 2;
        else
          v40 = 1;
        objc_msgSend(v34, "setLoadAction:", v40);
        *(_BYTE *)(v18 + 41) = 0;
        objc_msgSend(v34, "setStoreAction:", 1);
        v41 = *v24;
        if (*v24)
          v41 = (_QWORD *)v41[3];
        v42 = v41;
        objc_msgSend(v34, "setTexture:", v42);

        -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *v24);
        goto LABEL_50;
      }
      objc_msgSend(v16, "colorAttachments");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v17)
        v33 = 5;
      else
        v33 = 2;
      objc_msgSend(v31, "objectAtIndexedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "setLoadAction:", 0);
      objc_msgSend(v34, "setStoreAction:", 0);
      v35 = *(void **)(v19 + 8 * v17);
      if (v35)
      {
        v36 = v35;
      }
      else
      {
        v43 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 480), *(void **)(a1 + 24), 1, 0, (void *)1, 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
        v44 = *(void **)(v19 + 8 * v17);
        *(_QWORD *)(v19 + 8 * v17) = v43;

        v45 = *(_QWORD **)(v19 + 8 * v17);
        if (v45)
          v45 = (_QWORD *)v45[3];
        v46 = v45;
        objc_msgSend(v46, "setLabel:", CFSTR("Dummy Paint Framebuffer"));

        v36 = *(id *)(v19 + 8 * v17);
        if (!v36)
        {
          v47 = 0;
          goto LABEL_49;
        }
      }
      v47 = (void *)v36[3];
LABEL_49:
      v48 = v47;
      objc_msgSend(v34, "setTexture:", v48);

LABEL_50:
      ++v17;
      v18 += 16;
    }
    while (v17 < *(_QWORD *)(a3 + 72));
  }
  objc_msgSend(v69, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  v49 = *(_QWORD *)(a3 + 24);
  if (!v6 || (v50 = *((id *)v6 + 14), v50, !v50))
  {
    if (*(_BYTE *)(a1 + 714) && *(_QWORD *)(a1 + 56) && v49 == 1)
    {
      objc_msgSend(v69, "setClearColor:", 1.0, 1.0, 1.0, 1.0);
      v53 = *(_QWORD **)(a1 + 56);
      if (v53)
        v53 = (_QWORD *)v53[3];
      v54 = v53;
      objc_msgSend(v69, "setTexture:", v54);

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v6, *(void **)(a1 + 56));
      objc_msgSend(v69, "setLoadAction:", *(_QWORD *)(a3 + 16));
      v55 = 1;
      goto LABEL_72;
    }
    v56 = *(void **)(a1 + 216);
    if (v56)
    {
      v57 = v56;
    }
    else
    {
      v58 = -[PKMetalFramebuffer initWithSize:pixelFormat:device:memoryless:backedByIOSurface:sampleCount:purgeable:]((id *)[PKMetalFramebuffer alloc], *(void **)(a1 + 944), *(void **)(a1 + 24), 1, 0, (void *)1, 0, *(double *)(a1 + 224), *(double *)(a1 + 232));
      v59 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = v58;

      v60 = *(_QWORD **)(a1 + 216);
      if (v60)
        v60 = (_QWORD *)v60[3];
      v61 = v60;
      objc_msgSend(v61, "setLabel:", CFSTR("Dummy Color Framebuffer"));

      v57 = *(id *)(a1 + 216);
      if (!v57)
      {
        v62 = 0;
        goto LABEL_71;
      }
    }
    v62 = (void *)v57[3];
LABEL_71:
    v63 = v62;
    objc_msgSend(v69, "setTexture:", v63);

    objc_msgSend(v69, "setLoadAction:", 0);
    v55 = 0;
LABEL_72:
    objc_msgSend(v69, "setStoreAction:", v55);
    goto LABEL_77;
  }
  v51 = *(_QWORD *)(a3 + 8);
  if (v51 == 2)
  {
    v52 = *(CGColor **)(a1 + 240);
    if (v52)
    {
      v72 = xmmword_1BE4FD9E8;
      v73 = unk_1BE4FD9F8;
      DKUColorGetRGBAComponents(v52, &v72);
      objc_msgSend(v69, "setClearColor:", v72, v73);
    }
    else
    {
      objc_msgSend(v69, "setClearColor:", *(double *)&PKMetalRendererBackboardWhiteLevel, *(double *)&PKMetalRendererBackboardWhiteLevel, *(double *)&PKMetalRendererBackboardWhiteLevel, 1.0);
    }
  }
  v64 = *(_QWORD **)(a1 + 8);
  if (v64)
    v64 = (_QWORD *)v64[14];
  v65 = v64;
  objc_msgSend(v69, "setTexture:", v65);

  objc_msgSend(v69, "setLoadAction:", v51);
  objc_msgSend(v69, "setStoreAction:", 1);
LABEL_77:
  objc_msgSend(v68, "renderCommandEncoderWithDescriptor:", v16);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (void)setupRenderStateForStrokeRenderingNumPaintBuffers:(int)a3 needRenderMask:
{
  uint64_t v6;
  _BOOL4 v7;
  id *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[8];
  __int16 v22;
  uint64_t v23;

  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    if (!*(_BYTE *)(v6 + 38)
      || (-[PKMetalRenderer teardownRenderStateIfNecessary](a1), v6 = *(_QWORD *)(a1 + 8), v7 = a2 > 0, v6))
    {
      if (a2 <= 0)
        goto LABEL_21;
      goto LABEL_16;
    }
  }
  else
  {
    v7 = a2 > 0;
  }
  v8 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32));
  v9 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v8;

  if (v7)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
    {
      *(_QWORD *)(v6 + 144) = a2;
      v6 = *(_QWORD *)(a1 + 8);
      if (*(_BYTE *)(a1 + 714))
      {
        if (v6)
        {
          *(_QWORD *)(v6 + 128) = 2;
          v6 = *(_QWORD *)(a1 + 8);
        }
      }
    }
    if ((a3 & 1) != 0)
    {
      if (!v6)
        goto LABEL_17;
      *(_BYTE *)(v6 + 42) = 1;
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (v6)
LABEL_16:
      *(_QWORD *)(v6 + 144) = a2;
LABEL_17:
    v10 = 2;
    goto LABEL_22;
  }
  if (a3)
  {
    v11 = *(_QWORD *)(a1 + 8);
    if (v11)
    {
      v10 = 0;
      *(_BYTE *)(v11 + 42) = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  v10 = 0;
LABEL_22:
  -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
  v12 = *(_QWORD **)(a1 + 8);
  if (v12)
    v12 = (_QWORD *)v12[10];
  v13 = v12;

  if (!v13)
  {
    v14 = *(_QWORD *)(a1 + 8);
    if (v14)
      v15 = *(_QWORD *)(v14 + 144);
    else
      v15 = 0;
    v16 = *(unsigned __int8 *)(a1 + 72);
    -[PKMetalRenderState commandBufferCreateIfNecessary]((id *)v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = 0;
    v21[1] = 0;
    if (v16)
      v18 = 2;
    else
      v18 = 1;
    v21[2] = v18;
    v21[3] = 1;
    v21[4] = v10;
    memset(&v21[5], 0, 24);
    v22 = 0;
    v23 = v15;
    v20 = v17;
    -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v17, (uint64_t)v21, *(void **)(a1 + 8));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderState setRenderEncoder:](*(_QWORD *)(a1 + 8), v19);
    *(_BYTE *)(a1 + 72) = 0;

  }
}

- (void)renderAheadWithTransform:(int)a3 onPaper:(void *)a4 renderBufferSize:(double)a5 destinationTexture:(double)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t i;
  PKStroke *v34;
  id *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  PKStrokePath *v40;
  id v41;
  _BOOL4 v42;
  PKInk *v43;
  CGFloat a;
  unint64_t v45;
  unint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  char v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  _QWORD *v57;
  _QWORD *v58;
  unint64_t v59;
  char j;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _BOOL4 v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  NSObject *v82;
  uint64_t v83;
  _BYTE *v84;
  _QWORD *v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  void *v116;
  _QWORD *v117;
  _OWORD *v118;
  __int128 v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  __int128 v126;
  uint64_t v127;
  unint64_t m;
  unint64_t v129;
  int v130;
  void *v131;
  __int128 v132;
  unint64_t k;
  unint64_t v134;
  int v135;
  void *v136;
  void *v137;
  __int128 v138;
  double v139;
  float64x2_t v146;
  uint64_t v147;
  _BOOL4 v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  id v152;
  id v153;
  uint64_t v154;
  char v155;
  _OWORD *v157;
  id v158;
  id v159;
  int v160;
  id obj;
  _OWORD *obja;
  uint64_t rect;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  __int128 v169;
  void *v170;
  uint64_t v171;
  id v172;
  unint64_t v173;
  id v174;
  int64x2_t v175;
  int64x2_t v176;
  __int128 v177;
  uint64_t v178;
  char v179;
  char v180;
  int v181;
  __int16 v182;
  uint64_t v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[8];
  char v189;
  char v190;
  uint64_t v191;
  int v192;
  __int16 v193;
  __int128 v194;
  uint64_t v195;
  CGAffineTransform v196;
  CGAffineTransform v197;
  CGAffineTransform v198;
  CGAffineTransform v199;
  CGAffineTransform v200;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _BYTE v203[128];
  CGAffineTransform buf[6];
  double v205;
  uint64_t v206;
  CGRect v207;

  v206 = *MEMORY[0x1E0C80C00];
  v158 = a4;
  if (!a1)
    goto LABEL_177;
  v10 = *(_QWORD *)(a1 + 624);
  v11 = *(_QWORD *)(a1 + 632);
  while (v10 != v11)
  {
    if (!*(_BYTE *)(v10 + 176))
    v10 += 360;
  }
  v152 = v158;
  v195 = 0;
  v194 = 0uLL;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
    *(_BYTE *)(v12 + 41) = a3;
  if (a3)
    v13 = 2 * (*(_QWORD *)(a1 + 240) != 0);
  else
    v13 = 2;
  v14 = a1;
  if (*(_BYTE *)(a1 + 72))
    v15 = 2;
  else
    v15 = 1;
  v16 = *(_QWORD *)(v14 + 632);
  v171 = v14;
  if (*(_QWORD *)(v14 + 624) == v16)
  {
    if (*(_QWORD *)(v14 + 648))
    {
      if (objc_msgSend(*(id *)(v14 + 656), "count"))
      {
        v23 = v171;
        v159 = *(id *)(v171 + 656);
        v17 = 1.0;
      }
      else
      {
        v159 = 0;
        v17 = 0.0;
        v23 = v171;
      }
      objc_msgSend(*(id *)(v23 + 648), "ink");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "_numPaintFramebuffers");

      v155 = 0;
      if (v25 <= 1)
        v26 = 1;
      else
        v26 = v25;
      v154 = v26;
      v160 = 1;
      v22 = 1;
    }
    else
    {
      v155 = 0;
      v159 = 0;
      v160 = 0;
      v17 = 0.0;
      v22 = 2;
      v154 = 1;
    }
  }
  else
  {
    v155 = *(_BYTE *)(v16 - 75);
    v159 = *(id *)(v16 - 72);
    v17 = *(double *)(v16 - 64);
    v18 = *(unsigned __int8 *)(v16 - 40);
    objc_msgSend(*(id *)(v16 - 280), "ink");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_numPaintFramebuffers");

    if (v20 <= 1)
      v21 = 1;
    else
      v21 = v20;
    v154 = v21;
    v160 = v18 ^ 1;
    if (v18)
      v22 = 2;
    else
      v22 = 1;
  }
  if (!*(_BYTE *)(v171 + 714))
  {
    v28 = (uint64_t *)(v171 + 944);
    goto LABEL_35;
  }
  v27 = *(_QWORD *)(v171 + 192);
  if (v27)
  {
    v28 = (uint64_t *)(v27 + 440);
LABEL_35:
    v27 = *v28;
  }
  *(_QWORD *)(v171 + 472) = v27;
  v153 = v152;
  v188[0] = v153;
  v188[1] = v13;
  v188[2] = v15;
  v188[3] = 1;
  v188[4] = v22;
  memset(&v188[5], 0, 24);
  v189 = v155;
  v190 = v160;
  v191 = v154;
  -[PKMetalRenderer setupRenderStateWithLiveRenderConfig:](v171, (uint64_t)v188);
  -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(v171 + 8), CFSTR("renderAheadWithTransform"));
  v29 = v171;
  if (v160)
  {
    v30 = *(_QWORD *)(v171 + 624);
    v31 = v30 != *(_QWORD *)(v171 + 632)
       && !*(_BYTE *)(v30 + 337)
       && *(_QWORD *)(*(_QWORD *)(v30 + 96) + 72) > *(_QWORD *)(v30 + 160) + 1;
    -[PKMetalRenderer resetPaintFramebufferAccumulate:](v171, v31);
  }
  if (objc_msgSend(v159, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    obj = v159;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v203, 16);
    if (!v32)
      goto LABEL_65;
    v167 = *(_QWORD *)v185;
    while (1)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v185 != v167)
          objc_enumerationMutation(obj);
        v34 = (PKStroke *)*(id *)(*((_QWORD *)&v184 + 1) + 8 * i);
        v172 = v170;
        v35 = (id *)*(id *)(v29 + 8);
        if (v35)
        {
          v36 = -[PKMetalRenderer renderZoomFactorForStroke:](v29, v34);
          if (v34)
            -[PKStroke _transform](v34, "_transform");
          else
            memset(&t1, 0, sizeof(t1));
          *(CGAffineTransform *)&buf[2].c = t1;
          v205 = v17;
          v37 = operator new();
          *(_BYTE *)(v37 + 16) = 0;
          *(_QWORD *)(v37 + 24) = 0x3FF0000000000000;
          *(_OWORD *)(v37 + 32) = 0u;
          *(_OWORD *)(v37 + 48) = 0u;
          *(_OWORD *)(v37 + 64) = 0u;
          *(_OWORD *)(v37 + 80) = 0u;
          *(_QWORD *)(v37 + 96) = 0;
          *(_QWORD *)v37 = &unk_1E7773C78;
          *(_QWORD *)(v37 + 8) = 0;
          *(_DWORD *)(v37 + 104) = 0;
          *(_WORD *)(v37 + 108) = 1;
          *(_QWORD *)(v37 + 112) = 0;
          *(_OWORD *)(v37 + 120) = xmmword_1BE4FB830;
          *(_QWORD *)(v37 + 136) = 0x4010000000000000;
          *(_QWORD *)(v37 + 144) = v36;
          *(_DWORD *)(v37 + 152) = 2;
          *(_QWORD *)&t1.a = v37;
          -[PKMetalResourceHandler strokeRenderCache](*(id **)(v29 + 192));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMetalRenderer renderCacheItemForStroke:bsplineFilter:purgeableResources:strokeRenderCache:](v29, (uint64_t)buf, *(uint64_t *)&t1.a, v172, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "needsCompute"))
          {
            -[PKMetalRenderState computeCommandBufferCreateIfNecessary](v35);
            v40 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
            if (v40)
            {
              v41 = v35[11];
              v42 = v41 == 0;

              if (v42)
              {
                -[PKStrokePath computeCommandEncoder](v40, "computeCommandEncoder");
                v43 = (PKInk *)objc_claimAutoreleasedReturnValue();
                objc_storeStrong(v35 + 11, v43);
                goto LABEL_58;
              }
            }
            goto LABEL_59;
          }
          if (!v39)
          {
            a = t1.a;
            -[PKStroke path](v34, "path");
            v40 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
            -[PKStroke ink](v34, "ink");
            v43 = (PKInk *)objc_claimAutoreleasedReturnValue();
            PKBSplineFilter::splineFromStroke(*(id **)&a, v40, v43, -1.0);
LABEL_58:

LABEL_59:
          }
          v46 = *(_QWORD *)(*(_QWORD *)&t1.a + 80);
          v45 = *(_QWORD *)(*(_QWORD *)&t1.a + 88);
          v47 = v35[10];
          v48 = v35[11];
          -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](v171, v46, v45, (uint64_t)buf, v47, v48, v39);

          v49 = *(_QWORD *)&t1.a;
          t1.a = 0.0;
          if (v49)
            std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)&t1, v49);
        }

        v29 = v171;
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v184, v203, 16);
      if (!v32)
      {
LABEL_65:

        v29 = v171;
        goto LABEL_67;
      }
    }
  }
  v170 = 0;
LABEL_67:
  v50 = *(_BYTE *)(v29 + 352);
  *(_BYTE *)(v29 + 352) = 0;
  v51 = *a2;
  v52 = a2[1];
  v54 = a2[2];
  v53 = a2[3];
  v56 = a2[4];
  v55 = a2[5];
  -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(v29 + 8), CFSTR("renderAnimatingStrokesWithTransform"));
  v57 = *(_QWORD **)(v29 + 8);
  if (v57)
    v57 = (_QWORD *)v57[10];
  v58 = v57;
  v151 = v50;
  if (*(_QWORD *)(v29 + 624) != *(_QWORD *)(v29 + 632))
  {
    v59 = 0;
    obja = (_OWORD *)(v29 + 664);
    *(_BYTE *)(v29 + 72) = 0;
    v157 = (_OWORD *)(v29 + 272);
    for (j = 1; ; j = 0)
    {
      v61 = *(_QWORD *)(v29 + 624);
      if (v59 >= 0x4FA4FA4FA4FA4FA5 * ((*(_QWORD *)(v29 + 632) - v61) >> 3))
        goto LABEL_170;
      v62 = v59;
      v168 = 0x4FA4FA4FA4FA4FA5 * ((*(_QWORD *)(v29 + 632) - v61) >> 3);
      v63 = v61 + 360 * v59;
      *(CGRect *)(v29 + 720) = CGRectUnion(*(CGRect *)(v29 + 720), *(CGRect *)(v63 + 184));
      v173 = v62;
      if (!(*(unsigned __int8 *)(v61 + 360 * v62 + 337) | v160))
      {
        v64 = v61 + 360 * v62;
        v67 = *(_QWORD *)(v64 + 168);
        v66 = v64 + 168;
        v65 = v67;
        v68 = *(_QWORD *)(v66 - 72);
        v69 = *(_QWORD *)(v68 + 72);
        v70 = *(_QWORD *)(v68 + 80);
        *(_BYTE *)(v66 + 168) = 1;
        -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](v29, v58);
        if (v67 <= 1)
          v71 = 1;
        else
          v71 = v65;
        -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](v171, v70 + 88 * v71 - 88, v70 + 88 * v69, v63, v58, 0, 0);
        -[PKMetalRenderer disableClippingForRenderEncoder:](v171, v58);
        v72 = *(_QWORD *)(v171 + 8);
        if (v72)
          objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v72 + 80));
        *(_QWORD *)v66 = v69;
        *(_BYTE *)(v66 + 168) = 0;
        v29 = v171;
        v62 = v173;
      }
      *(CGRect *)(v29 + 664) = CGRectUnion(*(CGRect *)(v29 + 664), *(CGRect *)(v61 + 360 * v62 + 216));
      if ((j & 1) != 0)
        v73 = 0;
      else
        v73 = 2;
      t1.a = v51;
      t1.b = v52;
      t1.c = v54;
      t1.d = v53;
      t1.tx = v56;
      t1.ty = v55;
      -[PKMetalRenderer renderWithTransform:animatingStroke:mode:clipped:renderBufferSize:renderEncoder:](v29, &t1.a, v63, v73, (j & 1) == 0, v58, a5, a6);
      if (!*(_BYTE *)(*(_QWORD *)(v61 + 360 * v62 + 96) + 108))
        goto LABEL_102;
      if (*(_QWORD *)(v61 + 360 * v62 + 288) && *(double *)(v61 + 360 * v62 + 304) >= 0.01)
      {
        v74 = *(double *)(v61 + 360 * v62 + 296) < 0.01;
        if (v62)
          goto LABEL_102;
      }
      else
      {
        v74 = 1;
        if (v62)
          goto LABEL_102;
      }
      if (!v74)
      {
LABEL_102:
        v59 = v62 + 1;
        goto LABEL_136;
      }
      -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(v29 + 8), CFSTR("finishStroke"));
      v75 = *(_QWORD **)(v29 + 8);
      if (v75)
        v75 = (_QWORD *)v75[10];
      v76 = v75;
      v77 = *(_QWORD *)(v29 + 624);
      v78 = *(_QWORD *)(v77 + 96);
      v79 = *(_QWORD *)(v77 + 168);
      if (v79 <= *(_QWORD *)(v77 + 160))
        v79 = *(_QWORD *)(v77 + 160);
      if (v79 <= 1)
        v79 = 1;
      v80 = *(_QWORD *)(v78 + 88);
      v81 = *(_QWORD *)(v78 + 80) + 88 * v79 - 88;
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v80 - v81) >> 3)) < 2)
      {
        v84 = (_BYTE *)(v77 + 338);
        if (*(_BYTE *)(v77 + 338))
          goto LABEL_105;
      }
      else
      {
        v82 = os_log_create("com.apple.pencilkit", "Sketching");
        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf[0].a) = 134217984;
          *(_QWORD *)((char *)&buf[0].a + 4) = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v80 - v81) >> 3);
          _os_log_impl(&dword_1BE213000, v82, OS_LOG_TYPE_DEFAULT, "FinishFrontStroke: Rendering remaining stroke points: %lu", (uint8_t *)buf, 0xCu);
        }

        *(_QWORD *)(v77 + 64) = *(_QWORD *)(v77 + 328);
        *(_QWORD *)(v77 + 328) = 0;
        -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](v171, v76);
        -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](v171, v81, v80, v77, v76, 0, 0);
        -[PKMetalRenderer disableClippingForRenderEncoder:](v171, v76);
        v83 = *(_QWORD *)(v171 + 8);
        if (v83)
          objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v83 + 80));
        *(CGRect *)(v171 + 720) = CGRectUnion(*(CGRect *)(v171 + 720), *(CGRect *)(v77 + 184));
        *(CGRect *)(v171 + 664) = CGRectUnion(*(CGRect *)(v171 + 664), *(CGRect *)(v77 + 184));
        v84 = (_BYTE *)(v77 + 338);
        if (*(_BYTE *)(v77 + 338))
        {
          -[PKMetalRenderer resetPaintFramebufferAccumulate:](v171, 1);
          goto LABEL_105;
        }
      }
      v165 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
      v166 = *MEMORY[0x1E0C9D628];
      v164 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
      rect = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
      v85 = v76;
      v86 = v157[1];
      *(_OWORD *)&buf[0].a = *v157;
      *(_OWORD *)&buf[0].c = v86;
      *(_OWORD *)&buf[0].tx = v157[2];
      *(_QWORD *)&v86 = v165;
      v87 = v166;
      v88 = v164;
      v89 = rect;
      v207 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v86 - 8), buf);
      -[PKMetalRenderer finishRenderingNoTeardownForStroke:clippedToPixelSpaceRect:renderEncoder:](v171, v77, v85, v207.origin.x, v207.origin.y, v207.size.width, v207.size.height);
      -[PKMetalRenderer finishRendering](v171);

LABEL_105:
      if (*(_BYTE *)(*(_QWORD *)(v77 + 96) + 108))
      {
        v90 = *(void **)(v77 + 288);
        if (!v90 || *(double *)(v77 + 304) < 0.01 || *(double *)(v77 + 296) < 0.01)
        {
          if (*v84 && objc_msgSend(v90, "count"))
          {
            v91 = objc_msgSend(*(id *)(v77 + 288), "copy");
            v92 = *(void **)(v171 + 656);
            *(_QWORD *)(v171 + 656) = v91;

          }
          v93 = _Block_copy(*(const void **)(v77 + 352));
          if (v93)
          {
            v94 = *(_QWORD **)(v171 + 8);
            if (v94)
              v94 = (_QWORD *)v94[7];
            v95 = v94;
            *(_QWORD *)&buf[0].a = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[0].b = 3221225472;
            *(_QWORD *)&buf[0].c = __36__PKMetalRenderer_finishFrontStroke__block_invoke;
            *(_QWORD *)&buf[0].d = &unk_1E777B108;
            *(_QWORD *)&buf[0].tx = v93;
            objc_msgSend(v95, "addCompletedHandler:", buf);

          }
        }
      }
      v96 = *(_QWORD *)(v171 + 624);
      v97 = v96 + 360;
      v98 = *(_QWORD *)(v171 + 632);
      if (v96 + 360 == v98)
      {
        v124 = v171;
      }
      else
      {
        v99 = 0;
        do
        {
          v100 = v96 + v99;
          std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](v96 + v99, (__int128 *)(v96 + v99 + 360));
          std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](v100 + 16, (__int128 *)(v100 + 376));
          std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](v100 + 32, (__int128 *)(v100 + 392));
          std::shared_ptr<PKProtobufUnknownFields>::operator=[abi:ne180100](v100 + 48, (__int128 *)(v100 + 408));
          *(_QWORD *)(v100 + 64) = *(_QWORD *)(v100 + 424);
          *(_DWORD *)(v100 + 71) = *(_DWORD *)(v100 + 431);
          v101 = *(_QWORD *)(v96 + v99 + 440);
          *(_QWORD *)(v100 + 440) = 0;
          v102 = *(void **)(v96 + v99 + 80);
          *(_QWORD *)(v100 + 80) = v101;

          v103 = *(_QWORD *)(v96 + v99 + 448);
          *(_QWORD *)(v100 + 448) = 0;
          v104 = *(void **)(v96 + v99 + 88);
          *(_QWORD *)(v100 + 88) = v103;

          v105 = v96 + v99;
          v106 = (uint64_t *)(v96 + v99 + 96);
          v107 = *v106;
          v108 = *(_QWORD *)(v96 + v99 + 456);
          v106[45] = 0;
          *v106 = v108;
          if (v107)
            std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)v106, v107);
          v109 = *(_QWORD *)(v105 + 464);
          *(_QWORD *)(v105 + 464) = 0;
          std::unique_ptr<PKMetalInputProvider>::reset[abi:ne180100]((uint64_t *)(v105 + 104), v109);
          v110 = *(_OWORD *)(v105 + 616);
          *(_OWORD *)(v105 + 240) = *(_OWORD *)(v105 + 600);
          *(_OWORD *)(v105 + 256) = v110;
          *(_OWORD *)(v105 + 270) = *(_OWORD *)(v105 + 630);
          v111 = *(_OWORD *)(v105 + 552);
          *(_OWORD *)(v105 + 176) = *(_OWORD *)(v105 + 536);
          *(_OWORD *)(v105 + 192) = v111;
          v112 = *(_OWORD *)(v105 + 584);
          *(_OWORD *)(v105 + 208) = *(_OWORD *)(v105 + 568);
          *(_OWORD *)(v105 + 224) = v112;
          v113 = *(_OWORD *)(v105 + 488);
          *(_OWORD *)(v105 + 112) = *(_OWORD *)(v105 + 472);
          *(_OWORD *)(v105 + 128) = v113;
          v114 = *(_OWORD *)(v105 + 520);
          *(_OWORD *)(v105 + 144) = *(_OWORD *)(v105 + 504);
          *(_OWORD *)(v105 + 160) = v114;
          v115 = *(_QWORD *)(v105 + 648);
          *(_QWORD *)(v105 + 648) = 0;
          v116 = *(void **)(v105 + 288);
          *(_QWORD *)(v105 + 288) = v115;

          v117 = (_QWORD *)(v96 + v99);
          v118 = (_OWORD *)(v96 + v99 + 296);
          v119 = *(_OWORD *)(v96 + v99 + 672);
          *v118 = *(_OWORD *)(v96 + v99 + 656);
          v118[1] = v119;
          *(_OWORD *)((char *)v118 + 27) = *(_OWORD *)(v96 + v99 + 683);
          v120 = *(_QWORD *)(v96 + v99 + 704);
          v117[88] = 0;
          v121 = *(void **)(v96 + v99 + 344);
          v117[43] = v120;

          v122 = *(_QWORD *)(v96 + v99 + 712);
          v117[89] = 0;
          v123 = *(void **)(v96 + v99 + 352);
          v117[44] = v122;

          v99 += 360;
        }
        while (v96 + v99 + 360 != v98);
        v124 = v171;
        v97 = *(_QWORD *)(v171 + 632);
        v96 += v99;
      }
      while (v97 != v96)
      *(_QWORD *)(v124 + 632) = v96;
      if (*(_QWORD *)(v124 + 624) == v96)
      {
        if (!*(_BYTE *)(v124 + 936) || (v125 = objc_msgSend(*(id *)(v124 + 656), "count"), v124 = v171, v125))
        {
          -[PKMetalRenderer purgePaintFramebuffers](v124);
          v124 = v171;
          *(_BYTE *)(v171 + 121) = 1;
          *(_BYTE *)(v171 + 153) = 1;
          *(_BYTE *)(v171 + 137) = 1;
          *(_BYTE *)(v171 + 169) = 1;
          v126 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          *obja = *MEMORY[0x1E0C9D628];
          obja[1] = v126;
        }
      }
      v127 = *(_QWORD *)(v124 + 8);
      if (v127)
        objc_msgSend(*(id *)(v127 + 80), "popDebugGroup");

      if (v160)
      {
        v29 = v171;
        v62 = v173;
        if (!*(_BYTE *)(v171 + 936))
        {
          for (k = 0; ; ++k)
          {
            v134 = *(_QWORD *)(v29 + 8);
            if (v134)
              v134 = *(_QWORD *)(v134 + 144);
            if (k >= v134)
              break;
            if (k)
              v135 = 5;
            else
              v135 = 2;
            -[PKMetalRenderer eraseShaderForAttachmentIndex:]((_QWORD *)v29, v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](v29, v136, v58);

            v29 = v171;
            v62 = v173;
          }
        }
        v59 = 0;
      }
      else
      {
        v59 = 0;
        v29 = v171;
        v62 = v173;
      }
LABEL_136:
      if (v62 != v168 - 1 && !*(_BYTE *)(v29 + 936))
      {
        memset(buf, 0, 32);
        if (*(_QWORD *)&buf[0].c)
        {
          if (*(_QWORD *)&buf[0].d)
          {
            for (m = 0; ; ++m)
            {
              v129 = *(_QWORD *)(v29 + 8);
              if (v129)
                v129 = *(_QWORD *)(v129 + 144);
              if (m >= v129)
                break;
              if (m)
                v130 = 4;
              else
                v130 = 1;
              -[PKMetalRenderer eraseShaderForAttachmentIndex:]((_QWORD *)v29, v130);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](v29, v131, v58);

              v29 = v171;
            }
            v132 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
            *obja = *MEMORY[0x1E0C9D628];
            obja[1] = v132;
          }
        }
      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](v29, v58);
    }
  }
  v137 = *(void **)(v29 + 648);
  if (v137)
  {
    v138 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&buf[0].a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&buf[0].c = v138;
    *(_OWORD *)&buf[0].tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v139 = fabs(v51 * v53 - v52 * v54);
    if (v139 >= 0.001 && v139 != INFINITY && fabs(v56) != INFINITY && fabs(v55) != INFINITY && a5 > 0.0 && a6 > 0.0)
    {
      t1.a = v51;
      t1.b = v52;
      t1.c = v54;
      t1.d = v53;
      t1.tx = v56;
      t1.ty = v55;
      t2.a = 2.0 / a5;
      t2.c = 0.0;
      t2.b = 0.0;
      t2.d = 2.0 / a6;
      __asm { FMOV            V0.2D, #-1.0 }
      v169 = _Q0;
      *(_OWORD *)&t2.tx = _Q0;
      CGAffineTransformConcat(buf, &t1, &t2);
      v198.c = 0.0;
      v198.b = 0.0;
      __asm { FMOV            V1.2D, #0.5 }
      v146 = vmulq_f64(*(float64x2_t *)(v29 + 248), _Q1);
      v198.d = v146.f64[1];
      v198.a = v146.f64[0];
      *(float64x2_t *)&v198.tx = v146;
      v197.a = v51;
      v197.b = v52;
      v197.c = v54;
      v197.d = v53;
      v197.tx = v56;
      v197.ty = v55;
      CGAffineTransformConcat(&v199, &v198, &v197);
      v196.a = 2.0 / a5;
      v196.b = 0.0;
      v196.c = 0.0;
      v196.d = 2.0 / a6;
      *(_OWORD *)&v196.tx = v169;
      CGAffineTransformConcat(&v200, &v199, &v196);
      buf[0] = v200;
    }
    v147 = *(_QWORD *)(v29 + 192);
    if (v147)
      v148 = *(unsigned __int8 *)(v147 + 428) != 0;
    else
      v148 = 0;
    v200 = buf[0];
    -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](v29, v137, (uint64_t)&v200, 0, v148, v58, 0, a5, a6, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
    v29 = v171;
  }
  else
  {
    buf[0].a = v51;
    buf[0].b = v52;
    buf[0].c = v54;
    buf[0].d = v53;
    buf[0].tx = v56;
    buf[0].ty = v55;
    -[PKMetalRenderer renderWithTransform:animatingStroke:mode:clipped:renderBufferSize:renderEncoder:](v29, &buf[0].a, 0, 0, 0, v58, a5, a6);
  }
LABEL_170:
  v149 = *(_QWORD *)(v29 + 8);
  if (v149)
    objc_msgSend(*(id *)(v149 + 80), "popDebugGroup");

  *(_BYTE *)(v171 + 352) = v151;
  v150 = *(_QWORD *)(v171 + 8);
  if (v150)
    objc_msgSend(*(id *)(v150 + 80), "popDebugGroup");
  if (!*(_BYTE *)(v171 + 930))
  {
    -[PKMetalRenderState commitAndPurgeResourceSet:](*(_QWORD *)(v171 + 8), v170);
    v174 = v153;
    v175 = vdupq_n_s64(1uLL);
    v176 = v175;
    v177 = v194;
    v178 = v195;
    v179 = v155;
    v180 = v160;
    v181 = v192;
    v182 = v193;
    v183 = v154;
    -[PKMetalRenderer setupRenderStateWithLiveRenderConfig:](v171, (uint64_t)&v174);
  }

LABEL_177:
}

- (void)resetPaintFramebufferAccumulate:(uint64_t)a1
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v28;
  uint64_t i;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  unint64_t j;
  unint64_t v44;
  int v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD **v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  id v53;
  _QWORD *v54;
  id v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  _OWORD v66[2];
  __int128 v67;
  __int128 v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
    v4 = (_QWORD *)v4[10];
  v5 = v4;
  -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("resetPaintFramebufferAccumulateIfNeeded"));
  if (a2)
  {
    -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("Render into accumulator"));
    v6 = *(_QWORD *)(a1 + 624);
    v7 = *(double *)(v6 + 184);
    v8 = *(double *)(v6 + 192);
    v9 = *(double *)(v6 + 200);
    v10 = *(double *)(v6 + 208);
    v11 = *(_QWORD **)(v6 + 96);
    v12 = *(_QWORD *)(v6 + 160);
    v13 = v11[10];
    v14 = v11[11];
    v15 = v11[9];
    *(_BYTE *)(v6 + 72) = 1;
    v16 = *(_QWORD *)(v6 + 304);
    *(_QWORD *)(v6 + 304) = 0x3FF0000000000000;
    -[PKMetalRenderer setupViewScissorClippingIfNecessaryForRenderEncoder:](a1, v5);
    v17 = 0x2E8BA2E8BA2E8BA3 * ((v14 - v13) >> 3);
    if (v17 >= v15)
      v17 = v15;
    v18 = v13 + 88 * v17;
    if (v12 <= 1)
      v19 = 1;
    else
      v19 = v12;
    -[PKMetalRenderer renderStroke:animatingStroke:renderEncoder:computeEncoder:renderCache:](a1, v13 + 88 * v19 - 88, v18, v6, v5, 0, 0);
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v5);
    *(_BYTE *)(v6 + 72) = 0;
    *(_QWORD *)(v6 + 304) = v16;
    v20 = *(_QWORD *)(a1 + 8);
    if (v20)
      objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v20 + 80));
    v69.origin.x = v7;
    v69.origin.y = v8;
    v69.size.width = v9;
    v69.size.height = v10;
    *(CGRect *)(v6 + 184) = CGRectUnion(v69, *(CGRect *)(v6 + 184));
    *(_QWORD *)(v6 + 160) = *(_QWORD *)(*(_QWORD *)(v6 + 96) + 72);
    v21 = *(_QWORD *)(a1 + 8);
    if (v21)
      objc_msgSend(*(id *)(v21 + 80), "popDebugGroup");
  }
  v22 = *(_QWORD *)(a1 + 624);
  if (v22 == *(_QWORD *)(a1 + 632))
  {
    v37 = *(_QWORD *)(a1 + 624);
  }
  else
  {
    if (objc_msgSend(*(id *)(v22 + 288), "count"))
    {
      v23 = *(_QWORD *)(a1 + 624);
      v70 = CGRectUnion(*(CGRect *)(v23 + 216), *(CGRect *)(a1 + 664));
      v71 = CGRectIntegral(v70);
      x = v71.origin.x;
      y = v71.origin.y;
      width = v71.size.width;
      height = v71.size.height;
      v28 = 0;
      for (i = 144; ; i += 16)
      {
        v30 = *(_QWORD **)(a1 + 8);
        v31 = v30 ? v30[18] : 0;
        if (v28 >= v31)
          break;
        v32 = *(_QWORD *)(a1 + 192);
        if (v32 && *(_BYTE *)(v32 + 428))
        {
          if (v30)
            v30 = (_QWORD *)v30[10];
          v33 = v30;
          -[PKMetalRenderer copyFromFramebuffer:toFramebuffer:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v33, v28, x, y, width, height, *(double *)(v23 + 304));
        }
        else
        {
          v34 = *(_QWORD **)(a1 + i);
          if (v34)
            v34 = (_QWORD *)v34[3];
          v33 = v34;
          v35 = *(_QWORD **)(a1 + 8);
          if (v35)
            v35 = (_QWORD *)v35[10];
          v36 = v35;
          -[PKMetalRenderer copyIntoPaintFromTexture:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v33, v36, v28, x, y, width, height, *(double *)(v23 + 304));

        }
        ++v28;
      }
      goto LABEL_76;
    }
    v37 = *(_QWORD *)(a1 + 632);
    v22 = *(_QWORD *)(a1 + 624);
  }
  if (*(_BYTE *)(a1 + 936))
  {
    if (v37 - v22 == 360)
    {
      v72 = CGRectUnion(*(CGRect *)(v22 + 184), *(CGRect *)(a1 + 664));
      goto LABEL_46;
    }
LABEL_44:
    if (v22 == v37)
    {
      x = *(double *)(a1 + 664);
      y = *(double *)(a1 + 672);
      width = *(double *)(a1 + 680);
      height = *(double *)(a1 + 688);
LABEL_59:
      v74.origin.x = x;
      v74.origin.y = y;
      v74.size.width = width;
      v74.size.height = height;
      if (CGRectIsNull(v74))
        goto LABEL_76;
      v75.origin.x = x;
      v75.origin.y = y;
      v75.size.width = width;
      v75.size.height = height;
      v76 = CGRectIntegral(v75);
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;
      -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("copyFromAccumulatorToPaint"));
      v47 = *(_QWORD *)(a1 + 8);
      if (!v47)
      {
LABEL_76:
        v78.origin.x = x;
        v78.origin.y = y;
        v78.size.width = width;
        v78.size.height = height;
        *(CGRect *)(a1 + 720) = CGRectUnion(*(CGRect *)(a1 + 720), v78);
        v62 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
        *(_OWORD *)(a1 + 680) = v62;
        goto LABEL_77;
      }
      v48 = 0;
      v49 = (_QWORD **)(a1 + 144);
      while (1)
      {
        if (v48 >= *(_QWORD *)(v47 + 144))
        {
          objc_msgSend(*(id *)(v47 + 80), "popDebugGroup");
          goto LABEL_76;
        }
        v50 = *(_QWORD *)(a1 + 192);
        if (!v50)
          break;
        v51 = *v49;
        if (!*(_BYTE *)(v50 + 428))
          goto LABEL_67;
        v52 = *(v49 - 4);
        v53 = *(id *)(v47 + 80);
        v54 = v51;
        v55 = v52;
        v56 = v53;
        -[PKMetalRenderer copyFromFramebuffer:toFramebuffer:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v56, v48, x, y, width, height, 1.0);
        v57 = v56;
LABEL_72:

        ++v48;
        v47 = *(_QWORD *)(a1 + 8);
        v49 += 2;
        if (!v47)
          goto LABEL_76;
      }
      v51 = *v49;
LABEL_67:
      if (v51)
        v58 = (void *)v51[3];
      else
        v58 = 0;
      v59 = v58;
      v60 = *(_QWORD **)(a1 + 8);
      if (v60)
        v60 = (_QWORD *)v60[10];
      v61 = v60;
      v55 = v59;
      v56 = v61;
      -[PKMetalRenderer copyIntoPaintFromTexture:clipRect:renderEncoder:paintIndex:alphaBlendFactor:](a1, v55, v56, v48, x, y, width, height, 1.0);
      v54 = v56;
      v57 = v55;
      goto LABEL_72;
    }
    v72 = CGRectUnion(*(CGRect *)(v22 + 216), *(CGRect *)(a1 + 664));
LABEL_46:
    x = v72.origin.x;
    y = v72.origin.y;
    width = v72.size.width;
    height = v72.size.height;
    goto LABEL_59;
  }
  if (v22 != v37 && (*(uint64_t *)(v22 + 160) > 0 || a2 != 0))
  {
    if (v37 - v22 == 360)
    {
      x = *(double *)(v22 + 184);
      y = *(double *)(v22 + 192);
      width = *(double *)(v22 + 200);
      height = *(double *)(v22 + 208);
      goto LABEL_59;
    }
    goto LABEL_44;
  }
  if (!CGRectIsNull(*(CGRect *)(a1 + 664)))
  {
    -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("Erase Paint"));
    v73 = CGRectIntegral(*(CGRect *)(a1 + 664));
    v39 = v73.origin.x;
    v40 = v73.origin.y;
    v41 = v73.size.width;
    v42 = v73.size.height;
    v67 = 0u;
    v68 = 0u;
    if ((_QWORD)v68 && *((_QWORD *)&v68 + 1))
    {
      v77.origin.x = v39;
      v77.origin.y = v40;
      v77.size.width = v41;
      v77.size.height = v42;
      *(CGRect *)(a1 + 720) = CGRectUnion(*(CGRect *)(a1 + 720), v77);
      v66[0] = v67;
      v66[1] = v68;
      objc_msgSend(v5, "setScissorRect:", v66);
      for (j = 0; ; ++j)
      {
        v44 = *(_QWORD *)(a1 + 8);
        if (v44)
          v44 = *(_QWORD *)(v44 + 144);
        if (j >= v44)
          break;
        if (j)
          v45 = 4;
        else
          v45 = 1;
        -[PKMetalRenderer eraseShaderForAttachmentIndex:]((_QWORD *)a1, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v5);
        -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v46, v5);

      }
      -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v5);
    }
    v64 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(a1 + 680) = v64;
    v65 = *(_QWORD *)(a1 + 8);
    if (v65)
      objc_msgSend(*(id *)(v65 + 80), "popDebugGroup");
  }
LABEL_77:
  v63 = *(_QWORD *)(a1 + 8);
  if (v63)
    objc_msgSend(*(id *)(v63 + 80), "popDebugGroup");

}

- (void)renderLiveStrokeWithTransform:(double)a3 renderBufferSize:(double)a4
{
  uint64_t v5;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  _OWORD v17[3];

  if (a1)
  {
    v5 = a1[79];
    if (v5 != a1[78])
    {
      if (*(_BYTE *)(v5 - 184))
      {
        if (*(_BYTE *)(v5 - 23))
        {
          objc_msgSend(*(id *)(v5 - 280), "ink");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ink.marker"), CACurrentMediaTime()) & 1) != 0
            || objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.ink.pencil")))
          {
            v10 = 3;
          }
          else
          {
            v10 = 1;
          }
          -[PKMetalRenderer drawNewPointsAt:drawCount:]((uint64_t)a1, v10);

        }
        v11 = (_QWORD *)a1[1];
        if (v11)
          v11 = (_QWORD *)v11[10];
        v16 = v11;
        -[PKMetalRenderState pushDebugGroup:](a1[1], CFSTR("renderLiveStrokeWithTransform"));
        v12 = a1[79] - 360;
        v13 = a2[1];
        v17[0] = *a2;
        v17[1] = v13;
        v17[2] = a2[2];
        -[PKMetalRenderer renderWithTransform:animatingStroke:mode:clipped:renderBufferSize:renderEncoder:]((uint64_t)a1, (double *)v17, v12, 0, 1, v16, a3, a4);
        v14 = a1[1];
        if (v14)
          objc_msgSend(*(id *)(v14 + 80), "popDebugGroup");

      }
    }
  }
}

- (void)renderWithTransform:(uint64_t)a3 animatingStroke:(unint64_t)a4 mode:(int)a5 clipped:(void *)a6 renderBufferSize:(double)a7 renderEncoder:(double)a8
{
  id v15;
  __int128 v16;
  double *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  __int128 v23;
  float64x2_t v30;
  __int128 v31;
  double v32;
  void *v34;
  id v35;
  uint64_t v36;
  _BOOL4 v37;
  unsigned __int8 *v38;
  uint64_t v39;
  _BOOL4 v40;
  __int128 v41;
  CGAffineTransform v42;
  _OWORD v43[2];
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v15 = a6;
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v54.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v54.c = v16;
  *(_OWORD *)&v54.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v17 = (double *)MEMORY[0x1E0C9D628];
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v22 = fabs(*a2 * a2[3] - a2[1] * a2[2]);
  if (v22 >= 0.001 && v22 != INFINITY && fabs(a2[4]) != INFINITY && fabs(a2[5]) != INFINITY && a7 > 0.0 && a8 > 0.0)
  {
    v23 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = *((_OWORD *)a2 + 2);
    t2.a = 2.0 / a7;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.d = 2.0 / a8;
    __asm { FMOV            V0.2D, #-1.0 }
    v41 = _Q0;
    *(_OWORD *)&t2.tx = _Q0;
    CGAffineTransformConcat(&v54, &t1, &t2);
    v49.b = 0.0;
    v49.c = 0.0;
    __asm { FMOV            V1.2D, #0.5 }
    v30 = vmulq_f64(*(float64x2_t *)(a1 + 248), _Q1);
    v49.d = v30.f64[1];
    v49.a = v30.f64[0];
    *(float64x2_t *)&v49.tx = v30;
    v31 = *((_OWORD *)a2 + 1);
    *(_OWORD *)&v48.a = *(_OWORD *)a2;
    *(_OWORD *)&v48.c = v31;
    *(_OWORD *)&v48.tx = *((_OWORD *)a2 + 2);
    CGAffineTransformConcat(&v50, &v49, &v48);
    v47.a = 2.0 / a7;
    v47.b = 0.0;
    v47.c = 0.0;
    v47.d = 2.0 / a8;
    *(_OWORD *)&v47.tx = v41;
    CGAffineTransformConcat(&v51, &v50, &v47);
    v54 = v51;
  }
  if (a3)
  {
    if (a5 && !CGRectIsNull(*(CGRect *)(a3 + 184)))
    {
      v55 = *(CGRect *)(a3 + 184);
      v32 = *(double *)(a1 + 232);
      v46.a = 2.0 / *(double *)(a1 + 224);
      v46.b = 0.0;
      v46.c = 0.0;
      v46.d = 2.0 / v32;
      __asm { FMOV            V4.2D, #-1.0 }
      *(_OWORD *)&v46.tx = _Q4;
      v56 = CGRectApplyAffineTransform(v55, &v46);
      v45 = v54;
      v57 = CGRectApplyAffineTransform(v56, &v45);
      v44.a = a7 * 0.5;
      v44.b = 0.0;
      v44.c = 0.0;
      v44.d = a8 * 0.5;
      v44.tx = a7 * 0.5;
      v44.ty = a8 * 0.5;
      v58 = CGRectApplyAffineTransform(v57, &v44);
      v59 = CGRectIntegral(v58);
      x = v59.origin.x;
      y = v59.origin.y;
      width = v59.size.width;
      height = v59.size.height;
      memset(&v51, 0, 32);
      if (*(_QWORD *)&v51.c && *(_QWORD *)&v51.d)
      {
        v43[0] = *(_OWORD *)&v51.a;
        v43[1] = *(_OWORD *)&v51.c;
        objc_msgSend(v15, "setScissorRect:", v43);
      }
      else
      {
        x = *v17;
        y = v17[1];
        width = v17[2];
        height = v17[3];
      }
    }
    v34 = *(void **)(a3 + 80);
  }
  else
  {
    v34 = 0;
  }
  v35 = v34;
  v36 = *(_QWORD *)(a1 + 192);
  if (v36)
    v37 = *(unsigned __int8 *)(v36 + 428) != 0;
  else
    v37 = 0;
  v42 = v54;
  if (a3)
  {
    v38 = (unsigned __int8 *)(a3 + 285);
  }
  else
  {
    v39 = *(_QWORD *)(a1 + 8);
    if (!v39)
    {
      v40 = 0;
      goto LABEL_24;
    }
    v38 = (unsigned __int8 *)(v39 + 42);
  }
  v40 = *v38 != 0;
LABEL_24:
  -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](a1, v35, (uint64_t)&v42, a4, v37, v15, v40, a7, a8, x, y, width, height);
  -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v15);

}

- (void)finishLiveStrokeAndPresentDrawable:(int)a3 waitUntilScheduled:
{
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    -[PKMetalRenderState lastCommandBuffer](*(id **)(a1 + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "presentDrawable:", v6);
      objc_msgSend(v5, "addCompletedHandler:", &__block_literal_global_42);
    }
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    if (a3)
      objc_msgSend(v5, "waitUntilScheduled");
    if (*(_QWORD *)(a1 + 624) == *(_QWORD *)(a1 + 632) && !*(_BYTE *)(a1 + 936))
      -[PKMetalRenderer purgePaintFramebuffers](a1);

  }
}

uint64_t __73__PKMetalRenderer_finishLiveStrokeAndPresentDrawable_waitUntilScheduled___block_invoke()
{
  return kdebug_trace();
}

- (void)purgePaintFramebuffers
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int v12;

  if (a1)
  {
    v1 = 0;
    v2 = a1 + 112;
    v3 = a1 + 144;
    v4 = 1;
    do
    {
      v5 = v4;
      v6 = v2 + 16 * v1;
      v8 = *(unsigned __int8 *)(v6 + 8);
      v7 = (_BYTE *)(v6 + 8);
      v9 = 16 * v1;
      if (v8)
      {
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(v2 + 16 * v1));
        *v7 = 0;
      }
      v10 = v3 + 16 * v1;
      v12 = *(unsigned __int8 *)(v10 + 8);
      v11 = (_BYTE *)(v10 + 8);
      if (v12)
      {
        -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(v3 + v9));
        *v11 = 0;
      }
      v4 = 0;
      v1 = 1;
    }
    while ((v5 & 1) != 0);
  }
}

- (void)addStrokeSpaceDrawableDirtyRect:(double)a3
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  __int128 v10;
  CGAffineTransform v11;
  CGRect v12;
  CGRect v13;

  if (a1)
  {
    v6 = *(double *)(a1 + 720);
    v7 = *(double *)(a1 + 728);
    v8 = *(double *)(a1 + 736);
    v9 = *(double *)(a1 + 744);
    v10 = *(_OWORD *)(a1 + 288);
    *(_OWORD *)&v11.a = *(_OWORD *)(a1 + 272);
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tx = *(_OWORD *)(a1 + 304);
    v13 = CGRectApplyAffineTransform(*(CGRect *)&a2, &v11);
    v12.origin.x = v6;
    v12.origin.y = v7;
    v12.size.width = v8;
    v12.size.height = v9;
    *(CGRect *)(a1 + 720) = CGRectUnion(v12, v13);
  }
}

uint64_t __36__PKMetalRenderer_finishFrontStroke__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (__n128)setCombineStrokesAllowed:(uint64_t)a1
{
  void *v3;
  void *v4;
  __n128 result;
  __int128 v6;

  if (a1)
  {
    *(_BYTE *)(a1 + 936) = a2;
    if ((a2 & 1) == 0)
    {
      v3 = *(void **)(a1 + 648);
      *(_QWORD *)(a1 + 648) = 0;

      v4 = *(void **)(a1 + 656);
      *(_QWORD *)(a1 + 656) = 0;

      -[PKMetalRenderer purgePaintFramebuffers](a1);
      *(_BYTE *)(a1 + 121) = 1;
      *(_BYTE *)(a1 + 153) = 1;
      *(_BYTE *)(a1 + 137) = 1;
      *(_BYTE *)(a1 + 169) = 1;
      result = *(__n128 *)MEMORY[0x1E0C9D628];
      v6 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(a1 + 664) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(a1 + 680) = v6;
    }
  }
  return result;
}

- (void)renderStroke:(uint64_t)a3 withTransform:(unint64_t)a4 mode:(int)a5 flipped:(void *)a6 renderBufferSize:(int)a7 renderEncoder:(double)a8 currentClipRect:(double)a9 needRenderMask:(CGFloat)a10
{
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  id v27;
  id v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  id v35;
  CGColor *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  const CGAffineTransform *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  double v51;
  void *v52;
  void *v53;
  _BOOL4 v54;
  __int128 v55;
  unsigned int v56;
  float v57;
  void *v58;
  float32x4_t v59;
  void *v60;
  float32x4_t v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  uint64_t v70;
  float v71;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  __int128 v87;
  float32x4_t v88;
  float64x2_t v89;
  float64x2_t v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  __int128 v104;
  float v105;
  float v106;
  uint64_t v107;
  void *v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  unint64_t v119;
  _QWORD **v120;
  _QWORD **v121;
  _QWORD *v122;
  _QWORD *v123;
  uint64_t v124;
  _QWORD *v125;
  _QWORD *v126;
  _QWORD *v127;
  _QWORD *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  double v134;
  double v135;
  double v136;
  __int128 v137;
  float32x2_t v138;
  float32x2_t v139;
  float32x2_t v140;
  char v142;
  void *v143;
  id v144;
  CGColor *v145;
  uint64_t v146;
  unint64_t v147;
  _QWORD *v148;
  double d;
  void *v150;
  _BOOL4 v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  __int128 v157;
  unsigned int v158;
  float v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  unint64_t v166;
  void *v167;
  _BOOL4 v168;
  void *v169;
  int v170;
  uint64_t v171;
  unint64_t v172;
  void *v173;
  int v174;
  uint64_t v175;
  unint64_t v176;
  NSObject *v177;
  void *v178;
  int v179;
  uint64_t v180;
  unint64_t v181;
  uint64_t v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  __int128 v191;
  float32x4_t v192;
  float64x2_t v193;
  float64x2_t v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  __int128 v208;
  float v209;
  float v210;
  uint64_t v211;
  double v212;
  double v213;
  CGFloat v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  const CGAffineTransform *v225;
  double v226;
  id v227;
  CGColor *v228;
  CGFloat v229;
  void *v230;
  void *v231;
  char v232;
  double v233;
  CGFloat v234;
  CGFloat v235;
  double v236;
  CGFloat v237;
  double v238;
  BOOL IsNull;
  double v240;
  CGFloat v241;
  CGFloat v242;
  CGFloat v243;
  double v244;
  double v245;
  double v246;
  CGFloat v247;
  CGFloat v248;
  CGFloat v249;
  id v250;
  uint64_t v251;
  unint64_t v252;
  __int128 v253;
  uint64_t v254;
  void *v255;
  id v256;
  id v257;
  BOOL v258;
  uint64_t v259;
  unint64_t v260;
  uint64_t v261;
  void *v262;
  id v263;
  __int128 v264;
  const CGAffineTransform *v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  id v270;
  double v271;
  double v272;
  double v273;
  double v274;
  id v275;
  double v276;
  double v277;
  float32x4_t v278;
  float32x4_t v279;
  double a;
  double b;
  double c;
  double v283;
  double ty;
  _BYTE *v285;
  _BYTE *v286;
  char *v287;
  char *v288;
  char *v289;
  uint64_t v290;
  double v291;
  double v292;
  int64_t v293;
  uint64_t v294;
  char *v295;
  double v296;
  double v297;
  unint64_t *v298;
  uint64_t v299;
  unint64_t v300;
  unint64_t v301;
  char *v302;
  unint64_t *v303;
  char *v304;
  char *v305;
  unint64_t v306;
  __int128 v307;
  float32x4_t v308;
  unint64_t *v309;
  uint64_t v310;
  unint64_t v311;
  unint64_t v312;
  char *v313;
  char *v314;
  char *v315;
  char *v316;
  uint64_t v317;
  unint64_t *v318;
  uint64_t v319;
  unint64_t v320;
  unint64_t v321;
  char *v322;
  unint64_t *v323;
  char *v324;
  char *v325;
  unint64_t v326;
  unint64_t *v327;
  uint64_t v328;
  unint64_t v329;
  unint64_t v330;
  char *v331;
  unint64_t *v332;
  char *v333;
  char *v334;
  unint64_t v335;
  char *v336;
  uint64_t v337;
  unint64_t v338;
  unint64_t v339;
  char *v340;
  unint64_t *v341;
  char *v342;
  char *v343;
  unint64_t v344;
  uint64_t v345;
  unint64_t v346;
  unint64_t v347;
  char *v348;
  char *v349;
  char *v350;
  char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  char *v355;
  double v356;
  double v357;
  char *v358;
  uint64_t v359;
  unint64_t v360;
  unint64_t v361;
  char *v362;
  char *v363;
  char *v364;
  char *v365;
  uint64_t v366;
  float32x4_t v367;
  float32x4_t v368;
  unint64_t *v369;
  uint64_t v370;
  unint64_t v371;
  unint64_t v372;
  char *v373;
  char *v374;
  char *v375;
  char *v376;
  uint64_t v377;
  unint64_t *v378;
  uint64_t v379;
  unint64_t v380;
  unint64_t v381;
  char *v382;
  unint64_t *v383;
  char *v384;
  char *v385;
  unint64_t v386;
  unint64_t *v387;
  uint64_t v388;
  unint64_t v389;
  unint64_t v390;
  char *v391;
  unint64_t *v392;
  char *v393;
  char *v394;
  unint64_t v395;
  char *v396;
  uint64_t v397;
  unint64_t v398;
  unint64_t v399;
  char *v400;
  unint64_t *v401;
  char *v402;
  char *v403;
  unint64_t v404;
  uint64_t v405;
  unint64_t v406;
  unint64_t v407;
  char *v408;
  char *v409;
  char *v410;
  char *v411;
  uint64_t v412;
  void *v413;
  id v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  _QWORD *v418;
  _QWORD *v419;
  _QWORD *v420;
  _QWORD *v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  uint64_t v428;
  double v429;
  double v430;
  double v431;
  __int128 v432;
  uint64_t v433;
  uint64_t v434;
  unint64_t v435;
  _QWORD **v436;
  _QWORD **v437;
  _QWORD *v438;
  _QWORD *v439;
  uint64_t v440;
  CGFloat v441;
  double v442;
  double v443;
  double MaxY;
  double v445;
  CGFloat MaxX;
  __int128 v447;
  void *v448;
  void *v449;
  void *v450;
  uint64_t v451;
  BOOL v452;
  uint64_t v453;
  uint64_t v454;
  double v455;
  double v456;
  double v457;
  double v458;
  __int128 v459;
  double v460;
  double v461;
  BOOL v462;
  double v463;
  uint64_t v464;
  double v465;
  double v466;
  double v467;
  double v468;
  double v469;
  double v470;
  __int128 v471;
  double r1;
  _QWORD *v473;
  CGFloat height;
  _QWORD *v475;
  float64x2_t v476;
  float64x2_t v477;
  double v480;
  float64x2_t v481;
  __int128 v482;
  int v483;
  double v484;
  float64x2_t v485;
  float32x4_t v486;
  float32x4_t v487;
  double v488;
  float32x4_t v489;
  double v490;
  float32x4_t v491;
  unint64_t v492;
  void *v493;
  char r2;
  CGFloat r2a;
  float32x4_t r2b;
  float32x4_t r2c;
  unint64_t r2d;
  unint64_t r2e;
  float32x4_t rect;
  double recta;
  CGFloat rectb;
  unint64_t rectc;
  float32x4_t rectd;
  float32x4_t recte;
  float32x4_t rectf;
  float32x4_t rectg;
  uint64_t recth;
  int v509;
  void *v510;
  CGAffineTransform v511;
  CGAffineTransform v512;
  CGAffineTransform v513;
  float64x2_t v514[3];
  _OWORD v515[3];
  _OWORD v516[2];
  float64x2_t v517[3];
  _OWORD v518[3];
  _OWORD v519[2];
  float64x2_t v520[3];
  _OWORD v521[3];
  _OWORD v522[2];
  float64x2_t v523[3];
  _OWORD v524[3];
  CGAffineTransform v525;
  CGAffineTransform v526;
  CGAffineTransform v527;
  CGAffineTransform v528;
  CGAffineTransform v529;
  CGAffineTransform v530;
  CGAffineTransform v531;
  _OWORD v532[2];
  __int128 v533;
  int v534;
  float v535;
  float32x2_t v536;
  float32x4_t v537;
  float32x4_t v538;
  int v539;
  CGAffineTransform v540;
  CGAffineTransform v541;
  CGAffineTransform t2;
  CGAffineTransform t1;
  float32x4_t v544;
  void *v545;
  void *__p;
  char *v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  char v561;
  CGAffineTransform v562;
  __int128 v563;
  CGAffineTransform v564;
  float64x2_t v565;
  float64x2_t v566;
  CGAffineTransform v567;
  uint64_t v568;
  CGRect v569;
  CGRect v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;
  CGRect v575;
  CGRect v576;
  CGRect v577;
  CGRect v578;
  CGRect v579;

  v568 = *MEMORY[0x1E0C80C00];
  v23 = a2;
  v24 = a6;
  v493 = v23;
  v510 = v24;
  v509 = a5;
  if (!*(_BYTE *)(a1 + 714))
  {
    r2a = a11;
    v488 = a9;
    -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("renderStroke:withTransform:..."));
    v37 = *(_QWORD *)(a1 + 8);
    if (v37)
      v38 = *(_QWORD *)(v37 + 120);
    else
      LODWORD(v38) = 0;
    v39 = a4;
    if (!a4)
    {
      if (*(_QWORD *)(a1 + 952))
        v39 = 2;
      else
        v39 = *(_QWORD *)(a1 + 240) != 0;
    }
    v552 = 0u;
    v553 = 0u;
    v560 = 0u;
    v559 = 0u;
    v558 = 0u;
    v557 = 0u;
    v556 = 0u;
    v554 = 0u;
    v555 = 0u;
    v551 = 0u;
    v550 = 0u;
    v549 = 0u;
    v548 = 0u;
    v561 = a5;
    v138 = vcvt_f32_f64(*MEMORY[0x1E0C9BAA8]);
    v139 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16));
    v140 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32));
    DWORD2(v552) = 0;
    *(float32x2_t *)&v552 = v138;
    DWORD2(v553) = 0;
    *(float32x2_t *)&v553 = v139;
    DWORD2(v554) = 1065353216;
    *(float32x2_t *)&v554 = v140;
    v539 = 1065353216;
    if (*(_BYTE *)(a1 + 933))
    {
      __asm { FMOV            V1.2D, #16.0 }
      v536 = vcvt_f32_f64(vdivq_f64(_Q1, *(float64x2_t *)(a1 + 248)));
    }
    rectb = a12;
    if (v37)
    {
      v142 = *(_QWORD *)(v37 + 144) > 1uLL;
      if (v23)
        goto LABEL_81;
      v147 = -[PKMetalRenderState pipelineConfig](v37);
    }
    else
    {
      if (v23)
      {
        v142 = 0;
LABEL_81:
        objc_msgSend(v23, "ink");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderer colorForStroke:](a1, v23);
        v144 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v145 = (CGColor *)objc_msgSend(v144, "CGColor");

        v146 = *(_QWORD *)(a1 + 8);
        if (v146 && *(_BYTE *)(v146 + 38) && *(_QWORD *)(a1 + 960))
          v145 = *(CGColor **)(a1 + 960);
        *(_OWORD *)&v567.a = xmmword_1BE4FD9E8;
        *(_OWORD *)&v567.c = unk_1BE4FD9F8;
        if (*(_BYTE *)(a1 + 934))
        {
          *(_OWORD *)&v564.a = xmmword_1BE4FD9E8;
          *(_OWORD *)&v564.c = unk_1BE4FD9F8;
          DKUColorGetRGBAComponents(v145, &v564);
          *(_OWORD *)&v562.a = __const_DKUTransformColorFromRGBA_hsla;
          *(_OWORD *)&v562.c = unk_1BE4FE400;
          DKUConvertsRGBToHSL((uint64_t)&v564, (uint64_t)&v562);
          v562.c = 1.0 - v562.c;
          DKUConvertHSLToSRGB((uint64_t)&v562, (uint64_t)&v567);
        }
        else
        {
          DKUColorGetRGBAComponents(v145, &v567);
        }
        d = v567.d;
        objc_msgSend(v143, "behavior");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = (unint64_t)objc_msgSend(v150, "version") < 3;

        if (v151)
        {
          objc_msgSend(v143, "behavior");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "blendAlpha");
          d = v153;

        }
        objc_msgSend(v143, "behavior");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "targetMultiple");
        v156 = v155;

        if (v156 != 0.0 && vabdd_f64(v567.a, v567.b) < 0.00999999978 && vabdd_f64(v567.b, v567.c) < 0.00999999978)
          v156 = 0.0;
        *(float32x2_t *)&v157 = vcvt_f32_f64(*(float64x2_t *)&v567.a);
        *(float *)&v158 = v567.c;
        *((_QWORD *)&v157 + 1) = __PAIR64__(1.0, v158);
        v532[0] = v157;
        *(float *)&v157 = d;
        v159 = v156;
        v534 = v157;
        v535 = v159;
        objc_msgSend(v493, "_clipPlane");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "behavior");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "renderingDescriptor");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend(v162, "blendMode");

        if (v163)
        {
          if (v163 == 1)
          {
            if (v567.a < 0.99 || v567.b < 0.99 || v567.c < 0.99)
            {
              v178 = *(void **)(a1 + 192);
              v179 = *(unsigned __int8 *)(a1 + 933);
              v180 = *(_QWORD *)(a1 + 8);
              if (v180)
                v181 = -[PKMetalRenderState pipelineConfig](v180);
              else
                v181 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
              -[PKMetalResourceHandler compositeMultiplyShaderWithMode:clipping:targetMultiple:colorAttachmentIndex:renderMask:edgeMask:secondaryPaintEnabled:pipelineConfig:](v178, v39, v160 != 0, v156 > 0.0, v38, a7, v179 != 0, v142, v181, (v181 & 0xFFFFFFFFFFFFLL) >> 32);
              v182 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v143, "behavior", 0.99, v567.c);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              v168 = (unint64_t)objc_msgSend(v167, "version") < 3;

              if (v168)
                v534 = 1065353216;
              v169 = *(void **)(a1 + 192);
              v170 = *(unsigned __int8 *)(a1 + 933);
              v171 = *(_QWORD *)(a1 + 8);
              if (v171)
                v172 = -[PKMetalRenderState pipelineConfig](v171);
              else
                v172 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
              -[PKMetalResourceHandler compositeSoftWhiteShaderWithMode:clipping:colorAttachmentIndex:renderMask:edgeMask:secondaryPaintEnabled:pipelineConfig:](v169, v39, v160 != 0, v38, a7, v170 != 0, v142, v172 & 0xFFFFFFFFFFFFLL);
              v182 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            if (v163 != 2)
            {
              v177 = os_log_create("com.apple.pencilkit", ");
              if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v493, "ink");
                v448 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v448, "behavior");
                v449 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v449, "renderingDescriptor");
                v450 = (void *)objc_claimAutoreleasedReturnValue();
                v451 = objc_msgSend(v450, "blendMode");
                LODWORD(v562.a) = 134217984;
                *(_QWORD *)((char *)&v562.a + 4) = v451;
                _os_log_error_impl(&dword_1BE213000, v177, OS_LOG_TYPE_ERROR, "Renderer has stroke with unknown blend mode %ld", (uint8_t *)&v562, 0xCu);

              }
              v148 = v143;
              goto LABEL_407;
            }
            v164 = *(void **)(a1 + 192);
            v165 = *(_QWORD *)(a1 + 8);
            if (v165)
              v166 = -[PKMetalRenderState pipelineConfig](v165);
            else
              v166 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
            -[PKMetalResourceHandler compositeEraseShaderWithMode:clipping:colorAttachmentIndex:secondaryPaintEnabled:pipelineConfig:](v164, v39, v160 != 0, v38, v142, v166 & 0xFFFFFFFFFFFFLL);
            v182 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v173 = *(void **)(a1 + 192);
          v174 = *(unsigned __int8 *)(a1 + 933);
          v175 = *(_QWORD *)(a1 + 8);
          if (v175)
            v176 = -[PKMetalRenderState pipelineConfig](v175);
          else
            v176 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
          -[PKMetalResourceHandler compositeOverShaderWithMode:clipping:colorAttachmentIndex:renderMask:edgeMask:secondaryPaintEnabled:pipelineConfig:](v173, v39, v160 != 0, v38, a7, v174 != 0, v142, v176 & 0xFFFFFFFFFFFFLL);
          v182 = objc_claimAutoreleasedReturnValue();
        }
        v148 = (_QWORD *)v182;
        if (v160)
        {
          v184 = *(double *)(a1 + 224);
          v183 = *(double *)(a1 + 232);
          objc_msgSend(v160, "origin");
          v484 = v185;
          v187 = v186;
          objc_msgSend(v160, "normal");
          v480 = v188;
          v190 = v189;
          v191 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v530.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v530.c = v191;
          *(_OWORD *)&v530.tx = *(_OWORD *)(a1 + 304);
          if (CGAffineTransformIsIdentity(&v530))
          {
            v194.f64[0] = v480;
            v193.f64[0] = v484;
          }
          else
          {
            v195 = *(double *)(a1 + 272);
            v196 = *(double *)(a1 + 280);
            v197 = *(double *)(a1 + 288);
            v198 = *(double *)(a1 + 296);
            v199 = *(double *)(a1 + 304);
            v200 = *(double *)(a1 + 312);
            v201 = *(double *)(MEMORY[0x1E0C9D538] + 8);
            v202 = v200 + v198 * v201 + v196 * *MEMORY[0x1E0C9D538];
            v203 = v199 + v190 * v197 + v195 * v480 - (v199 + v197 * v201 + v195 * *MEMORY[0x1E0C9D538]);
            v204 = v200 + v190 * v198 + v196 * v480 - v202;
            v205 = v187 * v197;
            v187 = v200 + v187 * v198 + v196 * v484;
            v193.f64[0] = v199 + v205 + v195 * v484;
            v206 = 1.0 / sqrt(v204 * v204 + v203 * v203);
            v194.f64[0] = v203 * v206;
            v190 = v204 * v206;
          }
          *(double *)v192.i64 = -v190;
          v207 = v183 - v187;
          if (!v509)
          {
            *(double *)v192.i64 = v190;
            v207 = v187;
          }
          v193.f64[1] = v207;
          *(float32x2_t *)&v208 = vcvt_f32_f64(v193);
          *(_QWORD *)&v194.f64[1] = v192.i64[0];
          *(float32x2_t *)v192.f32 = vcvt_f32_f64(v194);
          *((_QWORD *)&v208 + 1) = vnegq_f32(v192).u64[0];
          v533 = v208;
          v209 = v184;
          *(float *)&v208 = v209;
          v210 = v183;
          LODWORD(v211) = 0;
          *((float *)&v211 + 1) = v210;
          DWORD2(v555) = 0;
          *(_QWORD *)&v555 = v208;
          DWORD2(v556) = 0;
          *(_QWORD *)&v556 = v211;
          DWORD2(v557) = 1065353216;
          *(_QWORD *)&v557 = 0;
        }

LABEL_131:
        v212 = -[PKMetalResourceHandler paperTextureSize](*(_QWORD *)(a1 + 192));
        v214 = a13;
        if (*(_QWORD *)(a1 + 448))
        {
          v215 = a8;
          v216 = *(double *)(a1 + 456);
          v217 = *(double *)(a1 + 464);
          v218 = 1.0;
        }
        else
        {
          v216 = v212;
          v217 = v213;
          v215 = a8;
          v218 = 2.0;
        }
        v219 = *(double *)(a1 + 224);
        v220 = *(double *)(a1 + 232);
        memset(&v529, 0, sizeof(v529));
        v221 = *(double *)a3;
        v222 = *(double *)(a3 + 8);
        v223 = *(double *)(a3 + 16);
        v224 = *(double *)(a3 + 24);
        v562.ty = 0.0;
        v562.tx = 0.0;
        v562.a = v221;
        v562.b = v222;
        v562.c = v223;
        v562.d = v224;
        CGAffineTransformScale(&v529, &v562, 1.0 / sqrt(v222 * v222 + v221 * v221), 1.0 / sqrt(v224 * v224 + v223 * v223));
        CGAffineTransformMakeScale(&v562, v219 / v218 / v216, v220 / v218 / v217);
        v528 = v562;
        v527 = v529;
        CGAffineTransformConcat(&v562, &v528, &v527);
        v526 = v562;
        CGAffineTransformMakeTranslation(&v525, 0.0, -(*(double *)(a1 + 1080) * *(double *)(a1 + 264)) / (v217 * v218));
        CGAffineTransformConcat(&v562, &v526, &v525);
        v481 = *(float64x2_t *)&v562.c;
        v485 = *(float64x2_t *)&v562.a;
        v476 = *(float64x2_t *)&v562.tx;
        if (a4)
        {
          v226 = v215;
          if (a4 > 2)
          {
            if (v39 != 2)
              goto LABEL_388;
            goto LABEL_158;
          }
        }
        else
        {
          v227 = v510;
          v228 = *(CGColor **)(a1 + 240);
          v226 = v215;
          if (v228)
          {
            *(_OWORD *)&v562.a = xmmword_1BE4FD9E8;
            *(_OWORD *)&v562.c = unk_1BE4FD9F8;
            DKUColorGetRGBAComponents(v228, &v562);
            v229 = v214;
            v532[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v562.a), *(float64x2_t *)&v562.c);
          }
          else
          {
            v230 = *(void **)(a1 + 448);
            v231 = v230;
            v229 = v214;
            if (!v230)
            {
              -[PKMetalResourceHandler paperTexture](*(_QWORD *)(a1 + 192));
              v231 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v227, "setFragmentTexture:atIndex:", v231, 2);
            if (!v230)

          }
          if (!*(_QWORD *)(a1 + 240))
          {
            DWORD2(v558) = 0;
            *(float32x2_t *)&v558 = vcvt_f32_f64(v485);
            DWORD2(v559) = 0;
            *(float32x2_t *)&v559 = vcvt_f32_f64(v481);
            DWORD2(v560) = 1065353216;
            *(float32x2_t *)&v560 = vcvt_f32_f64(v476);
          }
          if (!CGRectIsNull(*(CGRect *)(a1 + 320)) && !*(_BYTE *)(a1 + 929) && !*(_QWORD *)(a1 + 240))
          {
            v441 = *(double *)(a1 + 336);
            v571.size.height = *(CGFloat *)(a1 + 344);
            v442 = *(double *)(a1 + 232);
            v443 = *(double *)(a1 + 320);
            v571.origin.y = *(CGFloat *)(a1 + 328);
            v571.origin.x = v443;
            v571.size.width = v441;
            height = v571.size.height;
            MaxY = CGRectGetMaxY(v571);
            if (v443 > 0.0
              || (v445 = v442 - MaxY,
                  v572.origin.x = v443,
                  v572.origin.y = v445,
                  v572.size.width = v441,
                  v572.size.height = height,
                  MaxX = CGRectGetMaxX(v572),
                  r1 = *(double *)(a1 + 224),
                  MaxX < r1))
            {
              v447 = *(_OWORD *)(a3 + 16);
              v524[0] = *(_OWORD *)a3;
              v524[1] = v447;
              v524[2] = *(_OWORD *)(a3 + 32);
              v523[0] = v485;
              v523[1] = v481;
              v523[2] = v476;
              -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v524, v523, v509 ^ 1, v227, *(double *)(a1 + 976));
              v232 = 1;
LABEL_150:
              if (!CGRectIsNull(*(CGRect *)(a1 + 320)))
              {
                v233 = v226;
                v235 = *(double *)(a1 + 336);
                v234 = *(double *)(a1 + 344);
                v236 = *(double *)(a1 + 232);
                v237 = *(double *)(a1 + 320);
                v569.origin.y = *(CGFloat *)(a1 + 328);
                v569.origin.x = v237;
                v569.size.width = v235;
                v569.size.height = v234;
                v238 = CGRectGetMaxY(v569);
                v570.origin.x = a10;
                v570.origin.y = r2a;
                v570.size.width = rectb;
                v570.size.height = v214;
                IsNull = CGRectIsNull(v570);
                v240 = v236 - v238;
                if (!IsNull)
                {
                  v241 = v237;
                  v242 = v235;
                  v243 = v234;
                  v577.origin.x = a10;
                  v577.origin.y = r2a;
                  v577.size.width = rectb;
                  v577.size.height = v214;
                  *(CGRect *)(&v240 - 1) = CGRectIntersection(*(CGRect *)(&v240 - 1), v577);
                  v237 = v244;
                  v235 = v245;
                  v234 = v246;
                }
                v226 = v233;
                memset(&v562, 0, 32);
                v247 = v237;
                v248 = v235;
                v249 = v234;
                if (!*(_QWORD *)&v562.c || !*(_QWORD *)&v562.d)
                  goto LABEL_405;
                v516[0] = *(_OWORD *)&v562.a;
                v516[1] = *(_OWORD *)&v562.c;
                objc_msgSend(v510, "setScissorRect:", v516);
              }
              if (v39 != 2)
              {
LABEL_388:
                v417 = *(_QWORD *)(a1 + 192);
                if (!v417 || !*(_BYTE *)(v417 + 428))
                {
                  v418 = *(_QWORD **)(a1 + 40);
                  if (v418)
                    v418 = (_QWORD *)v418[3];
                  v419 = v418;
                  objc_msgSend(v510, "setFragmentTexture:atIndex:", v419, 1);

                  v417 = *(_QWORD *)(a1 + 192);
                  if (!v417)
                    goto LABEL_409;
                }
                if (!*(_BYTE *)(v417 + 428))
                {
LABEL_409:
                  v434 = *(_QWORD *)(a1 + 8);
                  if (v434)
                  {
                    v435 = 0;
                    v436 = (_QWORD **)(a1 + 112);
                    do
                    {
                      if (v435 >= *(_QWORD *)(v434 + 144))
                        break;
                      if (*(_BYTE *)(v434 + 44))
                        v437 = v436 + 4;
                      else
                        v437 = v436;
                      v438 = *v437;
                      if (v438)
                        v438 = (_QWORD *)v438[3];
                      v439 = v438;
                      v440 = v435 ? 7 : 6;
                      objc_msgSend(v510, "setFragmentTexture:atIndex:", v439, v440);

                      ++v435;
                      v434 = *(_QWORD *)(a1 + 8);
                      v436 += 2;
                    }
                    while (v434);
                  }
                }
                if (a7)
                {
                  v420 = *(_QWORD **)(a1 + 176);
                  if (v420)
                    v420 = (_QWORD *)v420[3];
                  v421 = v420;
                  objc_msgSend(v510, "setFragmentTexture:atIndex:", v421, 3);

                }
                if (v509)
                {
                  v422 = *(_OWORD *)(a3 + 16);
                  *(_OWORD *)&v513.a = *(_OWORD *)a3;
                  *(_OWORD *)&v513.c = v422;
                  *(_OWORD *)&v513.tx = *(_OWORD *)(a3 + 32);
                  v512.a = 1.0;
                  v512.b = 0.0;
                  v512.c = 0.0;
                  v512.d = -1.0;
                  v512.tx = 0.0;
                  v512.ty = 0.0;
                  CGAffineTransformConcat(&v562, &v513, &v512);
                  v423 = *(_OWORD *)&v562.c;
                  *(_OWORD *)a3 = *(_OWORD *)&v562.a;
                  *(_OWORD *)(a3 + 16) = v423;
                  *(_OWORD *)(a3 + 32) = *(_OWORD *)&v562.tx;
                }
                v548 = v424;
                v549 = v425;
                v550 = v426;
                v551 = v427;
                objc_msgSend(v510, "setVertexBytes:length:atIndex:", &v548, 224, 3);
                objc_msgSend(v510, "setFragmentBytes:length:atIndex:", v532, 112, 0);
                -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v148, v510);
                v428 = *(_QWORD *)(a1 + 192);
                if (v428)
                  LODWORD(v428) = *(unsigned __int8 *)(v428 + 428) != 0;
                v429 = *(double *)(a1 + 224);
                v430 = *(double *)(a1 + 232);
                v431 = -1.0;
                if (v428 != v509)
                  v431 = 1.0;
                v564.a = 2.0 / v429;
                v564.b = 0.0;
                v564.c = 0.0;
                v564.d = (v431 + v431) / v430;
                v564.tx = -1.0;
                v564.ty = -v431;
                v432 = *(_OWORD *)(a1 + 288);
                *(_OWORD *)&v562.a = *(_OWORD *)(a1 + 272);
                *(_OWORD *)&v562.c = v432;
                *(_OWORD *)&v562.tx = *(_OWORD *)(a1 + 304);
                *(_OWORD *)&v567.a = COERCE_UNSIGNED_INT64(2.0 / v429);
                *(_OWORD *)&v567.c = *(_OWORD *)&v564.c;
                *(_OWORD *)&v567.tx = *(_OWORD *)&v564.tx;
                CGAffineTransformConcat(&v564, &v562, &v567);
                v511 = v564;
                -[PKMetalRenderer renderBrushIndicatorForStroke:withTransform:mode:](a1, v493, (__int128 *)&v511, a4);
LABEL_405:
                v433 = *(_QWORD *)(a1 + 8);
                if (v433)
                  objc_msgSend(*(id *)(v433 + 80), "popDebugGroup");
LABEL_407:

                goto LABEL_408;
              }
              if ((v232 & 1) != 0)
              {
LABEL_164:
                v256 = v510;
                v257 = *(id *)(a1 + 952);
                v258 = v257 == 0;

                if (!v258)
                {
                  __p = 0;
                  v545 = 0;
                  v547 = 0;
                  v259 = *(_QWORD *)(a1 + 8);
                  if (v259)
                    v260 = -[PKMetalRenderState pipelineConfig](v259);
                  else
                    v260 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
                  v261 = *(_QWORD *)(a1 + 192);
                  *(_QWORD *)&v562.a = 8;
                  memset(&v562.b, 0, 24);
                  LODWORD(v562.tx) = v260;
                  HIDWORD(v562.tx) = WORD2(v260);
                  -[PKMetalResourceHandler namedShaderForKey:](v261, (__int128 *)&v562);
                  v473 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                  if (*(_BYTE *)(a1 + 934))
                    objc_msgSend(MEMORY[0x1E0DC3658], "pk_linedPaperLineColor_dark");
                  else
                    objc_msgSend(MEMORY[0x1E0DC3658], "pk_linedPaperLineColor_light");
                  v262 = (void *)objc_claimAutoreleasedReturnValue();
                  v565 = (float64x2_t)xmmword_1BE4FD9E8;
                  v566 = (float64x2_t)unk_1BE4FD9F8;
                  v263 = objc_retainAutorelease(v262);
                  v475 = v148;
                  DKUColorGetRGBAComponents((CGColor *)objc_msgSend(v263, "CGColor"), &v565);
                  v544 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v565), v566);
                  objc_msgSend(v256, "setFragmentBytes:length:atIndex:", &v544, 16, 0);
                  v564.a = 2.0 / v226;
                  v564.b = 0.0;
                  v564.c = 0.0;
                  v564.d = -2.0 / v488;
                  *(_OWORD *)&v564.tx = xmmword_1BE4F9580;
                  v264 = *(_OWORD *)(a1 + 288);
                  *(_OWORD *)&v562.a = *(_OWORD *)(a1 + 272);
                  *(_OWORD *)&v562.c = v264;
                  *(_OWORD *)&v562.tx = *(_OWORD *)(a1 + 304);
                  *(_OWORD *)&v567.a = COERCE_UNSIGNED_INT64(2.0 / v226);
                  *(_OWORD *)&v567.c = *(_OWORD *)&v564.c;
                  *(_OWORD *)&v567.tx = xmmword_1BE4F9580;
                  CGAffineTransformConcat(&v564, &v562, &v567);
                  *(_OWORD *)&v562.a = v266;
                  *(_OWORD *)&v562.c = v267;
                  *(_OWORD *)&v562.tx = v268;
                  v563 = v269;
                  memset(&v567, 0, sizeof(v567));
                  t1 = v564;
                  t2.a = v226 * -0.5;
                  t2.c = 0.0;
                  t2.b = 0.0;
                  t2.d = v488 * -0.5;
                  t2.tx = v226 * 0.5;
                  t2.ty = v488 * 0.5;
                  CGAffineTransformConcat(&v567, &t1, &t2);
                  memset(&v541, 0, sizeof(v541));
                  v540 = v567;
                  CGAffineTransformInvert(&v541, &v540);
                  v270 = *(id *)(a1 + 952);
                  objc_msgSend(v270, "lineSpacing");
                  v272 = v271;
                  v274 = v273;

                  v275 = *(id *)(a1 + 952);
                  objc_msgSend(v275, "horizontalInset");
                  v277 = v276;

                  a = v541.a;
                  b = v541.b;
                  c = v541.c;
                  v283 = v541.d;
                  ty = v541.ty;
                  v285 = v545;
                  if ((unint64_t)(v547 - (_BYTE *)v545) >> 6 <= 0x4A)
                  {
                    v286 = __p;
                    v287 = (char *)operator new(0x12C0uLL);
                    v288 = &v287[(v286 - v285) & 0xFFFFFFFFFFFFFFF8];
                    v289 = v288;
                    if (v286 != v285)
                    {
                      v289 = &v287[(v286 - v285) & 0xFFFFFFFFFFFFFFF8];
                      do
                      {
                        v290 = *((_QWORD *)v286 - 1);
                        v286 -= 8;
                        *((_QWORD *)v289 - 1) = v290;
                        v289 -= 8;
                      }
                      while (v286 != v285);
                    }
                    v545 = v289;
                    __p = v288;
                    v547 = v287 + 4800;
                    if (v285)
                      operator delete(v285);
                  }
                  v477.f64[0] = ty + v283 * 0.0 + b * 0.0;
                  v291 = ty + v488 * v283 + b * 0.0;
                  v292 = a + c;
                  if (v274 > 1.0)
                  {
                    v293 = vcvtpd_s64_f64(v291 / v274);
                    *(double *)v278.i64 = v477.f64[0] / v274;
                    v294 = vcvtmd_s64_f64(v477.f64[0] / v274);
                    if (v294 <= v293)
                    {
                      v278.f32[0] = v277;
                      v486 = v278;
                      *(double *)v278.i64 = 768.0 - v277;
                      v278.f32[0] = 768.0 - v277;
                      v491 = v278;
                      v295 = (char *)__p;
                      do
                      {
                        v296 = v274 * (double)v294;
                        *(double *)v279.i64 = v567.tx + v296 * v567.c + v567.a * 0.0;
                        v297 = v541.ty
                             + v541.d * (round(v567.ty + v296 * v567.d + v567.b * 0.0) + 1.0)
                             + v541.b * *(double *)v279.i64;
                        v279.f32[0] = v297 - v292;
                        r2b = v279;
                        rectc = __PAIR64__(v279.u32[0], v486.u32[0]);
                        if (v295 >= v547)
                        {
                          v299 = (v295 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v299 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v300 = (v547 - (_BYTE *)v545) >> 2;
                          if (v300 <= v299 + 1)
                            v300 = v299 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v301 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v301 = v300;
                          if (v301)
                            v302 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v301);
                          else
                            v302 = 0;
                          v303 = (unint64_t *)&v302[8 * v299];
                          *v303 = rectc;
                          v298 = v303 + 1;
                          v304 = (char *)__p;
                          v305 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v306 = *((_QWORD *)v304 - 1);
                              v304 -= 8;
                              *--v303 = v306;
                            }
                            while (v304 != v305);
                            v304 = (char *)v545;
                          }
                          v545 = v303;
                          __p = v298;
                          v547 = &v302[8 * v301];
                          if (v304)
                            operator delete(v304);
                        }
                        else
                        {
                          *(_QWORD *)v295 = __PAIR64__(v279.u32[0], v486.u32[0]);
                          v298 = (unint64_t *)(v295 + 8);
                        }
                        __p = v298;
                        v308 = v491;
                        *((_QWORD *)&v307 + 1) = r2b.i64[1];
                        v308.i32[1] = r2b.i32[0];
                        if (v298 >= (unint64_t *)v547)
                        {
                          r2c = v308;
                          v310 = ((char *)v298 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v310 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v311 = (v547 - (_BYTE *)v545) >> 2;
                          if (v311 <= v310 + 1)
                            v311 = v310 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v312 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v312 = v311;
                          if (v312)
                            v313 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v312);
                          else
                            v313 = 0;
                          v314 = &v313[8 * v310];
                          *((_QWORD *)&v307 + 1) = r2c.i64[1];
                          *(_QWORD *)v314 = r2c.i64[0];
                          v309 = (unint64_t *)(v314 + 8);
                          v315 = (char *)__p;
                          v316 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v317 = *((_QWORD *)v315 - 1);
                              v315 -= 8;
                              *((_QWORD *)v314 - 1) = v317;
                              v314 -= 8;
                            }
                            while (v315 != v316);
                            v315 = (char *)v545;
                          }
                          v545 = v314;
                          __p = v309;
                          v547 = &v313[8 * v312];
                          if (v315)
                            operator delete(v315);
                        }
                        else
                        {
                          *v298 = v308.i64[0];
                          v309 = v298 + 1;
                        }
                        __p = v309;
                        *(double *)&v307 = v292 + v297;
                        *(float *)&v307 = v292 + v297;
                        v482 = v307;
                        r2d = __PAIR64__(v307, v491.u32[0]);
                        if (v309 >= (unint64_t *)v547)
                        {
                          v319 = ((char *)v309 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v319 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v320 = (v547 - (_BYTE *)v545) >> 2;
                          if (v320 <= v319 + 1)
                            v320 = v319 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v321 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v321 = v320;
                          if (v321)
                            v322 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v321);
                          else
                            v322 = 0;
                          v323 = (unint64_t *)&v322[8 * v319];
                          *v323 = r2d;
                          v318 = v323 + 1;
                          v324 = (char *)__p;
                          v325 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v326 = *((_QWORD *)v324 - 1);
                              v324 -= 8;
                              *--v323 = v326;
                            }
                            while (v324 != v325);
                            v324 = (char *)v545;
                          }
                          v545 = v323;
                          __p = v318;
                          v547 = &v322[8 * v321];
                          if (v324)
                            operator delete(v324);
                        }
                        else
                        {
                          *v309 = __PAIR64__(v307, v491.u32[0]);
                          v318 = v309 + 1;
                        }
                        __p = v318;
                        if (v318 >= (unint64_t *)v547)
                        {
                          v328 = ((char *)v318 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v328 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v329 = (v547 - (_BYTE *)v545) >> 2;
                          if (v329 <= v328 + 1)
                            v329 = v328 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v330 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v330 = v329;
                          if (v330)
                            v331 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v330);
                          else
                            v331 = 0;
                          v332 = (unint64_t *)&v331[8 * v328];
                          *v332 = rectc;
                          v327 = v332 + 1;
                          v333 = (char *)__p;
                          v334 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v335 = *((_QWORD *)v333 - 1);
                              v333 -= 8;
                              *--v332 = v335;
                            }
                            while (v333 != v334);
                            v333 = (char *)v545;
                          }
                          v545 = v332;
                          __p = v327;
                          v547 = &v331[8 * v330];
                          if (v333)
                            operator delete(v333);
                        }
                        else
                        {
                          *v318 = rectc;
                          v327 = v318 + 1;
                        }
                        __p = v327;
                        if (v327 >= (unint64_t *)v547)
                        {
                          v337 = ((char *)v327 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v337 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v338 = (v547 - (_BYTE *)v545) >> 2;
                          if (v338 <= v337 + 1)
                            v338 = v337 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v339 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v339 = v338;
                          if (v339)
                            v340 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v339);
                          else
                            v340 = 0;
                          v341 = (unint64_t *)&v340[8 * v337];
                          *v341 = r2d;
                          v336 = (char *)(v341 + 1);
                          v342 = (char *)__p;
                          v343 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v344 = *((_QWORD *)v342 - 1);
                              v342 -= 8;
                              *--v341 = v344;
                            }
                            while (v342 != v343);
                            v342 = (char *)v545;
                          }
                          v545 = v341;
                          __p = v336;
                          v547 = &v340[8 * v339];
                          if (v342)
                            operator delete(v342);
                        }
                        else
                        {
                          *v327 = r2d;
                          v336 = (char *)(v327 + 1);
                        }
                        __p = v336;
                        v278.i64[1] = *((_QWORD *)&v482 + 1);
                        v279 = v486;
                        v279.i32[1] = v482;
                        if (v336 >= v547)
                        {
                          rectd = v279;
                          v345 = (v336 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v345 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v346 = (v547 - (_BYTE *)v545) >> 2;
                          if (v346 <= v345 + 1)
                            v346 = v345 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v347 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v347 = v346;
                          if (v347)
                            v348 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v347);
                          else
                            v348 = 0;
                          v349 = &v348[8 * v345];
                          v278.i64[1] = rectd.i64[1];
                          *(_QWORD *)v349 = rectd.i64[0];
                          v295 = v349 + 8;
                          v350 = (char *)__p;
                          v351 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v352 = *((_QWORD *)v350 - 1);
                              v350 -= 8;
                              *((_QWORD *)v349 - 1) = v352;
                              v349 -= 8;
                            }
                            while (v350 != v351);
                            v350 = (char *)v545;
                          }
                          v545 = v349;
                          __p = v295;
                          v547 = &v348[8 * v347];
                          if (v350)
                            operator delete(v350);
                        }
                        else
                        {
                          *(_QWORD *)v336 = v279.i64[0];
                          v295 = v336 + 8;
                        }
                        __p = v295;
                        _ZF = v294++ == v293;
                      }
                      while (!_ZF);
                    }
                  }
                  if (v272 > 1.0)
                  {
                    v353 = (uint64_t)((v277 * -2.0 + 768.0) / v272);
                    if ((v353 & 0x8000000000000000) == 0)
                    {
                      v354 = 0;
                      v278.i32[1] = HIDWORD(v477.f64[0]);
                      v278.f32[0] = v477.f64[0];
                      v483 = v278.i32[0];
                      v278.f32[0] = v291;
                      v487 = v278;
                      v355 = (char *)__p;
                      do
                      {
                        v356 = v277 + v272 * (double)v354;
                        *(double *)v279.i64 = round(v567.tx + v567.c * 0.0 + v567.a * v356);
                        v357 = v541.tx
                             + (v567.ty + v567.d * 0.0 + v567.b * v356) * v541.c
                             + v541.a * *(double *)v279.i64;
                        v279.f32[0] = v357 - v292;
                        recte = v279;
                        v279.i32[1] = v483;
                        r2e = v279.i64[0];
                        if (v355 >= v547)
                        {
                          v359 = (v355 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v359 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v360 = (v547 - (_BYTE *)v545) >> 2;
                          if (v360 <= v359 + 1)
                            v360 = v359 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v361 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v361 = v360;
                          if (v361)
                            v362 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v361);
                          else
                            v362 = 0;
                          v363 = &v362[8 * v359];
                          *(_QWORD *)v363 = r2e;
                          v358 = v363 + 8;
                          v364 = (char *)__p;
                          v365 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v366 = *((_QWORD *)v364 - 1);
                              v364 -= 8;
                              *((_QWORD *)v363 - 1) = v366;
                              v363 -= 8;
                            }
                            while (v364 != v365);
                            v364 = (char *)v545;
                          }
                          v545 = v363;
                          __p = v358;
                          v547 = &v362[8 * v361];
                          if (v364)
                            operator delete(v364);
                        }
                        else
                        {
                          *(_QWORD *)v355 = v279.i64[0];
                          v358 = v355 + 8;
                        }
                        __p = v358;
                        v367.i64[1] = v487.i64[1];
                        v368 = recte;
                        v368.i32[1] = v487.i32[0];
                        if (v358 >= v547)
                        {
                          rectf = v368;
                          v370 = (v358 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v370 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v371 = (v547 - (_BYTE *)v545) >> 2;
                          if (v371 <= v370 + 1)
                            v371 = v370 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v372 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v372 = v371;
                          if (v372)
                            v373 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v372);
                          else
                            v373 = 0;
                          v374 = &v373[8 * v370];
                          v367.i64[1] = rectf.i64[1];
                          *(_QWORD *)v374 = rectf.i64[0];
                          v369 = (unint64_t *)(v374 + 8);
                          v375 = (char *)__p;
                          v376 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v377 = *((_QWORD *)v375 - 1);
                              v375 -= 8;
                              *((_QWORD *)v374 - 1) = v377;
                              v374 -= 8;
                            }
                            while (v375 != v376);
                            v375 = (char *)v545;
                          }
                          v545 = v374;
                          __p = v369;
                          v547 = &v373[8 * v372];
                          if (v375)
                            operator delete(v375);
                        }
                        else
                        {
                          *(_QWORD *)v358 = v368.i64[0];
                          v369 = (unint64_t *)(v358 + 8);
                        }
                        __p = v369;
                        *(double *)v367.i64 = v292 + v357;
                        v367.f32[0] = v292 + v357;
                        rectg = v367;
                        v492 = __PAIR64__(v487.u32[0], v367.u32[0]);
                        if (v369 >= (unint64_t *)v547)
                        {
                          v379 = ((char *)v369 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v379 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v380 = (v547 - (_BYTE *)v545) >> 2;
                          if (v380 <= v379 + 1)
                            v380 = v379 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v381 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v381 = v380;
                          if (v381)
                            v382 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v381);
                          else
                            v382 = 0;
                          v383 = (unint64_t *)&v382[8 * v379];
                          *v383 = v492;
                          v378 = v383 + 1;
                          v384 = (char *)__p;
                          v385 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v386 = *((_QWORD *)v384 - 1);
                              v384 -= 8;
                              *--v383 = v386;
                            }
                            while (v384 != v385);
                            v384 = (char *)v545;
                          }
                          v545 = v383;
                          __p = v378;
                          v547 = &v382[8 * v381];
                          if (v384)
                            operator delete(v384);
                        }
                        else
                        {
                          *v369 = __PAIR64__(v487.u32[0], v367.u32[0]);
                          v378 = v369 + 1;
                        }
                        __p = v378;
                        if (v378 >= (unint64_t *)v547)
                        {
                          v388 = ((char *)v378 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v388 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v389 = (v547 - (_BYTE *)v545) >> 2;
                          if (v389 <= v388 + 1)
                            v389 = v388 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v390 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v390 = v389;
                          if (v390)
                            v391 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v390);
                          else
                            v391 = 0;
                          v392 = (unint64_t *)&v391[8 * v388];
                          *v392 = r2e;
                          v387 = v392 + 1;
                          v393 = (char *)__p;
                          v394 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v395 = *((_QWORD *)v393 - 1);
                              v393 -= 8;
                              *--v392 = v395;
                            }
                            while (v393 != v394);
                            v393 = (char *)v545;
                          }
                          v545 = v392;
                          __p = v387;
                          v547 = &v391[8 * v390];
                          if (v393)
                            operator delete(v393);
                        }
                        else
                        {
                          *v378 = r2e;
                          v387 = v378 + 1;
                        }
                        __p = v387;
                        if (v387 >= (unint64_t *)v547)
                        {
                          v397 = ((char *)v387 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v397 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v398 = (v547 - (_BYTE *)v545) >> 2;
                          if (v398 <= v397 + 1)
                            v398 = v397 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v399 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v399 = v398;
                          if (v399)
                            v400 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v399);
                          else
                            v400 = 0;
                          v401 = (unint64_t *)&v400[8 * v397];
                          *v401 = v492;
                          v396 = (char *)(v401 + 1);
                          v402 = (char *)__p;
                          v403 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v404 = *((_QWORD *)v402 - 1);
                              v402 -= 8;
                              *--v401 = v404;
                            }
                            while (v402 != v403);
                            v402 = (char *)v545;
                          }
                          v545 = v401;
                          __p = v396;
                          v547 = &v400[8 * v399];
                          if (v402)
                            operator delete(v402);
                        }
                        else
                        {
                          *v387 = v492;
                          v396 = (char *)(v387 + 1);
                        }
                        __p = v396;
                        v279 = rectg;
                        v279.i32[1] = v483;
                        if (v396 >= v547)
                        {
                          recth = v279.i64[0];
                          v405 = (v396 - (_BYTE *)v545) >> 3;
                          if ((unint64_t)(v405 + 1) >> 61)
                            std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
                          v406 = (v547 - (_BYTE *)v545) >> 2;
                          if (v406 <= v405 + 1)
                            v406 = v405 + 1;
                          if ((unint64_t)(v547 - (_BYTE *)v545) >= 0x7FFFFFFFFFFFFFF8)
                            v407 = 0x1FFFFFFFFFFFFFFFLL;
                          else
                            v407 = v406;
                          if (v407)
                            v408 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v547, v407);
                          else
                            v408 = 0;
                          v409 = &v408[8 * v405];
                          *(_QWORD *)v409 = recth;
                          v355 = v409 + 8;
                          v410 = (char *)__p;
                          v411 = (char *)v545;
                          if (__p != v545)
                          {
                            do
                            {
                              v412 = *((_QWORD *)v410 - 1);
                              v410 -= 8;
                              *((_QWORD *)v409 - 1) = v412;
                              v409 -= 8;
                            }
                            while (v410 != v411);
                            v410 = (char *)v545;
                          }
                          v545 = v409;
                          __p = v355;
                          v547 = &v408[8 * v407];
                          if (v410)
                            operator delete(v410);
                        }
                        else
                        {
                          *(_QWORD *)v396 = v279.i64[0];
                          v355 = v396 + 8;
                        }
                        __p = v355;
                        _ZF = v354++ == v353;
                      }
                      while (!_ZF);
                    }
                  }
                  v148 = v475;
                  if (__p != v545)
                  {
                    if (v473)
                      v413 = (void *)v473[3];
                    else
                      v413 = 0;
                    v414 = v413;
                    objc_msgSend(v256, "setRenderPipelineState:", v414);

                    objc_msgSend(v256, "setVertexBytes:length:atIndex:", v545, (_BYTE *)__p - (_BYTE *)v545, 0);
                    objc_msgSend(v256, "setVertexBytes:length:atIndex:", &v562, 64, 1);
                    objc_msgSend(v256, "drawPrimitives:vertexStart:vertexCount:", 3, 0, ((_BYTE *)__p - (_BYTE *)v545) >> 3);
                  }

                  if (v545)
                  {
                    __p = v545;
                    operator delete(v545);
                  }
                }

                v415 = *(_QWORD *)(a1 + 8);
                if (v415)
                  objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v415 + 80));
                -[PKMetalShader shaderWithBlendMode:](v148, 2);
                v416 = objc_claimAutoreleasedReturnValue();

                v148 = (_QWORD *)v416;
                goto LABEL_388;
              }
LABEL_158:
              if (*(_QWORD *)(a1 + 240))
              {
                v250 = v510;
                *(_OWORD *)&v567.a = xmmword_1BE4FD9E8;
                *(_OWORD *)&v567.c = unk_1BE4FD9F8;
                DKUColorGetRGBAComponents(*(CGColor **)(a1 + 240), &v567);
                *(float32x4_t *)&v564.a = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v567.a), *(float64x2_t *)&v567.c);
                -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v250);
                objc_msgSend(v250, "setFragmentBytes:length:atIndex:", &v564, 16, 0);
                v251 = *(_QWORD *)(a1 + 8);
                if (v251)
                  v252 = -[PKMetalRenderState pipelineConfig](v251);
                else
                  v252 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
                v254 = *(_QWORD *)(a1 + 192);
                *(_QWORD *)&v562.a = 12;
                memset((char *)&v562.b + 4, 0, 20);
                LODWORD(v562.b) = 3;
                LODWORD(v562.tx) = v252;
                HIDWORD(v562.tx) = WORD2(v252);
                -[PKMetalResourceHandler namedShaderForKey:](v254, (__int128 *)&v562);
                v255 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v255, v250);

              }
              else
              {
                v253 = *(_OWORD *)(a3 + 16);
                v515[0] = *(_OWORD *)a3;
                v515[1] = v253;
                v515[2] = *(_OWORD *)(a3 + 32);
                v514[0] = v485;
                v514[1] = v481;
                v514[2] = v476;
                -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v515, v514, v509 ^ 1, v510, *(double *)(a1 + 976));
              }
              goto LABEL_164;
            }
            if (v445 > 0.0)
            {
              v573.origin.x = a10;
              v573.origin.y = r2a;
              v573.size.width = rectb;
              v573.size.height = v229;
              v452 = CGRectIsNull(v573);
              v453 = 0;
              v454 = 0;
              v455 = r1;
              v456 = v445;
              if (!v452)
              {
                v457 = r1;
                v458 = v445;
                v578.origin.x = a10;
                v578.origin.y = r2a;
                v578.size.width = rectb;
                v578.size.height = v229;
                *(CGRect *)&v453 = CGRectIntersection(*(CGRect *)&v453, v578);
              }
              memset(&v562, 0, 32);
              if (*(_QWORD *)&v562.c)
              {
                if (*(_QWORD *)&v562.d)
                {
                  v522[0] = *(_OWORD *)&v562.a;
                  v522[1] = *(_OWORD *)&v562.c;
                  objc_msgSend(v227, "setScissorRect:", v522);
                  if (!*(_QWORD *)(a1 + 240))
                  {
                    v459 = *(_OWORD *)(a3 + 16);
                    v521[0] = *(_OWORD *)a3;
                    v521[1] = v459;
                    v521[2] = *(_OWORD *)(a3 + 32);
                    v520[0] = v485;
                    v520[1] = v481;
                    v520[2] = v476;
                    -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v521, v520, v509 ^ 1, v227, *(double *)(a1 + 976));
                  }
                }
              }
            }
            v574.origin.x = v443;
            v574.origin.y = v445;
            v574.size.width = v441;
            v574.size.height = height;
            if (CGRectGetMaxY(v574) < *(double *)(a1 + 232))
            {
              v575.origin.x = v443;
              v575.origin.y = v445;
              v575.size.width = v441;
              v575.size.height = height;
              v460 = CGRectGetMaxY(v575);
              v461 = *(double *)(a1 + 232);
              v576.origin.x = a10;
              v576.origin.y = r2a;
              v576.size.width = rectb;
              v576.size.height = v229;
              v462 = CGRectIsNull(v576);
              v463 = v461 - v460;
              v464 = 0;
              if (!v462)
              {
                v465 = v460;
                v466 = r1;
                v579.origin.x = a10;
                v579.origin.y = r2a;
                v579.size.width = rectb;
                v579.size.height = v229;
                *(CGRect *)&v464 = CGRectIntersection(*(CGRect *)&v464, v579);
                r1 = v467;
                v460 = v468;
              }
              memset(&v562, 0, 32);
              v469 = v460;
              v470 = r1;
              if (*(_QWORD *)&v562.c && *(_QWORD *)&v562.d)
              {
                v519[0] = *(_OWORD *)&v562.a;
                v519[1] = *(_OWORD *)&v562.c;
                objc_msgSend(v227, "setScissorRect:", v519);
                v471 = *(_OWORD *)(a3 + 16);
                v518[0] = *(_OWORD *)a3;
                v518[1] = v471;
                v518[2] = *(_OWORD *)(a3 + 32);
                v517[0] = v485;
                v517[1] = v481;
                v517[2] = v476;
                -[PKMetalRenderer renderPaperTransform:paperTransform:flipped:multiply:renderEncoder:](a1, v518, v517, v509 ^ 1, v227, *(double *)(a1 + 976));
              }
            }
          }
        }
        v232 = 0;
        goto LABEL_150;
      }
      v142 = 0;
      v147 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
    }
    -[PKMetalResourceHandler compositePaperShaderWithMode:colorAttachmentIndex:secondaryPaintEnabled:pipelineConfig:](*(void **)(a1 + 192), v39, v38, v142, v147 & 0xFFFFFFFFFFFFLL);
    v148 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    goto LABEL_131;
  }
  v25 = v24;
  v26 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&v531.a = *(_OWORD *)a3;
  *(_OWORD *)&v531.c = v26;
  *(_OWORD *)&v531.tx = *(_OWORD *)(a3 + 32);
  v27 = v23;
  v28 = v25;
  v560 = 0u;
  v559 = 0u;
  v558 = 0u;
  v557 = 0u;
  v556 = 0u;
  v555 = 0u;
  v554 = 0u;
  v553 = 0u;
  v552 = 0u;
  v551 = 0u;
  v550 = 0u;
  v549 = 0u;
  v548 = 0u;
  v539 = 1065353216;
  v561 = a5;
  v29 = vcvt_f32_f64(*MEMORY[0x1E0C9BAA8]);
  v30 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16));
  v31 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32));
  DWORD2(v552) = 0;
  *(float32x2_t *)&v552 = v29;
  DWORD2(v553) = 0;
  *(float32x2_t *)&v553 = v30;
  DWORD2(v554) = 1065353216;
  *(float32x2_t *)&v554 = v31;
  v32 = *(_QWORD *)(a1 + 8);
  if (v32)
  {
    v33 = *(_QWORD *)(v32 + 144) > 1uLL;
    if (v27)
      goto LABEL_4;
    v40 = *(_QWORD *)(v32 + 120);
    v41 = -[PKMetalRenderState pipelineConfig](v32);
  }
  else
  {
    if (v27)
    {
      v33 = 0;
LABEL_4:
      objc_msgSend(v27, "ink");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      r2 = v33;
      -[PKMetalRenderer colorForStroke:](a1, v27);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v36 = (CGColor *)objc_msgSend(v35, "CGColor");

      *(_OWORD *)&v567.a = xmmword_1BE4FD9E8;
      *(_OWORD *)&v567.c = unk_1BE4FD9F8;
      if (*(_BYTE *)(a1 + 934))
      {
        *(_OWORD *)&v564.a = xmmword_1BE4FD9E8;
        *(_OWORD *)&v564.c = unk_1BE4FD9F8;
        DKUColorGetRGBAComponents(v36, &v564);
        *(_OWORD *)&v562.a = __const_DKUTransformColorFromRGBA_hsla;
        *(_OWORD *)&v562.c = unk_1BE4FE400;
        DKUConvertsRGBToHSL((uint64_t)&v564, (uint64_t)&v562);
        v562.c = 1.0 - v562.c;
        DKUConvertHSLToSRGB((uint64_t)&v562, (uint64_t)&v567);
      }
      else
      {
        DKUColorGetRGBAComponents(v36, &v567);
      }
      v44 = v567.d;
      objc_msgSend(v34, "behavior");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v45, "version") <= 2)
      {
        objc_msgSend(v34, "behavior");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "renderingDescriptor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "blendMode") == 1)
        {

        }
        else
        {
          objc_msgSend(v34, "behavior");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "renderingDescriptor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "blendMode") == 3;

          if (!v50)
          {
LABEL_20:
            objc_msgSend(v34, "behavior");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "renderingDescriptor");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "blendMode") == 0;

            *(float32x2_t *)&v55 = vcvt_f32_f64(*(float64x2_t *)&v567.a);
            *(float *)&v56 = v567.c;
            *((_QWORD *)&v55 + 1) = __PAIR64__(1.0, v56);
            v532[0] = v55;
            v57 = v44;
            if (v54)
              v57 = 1.0;
            v534 = LODWORD(v57);
            objc_msgSend(v27, "_ink");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "_sixChannelAddColor");
            v489 = v59;

            objc_msgSend(v27, "_ink");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "_sixChannelMultiplyColor");
            rect = v61;

            if (-[PKMetalRenderer shouldRenderDebugColorForStroke:](a1, v27))
            {
              objc_msgSend(v27, "ink");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "behavior");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "renderingDescriptor");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(v64, "blendMode") == 1;

              if (v65)
              {
                v66.i64[0] = 0;
                v66.i32[2] = 0;
                v66.i32[3] = v489.i32[3];
                v67.i64[0] = 1065353216;
                v67.i32[2] = 0;
                v67.i32[3] = rect.i32[3];
                rect = v67;
              }
              else
              {
                v66.i64[0] = 1065353216;
                v66.i32[2] = 0;
                v66.i32[3] = v489.i32[3];
              }
              v68 = v66;
            }
            else
            {
              v68 = v489;
            }
            v69.i64[0] = v68.i64[0];
            v537 = v68;
            v538 = rect;
            v70 = *(_QWORD *)(a1 + 8);
            if (v70 && *(_QWORD *)(v70 + 128) == 1 && !*(_BYTE *)(a1 + 488))
            {
              v539 = 0;
              v69 = vaddq_f32(rect, v68);
              v71 = v69.f32[3];
              if (v69.f32[3] < rect.f32[3])
                v71 = rect.f32[3];
              v69.f32[3] = v71;
              __asm { FMOV            V1.4S, #1.0 }
              v537 = v69;
              v538 = _Q1;
            }
            objc_msgSend(v27, "_clipPlane", *(double *)v69.i64);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = v77;
            if (v77)
            {
              v80 = *(double *)(a1 + 224);
              v79 = *(double *)(a1 + 232);
              objc_msgSend(v77, "origin");
              recta = v81;
              v83 = v82;
              objc_msgSend(v78, "normal");
              v490 = v84;
              v86 = v85;
              v87 = *(_OWORD *)(a1 + 288);
              *(_OWORD *)&v564.a = *(_OWORD *)(a1 + 272);
              *(_OWORD *)&v564.c = v87;
              *(_OWORD *)&v564.tx = *(_OWORD *)(a1 + 304);
              if (CGAffineTransformIsIdentity(&v564))
              {
                v89.f64[0] = recta;
                v90.f64[0] = v490;
              }
              else
              {
                v91 = *(double *)(a1 + 272);
                v92 = *(double *)(a1 + 280);
                v93 = *(double *)(a1 + 288);
                v94 = *(double *)(a1 + 296);
                v95 = *(double *)(a1 + 304);
                v96 = *(double *)(a1 + 312);
                v97 = *(double *)(MEMORY[0x1E0C9D538] + 8);
                v98 = v96 + v94 * v97 + v92 * *MEMORY[0x1E0C9D538];
                v99 = v95 + v86 * v93 + v91 * v490 - (v95 + v93 * v97 + v91 * *MEMORY[0x1E0C9D538]);
                v100 = v96 + v86 * v94 + v92 * v490 - v98;
                v101 = v83 * v93;
                v83 = v96 + v83 * v94 + v92 * recta;
                v89.f64[0] = v95 + v101 + v91 * recta;
                v102 = 1.0 / sqrt(v100 * v100 + v99 * v99);
                v90.f64[0] = v99 * v102;
                v86 = v100 * v102;
              }
              *(double *)v88.i64 = -v86;
              v103 = v79 - v83;
              if (!v509)
              {
                *(double *)v88.i64 = v86;
                v103 = v83;
              }
              v89.f64[1] = v103;
              *(float32x2_t *)&v104 = vcvt_f32_f64(v89);
              *(_QWORD *)&v90.f64[1] = v88.i64[0];
              *(float32x2_t *)v88.f32 = vcvt_f32_f64(v90);
              *((_QWORD *)&v104 + 1) = vnegq_f32(v88).u64[0];
              v533 = v104;
              v105 = v80;
              *(float *)&v104 = v105;
              v106 = v79;
              LODWORD(v107) = 0;
              *((float *)&v107 + 1) = v106;
              DWORD2(v555) = 0;
              *(_QWORD *)&v555 = v104;
              DWORD2(v556) = 0;
              *(_QWORD *)&v556 = v107;
              DWORD2(v557) = 1065353216;
              *(_QWORD *)&v557 = 0;
            }
            objc_msgSend(v27, "ink");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = objc_msgSend(v108, "_isEraserInk");

            v110 = *(_QWORD *)(a1 + 192);
            v111 = *(_QWORD *)(a1 + 8);
            if (v111)
            {
              v112 = *(_QWORD *)(v111 + 120);
              v113 = *(_QWORD *)(v111 + 128);
              v114 = -[PKMetalRenderState pipelineConfig](v111);
            }
            else
            {
              v112 = 0;
              v113 = 0;
              v114 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
            }
            -[PKMetalResourceHandler sixChannelShaderWithMode:clipping:erase:bitmapEraserMask:snapshotImage:renderMask:secondaryPaintEnabled:colorAttachmentIndex:pipelineConfig:](v110, v113, v78 != 0, v109, *(_BYTE *)(a1 + 935), 0, a7, r2, v112, v114, (v114 & 0xFFFFFFFFFFFFLL) >> 32);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_44;
          }
        }
        objc_msgSend(v34, "behavior");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "blendAlpha");
        v44 = v51;
      }

      goto LABEL_20;
    }
    v40 = 0;
    v33 = 0;
    v41 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
  }
  -[PKMetalResourceHandler sixChannelShaderWithMode:clipping:erase:bitmapEraserMask:snapshotImage:renderMask:secondaryPaintEnabled:colorAttachmentIndex:pipelineConfig:](*(_QWORD *)(a1 + 192), 3, 0, 0, 0, 0, 0, v33, v40, v41, (v41 & 0xFFFFFFFFFFFFLL) >> 32);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
  v115 = *(_QWORD *)(a1 + 192);
  if (!v115 || !*(_BYTE *)(v115 + 428))
  {
    v116 = *(_QWORD **)(a1 + 40);
    if (v116)
      v116 = (_QWORD *)v116[3];
    v117 = v116;
    objc_msgSend(v28, "setFragmentTexture:atIndex:", v117, 1);

    v118 = *(_QWORD *)(a1 + 8);
    if (v118)
    {
      v119 = 0;
      v120 = (_QWORD **)(a1 + 112);
      while (v119 < *(_QWORD *)(v118 + 144))
      {
        if (*(_BYTE *)(v118 + 44))
          v121 = v120 + 4;
        else
          v121 = v120;
        v122 = *v121;
        if (v122)
          v122 = (_QWORD *)v122[3];
        v123 = v122;
        if (v119)
          v124 = 7;
        else
          v124 = 6;
        objc_msgSend(v28, "setFragmentTexture:atIndex:", v123, v124);

        ++v119;
        v118 = *(_QWORD *)(a1 + 8);
        v120 += 2;
        if (!v118)
          goto LABEL_65;
      }
      if (*(_QWORD *)(v118 + 128) == 2)
      {
        v125 = *(_QWORD **)(a1 + 56);
        if (v125)
          v125 = (_QWORD *)v125[3];
        v126 = v125;
        objc_msgSend(v28, "setFragmentTexture:atIndex:", v126, 5);

      }
    }
  }
LABEL_65:
  if (a7)
  {
    v127 = *(_QWORD **)(a1 + 176);
    if (v127)
      v127 = (_QWORD *)v127[3];
    v128 = v127;
    objc_msgSend(v28, "setFragmentTexture:atIndex:", v128, 3);

  }
  if (v509)
  {
    t1 = v531;
    t2.a = 1.0;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.d = -1.0;
    t2.ty = 0.0;
    t2.tx = 0.0;
    CGAffineTransformConcat(&v531, &t1, &t2);
  }
  v548 = v129;
  v549 = v130;
  v550 = v131;
  v551 = v132;
  objc_msgSend(v28, "setVertexBytes:length:atIndex:", &v548, 224, 3);
  objc_msgSend(v28, "setFragmentBytes:length:atIndex:", v532, 112, 0);
  -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v43, v28);
  v133 = *(_QWORD *)(a1 + 192);
  if (v133)
    LODWORD(v133) = *(unsigned __int8 *)(v133 + 428) != 0;
  v134 = *(double *)(a1 + 224);
  v135 = *(double *)(a1 + 232);
  v136 = -1.0;
  if (v133 != v509)
    v136 = 1.0;
  v541.a = 2.0 / v134;
  v541.b = 0.0;
  v541.c = 0.0;
  v541.d = (v136 + v136) / v135;
  v541.tx = -1.0;
  v541.ty = -v136;
  v137 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&v562.a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&v562.c = v137;
  *(_OWORD *)&v562.tx = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&v567.a = COERCE_UNSIGNED_INT64(2.0 / v134);
  *(_OWORD *)&v567.c = *(_OWORD *)&v541.c;
  *(_OWORD *)&v567.tx = *(_OWORD *)&v541.tx;
  CGAffineTransformConcat(&v541, &v562, &v567);
  v562 = v541;
  -[PKMetalRenderer renderBrushIndicatorForStroke:withTransform:mode:](a1, v27, (__int128 *)&v562, a4);

LABEL_408:
}

- (_QWORD)eraseShaderForAttachmentIndex:(_QWORD *)a1
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  __int16 v14;
  __int16 v15;

  if (a1)
  {
    v3 = a1;
    v4 = a1[1];
    if (v4)
      v5 = -[PKMetalRenderState pipelineConfig](v4);
    else
      v5 = *((unsigned int *)v3 + 196) | ((unint64_t)*((unsigned __int16 *)v3 + 394) << 32);
    v6 = v3[24];
    v8 = 11;
    v9 = a2;
    v11 = 0;
    v10 = 0;
    v12 = 0;
    v13 = v5;
    v14 = WORD2(v5);
    v15 = 0;
    -[PKMetalResourceHandler namedShaderForKey:](v6, (__int128 *)&v8);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)renderFullscreenQuadWithShader:(void *)a3 renderEncoder:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("renderFullscreenQuadWithShader"));
    if (v11)
      v6 = (void *)v11[3];
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v5, "setRenderPipelineState:", v7);

    -[PKMetalResourceHandler cachedQuadVertexBuffer](*(_QWORD *)(a1 + 192));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVertexBuffer:offset:atIndex:", v8, 0, 0);

    -[PKMetalResourceHandler cachedQuadTexCoordBuffer](*(_QWORD *)(a1 + 192));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVertexBuffer:offset:atIndex:", v9, 0, 1);

    objc_msgSend(v5, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
    +[PKMetalRenderState renderTargetBarrierForRenderEncoder:](PKMetalRenderState, "renderTargetBarrierForRenderEncoder:", v5);
    v10 = *(_QWORD *)(a1 + 8);
    if (v10)
      objc_msgSend(*(id *)(v10 + 80), "popDebugGroup");
  }

}

- (id)renderCacheItemForStroke:(uint64_t)a3 bsplineFilter:(void *)a4 purgeableResources:(void *)a5 strokeRenderCache:
{
  id v9;
  char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  PKStrokePath *v18;
  PKInk *v19;
  void *__p[3];

  v9 = a4;
  v10 = a5;
  v11 = *(id *)(a2 + 80);
  v12 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80));
  objc_msgSend(v11, "_strokeDataUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLRUCache objectForKey:scaleFactor:](v10, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "ink");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isCompatibleWithInk:renderZoomFactor:", v15, v12))
    {
      v16 = objc_msgSend(v14, "lockPurgeableResourcesAddToSet:", v9);

      if ((v16 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    objc_msgSend(v11, "_strokeDataUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLRUCache removeObjectForKey:scaleFactor:]((uint64_t)v10, v17, v12);

  }
  memset(__p, 0, sizeof(__p));
  if (-[PKMetalRenderer generateBSplineInComputeForStroke:](a1, v11))
  {
    objc_msgSend(v11, "path");
    v18 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ink");
    v19 = (PKInk *)objc_claimAutoreleasedReturnValue();
    PKBSplineFilter::copyPointsFromStroke(a3, v18, v19, (char **)__p);
  }
  else
  {
    objc_msgSend(v11, "path");
    v18 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ink");
    v19 = (PKInk *)objc_claimAutoreleasedReturnValue();
    PKBSplineFilter::splineFromStroke((id *)a3, v18, v19, -1.0);
  }

  -[PKMetalRenderer generateCacheForStroke:points:segmentSteps:](a1, a2, *(_QWORD *)(a3 + 80), *(_QWORD *)(a3 + 88), __p);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lockPurgeableResourcesAddToSet:", v9);
  if (__p[0])
    operator delete(__p[0]);
LABEL_12:

  return v14;
}

- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 clipRect:(CGFloat)a5 renderState:(CGFloat)a6
{
  id v15;
  id v16;
  double v17;
  CGFloat v18;
  id v19;
  CGRect v20;

  v19 = a2;
  v15 = a3;
  v16 = a4;
  if (a1)
  {
    v20.origin.x = a5;
    v20.origin.y = a6;
    v20.size.width = a7;
    v20.size.height = a8;
    if (CGRectIsNull(v20))
    {
      a7 = (double)(unint64_t)objc_msgSend(v19, "width");
      a8 = (double)(unint64_t)objc_msgSend(v19, "height");
      a5 = 0.0;
      a6 = 0.0;
    }
    v17 = -[PKMetalFramebuffer size]((uint64_t)v15);
    -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v19, v15, v16, 0, a5, a6, a7, a8, 0.0, 0.0, v17, v18);
  }

}

- (void)renderTexture:(void *)a3 intoFramebuffer:(void *)a4 sourceRect:(uint64_t)a5 destinationRect:(CGFloat)a6 renderState:(CGFloat)a7 blendMode:(CGFloat)a8
{
  _QWORD *v25;
  char *v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  char *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  float64x2_t *v60;
  float64x2_t v61;
  unint64_t v62;
  unint64_t v63;
  double v64;
  double v65;
  _QWORD *v66;
  id v67;
  float64x2_t v68[3];
  _BYTE v69[32];
  float64x2_t v70;
  _QWORD v71[3];
  _QWORD v72[4];

  v67 = a2;
  v25 = a3;
  v26 = a4;
  if (a1)
  {
    if (qword_1ECEE6280 != -1)
      dispatch_once(&qword_1ECEE6280, &__block_literal_global_51);
    v66 = v25;
    if (_MergedGlobals_135)
    {
      if (v26 && (v27 = *((id *)v26 + 7)) != 0 || (v27 = 0, a8 != a12) || a9 != a13)
      {

      }
      else if (*(_QWORD **)(a1 + 40) != v25 || !*(_BYTE *)(a1 + 72))
      {
        v29 = v67;
        v43 = v25;
        v49 = v26;
        if ((unint64_t)a8 && (unint64_t)a9)
        {
          objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "blitCommandEncoder");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v69 = (unint64_t)a6;
          *(_QWORD *)&v69[8] = (unint64_t)a7;
          *(_QWORD *)&v69[16] = 0;
          v72[0] = (unint64_t)a8;
          v72[1] = (unint64_t)a9;
          v72[2] = 1;
          if (v43)
            v52 = (void *)v43[3];
          else
            v52 = 0;
          v53 = v52;
          v71[0] = (unint64_t)a10;
          v71[1] = (unint64_t)a11;
          v71[2] = 0;
          objc_msgSend(v51, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v29, 0, 0, v69, v72, v53, 0, 0, v71);

          objc_msgSend(v51, "endEncoding");
          if (v26)
          {
            -[PKMetalRenderState addCommandBuffer:]((uint64_t)v49, v50);
          }
          else
          {
            objc_msgSend(v50, "enqueue");
            objc_msgSend(v50, "commit");
          }

        }
LABEL_60:

        v25 = v66;
        goto LABEL_61;
      }
    }
    v28 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)v69 = 7;
    memset(&v69[8], 0, 24);
    *(_QWORD *)&v70.f64[0] = 2 * (v28 != 0);
    -[PKMetalResourceHandler namedShaderForKey:](v28, (__int128 *)v69);
    v29 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v30 = (void *)*((_QWORD *)v26 + 17);
    else
      v30 = 0;
    v31 = v30;

    if (v31)
    {
      v32 = *(_QWORD *)(a1 + 192);
      memset(&v69[12], 0, 20);
      if (v32)
      {
        if (*(_BYTE *)(v32 + 429))
          v33 = 3;
        else
          v33 = 2;
      }
      else
      {
        v33 = 0;
      }
      *(_QWORD *)v69 = 7;
      *(_QWORD *)&v70.f64[0] = v33;
      *(_DWORD *)&v69[8] = 0;
      -[PKMetalResourceHandler namedShaderForKey:](v32, (__int128 *)v69);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v26)
        goto LABEL_17;
      if (v26[38])
        goto LABEL_17;
      if (*(_QWORD **)(a1 + 40) != v25)
        goto LABEL_17;
      v48 = *((id *)v26 + 17);

      if (v48)
        goto LABEL_17;
      -[PKMetalRenderer blitShader](a1);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (_QWORD *)v34;

    v29 = v35;
LABEL_17:
    if (a5)
    {
      -[PKMetalShader shaderWithBlendMode:](v29, a5);
      v36 = objc_claimAutoreleasedReturnValue();

      v29 = (_QWORD *)v36;
    }
    if (v26)
    {
      v37 = *((id *)v26 + 7);
      v38 = (void *)*((_QWORD *)v26 + 10);
    }
    else
    {
      v37 = 0;
      v38 = 0;
    }
    v39 = v38;
    v40 = v39;
    v41 = v37 == 0;
    if (v37 && v39)
    {
      v41 = 0;
      v42 = v39;
      v43 = v37;
    }
    else
    {
      v43 = v37;
      if (!v37)
      {
        objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
        v43 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "colorAttachments");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD **)(a1 + 40) == v66 && *(_BYTE *)(a1 + 72))
      {
        *(_BYTE *)(a1 + 72) = 0;
        v47 = 2;
      }
      else
      {
        v47 = 1;
      }
      objc_msgSend(v46, "setLoadAction:", v47);
      objc_msgSend(v46, "setStoreAction:", 1);
      v54 = v66;
      if (v66)
        v54 = (void *)v66[3];
      v55 = v54;
      objc_msgSend(v46, "setTexture:", v55);

      -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v26, v66);
      objc_msgSend(v43, "renderCommandEncoderWithDescriptor:", v44);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
        -[PKMetalRenderState setRenderEncoder:]((uint64_t)v26, v42);

    }
    if (v29)
      v56 = (void *)v29[3];
    else
      v56 = 0;
    v57 = v56;
    objc_msgSend(v42, "setRenderPipelineState:", v57);

    objc_msgSend(v42, "setFragmentTexture:atIndex:", v67, 0);
    if (v29)
      v58 = (void *)v29[3];
    else
      v58 = 0;
    v59 = v58;
    objc_msgSend(v42, "setRenderPipelineState:", v59);

    v60 = (float64x2_t *)(v26 + 184);
    if (!v26)
      v60 = (float64x2_t *)MEMORY[0x1E0C9BAA8];
    v61 = v60[1];
    *(float64x2_t *)v69 = *v60;
    *(float64x2_t *)&v69[16] = v61;
    v70 = v60[2];
    v62 = objc_msgSend(v67, "width");
    v63 = objc_msgSend(v67, "height");
    v64 = -[PKMetalFramebuffer size]((uint64_t)v66);
    v68[0] = *(float64x2_t *)v69;
    v68[1] = *(float64x2_t *)&v69[16];
    v68[2] = v70;
    -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:texCoordTransform:](v42, v68, a6, a7, a8, a9, a10, a11, a12, a13, (double)v62, (double)v63, v64, v65);
    if (v41)
    {
      if (v26)
      {
        objc_msgSend(v42, "endEncoding");
        -[PKMetalRenderState addCommandBuffer:]((uint64_t)v26, v43);
      }
      else
      {
        +[PKMetalRenderState renderTargetBarrierForRenderEncoder:](PKMetalRenderState, "renderTargetBarrierForRenderEncoder:", v42);
        objc_msgSend(v42, "endEncoding");
        objc_msgSend(v43, "enqueue");
        objc_msgSend(v43, "commit");
      }
    }

    goto LABEL_60;
  }
LABEL_61:

}

- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7
{
  id v26;
  float64x2_t v27;
  CGFloat v28;
  id v30;
  float64x2_t v32[3];

  v26 = a1;
  v27 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
  v32[0] = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
  v32[1] = v27;
  v32[2] = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
  v28 = a8;
  v30 = v26;
  -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:texCoordTransform:](v26, v32, a2, a3, a4, a5, a6, a7, v28, a9, a10, a11, a12, a13);

}

- (void)renderUberVertexShaderWithSourceRect:(CGFloat)a3 destinationRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 sourcePixelSize:(CGFloat)a6 destPixelSize:(CGFloat)a7 texCoordTransform:(CGFloat)a8
{
  id v25;
  CGFloat x;
  float64_t y;
  CGFloat width;
  CGFloat height;
  CGFloat v30;
  float64_t v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat MaxY;
  float64x2_t v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  float64x2_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat MinY;
  float64x2_t v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  float64x2_t v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  float64x2_t v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  float64x2_t v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  float64x2_t v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  CGRect v73;
  float64x2_t v74[3];
  float64x2_t v75[3];
  _OWORD v76[2];
  float64x2_t v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  _QWORD v81[4];
  _QWORD v82[5];
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v73.size.width = a9;
  v73.size.height = a10;
  v73.origin.x = a7;
  v73.origin.y = a8;
  v82[4] = *MEMORY[0x1E0C80C00];
  v25 = a1;
  CGAffineTransformMakeScale(&v80, 1.0 / a11, 1.0 / a12);
  v83.origin.x = a3;
  v83.origin.y = a4;
  v83.size.width = a5;
  v83.size.height = a6;
  v84 = CGRectApplyAffineTransform(v83, &v80);
  x = v84.origin.x;
  y = v84.origin.y;
  width = v84.size.width;
  height = v84.size.height;
  CGAffineTransformMakeScale(&v79, 1.0 / a13, 1.0 / a14);
  v85 = CGRectApplyAffineTransform(v73, &v79);
  v78.b = 0.0;
  v78.c = 0.0;
  v78.a = 2.0;
  *(_OWORD *)&v78.d = xmmword_1BE4FD990;
  v78.ty = 1.0;
  v86 = CGRectApplyAffineTransform(v85, &v78);
  v30 = v86.origin.x;
  v31 = v86.origin.y;
  v32 = v86.size.width;
  v33 = v86.size.height;
  v73.size.height = CGRectGetMinX(v86);
  v87.origin.x = v30;
  v87.origin.y = v31;
  v87.size.width = v32;
  v87.size.height = v33;
  MaxY = CGRectGetMaxY(v87);
  v35.f64[0] = v73.size.height;
  v35.f64[1] = MaxY;
  v82[0] = vcvt_f32_f64(v35);
  v36 = v30;
  v35.f64[0] = v31;
  v37 = v32;
  v38 = v33;
  v73.size.height = CGRectGetMaxX(*(CGRect *)((char *)&v35 - 8));
  v88.origin.x = v30;
  v88.origin.y = v31;
  v88.size.width = v32;
  v88.size.height = v33;
  v39 = CGRectGetMaxY(v88);
  v40.f64[0] = v73.size.height;
  v40.f64[1] = v39;
  v82[1] = vcvt_f32_f64(v40);
  v41 = v30;
  v40.f64[0] = v31;
  v42 = v32;
  v43 = v33;
  v73.size.height = CGRectGetMinX(*(CGRect *)((char *)&v40 - 8));
  v89.origin.x = v30;
  v89.origin.y = v31;
  v89.size.width = v32;
  v89.size.height = v33;
  MinY = CGRectGetMinY(v89);
  v45.f64[0] = v73.size.height;
  v45.f64[1] = MinY;
  v82[2] = vcvt_f32_f64(v45);
  v46 = v30;
  v45.f64[0] = v31;
  v47 = v32;
  v48 = v33;
  v73.size.height = CGRectGetMaxX(*(CGRect *)((char *)&v45 - 8));
  v90.origin.x = v30;
  v90.origin.y = v31;
  v90.size.width = v32;
  v90.size.height = v33;
  v49 = CGRectGetMinY(v90);
  v50.f64[0] = v73.size.height;
  v50.f64[1] = v49;
  v82[3] = vcvt_f32_f64(v50);
  v51 = x;
  v50.f64[0] = y;
  v52 = width;
  v53 = height;
  v73.size.height = CGRectGetMinX(*(CGRect *)((char *)&v50 - 8));
  v91.origin.x = x;
  v91.origin.y = y;
  v91.size.width = width;
  v91.size.height = height;
  v54 = CGRectGetMinY(v91);
  v55.f64[0] = v73.size.height;
  v55.f64[1] = v54;
  v81[0] = vcvt_f32_f64(v55);
  v56 = x;
  v55.f64[0] = y;
  v57 = width;
  v58 = height;
  v73.size.height = CGRectGetMaxX(*(CGRect *)((char *)&v55 - 8));
  v92.origin.x = x;
  v92.origin.y = y;
  v92.size.width = width;
  v92.size.height = height;
  v59 = CGRectGetMinY(v92);
  v60.f64[0] = v73.size.height;
  v60.f64[1] = v59;
  v81[1] = vcvt_f32_f64(v60);
  v61 = x;
  v60.f64[0] = y;
  v62 = width;
  v63 = height;
  v73.size.height = CGRectGetMinX(*(CGRect *)((char *)&v60 - 8));
  v93.origin.x = x;
  v93.origin.y = y;
  v93.size.width = width;
  v93.size.height = height;
  v64 = CGRectGetMaxY(v93);
  v65.f64[0] = v73.size.height;
  v65.f64[1] = v64;
  v81[2] = vcvt_f32_f64(v65);
  v66 = x;
  v65.f64[0] = y;
  v67 = width;
  v68 = height;
  v73.size.height = CGRectGetMaxX(*(CGRect *)((char *)&v65 - 8));
  v94.origin.x = x;
  v94.origin.y = y;
  v94.size.width = width;
  v94.size.height = height;
  v69 = CGRectGetMaxY(v94);
  v70.f64[0] = v73.size.height;
  v70.f64[1] = v69;
  v81[3] = vcvt_f32_f64(v70);
  v71 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
  v76[0] = *MEMORY[0x1E0C9BAA8];
  v76[1] = v71;
  v77 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
  v75[0] = (float64x2_t)v76[0];
  v75[1] = v71;
  v75[2] = v77;
  v72 = a2[1];
  v74[0] = *a2;
  v74[1] = v72;
  v74[2] = a2[2];
  -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v76, v75, v74, v25);
  objc_msgSend(v25, "setVertexBytes:length:atIndex:", v82, 32, 0);
  objc_msgSend(v25, "setVertexBytes:length:atIndex:", v81, 32, 1);
  objc_msgSend(v25, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);

}

- (void)setupUberVertexShaderWithTransform:(_anonymous_namespace_ *)a1 paperTransform:(float64x2_t *)a2 texCoordTransform:(float64x2_t *)a3 renderEncoder:(void *)a4
{
  id v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  const CGAffineTransform *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v8 = vcvt_f32_f64(*a3);
  v9 = vcvt_f32_f64(a3[1]);
  v10 = vcvt_f32_f64(a3[2]);
  DWORD2(v20) = 0;
  *(float32x2_t *)&v20 = v8;
  DWORD2(v21) = 0;
  *(float32x2_t *)&v21 = v9;
  DWORD2(v22) = 1065353216;
  *(float32x2_t *)&v22 = v10;
  v11 = vcvt_f32_f64(*MEMORY[0x1E0C9BAA8]);
  v12 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16));
  v13 = vcvt_f32_f64(*(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32));
  DWORD2(v23) = 0;
  *(float32x2_t *)&v23 = v11;
  DWORD2(v24) = 0;
  *(float32x2_t *)&v24 = v12;
  DWORD2(v25) = 1065353216;
  *(float32x2_t *)&v25 = v13;
  v19[0] = v15;
  v19[1] = v16;
  v19[2] = v17;
  v19[3] = v18;
  *(float32x2_t *)&v15 = vcvt_f32_f64(*a2);
  *(float32x2_t *)&v16 = vcvt_f32_f64(a2[1]);
  *(float32x2_t *)&v17 = vcvt_f32_f64(a2[2]);
  DWORD2(v26) = 0;
  *(_QWORD *)&v26 = v15;
  DWORD2(v27) = 0;
  *(_QWORD *)&v27 = v16;
  DWORD2(v28) = 1065353216;
  *(_QWORD *)&v28 = v17;
  objc_msgSend(v7, "setVertexBytes:length:atIndex:", v19, 224, 3);

}

- (id)blitShader
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  __int16 v11;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    v3 = -[PKMetalRenderState pipelineConfig](v2);
  else
    v3 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
  v4 = *(_QWORD *)(a1 + 192);
  v6 = 7uLL;
  v7 = 0;
  v8 = 0;
  v9 = v3;
  v10 = WORD2(v3);
  v11 = 0;
  -[PKMetalResourceHandler namedShaderForKey:](v4, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3
{
  CGImageRef v5;
  id v10;

  v5 = (CGImageRef)a1;
  if (a1)
  {
    if (-[PKMetalRenderer ensureOriginalBackFramebufferHasContents](a1))
      v10 = *((id *)v5 + 5);
    else
      v10 = 0;
    v5 = -[PKMetalRenderer newCGImageWithClipRect:framebuffer:]((uint64_t)v5, v10, a2, a3, a4, a5);

  }
  return v5;
}

- (CGImageRef)newSixChannelMultiplyCGImageWithClipRect:(CGFloat)a3
{
  CGImageRef v5;
  _BYTE *v10;
  int v11;
  _BYTE *v12;

  v5 = a1;
  if (a1)
  {
    v10 = (_BYTE *)*((_QWORD *)a1 + 7);
    if (v10)
    {
      if (*((_BYTE *)v5 + 64))
      {
LABEL_6:
        v12 = v10;
LABEL_8:
        v5 = -[PKMetalRenderer newCGImageWithClipRect:framebuffer:]((uint64_t)v5, v12, a2, a3, a4, a5);

        return v5;
      }
      v11 = -[PKMetalFramebuffer incrementNonPurgeableCount](v10);
      *((_BYTE *)v5 + 64) = v11;
      if (v11)
      {
        v10 = (_BYTE *)*((_QWORD *)v5 + 7);
        goto LABEL_6;
      }
    }
    v12 = 0;
    goto LABEL_8;
  }
  return v5;
}

- (CGImageRef)newCGImageWithClipRect:(CGFloat)a3 framebuffer:(CGFloat)a4
{
  id *v11;
  BOOL IsNull;
  double width;
  double height;
  double x;
  double v16;
  size_t v17;
  size_t v18;
  CGImageRef Image;
  BOOL IsEmpty;
  char v22;
  CGContext *v23;
  CGContext *v24;
  CGColorSpace *v25;
  size_t v26;
  size_t v27;
  id v28;
  CGContext *v29;
  void *v30;
  id v31;
  void *v33;
  double rect;
  _QWORD v35[3];
  _QWORD v36[4];
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v11 = a2;
  if (!a1)
    goto LABEL_10;
  v37.origin.x = a3;
  v37.origin.y = a4;
  v37.size.width = a5;
  v37.size.height = a6;
  IsNull = CGRectIsNull(v37);
  width = *(double *)(a1 + 224);
  height = *(double *)(a1 + 232);
  x = 0.0;
  if (IsNull)
  {
    rect = 0.0;
    a3 = 0.0;
    a4 = 0.0;
    a5 = *(double *)(a1 + 224);
    a6 = *(double *)(a1 + 232);
  }
  else
  {
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v38.origin.x = a3;
    v38.origin.y = a4;
    v38.size.width = a5;
    v38.size.height = a6;
    v45.size.width = *(CGFloat *)(a1 + 224);
    v45.size.height = *(CGFloat *)(a1 + 232);
    v39 = CGRectIntersection(v38, v45);
    rect = v39.origin.y;
    x = v39.origin.x;
    width = v39.size.width;
    height = v39.size.height;
  }
  v40.origin.x = a3;
  v40.origin.y = a4;
  v40.size.width = a5;
  v40.size.height = a6;
  v16 = CGRectGetWidth(v40);
  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  v41.size.height = a6;
  v17 = vcvtpd_u64_f64(v16);
  v18 = vcvtpd_u64_f64(CGRectGetHeight(v41));
  if (!v17 || v18 == 0)
  {
LABEL_10:
    Image = 0;
    goto LABEL_23;
  }
  v42.origin.x = x;
  v42.origin.y = rect;
  v42.size.width = width;
  v42.size.height = height;
  IsEmpty = CGRectIsEmpty(v42);
  if (v11)
    v22 = IsEmpty;
  else
    v22 = 1;
  if ((v22 & 1) != 0)
  {
    v23 = DKUCreateRGBABitmapContext(0, (double)v17, (double)v18, 1.0);
    v24 = v23;
    if (v23)
    {
      v43.origin.x = 0.0;
      v43.origin.y = 0.0;
      v43.size.width = (double)v17;
      v43.size.height = (double)v18;
      CGContextClearRect(v23, v43);
      Image = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      goto LABEL_23;
    }
    goto LABEL_10;
  }
  v25 = (CGColorSpace *)DKUDeviceRGBColorSpace();
  v26 = (4 * v17 + 31) & 0xFFFFFFFFFFFFFFE0;
  v27 = v26 * v18;
  v28 = objc_retainAutorelease((id)objc_msgSend(*(id *)(a1 + 24), "newBufferWithLength:options:", v26 * v18, 0));
  v29 = CGBitmapContextCreate((void *)objc_msgSend(v28, "contents"), v17, v18, 8uLL, v26, v25, 0x2002u);
  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "blitCommandEncoder");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44.origin.x = x;
    v44.origin.y = rect;
    v44.size.width = width;
    v44.size.height = height;
    v46.origin.x = a3;
    v46.origin.y = a4;
    v46.size.width = a5;
    v46.size.height = a6;
    if (!CGRectEqualToRect(v44, v46))
      objc_msgSend(v30, "fillBuffer:range:value:", v28, 0, v27, 0);
    v31 = v11[3];
    v36[0] = (unint64_t)x;
    v36[1] = (unint64_t)rect;
    v36[2] = 0;
    v35[0] = (unint64_t)width;
    v35[1] = (unint64_t)height;
    v35[2] = 1;
    objc_msgSend(v30, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", v31, 0, 0, v36, v35, v28, 0, v26, v27);

    objc_msgSend(v30, "endEncoding");
    objc_msgSend(v33, "commit");
    objc_msgSend(v33, "waitUntilCompleted");
    Image = CGBitmapContextCreateImage(v29);
    CGContextRelease(v29);

  }
  else
  {
    Image = 0;
  }

LABEL_23:
  return Image;
}

- (uint64_t)ensureOriginalBackFramebufferHasContents
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      if (*(_BYTE *)(v1 + 72))
      {
        return 0;
      }
      else if (*(_BYTE *)(v1 + 48))
      {
        return 1;
      }
      else
      {
        result = -[PKMetalFramebuffer incrementNonPurgeableCount]((_BYTE *)result);
        *(_BYTE *)(v1 + 48) = result;
      }
    }
  }
  return result;
}

- (void)setBackgroundColor:(uint64_t)a1
{
  CGColor *v4;

  if (a1)
  {
    v4 = *(CGColor **)(a1 + 240);
    if (v4 != (CGColor *)a2)
    {
      if (v4)
      {
        CGColorRelease(v4);
        *(_QWORD *)(a1 + 240) = 0;
      }
      if (a2)
        *(_QWORD *)(a1 + 240) = DKUCGColorCreateConvertedToSRGB(a2);
    }
  }
}

- (void)setLiveRenderingOverrideColor:(uint64_t)a1
{
  CGColor *v4;

  if (a1)
  {
    v4 = *(CGColor **)(a1 + 960);
    if (v4 != color)
    {
      if (v4)
      {
        CGColorRelease(v4);
        *(_QWORD *)(a1 + 960) = 0;
      }
      if (color)
        *(_QWORD *)(a1 + 960) = CGColorRetain(color);
    }
  }
}

- (void)setPaperTextureImage:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  size_t Width;
  CGFloat Height;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];
  CGSize v30;

  v29[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(void **)(a1 + 448);
    *(_QWORD *)(a1 + 448) = 0;

    *(_OWORD *)(a1 + 456) = *MEMORY[0x1E0C9D820];
    if (a2)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6C40]), "initWithDevice:", *(_QWORD *)(a1 + 24));
      v6 = *MEMORY[0x1E0CC6C28];
      v7 = *MEMORY[0x1E0CC6C08];
      v28[0] = *MEMORY[0x1E0CC6C00];
      v28[1] = v7;
      v29[0] = v6;
      v29[1] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v9 = objc_msgSend(v5, "newTextureWithCGImage:options:error:", a2, v8, &v25);
      v10 = v25;
      v11 = *(void **)(a1 + 448);
      *(_QWORD *)(a1 + 448) = v9;

      v12 = *(void **)(a1 + 448);
      if (!v12)
      {
        Width = CGImageGetWidth(a2);
        Height = (double)CGImageGetHeight(a2);
        v30.width = (double)Width;
        v30.height = Height;
        UIGraphicsBeginImageContextWithOptions(v30, 0, 1.0);
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "drawInRect:", 0.0, 0.0, (double)Width, Height);

        UIGraphicsGetImageFromCurrentImageContext();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v17 = objc_retainAutorelease(v16);
        v24 = v10;
        v18 = objc_msgSend(v5, "newTextureWithCGImage:options:error:", objc_msgSend(v17, "CGImage"), v8, &v24);
        v19 = v24;

        v20 = *(void **)(a1 + 448);
        *(_QWORD *)(a1 + 448) = v18;

        v12 = *(void **)(a1 + 448);
        v10 = v19;
      }
      v21 = objc_msgSend(v12, "width");
      v22 = objc_msgSend(*(id *)(a1 + 448), "height");
      *(double *)(a1 + 456) = (double)v21;
      *(double *)(a1 + 464) = (double)v22;
      if (!*(_QWORD *)(a1 + 448))
      {
        v23 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v10;
          _os_log_impl(&dword_1BE213000, v23, OS_LOG_TYPE_DEFAULT, "Failed to load texture: %@", buf, 0xCu);
        }

      }
    }
  }
}

- (void)setupForDefaultUberVertexShaderInRenderEncoder:(uint64_t)a1
{
  float64x2_t v3;
  id v4;
  float64x2_t v5[3];
  float64x2_t v6[3];
  _OWORD v7[2];
  float64x2_t v8;

  v4 = a2;
  if (a1)
  {
    v3 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v3;
    v8 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
    v6[0] = (float64x2_t)v7[0];
    v6[1] = v3;
    v6[2] = v8;
    v5[0] = (float64x2_t)v7[0];
    v5[1] = v3;
    v5[2] = v8;
    -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v7, v6, v5, v4);
  }

}

- (double)dirtyClipRectForAnimatingStrokeVertices:(uint64_t)a1 newSize:(unint64_t)a2
{
  double v4;
  unint64_t v5;
  uint64_t v6;
  _anonymous_namespace_::AnimatingStroke *v7;
  uint64_t v8;
  BOOL v9;
  float *v10;
  double v11;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(_QWORD *)(a1 + 328);
    v6 = 36;
  else
    v6 = 20;
  if (*(_BYTE *)(a1 + 320))
  {
    v7 = (_anonymous_namespace_::AnimatingStroke *)a1;
    v8 = 0;
  }
  else
  {
    v9 = a2 > v5;
    a2 -= v5;
    if (!v9)
      return v4;
    v7 = (_anonymous_namespace_::AnimatingStroke *)a1;
    v8 = v5;
  }
  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v10, a2, v6);
  return v11;
}

- (float)clipRectForVertices:(float *)result numVertices:(uint64_t)a2 vertexSize:(uint64_t)a3
{
  double v3;
  double v4;
  uint64_t v5;
  float *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a2)
  {
    v3 = *result;
    v4 = result[1];
    v5 = a2 - 1;
    if (a2 != 1)
    {
      v6 = (float *)((char *)result + a3 + 4);
      v7 = result[1];
      v8 = *result;
      while (1)
      {
        v9 = *(v6 - 1);
        v10 = v3 < v9 ? *(v6 - 1) : v3;
        if (v8 <= v9)
          v3 = v10;
        else
          v8 = *(v6 - 1);
        v11 = *v6;
        if (v7 > v11)
          break;
        if (v4 >= v11)
          goto LABEL_15;
LABEL_16:
        v6 = (float *)((char *)v6 + a3);
        v4 = v11;
        if (!--v5)
          return result;
      }
      v7 = *v6;
LABEL_15:
      v11 = v4;
      goto LABEL_16;
    }
  }
  return result;
}

- (double)updateActualSize:(double)a3 pixelSize:(double)a4
{
  double v6;
  double v8;
  void *v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v6 = result;
    v8 = *(double *)(a1 + 224);
    if (a4 != v8 || a5 != *(double *)(a1 + 232))
    {
      *(double *)(a1 + 224) = a4;
      *(double *)(a1 + 232) = a5;
      -[PKMetalRenderer teardownDrawingFramebuffers]((_QWORD *)a1);
      v10 = *(void **)(a1 + 200);
      *(_QWORD *)(a1 + 200) = 0;

      v11 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = 0;

      v12 = *(void **)(a1 + 216);
      *(_QWORD *)(a1 + 216) = 0;

      v8 = *(double *)(a1 + 224);
    }
    *(double *)(a1 + 248) = v6;
    *(double *)(a1 + 256) = a3;
    result = v8 / v6;
    *(double *)(a1 + 264) = result;
  }
  return result;
}

- (void)setupOriginalBackFramebufferIfNecessary
{
  _QWORD *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  _BYTE v11[16];

  if (!a1)
    return;
  v3 = a1 + 40;
  v2 = *(_QWORD **)(a1 + 40);
  v4 = *(unsigned __int8 *)(v3 + 8);
  if (v2)
  {
    if (*(_BYTE *)(v3 + 8))
      goto LABEL_7;
    v4 = -[PKMetalFramebuffer incrementNonPurgeableCount](v2);
    *(_BYTE *)(a1 + 48) = v4;
  }
  if (v4)
  {
    v2 = *(_QWORD **)v3;
    if (!*(_QWORD *)v3)
    {
      v5 = 0;
LABEL_8:
      v6 = *(void **)(a1 + 472);
      if (v5 == v6)
        return;
      goto LABEL_11;
    }
LABEL_7:
    v5 = (void *)v2[5];
    goto LABEL_8;
  }
  v6 = *(void **)(a1 + 472);
LABEL_11:
  v7 = *(_QWORD *)(a1 + 40);
  if (v7
    && (*(_BYTE *)(a1 + 48)
     || (*(_BYTE *)(a1 + 48) = -[PKMetalFramebuffer incrementNonPurgeableCount]((_BYTE *)v7),
         (v7 = *(_QWORD *)(a1 + 40)) != 0)))
  {
    v8 = *(void **)(v7 + 24);
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;
  objc_msgSend(v9, "setLabel:", CFSTR("Original back framebuffer"));

  *(_BYTE *)(a1 + 72) = 1;
  v10 = *(_QWORD *)(a1 + 192);
  if (v10 && !*(_BYTE *)(v10 + 426) && *(_BYTE *)(v10 + 427))
  {
    if (qword_1ECEE6288 != -1)
      dispatch_once(&qword_1ECEE6288, &__block_literal_global_21);
    if (!byte_1ECEE6279)
      -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](a1, *(void **)(a1 + 40));
  }
}

- (void)clearFramebuffer:(uint64_t)a1 waitUntilCompleted:(void *)a2
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  float32x4_t v11;
  uint64_t v12;
  void *v13;
  float32x4_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "commandBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorAttachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setLoadAction:", 0);
    objc_msgSend(v7, "setStoreAction:", 1);
    if (v3)
      v8 = (void *)*((_QWORD *)v3 + 3);
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v7, "setTexture:", v9);

    objc_msgSend(v4, "renderCommandEncoderWithDescriptor:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v10);
    if (v3)
      v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v3 + 88)), *(float64x2_t *)(v3 + 104));
    else
      v11 = 0uLL;
    v14 = v11;
    objc_msgSend(v10, "setFragmentBytes:length:atIndex:", &v14, 16, 0);
    v12 = *(_QWORD *)(a1 + 192);
    v16 = 0;
    v17 = 0;
    v15 = 0xCuLL;
    v18 = 2 * (v12 != 0);
    v19 = 0;
    -[PKMetalResourceHandler namedShaderForKey:](v12, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v13, v10);

    objc_msgSend(v10, "endEncoding");
    objc_msgSend(v4, "enqueue");
    objc_msgSend(v4, "commit");

  }
}

- (void)renderBrushIndicatorForStroke:(__int128 *)a3 withTransform:(unint64_t)a4 mode:
{
  void *v7;
  void *v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  float64x2_t v22;
  float v23;
  float16x4_t v30;
  uint64_t v31;
  __int16 *v32;
  float *v33;
  float *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  float64x2_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  float64x2_t v48[3];
  float64x2_t v49[2];
  float64x2_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  int v56;
  float32x2_t v57;
  float v58;
  _BYTE v59[32];
  _BYTE v60[32];
  char v61[30];
  _BYTE v62[58];
  float32x2x2_t v63;

  *(_QWORD *)&v62[50] = *MEMORY[0x1E0C80C00];
  v43 = a2;
  objc_msgSend(v43, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEraser") ^ 1;
  if (a4 > 2)
    LOBYTE(v9) = 1;
  if ((v9 & 1) != 0)
  {

  }
  else
  {
    v10 = *(unsigned __int8 *)(a1 + 352);

    if (v10)
    {
      v11 = *(double *)(a1 + 368);
      v12 = *(double *)(a1 + 376);
      v13 = *(double *)(a1 + 384);
      v44 = *a3;
      v45 = a3[1];
      v46 = a3[2];
      v14 = *(_QWORD *)(a1 + 8);
      if (v14)
      {
        v21 = *(id *)(v14 + 80);
        if (v21)
        {
          v55 = xmmword_1BE4FD9A0;
          v22 = *(float64x2_t *)(a1 + 984);
          v23 = 3.5 / v22.f64[0];
          v58 = v23;
          __asm
          {
            FMOV            V1.2D, #0.5
            FMOV            V2.2D, #1.0
          }
          v57 = vcvt_f32_f64((float64x2_t)vextq_s8((int8x16_t)vmulq_f64(v22, _Q1), (int8x16_t)vdivq_f64(_Q2, v22), 8uLL));
          *(float *)v22.f64 = v13;
          v56 = LODWORD(v22.f64[0]);
          v54 = 0;
          v31 = 0;
          v32 = (__int16 *)v62;
          do
          {
            v63.val[0].i32[0] = *(_DWORD *)(v32 - 15);
            v63.val[0].i32[1] = *(_DWORD *)(v32 - 5);
            v63.val[1].i32[0] = *(_DWORD *)(v32 - 13);
            v63.val[1].i32[1] = *(_DWORD *)(v32 - 3);
            v33 = (float *)&v60[v31];
            vst2_f32(v33, v63);
            v63.val[0].i16[0] = *(v32 - 11);
            v63.val[0].i16[1] = *(v32 - 1);
            v63.val[0] = (float32x2_t)vcvtq_f32_f16((float16x4_t)v63.val[0]).u64[0];
            v30.i16[0] = *(v32 - 10);
            v30.i16[1] = *v32;
            v63.val[1] = (float32x2_t)vcvtq_f32_f16(v30).u64[0];
            v34 = (float *)&v59[v31];
            vst2_f32(v34, v63);
            v32 += 20;
            v31 += 16;
          }
          while (v31 != 32);
          v35 = *(_QWORD *)(a1 + 8);
          if (v35)
            v36 = -[PKMetalRenderState pipelineConfig](v35);
          else
            v36 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
          v37 = *(_QWORD *)(a1 + 192);
          v51 = 9uLL;
          v52 = 0uLL;
          LODWORD(v53) = v36;
          DWORD1(v53) = WORD2(v36);
          -[PKMetalResourceHandler namedShaderForKey:](v37, &v51);
          v38 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v51 = v44;
          v52 = v45;
          v53 = v46;
          v39 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
          v49[0] = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
          v49[1] = v39;
          v50 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
          v48[0] = v49[0];
          v48[1] = v39;
          v48[2] = v50;
          -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)&v51, v49, v48, v21);
          if (v38)
            v40 = (void *)v38[3];
          else
            v40 = 0;
          v41 = v40;
          objc_msgSend(v21, "setRenderPipelineState:", v41);

          objc_msgSend(v21, "setVertexBytes:length:atIndex:", v60, 32, 0);
          objc_msgSend(v21, "setVertexBytes:length:atIndex:", v59, 32, 1);
          objc_msgSend(v21, "setFragmentBytes:length:atIndex:", &v55, 32, 0);
          v47 = 0;
          -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(a1 + 192), 8uLL, &v47);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 6, v47, v42, 0);

        }
      }
      else
      {
        v21 = 0;
      }

    }
  }

}

- (void)finishRenderingNoTeardownForStroke:(void *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5
{
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;

  v13 = a3;
  -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("finishRenderingNoTeardownForStroke"));
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v24 = *MEMORY[0x1E0C9D628];
  v25 = v14;
  if (!-[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](a1, v13, (CGFloat *)&v24, *(CGFloat *)(a2 + 216), *(CGFloat *)(a2 + 224), *(CGFloat *)(a2 + 232), *(CGFloat *)(a2 + 240), a4, a5, a6, a7))
  {
LABEL_7:
    v22 = *(_QWORD *)(a1 + 8);
    if (v22)
      objc_msgSend(*(id *)(v22 + 80), "popDebugGroup");
    goto LABEL_9;
  }
  v15 = *(_QWORD *)(a1 + 8);
  if (v15)
  {
    v16 = *(_QWORD *)(v15 + 120);
    *(_QWORD *)(v15 + 120) = 0;
    v17 = *(_QWORD *)(a1 + 8);
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  *(_BYTE *)(a1 + 72) = 0;
  -[PKMetalRenderState pushDebugGroup:](v17, CFSTR("Render stroke into original back framebuffer"));
  v18 = *(void **)(a2 + 80);
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v23[0] = *MEMORY[0x1E0C9BAA8];
  v23[1] = v19;
  v23[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[PKMetalRenderer renderStroke:withTransform:mode:flipped:renderBufferSize:renderEncoder:currentClipRect:needRenderMask:](a1, v18, (uint64_t)v23, 3uLL, 0, v13, *(unsigned __int8 *)(a2 + 285), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *(CGFloat *)&v24, *((CGFloat *)&v24 + 1), *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
  v20 = *(_QWORD *)(a1 + 8);
  if (v20)
  {
    objc_msgSend(*(id *)(v20 + 80), "popDebugGroup");
    v21 = *(_QWORD *)(a1 + 8);
    if (v21)
    {
      *(_QWORD *)(v21 + 120) = v16;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)finishRendering
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 932))
    {
      v2 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Finish rendering", v3, 2u);
      }

    }
    *(_BYTE *)(a1 + 352) = 0;
  }
}

- (uint64_t)setupClippingForStrokeClipRect:(CGFloat *)a3 clippedToPixelSpaceRect:(CGFloat)a4 renderEncoder:(CGFloat)a5 outNewClipRect:(CGFloat)a6
{
  id v21;
  BOOL IsNull;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL v27;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v21 = a2;
  if (a1)
  {
    v32.origin.x = a8;
    v32.origin.y = a9;
    v32.size.width = a10;
    v32.size.height = a11;
    IsNull = CGRectIsNull(v32);
    v33.origin.x = a4;
    v33.origin.y = a5;
    v33.size.width = a6;
    v33.size.height = a7;
    v34 = CGRectIntegral(v33);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    if (!IsNull)
    {
      v38.origin.x = a8;
      v38.origin.y = a9;
      v38.size.width = a10;
      v38.size.height = a11;
      v35 = CGRectIntersection(v34, v38);
      x = v35.origin.x;
      y = v35.origin.y;
      width = v35.size.width;
      height = v35.size.height;
    }
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    if (CGRectIsNull(v36))
    {
      a1 = 0;
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      if ((_QWORD)v31)
        v27 = *((_QWORD *)&v31 + 1) == 0;
      else
        v27 = 1;
      a1 = !v27;
      if (!v27)
      {
        if (a3)
        {
          *a3 = x;
          a3[1] = y;
          a3[2] = width;
          a3[3] = height;
        }
        v29[0] = v30;
        v29[1] = v31;
        objc_msgSend(v21, "setScissorRect:", v29);
      }
    }
  }

  return a1;
}

- (void)renderPaperTransform:(float64x2_t *)a3 paperTransform:(int)a4 flipped:(void *)a5 multiply:(double)a6 renderEncoder:
{
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  uint64_t v36;
  float64x2_t v37[3];
  float64x2_t v38[3];
  _OWORD v39[3];
  CGAffineTransform v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  _OWORD v45[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  float v49;

  v11 = a5;
  -[PKMetalRenderState pushDebugGroup:](*(_QWORD *)(a1 + 8), CFSTR("renderPaperTransform"));
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
    v13 = -[PKMetalRenderState pipelineConfig](v12);
  else
    v13 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
  v14 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)&v48.a = 6;
  memset(&v48.b, 0, 24);
  LODWORD(v48.tx) = v13;
  HIDWORD(v48.tx) = WORD2(v13);
  -[PKMetalResourceHandler namedShaderForKey:](v14, (__int128 *)&v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a6;
  v49 = v16;
  objc_msgSend(v11, "setFragmentBytes:length:atIndex:", &v49, 4, 0);
  v17 = *(void **)(a1 + 448);
  v18 = v17;
  if (!v17)
  {
    -[PKMetalResourceHandler paperTexture](*(_QWORD *)(a1 + 192));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "setFragmentTexture:atIndex:", v18, 2);
  if (!v17)

  if (a4)
  {
    v19 = a2[1];
    *(_OWORD *)&t1.a = *a2;
    *(_OWORD *)&t1.c = v19;
    *(_OWORD *)&t1.tx = a2[2];
    t2.a = 1.0;
    t2.b = 0.0;
    t2.c = 0.0;
    t2.d = -1.0;
    t2.tx = 0.0;
    t2.ty = 0.0;
    CGAffineTransformConcat(&v48, &t1, &t2);
    v20 = *(_OWORD *)&v48.c;
    *a2 = *(_OWORD *)&v48.a;
    a2[1] = v20;
    a2[2] = *(_OWORD *)&v48.tx;
  }
  v21 = a2[1];
  v45[0] = *a2;
  v45[1] = v21;
  v45[2] = a2[2];
  v41 = 0x3FE0000000000000uLL;
  __asm { FMOV            V0.2D, #0.5 }
  v43 = _Q0;
  v42 = 0;
  v44 = 0x3FE0000000000000;
  DKDTransformFromTransformSpace(v45, &v41, &v48);
  v27 = *(_OWORD *)&v48.c;
  *a2 = *(_OWORD *)&v48.a;
  a2[1] = v27;
  a2[2] = *(_OWORD *)&v48.tx;
  v28 = a2[1];
  *(_OWORD *)&v40.a = *a2;
  *(_OWORD *)&v40.c = v28;
  *(_OWORD *)&v40.tx = a2[2];
  CGAffineTransformInvert(&v48, &v40);
  v29 = *(_OWORD *)&v48.tx;
  v30 = *(_OWORD *)&v48.a;
  a2[1] = *(_OWORD *)&v48.c;
  a2[2] = v29;
  *a2 = v30;
  v31 = a2[1];
  v39[0] = *a2;
  v39[1] = v31;
  v39[2] = a2[2];
  v32 = a3[2];
  v33 = *a3;
  v38[1] = a3[1];
  v38[2] = v32;
  v38[0] = v33;
  v34 = *(float64x2_t *)MEMORY[0x1E0C9BAA8];
  v35 = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 32);
  v37[1] = *(float64x2_t *)(MEMORY[0x1E0C9BAA8] + 16);
  v37[2] = v35;
  v37[0] = v34;
  -[PKMetalRenderer setupUberVertexShaderWithTransform:paperTransform:texCoordTransform:renderEncoder:]((_anonymous_namespace_ *)v39, v38, v37, v11);
  -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v15, v11);
  v36 = *(_QWORD *)(a1 + 8);
  if (v36)
    objc_msgSend(*(id *)(v36 + 80), "popDebugGroup");

}

- (double)alphaForStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  CGColor *v7;
  uint64_t v8;
  double *v9;
  double v10;

  v3 = a2;
  objc_msgSend(v3, "ink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "color");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (CGColor *)objc_msgSend(v6, "CGColor");

    v8 = *(_QWORD *)(a1 + 8);
    if (v8 && *(_BYTE *)(v8 + 38) && *(_QWORD *)(a1 + 960))
      v7 = *(CGColor **)(a1 + 960);
    objc_msgSend(v5, "behavior");
    v9 = (double *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKInkBehavior alphaForStrokeColor:](v9, v7);

  }
  else
  {
    v10 = 1.0;
  }

  return v10;
}

- (double)antialiasingThresholdForStroke:(uint64_t)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;

  v2 = *(double *)(a1 + 272);
  v3 = *(double *)(a1 + 280);
  if (a2)
  {
    objc_msgSend(a2, "transform");
    v5 = v7;
    v4 = v8;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  return 1.0 / (sqrt(v3 * v3 + v2 * v2) * sqrt(v4 * v4 + v5 * v5));
}

- (uint64_t)renderStrokeRenderCacheBuffers:(void *)a3 renderEncoder:(_anonymous_namespace_:(int)a5 :AnimatingStroke *)a4 animatingStroke:indexed:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  id obj;
  CGAffineTransform v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v7;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v15 = v13[2];
        else
          v15 = 0;
        objc_msgSend(v8, "setVertexBuffer:offset:atIndex:", v14, v15, 0);

        if (v13)
          v16 = v13[3];
        else
          v16 = 0;
        if (a5)
        {
          v29 = 0;
          -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(a1 + 192), v16, &v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 6 * (v16 >> 2), v29, v17, 0);

        }
        else
        {
          objc_msgSend(v8, "drawPrimitives:vertexStart:vertexCount:", 4, 0, v16);
        }
        if (*((_BYTE *)a4 + 320))
        {
          if (v13)
          {
            v18 = v13[5];
            v19 = v13[6];
            v20 = v13[7];
            v21 = v13[8];
          }
          else
          {
            v19 = 0;
            v20 = 0;
            v21 = 0;
            v18 = 0;
          }
          v22 = *(_OWORD *)(a1 + 288);
          *(_OWORD *)&v28.a = *(_OWORD *)(a1 + 272);
          *(_OWORD *)&v28.c = v22;
          *(_OWORD *)&v28.tx = *(_OWORD *)(a1 + 304);
        }
        v9 += v16;
        ++v12;
      }
      while (v10 != v12);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v10 = v23;
    }
    while (v23);
  }

  return v9;
}

- (uint64_t)renderStrokeRenderCache:(void *)a3 renderEncoder:(uint64_t)a4 animatingStroke:(int)a5 indexed:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  CGAffineTransform v22;
  CGRect v23;

  v9 = x1_0;
  v10 = a3;
  if (*(_BYTE *)(a4 + 284))
    goto LABEL_5;
  objc_msgSend(*(id *)(a4 + 80), "ink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderingDescriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v14 != 1)
  {
LABEL_5:
      && !*(_BYTE *)(a4 + 284))
    {
      -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:]((uint64_t)a1, v10, a4);
    }
    else
    {
      -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:]((uint64_t)a1, v10, a4, 1.0);
    }
    v15 = 0;
  }
  else
  {
    -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:]((uint64_t)a1, v10, a4, 0);
    v15 = 1;
  }
  objc_msgSend(v9, "buffers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:]((uint64_t)a1, v16, v10, (_anonymous_namespace_::AnimatingStroke *)a4, a5);

  if (v15)
  {
    objc_msgSend(v9, "secondaryBuffers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:]((uint64_t)a1, v10, a4, 1);
      objc_msgSend(v9, "secondaryBuffers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 += -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:]((uint64_t)a1, v19, v10, (_anonymous_namespace_::AnimatingStroke *)a4, a5);

    }
  }
  if (!*(_BYTE *)(a4 + 336))
  {
    objc_msgSend(*(id *)(a4 + 80), "_bounds");
    v20 = a1[18];
    *(_OWORD *)&v22.a = a1[17];
    *(_OWORD *)&v22.c = v20;
    *(_OWORD *)&v22.tx = a1[19];
  }

  return v17;
}

- (void)setupRenderEncoder:(uint64_t)a3 forParticleStroke:(int)a4 secondaryParticles:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  const CGAffineTransform *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  void *v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v50[2];
  __int128 v51;
  __int128 v52;
  int v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a3 + 80), "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    objc_msgSend(v9, "secondaryParticleDescriptor");
  else
    objc_msgSend(v9, "particleDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(a3 + 73) = a4;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.ink.marker"));

  if (v12)
  {
    v13 = *(unsigned __int8 *)(a3 + 73);
    if (!*(_BYTE *)(a3 + 74))
    {
      if (*(_BYTE *)(a3 + 72))
      {
        if (*(_BYTE *)(a3 + 73))
          v13 = 5;
        else
          v13 = 2;
      }
      else if (*(_BYTE *)(a3 + 73))
      {
        v13 = 4;
      }
      else
      {
        v13 = 1;
      }
    }
    v16 = *(_QWORD *)(a1 + 8);
    if (v16)
      v17 = -[PKMetalRenderState pipelineConfig](v16);
    else
      v17 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
    v18 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)&v50[0] = 5;
    memset((char *)v50 + 12, 0, 20);
    DWORD2(v50[0]) = v13;
  }
  else
  {
    objc_msgSend(v10, "maskTextureName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(unsigned __int8 *)(a3 + 73);
    if (v14)
    {
      if (!*(_BYTE *)(a3 + 74))
      {
        if (*(_BYTE *)(a3 + 72))
        {
          if (*(_BYTE *)(a3 + 73))
            v15 = 5;
          else
            v15 = 2;
        }
        else if (*(_BYTE *)(a3 + 73))
        {
          v15 = 4;
        }
        else
        {
          v15 = 1;
        }
      }
      v19 = objc_msgSend(v10, "particleBlendMode");
      v20 = *(_QWORD *)(a1 + 8);
      if (v20)
        v17 = -[PKMetalRenderState pipelineConfig](v20);
      else
        v17 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
      v18 = *(_QWORD *)(a1 + 192);
      v21 = v19 == 1;
      v22 = 4;
    }
    else
    {
      if (!*(_BYTE *)(a3 + 74))
      {
        if (*(_BYTE *)(a3 + 72))
        {
          if (*(_BYTE *)(a3 + 73))
            v15 = 5;
          else
            v15 = 2;
        }
        else if (*(_BYTE *)(a3 + 73))
        {
          v15 = 4;
        }
        else
        {
          v15 = 1;
        }
      }
      v23 = objc_msgSend(v10, "particleBlendMode");
      v24 = *(_QWORD *)(a1 + 8);
      if (v24)
        v17 = -[PKMetalRenderState pipelineConfig](v24);
      else
        v17 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
      v18 = *(_QWORD *)(a1 + 192);
      v21 = v23 == 1;
      v22 = 3;
    }
    *(_QWORD *)&v50[0] = v22;
    *(_QWORD *)((char *)v50 + 12) = 0;
    DWORD2(v50[0]) = v15;
    DWORD1(v50[1]) = 0;
    *((_QWORD *)&v50[1] + 1) = v21;
  }
  LODWORD(v51) = v17;
  DWORD1(v51) = WORD2(v17);
  -[PKMetalResourceHandler namedShaderForKey:](v18, v50);
  v25 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  memset(v50, 0, sizeof(v50));
  v26 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v46.a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v46.c = v26;
  *(_OWORD *)&v46.tx = *(_OWORD *)(a3 + 144);
  memset(&v47, 0, sizeof(v47));
  *(double *)&v26 = -2.0 / *(double *)(a1 + 232);
  v45.a = 2.0 / *(double *)(a1 + 224);
  v45.b = 0.0;
  v45.c = 0.0;
  *(_QWORD *)&v45.d = v26;
  *(_OWORD *)&v45.tx = xmmword_1BE4F9580;
  v27 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.c = v27;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.a = *(unint64_t *)&v45.a;
  *(_OWORD *)&t2.c = *(_OWORD *)&v45.c;
  *(_OWORD *)&t2.tx = xmmword_1BE4F9580;
  CGAffineTransformConcat(&v45, &t1, &t2);
  CGAffineTransformConcat(&v47, &v46, &v45);
  v50[0] = v29;
  v50[1] = v30;
  v51 = v31;
  v52 = v32;
  *(float *)&v29 = *(double *)(a3 + 304);
  v53 = v29;
  objc_msgSend(v10, "maskDepth");
  *(float *)&v33 = v33;
  v54 = LODWORD(v33);
  objc_msgSend(v7, "setVertexBytes:length:atIndex:", v50, 80, 1);
  if (v25)
    v34 = (void *)v25[3];
  else
    v34 = 0;
  v35 = v34;
  objc_msgSend(v7, "setRenderPipelineState:", v35);

  v36 = *(_QWORD *)(a1 + 192);
  objc_msgSend(v10, "textureName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMetalResourceHandler inkTextureNamed:image:](v36, v37, objc_msgSend(v10, "textureImage"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v7, "setFragmentTexture:atIndex:", v38, 0);
  }
  else
  {
    v39 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(t1.a) = 0;
      _os_log_error_impl(&dword_1BE213000, v39, OS_LOG_TYPE_ERROR, "Failed to load ink texture.", (uint8_t *)&t1, 2u);
    }

  }
  objc_msgSend(v10, "maskTextureName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;

  if (!v41)
  {
    v42 = *(_QWORD *)(a1 + 192);
    objc_msgSend(v10, "maskTextureName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalResourceHandler inkTextureNamed:image:](v42, v43, objc_msgSend(v10, "maskTextureImage"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      objc_msgSend(v7, "setFragmentTexture:atIndex:", v44, 1);

  }
}

- (void)setupRenderEncoder:(uint64_t)a1 forSDFPenStroke:(void *)a2 alphaFactor:(uint64_t)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  const CGAffineTransform *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  float v26;
  void *v27;
  float d;
  void *v29;
  void *v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  float v39;
  float v40;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = a2;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = *(unsigned __int8 *)(a3 + 73);
  if (!*(_BYTE *)(a3 + 74))
  {
    if (*(_BYTE *)(a3 + 73))
      v7 = 4;
    else
      v7 = 1;
    if (*(_BYTE *)(a3 + 73))
      v8 = 5;
    else
      v8 = 2;
    if (*(_BYTE *)(a3 + 72))
      v6 = v8;
    else
      v6 = v7;
  }
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
    v10 = -[PKMetalRenderState pipelineConfig](v9);
  else
    v10 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
  v11 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)&t1.a = 14;
  memset((char *)&t1.b + 4, 0, 20);
  LODWORD(t1.b) = v6;
  LODWORD(t1.tx) = v10;
  HIDWORD(t1.tx) = WORD2(v10);
  -[PKMetalResourceHandler namedShaderForKey:](v11, (__int128 *)&t1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = *(void **)(v12 + 24);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v5, "setRenderPipelineState:", v15);

  v16 = *(id *)(a3 + 80);
  v17 = -[PKMetalRenderer alphaForStroke:](a1, v16);
  if (v17 >= 0.97)
    v18 = 1.0;
  else
    v18 = v17;
  if (*(_BYTE *)(a3 + 337))
    v18 = v18 * *(double *)(a1 + 1000);
  v19 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v32.a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v32.c = v19;
  *(_OWORD *)&v32.tx = *(_OWORD *)(a3 + 144);
  memset(&v33, 0, sizeof(v33));
  *(double *)&v19 = -2.0 / *(double *)(a1 + 232);
  v31.a = 2.0 / *(double *)(a1 + 224);
  v31.b = 0.0;
  v31.c = 0.0;
  *(_QWORD *)&v31.d = v19;
  *(_OWORD *)&v31.tx = xmmword_1BE4F9580;
  v20 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.c = v20;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.a = *(unint64_t *)&v31.a;
  *(_OWORD *)&t2.c = *(_OWORD *)&v31.c;
  *(_OWORD *)&t2.tx = xmmword_1BE4F9580;
  CGAffineTransformConcat(&v31, &t1, &t2);
  CGAffineTransformConcat(&v33, &v32, &v31);
  v34 = v22;
  v35 = v23;
  v36 = v24;
  v37 = v25;
  *(float *)&v22 = v18 * *(double *)(a3 + 304);
  v38 = v22;
  v26 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a3 + 80));
  v40 = v26;
  v27 = *(void **)(a3 + 80);
  if (v27)
  {
    objc_msgSend(v27, "_inkTransform");
    d = t1.d;
  }
  else
  {
    d = 0.0;
  }
  v39 = d;
  objc_msgSend(v5, "setVertexBytes:length:atIndex:", &v34, 80, 1);
  objc_msgSend(v5, "setFragmentBytes:length:atIndex:", &v34, 80, 0);
  -[PKMetalResourceHandler sdfPenMaxHeightLookupTexture](*(_QWORD *)(a1 + 192));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFragmentTexture:atIndex:", v29, 0);

  -[PKMetalResourceHandler sdfPenEllipseLookupTexture](*(_QWORD *)(a1 + 192));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFragmentTexture:atIndex:", v30, 1);

}

- (void)setupRenderEncoder:(uint64_t)a3 forPenStroke:(double)a4 alphaFactor:
{
  id v7;
  uint64_t v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  const CGAffineTransform *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  float v46;
  int64x2_t v47;
  void *v48;
  float32x2_t v49;
  double v50;
  double v51;
  double v52;
  double *v53;
  float v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  int v62;
  float v63;
  float v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v7 = a2;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  if (*(_BYTE *)(a3 + 284))
  {
    v8 = *(_QWORD *)(a1 + 192);
    t1.tx = COERCE_DOUBLE(1);
    *(_QWORD *)&t1.a = 10;
    memset(&t1.b, 0, 24);
    -[PKMetalResourceHandler namedShaderForKey:](v8, (__int128 *)&t1);
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKMetalShader msaaPipelineStateWithSampleCount:](v9, *(_QWORD *)(a1 + 704));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRenderPipelineState:", v10);
  }
  else
  {
    objc_msgSend(*(id *)(a3 + 80), "ink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "renderingDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "alternateMode");

    if (v14 == 1)
    {
      v15 = *(unsigned __int8 *)(a3 + 73);
      if (!*(_BYTE *)(a3 + 74))
      {
        if (*(_BYTE *)(a3 + 72))
        {
          if (*(_BYTE *)(a3 + 73))
            v15 = 5;
          else
            v15 = 2;
        }
        else if (*(_BYTE *)(a3 + 73))
        {
          v15 = 4;
        }
        else
        {
          v15 = 1;
        }
      }
      v21 = *(_QWORD *)(a1 + 8);
      if (v21)
        v22 = -[PKMetalRenderState pipelineConfig](v21);
      else
        v22 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
      v23 = *(_QWORD *)(a1 + 192);
      *(_QWORD *)&t1.a = 15;
      memset((char *)&t1.b + 4, 0, 20);
      LODWORD(t1.b) = v15;
      LODWORD(t1.tx) = v22;
      HIDWORD(t1.tx) = WORD2(v22);
      -[PKMetalResourceHandler namedShaderForKey:](v23, (__int128 *)&t1);
      v24 = objc_claimAutoreleasedReturnValue();
      v9 = (id *)v24;
      if (v24)
        v25 = *(void **)(v24 + 24);
      else
        v25 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a3 + 80), "ink");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "behavior");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "renderingDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "alternateMode");

      v20 = *(unsigned __int8 *)(a3 + 73);
      if (v19 == 2)
      {
        if (!*(_BYTE *)(a3 + 74))
        {
          if (*(_BYTE *)(a3 + 72))
          {
            if (*(_BYTE *)(a3 + 73))
              v20 = 5;
            else
              v20 = 2;
          }
          else if (*(_BYTE *)(a3 + 73))
          {
            v20 = 4;
          }
          else
          {
            v20 = 1;
          }
        }
        v26 = *(_QWORD *)(a1 + 8);
        if (v26)
          v27 = -[PKMetalRenderState pipelineConfig](v26);
        else
          v27 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
        v28 = *(_QWORD *)(a1 + 192);
        *(_QWORD *)&t1.a = 16;
        memset((char *)&t1.b + 4, 0, 20);
        LODWORD(t1.b) = v20;
        LODWORD(t1.tx) = v27;
        HIDWORD(t1.tx) = WORD2(v27);
        -[PKMetalResourceHandler namedShaderForKey:](v28, (__int128 *)&t1);
        v29 = objc_claimAutoreleasedReturnValue();
        v9 = (id *)v29;
        if (v29)
          v25 = *(void **)(v29 + 24);
        else
          v25 = 0;
      }
      else
      {
        if (!*(_BYTE *)(a3 + 74))
        {
          if (*(_BYTE *)(a3 + 72))
          {
            if (*(_BYTE *)(a3 + 73))
              v20 = 5;
            else
              v20 = 2;
          }
          else if (*(_BYTE *)(a3 + 73))
          {
            v20 = 4;
          }
          else
          {
            v20 = 1;
          }
        }
        v30 = *(unsigned __int8 *)(a1 + 932);
        v31 = *(_QWORD *)(a1 + 8);
        if (v31)
          v32 = -[PKMetalRenderState pipelineConfig](v31);
        else
          v32 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
        v33 = *(_QWORD *)(a1 + 192);
        v34 = 1;
        if (v30)
          v34 = 2;
        *(_QWORD *)&t1.a = v34;
        memset((char *)&t1.b + 4, 0, 20);
        LODWORD(t1.b) = v20;
        LODWORD(t1.tx) = v32;
        HIDWORD(t1.tx) = WORD2(v32);
        -[PKMetalResourceHandler namedShaderForKey:](v33, (__int128 *)&t1);
        v35 = objc_claimAutoreleasedReturnValue();
        v9 = (id *)v35;
        if (v35)
          v25 = *(void **)(v35 + 24);
        else
          v25 = 0;
      }
    }
    v10 = v25;
    objc_msgSend(v7, "setRenderPipelineState:", v10);
  }

  v36 = *(id *)(a3 + 80);
  v37 = -[PKMetalRenderer alphaForStroke:](a1, v36);
  if (v37 >= 0.97)
    v38 = 1.0;
  else
    v38 = v37;
  if (*(_BYTE *)(a3 + 337))
    v38 = v38 * *(double *)(a1 + 1000);
  v39 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)&v56.a = *(_OWORD *)(a3 + 112);
  *(_OWORD *)&v56.c = v39;
  *(_OWORD *)&v56.tx = *(_OWORD *)(a3 + 144);
  memset(&v57, 0, sizeof(v57));
  *(double *)&v39 = -2.0 / *(double *)(a1 + 232);
  v55.a = 2.0 / *(double *)(a1 + 224);
  v55.b = 0.0;
  v55.c = 0.0;
  *(_QWORD *)&v55.d = v39;
  *(_OWORD *)&v55.tx = xmmword_1BE4F9580;
  v40 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&t1.c = v40;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 304);
  *(_OWORD *)&t2.a = *(unint64_t *)&v55.a;
  *(_OWORD *)&t2.c = *(_OWORD *)&v55.c;
  *(_OWORD *)&t2.tx = xmmword_1BE4F9580;
  CGAffineTransformConcat(&v55, &t1, &t2);
  CGAffineTransformConcat(&v57, &v56, &v55);
  v58 = v42;
  v59 = v43;
  v60 = v44;
  v61 = v45;
  *(float *)&v42 = v38 * a4 * *(double *)(a3 + 304);
  v62 = v42;
  v46 = -[PKMetalRenderer antialiasingThresholdForStroke:](a1, *(void **)(a3 + 80));
  v63 = v46;
  v47 = 0uLL;
  memset(&t1, 0, sizeof(t1));
  v48 = *(void **)(a3 + 80);
  if (v48)
  {
    objc_msgSend(v48, "_inkTransform");
    v49 = vcvt_f32_f64(*(float64x2_t *)&t1.a);
    v47 = (int64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&t1.c), *(float64x2_t *)&t1.tx);
  }
  else
  {
    v49 = 0;
  }
  DWORD2(v65) = 0;
  *(float32x2_t *)&v65 = v49;
  DWORD2(v66) = 0;
  *(_QWORD *)&v66 = v47.i64[0];
  DWORD2(v67) = 1065353216;
  *(_QWORD *)&v67 = vdupq_laneq_s64(v47, 1).u64[0];
  v64 = 0.0;
  if (*(_BYTE *)(a1 + 931))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v51 = v50;
    if (objc_msgSend(*(id *)(a3 + 80), "_pointsCount"))
    {
      objc_msgSend(*(id *)(a3 + 80), "timestamp");
    }
    else
    {
      v53 = *(double **)(*(_QWORD *)(a3 + 96) + 80);
      if (*(double **)(*(_QWORD *)(a3 + 96) + 88) == v53)
        v52 = 0.0;
      else
        v52 = *v53;
    }
    v54 = v51 - v52;
    v64 = v54;
  }
  objc_msgSend(v7, "setVertexBytes:length:atIndex:", &v58, 128, 1);
  objc_msgSend(v7, "setFragmentBytes:length:atIndex:", &v58, 128, 0);

}

- (uint64_t)renderParticleRenderCache:(void *)a3 renderEncoder:(void *)a4 computeEncoder:(id *)a5 animatingStroke:(int)a6 secondaryParticles:
{
  id *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  id *v42;
  void *v43;
  id obj;
  uint64_t v45;
  id *v46;
  void *v48;
  id v49;
  CGAffineTransform v50;
  uint64_t v51;
  unint64_t v52;
  int64x2_t v53;
  unint64_t v54;
  int64x2_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = x1_0;
  v49 = a3;
  v11 = a4;
  v42 = v10;
  objc_msgSend(a5[10], "ink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "version");

  objc_msgSend(a5[10], "ink");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    objc_msgSend(v15, "secondaryParticleDescriptor");
  else
    objc_msgSend(v15, "particleDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v16;
  objc_msgSend(v16, "maskTextureName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 != 0;

  -[PKMetalResourceHandler particleShaderKernelPipelineStateWithVariableSpacing:particleMasks:](*(void **)(a1 + 192), v13 > 2, v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setComputePipelineState:");
  if (a6)
    -[PKMetalParticleRenderCache secondaryBuffers](v10);
  else
    -[PKMetalSDFPenRenderCache buffers](v10);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  v46 = a5;
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v45 = *(_QWORD *)v58;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v58 != v45)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD **)(*((_QWORD *)&v57 + 1) + 8 * v22);
        v56 = 0;
        if (v23)
          v24 = v23[5];
        else
          v24 = 0;
        v25 = *(_QWORD **)(a1 + 8);
        if (v25)
          v25 = (_QWORD *)v25[7];
        v26 = *(_QWORD *)(a1 + 192);
        v27 = v25;
        v28 = -[PKMetalResourceHandler newGPUBufferWithLength:outOffset:commandBuffer:](v26, 20 * v24, (uint64_t)&v56, v27);

        v29 = objc_msgSend(v48, "threadExecutionWidth");
        if (v23)
          v30 = v23[7];
        else
          v30 = 0;
        objc_msgSend(v11, "setComputePipelineState:", v48);
        -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          v32 = v23[3];
        else
          v32 = 0;
        objc_msgSend(v11, "setBuffer:offset:atIndex:", v31, v32, 0);

        -[PKMetalSDFPenRenderCacheBuffer strokePointBuffer](v23);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          v34 = v23[4];
        else
          v34 = 0;
        objc_msgSend(v11, "setBuffer:offset:atIndex:", v33, v34, 1);

        objc_msgSend(v11, "setBuffer:offset:atIndex:", v28, v56, 2);
        objc_msgSend(v11, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 696), 0, 3);
        v54 = vcvtpd_u64_f64((double)v30 / (double)v29);
        v55 = vdupq_n_s64(1uLL);
        v52 = v29;
        v53 = v55;
        objc_msgSend(v11, "dispatchThreadgroups:threadsPerThreadgroup:", &v54, &v52);
        -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v49, (uint64_t)v46, a6);
        objc_msgSend(v49, "setVertexBuffer:offset:atIndex:", v28, v56, 0);
        if (v23)
        {
          v35 = v23[5];
          v36 = ((3 * v35) >> 1) & 0x3FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v36 = 0;
          v35 = 0;
        }
        v51 = 0;
        -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(a1 + 192), v35, &v51);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, v36, v51, v37, 0);
        if (v23)
          v38 = v23[5];
        else
          v38 = 0;

        v21 += v38;
        ++v22;
      }
      while (v20 != v22);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      v20 = v39;
    }
    while (v39);
  }
  else
  {
    v21 = 0;
  }

  objc_msgSend(v46[10], "_bounds");
  v40 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)&v50.a = *(_OWORD *)(a1 + 272);
  *(_OWORD *)&v50.c = v40;
  *(_OWORD *)&v50.tx = *(_OWORD *)(a1 + 304);

  return v21;
}

- (uint64_t)renderSDFPenStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  double v16;
  char **v17;
  char **v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  float64x2_t v22;
  double v23;
  long double v24;
  double v25;
  double v27;
  long double v28;
  double v29;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  float64x2_t v47;
  float64x2_t v52;
  float64x2_t v53;
  float64_t v54;
  float64_t v55;
  float32x2_t v56;
  uint64_t v66;
  char *v68;
  float64x2_t v69;
  float v70;
  uint64_t v71;
  unsigned int v72;
  float32x2_t *v74;
  float v75;
  char *v76;
  uint64_t v77;
  _BYTE v79[32];
  _OWORD *v80;
  float64x2_t v81;
  float64x2_t v82;
  uint64_t v83;
  float64x2_t v84;
  CGRect v85;

  v9 = a5;
  if (*(_BYTE *)(a4 + 336)
    && (objc_msgSend(*(id *)(a4 + 344), "buffers"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    v12 = 1;
    v13 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:](a1, *(void **)(a4 + 344), v9, a4, 1);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = *(_QWORD *)(a4 + 328);
  if (v14 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((a3 - a2) >> 3)) >= 2)
  {
    if (v9)
      v15 = v12;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
      -[PKMetalRenderer setupRenderEncoder:forSDFPenStroke:alphaFactor:]((uint64_t)a1, v9, a4);
    v16 = -[PKMetalRenderer antialiasingThresholdForStroke:]((uint64_t)a1, *(void **)(a4 + 80));
    v17 = *(char ***)(a4 + 48);
    v18 = v17;
    if (!v17)
      v18 = *(char ***)(a4 + 32);
    if (v18[1] == *v18)
    {
      std::vector<PKMetalSDFStrokeVertex>::resize(v18);
      v17 = *(char ***)(a4 + 48);
    }
    v80 = a1;
    if (!v17)
      v17 = *(char ***)(a4 + 32);
    v19 = *v18;
    *(_QWORD *)&v79[16] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_QWORD *)&v79[24] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
    *(_QWORD *)v79 = *MEMORY[0x1E0C9D628];
    *(_QWORD *)&v79[8] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    if (a3 != a2)
    {
      v20 = a2 + 88;
      if (a2 + 88 != a3)
      {
        v21 = 0x8E38E38E38E38E39 * ((v17[1] - *v17) >> 2);
        do
        {
          v22 = vsubq_f64(*(float64x2_t *)(v20 + 8), *(float64x2_t *)(v20 - 80));
          v23 = sqrt(vmlad_n_f64(COERCE_DOUBLE(*(_QWORD *)&vmulq_f64(v22, v22).f64[1]), v22.f64[0], v22.f64[0]));
          if (v23 >= 0.00000011920929)
          {
            v81 = v22;
            v82 = *(float64x2_t *)(v20 - 80);
            *(double *)&v83 = v23;
            v84 = *(float64x2_t *)(v20 + 8);
            v24 = *(double *)(v20 - 32);
            v25 = fmod(v24, 6.28318531);
            if (v24 <= 6.28318531 && v24 >= 0.0)
              v25 = v24;
            if (v25 < 0.0)
              v25 = v25 + 6.28318531;
            if (v25 == 0.0)
              v27 = 0.0;
            else
              v27 = v25;
            v28 = *(double *)(v20 + 56);
            v29 = fmod(v28, 6.28318531);
            if (v28 <= 6.28318531 && v28 >= 0.0)
              v29 = v28;
            if (v29 < 0.0)
              v29 = v29 + 6.28318531;
            if (v29 == 0.0)
              v31 = 0.0;
            else
              v31 = v29;
            v32 = *(double *)(v20 - 64);
            v33 = *(double *)(v20 + 24);
            if (v14 + 12 >= v21)
            {
              v34 = *(void **)(a4 + 88);
              if (v34)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:]((float *)v19, v14, 36);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)v80, v34, (uint64_t)v19, v14, (void *)0x24, 0, 0, v35, v36, v37, v38);
              }
              else if (v9)
              {
                v39 = *(void **)(a4 + 344);
                if (v39)
                {
                  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:]((float *)v19, v14, 36);
                  -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)v80, v39, (uint64_t)v19, v14, (void *)0x24, 0, v9, v40, v41, v42, v43);
                }
                else
                {
                  -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)v80, (uint64_t)v19, v14, 36, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, v9);
                }
                v85.origin.x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a4, v14);
                v85.origin.y = v44;
                v85.size.width = v45;
                v85.size.height = v46;
                *(CGRect *)v79 = CGRectUnion(*(CGRect *)v79, v85);
              }
              v13 += v14;
              *(_QWORD *)(a4 + 328) = 0;
              v14 = 0;
            }
            v47 = vdivq_f64(v81, (float64x2_t)vdupq_lane_s64(v83, 0));
            _S2 = v27;
            _S16 = v31;
            _D4 = v16 + v32 + -2.0;
            _D3 = v16 + v33 + -2.0;
            *(_QWORD *)&v52.f64[0] = vdupq_laneq_s64((int64x2_t)v47, 1).u64[0];
            v52.f64[1] = -v47.f64[0];
            v53 = vsubq_f64(v52, v47);
            v47.f64[0] = vaddvq_f64(v47);
            v54 = v82.f64[0] - v47.f64[0] * _D4;
            v55 = v84.f64[0] + v47.f64[0] * _D3;
            *(float32x2_t *)&v52.f64[0] = vcvt_f32_f64(v82);
            v56 = vcvt_f32_f64(v84);
            __asm
            {
              FCVT            H6, D4
              FCVT            H1, D3
              FCVT            H7, S2
              FCVT            H2, S16
            }
            _D16 = *(_QWORD *)(v20 - 8);
            __asm { FCVT            H16, D16 }
            _D23 = *(_QWORD *)(v20 + 80);
            *(float *)&v66 = v82.f64[0] + _D4 * v53.f64[0];
            _S19 = v82.f64[1] + vmuld_lane_f64(_D4, v53, 1);
            *((float *)&v66 + 1) = _S19;
            __asm { FCVT            H19, D23 }
            v68 = &v19[36 * v14];
            *(_QWORD *)v68 = v66;
            *((_QWORD *)v68 + 1) = *(_QWORD *)&v52.f64[0];
            *((float32x2_t *)v68 + 2) = v56;
            *((_WORD *)v68 + 12) = _H6;
            *((_WORD *)v68 + 13) = _H1;
            *((_WORD *)v68 + 14) = _H7;
            *((_WORD *)v68 + 15) = _H2;
            *((_WORD *)v68 + 16) = _D16;
            *((_WORD *)v68 + 17) = LOWORD(_S19);
            *(float *)&v66 = v54;
            *(float *)&v54 = v82.f64[1] - _D4 * v53.f64[0];
            HIDWORD(v66) = LODWORD(v54);
            *(_QWORD *)(v68 + 36) = v66;
            *(float64_t *)(v68 + 44) = v52.f64[0];
            *(float32x2_t *)(v68 + 52) = v56;
            *((_WORD *)v68 + 30) = _H6;
            *((_WORD *)v68 + 31) = _H1;
            *((_WORD *)v68 + 32) = _H7;
            *((_WORD *)v68 + 33) = _H2;
            *((_WORD *)v68 + 34) = _D16;
            *((_WORD *)v68 + 35) = LOWORD(_S19);
            *(float *)&v66 = v55;
            *((_QWORD *)v68 + 10) = *(_QWORD *)&v52.f64[0];
            *((float32x2_t *)v68 + 11) = v56;
            *((_WORD *)v68 + 48) = _H6;
            *((_WORD *)v68 + 49) = _H1;
            *((_WORD *)v68 + 50) = _H7;
            *((_WORD *)v68 + 51) = _H2;
            *((_WORD *)v68 + 52) = _D16;
            *((_WORD *)v68 + 53) = LOWORD(_S19);
            v69 = vmulq_n_f64(v53, _D3);
            v70 = v84.f64[1] + v69.f64[0];
            *((float *)&v66 + 1) = v70;
            *((_QWORD *)v68 + 9) = v66;
            *(float32x2_t *)(v68 + 108) = vcvt_f32_f64(vsubq_f64(v84, v69));
            *(float64_t *)(v68 + 116) = v52.f64[0];
            *(float32x2_t *)(v68 + 124) = v56;
            *((_WORD *)v68 + 66) = _H6;
            *((_WORD *)v68 + 67) = _H1;
            *((_WORD *)v68 + 68) = _H7;
            *((_WORD *)v68 + 69) = _H2;
            *((_WORD *)v68 + 70) = _D16;
            *((_WORD *)v68 + 71) = LOWORD(_S19);
            if (v20 + 88 == a3 && (_D4 - _D3) / *(double *)&v83 < 1.0)
            {
              *(float *)&v71 = v84.f64[0] - _D3;
              *(float *)&v72 = v84.f64[1] - _D3;
              _D7 = *(_QWORD *)(v20 + 80);
              v74 = (float32x2_t *)&v19[36 * v14 + 144];
              *v74 = (float32x2_t)__PAIR64__(v72, v71);
              v74[1] = v56;
              v74[2] = v56;
              __asm { FCVT            H7, D7 }
              v74[3].i16[0] = _H1;
              v74[3].i16[1] = -17408;
              v74[3].i16[2] = _H2;
              v74[3].i16[3] = -17408;
              v74[4].i16[0] = _D7;
              v74[4].i16[1] = _D7;
              v75 = v84.f64[1] + _D3;
              *((float *)&v71 + 1) = v75;
              v76 = &v19[36 * v14];
              *(_QWORD *)(v76 + 180) = v71;
              *(float32x2_t *)(v76 + 188) = v56;
              *(float32x2_t *)(v76 + 196) = v56;
              *((_WORD *)v76 + 102) = _H1;
              *((_WORD *)v76 + 103) = -17408;
              *((_WORD *)v76 + 104) = _H2;
              *((_WORD *)v76 + 105) = -17408;
              *((_WORD *)v76 + 106) = _D7;
              *((_WORD *)v76 + 107) = _D7;
              *(float *)&v77 = v84.f64[0] + _D3;
              *((float *)&v77 + 1) = v75;
              *(_QWORD *)(v76 + 252) = v77;
              v76 += 252;
              *(_QWORD *)(v76 - 36) = __PAIR64__(v72, v77);
              *(float32x2_t *)(v76 - 28) = v56;
              *(float32x2_t *)(v76 - 20) = v56;
              *((_WORD *)v76 - 6) = _H1;
              *((_WORD *)v76 - 5) = -17408;
              *((_WORD *)v76 - 4) = _H2;
              *((_WORD *)v76 - 3) = -17408;
              *((_WORD *)v76 - 2) = _D7;
              *((_WORD *)v76 - 1) = _D7;
              v14 += 8;
              *((float32x2_t *)v76 + 1) = v56;
              *((float32x2_t *)v76 + 2) = v56;
              *((_WORD *)v76 + 12) = _H1;
              *((_WORD *)v76 + 13) = -17408;
              *((_WORD *)v76 + 14) = _H2;
              *((_WORD *)v76 + 15) = -17408;
              *((_WORD *)v76 + 16) = _D7;
              *((_WORD *)v76 + 17) = _D7;
            }
            else
            {
              v14 += 4;
            }
          }
          v20 += 88;
        }
        while (v20 != a3);
      }
    }
    v13 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:](v80, (float *)v19, v14, v13, (void *)0x24, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, a4, 0, *(CGFloat *)v79, *(CGFloat *)&v79[8], *(CGFloat *)&v79[16], *(CGFloat *)&v79[24], v9);
  }

  return v13;
}

- (uint64_t)renderPenStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 renderEncoder:(void *)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  double b;
  double a;
  double d;
  double c;
  double ty;
  double tx;
  void *v23;
  double v24;
  double *v25;
  double v26;
  uint64_t v27;
  float *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  int v61;
  double v62;
  double v64;
  double sinval;
  double cosval;
  __double2 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  double v101;
  double v102;
  unint64_t v106;
  float *v107;
  double v108;
  int v113;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  int v129;
  double v130;
  double v131;
  double v132;
  double v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  CGAffineTransform v136;
  unint64_t v137;
  unint64_t v138[3];
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v138[0] = a2;
  v138[1] = a3;
  v9 = a5;
  if (*(_BYTE *)(a4 + 336)
    && (objc_msgSend(*(id *)(a4 + 344), "buffers"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v11))
  {
    v12 = 1;
    v13 = -[PKMetalRenderer renderStrokeRenderCache:renderEncoder:animatingStroke:indexed:](a1, *(void **)(a4 + 344), v9, a4, 1);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = *(_QWORD *)(a4 + 328);
  v137 = v14;
  if (v14 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) >= 2)
  {
    if (v9)
      v15 = v12;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
      -[PKMetalRenderer setupRenderEncoder:forPenStroke:alphaFactor:]((uint64_t)a1, v9, a4, 1.0);
    memset(&v136, 0, sizeof(v136));
    v16 = *(void **)(a4 + 80);
    if (v16)
    {
      objc_msgSend(v16, "_inkTransform");
      b = v136.b;
      a = v136.a;
      d = v136.d;
      c = v136.c;
      ty = v136.ty;
      tx = v136.tx;
      v23 = *(void **)(a4 + 80);
    }
    else
    {
      v23 = 0;
      ty = 0.0;
      tx = 0.0;
      d = 0.0;
      c = 0.0;
      b = 0.0;
      a = 0.0;
    }
    v134 = v136;
    memset(&v135, 0, sizeof(v135));
    CGAffineTransformInvert(&v135, &v134);
    if (objc_msgSend(v23, "_pointsCount"))
    {
      objc_msgSend(*(id *)(a4 + 80), "timestamp");
      v119 = v24;
    }
    else
    {
      v25 = *(double **)(*(_QWORD *)(a4 + 96) + 80);
      if (*(double **)(*(_QWORD *)(a4 + 96) + 88) == v25)
        v26 = 0.0;
      else
        v26 = *v25;
      v119 = v26;
    }
    v27 = *(_QWORD *)(a4 + 16);
    if (!v27)
      v27 = *(_QWORD *)a4;
    v28 = *(float **)v27;
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    x = *MEMORY[0x1E0C9D628];
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    if (a3 != a2)
    {
      v29 = *(_QWORD *)(v27 + 8);
      v36 = (double *)(-[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:]((uint64_t)a1, v138, a4) + 88);
      if (v36 != (double *)a3)
      {
        v126 = ty + d * 0.0 + b;
        v127 = tx + c * 0.0 + a;
        v124 = ty + d + b * 0.0;
        v125 = tx + c + a * 0.0;
        do
        {
          v37 = *(v36 - 10);
          v38 = *(v36 - 9);
          v39 = v36[1];
          v40 = v36[2];
          v41 = v135.tx + v38 * v135.c + v135.a * v37;
          v42 = v135.ty + v38 * v135.d + v135.b * v37;
          v43 = v135.tx + v40 * v135.c + v135.a * v39 - v41;
          v44 = v135.ty + v40 * v135.d + v135.b * v39 - v42;
          v45 = sqrt(v44 * v44 + v43 * v43);
          if (v45 >= 0.00000011920929)
          {
            v120 = v135.ty + v40 * v135.d + v135.b * v39;
            v121 = v135.tx + v40 * v135.c + v135.a * v39;
            v122 = v36[2];
            v123 = v36[1];
            v46 = *(v36 - 8);
            v133 = v36[3];
            v130 = *(v36 - 11);
            v132 = v36[9];
            v47 = v137;
            v128 = *(v36 - 2);
            if (v137 + 12 >= 0xCCCCCCCCCCCCCCCDLL * ((v29 - (uint64_t)v28) >> 2))
            {
              v48 = *(void **)(a4 + 88);
              if (v48)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v28, v137, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v48, (uint64_t)v28, v47, (void *)0x14, 0, 0, v49, v50, v51, v52);
              }
              else if (v9)
              {
                v53 = *(void **)(a4 + 344);
                if (v53)
                {
                  -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v28, v137, 20);
                  -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v53, (uint64_t)v28, v47, (void *)0x14, 0, v9, v54, v55, v56, v57);
                }
                else
                {
                  -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)a1, (uint64_t)v28, v137, 20, ((3 * v137) >> 1) & 0x3FFFFFFFFFFFFFFFLL, v9);
                }
                v141.origin.x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a4, v47);
                v141.origin.y = v58;
                v141.size.width = v59;
                v141.size.height = v60;
                v139.origin.y = y;
                v139.origin.x = x;
                v139.size.height = height;
                v139.size.width = width;
                v140 = CGRectUnion(v139, v141);
                y = v140.origin.y;
                x = v140.origin.x;
                height = v140.size.height;
                width = v140.size.width;
              }
              v13 += v47;
              v137 = 0;
              *(_QWORD *)(a4 + 328) = 0;
            }
            *(float *)&v61 = v128;
            v129 = v61;
            v131 = v130 - v119;
            v62 = (v46 - v133) / v45;
            if (v62 > -1.0 && v62 < 1.0)
            {
              v64 = asin((v46 - v133) / v45) + -1.57079633;
              if (v64 == 0.0)
              {
                sinval = 0.0;
                cosval = 1.0;
              }
              else
              {
                v67 = __sincos_stret(v64);
                cosval = v67.__cosval;
                sinval = v67.__sinval;
              }
              v68 = -(v43 / v45);
              v69 = v44 / v45 * (v44 / v45 * cosval - v43 / v45 * sinval)
                  + v43 / v45 * (v43 / v45 * cosval + v44 / v45 * sinval);
              v70 = v43 / v45 * v69;
              v71 = v44 / v45 * v69;
              v72 = v41 + v46 * v70;
              v73 = v42 + v46 * v71;
              v74 = v44 / v45 * v46;
              v75 = v46 * v68;
              v76 = v74 + v72;
              v77 = v46 * v68 + v73;
              v78 = v72 - v74;
              v79 = v73 - v46 * v68;
              v80 = v121 + v133 * v70;
              v81 = v120 + v133 * v71;
              _D4 = v44 / v45 * v133;
              v83 = v133 * v68;
              v84 = _D4 + v80;
              v85 = v80 - _D4;
              v86 = v81 - v83;
              v87 = v136.tx + v136.c * v77 + v136.a * v76;
              v88 = v136.ty + v136.d * v77 + v136.b * v76;
              v89 = v136.tx + v136.c * v79 + v136.a * v78;
              v90 = v136.ty + v136.d * v79 + v136.b * v78;
              v91 = v136.tx + v136.c * (v83 + v81) + v136.a * v84;
              v92 = v136.ty + v136.d * (v83 + v81) + v136.b * v84;
              v93 = v136.tx + v136.c * (v81 - v83) + v136.a * v85;
              v94 = v136.ty + v136.d * v86 + v136.b * v85;
              _D23 = v43 / v45 * (v46 * v69);
              _D21 = v44 / v45 * (v46 * v69);
              _D24 = _D23 - v74;
              _D25 = _D21 - v75;
              _D16 = v74 + _D23;
              _D17 = v75 + _D21;
              v101 = v133 * v69;
              v102 = v43 / v45 * v101;
              *(float *)&_D21 = v87;
              *(float *)&v88 = v88;
              *(float *)&_D23 = _D24;
              *(float *)&_D24 = _D25;
              *(float *)&_D25 = v46;
              __asm
              {
                FCVT            H23, S23
                FCVT            H24, S24
                FCVT            H25, S25
              }
              v106 = v137;
              v107 = &v28[5 * v137];
              *v107 = *(float *)&_D21;
              v107[1] = *(float *)&v88;
              *((_WORD *)v107 + 4) = LOWORD(_D23);
              *((_WORD *)v107 + 5) = LOWORD(_D24);
              *((_WORD *)v107 + 6) = LOWORD(_D25);
              v108 = v44 / v45 * v101;
              _D6 = v102 - _D4;
              _D18 = v108 - v83;
              _D3 = _D4 + v102;
              *(float *)&_D4 = v131;
              __asm { FCVT            H4, S4 }
              LODWORD(_D21) = v129;
              __asm { FCVT            H21, S21 }
              *((_WORD *)v107 + 7) = LOWORD(_D4);
              *((_WORD *)v107 + 8) = LOWORD(_D21);
              *((_WORD *)v107 + 9) = 0;
              *(float *)&v89 = v89;
              *(float *)&v90 = v90;
              *(float *)&_D16 = _D16;
              *(float *)&_D17 = _D17;
              __asm
              {
                FCVT            H16, S16
                FCVT            H17, S17
              }
              v107[5] = *(float *)&v89;
              v107[6] = *(float *)&v90;
              *((_WORD *)v107 + 14) = LOWORD(_D16);
              *((_WORD *)v107 + 15) = LOWORD(_D17);
              *((_WORD *)v107 + 16) = LOWORD(_D25);
              *((_WORD *)v107 + 17) = LOWORD(_D4);
              *((_WORD *)v107 + 18) = LOWORD(_D21);
              _D0 = v83 + v108;
              *((_WORD *)v107 + 19) = 0;
              *(float *)&v108 = v91;
              *(float *)&v90 = v92;
              *(float *)&_D6 = _D6;
              *(float *)&_D16 = _D18;
              *(float *)&_D17 = v133;
              *(float *)&_D18 = v132;
              __asm
              {
                FCVT            H6, S6
                FCVT            H16, S16
                FCVT            H17, S17
                FCVT            H18, S18
              }
              v107[10] = *(float *)&v108;
              v107[11] = *(float *)&v90;
              *((_WORD *)v107 + 24) = LOWORD(_D6);
              *((_WORD *)v107 + 25) = LOWORD(_D16);
              *((_WORD *)v107 + 26) = LOWORD(_D17);
              *((_WORD *)v107 + 27) = LOWORD(_D4);
              *((_WORD *)v107 + 28) = LOWORD(_D18);
              *((_WORD *)v107 + 29) = 0;
              *(float *)&v93 = v93;
              *(float *)&v108 = v94;
              *(float *)&_D3 = _D3;
              *(float *)&_D0 = _D0;
              __asm { FCVT            H3, S3 }
              v137 = v106 + 4;
              v107[15] = *(float *)&v93;
              v107[16] = *(float *)&v108;
              *((_WORD *)v107 + 34) = LOWORD(_D3);
              __asm { FCVT            H0, S0 }
              *((_WORD *)v107 + 35) = LOWORD(_D0);
              *((_WORD *)v107 + 36) = LOWORD(_D17);
              *((_WORD *)v107 + 37) = LOWORD(_D4);
              *((_WORD *)v107 + 38) = LOWORD(_D18);
              *((_WORD *)v107 + 39) = 0;
            }
            if (v36 + 11 == (double *)a3 && v62 < 1.0)
            {
              *(float *)&v113 = v132;
            }
          }
          v36 += 11;
        }
        while (v36 != (double *)a3);
        v14 = v137;
      }
    }
    v13 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:](a1, v28, v14, v13, (void *)0x14, ((3 * v14) >> 1) & 0x3FFFFFFFFFFFFFFFLL, a4, 0, x, y, width, height, v9);
  }

  return v13;
}

- (uint64_t)renderParticleStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(char)a6 secondaryParticles:(int)a7 renderEncoder:(void *)a8
{
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __int16 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  __int128 v53;
  unint64_t v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  float64x2_t v68;
  float64x2_t v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  float64x2_t v75;
  char v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  float v97;
  double v98;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  float64x2_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  signed int v116;
  double v119;
  double v121;
  double v122;
  double v123;
  double v124;
  double v126;
  double v127;
  double v128;
  float v129;
  float v130;
  float *v140;
  float v141;
  float v142;
  float v146;
  float v147;
  float v150;
  float *v155;
  float v156;
  float v157;
  float v161;
  float v162;
  float v164;
  float v165;
  float v166;
  float v167;
  char v168;
  float *v169;
  double v170;
  BOOL v171;
  double v172;
  double v173;
  float *v174;
  char v175;
  char v176;
  uint64_t v183;
  double v184;
  void *v185;
  unint64_t v186;
  char v187;
  unint64_t v188;
  void *v189;
  unint64_t v190;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  _BYTE v197[32];
  double v198;
  double v199;
  id v200;
  float v201;
  unint64_t v202;
  void *v203;
  double v204;
  uint64_t v205;
  double v206;
  float64x2_t v207;
  float64x2_t v208;
  float64x2_t v209;
  float64x2_t v210;
  double v211;
  double v212;
  long double v213;
  long double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  __int128 v221;
  double v222;
  double v223;
  double v224;
  uint64_t v225;
  double v226;
  __int128 v227;
  __int128 v228;
  char v229;
  float64x2_t v230;
  unint64_t v231;
  int8x16_t v232;
  float64x2_t v233;
  CGAffineTransform v234;
  unint64_t v235[3];
  CGRect v236;

  v235[0] = a2;
  v235[1] = a3;
  v200 = a8;
  v14 = *(_BYTE *)(a4 + 336);
  if (v14)
  {
    objc_msgSend(*(id *)(a4 + 344), "buffers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v200, a4, a7);
      v17 = *(void **)(a4 + 344);
      if (a7)
        objc_msgSend(v17, "secondaryBuffers");
      else
        objc_msgSend(v17, "buffers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKMetalRenderer renderStrokeRenderCacheBuffers:renderEncoder:animatingStroke:indexed:](a1, v18, v200, (_anonymous_namespace_::AnimatingStroke *)a4, 1);

      v14 = 1;
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v19 = *(_QWORD *)(a4 + 328);
  if (v19 || (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) >= 2)
  {
    if (!v200)
      v14 = 1;
    if ((v14 & 1) == 0)
      -[PKMetalRenderer setupRenderEncoder:forParticleStroke:secondaryParticles:](a1, v200, a4, a7);
    objc_msgSend(*(id *)(a4 + 80), "ink");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 248;
    if (a7)
      v21 = 256;
    *(_QWORD *)&v20 = *(_QWORD *)(a4 + v21);
    v227 = v20;
    v192 = -[PKMetalRenderer alphaForStroke:](a1, *(void **)(a4 + 80));
    v183 = v16;
    v22 = *(_QWORD *)(a4 + 16);
    if (!v22)
      v22 = *(_QWORD *)a4;
    v24 = *(float **)v22;
    v23 = *(_QWORD *)(v22 + 8);
    *(_QWORD *)v197 = *MEMORY[0x1E0C9D628];
    *(_QWORD *)&v197[8] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
    *(_QWORD *)&v197[16] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_QWORD *)&v197[24] = *(_QWORD *)(MEMORY[0x1E0C9D628] + 24);
    v229 = a6;
    v231 = a2;
    objc_msgSend(v189, "behavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7)
      objc_msgSend(v25, "secondaryParticleDescriptor");
    else
      objc_msgSend(v25, "particleDescriptor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v185, "particleCount");
    v27 = *(_QWORD *)(a4 + 168);
    if (v27 <= *(_QWORD *)(a4 + 160))
      v27 = *(_QWORD *)(a4 + 160);
    v225 = v23;
    if (v27 < 1)
      objc_msgSend(v185, "particleSpacingForRadius:", *(double *)(v231 + 24));
    else
      objc_msgSend(v185, "particleSpacingForRadius:", *(double *)(*(_QWORD *)(*(_QWORD *)(a4 + 96) + 80) + 24));
    v184 = v28;
    v29 = 268;
    if (a7)
      v29 = 272;
    v30 = a4;
    v31 = *(_DWORD *)(a4 + v29);
    v32 = -[PKMetalResourceHandler randomNumberArray](*(_QWORD *)(a1 + 192));
    objc_msgSend(v185, "particleSpacing");
    v212 = v33;
    objc_msgSend(v185, "dynamicStep");
    v204 = v34;
    v205 = objc_msgSend(v185, "particleRotation");
    objc_msgSend(v185, "maskTextureName");
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v185, "maskScale");
    v36 = v35;
    objc_msgSend(v189, "weight");
    v38 = v37;
    objc_msgSend(v185, "maskScaleConstant");
    v40 = v39;
    objc_msgSend(v185, "maskMovement");
    v41 = *MEMORY[0x1E0C9D538];
    v42 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v223 = v43;
    if (objc_msgSend(v185, "maskInitialRandomOffset"))
    {
      v44 = *(_DWORD *)(v30 + 264);
      v41 = *(float *)(v32 + 4 * (v44 & 0xFFF));
      v42 = *(float *)(v32 + 4 * ((v44 + 1) & 0xFFF));
    }
    objc_msgSend(*(id *)(v30 + 80), "_anchorPointForTexture");
    v46 = v45;
    v48 = v47;
    objc_msgSend(v185, "particleSize");
    v198 = v50;
    v199 = v49;
    if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - v231) >> 3)) >= 2)
    {
      v51 = *(double *)(v231 + 24);
      v52 = -[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:](a1, v235, v30);
      v54 = v52 + 88;
      if (v52 + 88 != a3)
      {
        v202 = 0xCCCCCCCCCCCCCCCDLL * ((v225 - (uint64_t)v24) >> 2);
        v193 = 1.0 / (v40 + v36 * v38);
        v196 = v193 * v223;
        v194 = v42 - v193 * v223 * v48;
        v195 = v41 - v193 * v223 * v46;
        v55 = -(v51 * v199);
        v201 = (float)v26;
        v56 = v198 * v51;
        v187 = v229 ^ 1;
        v57 = 4;
        if (a5)
          v57 = 8;
        v186 = v57;
        v217 = -(v51 * v198);
        v218 = v199 * v51;
        v215 = v199 * v51;
        v216 = v217;
        v58 = -(v51 * v199);
        v59 = v198 * v51;
        v60 = v227;
        v188 = a3;
        while (1)
        {
          v61 = v59;
          v62 = v58;
          v63 = v55;
          v228 = v60;
          v190 = v54;
          v64 = *(double *)(v52 + 24);
          v224 = *(double *)(v52 + 16);
          v226 = *(double *)(v52 + 8);
          v232 = *(int8x16_t *)(v52 + 32);
          *(_QWORD *)&v53 = *(_QWORD *)(v52 + 80);
          v65 = *(double *)(v52 + 96);
          v66 = *(double *)(v52 + 104);
          v67 = *(double *)(v52 + 112);
          v68.f64[0] = *(float64_t *)(v52 + 128);
          v213 = *(double *)(v52 + 144);
          v214 = *(double *)(v52 + 56);
          v68.f64[1] = *(float64_t *)(v52 + 120);
          v69.f64[0] = *(float64_t *)(v52 + 168);
          v69.f64[1] = *(float64_t *)(v52 + 160);
          v208 = v69;
          v210 = v68;
          v221 = v53;
          *(_QWORD *)&v69.f64[0] = v53;
          v69.f64[1] = *(float64_t *)(v52 + 72);
          v230 = v69;
          if ((unint64_t)objc_msgSend(v189, "version") >= 3)
          {
            v70 = 1.0;
            v60 = v221;
            if (*(double *)&v221 < 1.0)
              *(double *)&v60 = 1.0;
            if (v64 >= 1.0)
              v70 = v64;
            if (!a7)
              *(double *)&v60 = v70;
            v212 = v184 * *(double *)&v60;
          }
          v71 = v65 - v226;
          v72 = v66 - v224;
          v73 = sqrt(v72 * v72 + v71 * v71);
          *((_QWORD *)&v53 + 1) = *((_QWORD *)&v228 + 1);
          if (v73 > *(double *)&v228)
            break;
          v77 = v73;
          v96 = *(double *)&v228;
          v55 = v63;
          v58 = v62;
          v59 = v61;
LABEL_86:
          v168 = v187;
          if (v52 + 176 != v188)
            v168 = 1;
          if ((v168 & 1) == 0 && v19 >= v186)
          {
            v169 = &v24[5 * v19];
            v170 = (*(double *)(v52 + 104) - *(double *)(v52 + 16)) * (*(v169 - 4) - *(v169 - 9))
                 + (*(v169 - 5) - *(v169 - 10)) * (*(double *)(v52 + 96) - *(double *)(v52 + 8));
            v171 = v170 < 0.0;
            v172 = 2.5;
            if (v170 >= 0.0)
              v173 = 2.5;
            else
              v173 = 0.5;
            if (!v171)
              v172 = 0.5;
            v174 = &v24[5 * v19 - 7];
            v175 = 1;
            do
            {
              v176 = v175;
              _H2 = *((_WORD *)v174 + 10);
              __asm { FCVT            D2, H2 }
              _D2 = v173 * _D2;
              __asm { FCVT            H2, D2 }
              *((_WORD *)v174 + 10) = LOWORD(_D2);
              LOWORD(_D2) = *(_WORD *)v174;
              __asm { FCVT            D2, H2 }
              _D2 = v172 * _D2;
              __asm { FCVT            H2, D2 }
              *(_WORD *)v174 = LOWORD(_D2);
              v174 -= 10;
              v175 = 0;
            }
            while ((v176 & 1) != 0);
          }
          *(double *)&v60 = v96 - v77;
          v52 = v190;
          v54 = v190 + 88;
          if (v190 + 88 == v188)
          {
            if ((a7 & 1) != 0)
              goto LABEL_99;
LABEL_101:
            *(_QWORD *)(v30 + 248) = v60;
            *(_DWORD *)(v30 + 268) = v31;
            goto LABEL_102;
          }
        }
        v219 = v72 / v73;
        v220 = v71 / v73;
        v222 = v64;
        v74 = v67 - v64;
        v75 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v73, 0);
        v233 = (float64x2_t)vextq_s8(v232, v232, 8uLL);
        v207 = vdivq_f64(vsubq_f64(v210, v233), v75);
        v209 = vdivq_f64(vsubq_f64(v208, v230), v75);
        v76 = a5;
        v77 = v73;
        v211 = v73;
        v206 = v74 / v73;
        v55 = v63;
        v58 = v62;
        v59 = v61;
        while (1)
        {
          if (v19 + 12 >= v202)
          {
            if (v200)
            {
              v80 = *(void **)(v30 + 344);
              if (v80)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v24, v19, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v80, (uint64_t)v24, v19, (void *)0x14, a7, v200, v81, v82, v83, v84);
              }
              else
              {
                -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:](a1, (uint64_t)v24, v19, 20, 6 * (v19 >> 2), v200);
              }
              v236.origin.x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](v30, v19);
              v236.origin.y = v90;
              v236.size.width = v91;
              v236.size.height = v92;
              *(CGRect *)v197 = CGRectUnion(*(CGRect *)v197, v236);
            }
            else
            {
              v85 = *(void **)(v30 + 88);
              if (v85)
              {
                -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v24, v19, 20);
                -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v85, (uint64_t)v24, v19, (void *)0x14, a7, 0, v86, v87, v88, v89);
              }
            }
            v78 = v58;
            v79 = v55;
            v19 = 0;
            *(_QWORD *)(v30 + 328) = 0;
          }
          else
          {
            v78 = v58;
            v79 = v55;
          }
          v77 = v77 - *(double *)&v228;
          v93 = v222 + v206 * *(double *)&v228;
          v233 = vmlaq_n_f64(v233, v207, *(double *)&v228);
          v230 = vmlaq_n_f64(v230, v209, *(double *)&v228);
          DKDMixAnglesInRadians(v214, v213, (v211 - v77) / v211);
          v222 = v93;
          v95 = a7 ? v230.f64[0] : v93;
          v96 = v204 > 0.0 ? v212 * v95 / v204 : v212;
          v97 = *(float *)(v32 + 4 * (v31 & 0xFFF));
          if (v205 == 2)
            break;
          CGAffineTransformMakeRotation(&v234, v94);
          *(CGFloat *)&v53 = v234.a;
          b = v234.b;
          c = v234.c;
          d = v234.d;
          tx = v234.tx;
          ty = v234.ty;
          v104 = v233;
          if ((unint64_t)(v205 - 1) <= 1)
            goto LABEL_65;
LABEL_66:
          v108 = v220 * *(double *)&v228 + v226;
          v109 = v219 * *(double *)&v228 + v224;
          if (v104.f64[0] > 0.0)
          {
            v110 = fmax(fmin((float)(*(float *)(v32 + 4 * (((_WORD)v31 + 2) & 0xFFF)) * 100.0) / 200.0, 1.0), 0.0);
            v111 = (v110 * (v110 * (v110 * -2.0)) + v110 * 3.0 * v110) * (v104.f64[0] + v104.f64[0]) + 0.0;
            v108 = v220 * *(double *)&v228 + v226 + (tx + c * 0.0 - *(double *)&v53) * v111;
            v109 = v219 * *(double *)&v228 + v224 + (ty + d * 0.0 - b) * v111;
          }
          v224 = v219 * *(double *)&v228 + v224;
          v226 = v220 * *(double *)&v228 + v226;
          v112 = 1.0;
          v113 = 1.0;
          v55 = v79;
          if ((a7 & 1) == 0)
          {
            v114 = 2.5;
            if ((v76 & 1) == 0)
              v114 = 1.0;
            v113 = v192 * vmuld_lane_f64(v114, v230, 1);
            v115 = 0.5;
            if ((v76 & 1) == 0)
              v115 = 1.0;
            v112 = v192 * vmuld_lane_f64(v115, v230, 1);
          }
          v116 = (int)(float)(v97 * v201) % v26;
          _S2 = (float)v116 / v201;
          _S3 = (float)(v116 + 1) / v201;
          v58 = v78;
          v119 = v219 * (v59 - v216) + (v78 - v55) * v220;
          _NF = v119 < 0.0;
          if (v119 >= 0.0)
            v121 = v112;
          else
            v121 = v113;
          if (_NF)
            v122 = v112;
          else
            v122 = v113;
          v123 = v55 + v108;
          v124 = v216 + v109;
          if (v203)
          {
            _D19 = v195 + v196 * v108;
            v126 = v194 + v196 * v109;
            v127 = v193 * v218 + _D19;
            v128 = v193 * v215 + _D19;
            v129 = v123;
            v130 = v124;
            _S7 = v122;
            _S16 = v233.f64[1];
            _S21 = v193 * v55 + _D19;
            _S22 = v193 * v216 + v126;
            __asm
            {
              FCVT            H25, S2
              FCVT            H7, S7
              FCVT            H2, S16
              FCVT            H16, S21
              FCVT            H21, S22
            }
            v140 = &v24[5 * v19];
            *v140 = v129;
            v140[1] = v130;
            *((_WORD *)v140 + 4) = _H25;
            *((_WORD *)v140 + 5) = 0;
            *((_WORD *)v140 + 6) = LOWORD(_S7);
            *((_WORD *)v140 + 7) = _H2;
            *((_WORD *)v140 + 8) = LOWORD(_S16);
            *((_WORD *)v140 + 9) = LOWORD(_S21);
            v141 = v78 + v108;
            v142 = v59 + v109;
            _S4 = v121;
            _S18 = v193 * v78 + _D19;
            *(float *)&_D19 = v193 * v59 + v126;
            __asm
            {
              FCVT            H4, S4
              FCVT            H18, S18
              FCVT            H19, S19
            }
            v140[5] = v141;
            v140[6] = v142;
            *((_WORD *)v140 + 14) = _H25;
            *((_WORD *)v140 + 15) = 15360;
            *((_WORD *)v140 + 16) = _H4;
            *((_WORD *)v140 + 17) = _H2;
            *((_WORD *)v140 + 18) = LOWORD(_S18);
            *((_WORD *)v140 + 19) = LOWORD(_D19);
            v146 = v218 + v108;
            v147 = v217 + v109;
            _S18 = v127;
            *(float *)&_D19 = v193 * v217 + v126;
            __asm
            {
              FCVT            H3, S3
              FCVT            H18, S18
              FCVT            H19, S19
            }
            v140[10] = v146;
            v140[11] = v147;
            *((_WORD *)v140 + 24) = _H3;
            *((_WORD *)v140 + 25) = 0;
            *((_WORD *)v140 + 26) = LOWORD(_S7);
            *((_WORD *)v140 + 27) = _H2;
            *((_WORD *)v140 + 28) = LOWORD(_S18);
            *((_WORD *)v140 + 29) = LOWORD(_D19);
            v150 = v215 + v108;
            _S1 = v128;
            _S6 = v193 * v56 + v126;
            __asm
            {
              FCVT            H5, S1
              FCVT            H1, S6
            }
            v140[15] = v150;
          }
          else
          {
            v156 = v123;
            v157 = v124;
            _S7 = v122;
            _S16 = v233.f64[1];
            __asm
            {
              FCVT            H17, S2
              FCVT            H7, S7
              FCVT            H2, S16
            }
            v140 = &v24[5 * v19];
            *v140 = v156;
            v140[1] = v157;
            *((_WORD *)v140 + 4) = _H17;
            _H5 = 0;
            *((_WORD *)v140 + 5) = 0;
            *((_WORD *)v140 + 6) = LOWORD(_S7);
            *((_WORD *)v140 + 7) = _H2;
            v140[4] = 0.0;
            v161 = v78 + v108;
            v162 = v59 + v109;
            _S4 = v121;
            __asm { FCVT            H4, S4 }
            v140[5] = v161;
            v140[6] = v162;
            *((_WORD *)v140 + 14) = _H17;
            *((_WORD *)v140 + 15) = 15360;
            *((_WORD *)v140 + 16) = _H4;
            *((_WORD *)v140 + 17) = _H2;
            v140[9] = 0.0;
            v164 = v218 + v108;
            v165 = v217 + v109;
            __asm { FCVT            H3, S3 }
            v140[10] = v164;
            v140[11] = v165;
            *((_WORD *)v140 + 24) = _H3;
            *((_WORD *)v140 + 25) = 0;
            *((_WORD *)v140 + 26) = LOWORD(_S7);
            *((_WORD *)v140 + 27) = _H2;
            v140[14] = 0.0;
            v166 = v215 + v108;
            _H1 = 0;
            v140[15] = v166;
          }
          v155 = v140 + 15;
          v76 = 0;
          LOBYTE(a5) = 0;
          v167 = v56 + v109;
          v155[1] = v167;
          *((_WORD *)v155 + 4) = _H3;
          *((_WORD *)v155 + 5) = 15360;
          *((_WORD *)v155 + 6) = _H4;
          *((_WORD *)v155 + 7) = _H2;
          *((_WORD *)v155 + 8) = _H5;
          *((_WORD *)v155 + 9) = _H1;
          v19 += 4;
          v31 += 3;
          *(double *)&v228 = v96;
          if (v77 <= v96)
            goto LABEL_86;
        }
        v98 = *(float *)(v32 + 4 * (((_WORD)v31 + 1) & 0xFFF)) * 3.14159265;
        *(float *)&v98 = v98 + v98;
        CGAffineTransformMakeRotation(&v234, *(float *)&v98);
        *(CGFloat *)&v53 = v234.a;
        b = v234.b;
        c = v234.c;
        d = v234.d;
        tx = v234.tx;
        ty = v234.ty;
        v104 = v233;
LABEL_65:
        v105 = v199 * vmuld_lane_f64(v95, v104, 1);
        v79 = tx + -(v198 * v95 * c) - *(double *)&v53 * v105;
        v218 = tx + *(double *)&v53 * v105 - v198 * v95 * c;
        v216 = ty + -(v198 * v95 * d) - b * v105;
        v217 = ty + b * v105 - v198 * v95 * d;
        v106 = v198 * v95 * c;
        v215 = tx + v106 + *(double *)&v53 * v105;
        v107 = v198 * v95 * d;
        v56 = ty + v107 + b * v105;
        v78 = tx + v106 - *(double *)&v53 * v105;
        v59 = ty + v107 - b * v105;
        goto LABEL_66;
      }
    }
    *(_QWORD *)&v60 = v227;
    if ((a7 & 1) == 0)
      goto LABEL_101;
LABEL_99:
    *(_QWORD *)(v30 + 256) = v60;
    *(_DWORD *)(v30 + 272) = v31;
LABEL_102:
    v16 = -[PKMetalRenderer renderVerticies:size:numRenderedVertices:vertexSize:numIndices:localClipRect:animatingStroke:secondaryParticles:renderEncoder:]((_OWORD *)a1, v24, v19, v183, (void *)0x14, 6 * (v19 >> 2), v30, a7, *(CGFloat *)v197, *(CGFloat *)&v197[8], *(CGFloat *)&v197[16], *(CGFloat *)&v197[24], v200);

  }
  return v16;
}

- (void)renderStrokeVertices:(unint64_t)a3 numVertices:(uint64_t)a4 vertexSize:(uint64_t)a5 numIndices:(void *)a6 renderEncoder:
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;

  v11 = a6;
  v14 = 0;
  v12 = -[PKMetalResourceHandler newBufferWithLength:bytes:outOffset:](*(id *)(a1 + 192), a4 * a3, a2, (uint64_t)&v14);
  objc_msgSend(v11, "setVertexBuffer:offset:atIndex:", v12, v14, 0);

  v14 = 0;
  -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(a1 + 192), a3, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, a5, v14, v13, 0);

}

- (unint64_t)fadeOutLimitFromPoints:(uint64_t)a3 animatingStroke:
{
  unint64_t v3;
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  CGRect v19;

  v3 = *a2;
  if (!a3)
    return v3;
  if (*(_BYTE *)(a1 + 932) && (v6 = *(double *)(a1 + 1024), v6 > 0.0) && (v7 = *(double *)(a1 + 1032), v7 > 0.0))
  {
    v8 = *(_QWORD *)(a3 + 312);
    if (v8)
      goto LABEL_6;
    if (a2[1] != v3)
    {
      v12 = 0;
      v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v15 = *MEMORY[0x1E0C9D628];
      v16 = *(_QWORD *)(MEMORY[0x1E0C9D628] + 8);
      do
      {
        v19.origin.x = *(CGFloat *)(v3 + v12 + 8);
        v19.origin.y = *(CGFloat *)(v3 + v12 + 16);
        v19.size.width = 1.0;
        v19.size.height = 1.0;
        *(CGRect *)&v15 = CGRectUnion(*(CGRect *)&v15, v19);
        if (v13 > v6 || v14 > v7)
        {
          v8 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v3 - *a2 + v12) >> 3);
          *(_QWORD *)(a3 + 312) = v8;
          goto LABEL_22;
        }
        v12 += 88;
      }
      while (v3 + v12 != a2[1]);
      v8 = *(_QWORD *)(a3 + 312);
LABEL_22:
      if (v8)
      {
        v3 = *a2;
LABEL_6:
        v9 = a2[1] - 88 * v8;
        if (v9 >= v3)
          return v9;
      }
    }
  }
  else if (*(_BYTE *)(a3 + 337))
  {
    v10 = *(_QWORD *)(a3 + 312);
    if (v10)
    {
      v11 = a2[1];
      if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v11 - v3) >> 3) > v10)
        return v11 - 88 * v10;
    }
  }
  return v3;
}

- (void)addBufferForRenderCache:(uint64_t)a3 strokeVertices:(unint64_t)a4 numVertices:(void *)a5 vertexSize:(char)a6 bounds:(void *)a7 secondaryParticles:(double)a8 renderEncoder:(double)a9
{
  id v21;
  id v22;
  id v23;
  PKMetalStrokeRenderCacheBuffer *v24;
  id *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;

  v21 = a2;
  v22 = a7;
  *(_QWORD *)(a1 + 16) += 20 * a4;
  v30 = 0;
  v23 = -[PKMetalResourceHandler newPurgeableBufferWithLength:bytes:outOffset:](*(id *)(a1 + 192), (_QWORD)a5 * a4, a3, (uint64_t)&v30);
  v24 = [PKMetalStrokeRenderCacheBuffer alloc];
  v25 = -[PKMetalStrokeRenderCacheBuffer initWithBuffer:offset:numVertices:vertexSize:bounds:]((id *)&v24->super.isa, v23, v30, (void *)a4, a5, a8, a9, a10, a11);
  if ((a6 & 1) != 0)
    objc_msgSend(v21, "addSecondaryBuffer:", v25);
  else
    objc_msgSend(v21, "addBuffer:", v25);
  if (v22)
  {
    -[PKMetalSDFPenRenderCacheBuffer uniformsBuffer](v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      v27 = v25[2];
    else
      v27 = 0;
    objc_msgSend(v22, "setVertexBuffer:offset:atIndex:", v26, v27, 0);

    v29 = 0;
    -[PKMetalResourceHandler indexBufferForNumVertices:outIndexType:](*(_QWORD *)(a1 + 192), a4, &v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 6 * (a4 >> 2), v29, v28, 0);

  }
}

- (uint64_t)renderVerticies:(unint64_t)a3 size:(uint64_t)a4 numRenderedVertices:(void *)a5 vertexSize:(uint64_t)a6 numIndices:(uint64_t)a7 localClipRect:(char)a8 animatingStroke:(CGFloat)a9 secondaryParticles:(CGFloat)a10 renderEncoder:(CGFloat)a11
{
  id v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  __int128 v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v25 = a13;
  v26 = v25;
  if (a3)
  {
    if (v25)
    {
      -[PKMetalRenderer renderStrokeVertices:numVertices:vertexSize:numIndices:renderEncoder:]((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a5, a6, v25);
      v40.origin.x = -[PKMetalRenderer dirtyClipRectForAnimatingStrokeVertices:newSize:](a7, a3);
      v40.origin.y = v27;
      v40.size.width = v28;
      v40.size.height = v29;
      v38.origin.x = a9;
      v38.origin.y = a10;
      v38.size.width = a11;
      v38.size.height = a12;
      v39 = CGRectUnion(v38, v40);
      v30 = a1[18];
      *(_OWORD *)&v37.a = a1[17];
      *(_OWORD *)&v37.c = v30;
      *(_OWORD *)&v37.tx = a1[19];
    }
    else
    {
      v31 = *(void **)(a7 + 88);
      if (v31)
      {
        -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](a2, a3, (uint64_t)a5);
        -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:]((uint64_t)a1, v31, (uint64_t)a2, a3, a5, a8, 0, v32, v33, v34, v35);
      }
    }
    a4 += a3;
    if (*(_BYTE *)(a7 + 336))
      *(_QWORD *)(a7 + 328) = a3;
  }

  return a4;
}

- (void)generateRenderMaskForPaths:(void *)a3 renderCache:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  float *v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  float *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float64x2_t v19;
  void *__p;
  _BYTE *v21;
  uint64_t v22;

  v5 = a3;
  v6 = *a2;
  v7 = a2[1];
  if (*a2 != v7)
  {
    v8 = **(float ***)(a1 + 592);
    v19 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    do
    {
      __p = 0;
      v21 = 0;
      v22 = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(&__p, *(const void **)v6, *(_QWORD *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3));
      v9 = (char *)__p;
      v10 = (v21 - (_BYTE *)__p) / 24;
      if (v21 != __p)
      {
        v11 = 0;
        if (v10 <= 1)
          v12 = 1;
        else
          v12 = (v21 - (_BYTE *)__p) / 24;
        v13 = v8 + 2;
        do
        {
          v14 = v11 >> 1;
          if ((v11 & 1) != 0)
            v14 = v10 + ~(v11 >> 1);
          *((float32x2_t *)v13 - 1) = vcvt_f32_f64(vdivq_f64(vcvtq_f64_s64(*(int64x2_t *)&v9[24 * v14]), v19));
          ++v11;
          *(_QWORD *)v13 = 0;
          v13[2] = 0.0;
          v13 += 5;
        }
        while (v12 != v11);
      }
      -[PKMetalRenderer clipRectForVertices:numVertices:vertexSize:](v8, v10, 20);
      -[PKMetalRenderer addBufferForRenderCache:strokeVertices:numVertices:vertexSize:bounds:secondaryParticles:renderEncoder:](a1, v5, (uint64_t)v8, v10, (void *)0x14, 0, 0, v15, v16, v17, v18);
      if (__p)
      {
        v21 = __p;
        operator delete(__p);
      }
      v6 += 24;
    }
    while (v6 != v7);
  }

}

- (_QWORD)generatePaintCacheForStroke:(unint64_t)a3 animatingStroke:(uint64_t)a4 segmentSteps:(_QWORD *)a5 liveStrokePoints:(uint64_t)a6 liveStrokeStartTime:(double)a7 duration:(double)a8
{
  _QWORD *v8;
  float64x2_t v15;
  void *v16;
  float64x2_t v17;
  float64x2_t v18;
  __int128 *v19;
  __int128 *v20;
  __int128 *v21;
  float32x2_t *v22;
  float32x2_t *v23;
  float32x2_t *v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  char *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  size_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  double v57;
  double v58;
  double *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void (**v66)(_QWORD);
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  int v70;
  double v71;
  double v72;
  int v73;
  float32x2_t v74;
  float v75;
  float v76;
  int v77;
  uint64_t v78;
  float32x2_t *v79;
  uint64_t *v80;
  uint64_t v81;
  int v82;
  uint64_t *v83;
  uint64_t v84;
  float32x2_t *v85;
  unint64_t v86;
  float32x2_t v87;
  float32_t v88;
  float32_t v89;
  uint64_t v90;
  float32x2_t *v91;
  _QWORD *v92;
  __int128 v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t i;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD aBlock[5];
  id v117;
  uint64_t *v118;
  uint64_t *v119;
  CGAffineTransform *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  CGAffineTransform v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  __n128 (*v141)(uint64_t, uint64_t);
  uint64_t (*v142)();
  const char *v143;
  int v144;
  int v145;
  int v146;
  int v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  unint64_t v154[2];
  _BYTE v155[128];
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v154[0] = a2;
  v154[1] = a3;
  if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a3 - a2) >> 3)) < 2)
  {
    v8 = 0;
    return v8;
  }
  v138 = 0;
  v139 = &v138;
  v140 = 0xB012000000;
  v141 = __Block_byref_object_copy__19;
  v142 = __Block_byref_object_dispose__19;
  v143 = "";
  v15 = 0uLL;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v153 = 0u;
  v144 = 0;
  v145 = -1171354717 * ((uint64_t)(a3 - a2) >> 3);
  v147 = 0;
  v146 = 0;
  memset(&v137, 0, sizeof(v137));
  v16 = *(void **)(a4 + 80);
  if (v16)
  {
    objc_msgSend(v16, "_inkTransform");
    v18 = *(float64x2_t *)&v137.a;
    v17 = *(float64x2_t *)&v137.c;
    v19 = (__int128 *)(v139 + 20);
    v20 = (__int128 *)(v139 + 16);
    v15 = *(float64x2_t *)&v137.tx;
    v21 = (__int128 *)(v139 + 18);
    v22 = (float32x2_t *)(v139 + 14);
    v23 = (float32x2_t *)(v139 + 10);
    v24 = (float32x2_t *)(v139 + 12);
  }
  else
  {
    v23 = (float32x2_t *)&v148;
    v24 = (float32x2_t *)&v149;
    v22 = (float32x2_t *)&v150;
    v20 = &v151;
    v17 = 0uLL;
    v21 = &v152;
    v18 = 0uLL;
    v19 = &v153;
  }
  v23[1].i32[0] = 0;
  *v23 = vcvt_f32_f64(v18);
  v24[1].i32[0] = 0;
  *v24 = vcvt_f32_f64(v17);
  v22[1].i32[0] = 1065353216;
  *v22 = vcvt_f32_f64(v15);
  v136 = v137;
  CGAffineTransformInvert(&v125, &v136);
  v25 = vcvt_f32_f64(*(float64x2_t *)&v125.a);
  v26 = vcvt_f32_f64(*(float64x2_t *)&v125.c);
  v27 = vcvt_f32_f64(*(float64x2_t *)&v125.tx);
  *((_DWORD *)v20 + 2) = 0;
  *(float32x2_t *)v20 = v25;
  *((_DWORD *)v21 + 2) = 0;
  *(float32x2_t *)v21 = v26;
  *((_DWORD *)v19 + 2) = 1065353216;
  *(float32x2_t *)v19 = v27;
  v132 = 0;
  v133 = &v132;
  v134 = 0x2020000000;
  v135 = 0;
  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  v104 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a4 + 80));
  v106 = a6;
  if (!a6)
  {
    v40 = 0;
    goto LABEL_26;
  }
  v28 = *(char **)(a1 + 576);
  v29 = *(char **)(a1 + 568);
  v30 = v28 - v29;
  if (!((unint64_t)(v28 - v29) >> 20))
  {
    v31 = 0x10000 - (v30 >> 4);
    v32 = *(_QWORD *)(a1 + 584);
    if (v31 > (v32 - (uint64_t)v28) >> 4)
    {
      v33 = v32 - (_QWORD)v29;
      v34 = v33 >> 3;
      if ((unint64_t)(v33 >> 3) <= 0x10000)
        v34 = 0x10000;
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
        v35 = 0xFFFFFFFFFFFFFFFLL;
      else
        v35 = v34;
      if (v35 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v36 = (char *)operator new(16 * v35);
      v37 = &v36[16 * (v30 >> 4)];
      v38 = &v36[16 * v35];
      bzero(v37, 16 * v31);
      v39 = &v37[16 * v31];
      if (v28 != v29)
      {
        do
        {
          *((_OWORD *)v37 - 1) = *((_OWORD *)v28 - 1);
          v37 -= 16;
          v28 -= 16;
        }
        while (v28 != v29);
        v28 = v29;
      }
      *(_QWORD *)(a1 + 568) = v37;
      *(_QWORD *)(a1 + 576) = v39;
      *(_QWORD *)(a1 + 584) = v38;
      if (v28)
        operator delete(v28);
      goto LABEL_25;
    }
    bzero(*(void **)(a1 + 576), 16 * v31);
    v41 = &v28[16 * v31];
    goto LABEL_24;
  }
  if (v30 != 0x100000)
  {
    v41 = v29 + 0x100000;
LABEL_24:
    *(_QWORD *)(a1 + 576) = v41;
  }
LABEL_25:
  v40 = *(_QWORD *)(a1 + 568);
LABEL_26:
  v42 = *(char **)(a1 + 528);
  v43 = *(char **)(a1 + 520);
  v44 = (char *)(v42 - v43);
  v45 = 0xAAAAAAAAAAAAAAABLL * ((v42 - v43) >> 3);
  if (!(v45 >> 16))
  {
    v46 = *(_QWORD *)(a1 + 536);
    if (0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v42) >> 3) < 0x10000 - v45)
    {
      v47 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (uint64_t)v43) >> 3);
      v48 = 0x5555555555555556 * ((v46 - (uint64_t)v43) >> 3);
      if (v48 <= 0x10000)
        v48 = 0x10000;
      if (v47 >= 0x555555555555555)
        v49 = 0xAAAAAAAAAAAAAAALL;
      else
        v49 = v48;
      if (v49 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v50 = (char *)operator new(24 * v49);
      v51 = &v50[8 * ((v42 - v43) >> 3)];
      v52 = &v50[24 * v49];
      v53 = 1572840 - (_QWORD)v44 - (1572840 - (int)v44) % 0x18u + 24;
      bzero(v51, v53);
      v54 = (uint64_t)&v51[v53];
      if (v42 != v43)
      {
        do
        {
          v55 = *(_OWORD *)(v42 - 24);
          *((_QWORD *)v51 - 1) = *((_QWORD *)v42 - 1);
          *(_OWORD *)(v51 - 24) = v55;
          v51 -= 24;
          v42 -= 24;
        }
        while (v42 != v43);
        v42 = v43;
      }
      *(_QWORD *)(a1 + 520) = v51;
      *(_QWORD *)(a1 + 528) = v54;
      *(_QWORD *)(a1 + 536) = v52;
      if (v42)
      {
        operator delete(v42);
        v54 = *(_QWORD *)(a1 + 528);
      }
      goto LABEL_43;
    }
    bzero(*(void **)(a1 + 528), 1572840 - (_QWORD)v44 - (1572840 - (int)v44) % 0x18u + 24);
    v54 = (uint64_t)&v43[-((1572840 - ((int)v42 - (int)v43)) % 0x18u) + 1572864];
    goto LABEL_42;
  }
  v54 = *(_QWORD *)(a1 + 528);
  if (v44 != (char *)1572864)
  {
    v54 = (uint64_t)(v43 + 1572864);
LABEL_42:
    *(_QWORD *)(a1 + 528) = v54;
  }
LABEL_43:
  v56 = *(_QWORD *)(a1 + 520);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a4 + 80), "_pointsCount"))
  {
    objc_msgSend(*(id *)(a4 + 80), "timestamp");
    v58 = v57;
  }
  else
  {
    v59 = *(double **)(*(_QWORD *)(a4 + 96) + 80);
    if (*(double **)(*(_QWORD *)(a4 + 96) + 88) == v59)
      v58 = 0.0;
    else
      v58 = *v59;
  }
  v60 = -[PKMetalRenderer fadeOutLimitFromPoints:animatingStroke:](a1, v154, a4);
  v125.a = 0.0;
  *(_QWORD *)&v125.b = &v125;
  *(_QWORD *)&v125.d = __Block_byref_object_copy__80;
  *(_QWORD *)&v125.tx = __Block_byref_object_dispose__81;
  *(_QWORD *)&v125.c = 0x5012000000;
  *(_QWORD *)&v125.ty = "";
  v126 = 0u;
  v127 = 0u;
  objc_msgSend(*(id *)(a4 + 80), "_bounds");
  *(_QWORD *)&v126 = v61;
  *((_QWORD *)&v126 + 1) = v62;
  *(_QWORD *)&v127 = v63;
  *((_QWORD *)&v127 + 1) = v64;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__PKMetalRenderer_generatePaintCacheForStroke_animatingStroke_segmentSteps_liveStrokePoints_liveStrokeStartTime_duration___block_invoke;
  aBlock[3] = &unk_1E777B130;
  v119 = &v132;
  v120 = &v125;
  v123 = v106;
  v124 = v40;
  v121 = &v128;
  v122 = v56;
  v118 = &v138;
  aBlock[4] = a1;
  v65 = v105;
  v117 = v65;
  v66 = (void (**)(_QWORD))_Block_copy(aBlock);
  v103 = v65;
  if (v60 + 88 != a3)
  {
    v67 = 0;
    v68 = 0xAAAAAAAAAAAAAAABLL * ((v54 - v56) >> 3);
    v69 = v60;
    do
    {
      if (v67 >= (uint64_t)(a5[1] - *a5) >> 2)
        v70 = 8;
      else
        v70 = *(_DWORD *)(*a5 + 4 * v67);
      if (*(_BYTE *)(a1 + 932))
      {
        if (*(_BYTE *)(a1 + 931))
        {
          v71 = *(double *)v69 - v58;
          if (v71 <= 255.996094)
            v72 = v71 * 256.0;
          else
            v72 = 65535.0;
          v73 = (int)v72;
        }
        else
        {
          v73 = 0xFFFF;
        }
      }
      else
      {
        v73 = (unsigned __int16)v70;
      }
      v74 = vcvt_f32_f64(*(float64x2_t *)(v69 + 8));
      v75 = *(double *)(v69 + 24);
      v76 = *(double *)(v69 + 72);
      v77 = v73 | (*((_DWORD *)v129 + 6) << 16);
      v78 = v133[3];
      v133[3] = v78 + 1;
      v79 = (float32x2_t *)(v56 + 24 * v78);
      *v79 = v74;
      v79[1].f32[0] = v75;
      v79[1].f32[1] = v76;
      v79[2].i32[0] = v77;
      v80 = v129;
      v81 = v129[3];
      v82 = 8 * v70;
      if (v81 + 8 * v70 + 4 > v68)
      {
        v66[2](v66);
        v83 = v133;
        v133[3] = 0;
        v129[3] = 0;
        v84 = v83[3];
        v83[3] = v84 + 1;
        v85 = (float32x2_t *)(v56 + 24 * v84);
        *v85 = v74;
        v85[1].f32[0] = v75;
        v85[1].f32[1] = v76;
        v85[2].i32[0] = v73;
        v80 = v129;
        v81 = v129[3];
      }
      v80[3] = v81 + v82;
      ++v67;
      v60 = v69 + 88;
      v86 = v69 + 176;
      v69 += 88;
    }
    while (v86 != a3);
  }
  v87 = vcvt_f32_f64(*(float64x2_t *)(v60 + 8));
  v88 = *(double *)(v60 + 24);
  v89 = *(double *)(v60 + 72);
  v90 = v133[3];
  v133[3] = v90 + 1;
  v91 = (float32x2_t *)(v56 + 24 * v90);
  *v91 = v87;
  v91[1].f32[0] = v88;
  v91[1].f32[1] = v89;
  v66[2](v66);
  if (v106)
  {
    v92 = -[PKMetalLiveStrokePaintRenderCache initWithRenderZoomFactor:]([PKMetalLiveStrokePaintRenderCache alloc], v104);
    v8 = v92;
    if (v92)
    {
      *((double *)v92 + 4) = a7;
      *((double *)v92 + 5) = a8;
      v93 = *(_OWORD *)(*(_QWORD *)&v125.b + 64);
      *((_OWORD *)v92 + 3) = *(_OWORD *)(*(_QWORD *)&v125.b + 48);
      *((_OWORD *)v92 + 4) = v93;
    }
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v94 = v103;
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v112, v156, 16);
    if (v95)
    {
      v96 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v95; ++i)
        {
          if (*(_QWORD *)v113 != v96)
            objc_enumerationMutation(v94);
          -[PKMetalLiveStrokePaintRenderCache addBuffer:]((uint64_t)v8, *(void **)(*((_QWORD *)&v112 + 1) + 8 * i));
        }
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v112, v156, 16);
      }
      while (v95);
    }
  }
  else
  {
    v8 = -[PKMetalPaintRenderCache initWithPurgeableBuffers:renderZoomFactor:]([PKMetalPaintRenderCache alloc], *(_BYTE *)(a1 + 932) == 0, v104);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v98 = v103;
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v108, v155, 16);
    if (v99)
    {
      v100 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v99; ++j)
        {
          if (*(_QWORD *)v109 != v100)
            objc_enumerationMutation(v98);
          -[PKMetalPaintRenderCache addBuffer:]((uint64_t)v8, *(void **)(*((_QWORD *)&v108 + 1) + 8 * j));
        }
        v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v108, v155, 16);
      }
      while (v99);
    }
  }

  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(&v138, 8);
  return v8;
}

void __122__PKMetalRenderer_generatePaintCacheForStroke_animatingStroke_segmentSteps_liveStrokePoints_liveStrokeStartTime_duration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  CGRect v8;
  CGRect v9;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 52) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  v2 = *(_QWORD *)(a1 + 80) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v2 - 8) = *(unsigned __int16 *)(v2 - 8);
  v3 = *(_QWORD *)(a1 + 80) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v3 - 8) = *(unsigned __int16 *)(v3 - 6) << 16;
  if (*(_QWORD *)(a1 + 88))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v4 = 0;
      v5 = 0;
      do
      {
        v6 = *(_QWORD *)(a1 + 88);
        v8.origin.x = COERCE_FLOAT(*(_QWORD *)(v6 + 8 * v5));
        v8.origin.y = COERCE_FLOAT(HIDWORD(*(_QWORD *)(v6 + 8 * v5)));
        v8.size.width = 1.0;
        v8.size.height = 1.0;
        v9 = CGRectInset(v8, -20.0, -20.0);
        *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)+ 8)+ 48), v9);
        *(_QWORD *)(*(_QWORD *)(a1 + 96) + v4) = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v5);
        *(_QWORD *)(*(_QWORD *)(a1 + 96) + v4 + 8) = 1074790400;
        ++v5;
        v4 += 16;
      }
      while (v5 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    }
    v7 = -[PKMetalLiveStrokePaintRenderCacheBuffer initWithPoints:liveStrokePoints:numPoints:numVertices:resourceHandler:]([PKMetalLiveStrokePaintRenderCacheBuffer alloc], *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 96), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 4, *(void **)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  else
  {
    v7 = -[PKMetalPaintRenderCacheBuffer initWithUniforms:points:numPoints:numVertices:resourceHandler:]([PKMetalPaintRenderCacheBuffer alloc], *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) + 4, *(void **)(*(_QWORD *)(a1 + 32) + 192));
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }

}

void __77__PKMetalRenderer_generateSDFPenCacheForStroke_animatingStroke_segmentSteps___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 52) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  v2 = *(_QWORD *)(a1 + 72) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v2 - 8) = *(unsigned __int16 *)(v2 - 8);
  v3 = *(_QWORD *)(a1 + 72) + 24 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_DWORD *)(v3 - 8) = *(unsigned __int16 *)(v3 - 6) << 16;
  v4 = -[PKMetalSDFPenRenderCacheBuffer initWithUniforms:points:numPoints:numVertices:resourceHandler:]([PKMetalSDFPenRenderCacheBuffer alloc], *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(void **)(*(_QWORD *)(a1 + 32) + 192));
  objc_msgSend(*(id *)(a1 + 40), "addObject:");

}

- (id)generateParticleCacheForStroke:(uint64_t)a3 animatingStroke:(uint64_t)a4 starts:(int)a5 ends:(int)a6 secondaryParticles:(int)a7
{
  id *v7;
  uint64_t v9;
  double *v11;
  double v12;
  char *v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  float64x2_t v40;
  unint64_t v41;
  double v42;
  float v43;
  float v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  float v50;
  double v51;
  double v52;
  uint64_t v53;
  int v54;
  double v55;
  double v56;
  __int16 v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  long double v75;
  double v76;
  double v77;
  double v79;
  unint64_t v85;
  float v86;
  uint64_t v87;
  float v89;
  float v92;
  double v94;
  double v95;
  double v96;
  double v97;
  unsigned int v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  float v102;
  float v103;
  __int16 v104;
  _QWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  double v109;
  long double v111;
  uint64_t *v113;
  float32x2_t v114;
  double v115;
  uint64_t *v118;
  float32_t v121;
  float32x2_t *v123;
  float v124;
  unint64_t v125;
  _QWORD *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t i;
  void *v133;
  void *v134;
  uint64_t v136;
  void *v137;
  double v138;
  double v140;
  double v141;
  void *v143;
  double v144;
  uint64_t v145;
  float64_t v146;
  double v147;
  uint64_t v148;
  float64_t v149;
  uint64_t v150;
  __int16 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  float32x2_t v156;
  int v157;
  float v158;
  float v159;
  int v160;
  int v161;
  int v162;
  BOOL v163;
  BOOL v164;
  char v165;
  char v166;
  float v167;
  float v168;
  double v169;
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  if (a3 == a2)
  {
    v7 = 0;
    return v7;
  }
  v9 = a2;
  objc_msgSend(*(id *)(a4 + 80), "ink");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "behavior");
  v11 = (double *)objc_claimAutoreleasedReturnValue();
  v12 = -[PKInkBehavior alphaForStroke:](v11, *(void **)(a4 + 80));

  v13 = *(char **)(a1 + 496);
  v14 = *(char **)(a1 + 504);
  v15 = v14 - v13;
  if (!((unint64_t)(v14 - v13) >> 21))
  {
    v16 = 0x10000 - (v15 >> 5);
    v17 = *(_QWORD *)(a1 + 512);
    if (v16 > (v17 - (uint64_t)v14) >> 5)
    {
      v18 = v17 - (_QWORD)v13;
      v19 = v18 >> 4;
      if ((unint64_t)(v18 >> 4) <= 0x10000)
        v19 = 0x10000;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0)
        v20 = 0x7FFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v21 = (char *)operator new(32 * v20);
      v22 = &v21[32 * (v15 >> 5)];
      v23 = &v21[32 * v20];
      bzero(v22, 32 * v16);
      v24 = &v22[32 * v16];
      if (v14 != v13)
      {
        do
        {
          v25 = *((_OWORD *)v14 - 1);
          *((_OWORD *)v22 - 2) = *((_OWORD *)v14 - 2);
          *((_OWORD *)v22 - 1) = v25;
          v22 -= 32;
          v14 -= 32;
        }
        while (v14 != v13);
        v14 = v13;
      }
      *(_QWORD *)(a1 + 496) = v22;
      *(_QWORD *)(a1 + 504) = v24;
      *(_QWORD *)(a1 + 512) = v23;
      if (v14)
      {
        operator delete(v14);
        v24 = *(char **)(a1 + 504);
      }
      goto LABEL_20;
    }
    bzero(*(void **)(a1 + 504), 32 * v16);
    v24 = &v14[32 * v16];
    goto LABEL_19;
  }
  v24 = *(char **)(a1 + 504);
  if (v15 != 0x200000)
  {
    v24 = v13 + 0x200000;
LABEL_19:
    *(_QWORD *)(a1 + 504) = v24;
  }
LABEL_20:
  v26 = *(_QWORD *)(a1 + 496);
  v27 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a4 + 80));
  objc_msgSend(v143, "behavior");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7)
    objc_msgSend(v28, "secondaryParticleDescriptor");
  else
    objc_msgSend(v28, "particleDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = v29;
  v30 = objc_msgSend(v29, "particleCount");
  objc_msgSend(v29, "particleSpacingForRadius:", *(double *)(v9 + 24));
  v140 = v31;
  objc_msgSend(v29, "particleSpacing");
  v33 = v32;
  objc_msgSend(v29, "dynamicStep");
  v35 = v34;
  v36 = objc_msgSend(v29, "particleRotation");
  objc_msgSend(v29, "particleSize");
  v146 = v38;
  v149 = v37;
  v39 = -[PKMetalResourceHandler randomNumberArray](*(_QWORD *)(a1 + 192));
  v40.f64[0] = v149;
  v40.f64[1] = v146;
  v156 = vcvt_f32_f64(v40);
  *(float *)v40.f64 = v12;
  v157 = LODWORD(v40.f64[0]);
  v161 = v30;
  v41 = objc_msgSend(v143, "version");
  v42 = v140;
  if (v41 <= 2)
    v42 = v33;
  v43 = v42;
  v44 = v35;
  v158 = v43;
  v159 = v44;
  v163 = v36 != 0;
  v164 = v36 == 2;
  v165 = a5;
  v166 = 0;
  objc_msgSend(v29, "maskScale");
  v46 = v45;
  objc_msgSend(v143, "weight");
  v48 = v47;
  objc_msgSend(v29, "maskScaleConstant");
  v50 = 1.0 / (v49 + v46 * v48);
  v167 = v50;
  objc_msgSend(v29, "maskMovement");
  v138 = v35;
  v51 = v33;
  *(float *)&v52 = v52 * v50;
  v168 = *(float *)&v52;
  v53 = 268;
  if (a7)
    v53 = 272;
  v54 = *(_DWORD *)(a4 + v53);
  v55 = *MEMORY[0x1E0C9D538];
  v56 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (objc_msgSend(v29, "maskInitialRandomOffset"))
  {
    v57 = *(_DWORD *)(a4 + 264);
    v55 = *(float *)(v39 + 4 * (v57 & 0xFFF));
    v56 = *(float *)(v39 + 4 * ((v57 + 1) & 0xFFF));
  }
  v136 = a1;
  objc_msgSend(*(id *)(a4 + 80), "_anchorPointForTexture");
  v134 = (void *)v27;
  *(float *)&v58 = v55 - v58 * v168;
  *(float *)&v59 = v56 - v59 * v168;
  HIDWORD(v58) = LODWORD(v59);
  v169 = v58;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = a3;
  v61 = v9 + 88;
  if (v9 + 88 != a3)
  {
    v62 = v51;
    v63 = v24;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 0;
    v68 = (uint64_t)&v63[-v26] >> 5;
    _D8 = 0.0;
    do
    {
      v70 = v61;
      v72 = *(double *)(v9 + 8);
      v71 = *(double *)(v9 + 16);
      v73 = sqrt((*(double *)(v9 + 104) - v71) * (*(double *)(v9 + 104) - v71)+ (*(double *)(v9 + 96) - v72) * (*(double *)(v9 + 96) - v72));
      if (v73 <= _D8)
      {
        _D8 = _D8 - v73;
      }
      else
      {
        v147 = v62;
        v141 = *(double *)(v9 + 112);
        v74 = *(double *)(v9 + 80);
        v150 = *(_QWORD *)(v9 + 72);
        v75 = *(double *)(v9 + 56);
        v76 = *(double *)(v9 + 24);
        v144 = *(double *)(v9 + 32);
        v145 = *(_QWORD *)(v9 + 40);
        v77 = fmod(v75, 6.28318531);
        if (v75 <= 6.28318531 && v75 >= 0.0)
          v77 = v75;
        if (v77 < 0.0)
          v77 = v77 + 6.28318531;
        if (v77 == 0.0)
          v79 = 0.0;
        else
          v79 = v77;
        if (a7)
          _D11 = v74;
        else
          _D11 = v76;
        _D0 = v150;
        __asm { FCVT            H0, D0 }
        if (!_ZF)
          *(float *)&_D0 = 3.3713e12;
        v151 = _D0;
        v85 = objc_msgSend(v143, "version");
        *(float *)&v87 = v72;
        v86 = v71;
        *((float *)&v87 + 1) = v86;
        __asm { FCVT            H11, D11 }
        v89 = v144;
        _D0 = v145;
        __asm { FCVT            H4, D0 }
        v92 = v79;
        __asm { FCVT            H13, D8 }
        v94 = 1.0;
        if (v74 >= 1.0)
          v95 = v74;
        else
          v95 = 1.0;
        if (v76 >= 1.0)
          v94 = v76;
        if (!a7)
          v95 = v94;
        v96 = v140 * v95;
        v62 = v147;
        if (v85 >= 3)
          v62 = v96;
        if (v138 <= 0.0)
        {
          v99 = fmax(floor((v73 - _D8) / v62), 0.0);
          v98 = v99 + 1;
          _D8 = v62 - (v73 - _D8 - v99 * v62);
        }
        else
        {
          if (v73 >= _D8)
          {
            v97 = (v141 - v76) / v73;
            do
            {
              v73 = v73 - _D8;
              v76 = v76 + v97 * _D8;
              _D8 = v62 * v76 / v138;
            }
            while (v73 >= _D8);
          }
          LOWORD(v98) = 0;
          _D8 = _D8 - v73;
        }
        v100 = v64 + 1;
        if (v67 + 4 * (unint64_t)(unsigned __int16)v98 > v68 || v100 == v68)
        {
          v101 = v26 + 32 * v64;
          v148 = v87;
          *(_QWORD *)v101 = v87;
          *(_DWORD *)(v101 + 8) = v67;
          v102 = v79;
          *(float *)(v101 + 12) = v92;
          *(float *)(v101 + 16) = v89;
          v103 = v144;
          *(_WORD *)(v101 + 20) = _H13;
          *(_WORD *)(v101 + 22) = _H11;
          v104 = _H4;
          *(_WORD *)(v101 + 24) = _H4;
          *(_WORD *)(v101 + 26) = v151;
          *(_DWORD *)(v101 + 28) = 0;
          *(_QWORD *)(v136 + 16) += 32 * v100;
          v162 = v64 + 1;
          v160 = v66;
          v105 = -[PKMetalParticleRenderCacheBuffer initWithUniforms:points:numPoints:resourceHandler:]([PKMetalParticleRenderCacheBuffer alloc], (uint64_t)&v156, v26, v100, *(void **)(v136 + 192));
          objc_msgSend(v137, "addObject:", v105);
          v165 = 0;

          v67 = 0;
          v64 = 0;
          v66 += v100;
          v87 = v148;
          _H4 = v104;
          v89 = v103;
          v92 = v102;
        }
        v106 = v26 + 32 * v64++;
        *(_QWORD *)v106 = v87;
        *(_DWORD *)(v106 + 8) = v67;
        *(float *)(v106 + 12) = v92;
        *(float *)(v106 + 16) = v89;
        *(_WORD *)(v106 + 20) = _H13;
        *(_WORD *)(v106 + 22) = _H11;
        *(_WORD *)(v106 + 24) = _H4;
        *(_WORD *)(v106 + 26) = v151;
        *(_WORD *)(v106 + 28) = v98;
        *(_WORD *)(v106 + 30) = v54;
        v107 = 4 * (unsigned __int16)v98;
        v67 += v107;
        v65 += v107;
        v54 += 3 * (unsigned __int16)v98;
        v60 = a3;
      }
      v61 = v70 + 88;
      v9 = v70;
    }
    while (v70 + 88 != v60);
    if (v64)
    {
      v108 = (uint64_t *)(v60 - 64);
      v109 = *(double *)(v60 - 56);
      _D10 = *(_QWORD *)(v60 - 48);
      v111 = *(double *)(v60 - 32);
      _D11 = *(_QWORD *)(v60 - 16);
      v113 = (uint64_t *)(v60 - 8);
      v114 = vcvt_f32_f64(*(float64x2_t *)(v60 - 80));
      v115 = fmod(v111, 6.28318531);
      if (v111 <= 6.28318531 && v111 >= 0.0)
        v115 = v111;
      if (v115 < 0.0)
        v115 = v115 + 6.28318531;
      if (v115 == 0.0)
        v115 = 0.0;
      if (a7)
        v118 = v113;
      else
        v118 = v108;
      _D1 = *v118;
      __asm { FCVT            H1, D1 }
      v121 = v109;
      __asm { FCVT            H3, D10 }
      v124 = v115;
      v123 = (float32x2_t *)(v26 + 32 * v64);
      *v123 = v114;
      v123[1].i32[0] = v67;
      __asm { FCVT            H4, D11 }
      v123[1].f32[1] = v124;
      v123[2].f32[0] = v121;
      v123[2].i16[2] = 0;
      LOWORD(v124) = 15360;
      if (_ZF)
        v124 = _S4;
      v123[2].i16[3] = _H1;
      v123[3].i16[0] = _H3;
      v123[3].i16[1] = LOWORD(v124);
      v123[3].i32[1] = 0;
      v125 = 4;
      if (a5)
        v125 = 8;
      if (a6 && v65 >= v125)
        v166 = 1;
      v160 = v66;
      v162 = v64 + 1;
      v126 = -[PKMetalParticleRenderCacheBuffer initWithUniforms:points:numPoints:resourceHandler:]([PKMetalParticleRenderCacheBuffer alloc], (uint64_t)&v156, v26, v64 + 1, *(void **)(v136 + 192));
      objc_msgSend(v137, "addObject:", v126);
      *(_QWORD *)(v136 + 16) += 32 * (v64 + 1);

    }
  }
  v7 = -[PKMetalParticleRenderCache initWithDevice:ink:renderZoomFactor:]((id *)[PKMetalParticleRenderCache alloc], *(_QWORD *)(v136 + 24), v143, v134);
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v127 = v137;
  v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v152, v170, 16);
  if (v128)
  {
    v129 = *(_QWORD *)v153;
    do
    {
      for (i = 0; i != v128; ++i)
      {
        if (*(_QWORD *)v153 != v129)
          objc_enumerationMutation(v127);
        -[PKMetalParticleRenderCache addBuffer:]((uint64_t)v7, *(void **)(*((_QWORD *)&v152 + 1) + 8 * i));
      }
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v152, v170, 16);
    }
    while (v128);
  }

  return v7;
}

- (PKMetalStrokeRenderCache)generateCacheForStroke:(unint64_t)a3 points:(unint64_t)a4 segmentSteps:(_QWORD *)a5
{
  PKMetalStrokeRenderCache *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v11;
  void *v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  size_t v40;
  char *v41;
  __int128 v42;
  int v43;
  char v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  int v54;
  PKMetalStrokeRenderCache *v55;
  void *v56;
  PKMetalStrokeRenderCache *v57;
  void **v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  PKMetalStrokeRenderCache *v64;
  PKMetalStrokeRenderCache *v65;
  void *v66;
  PKMetalStrokeRenderCache *v67;
  void *v68;
  void *v69;
  PKMetalStrokeRenderCache *v70;
  size_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  int v77;
  long double v78;
  float32x2_t v80;
  float v81;
  int v82;
  uint64_t v90;
  float32x2_t *v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  float32x2_t *v96;
  long double v97;
  float32x2_t v99;
  float v100;
  uint64_t v105;
  float32x2_t *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i;
  uint64_t v111;
  void *v112;
  void *v113;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void (**v118)(void);
  id v119;
  void *v120;
  unint64_t v121;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 aBlock;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD v141[6];
  int v142;
  int v143;
  _BYTE v144[128];
  uint64_t v145;

  v5 = 0;
  v145 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = a4;
    v7 = a3;
    v8 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(a4 - a3) >> 3);
    if (v8 >= 2)
    {
      v11 = *(id *)(a2 + 80);
      objc_msgSend(v11, "ink");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "behavior");
      v13 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13[9];

        if (v14)
        {
          v5 = 0;
LABEL_102:

          return v5;
        }
      }
      else
      {

      }
      v15 = *(_QWORD *)(a2 + 248);
      v16 = *(_QWORD *)(a2 + 256);
      v17 = *(_QWORD *)(a2 + 268);
      v119 = v11;
      objc_msgSend(v11, "ink");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "behavior");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "renderingDescriptor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "type");

      if (!v21)
      {
        {
          v121 = v6;
          v141[0] = 0;
          v141[1] = v141;
          v141[2] = 0x3812000000;
          v141[3] = __Block_byref_object_copy__85;
          v141[4] = __Block_byref_object_dispose__86;
          v141[5] = "";
          v142 = 0;
          v143 = v8;
          v137 = 0;
          v138 = &v137;
          v139 = 0x2020000000;
          v140 = 0;
          v133 = 0;
          v134 = &v133;
          v135 = 0x2020000000;
          v136 = 0;
          v28 = a1;
          v117 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80));
          v29 = *(char **)(a1 + 552);
          v30 = *(char **)(a1 + 544);
          v31 = (char *)(v29 - v30);
          v32 = 0xAAAAAAAAAAAAAAABLL * ((v29 - v30) >> 3);
          if (v32 >> 16)
          {
            v41 = *(char **)(a1 + 552);
            if (v31 != (char *)1572864)
            {
              v41 = v30 + 1572864;
              *(_QWORD *)(a1 + 552) = v30 + 1572864;
            }
          }
          else
          {
            v33 = *(_QWORD *)(a1 + 560);
            if (0xAAAAAAAAAAAAAAABLL * ((v33 - (uint64_t)v29) >> 3) >= 0x10000 - v32)
            {
              v71 = 1572840 - (_QWORD)v31 - (1572840 - (int)v31) % 0x18u + 24;
              bzero(*(void **)(a1 + 552), v71);
              v41 = &v29[v71];
              *(_QWORD *)(a1 + 552) = &v29[v71];
            }
            else
            {
              v34 = 0xAAAAAAAAAAAAAAABLL * ((v33 - (uint64_t)v30) >> 3);
              v35 = 0x5555555555555556 * ((v33 - (uint64_t)v30) >> 3);
              if (v35 <= 0x10000)
                v35 = 0x10000;
              if (v34 >= 0x555555555555555)
                v36 = 0xAAAAAAAAAAAAAAALL;
              else
                v36 = v35;
              if (v36 > 0xAAAAAAAAAAAAAAALL)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v37 = (char *)operator new(24 * v36);
              v38 = &v37[8 * ((v29 - v30) >> 3)];
              v39 = &v37[24 * v36];
              v40 = 1572840 - (_QWORD)v31 - (1572840 - (int)v31) % 0x18u + 24;
              bzero(v38, v40);
              v41 = &v38[v40];
              if (v29 != v30)
              {
                do
                {
                  v42 = *(_OWORD *)(v29 - 24);
                  *((_QWORD *)v38 - 1) = *((_QWORD *)v29 - 1);
                  *(_OWORD *)(v38 - 24) = v42;
                  v38 -= 24;
                  v29 -= 24;
                }
                while (v29 != v30);
                v29 = v30;
              }
              v28 = a1;
              *(_QWORD *)(a1 + 544) = v38;
              *(_QWORD *)(a1 + 552) = v41;
              *(_QWORD *)(a1 + 560) = v39;
              v6 = v121;
              if (v29)
              {
                operator delete(v29);
                v41 = *(char **)(a1 + 552);
              }
            }
          }
          v72 = *(_QWORD *)(v28 + 544);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
          *((_QWORD *)&aBlock + 1) = 3221225472;
          *(_QWORD *)&v128 = __77__PKMetalRenderer_generateSDFPenCacheForStroke_animatingStroke_segmentSteps___block_invoke;
          *((_QWORD *)&v128 + 1) = &unk_1E777B158;
          *((_QWORD *)&v130 + 1) = &v137;
          v131 = &v133;
          v132 = v72;
          *(_QWORD *)&v130 = v141;
          *(_QWORD *)&v129 = v28;
          v74 = v73;
          *((_QWORD *)&v129 + 1) = v74;
          v118 = (void (**)(void))_Block_copy(&aBlock);
          v116 = v17;
          if (v7 + 88 != v6)
          {
            v115 = v74;
            v75 = 0;
            v76 = 0;
            do
            {
              if (v76 >= (uint64_t)(a5[1] - *a5) >> 2)
                v77 = 8;
              else
                v77 = *(_DWORD *)(*a5 + 4 * v76);
              v78 = *(double *)(v7 + v75 + 56);
              _D10 = *(_QWORD *)(v7 + v75 + 80);
              v80 = vcvt_f32_f64(*(float64x2_t *)(v7 + v75 + 8));
              v81 = *(double *)(v7 + v75 + 24);
              v82 = (unsigned __int16)v77 | ((unsigned __int16)*((_DWORD *)v134 + 6) << 16);
              _D0 = fmod(v78, 6.28318531);
              if (v78 <= 6.28318531 && v78 >= 0.0)
                _D0 = v78;
              if (_D0 < 0.0)
                _D0 = _D0 + 6.28318531;
              if (_D0 == 0.0)
                _D0 = 0.0;
              __asm
              {
                FCVT            H9, D0
                FCVT            H10, D10
              }
              v90 = v138[3];
              v138[3] = v90 + 1;
              v91 = (float32x2_t *)(v72 + 24 * v90);
              *v91 = v80;
              v91[1].f32[0] = v81;
              v91[1].i16[2] = _H9;
              v91[1].i16[3] = _H10;
              v91[2].i32[0] = v82;
              v92 = v134;
              v93 = v134[3];
              if (v93 + 4 * v77 > 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v41[-v72] >> 3))
              {
                v118[2]();
                v94 = v138;
                v138[3] = 0;
                v134[3] = 0;
                v95 = v94[3];
                v94[3] = v95 + 1;
                v96 = (float32x2_t *)(v72 + 24 * v95);
                *v96 = v80;
                v96[1].f32[0] = v81;
                v96[1].i16[2] = _H9;
                v96[1].i16[3] = _H10;
                v96[2].i32[0] = (unsigned __int16)v77;
                v92 = v134;
                v93 = v134[3];
              }
              if (!v75)
              {
                v93 += 4;
                v92[3] = v93;
              }
              v92[3] = v93 + 4 * v77;
              ++v76;
              v75 += 88;
            }
            while (v7 + v75 + 88 != v121);
            v7 += v75;
            v74 = v115;
          }
          v97 = *(double *)(v7 + 56);
          _D10 = *(_QWORD *)(v7 + 80);
          v99 = vcvt_f32_f64(*(float64x2_t *)(v7 + 8));
          v100 = *(double *)(v7 + 24);
          _D0 = fmod(v97, 6.28318531);
          if (v97 <= 6.28318531 && v97 >= 0.0)
            _D0 = v97;
          if (_D0 < 0.0)
            _D0 = _D0 + 6.28318531;
          if (_D0 == 0.0)
            _D0 = 0.0;
          __asm
          {
            FCVT            H0, D0
            FCVT            H1, D10
          }
          v105 = v138[3];
          v138[3] = v105 + 1;
          v106 = (float32x2_t *)(v72 + 24 * v105);
          *v106 = v99;
          v106[1].f32[0] = v100;
          v106[1].i16[2] = _H0;
          v106[1].i16[3] = _H1;
          v118[2]();
          v5 = (PKMetalStrokeRenderCache *)-[PKMetalSDFPenRenderCache initWithPurgeableBuffers:renderZoomFactor:]([PKMetalSDFPenRenderCache alloc], 1, v117);
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v107 = v74;
          v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
          v17 = v116;
          if (v108)
          {
            v109 = *(_QWORD *)v124;
            do
            {
              for (i = 0; i != v108; ++i)
              {
                if (*(_QWORD *)v124 != v109)
                  objc_enumerationMutation(v107);
                -[PKMetalSDFPenRenderCache addBuffer:]((uint64_t)v5, *(void **)(*((_QWORD *)&v123 + 1) + 8 * i));
              }
              v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
            }
            while (v108);
          }

          _Block_object_dispose(&v133, 8);
          _Block_object_dispose(&v137, 8);
          _Block_object_dispose(v141, 8);
          v11 = v119;
        }
        else if (-[PKMetalRenderer generateBSplineInComputeForStroke:](a1, v11))
        {
          -[PKMetalRenderer generatePaintCacheForStroke:animatingStroke:segmentSteps:liveStrokePoints:liveStrokeStartTime:duration:](a1, v7, v6, a2, a5, 0, 0.0, 0.0);
          v5 = (PKMetalStrokeRenderCache *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = [PKMetalStrokeRenderCache alloc];
          objc_msgSend(*(id *)(a2 + 80), "ink");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](v65, "initWithInk:renderZoomFactor:", v66, -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80)));

          objc_storeStrong((id *)(a2 + 88), v67);
          -[PKMetalRenderer renderPenStroke:animatingStroke:renderEncoder:]((_OWORD *)a1, v7, v6, a2, 0);
          v68 = *(void **)(a2 + 88);
          *(_QWORD *)(a2 + 88) = 0;

          -[PKMetalStrokeRenderCache buffers](v67, "buffers");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v69, "count"))
            v70 = v67;
          else
            v70 = 0;
          v5 = v70;

        }
        goto LABEL_98;
      }
      v22 = *(unsigned __int8 *)(a2 + 336);
      objc_msgSend(*(id *)(a2 + 80), "ink");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "behavior");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "particleDescriptor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v120 = v25;
      if (objc_msgSend(v25, "adjustEndCapParticleAlpha"))
      {
        v26 = *(_QWORD *)(a2 + 168);
        if (v26 <= *(_QWORD *)(a2 + 160))
          v26 = *(_QWORD *)(a2 + 160);
        v27 = v26 == 0;
      }
      else
      {
        v27 = 0;
      }
      v43 = objc_msgSend(v25, "adjustEndCapParticleAlpha");
      v44 = v43 ^ 1;
      if (!v22)
        v44 = 1;
      if ((v44 & 1) == 0)
      {
        if (*(_BYTE *)(a2 + 176))
          v43 = 0;
        else
          v43 = *(_QWORD *)(*(_QWORD *)(a2 + 96) + 88) == v6;
      }
      if (v8 >= 0x29 && *(_BYTE *)(a1 + 713))
      {
        v45 = v27;
        -[PKMetalRenderer generateParticleCacheForStroke:animatingStroke:starts:ends:secondaryParticles:](a1, v7, v6, a2, v27, v43, 0);
        v5 = (PKMetalStrokeRenderCache *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a2 + 80), "ink");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v119;
        objc_msgSend(v46, "behavior");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "secondaryParticleDescriptor");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v48)
        {
LABEL_53:

LABEL_98:
          if (v5)
          {
            v111 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v11);
            -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a2 + 80), "_strokeDataUUID");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKLRUCache setObject:forKey:cost:scaleFactor:]((uint64_t)v112, v5, v113, -[PKMetalStrokeRenderCache cacheCost](v5, "cacheCost"), v111);

            v11 = v119;
          }
          if (!*(_BYTE *)(a2 + 72))
          {
            *(_QWORD *)(a2 + 248) = v15;
            *(_QWORD *)(a2 + 256) = v16;
            *(_QWORD *)(a2 + 268) = v17;
          }
          goto LABEL_102;
        }
        -[PKMetalRenderer generateParticleCacheForStroke:animatingStroke:starts:ends:secondaryParticles:](a1, v7, v6, a2, v45, v43, 1);
        v49 = (id *)objc_claimAutoreleasedReturnValue();
        v129 = 0u;
        v130 = 0u;
        aBlock = 0u;
        v128 = 0u;
        -[PKMetalSDFPenRenderCache buffers](v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &aBlock, v144, 16);
        if (v51)
        {
          v52 = *(_QWORD *)v128;
          do
          {
            for (j = 0; j != v51; ++j)
            {
              if (*(_QWORD *)v128 != v52)
                objc_enumerationMutation(v50);
              -[PKMetalParticleRenderCache addSecondaryBuffer:]((uint64_t)v5, *(void **)(*((_QWORD *)&aBlock + 1) + 8 * j));
            }
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &aBlock, v144, 16);
          }
          while (v51);
        }

      }
      else
      {
        v54 = v27;
        v55 = [PKMetalStrokeRenderCache alloc];
        objc_msgSend(*(id *)(a2 + 80), "ink");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](v55, "initWithInk:renderZoomFactor:", v56, -[PKMetalRenderer renderZoomFactorForStroke:](a1, *(void **)(a2 + 80)));

        v58 = (void **)(a2 + 88);
        objc_storeStrong((id *)(a2 + 88), v57);
        -[PKMetalRenderer renderParticleStroke:animatingStroke:starts:ends:secondaryParticles:renderEncoder:](a1, v7, v6, a2, v27, v43, 0, 0);
        objc_msgSend(*(id *)(a2 + 80), "ink");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "behavior");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "secondaryParticleDescriptor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
          -[PKMetalRenderer renderParticleStroke:animatingStroke:starts:ends:secondaryParticles:renderEncoder:](a1, v7, v6, a2, v54, v43, 1, 0);
        v62 = *v58;
        *v58 = 0;

        -[PKMetalStrokeRenderCache buffers](v57, "buffers");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v63, "count"))
          v64 = v57;
        else
          v64 = 0;
        v5 = v64;

      }
      v11 = v119;
      goto LABEL_53;
    }
  }
  return v5;
}

- (void)setupRenderState:(int)a3 needCompute:(int)a4 clearPaint:
{
  id *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _BYTE *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id *v38;
  _QWORD v39[8];
  __int16 v40;
  uint64_t v41;

  v7 = a2;
  v38 = v7;
  if (a3)
  {
    -[PKMetalRenderState computeCommandBufferCreateIfNecessary](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v38 ? v38[11] : 0;
      v10 = v9;

      if (!v10)
      {
        objc_msgSend(v8, "computeCommandEncoder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderState setComputeEncoder:]((uint64_t)v38, v11);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = 0;
LABEL_9:
  -[PKMetalRenderState commandBufferCreateIfNecessary](v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    v14 = 0;
    v15 = (_BYTE *)(a1 + 72);
    if (*(_BYTE *)(a1 + 72))
      v16 = 2;
    else
      v16 = 1;
    if (a4)
      v17 = 2;
    else
      v17 = 1;
    goto LABEL_37;
  }
  v13 = v38[10];
  if (!v13)
  {
    v14 = (uint64_t)v38[18];
    v15 = (_BYTE *)(a1 + 72);
    if (*(_BYTE *)(a1 + 72))
      v16 = 2;
    else
      v16 = 1;
    if (a4)
      v17 = 2;
    else
      v17 = 1;
    if (*((_BYTE *)v38 + 43))
    {
      v36 = v11;
      v37 = v8;
      v35 = v12;
      v18 = v38;
      objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 >= 1)
      {
        v20 = 0;
        v21 = a1 + 112;
        do
        {
          objc_msgSend(v19, "colorAttachments", v35);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = *(_QWORD **)v21;
          if (*(_QWORD *)v21)
            v24 = (_QWORD *)v24[3];
          v25 = v24;
          objc_msgSend(v23, "setTexture:", v25);

          -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v18, *(void **)v21);
          objc_msgSend(v23, "setLoadAction:", 2);
          objc_msgSend(v23, "setStoreAction:", 0);
          objc_msgSend(v23, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
          *(_BYTE *)(v21 + 9) = 0;

          ++v20;
          v21 += 16;
        }
        while (v14 != v20);
        v26 = 0;
        v27 = (_BYTE *)(a1 + 153);
        do
        {
          objc_msgSend(v19, "colorAttachments");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", v14 + v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = *(_QWORD **)(v27 - 9);
          if (v30)
            v30 = (_QWORD *)v30[3];
          v31 = v30;
          objc_msgSend(v29, "setTexture:", v31);

          -[PKMetalRenderState addPurgeableFramebuffer:]((uint64_t)v18, *(void **)(v27 - 9));
          if (*v27)
            v32 = 2;
          else
            v32 = v17;
          objc_msgSend(v29, "setLoadAction:", v32);
          objc_msgSend(v29, "setStoreAction:", 1);
          objc_msgSend(v29, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
          *v27 = 0;
          v27 += 16;

          ++v26;
        }
        while (v14 != v26);
      }
      v33 = v35;
      objc_msgSend(v35, "renderCommandEncoderWithDescriptor:", v19, v35);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v36;
      v8 = v37;
      goto LABEL_38;
    }
LABEL_37:
    v39[0] = 0;
    v39[1] = 0;
    v39[2] = v16;
    v39[3] = 1;
    v39[4] = v17;
    memset(&v39[5], 0, 24);
    v40 = 0;
    v41 = v14;
    -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v12, (uint64_t)v39, v38);
    v34 = objc_claimAutoreleasedReturnValue();
    *v15 = 0;
    v13 = (id)v34;
LABEL_38:
    -[PKMetalRenderState setRenderEncoder:]((uint64_t)v38, v13);
  }

}

uint64_t __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  -[PKMetalRenderState commitAndPurgeResourceSet:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(_QWORD *)(v3 + 48);
  if (*(_QWORD *)(v3 + 56) != v4)
    *(_QWORD *)(v3 + 56) = v4;
  return result;
}

void __85__PKMetalRenderer__renderStrokes_clippedToStrokeSpaceRect_strokeTransform_stopBlock___block_invoke_2(double *a1, void *a2)
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  void *v57;
  _QWORD *v58;
  _QWORD *v59;
  void *v60;
  id v61;
  double *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  _QWORD *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  __int128 v75;
  _QWORD *v76;
  _QWORD *v77;
  int v78;
  id v79;
  uint64_t v80;
  float64x2_t v81;
  _QWORD v82[2];
  uint64x2_t v83;
  __int128 v84;
  char v85;
  char v86;
  _BYTE v87[14];
  int v88;
  __int16 v89;
  __int16 v90;

  v79 = a2;
  v3 = *(double **)(*((_QWORD *)a1 + 7) + 8);
  v4 = v3[6];
  v5 = v3[7];
  v6 = v3[8];
  v7 = v3[9];
  v8 = a1[8];
  v9 = a1[9];
  v11 = a1[10];
  v10 = a1[11];
  v13 = *((_QWORD *)a1 + 4);
  v12 = (_QWORD *)*((_QWORD *)a1 + 5);
  if (v12)
    v12 = (_QWORD *)v12[10];
  v14 = v12;
  v15 = -[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](v13, v14, 0, v4, v5, v6, v7, v8, v9, v11, v10);

  if (v15)
  {
    objc_msgSend(v79, "_strokeMask");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      LODWORD(v17) = 1;
    }
    else
    {
      objc_msgSend(v79, "_renderMask");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = v18 != 0;

    }
    v19 = *((_QWORD *)a1 + 5);
    if (v19)
      objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v19 + 80));
    v20 = 0;
    v80 = 112;
    v78 = v17;
    while (1)
    {
      v21 = *((_QWORD *)a1 + 5);
      if (v21)
        v22 = *(_QWORD *)(v21 + 144);
      else
        v22 = 0;
      if (v20 >= v22)
      {
        if ((v17 & 1) != 0)
        {
          if (v21)
            v60 = *(void **)(v21 + 96);
          else
            v60 = 0;
          v61 = v60;

          if (v61)
          {
            v62 = *(double **)(*((_QWORD *)a1 + 7) + 8);
            v63 = v62[6];
            v64 = v62[7];
            v65 = v62[8];
            v66 = v62[9];
            v67 = a1[8];
            v68 = a1[9];
            v70 = a1[10];
            v69 = a1[11];
            v72 = *((_QWORD *)a1 + 4);
            v71 = (_QWORD *)*((_QWORD *)a1 + 5);
            if (v71)
              v71 = (_QWORD *)v71[12];
            v73 = v71;
            -[PKMetalRenderer setupClippingForStrokeClipRect:clippedToPixelSpaceRect:renderEncoder:outNewClipRect:](v72, v73, 0, v63, v64, v65, v66, v67, v68, v70, v69);

          }
          (*(void (**)(void))(*((_QWORD *)a1 + 6) + 16))();
        }
        break;
      }
      v23 = *((_QWORD *)a1 + 4);
      if (v23)
      {
        v24 = *(_QWORD *)(v23 + 8);
        if (v24)
        {
          v25 = -[PKMetalRenderState pipelineConfig](v24);
          if (!v21)
            goto LABEL_50;
        }
        else
        {
          v25 = *(unsigned int *)(v23 + 784) | ((unint64_t)*(unsigned __int16 *)(v23 + 788) << 32);
          if (!v21)
            goto LABEL_50;
        }
      }
      else
      {
        v25 = 0;
        if (!v21)
        {
LABEL_50:
          LODWORD(v26) = 0;
          goto LABEL_17;
        }
      }
      v26 = *(_QWORD *)(v21 + 144);
LABEL_17:
      v27 = *(_QWORD *)(v23 + 192);
      if (v27 && *(_BYTE *)(v27 + 428))
      {
        v28 = 0;
        v29 = v20;
        v17 = 13;
        if (v20)
          goto LABEL_20;
      }
      else
      {
        v33 = *(_QWORD **)(v23 + v80);
        if (v33)
          v33 = (_QWORD *)v33[3];
        v28 = v33;
        v29 = 0;
        v17 = 7;
        if (v20)
        {
LABEL_20:
          objc_msgSend(v79, "ink");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "behavior");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "secondaryParticleDescriptor");
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
      objc_msgSend(v79, "ink");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "behavior");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "particleDescriptor");
      v32 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v34 = (void *)v32;

      v35 = objc_msgSend(v34, "particleBlendMode");
      v36 = *(_QWORD *)(*((_QWORD *)a1 + 4) + 192);
      *(_QWORD *)&v84 = v17;
      DWORD2(v84) = v26 + v20;
      HIDWORD(v84) = v29;
      v85 = 0;
      LOBYTE(v17) = v78;
      v86 = v78;
      memset(v87, 0, sizeof(v87));
      v88 = v25;
      v89 = WORD2(v25);
      v90 = 0;
      -[PKMetalResourceHandler namedShaderForKey:](v36, &v84);
      v37 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v35)
        v39 = 1;
      else
        v39 = 3;
      -[PKMetalShader shaderWithBlendMode:](v37, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (_QWORD *)*((_QWORD *)a1 + 5);
      if (v41)
        v41 = (_QWORD *)v41[10];
      v42 = *((_QWORD *)a1 + 4);
      v43 = v41;
      -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](v42, v43);

      if (v78)
      {
        v44 = (_QWORD *)*((_QWORD *)a1 + 5);
        if (v44)
          v44 = (_QWORD *)v44[10];
        v45 = v44;
        v46 = *(_QWORD **)(*((_QWORD *)a1 + 4) + 176);
        if (v46)
          v46 = (_QWORD *)v46[3];
        v47 = v46;
        objc_msgSend(v45, "setFragmentTexture:atIndex:", v47, 1);

      }
      if (v28)
      {
        v48 = (_QWORD *)*((_QWORD *)a1 + 5);
        if (v48)
          v48 = (_QWORD *)v48[10];
        v49 = v48;
        objc_msgSend(v49, "setFragmentTexture:atIndex:", v28, 0);

      }
      v51 = *((_QWORD *)a1 + 4);
      v50 = (_QWORD *)*((_QWORD *)a1 + 5);
      if (v50)
        v50 = (_QWORD *)v50[10];
      v52 = v50;
      -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](v51, v40, v52);

      if ((v78 & 1) == 0)
      {
        v53 = (_QWORD *)*((_QWORD *)a1 + 5);
        if (v53)
          v53 = (_QWORD *)v53[10];
        v54 = *((_QWORD *)a1 + 4);
        v55 = v53;
        -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](v54, v55);

        v56 = (_QWORD *)*((_QWORD *)a1 + 4);
        -[PKMetalRenderer eraseShaderForAttachmentIndex:](v56, v20);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (_QWORD *)*((_QWORD *)a1 + 5);
        if (v58)
          v58 = (_QWORD *)v58[10];
        v59 = v58;
        -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:]((uint64_t)v56, v57, v59);

      }
      ++v20;
      v80 += 16;
    }
  }
  v74 = *(_QWORD *)(*((_QWORD *)a1 + 7) + 8);
  v75 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v74 + 48) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v74 + 64) = v75;
  v76 = (_QWORD *)*((_QWORD *)a1 + 5);
  v81 = *(float64x2_t *)(*((_QWORD *)a1 + 4) + 224);
  if (v76)
    v76 = (_QWORD *)v76[10];
  v77 = v76;
  v82[0] = 0;
  v82[1] = 0;
  v83 = vcvtq_u64_f64(v81);
  objc_msgSend(v77, "setScissorRect:", v82);

}

- (uint64_t)clearAndRenderStrokes:(_OWORD *)a3 clippedToStrokeSpaceRect:(void *)a4 strokeTransform:(CGFloat)a5 stopBlock:(CGFloat)a6
{
  id v15;
  id v16;
  BOOL IsNull;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v34[3];
  _OWORD v35[3];
  _OWORD v36[3];
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  v45 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = a4;
  if (!a1)
  {
    v32 = 0;
    goto LABEL_17;
  }
  v46.origin.x = a5;
  v46.origin.y = a6;
  v46.size.width = a7;
  v46.size.height = a8;
  IsNull = CGRectIsNull(v46);
  v18 = os_log_create("com.apple.pencilkit", "Sketching");
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (IsNull)
  {
    if (!v19)
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v20 = "Metal Render not clipped to rect";
    v21 = v18;
    v22 = 2;
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    *(_DWORD *)buf = 67109888;
    v38 = (int)a5;
    v39 = 1024;
    v40 = (int)a6;
    v41 = 1024;
    v42 = (int)a7;
    v43 = 1024;
    v44 = (int)a7;
    v20 = "Metal Render clippedToRect %d %d %d %d";
    v21 = v18;
    v22 = 26;
  }
  _os_log_debug_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
LABEL_6:

  v47.origin.x = a5;
  v47.origin.y = a6;
  v47.size.width = a7;
  v47.size.height = a8;
  if (!CGRectIsNull(v47))
  {
    v29 = *(unsigned __int8 *)(a1 + 72);
    -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v15);
    if (!v29)
    {
      v30 = a3[1];
      v36[0] = *a3;
      v36[1] = v30;
      v36[2] = a3[2];
      -[PKMetalRenderer clearNowWithStrokeSpaceClipRect:strokeTransform:](a1, v36, a5, a6, a7, a8);
    }
    if (objc_msgSend(v15, "count"))
    {
      v31 = a3[1];
      v35[0] = *a3;
      v35[1] = v31;
      v35[2] = a3[2];
      v28 = -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v35, v16, a5, a6, a7, a8);
      goto LABEL_13;
    }
    -[PKMetalRenderer finishRendering](a1);
LABEL_15:
    v32 = 0;
    goto LABEL_16;
  }
  -[PKMetalRenderer finishRendering](a1);
  *(_BYTE *)(a1 + 72) = 1;
  if (!objc_msgSend(v15, "count"))
    goto LABEL_15;
  -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v15);
  v23 = *MEMORY[0x1E0C9D628];
  v24 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v27 = a3[1];
  v34[0] = *a3;
  v34[1] = v27;
  v34[2] = a3[2];
  v28 = -[PKMetalRenderer _renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v15, v34, v16, v23, v24, v25, v26);
LABEL_13:
  v32 = v28;
LABEL_16:
  -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  -[PKMetalRenderer purgePaintFramebuffers](a1);
LABEL_17:

  return v32;
}

- (void)clearNowWithStrokeSpaceClipRect:(CGFloat)a3 strokeTransform:(CGFloat)a4
{
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  id v16;
  __int128 v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id *v23;
  _OWORD v24[3];
  _QWORD v25[2];
  int64x2_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  __int16 v37;
  __int16 v38;
  CGRect v39;

  v12 = (id *)(a1 + 8);
  v13 = (id *)*(id *)(a1 + 8);
  v23 = v13;
  if (!v13)
  {
    v14 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32));
    objc_storeStrong(v12, v14);
    v23 = v14;
    -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
  }
  -[PKMetalRenderState commandBufferCreateIfNecessary](v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23 || (v16 = v23[10]) == 0)
  {
    v31 = 0;
    v29 = 0;
    v30 = 0;
    v25[0] = 0;
    v25[1] = 0;
    v26 = vdupq_n_s64(1uLL);
    v27 = 2;
    v28 = 0;
    v32 = 1;
    -[PKMetalRenderer renderCommandEncoderForCommandBuffer:renderStateConfig:renderState:](a1, v15, (uint64_t)v25, v23);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderState setRenderEncoder:]((uint64_t)v23, v16);
  }
  v39.origin.x = a3;
  v39.origin.y = a4;
  v39.size.width = a5;
  v39.size.height = a6;
  if (CGRectIsNull(v39)
    || (v17 = a2[1],
        v24[0] = *a2,
        v24[1] = v17,
        v24[2] = a2[2],
        (-[PKMetalRenderer applyStrokeSpaceClipRect:strokeTransform:](a1, v24, a3, a4, a5, a6) & 1) != 0))
  {
    if (*v12)
      v18 = -[PKMetalRenderState pipelineConfig]((uint64_t)*v12);
    else
      v18 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
    v19 = *(_QWORD *)(a1 + 192);
    v33 = 0xBuLL;
    v34 = 0;
    v35 = 0;
    v36 = v18;
    v37 = WORD2(v18);
    v38 = 0;
    -[PKMetalResourceHandler namedShaderForKey:](v19, &v33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v16);
    if (v23)
      v21 = v23[10];
    else
      v21 = 0;
    v22 = v21;
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v20, v22);

  }
  if (v13)
  {
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v16);
  }
  else
  {
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    -[PKMetalRenderer teardownDrawingFramebuffers]((_QWORD *)a1);
  }

}

- (void)updateTile:(void *)a3 strokes:(uint64_t)a4 clear:(char)a5 waitUntilCompleted:(uint64_t)a6 offscreen:(void *)a7 stopBlock:
{
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  CGFloat v21;
  unint64_t v22;
  CGFloat v23;
  id v24;
  double v25;
  double v26;
  BOOL v27;
  _BYTE **v28;
  char v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  PKMetalRenderer *v45;
  void *v46;
  int v47;
  id v48;
  id v49;
  void *v50;
  id *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  CGFloat y;
  double v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  double v113;
  CGFloat v114;
  CGFloat v115;
  CGFloat v116;
  double v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  id *v124;
  _QWORD *v125;
  _QWORD *v126;
  _QWORD *v127;
  _QWORD *v128;
  CGFloat v129;
  double v130;
  double v131;
  void *context;
  _QWORD *contexta;
  uint64_t (**v134)(void);
  id v135;
  CGAffineTransform v136;
  CGAffineTransform v137;
  CGAffineTransform v138;
  CGAffineTransform v139;
  double v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGAffineTransform v144;
  uint64_t v145;
  __int16 v146;
  _QWORD aBlock[4];
  id v148;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v151;
  _BYTE buf[12];
  __int128 v153;
  int v154;
  int v155;
  __int16 v156;
  __int16 v157;
  uint64_t v158;
  CGSize v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;

  v158 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v135 = a3;
  v14 = a7;
  if (a1)
  {
    if (v13)
    {
      v15 = *((double *)v13 + 25);
      v16 = *((double *)v13 + 26);
      v17 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      v18 = round(v15 * v17);
      v19 = round(v16 * v17);
      memset(&v151, 0, sizeof(v151));
      CGAffineTransformMakeTranslation(&t1, -*((double *)v13 + 23), -*((double *)v13 + 24));
      *(double *)&v20 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      v21 = *(double *)&v20;
      *(double *)&v22 = COERCE_DOUBLE(atomic_load((unint64_t *)v13 + 1));
      v23 = *(double *)&v22;
    }
    else
    {
      memset(&v151, 0, sizeof(v151));
      CGAffineTransformMakeTranslation(&t1, -0.0, -0.0);
      v18 = 0.0;
      v19 = 0.0;
      v21 = 0.0;
      v23 = 0.0;
    }
    CGAffineTransformMakeScale(&t2, v21, v23);
    CGAffineTransformConcat(&v151, &t1, &t2);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKMetalRenderer_updateTile_strokes_clear_waitUntilCompleted_offscreen_stopBlock___block_invoke;
    aBlock[3] = &unk_1E777B1D0;
    v24 = v14;
    v148 = v24;
    v134 = (uint64_t (**)(void))_Block_copy(aBlock);
    v25 = *(double *)(a1 + 224);
    v26 = *(double *)(a1 + 232);
    if (!v24 && (v18 == v25 ? (v27 = v19 == v26) : (v27 = 0), v27))
    {
      *(_QWORD *)buf = *(id *)(a1 + 40);
      *(_WORD *)&buf[8] = *(_WORD *)(a1 + 48);
      v28 = (_BYTE **)(a1 + 56);
      v140 = COERCE_DOUBLE(*(id *)(a1 + 56));
      LOWORD(v141) = *(_WORD *)(a1 + 64);
      v29 = *(_BYTE *)(a1 + 72);
      -[PKMetalRenderer framebufferForTile:createIfNeeded:](a1, v13, 1);
      v145 = objc_claimAutoreleasedReturnValue();
      v146 = 0;
      v30 = *(_BYTE **)(a1 + 40);
      if (v30 && !*(_BYTE *)(a1 + 48))
        *(_BYTE *)(a1 + 48) = -[PKMetalFramebuffer incrementNonPurgeableCount](v30);
      if (*(_BYTE *)(a1 + 714))
      {
        -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v13, 1);
        v145 = objc_claimAutoreleasedReturnValue();
        v146 = 0;
        if (*v28)
        {
          if (!*(_BYTE *)(a1 + 64))
            *(_BYTE *)(a1 + 64) = -[PKMetalFramebuffer incrementNonPurgeableCount](*v28);
        }
      }
      *(_BYTE *)(a1 + 72) = a4;
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v135);
      v31 = *(_QWORD *)(a1 + 8);
      if (v31)
        *(_BYTE *)(v31 + 39) = a5;
      if (*(_BYTE *)(a1 + 714))
      {
        v32 = *(_QWORD *)(a1 + 8);
        if (v32)
          *(_QWORD *)(v32 + 128) = 2;
      }
      if (v13)
      {
        v33 = *((double *)v13 + 23);
        v34 = *((double *)v13 + 24);
        v35 = *((double *)v13 + 25);
        v36 = *((double *)v13 + 26);
      }
      else
      {
        v34 = 0.0;
        v35 = 0.0;
        v36 = 0.0;
        v33 = 0.0;
      }
      v144 = v151;
      -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v135, &v144, 0, v33, v34, v35, v36);
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
      *(_BYTE *)(a1 + 72) = v29;
      -[PKMetalRenderer purgePaintFramebuffers](a1);
    }
    else if (v25 < v18 || v26 < v19)
    {
      v38 = os_log_create("com.apple.pencilkit", ");
      v39 = v38;
      if (fabs(v18) == INFINITY || fabs(v19) == INFINITY)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1BE213000, v39, OS_LOG_TYPE_FAULT, "Tried to update a tile with a non-finite size", buf, 2u);
        }

      }
      else
      {
        v40 = v38;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromCGSize(*(CGSize *)(a1 + 224));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v159.width = v18;
          v159.height = v19;
          NSStringFromCGSize(v159);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v41;
          LOWORD(v153) = 2112;
          *(_QWORD *)((char *)&v153 + 2) = v42;
          _os_log_impl(&dword_1BE213000, v40, OS_LOG_TYPE_DEFAULT, "Created a one off tile  renderer: %@ => %@", buf, 0x16u);

        }
        v43 = *(double *)(a1 + 248);
        v44 = *(double *)(a1 + 224);
        context = (void *)MEMORY[0x1C3B7FBFC]();
        v45 = [PKMetalRenderer alloc];
        v46 = *(void **)(a1 + 192);
        v47 = *(unsigned __int8 *)(a1 + 714);
        v48 = *(id *)(a1 + 24);
        v49 = v46;
        v50 = v49;
        if (v45)
        {
          v51 = -[PKMetalRenderer initWithDrawingPixelSize:actualSize:device:resourceHandler:sixChannelBlending:pixelFormat:]((id *)&v45->super.isa, v48, v49, v47 != 0, (void *)0x50, v18, v19, v18 * (v43 / v44), v19 * (v43 / v44));

          if (v51)
            *((_BYTE *)v51 + 935) = *(_BYTE *)(a1 + 935);
        }
        else
        {

          v51 = 0;
        }
        -[PKMetalRenderer updateTile:strokes:clear:waitUntilCompleted:offscreen:stopBlock:](v51, v13, v135, a4, 1, a6, v24);

        objc_autoreleasePoolPop(context);
      }
    }
    else
    {
      -[PKMetalRenderer framebufferForTile:createIfNeeded:](a1, v13, 1);
      v52 = objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 714))
      {
        -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v13, 1);
        contexta = (_QWORD *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        contexta = 0;
      }
      *(_BYTE *)(a1 + 72) = a4;
      if (v52)
      {
        v53 = *(_OWORD *)(v52 + 88);
        v54 = *(_OWORD *)(v52 + 104);
      }
      else
      {
        v53 = 0uLL;
        v54 = 0uLL;
      }
      *(_OWORD *)(a1 + 80) = v53;
      *(_OWORD *)(a1 + 96) = v54;
      -[PKMetalRenderer setupRenderStateForRenderingStrokes:](a1, v135);
      if ((a4 & 1) == 0)
      {
        if (*(_BYTE *)(a1 + 714))
        {
          v139 = v151;
          v55 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v13, &v139, &v140);
          v57 = v56;
          v59 = v58;
          v61 = v60;
          v62 = *(_QWORD **)(a1 + 8);
          if (v62)
            v62 = (_QWORD *)v62[10];
          v63 = v62;
          -[PKMetalRenderer blitShader](a1);
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = (void *)v64;
          if (v64)
            v66 = *(void **)(v64 + 24);
          else
            v66 = 0;
          v67 = v66;
          objc_msgSend(v63, "setRenderPipelineState:", v67);

          if (v52)
            v68 = *(void **)(v52 + 24);
          else
            v68 = 0;
          v69 = v68;
          objc_msgSend(v63, "setFragmentTexture:atIndex:", v69, 0);

          v70 = -[PKMetalFramebuffer size](v52);
          v72 = v142;
          v71 = v143;
          v74 = v140;
          v73 = v141;
          -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:](v63, v55, v57, v59, v61, v140, v141, v142, v143, v70, v75, *(double *)(a1 + 224), *(double *)(a1 + 232));
          v76 = *(_QWORD *)(a1 + 8);
          if (v76)
            v77 = -[PKMetalRenderState pipelineConfig](v76);
          else
            v77 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
          v78 = *(_QWORD *)(a1 + 192);
          *(_QWORD *)buf = 7;
          v153 = 0uLL;
          *(_DWORD *)&buf[8] = 3;
          v154 = 0;
          v155 = v77;
          v156 = WORD2(v77);
          v157 = 0;
          -[PKMetalResourceHandler namedShaderForKey:](v78, (__int128 *)buf);
          v79 = objc_claimAutoreleasedReturnValue();
          v80 = (void *)v79;
          if (v79)
            v81 = *(void **)(v79 + 24);
          else
            v81 = 0;
          v82 = v81;
          objc_msgSend(v63, "setRenderPipelineState:", v82);

          v83 = contexta;
          if (contexta)
            v83 = (void *)contexta[3];
          v84 = v83;
          objc_msgSend(v63, "setFragmentTexture:atIndex:", v84, 0);

          v85 = -[PKMetalFramebuffer size](v52);
          -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:](v63, v55, v57, v59, v61, v74, v73, v72, v71, v85, v86, *(double *)(a1 + 224), *(double *)(a1 + 232));

        }
        else
        {
          v138 = v151;
          -[PKMetalRenderer renderTile:tileFramebuffer:tileTransform:renderState:shouldComposite:](a1, v13, (void *)v52, &v138, *(void **)(a1 + 8), 0);
        }
      }
      if (v13)
      {
        v87 = *((double *)v13 + 23);
        v88 = *((double *)v13 + 24);
        v89 = *((double *)v13 + 25);
        v90 = *((double *)v13 + 26);
      }
      else
      {
        v88 = 0.0;
        v89 = 0.0;
        v90 = 0.0;
        v87 = 0.0;
      }
      v137 = v151;
      -[PKMetalRenderer renderStrokes:clippedToStrokeSpaceRect:strokeTransform:stopBlock:](a1, v135, &v137, v24, v87, v88, v89, v90);
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
      if ((v134[2]() & 1) == 0)
      {
        if (v13)
        {
          v91 = *((_QWORD *)v13 + 23);
          v92 = *((_QWORD *)v13 + 24);
          v93 = *((_QWORD *)v13 + 25);
          v94 = *((_QWORD *)v13 + 26);
        }
        else
        {
          v92 = 0;
          v93 = 0;
          v94 = 0;
          v91 = 0;
        }
        v136 = v151;
        v160 = CGRectApplyAffineTransform(*(CGRect *)&v91, &v136);
        x = v160.origin.x;
        width = v160.size.width;
        height = v160.size.height;
        v162.size.width = *(CGFloat *)(a1 + 224);
        v162.size.height = *(CGFloat *)(a1 + 232);
        v162.origin.x = 0.0;
        v162.origin.y = 0.0;
        y = v160.origin.y;
        v161 = CGRectIntersection(v160, v162);
        v99 = v161.origin.x;
        v100 = v161.origin.y;
        v101 = v161.size.width;
        v102 = v161.size.height;
        v103 = -[PKMetalFramebuffer size](v52);
        v130 = v104;
        v131 = v103;
        v105 = DKDRoundedRectForScale(v99, v100, v101, v102, 1.0);
        v129 = x;
        DKDNormalizedSubrectInRect(v105, v106, v107, v108);
        DKDRectFromNormalizedSubrect(0.0, 0.0, v131, v130, v109, v110, v111, v112);
        v117 = DKDRoundedRectForScale(v113, v114, v115, v116, 1.0);
        v119 = v118;
        v121 = v120;
        v123 = v122;
        v124 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32));
        if (*(_BYTE *)(a1 + 714))
        {
          v125 = *(_QWORD **)(a1 + 56);
          if (v125)
            v125 = (_QWORD *)v125[3];
          v126 = v125;
          -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v126, contexta, v124, 0, v129, y, width, height, v117, v119, v121, v123);

        }
        if (v124)
          *((_BYTE *)v124 + 39) = a5;
        v127 = *(_QWORD **)(a1 + 40);
        if (v127)
          v127 = (_QWORD *)v127[3];
        v128 = v127;
        -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v128, (void *)v52, v124, 0, v129, y, width, height, v117, v119, v121, v123);

        if (v124)
          -[PKMetalRenderState commitAndPurgeResourceSet:]((uint64_t)v124, 0);

      }
      -[PKMetalRenderer purgePaintFramebuffers](a1);
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 96) = 0u;
      *(_BYTE *)(a1 + 72) = 1;

    }
  }

}

uint64_t __83__PKMetalRenderer_updateTile_strokes_clear_waitUntilCompleted_offscreen_stopBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (_QWORD)framebufferForTile:(char)a3 createIfNeeded:
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v5 = a2;
  -[PKRendererTile framebuffer]((uint64_t)v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[PKRendererTileController sharedController]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 944);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PKMetalRenderer_framebufferForTile_createIfNeeded___block_invoke;
    v11[3] = &unk_1E777B1F8;
    v11[4] = a1;
    -[PKRendererTileController framebufferForTile:createIfNeeded:device:pixelFormat:clearFramebufferBlock:]((uint64_t)v7, v5, a3, v8, v9, v11);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 714))
    {
      if (v6)
        v6[8] = 6;
    }
  }

  return v6;
}

- (_QWORD)multiplyFramebufferForTile:(char)a3 createIfNeeded:
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];

  v5 = a2;
  -[PKRendererTile multiplyFramebuffer]((uint64_t)v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_3;
  +[PKRendererTileController sharedController]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 944);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PKMetalRenderer_multiplyFramebufferForTile_createIfNeeded___block_invoke;
  v11[3] = &unk_1E777B1F8;
  v11[4] = a1;
  -[PKRendererTileController multiplyFramebufferForTile:createIfNeeded:device:pixelFormat:clearFramebufferBlock:]((uint64_t)v7, v5, a3, v8, v9, v11);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v6)
LABEL_3:
    v6[8] = 7;

  return v6;
}

- (double)calculateSourceRectForTile:(_OWORD *)a3 tileTransform:(CGFloat *)a4 destinationRectOut:
{
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  CGFloat x;
  CGFloat y;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat height;
  CGFloat width;
  CGAffineTransform v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v9 = v7[23];
    v10 = v7[24];
    v11 = v7[25];
    v12 = v7[26];
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v9 = 0;
  }
  v13 = a3[1];
  *(_OWORD *)&v32.a = *a3;
  *(_OWORD *)&v32.c = v13;
  *(_OWORD *)&v32.tx = a3[2];
  v33 = CGRectApplyAffineTransform(*(CGRect *)&v9, &v32);
  v35.size.width = *(CGFloat *)(a1 + 224);
  v35.size.height = *(CGFloat *)(a1 + 232);
  v35.origin.x = 0.0;
  v35.origin.y = 0.0;
  v34 = CGRectIntersection(v33, v35);
  height = v34.size.height;
  width = v34.size.width;
  x = v34.origin.x;
  y = v34.origin.y;
  -[PKRendererTile framebuffer]((uint64_t)v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PKMetalFramebuffer size]((uint64_t)v16);
  v19 = v18;

  DKDNormalizedSubrectInRect(x, y, width, height);
  DKDRectFromNormalizedSubrect(0.0, 0.0, v17, v19, v20, v21, v22, v23);
  *a4 = x;
  a4[1] = y;
  a4[2] = width;
  a4[3] = height;
  v28 = DKDRoundedRectForScale(v24, v25, v26, v27, 1.0);

  return v28;
}

- (void)renderTile:(void *)a3 tileFramebuffer:(_OWORD *)a4 tileTransform:(void *)a5 renderState:(int)a6 shouldComposite:
{
  id v11;
  id v12;
  __int128 v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  id v22;
  id v23;
  _OWORD v24[3];
  CGFloat v25[4];

  v23 = a2;
  v11 = a3;
  v12 = a5;
  if (v11)
  {
    v13 = a4[1];
    v24[0] = *a4;
    v24[1] = v13;
    v24[2] = a4[2];
    v14 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v23, v24, v25);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
    if (a6)
      v21 = *((_QWORD *)v11 + 8);
    else
      v21 = 0;
    v22 = *((id *)v11 + 3);
    -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v22, *(void **)(a1 + 40), v12, v21, v14, v16, v18, v20, v25[0], v25[1], v25[2], v25[3]);

  }
}

- (void)buildRenderCacheForStrokes:(uint64_t)a1
{
  id v3;
  uint64_t v4[3];
  void **v5;

  v3 = a2;
  if (a1)
  {
    memset(v4, 0, sizeof(v4));
    -[PKMetalRenderer generateLiveStrokeCachesForStrokes:destinationLocations:startTime:duration:](a1, v3, v4, 0.0, 0.0);
    v5 = (void **)v4;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v5);
  }

}

- (void)generateLiveStrokeCachesForStrokes:(uint64_t *)a3 destinationLocations:(double)a4 startTime:(double)a5 duration:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKStroke *v14;
  uint64_t v15;
  _BOOL4 v16;
  unint64_t v17;
  int v18;
  id *v19;
  PKStrokePath *v20;
  PKInk *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  void *__p[3];
  _BYTE v34[360];
  id *v35;

  v31 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 16) = 0;
    v8 = operator new();
    *(_BYTE *)(v8 + 16) = 0;
    *(_QWORD *)(v8 + 24) = 0x3FF0000000000000;
    *(_OWORD *)(v8 + 32) = 0u;
    *(_OWORD *)(v8 + 48) = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
    *(_OWORD *)(v8 + 80) = 0u;
    *(_QWORD *)(v8 + 96) = 0;
    *(_QWORD *)v8 = &unk_1E7773C78;
    *(_QWORD *)(v8 + 8) = 0;
    *(_DWORD *)(v8 + 104) = 0;
    *(_WORD *)(v8 + 108) = 1;
    *(_QWORD *)(v8 + 112) = 0;
    *(_OWORD *)(v8 + 120) = xmmword_1BE4FB830;
    *(_QWORD *)(v8 + 136) = 0x4010000000000000;
    *(_QWORD *)(v8 + 144) = 1;
    *(_DWORD *)(v8 + 152) = 2;
    v35 = (id *)v8;
    if (*(_BYTE *)(a1 + 932))
      *(_DWORD *)(v8 + 104) = 4;
    v9 = objc_msgSend(v31, "count");
    if (v9 >= 1)
    {
      v10 = 0;
      v11 = 0;
      v29 = (uint64_t *)(a1 + 608);
      v30 = (uint64_t *)(a1 + 592);
      do
      {
        v13 = *a3;
        v12 = a3[1];
        objc_msgSend(v31, "objectAtIndexedSubscript:", v11, v29, v30);
        v14 = (PKStroke *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKMetalRenderer renderZoomFactorForStroke:](a1, v14);
        v35[18] = (id)v15;
        memset(__p, 0, sizeof(__p));
        v16 = -[PKMetalRenderer generateBSplineInComputeForStroke:](a1, v14);
        v17 = 0xAAAAAAAAAAAAAAABLL * ((v12 - v13) >> 3);
        v18 = v11 < v17 || v16;
        v19 = v35;
        if (v18 == 1)
        {
          -[PKStroke path](v14, "path");
          v20 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
          -[PKStroke ink](v14, "ink");
          v21 = (PKInk *)objc_claimAutoreleasedReturnValue();
          PKBSplineFilter::copyPointsFromStroke((uint64_t)v19, v20, v21, (char **)__p);
        }
        else
        {
          -[PKStroke path](v14, "path");
          v20 = (PKStrokePath *)objc_claimAutoreleasedReturnValue();
          -[PKStroke ink](v14, "ink");
          v21 = (PKInk *)objc_claimAutoreleasedReturnValue();
          PKBSplineFilter::splineFromStroke(v19, v20, v21, -1.0);
        }

        v22 = (unint64_t)v35[10];
        v23 = (unint64_t)v35[11];
        if (v11 >= v17)
        {
          v27 = -[PKMetalRenderer generateCacheForStroke:points:segmentSteps:](a1, (uint64_t)v34, v22, v23, __p);
        }
        else
        {
          -[PKMetalRenderer generatePaintCacheForStroke:animatingStroke:segmentSteps:liveStrokePoints:liveStrokeStartTime:duration:](a1, v22, v23, (uint64_t)v34, __p, *(_QWORD *)(*a3 + v10), a4, a5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKStroke _strokeDataUUID](v14, "_strokeDataUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKLRUCache setObject:forKey:cost:scaleFactor:]((uint64_t)v25, v24, v26, objc_msgSend(v24, "cacheCost"), v15);

          }
        }
        if (__p[0])
          operator delete(__p[0]);

        ++v11;
        v10 += 24;
      }
      while (v9 != v11);
    }
    v28 = (uint64_t)v35;
    v35 = 0;
    if (v28)
      std::default_delete<PKBSplineFilter>::operator()[abi:ne180100]((uint64_t)&v35, v28);
  }

}

- (void)purgeRenderCachesForStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[PKMetalResourceHandler strokeRenderCache](*(id **)(a1 + 192));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "_strokeUUID", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKLRUCache removeObjectForKey:]((uint64_t)v4, v10);

          objc_msgSend(v9, "_strokeDataUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKLRUCache removeObjectForKey:]((uint64_t)v4, v11);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)purgeOriginalBackFramebuffer
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(a1 + 40));
      *(_BYTE *)(a1 + 48) = 0;
    }
    *(_BYTE *)(a1 + 72) = 1;
    if (*(_BYTE *)(a1 + 64))
    {
      -[PKMetalFramebuffer decrementNonPurgeableCount](*(_BYTE **)(a1 + 56));
      *(_BYTE *)(a1 + 64) = 0;
    }
  }
}

- (void)renderImageTexture:(__int128 *)a3 imageTextureTransform:(void *)a4 withTiles:(_OWORD *)a5 tileTransform:(char)a6 waitUntilCompleted:
{
  uint64_t v11;
  id *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  uint64_t v49;
  __int128 v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id obj;
  _OWORD v57[3];
  _OWORD v58[3];
  CGFloat v59[4];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v55 = a2;
  v54 = a4;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 714))
    {
      -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
      v11 = *(_QWORD *)(a1 + 192);
      if (v11)
        v11 = *(_QWORD *)(v11 + 440);
      *(_QWORD *)(a1 + 472) = v11;
      *(_BYTE *)(a1 + 488) = v55 != 0;
      if (v55 || objc_msgSend(v54, "count"))
      {
        v12 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)[PKMetalRenderState alloc], *(void **)(a1 + 32), 0, *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32));
        v13 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v12;

        v14 = *(_QWORD *)(a1 + 8);
        if (v14)
          *(_BYTE *)(v14 + 39) = a6;
        -[PKMetalRenderer setupDrawingFramebuffersIfNecessaryWantMemorylessPaint:](a1, 1);
        v15 = *(void **)(a1 + 40);
        if (v15)
          -[PKMetalRenderState addPurgeableFramebuffer:](*(_QWORD *)(a1 + 8), v15);
        v16 = *(void **)(a1 + 56);
        if (v16)
          -[PKMetalRenderState addPurgeableFramebuffer:](*(_QWORD *)(a1 + 8), v16);
        -[PKMetalRenderState commandBufferCreateIfNecessary](*(id **)(a1 + 8));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderState setSixChannelContentTexture:](*(_QWORD *)(a1 + 8), v55);
        objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "colorAttachments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v18;
        objc_msgSend(v18, "setLoadAction:", 2 * (v55 == 0));
        objc_msgSend(v18, "setStoreAction:", 1);
        v19 = *(_QWORD **)(a1 + 40);
        if (v19)
          v19 = (_QWORD *)v19[3];
        v20 = v19;
        objc_msgSend(v18, "setTexture:", v20);

        objc_msgSend(v51, "renderCommandEncoderWithDescriptor:", v52);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMetalRenderState setRenderEncoder:](*(_QWORD *)(a1 + 8), v21);
        v22 = *(_QWORD *)(a1 + 8);
        if (v22)
        {
          v23 = *a3;
          v24 = a3[1];
          *(_OWORD *)(v22 + 216) = a3[2];
          *(_OWORD *)(v22 + 200) = v24;
          *(_OWORD *)(v22 + 184) = v23;
          v25 = *(_QWORD *)(a1 + 8);
        }
        else
        {
          v25 = 0;
        }
        if (v55)
        {
          -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v55, *(void **)(a1 + 40), (void *)v25, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
          v25 = *(_QWORD *)(a1 + 8);
        }
        if (v25)
        {
          v26 = MEMORY[0x1E0C9BAA8];
          v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)(v25 + 184) = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)(v25 + 200) = v27;
          *(_OWORD *)(v25 + 216) = *(_OWORD *)(v26 + 32);
        }
        if (objc_msgSend(v54, "count"))
        {
          objc_msgSend(v21, "setFragmentTexture:atIndex:", v55, 0);
          -[PKMetalResourceHandler sixChannelCopyToCanvasPipelineState](*(_QWORD *)(a1 + 192));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setRenderPipelineState:", v28);

          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          obj = v54;
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v61;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v61 != v30)
                  objc_enumerationMutation(obj);
                v32 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v31);
                -[PKRendererTile framebuffer]((uint64_t)v32);
                v33 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                -[PKRendererTile multiplyFramebuffer]((uint64_t)v32);
                v34 = (_QWORD *)objc_claimAutoreleasedReturnValue();
                if (v33)
                  v35 = (void *)v33[3];
                else
                  v35 = 0;
                v36 = v35;
                objc_msgSend(v21, "setFragmentTexture:atIndex:", v36, 1);

                if (v34)
                  v37 = (void *)v34[3];
                else
                  v37 = 0;
                v38 = v37;
                objc_msgSend(v21, "setFragmentTexture:atIndex:", v38, 2);

                v39 = a5[1];
                v58[0] = *a5;
                v58[1] = v39;
                v58[2] = a5[2];
                v40 = -[PKMetalRenderer calculateSourceRectForTile:tileTransform:destinationRectOut:](a1, v32, v58, v59);
                v42 = v41;
                v44 = v43;
                v46 = v45;
                v47 = -[PKMetalFramebuffer size]((uint64_t)v33);
                -[PKMetalRenderer renderUberVertexShaderWithSourceRect:destinationRect:renderEncoder:sourcePixelSize:destPixelSize:](v21, v40, v42, v44, v46, v59[0], v59[1], v59[2], v59[3], v47, v48, *(double *)(a1 + 224), *(double *)(a1 + 232));

                ++v31;
              }
              while (v29 != v31);
              v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
              v29 = v49;
            }
            while (v49);
          }

        }
        -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
        *(_BYTE *)(a1 + 72) = 0;

      }
      else
      {
        *(_BYTE *)(a1 + 72) = 1;
      }
    }
    else
    {
      if (v55)
        -[PKMetalRenderer renderTexture:](a1, v55);
      v50 = a5[1];
      v57[0] = *a5;
      v57[1] = v50;
      v57[2] = a5[2];
      -[PKMetalRenderer renderTiles:clearBackBuffer:tileTransform:waitUntilCompleted:](a1, v54, v55 == 0, v57, a6);
    }
  }

}

- (void)renderTexture:(uint64_t)a1
{
  _OWORD *v3;
  __int128 v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    -[PKMetalRenderer setupOriginalBackFramebufferIfNecessary](a1);
    v3 = (_OWORD *)MEMORY[0x1E0C9D628];
    -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v5, *(void **)(a1 + 40), 0, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
    -[PKMetalRenderer purgePaintFramebuffers](a1);
    *(_BYTE *)(a1 + 121) = 1;
    *(_BYTE *)(a1 + 153) = 1;
    *(_BYTE *)(a1 + 137) = 1;
    *(_BYTE *)(a1 + 169) = 1;
    v4 = v3[1];
    *(_OWORD *)(a1 + 664) = *v3;
    *(_OWORD *)(a1 + 680) = v4;
  }

}

- (void)renderTiles:(int)a3 clearBackBuffer:(_OWORD *)a4 tileTransform:(char)a5 waitUntilCompleted:
{
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  if (a1)
  {
    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
    if (a3)
    {
      -[PKMetalRenderer finishRendering](a1);
      *(_BYTE *)(a1 + 72) = 1;
    }
    -[PKMetalRenderer setupRenderStateForStrokeRenderingNumPaintBuffers:needRenderMask:](a1, 0, 0);
    v10 = *(_QWORD *)(a1 + 8);
    if (v10)
      *(_BYTE *)(v10 + 39) = a5;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      v14 = a3 ^ 1;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[PKMetalRenderer framebufferForTile:createIfNeeded:](a1, v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = a4[1];
          v19[0] = *a4;
          v19[1] = v18;
          v19[2] = a4[2];
          -[PKMetalRenderer renderTile:tileFramebuffer:tileTransform:renderState:shouldComposite:](a1, v16, v17, v19, *(void **)(a1 + 8), v14);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    -[PKMetalRenderer teardownRenderStateIfNecessary](a1);
  }

}

- (void)renderTiles:(void *)a3 intoTile:(char)a4 waitUntilCompleted:
{
  unint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  id *v15;
  PKMetalRenderState *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v66;
  id v67;
  CGFloat v68;
  double v69;
  id obj;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v77 = *MEMORY[0x1E0C80C00];
  v67 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_49;
  v8 = 0;
  v9 = 1;
  if (*(_BYTE *)(a1 + 714))
    v9 = 2;
  v66 = v9;
  v64 = v9 - 1;
  do
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v67;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (!v10)
    {

      v12 = 0;
      v11 = 0;
      goto LABEL_48;
    }
    v11 = 0;
    v12 = 0;
    v71 = *(_QWORD *)v73;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v73 != v71)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD **)(*((_QWORD *)&v72 + 1) + 8 * v13);
        if (v8)
          -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, *(void **)(*((_QWORD *)&v72 + 1) + 8 * v13), 0);
        else
          -[PKMetalRenderer framebufferForTile:createIfNeeded:](a1, *(void **)(*((_QWORD *)&v72 + 1) + 8 * v13), 0);
        v15 = (id *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_38;
        if (!v11)
        {
          v16 = [PKMetalRenderState alloc];
          v4 = v4 & 0xFFFF000000000000 | *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
          v11 = -[PKMetalRenderState initWithCommandQueue:liveRendering:defaultPipelineConfig:]((id *)&v16->super.isa, *(void **)(a1 + 32), 0, v4);
          v17 = -[PKMetalRenderState commandBufferCreateIfNecessary](v11);
        }
        if (!v12)
        {
          if (v8)
            -[PKMetalRenderer multiplyFramebufferForTile:createIfNeeded:](a1, v7, 1);
          else
            -[PKMetalRenderer framebufferForTile:createIfNeeded:](a1, v7, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (v14)
        {
          v18 = v14[16];
          if (v7)
            goto LABEL_23;
        }
        else
        {
          v18 = 0;
          if (v7)
          {
LABEL_23:
            v19 = v7[16];
            goto LABEL_24;
          }
        }
        v19 = 0;
LABEL_24:
        if (v18 == v19)
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = 0;
          v24 = 0;
          if (v14)
          {
            v24 = v14[23];
            v21 = v14[24];
            v22 = v14[25];
            v23 = v14[26];
          }
          v25 = 0;
          v26 = 0;
          v27 = 0;
          if (v7)
          {
            v27 = v7[23];
            v20 = v7[24];
            v25 = v7[25];
            v26 = v7[26];
          }
          if (CGRectEqualToRect(*(CGRect *)&v24, *(CGRect *)(&v20 - 1)))
          {
            v28 = v15[3];
            -[PKMetalRenderer renderTexture:intoFramebuffer:clipRect:renderState:](a1, v28, v12, v11, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
LABEL_37:

            goto LABEL_38;
          }
        }
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
        v33 = 0;
        if (v14)
        {
          v33 = v14[23];
          v30 = v14[24];
          v31 = v14[25];
          v32 = v14[26];
        }
        v34 = 0;
        v35 = 0;
        v36 = 0;
        if (v7)
        {
          v36 = v7[23];
          v29 = v7[24];
          v34 = v7[25];
          v35 = v7[26];
        }
        v78 = CGRectIntersection(*(CGRect *)&v33, *(CGRect *)(&v29 - 1));
        x = v78.origin.x;
        y = v78.origin.y;
        width = v78.size.width;
        height = v78.size.height;
        if (!CGRectIsNull(v78))
        {
          v41 = -[PKMetalFramebuffer size]((uint64_t)v15);
          v43 = v42;
          DKDNormalizedSubrectInRect(x, y, width, height);
          DKDRectFromNormalizedSubrect(0.0, 0.0, v41, v43, v44, v45, v46, v47);
          v80 = CGRectIntegral(v79);
          v48 = v80.origin.y;
          v49 = v80.size.width;
          v50 = v80.size.height;
          v68 = v80.origin.x;
          v51 = -[PKMetalFramebuffer size]((uint64_t)v12);
          v69 = v52;
          v53 = v51;
          DKDNormalizedSubrectInRect(x, y, width, height);
          DKDRectFromNormalizedSubrect(0.0, 0.0, v53, v69, v54, v55, v56, v57);
          v82 = CGRectIntegral(v81);
          v58 = v82.origin.x;
          v59 = v82.origin.y;
          v60 = v82.size.width;
          v61 = v82.size.height;
          v28 = v15[3];
          -[PKMetalRenderer renderTexture:intoFramebuffer:sourceRect:destinationRect:renderState:blendMode:](a1, v28, v12, v11, 0, v68, v48, v49, v50, v58, v59, v60, v61);
          goto LABEL_37;
        }
LABEL_38:

        ++v13;
      }
      while (v10 != v13);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      v10 = v62;
    }
    while (v62);

    if (v11)
    {
      v63 = a4;
      if (v8 != v64)
        v63 = 0;
      *((_BYTE *)v11 + 39) = v63;
      -[PKMetalRenderState commitAndPurgeResourceSet:]((uint64_t)v11, 0);
    }
LABEL_48:

    ++v8;
  }
  while (v8 != v66);
LABEL_49:

}

void __53__PKMetalRenderer_framebufferForTile_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](*(_QWORD *)(a1 + 32), a2);
}

void __61__PKMetalRenderer_multiplyFramebufferForTile_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  -[PKMetalRenderer clearFramebuffer:waitUntilCompleted:](*(_QWORD *)(a1 + 32), a2);
}

- (void)clearTile:(uint64_t)a1 waitUntilCompleted:(void *)a2
{
  void *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    +[PKRendererTileController sharedController]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRendererTileController didTeardownTile:]((uint64_t)v3, (uint64_t)v4);

    -[PKRendererTile clearFramebuffersThreadSafe]((uint64_t)v4);
  }

}

- (void)copyFromFramebuffer:(uint64_t)a3 toFramebuffer:(CGFloat)a4 clipRect:(CGFloat)a5 renderEncoder:(CGFloat)a6 paintIndex:(CGFloat)a7 alphaBlendFactor:(double)a8
{
  id v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int16 v26;
  BOOL v27;
  _BYTE v28[13];
  int v29;
  __int16 v30;
  __int16 v31;
  CGRect v32;

  v15 = a2;
  v23 = 0u;
  v24 = 0u;
  v32.origin.x = a4;
  v32.origin.y = a5;
  v32.size.width = a6;
  v32.size.height = a7;
  if ((_QWORD)v24)
    v16 = *((_QWORD *)&v24 + 1) == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v22[0] = v23;
    v22[1] = v24;
    objc_msgSend(v15, "setScissorRect:", v22);
    v17 = -[PKMetalRenderer setupAlphaBlendingForAlphaBlendFactor:renderEncoder:](v15, a8);
    v18 = *(_QWORD *)(a1 + 8);
    if (v18)
      v19 = -[PKMetalRenderState pipelineConfig](v18);
    else
      v19 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
    v20 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)&v25 = 13;
    *((int8x8_t *)&v25 + 1) = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3 == 0), 0x1FuLL)), (int8x8_t)0x200000001, (int8x8_t)0x500000004);
    v26 = 0;
    v27 = v17;
    memset(v28, 0, sizeof(v28));
    v29 = v19;
    v30 = WORD2(v19);
    v31 = 0;
    -[PKMetalResourceHandler namedShaderForKey:](v20, &v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v15);
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v21, v15);
    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v15);

  }
}

- (void)copyIntoPaintFromTexture:(void *)a3 clipRect:(uint64_t)a4 renderEncoder:(CGFloat)a5 paintIndex:(CGFloat)a6 alphaBlendFactor:(CGFloat)a7
{
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int16 v31;
  BOOL v32;
  _BYTE v33[13];
  int v34;
  __int16 v35;
  __int16 v36;
  CGRect v37;

  v17 = a2;
  v18 = a3;
  v28 = 0u;
  v29 = 0u;
  v37.origin.x = a5;
  v37.origin.y = a6;
  v37.size.width = a7;
  v37.size.height = a8;
  if ((_QWORD)v29)
    v19 = *((_QWORD *)&v29 + 1) == 0;
  else
    v19 = 1;
  if (!v19)
  {
    v27[0] = v28;
    v27[1] = v29;
    objc_msgSend(v18, "setScissorRect:", v27);
    objc_msgSend(v18, "setFragmentTexture:atIndex:", v17, 0);
    v20 = -[PKMetalRenderer setupAlphaBlendingForAlphaBlendFactor:renderEncoder:](v18, a9);
    -[PKMetalRenderer setupForDefaultUberVertexShaderInRenderEncoder:](a1, v18);
    v21 = *(_QWORD *)(a1 + 8);
    if (v21)
      v22 = -[PKMetalRenderState pipelineConfig](v21);
    else
      v22 = *(unsigned int *)(a1 + 784) | ((unint64_t)*(unsigned __int16 *)(a1 + 788) << 32);
    v23 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)&v30 = 7;
    if (a4)
      v24 = 4;
    else
      v24 = 1;
    *((_QWORD *)&v30 + 1) = v24;
    v31 = 0;
    v32 = v20;
    memset(v33, 0, sizeof(v33));
    v34 = v22;
    v35 = WORD2(v22);
    v36 = 0;
    -[PKMetalResourceHandler namedShaderForKey:](v23, &v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMetalRenderer renderFullscreenQuadWithShader:renderEncoder:](a1, v25, v18);

    -[PKMetalRenderer disableClippingForRenderEncoder:](a1, v18);
    v26 = *(_QWORD *)(a1 + 8);
    if (v26)
      objc_msgSend((id)objc_opt_class(), "renderTargetBarrierForRenderEncoder:", *(_QWORD *)(v26 + 80));
  }

}

- (BOOL)setupAlphaBlendingForAlphaBlendFactor:(void *)a1 renderEncoder:(double)a2
{
  id v3;
  void *v4;
  float v5;
  float v7;

  v3 = a1;
  v4 = v3;
  if (a2 < 1.0)
  {
    v5 = a2;
    v7 = v5;
    objc_msgSend(v3, "setFragmentBytes:length:atIndex:", &v7, 4, 0);
  }

  return a2 < 1.0;
}

- (void)setLinedPaper:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 952), a2);
}

- (void).cxx_destruct
{
  _PKStrokePoint *begin;
  AnimatingStroke *v4;
  AnimatingStroke *end;
  AnimatingStroke *v6;
  PKMetalLiveStrokePaintStrokePoint *v7;
  PKMetalSDFPenStrokePoint *v8;
  PKMetalPaintStrokePoint *v9;
  PKMetalParticleStrokePoint *v10;
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_linedPaper, 0);
  begin = self->previewStrokePoints.__begin_;
  if (begin)
  {
    self->previewStrokePoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_randomNumberBuffer, 0);
  objc_storeStrong((id *)&self->_activeCombinedAlternativeStrokes, 0);
  objc_storeStrong((id *)&self->_activeCombinedStroke, 0);
  v4 = self->_animatingStrokes.__begin_;
  if (v4)
  {
    end = self->_animatingStrokes.__end_;
    v6 = self->_animatingStrokes.__begin_;
    if (end != v4)
    {
      do
      while (end != v4);
      v6 = self->_animatingStrokes.__begin_;
    }
    self->_animatingStrokes.__end_ = v4;
    operator delete(v6);
  }
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_sharedSDFStrokeVertexBuffer);
  std::shared_ptr<PKProtobufUnknownFields>::~shared_ptr[abi:ne180100]((uint64_t)&self->_sharedStrokeVertexBuffer);
  v7 = self->_liveStrokeStrokePointBuffer.__begin_;
  if (v7)
  {
    self->_liveStrokeStrokePointBuffer.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_sdfPenStrokePointBuffer.__begin_;
  if (v8)
  {
    self->_sdfPenStrokePointBuffer.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_paintStrokePointBuffer.__begin_;
  if (v9)
  {
    self->_paintStrokePointBuffer.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_particleStrokePointBuffer.__begin_;
  if (v10)
  {
    self->_particleStrokePointBuffer.__end_ = v10;
    operator delete(v10);
  }
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_dummyColorFramebuffer, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_dummyPaintFramebuffer[i + 1], 0);
  objc_storeStrong((id *)&self->_resourceHandler, 0);
  objc_storeStrong((id *)&self->_maskMSAAFramebuffer, 0);
  objc_storeStrong((id *)&self->_paintFramebufferMask, 0);
  for (j = 0; j != -2; --j)
  for (k = 0; k != -2; --k)
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_currentRenderState, 0);
}

- (id).cxx_construct
{
  uint64_t i;
  char *v3;
  char *v4;

  *((_WORD *)self + 24) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_WORD *)self + 32) = 0;
  for (i = 112; i != 144; i += 16)
  {
    v3 = (char *)self + i;
    *((_WORD *)v3 + 4) = 0;
    *(_QWORD *)v3 = 0;
  }
  do
  {
    v4 = (char *)self + i;
    *((_WORD *)v4 + 4) = 0;
    *(_QWORD *)v4 = 0;
    i += 16;
  }
  while (i != 176);
  *((_QWORD *)self + 80) = 0;
  *((_OWORD *)self + 38) = 0u;
  *((_OWORD *)self + 39) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 34) = 0u;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_DWORD *)self + 198) = 0;
  *(_OWORD *)((char *)self + 760) = 0u;
  *(_OWORD *)((char *)self + 776) = 0u;
  return self;
}

@end
