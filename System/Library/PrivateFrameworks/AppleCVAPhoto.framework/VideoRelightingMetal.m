@implementation VideoRelightingMetal

- (id)create3DTextureWithSize:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_opt_new();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTextureType:", 7);
  objc_msgSend(v6, "setHeight:", a3);
  objc_msgSend(v6, "setWidth:", a3);
  objc_msgSend(v6, "setDepth:", a3);
  objc_msgSend(v6, "setPixelFormat:", 70);
  objc_msgSend(v6, "setArrayLength:", 1);
  objc_msgSend(v6, "setMipmapLevelCount:", 1);
  objc_msgSend(v6, "setUsage:", 3);
  v7 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)createTexturesWith:(unint64_t)a3 imgHeight:(unint64_t)a4
{
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  MTLTexture *v14;
  MTLTexture *tcTexture;
  void *v16;
  void *v17;
  void *v18;
  MTLTexture *v19;
  MTLTexture *tcDepthTexture;
  void *v21;
  void *v22;
  void *v23;
  MTLTexture *v24;
  MTLTexture *slideTexture;
  void *v26;
  void *v27;
  void *v28;
  MTLTexture *v29;
  MTLTexture *vertCountTexture;
  void *v31;
  MTLTexture *v32;
  MTLTexture *countTexture;
  void *v34;
  MTLTexture *v35;
  MTLTexture *texSkinRGBAPyramid;
  unint64_t v37;
  void *v38;
  char v39;
  unint64_t v40;
  id v41;
  id v42;

  v7 = atomic_load((unsigned __int8 *)&qword_1EF12D768);
  if ((v7 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D768))
  {
    v37 = a3;
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("CVAPhotoFullResTCMap"));

    byte_1EF12D762 = v39;
    __cxa_guard_release(&qword_1EF12D768);
    a3 = v37;
  }
  v40 = a3;
  v41 = (id)(a3 >> 2);
  if (byte_1EF12D762)
    v8 = a3;
  else
    v8 = a3 >> 2;
  v9 = a4 >> 2;
  if (byte_1EF12D762)
    v10 = a4;
  else
    v10 = a4 >> 2;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setUsage:", 7);
  v13 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v12);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v13);
  v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  tcTexture = self->_tcTexture;
  self->_tcTexture = v14;

  objc_storeStrong((id *)&self->_lightTexture, self->_tcTexture);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, v8, v10, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setUsage:", 5);
  v18 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v17);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v18);
  v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  tcDepthTexture = self->_tcDepthTexture;
  self->_tcDepthTexture = v19;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v41, v9, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setUsage:", 7);
  v23 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v22);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v23);
  v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  slideTexture = self->_slideTexture;
  self->_slideTexture = v24;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v41, v9, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setUsage:", 7);
  v28 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v27);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v28);
  v29 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  vertCountTexture = self->_vertCountTexture;
  self->_vertCountTexture = v29;

  v31 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v27);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v31);
  v32 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  countTexture = self->_countTexture;
  self->_countTexture = v32;

  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, v40 >> 1, a4 >> 1, 1);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setUsage:", 3);
  objc_msgSend(v42, "setMipmapLevelCount:", 3);
  v34 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v42);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v34);
  v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  texSkinRGBAPyramid = self->_texSkinRGBAPyramid;
  self->_texSkinRGBAPyramid = v35;

}

- (void)initKernelFunctions
{
  MTLComputePipelineState **p_kernel_CountVertical;
  MTLComputePipelineState **p_kernel_Count;
  MTLComputePipelineState **p_kernel_Slide;
  MTLComputePipelineState **p_kernel_AlphaBlendRGBATextureArray;
  uint64_t *v7;
  char v8;
  uint64_t *v9;
  char v10;
  char *v11;
  char v12;
  uint64_t v13;
  char v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t *v20;
  int64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  int64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  __int128 v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  BOOL v59;
  BOOL v60;
  unint64_t v61;
  double *v62;
  uint64_t *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  char *v74;
  BOOL v75;
  BOOL v76;
  BOOL v77;
  BOOL v78;
  BOOL v79;
  unint64_t v80;
  double *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  MTLPipelineLibrarySPI *pipelineLibrary;
  MTLDeviceSPI *device;
  MTLPipelineLibrarySPI *v114;
  id v115;
  __CFString *v116;
  __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  id v124;
  MTLRenderPipelineState *tcKernel;
  void *v126;
  void *v127;
  void *v128;
  VideoRelightingMetal *v129;
  char v130;
  unint64_t v131;
  char v132;
  MTLComputePipelineState *(*kernel_Relight)[2][2];
  MTLDeviceSPI *v134;
  char v135;
  MTLLibrary *v136;
  uint64_t v137;
  void *v138;
  id v139[14];
  float64x2x3_t v140;
  float64x2x3_t v141;

  v139[12] = *(id *)MEMORY[0x1E0C80C00];
  p_kernel_CountVertical = &self->_kernel_CountVertical;
  v139[0] = &self->_kernel_CountVertical;
  v139[1] = CFSTR("smooth_v");
  p_kernel_Count = &self->_kernel_Count;
  v139[2] = 0;
  v139[3] = &self->_kernel_Count;
  v139[4] = CFSTR("smooth_h");
  v139[5] = 0;
  p_kernel_Slide = &self->_kernel_Slide;
  v139[6] = &self->_kernel_Slide;
  v139[7] = CFSTR("slide");
  p_kernel_AlphaBlendRGBATextureArray = &self->_kernel_AlphaBlendRGBATextureArray;
  v139[8] = 0;
  v139[9] = &self->_kernel_AlphaBlendRGBATextureArray;
  v139[10] = CFSTR("alphaBlendRGBATextureArray");
  v139[11] = 0;
  v7 = (uint64_t *)operator new(0x60uLL);
  v8 = 0;
  v137 = 0;
  v9 = v7 + 12;
  *v7 = (uint64_t)p_kernel_CountVertical;
  v7[1] = (uint64_t)CFSTR("smooth_v");
  v7[2] = 0;
  v7[3] = (uint64_t)p_kernel_Count;
  v7[4] = (uint64_t)CFSTR("smooth_h");
  v7[5] = 0;
  kernel_Relight = self->_kernel_Relight;
  v7[6] = (uint64_t)p_kernel_Slide;
  v7[7] = (uint64_t)CFSTR("slide");
  v7[8] = 0;
  v7[9] = (uint64_t)p_kernel_AlphaBlendRGBATextureArray;
  v10 = 1;
  v11 = (char *)(v7 + 12);
  v7[10] = (uint64_t)CFSTR("alphaBlendRGBATextureArray");
  v7[11] = 0;
  v129 = self;
  while (2)
  {
    v12 = 0;
    v13 = 0;
    v130 = v10;
    v135 = v8 & 1;
    v14 = 1;
    do
    {
      v132 = v14;
      v15 = (void *)objc_opt_new();
      LOBYTE(v139[0]) = v135;
      objc_msgSend(v15, "setConstantValue:type:withName:", v139, 53, CFSTR("kV2"));
      v16 = v12 & 1;
      LOBYTE(v139[0]) = v12 & 1;
      objc_msgSend(v15, "setConstantValue:type:withName:", v139, 53, CFSTR("kGeometricHaloRemoval"));
      LOBYTE(v139[0]) = 0;
      objc_msgSend(v15, "setConstantValue:type:withName:", v139, 53, CFSTR("kIsContour"));
      v17 = (uint64_t)kernel_Relight[v137][v13];
      v18 = v15;
      v19 = v18;
      if (v9 < (uint64_t *)v11)
      {
        *v9 = v17;
        v9[1] = (uint64_t)CFSTR("compositeLightmap");
        v9[2] = (uint64_t)v18;
        v20 = v9 + 3;
        goto LABEL_22;
      }
      v21 = (char *)v9 - (char *)v7;
      v22 = 0xAAAAAAAAAAAAAAABLL * (v9 - v7) + 1;
      if (v22 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_109;
      if (0x5555555555555556 * ((v11 - (char *)v7) >> 3) > v22)
        v22 = 0x5555555555555556 * ((v11 - (char *)v7) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((v11 - (char *)v7) >> 3) >= 0x555555555555555)
        v22 = 0xAAAAAAAAAAAAAAALL;
      if (v22 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_110;
      v131 = v22;
      v23 = (char *)operator new(24 * v22);
      v24 = v23;
      v25 = (uint64_t *)&v23[8 * (v9 - v7)];
      *v25 = v17;
      v25[1] = (uint64_t)CFSTR("compositeLightmap");
      v25[2] = (uint64_t)v19;
      if (v9 != v7)
      {
        v26 = (char *)v9 - (char *)v7 - 24;
        if (v26 < 0x438)
          goto LABEL_14;
        v46 = v26 / 0x18;
        if (&v23[v21 - 24 + -24 * (v26 / 0x18)] > &v23[v21 - 24])
          goto LABEL_14;
        v47 = (unint64_t)&v9[-3 * v46 - 3];
        if (v47 > (unint64_t)(v9 - 3))
          goto LABEL_14;
        v48 = (unint64_t)&v9[-3 * v46 - 2];
        if (v48 > (unint64_t)(v9 - 2))
          goto LABEL_14;
        v49 = (unint64_t)&v23[v21 - 16];
        if (v49 - 24 * v46 > v49)
          goto LABEL_14;
        v50 = (unint64_t)&v9[-3 * v46 - 1];
        if (v50 > (unint64_t)(v9 - 1))
          goto LABEL_14;
        v51 = (unint64_t)&v23[v21 - 8];
        if (v51 - 24 * v46 > v51)
          goto LABEL_14;
        v52 = -24 * (v26 / 0x18) + v21;
        v53 = (unint64_t)&v23[v52 - 24];
        v54 = (unint64_t)&v23[v52 - 16];
        v55 = &v23[v52 - 8];
        v56 = v48 >= v51 || v54 >= (unint64_t)(v9 - 1);
        v57 = !v56;
        v58 = v50 >= (unint64_t)v25 || v55 >= (char *)v9;
        v59 = !v58;
        v60 = v47 >= v49 || v53 >= (unint64_t)(v9 - 2);
        if (!v60 || v57)
        {
LABEL_14:
          v27 = v9;
          v28 = (uint64_t *)&v23[8 * (v9 - v7)];
        }
        else
        {
          v27 = v9;
          v28 = (uint64_t *)&v23[8 * (v9 - v7)];
          if (!v59)
          {
            v61 = v46 + 1;
            v27 = &v9[-3 * (v61 & 0x1FFFFFFFFFFFFFFELL)];
            v62 = (double *)(v25 - 6);
            v63 = v9 - 6;
            v64 = v61 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              v140 = vld3q_f64((const double *)v63);
              *((_OWORD *)v63 + 2) = 0uLL;
              *(_OWORD *)(v63 + 1) = 0uLL;
              vst3q_f64(v62, v140);
              v62 -= 6;
              v63 -= 6;
              v64 -= 2;
            }
            while (v64);
            v28 = &v25[-3 * (v61 & 0x1FFFFFFFFFFFFFFELL)];
            if (v61 == (v61 & 0x1FFFFFFFFFFFFFFELL))
              goto LABEL_16;
          }
        }
        do
        {
          v29 = *(_OWORD *)(v27 - 3);
          v27 -= 3;
          v27[1] = 0;
          *(_OWORD *)(v28 - 3) = v29;
          v28 -= 3;
          v30 = v27[2];
          v27[2] = 0;
          v28[2] = v30;
        }
        while (v27 != v7);
        do
        {
LABEL_16:

          v9 -= 3;
        }
        while (v9 != v7);
        goto LABEL_19;
      }
      v28 = (uint64_t *)&v23[8 * (v9 - v7)];
LABEL_19:
      v11 = &v24[24 * v131];
      v20 = v25 + 3;
      if (v7)
        operator delete(v7);
      v7 = v28;
LABEL_22:

      v31 = (void *)objc_opt_new();
      LOBYTE(v139[0]) = v135;
      objc_msgSend(v31, "setConstantValue:type:withName:", v139, 53, CFSTR("kV2"));
      LOBYTE(v139[0]) = v16;
      objc_msgSend(v31, "setConstantValue:type:withName:", v139, 53, CFSTR("kGeometricHaloRemoval"));
      LOBYTE(v139[0]) = 1;
      objc_msgSend(v31, "setConstantValue:type:withName:", v139, 53, CFSTR("kIsContour"));
      v32 = (uint64_t)&kernel_Relight[v137][v13][1];
      v33 = v31;
      v34 = v33;
      if (v20 < (uint64_t *)v11)
      {
        *v20 = v32;
        v20[1] = (uint64_t)CFSTR("compositeLightmap");
        v20[2] = (uint64_t)v33;
        v9 = v20 + 3;
        goto LABEL_41;
      }
      v35 = (char *)v20 - (char *)v7;
      v36 = 0xAAAAAAAAAAAAAAABLL * (v20 - v7) + 1;
      if (v36 > 0xAAAAAAAAAAAAAAALL)
LABEL_109:
        sub_1B566A9AC();
      if (0x5555555555555556 * ((v11 - (char *)v7) >> 3) > v36)
        v36 = 0x5555555555555556 * ((v11 - (char *)v7) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((v11 - (char *)v7) >> 3) >= 0x555555555555555)
        v37 = 0xAAAAAAAAAAAAAAALL;
      else
        v37 = v36;
      if (v37 > 0xAAAAAAAAAAAAAAALL)
LABEL_110:
        sub_1B566A9AC();
      v38 = (char *)operator new(24 * v37);
      v39 = v38;
      v40 = (uint64_t *)&v38[8 * (v20 - v7)];
      *v40 = v32;
      v40[1] = (uint64_t)CFSTR("compositeLightmap");
      v40[2] = (uint64_t)v34;
      if (v20 != v7)
      {
        v41 = (char *)v20 - (char *)v7 - 24;
        if (v41 < 0x438)
          goto LABEL_33;
        v65 = v41 / 0x18;
        if (&v38[v35 - 24 + -24 * (v41 / 0x18)] > &v38[v35 - 24])
          goto LABEL_33;
        v66 = (unint64_t)&v20[-3 * v65 - 3];
        if (v66 > (unint64_t)(v20 - 3))
          goto LABEL_33;
        v67 = (unint64_t)&v20[-3 * v65 - 2];
        if (v67 > (unint64_t)(v20 - 2))
          goto LABEL_33;
        v68 = (unint64_t)&v38[v35 - 16];
        if (v68 - 24 * v65 > v68)
          goto LABEL_33;
        v69 = (unint64_t)&v20[-3 * v65 - 1];
        if (v69 > (unint64_t)(v20 - 1))
          goto LABEL_33;
        v70 = (unint64_t)&v38[v35 - 8];
        if (v70 - 24 * v65 > v70)
          goto LABEL_33;
        v71 = -24 * (v41 / 0x18) + v35;
        v72 = (unint64_t)&v38[v71 - 24];
        v73 = (unint64_t)&v38[v71 - 16];
        v74 = &v38[v71 - 8];
        v75 = v67 >= v70 || v73 >= (unint64_t)(v20 - 1);
        v76 = !v75;
        v77 = v69 >= (unint64_t)v40 || v74 >= (char *)v20;
        v78 = !v77;
        v79 = v66 >= v68 || v72 >= (unint64_t)(v20 - 2);
        if (!v79 || v76)
        {
LABEL_33:
          v42 = v20;
          v43 = (uint64_t *)&v38[8 * (v20 - v7)];
        }
        else
        {
          v42 = v20;
          v43 = (uint64_t *)&v38[8 * (v20 - v7)];
          if (!v78)
          {
            v80 = v65 + 1;
            v42 = &v20[-3 * (v80 & 0x1FFFFFFFFFFFFFFELL)];
            v81 = (double *)(v40 - 6);
            v82 = v20 - 6;
            v83 = v80 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              v141 = vld3q_f64((const double *)v82);
              *((_OWORD *)v82 + 2) = 0uLL;
              *(_OWORD *)(v82 + 1) = 0uLL;
              vst3q_f64(v81, v141);
              v81 -= 6;
              v82 -= 6;
              v83 -= 2;
            }
            while (v83);
            v43 = &v40[-3 * (v80 & 0x1FFFFFFFFFFFFFFELL)];
            if (v80 == (v80 & 0x1FFFFFFFFFFFFFFELL))
              goto LABEL_35;
          }
        }
        do
        {
          v44 = *(_OWORD *)(v42 - 3);
          v42 -= 3;
          v42[1] = 0;
          *(_OWORD *)(v43 - 3) = v44;
          v43 -= 3;
          v45 = v42[2];
          v42[2] = 0;
          v43[2] = v45;
        }
        while (v42 != v7);
        do
        {
LABEL_35:

          v20 -= 3;
        }
        while (v20 != v7);
        goto LABEL_38;
      }
      v43 = (uint64_t *)&v38[8 * (v20 - v7)];
LABEL_38:
      v11 = &v39[24 * v37];
      v9 = v40 + 3;
      if (v7)
        operator delete(v7);
      v7 = v43;
LABEL_41:

      v14 = 0;
      v12 = 1;
      v13 = 1;
    }
    while ((v132 & 1) != 0);
    v10 = 0;
    v8 = 1;
    v137 = 1;
    if ((v130 & 1) != 0)
      continue;
    break;
  }
  if (v7 != v9)
  {
    v84 = v7;
    do
    {
      sub_1B5674B88((void **)*v84, v129->_library, v129->_pipelineLibrary, v129->_device, (void *)v84[1], 0, (void *)v84[2]);
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", *(_QWORD *)*v84);

      v84 += 3;
    }
    while (v84 != v9);
  }
  objc_msgSend(MEMORY[0x1E0CC6BD8], "vertexDescriptor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v85);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v138, "attributes");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "objectAtIndexedSubscript:", 0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setFormat:", 31);

  objc_msgSend(v138, "attributes");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setBufferIndex:", 0);

  objc_msgSend(v138, "attributes");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setOffset:", 0);

  objc_msgSend(v138, "attributes");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "objectAtIndexedSubscript:", 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setFormat:", 30);

  objc_msgSend(v138, "attributes");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "objectAtIndexedSubscript:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setBufferIndex:", 0);

  objc_msgSend(v138, "attributes");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "objectAtIndexedSubscript:", 1);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setOffset:", 16);

  objc_msgSend(v138, "attributes");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "objectAtIndexedSubscript:", 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setBufferIndex:", 0);

  objc_msgSend(v138, "attributes");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectAtIndexedSubscript:", 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setFormat:", 29);

  objc_msgSend(v138, "attributes");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "objectAtIndexedSubscript:", 2);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setOffset:", 32);

  objc_msgSend(v138, "layouts");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "setStride:", 48);

  objc_msgSend(v138, "layouts");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "objectAtIndexedSubscript:", 0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setStepFunction:", 1);

  v108 = (void *)objc_opt_new();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v109, "setVertexFunction:", 0);
  objc_msgSend(v109, "setFragmentFunction:", 0);
  objc_msgSend(v109, "setVertexDescriptor:", v138);
  objc_msgSend(v109, "colorAttachments");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setPixelFormat:", 30);

  objc_msgSend(v109, "setDepthAttachmentPixelFormat:", 252);
  pipelineLibrary = v129->_pipelineLibrary;
  device = v129->_device;
  v136 = v129->_library;
  v114 = pipelineLibrary;
  v134 = device;
  v115 = v109;
  v116 = CFSTR("TC_vertex");
  v117 = CFSTR("TC_fragment");
  v118 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("One of vertexShaderName/fragmentShaderName should be nonnil"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "static void KernelReloader::assignAndWatchShader(__strong id<MTLRenderPipelineState>  _Nonnull * _Nonnull, id<MTLLibrary>  _Nonnull __strong, id<MTLPipelineLibrarySPI>  _Nullable __strong, id<MTLDeviceSPI>  _Nonnull __strong, MTLRenderPipelineDescriptor * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable, NSString * _Nonnull __strong, NSString * _Nonnull __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/include/AppleCVAPhoto/sdof/KernelReloader.h", 61, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(0, 0, 0, 4294944393, v120);

  sub_1B56A2330(v136, v114, CFSTR("TC_vertex"), 0, 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setVertexFunction:", v121);

  sub_1B56A2330(v136, v114, CFSTR("TC_fragment"), 0, 0);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setFragmentFunction:", v122);

  objc_msgSend(v115, "setPipelineLibrary:", v114);
  v139[0] = 0;
  v123 = -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:error:](v134, "newRenderPipelineStateWithDescriptor:error:", v115, v139);
  v124 = v139[0];
  tcKernel = v129->_tcKernel;
  v129->_tcKernel = (MTLRenderPipelineState *)v123;

  v126 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error occurred when creating face pipeline state: %@"), v124);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "static void KernelReloader::assignAndWatchShader(__strong id<MTLRenderPipelineState>  _Nonnull * _Nonnull, id<MTLLibrary>  _Nonnull __strong, id<MTLPipelineLibrarySPI>  _Nullable __strong, id<MTLDeviceSPI>  _Nonnull __strong, MTLRenderPipelineDescriptor * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable, NSString * _Nonnull __strong, NSString * _Nonnull __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/include/AppleCVAPhoto/sdof/KernelReloader.h", 86, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B5658D40(v124 != 0, 0, v124, 4294944382, v128);

  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v129->_tcKernel);
  if (v7)
  {
    for (; v9 != v7; v9 -= 3)
    {

    }
    operator delete(v7);
  }
}

- (id)loadCube:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/"), "stringByAppendingString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B56A2BF0(v5, self->_device);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getInternalColorCube:(int)a3
{
  MTLTexture **texColorCubeStaticArray;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  MTLTexture *v7;
  unsigned __int8 v8;
  __objc2_prop_list **p_inst_props;
  int v11;
  void *v12;
  char v13;
  MTLTexture **v14;
  uint64_t v15;

  texColorCubeStaticArray = self->_texColorCubeStaticArray;
  v4 = a3;
  if (self->_texColorCubeStaticArray[a3])
    v5 = 1;
  else
    v5 = a3 > 6;
  if (!v5 && ((0x7Bu >> a3) & 1) != 0)
  {
    -[VideoRelightingMetal loadCube:](self, "loadCube:", *(&off_1E6936DD8 + a3));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = texColorCubeStaticArray[v4];
    texColorCubeStaticArray[v4] = (MTLTexture *)v6;

  }
  v8 = atomic_load((unsigned __int8 *)&qword_1EF12D778);
  p_inst_props = &OBJC_PROTOCOL___CVAVideoPipeline.inst_props;
  if ((v8 & 1) == 0)
  {
    v11 = __cxa_guard_acquire(&qword_1EF12D778);
    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___CVAVideoPipeline + 56);
    if (v11)
    {
      v14 = texColorCubeStaticArray;
      v15 = v4;
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

      byte_1EF12D770 = v13;
      __cxa_guard_release(&qword_1EF12D778);
      p_inst_props = &OBJC_PROTOCOL___CVAVideoPipeline.inst_props;
      texColorCubeStaticArray = v14;
      v4 = v15;
    }
  }
  if (*((_BYTE *)p_inst_props + 1904))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ColorCube: %@"), off_1E6936D50[v4]);

  }
  return texColorCubeStaticArray[v4];
}

- (void)initCommon
{
  void *v3;
  void *v4;
  void *v5;
  CVAFilterColorAlphaToFgBg *v6;
  CVAFilterColorAlphaToFgBg *v7;
  CVAFilterColorAlphaToFgBg *colorAlphaToFgBg;
  CVAFilterMaskedVariableBlur *v9;
  CVAFilterMaskedVariableBlur *v10;
  CVAFilterMaskedVariableBlur *blurPyramidForSkinFg;
  CIColor *v12;
  CIColor *backgroundColor;
  BOOL *v14;
  BOOL *m_buff;
  uint64_t v16;
  char *v17;
  char *v18;
  int64_t v19;
  char *v20;
  id *v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  char *v27;
  int v28;
  uint64_t v29;
  optional<boost::accumulators::accumulator_set<float, boost::accumulators::stats<boost::accumulators::tag::rolling_variance>>> *p_faceConfidenceRollingVariance;
  char *v31;
  uint64_t v32;
  _DWORD *v33;
  VideoRelightingMetal *v34;
  _DWORD *v35;
  _DWORD *v36;
  id *v37;
  int v38;
  _DWORD *v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  id *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  dispatch_semaphore_t v54;
  OS_dispatch_semaphore *inflightSemaphore;
  dispatch_queue_t v56;
  OS_dispatch_queue *synchronousRelightingCallbackQueue;
  void *v58;
  void *v59;
  vector<unsigned short, std::allocator<unsigned short>> *p_faceKitMeshTris;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int16 *end;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  int v71;
  char *value;
  unsigned __int16 *v73;
  unsigned __int16 *begin;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  unsigned __int16 *v81;
  unint64_t v82;
  unsigned __int16 *v83;
  unsigned __int16 v84;
  uint64_t v85;
  int v86;
  unsigned __int16 *v87;
  unsigned __int16 *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  unsigned __int16 *v95;
  unint64_t v96;
  unsigned __int16 *v97;
  unsigned __int16 v98;
  uint64_t v99;
  int v100;
  unsigned __int16 *v101;
  unsigned __int16 *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  unsigned __int16 *v109;
  unint64_t v110;
  unsigned __int16 *v111;
  unsigned __int16 v112;
  int v113;
  unsigned __int16 *v114;
  unsigned __int16 *v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  _BYTE *v121;
  unsigned __int16 *v122;
  unint64_t v123;
  unsigned __int16 *v124;
  unsigned __int16 v125;
  int v126;
  unsigned __int16 *v127;
  uint64_t v128;
  uint64_t v129;
  unsigned __int16 *v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  _BYTE *v136;
  unsigned __int16 *v137;
  unint64_t v138;
  unsigned __int16 *v139;
  unsigned __int16 v140;
  int v141;
  unsigned __int16 *v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  _BYTE *v148;
  unsigned __int16 *v149;
  unint64_t v150;
  unsigned __int16 *v151;
  unsigned __int16 v152;
  unint64_t v153;
  unint64_t v154;
  uint64_t v155;
  _OWORD *v156;
  __int128 *v157;
  unint64_t v158;
  __int128 v159;
  uint64_t v160;
  _OWORD *v161;
  unsigned __int16 *v162;
  unint64_t v163;
  __int128 v164;
  uint64_t v165;
  _OWORD *v166;
  __int128 *v167;
  unint64_t v168;
  __int128 v169;
  uint64_t v170;
  _OWORD *v171;
  __int128 *v172;
  unint64_t v173;
  __int128 v174;
  uint64_t v175;
  _OWORD *v176;
  __int128 *v177;
  unint64_t v178;
  __int128 v179;
  uint64_t v180;
  _OWORD *v181;
  __int128 *v182;
  unint64_t v183;
  __int128 v184;
  void *v185;
  uint64_t v186;
  MTLBuffer *indexBufferImmutable;
  uint64_t v188;
  NSData *faceKitMeshTexcoords;
  void *v190;
  _QWORD *v191;
  id *v192;
  uint64_t v193;
  uint64_t *v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  int v204;
  unint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  _BYTE *v212;
  _WORD *v213;
  unint64_t v214;
  char *v215;
  __int16 v216;
  unint64_t v217;
  uint64_t v218;
  _OWORD *v219;
  char *v220;
  unint64_t v221;
  __int128 v222;
  uint64_t v223;
  CVAPhotoExceptionThirdPartyAPIMismatch *v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  VideoRelightingMetal *v236;
  void *__p;
  char *v238;
  char *v239;
  char *v240;
  uint64_t v241;
  int v242;
  uint64_t v243;
  std::logic_error v244;
  char *v245;
  char *v246;
  uint64_t v247;
  _QWORD v248[2];
  _QWORD v249[2];
  id *v250;
  char *v251;
  id *v252;
  char *v253;
  char *v254;
  uint64_t v255;
  int v256;
  uint64_t v257;
  uint64_t v258;

  v258 = *MEMORY[0x1E0C80C00];
  +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_debugFace = objc_msgSend(v4, "BOOLForKey:", CFSTR("CVAPhotoDebugFace"));

    if (self->_debugFace)
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_debugFaceDraw = objc_msgSend(v5, "BOOLForKey:", CFSTR("CVAPhotoDebugFaceDraw"));

    }
    else
    {
      self->_debugFaceDraw = 0;
    }
  }
  -[VideoRelightingMetal initKernelFunctions](self, "initKernelFunctions");
  v6 = -[CVAFilterColorAlphaToFgBg initWithDevice:library:pipelineLibrary:error:]([CVAFilterColorAlphaToFgBg alloc], "initWithDevice:library:pipelineLibrary:error:", self->_device, self->_library, self->_pipelineLibrary, 0);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v6);
  v7 = (CVAFilterColorAlphaToFgBg *)objc_claimAutoreleasedReturnValue();
  colorAlphaToFgBg = self->_colorAlphaToFgBg;
  self->_colorAlphaToFgBg = v7;

  v9 = -[CVAFilterMaskedVariableBlur initWithDevice:library:pipelineLibrary:commandQueue:kernelSize:error:]([CVAFilterMaskedVariableBlur alloc], "initWithDevice:library:pipelineLibrary:commandQueue:kernelSize:error:", self->_device, self->_library, self->_pipelineLibrary, self->_commandQueue, 7, 0);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v9);
  v10 = (CVAFilterMaskedVariableBlur *)objc_claimAutoreleasedReturnValue();
  blurPyramidForSkinFg = self->_blurPyramidForSkinFg;
  self->_blurPyramidForSkinFg = v10;

  objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
  v12 = (CIColor *)objc_claimAutoreleasedReturnValue();
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v12;

  self->_relightingStability = 1.0;
  self->_vignettingScale = 1.0;
  self->_frameIndex = -1;
  v14 = (BOOL *)operator new(3uLL);
  m_buff = self->_faceDetectedRealHistory.m_buff;
  self->_faceDetectedRealHistory.m_buff = v14;
  self->_faceDetectedRealHistory.m_end = v14 + 3;
  self->_faceDetectedRealHistory.m_first = v14;
  self->_faceDetectedRealHistory.m_last = v14;
  self->_faceDetectedRealHistory.m_size = 0;
  if (m_buff)
    operator delete(m_buff);
  sub_1B5689974((uint64_t)&__p, 5);
  LOBYTE(v250) = 0;
  v16 = v241;
  v255 = v241;
  v17 = (char *)__p;
  v18 = v238;
  v19 = v238 - (_BYTE *)__p;
  if (v238 - (_BYTE *)__p < 0)
  {
    std::logic_error::logic_error(&v244, "circular_buffer");
    v244.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
    abort();
  }
  if (v238 == __p)
    v20 = 0;
  else
    v20 = (char *)operator new(v238 - (_BYTE *)__p);
  v233 = v19 >> 2;
  v21 = (id *)&v20[4 * (v19 >> 2)];
  v251 = v20;
  v252 = v21;
  v253 = v20;
  v22 = v20;
  if (v16)
  {
    v23 = v239;
    v22 = v20;
    if (v239)
    {
      v24 = v240;
      v22 = v20;
      do
      {
        v25 = *(_DWORD *)v23;
        v23 += 4;
        *(_DWORD *)v22 = v25;
        v22 += 4;
        if (v23 == v18)
          v23 = v17;
      }
      while (v23 != v24 && v23 != 0);
    }
  }
  if (v22 == (char *)v21)
    v27 = v20;
  else
    v27 = v22;
  v254 = v27;
  v28 = v242;
  v256 = v242;
  v29 = v243;
  v257 = v243;
  LOBYTE(v250) = 1;
  v236 = self;
  p_faceConfidenceRollingVariance = &self->_faceConfidenceRollingVariance;
  if (p_faceConfidenceRollingVariance->m_initialized)
  {
    sub_1B5689A7C((void **)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 7), (void **)&v251);
    *(_DWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 51) = v256;
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 55) = v257;
    if (!(_BYTE)v250)
    {
      v34 = v236;
      goto LABEL_47;
    }
    v21 = v252;
    v31 = v253;
    v32 = v255;
    v20 = v251;
  }
  else
  {
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 39) = v16;
    if (v18 == v17)
      v33 = 0;
    else
      v33 = operator new(v19);
    v35 = &v33[v233];
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 7) = v33;
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 15) = v35;
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 23) = v33;
    v36 = v33;
    if (v16)
    {
      v36 = v33;
      if (v20)
      {
        v36 = v33;
        v37 = (id *)v20;
        do
        {
          v38 = *(_DWORD *)v37;
          v37 = (id *)((char *)v37 + 4);
          *v36++ = v38;
          if (v37 == v21)
            v37 = (id *)v20;
        }
        while (v37 != (id *)v27);
      }
    }
    if (v36 == v35)
      v39 = v33;
    else
      v39 = v36;
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 31) = v39;
    *(_DWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 51) = v28;
    *(_QWORD *)((char *)&p_faceConfidenceRollingVariance->m_storage.dummy_.aligner_ + 55) = v29;
    p_faceConfidenceRollingVariance->m_initialized = 1;
    v32 = v16;
    v31 = v20;
  }
  v34 = v236;
  if (v32 >= ((char *)v21 - v31) >> 2)
    v40 = (unint64_t)((char *)v21 - v20) >> 2;
  else
    v40 = 0;
  v253 = &v31[4 * (v32 - v40)];
  if (v20)
  {
    operator delete(v20);
    v16 = v241;
    v17 = (char *)__p;
    v18 = v238;
    v233 = (v238 - (_BYTE *)__p) >> 2;
  }
  LOBYTE(v250) = 0;
LABEL_47:
  v41 = v233;
  if (v16 < (v18 - v239) >> 2)
    v41 = 0;
  v239 += 4 * (v16 - v41);
  if (v17)
    operator delete(v17);
  v247 = 0;
  v42 = (char *)operator new(0x18uLL);
  v244.__vftable = (std::logic_error_vtbl *)v42;
  v244.__imp_.__imp_ = v42 + 24;
  v245 = v42;
  v246 = v42;
  v241 = 0;
  v43 = (char *)operator new(0x18uLL);
  v44 = v43 + 24;
  __p = v43;
  v238 = v43 + 24;
  v239 = v43;
  v240 = v43;
  v242 = 0;
  operator delete(v42);
  LOBYTE(v250) = 0;
  v255 = 0;
  v45 = (char *)operator new(0x18uLL);
  v46 = (id *)(v45 + 24);
  v251 = v45;
  v252 = (id *)(v45 + 24);
  v253 = v45;
  v254 = v45;
  v256 = 0;
  LOBYTE(v250) = 1;
  if (v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6])
  {
    sub_1B5689A7C((void **)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14), (void **)&v251);
    *(_DWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58) = v256;
    if (!(_BYTE)v250)
    {
      v52 = 0;
      v51 = v43;
      goto LABEL_63;
    }
    v46 = v252;
    v47 = v253;
    v48 = v255;
    v45 = v251;
  }
  else
  {
    *(_QWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46) = 0;
    v49 = (char *)operator new(0x18uLL);
    v48 = 0;
    *(_QWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14) = v49;
    *(_QWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 22) = v49 + 24;
    *(_QWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30) = v49;
    *(_QWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38) = v49;
    *(_DWORD *)((char *)&v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58) = 0;
    v47 = v45;
    v34->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6] = 1;
  }
  if (v48 >= ((char *)v46 - v47) >> 2)
    v50 = (unint64_t)((char *)v46 - v45) >> 2;
  else
    v50 = 0;
  v253 = &v47[4 * (v48 - v50)];
  if (v45)
  {
    operator delete(v45);
    v44 = v238;
    v51 = v239;
    v52 = v241;
    v43 = (char *)__p;
  }
  else
  {
    v52 = 0;
    v51 = v43;
  }
  LOBYTE(v250) = 0;
LABEL_63:
  if (v52 >= (v44 - v51) >> 2)
    v53 = (unint64_t)(v44 - v43) >> 2;
  else
    v53 = 0;
  v239 = &v51[4 * (v52 - v53)];
  if (v43)
    operator delete(v43);
  v54 = dispatch_semaphore_create(5);
  inflightSemaphore = v34->_inflightSemaphore;
  v34->_inflightSemaphore = (OS_dispatch_semaphore *)v54;

  v56 = dispatch_queue_create("_synchronousRelightingCallbackQueue", 0);
  synchronousRelightingCallbackQueue = v34->_synchronousRelightingCallbackQueue;
  v34->_synchronousRelightingCallbackQueue = (OS_dispatch_queue *)v56;

  if (qword_1EF12D648 != -1)
    dispatch_once(&qword_1EF12D648, &unk_1E6936BD0);
  if (byte_1EF12D640 == 1)
  {
    __p = 0;
    v248[0] = qword_1EF12D5A8;
    v248[1] = qword_1EF12D5C8;
    v249[0] = MEMORY[0x1E0C9AAB0];
    v249[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v249, v248, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (off_1EF12D578(v58, &__p))
    {
LABEL_265:

      return;
    }
    v59 = __p;
    if (!__p)
    {
LABEL_264:

      goto LABEL_265;
    }
    p_faceKitMeshTris = &v34->_faceKitMeshTris;
    v34->_faceKitMeshTris.__end_ = v34->_faceKitMeshTris.__begin_;
    v228 = v59;
    objc_msgSend(v59, "objectForKeyedSubscript:", qword_1EF12D538);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "objectForKeyedSubscript:", qword_1EF12D5B0);
    v61 = objc_claimAutoreleasedReturnValue();
    v226 = (void *)v61;
    objc_msgSend(v225, "objectForKeyedSubscript:", qword_1EF12D5B8);
    v229 = objc_claimAutoreleasedReturnValue();
    v227 = v58;
    if (!(v61 | v229))
    {
      end = v34->_faceKitMeshTris.__end_;
      goto LABEL_259;
    }
    v62 = objc_msgSend((id)v61, "length");
    v63 = objc_msgSend(objc_retainAutorelease((id)v61), "bytes");
    v64 = (void *)v229;
    if (v62 < 4)
    {
LABEL_75:
      v65 = objc_msgSend(v64, "length");
      v66 = objc_msgSend(objc_retainAutorelease(v64), "bytes");
      end = p_faceKitMeshTris->__end_;
      if ((unint64_t)(v65 << 28) >> 32)
      {
        v68 = v66;
        v69 = 0;
        v70 = (int)(v65 >> 4);
        if (v70 <= 1)
          v70 = 1;
        v230 = v70;
        v231 = v66;
        while (1)
        {
          v71 = *(_DWORD *)(v68 + 16 * v69);
          value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          if (end < (unsigned __int16 *)value)
          {
            *end = v71;
            v73 = end + 1;
            goto LABEL_102;
          }
          begin = p_faceKitMeshTris->__begin_;
          v75 = (char *)end - (char *)p_faceKitMeshTris->__begin_;
          if (v75 <= -3)
            abort();
          v76 = v75 >> 1;
          v77 = value - (char *)begin;
          if (v77 <= (v75 >> 1) + 1)
            v78 = v76 + 1;
          else
            v78 = v77;
          if (v77 >= 0x7FFFFFFFFFFFFFFELL)
            v79 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v79 = v78;
          if (v79)
          {
            if (v79 < 0)
              sub_1B566A9AC();
            v80 = operator new(2 * v79);
          }
          else
          {
            v80 = 0;
          }
          v81 = (unsigned __int16 *)&v80[2 * v76];
          *v81 = v71;
          v73 = v81 + 1;
          if (end == begin)
          {
            v68 = v231;
            goto LABEL_100;
          }
          v82 = (char *)(end - 1) - (char *)begin;
          if (v82 < 0x5E
            || (v153 = v75 & 0xFFFFFFFFFFFFFFFELL,
                &v80[(v75 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v82 & 0xFFFFFFFFFFFFFFFELL)] > &v80[(v75 & 0xFFFFFFFFFFFFFFFELL)
                                                                                           - 2]))
          {
            v83 = end;
            v68 = v231;
            goto LABEL_97;
          }
          v68 = v231;
          if ((unsigned __int16 *)((char *)end - (v82 & 0xFFFFFFFFFFFFFFFELL) - 2) > end - 1)
            break;
          if ((char *)end - v80 - v153 < 0x20)
          {
            v83 = end;
            goto LABEL_97;
          }
          v160 = (v82 >> 1) + 1;
          v83 = &end[-(v160 & 0xFFFFFFFFFFFFFFF0)];
          v161 = &v80[2 * v76 - 16];
          v162 = end - 8;
          v163 = v160 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v164 = *(_OWORD *)v162;
            *(v161 - 1) = *((_OWORD *)v162 - 1);
            *v161 = v164;
            v161 -= 2;
            v162 -= 16;
            v163 -= 16;
          }
          while (v163);
          v81 -= v160 & 0xFFFFFFFFFFFFFFF0;
          if (v160 != (v160 & 0xFFFFFFFFFFFFFFF0))
            goto LABEL_97;
LABEL_100:
          value = &v80[2 * v79];
          p_faceKitMeshTris->__begin_ = v81;
          p_faceKitMeshTris->__end_ = v73;
          p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)value;
          if (begin)
          {
            operator delete(begin);
            value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          }
LABEL_102:
          v85 = 4 * v69;
          p_faceKitMeshTris->__end_ = v73;
          v232 = 16 * v69;
          v234 = v69;
          v86 = *(_DWORD *)(v68 + ((16 * v69) | 4));
          if (v73 < (unsigned __int16 *)value)
          {
            *v73 = v86;
            v87 = v73 + 1;
            goto LABEL_123;
          }
          v88 = p_faceKitMeshTris->__begin_;
          v89 = (char *)v73 - (char *)p_faceKitMeshTris->__begin_;
          if (v89 <= -3)
            abort();
          v90 = v89 >> 1;
          v91 = value - (char *)v88;
          if (v91 <= (v89 >> 1) + 1)
            v92 = v90 + 1;
          else
            v92 = v91;
          if (v91 >= 0x7FFFFFFFFFFFFFFELL)
            v93 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v93 = v92;
          if (v93)
          {
            if (v93 < 0)
              sub_1B566A9AC();
            v94 = operator new(2 * v93);
          }
          else
          {
            v94 = 0;
          }
          v95 = (unsigned __int16 *)&v94[2 * v90];
          *v95 = v86;
          v87 = v95 + 1;
          if (v73 == v88)
          {
            v68 = v231;
            goto LABEL_121;
          }
          v96 = (char *)(v73 - 1) - (char *)v88;
          if (v96 < 0x5E
            || (v154 = v89 & 0xFFFFFFFFFFFFFFFELL,
                &v94[(v89 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v96 & 0xFFFFFFFFFFFFFFFELL)] > &v94[(v89 & 0xFFFFFFFFFFFFFFFELL)
                                                                                           - 2]))
          {
            v97 = v73;
            v68 = v231;
            goto LABEL_118;
          }
          v68 = v231;
          if ((unsigned __int16 *)((char *)v73 - (v96 & 0xFFFFFFFFFFFFFFFELL) - 2) > v73 - 1)
          {
            v97 = v73;
            do
            {
LABEL_118:
              v98 = *--v97;
              *--v95 = v98;
            }
            while (v97 != v88);
            goto LABEL_121;
          }
          if ((char *)v73 - v94 - v154 < 0x20)
          {
            v97 = v73;
            goto LABEL_118;
          }
          v165 = (v96 >> 1) + 1;
          v97 = &v73[-(v165 & 0xFFFFFFFFFFFFFFF0)];
          v166 = &v94[2 * v90 - 16];
          v167 = (__int128 *)(v73 - 8);
          v168 = v165 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v169 = *v167;
            *(v166 - 1) = *(v167 - 1);
            *v166 = v169;
            v166 -= 2;
            v167 -= 2;
            v168 -= 16;
          }
          while (v168);
          v95 -= v165 & 0xFFFFFFFFFFFFFFF0;
          if (v165 != (v165 & 0xFFFFFFFFFFFFFFF0))
            goto LABEL_118;
LABEL_121:
          value = &v94[2 * v93];
          p_faceKitMeshTris->__begin_ = v95;
          p_faceKitMeshTris->__end_ = v87;
          p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)value;
          if (v88)
          {
            operator delete(v88);
            value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          }
LABEL_123:
          p_faceKitMeshTris->__end_ = v87;
          v99 = v85 | 2;
          v100 = *(_DWORD *)(v68 + 4 * (v85 | 2));
          if (v87 < (unsigned __int16 *)value)
          {
            *v87 = v100;
            v101 = v87 + 1;
            goto LABEL_143;
          }
          v102 = p_faceKitMeshTris->__begin_;
          v103 = (char *)v87 - (char *)p_faceKitMeshTris->__begin_;
          if (v103 <= -3)
            abort();
          v104 = v103 >> 1;
          v105 = value - (char *)v102;
          if (v105 <= (v103 >> 1) + 1)
            v106 = v104 + 1;
          else
            v106 = v105;
          if (v105 >= 0x7FFFFFFFFFFFFFFELL)
            v107 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v107 = v106;
          if (v107)
          {
            if (v107 < 0)
              sub_1B566A9AC();
            v108 = operator new(2 * v107);
          }
          else
          {
            v108 = 0;
          }
          v109 = (unsigned __int16 *)&v108[2 * v104];
          *v109 = v100;
          v101 = v109 + 1;
          if (v87 != v102)
          {
            v110 = (char *)(v87 - 1) - (char *)v102;
            if (v110 >= 0x5E)
            {
              if (&v108[(v103 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v110 & 0xFFFFFFFFFFFFFFFELL)] > &v108[(v103 & 0xFFFFFFFFFFFFFFFELL) - 2])
              {
                v111 = v87;
              }
              else if ((unsigned __int16 *)((char *)v87 - (v110 & 0xFFFFFFFFFFFFFFFELL) - 2) > v87 - 1)
              {
                v111 = v87;
              }
              else if ((unint64_t)((char *)v87 - &v108[v103 & 0xFFFFFFFFFFFFFFFELL]) >= 0x20)
              {
                v170 = (v110 >> 1) + 1;
                v111 = &v87[-(v170 & 0xFFFFFFFFFFFFFFF0)];
                v171 = &v108[2 * v104 - 16];
                v172 = (__int128 *)(v87 - 8);
                v173 = v170 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  v174 = *v172;
                  *(v171 - 1) = *(v172 - 1);
                  *v171 = v174;
                  v171 -= 2;
                  v172 -= 2;
                  v173 -= 16;
                }
                while (v173);
                v109 -= v170 & 0xFFFFFFFFFFFFFFF0;
                if (v170 == (v170 & 0xFFFFFFFFFFFFFFF0))
                  goto LABEL_140;
              }
              else
              {
                v111 = v87;
              }
            }
            else
            {
              v111 = v87;
            }
            do
            {
              v112 = *--v111;
              *--v109 = v112;
            }
            while (v111 != v102);
          }
LABEL_140:
          value = &v108[2 * v107];
          p_faceKitMeshTris->__begin_ = v109;
          p_faceKitMeshTris->__end_ = v101;
          p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)value;
          if (v102)
          {
            operator delete(v102);
            value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          }
          v68 = v231;
LABEL_143:
          p_faceKitMeshTris->__end_ = v101;
          v113 = *(_DWORD *)(v68 + 4 * v85);
          if (v101 < (unsigned __int16 *)value)
          {
            *v101 = v113;
            v114 = v101 + 1;
            goto LABEL_162;
          }
          v115 = p_faceKitMeshTris->__begin_;
          v116 = (char *)v101 - (char *)p_faceKitMeshTris->__begin_;
          if (v116 <= -3)
            abort();
          v117 = v116 >> 1;
          v118 = value - (char *)v115;
          if (v118 <= (v116 >> 1) + 1)
            v119 = v117 + 1;
          else
            v119 = v118;
          if (v118 >= 0x7FFFFFFFFFFFFFFELL)
            v120 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v120 = v119;
          if (v120)
          {
            if (v120 < 0)
              sub_1B566A9AC();
            v121 = operator new(2 * v120);
          }
          else
          {
            v121 = 0;
          }
          v122 = (unsigned __int16 *)&v121[2 * v117];
          *v122 = v113;
          v114 = v122 + 1;
          if (v101 != v115)
          {
            v123 = (char *)(v101 - 1) - (char *)v115;
            if (v123 < 0x5E)
            {
              v124 = v101;
              goto LABEL_159;
            }
            if (&v121[(v116 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v123 & 0xFFFFFFFFFFFFFFFELL)] > &v121[(v116 & 0xFFFFFFFFFFFFFFFELL)
                                                                                                - 2])
            {
              v124 = v101;
              do
              {
LABEL_159:
                v125 = *--v124;
                *--v122 = v125;
              }
              while (v124 != v115);
              goto LABEL_160;
            }
            if ((unsigned __int16 *)((char *)v101 - (v123 & 0xFFFFFFFFFFFFFFFELL) - 2) > v101 - 1)
            {
              v124 = v101;
              goto LABEL_159;
            }
            if ((char *)v101 - v121 - (v116 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
            {
              v124 = v101;
              goto LABEL_159;
            }
            v175 = (v123 >> 1) + 1;
            v124 = &v101[-(v175 & 0xFFFFFFFFFFFFFFF0)];
            v176 = &v121[2 * v117 - 16];
            v177 = (__int128 *)(v101 - 8);
            v178 = v175 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v179 = *v177;
              *(v176 - 1) = *(v177 - 1);
              *v176 = v179;
              v176 -= 2;
              v177 -= 2;
              v178 -= 16;
            }
            while (v178);
            v122 -= v175 & 0xFFFFFFFFFFFFFFF0;
            if (v175 != (v175 & 0xFFFFFFFFFFFFFFF0))
              goto LABEL_159;
          }
LABEL_160:
          value = &v121[2 * v120];
          p_faceKitMeshTris->__begin_ = v122;
          p_faceKitMeshTris->__end_ = v114;
          p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)value;
          if (v115)
          {
            operator delete(v115);
            value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          }
LABEL_162:
          p_faceKitMeshTris->__end_ = v114;
          v126 = *(_DWORD *)(v68 + 4 * v99);
          if (v114 < (unsigned __int16 *)value)
          {
            *v114 = v126;
            v127 = v114 + 1;
            v128 = v232;
            v129 = v234;
            goto LABEL_183;
          }
          v130 = p_faceKitMeshTris->__begin_;
          v131 = (char *)v114 - (char *)p_faceKitMeshTris->__begin_;
          v129 = v234;
          if (v131 <= -3)
            abort();
          v132 = v131 >> 1;
          v133 = value - (char *)v130;
          if (v133 <= (v131 >> 1) + 1)
            v134 = v132 + 1;
          else
            v134 = v133;
          if (v133 >= 0x7FFFFFFFFFFFFFFELL)
            v135 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v135 = v134;
          if (v135)
          {
            if (v135 < 0)
              sub_1B566A9AC();
            v136 = operator new(2 * v135);
          }
          else
          {
            v136 = 0;
          }
          v137 = (unsigned __int16 *)&v136[2 * v132];
          *v137 = v126;
          v127 = v137 + 1;
          if (v114 == v130)
          {
            v128 = v232;
            goto LABEL_181;
          }
          v138 = (char *)(v114 - 1) - (char *)v130;
          if (v138 < 0x5E
            || &v136[(v131 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v138 & 0xFFFFFFFFFFFFFFFELL)] > &v136[(v131 & 0xFFFFFFFFFFFFFFFELL)
                                                                                              - 2]
            || (unsigned __int16 *)((char *)v114 - (v138 & 0xFFFFFFFFFFFFFFFELL) - 2) > v114 - 1
            || (char *)v114 - v136 - (v131 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
          {
            v139 = v114;
            v128 = v232;
            do
            {
LABEL_178:
              v140 = *--v139;
              *--v137 = v140;
            }
            while (v139 != v130);
            goto LABEL_181;
          }
          v155 = (v138 >> 1) + 1;
          v139 = &v114[-(v155 & 0xFFFFFFFFFFFFFFF0)];
          v156 = &v136[2 * v132 - 16];
          v157 = (__int128 *)(v114 - 8);
          v158 = v155 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v159 = *v157;
            *(v156 - 1) = *(v157 - 1);
            *v156 = v159;
            v156 -= 2;
            v157 -= 2;
            v158 -= 16;
          }
          while (v158);
          v137 -= v155 & 0xFFFFFFFFFFFFFFF0;
          v128 = v232;
          if (v155 != (v155 & 0xFFFFFFFFFFFFFFF0))
            goto LABEL_178;
LABEL_181:
          value = &v136[2 * v135];
          p_faceKitMeshTris->__begin_ = v137;
          p_faceKitMeshTris->__end_ = v127;
          p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)value;
          if (v130)
          {
            operator delete(v130);
            value = (char *)p_faceKitMeshTris->__end_cap_.__value_;
          }
LABEL_183:
          p_faceKitMeshTris->__end_ = v127;
          v141 = *(_DWORD *)(v68 + (v128 | 0xC));
          if (v127 >= (unsigned __int16 *)value)
          {
            v142 = p_faceKitMeshTris->__begin_;
            v143 = (char *)v127 - (char *)p_faceKitMeshTris->__begin_;
            if (v143 <= -3)
              abort();
            v144 = v143 >> 1;
            v145 = value - (char *)v142;
            if (v145 <= (v143 >> 1) + 1)
              v146 = v144 + 1;
            else
              v146 = v145;
            if (v145 >= 0x7FFFFFFFFFFFFFFELL)
              v147 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v147 = v146;
            if (v147)
            {
              if (v147 < 0)
                sub_1B566A9AC();
              v148 = operator new(2 * v147);
            }
            else
            {
              v148 = 0;
            }
            v149 = (unsigned __int16 *)&v148[2 * v144];
            *v149 = v141;
            end = v149 + 1;
            if (v127 == v142)
            {
              v34 = v236;
            }
            else
            {
              v150 = (char *)(v127 - 1) - (char *)v142;
              v34 = v236;
              if (v150 < 0x5E)
              {
                v151 = v127;
                goto LABEL_198;
              }
              if (&v148[(v143 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v150 & 0xFFFFFFFFFFFFFFFELL)] > &v148[(v143 & 0xFFFFFFFFFFFFFFFELL) - 2])
              {
                v151 = v127;
                goto LABEL_198;
              }
              if ((unsigned __int16 *)((char *)v127 - (v150 & 0xFFFFFFFFFFFFFFFELL) - 2) > v127 - 1)
              {
                v151 = v127;
                goto LABEL_198;
              }
              if ((char *)v127 - v148 - (v143 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
              {
                v151 = v127;
                goto LABEL_198;
              }
              v180 = (v150 >> 1) + 1;
              v151 = &v127[-(v180 & 0xFFFFFFFFFFFFFFF0)];
              v181 = &v148[2 * v144 - 16];
              v182 = (__int128 *)(v127 - 8);
              v183 = v180 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                v184 = *v182;
                *(v181 - 1) = *(v182 - 1);
                *v181 = v184;
                v181 -= 2;
                v182 -= 2;
                v183 -= 16;
              }
              while (v183);
              v149 -= v180 & 0xFFFFFFFFFFFFFFF0;
              if (v180 != (v180 & 0xFFFFFFFFFFFFFFF0))
              {
                do
                {
LABEL_198:
                  v152 = *--v151;
                  *--v149 = v152;
                }
                while (v151 != v142);
              }
            }
            p_faceKitMeshTris->__begin_ = v149;
            p_faceKitMeshTris->__end_ = end;
            p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)&v148[2 * v147];
            if (v142)
              operator delete(v142);
            goto LABEL_80;
          }
          *v127 = v141;
          end = v127 + 1;
          v34 = v236;
LABEL_80:
          p_faceKitMeshTris->__end_ = end;
          v69 = v129 + 1;
          if (v69 == v230)
            goto LABEL_259;
        }
        v83 = end;
        do
        {
LABEL_97:
          v84 = *--v83;
          *--v81 = v84;
        }
        while (v83 != begin);
        goto LABEL_100;
      }
LABEL_259:
      v185 = (void *)-[MTLDeviceSPI newBufferWithBytes:length:options:](v34->_device, "newBufferWithBytes:length:options:", p_faceKitMeshTris->__begin_, (char *)end - (char *)p_faceKitMeshTris->__begin_, 0);
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v185);
      v186 = objc_claimAutoreleasedReturnValue();
      indexBufferImmutable = v34->_indexBufferImmutable;
      v34->_indexBufferImmutable = (MTLBuffer *)v186;

      objc_msgSend(v225, "objectForKeyedSubscript:", qword_1EF12D5A0);
      v188 = objc_claimAutoreleasedReturnValue();
      faceKitMeshTexcoords = v34->_faceKitMeshTexcoords;
      v34->_faceKitMeshTexcoords = (NSData *)v188;

      objc_msgSend(v228, "objectForKeyedSubscript:", qword_1EF12D598);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = operator new(0x20uLL);
      *v191 = &v34->_indexOfCheekLandmark_topLeft;
      v191[1] = &v34->_indexOfCheekLandmark_topRight;
      v191[2] = &v34->_indexOfCheekLandmark_bottomLeft;
      v191[3] = &v34->_indexOfCheekLandmark_bottomRight;
      v192 = (id *)operator new(0x20uLL);
      v251 = (char *)(v192 + 4);
      v252 = v192 + 4;
      *v192 = CFSTR("CheekLeft0");
      v192[1] = CFSTR("CheekRight0");
      v192[2] = CFSTR("CheekLeft4");
      v192[3] = CFSTR("CheekRight4");
      v250 = v192;
      v58 = v227;
      v193 = objc_msgSend(v190, "indexOfObject:");
      v34->_indexOfCheekLandmark_topLeft = v193;
      if (v193 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v223 = 0;
      }
      else
      {
        v194 = (uint64_t *)v191[1];
        v195 = objc_msgSend(v190, "indexOfObject:", v192[1]);
        *v194 = v195;
        if (v195 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v223 = 1;
        }
        else
        {
          v196 = (uint64_t *)v191[2];
          v197 = objc_msgSend(v190, "indexOfObject:", v192[2]);
          *v196 = v197;
          if (v197 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v223 = 2;
          }
          else
          {
            v198 = (uint64_t *)v191[3];
            v199 = objc_msgSend(v190, "indexOfObject:", v192[3]);
            *v198 = v199;
            if (v199 != 0x7FFFFFFFFFFFFFFFLL)
            {

              operator delete(v192);
              operator delete(v191);

              v59 = v228;
              goto LABEL_264;
            }
            v223 = 3;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FaceKit bad API - landmark %@ not found."), v192[v223]);
      v224 = -[CVAPhotoExceptionThirdPartyAPIMismatch initWithReason:]([CVAPhotoExceptionThirdPartyAPIMismatch alloc], "initWithReason:", (id)objc_claimAutoreleasedReturnValue());
      objc_exception_throw(v224);
    }
    v200 = 0;
    if (v62 >> 2 <= 1)
      v201 = 1;
    else
      v201 = v62 >> 2;
    v202 = (char *)v34->_faceKitMeshTris.__end_;
    v235 = v63;
    while (1)
    {
      v204 = *(_DWORD *)(v63 + 4 * v200);
      v205 = (unint64_t)p_faceKitMeshTris->__end_cap_.__value_;
      if ((unint64_t)v202 >= v205)
        break;
      *(_WORD *)v202 = v204;
      v203 = v202 + 2;
LABEL_272:
      p_faceKitMeshTris->__end_ = (unsigned __int16 *)v203;
      ++v200;
      v202 = v203;
      if (v200 == v201)
        goto LABEL_75;
    }
    v206 = (char *)p_faceKitMeshTris->__begin_;
    v207 = v202 - (char *)p_faceKitMeshTris->__begin_;
    if (v207 <= -3)
      abort();
    v208 = v207 >> 1;
    v209 = v205 - (_QWORD)v206;
    if (v209 <= (v207 >> 1) + 1)
      v210 = v208 + 1;
    else
      v210 = v209;
    if (v209 >= 0x7FFFFFFFFFFFFFFELL)
      v211 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v211 = v210;
    if (v211)
    {
      if (v211 < 0)
        sub_1B566A9AC();
      v212 = operator new(2 * v211);
    }
    else
    {
      v212 = 0;
    }
    v213 = &v212[2 * v208];
    *v213 = v204;
    v203 = (char *)(v213 + 1);
    if (v202 == v206)
    {
      v64 = (void *)v229;
    }
    else
    {
      v214 = v202 - 2 - v206;
      if (v214 < 0x5E
        || (v217 = v207 & 0xFFFFFFFFFFFFFFFELL,
            &v212[(v207 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v214 & 0xFFFFFFFFFFFFFFFELL)] > &v212[(v207 & 0xFFFFFFFFFFFFFFFELL)
                                                                                           - 2]))
      {
        v215 = v202;
        v64 = (void *)v229;
      }
      else
      {
        v64 = (void *)v229;
        if (&v202[-(v214 & 0xFFFFFFFFFFFFFFFELL) - 2] > v202 - 2)
        {
          v215 = v202;
        }
        else if ((unint64_t)(v202 - &v212[v217]) >= 0x20)
        {
          v218 = (v214 >> 1) + 1;
          v215 = &v202[-2 * (v218 & 0xFFFFFFFFFFFFFFF0)];
          v219 = &v212[2 * v208 - 16];
          v220 = v202 - 16;
          v221 = v218 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v222 = *(_OWORD *)v220;
            *(v219 - 1) = *((_OWORD *)v220 - 1);
            *v219 = v222;
            v219 -= 2;
            v220 -= 32;
            v221 -= 16;
          }
          while (v221);
          v213 -= v218 & 0xFFFFFFFFFFFFFFF0;
          if (v218 == (v218 & 0xFFFFFFFFFFFFFFF0))
            goto LABEL_291;
        }
        else
        {
          v215 = v202;
        }
      }
      do
      {
        v216 = *((_WORD *)v215 - 1);
        v215 -= 2;
        *--v213 = v216;
      }
      while (v215 != v206);
    }
LABEL_291:
    p_faceKitMeshTris->__begin_ = v213;
    p_faceKitMeshTris->__end_ = (unsigned __int16 *)v203;
    p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)&v212[2 * v211];
    if (v206)
      operator delete(v206);
    v63 = v235;
    v34 = v236;
    goto LABEL_272;
  }
}

- (VideoRelightingMetal)initWithMetalContext:(void *)a3
{
  VideoRelightingMetal *v4;
  VideoRelightingMetal *v5;
  VideoRelightingMetal *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideoRelightingMetal;
  v4 = -[ImageSaverAndFileConfigRegistrator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_device, *(id *)a3);
    objc_storeStrong((id *)&v5->_commandQueue, *((id *)a3 + 1));
    objc_storeStrong((id *)&v5->_library, *((id *)a3 + 2));
    objc_storeStrong((id *)&v5->_pipelineLibrary, *((id *)a3 + 3));
    v5->_metalContext = a3;
    -[VideoRelightingMetal initCommon](v5, "initCommon");
    v6 = v5;
  }

  return v5;
}

- (void)saveTexture:(id)a3 toImage:(id)a4
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  size_t v12;
  char *v13;
  size_t v14;
  size_t v15;
  __int16 *v16;
  __int16 *v17;
  _BYTE *v18;
  int v19;
  float v25;
  float v28;
  float v31;
  float v34;
  double v35;
  unint64_t v36;
  BOOL v38;
  int v39;
  char *v40;
  unsigned int v41;
  char v42;
  size_t v43;
  CGDataProvider *v44;
  CGColorSpace *DeviceRGB;
  CGImageRef v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char v52;
  char v53;
  char v54;
  void *v55;
  _QWORD v56[6];
  _QWORD v57[6];

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "pixelFormat") != 80
    && objc_msgSend(v7, "pixelFormat") != 70
    && objc_msgSend(v7, "pixelFormat") != 115)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoRelightingMetal.mm"), 708, CFSTR("unsupported pixel format!"));

  }
  v9 = (double)(unint64_t)objc_msgSend(v7, "width");
  v10 = (double)(unint64_t)objc_msgSend(v7, "height");
  v11 = v9 * v10;
  v12 = vcvtd_n_u64_f64(v9 * v10, 2uLL);
  v13 = (char *)malloc_type_malloc(v12, 0xAEA05369uLL);
  v14 = vcvtd_n_u64_f64(v9, 2uLL);
  if (objc_msgSend(v7, "pixelFormat") == 115)
  {
    if ((v12 & 0x8000000000000000) != 0)
      v15 = -1;
    else
      v15 = 2 * v12;
    v16 = (__int16 *)operator new[]();
    bzero(v16, v15);
    memset(v57, 0, 24);
    v57[3] = (unint64_t)v9;
    v57[4] = (unint64_t)v10;
    v57[5] = 1;
    objc_msgSend(v7, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v16, 2 * v14, v57, 0);
    if (v11 > 0.0)
    {
      v17 = v16 + 2;
      v18 = v13 + 1;
      v19 = 1;
      do
      {
        _H0 = *(v17 - 2);
        __asm { FCVT            S0, H0 }
        v25 = _S0 * 255.0;
        if (v25 > 255.0)
          v25 = 255.0;
        *(v18 - 1) = (int)v25;
        _H0 = *(v17 - 1);
        __asm { FCVT            S0, H0 }
        v28 = _S0 * 255.0;
        if (v28 > 255.0)
          v28 = 255.0;
        *v18 = (int)v28;
        _H0 = *v17;
        __asm { FCVT            S0, H0 }
        v31 = _S0 * 255.0;
        if (v31 > 255.0)
          v31 = 255.0;
        v18[1] = (int)v31;
        _H0 = v17[1];
        __asm { FCVT            S0, H0 }
        v34 = _S0 * 255.0;
        if (v34 > 255.0)
          v34 = 255.0;
        v18[2] = (int)v34;
        v35 = (double)v19++;
        v17 += 4;
        v18 += 4;
      }
      while (v11 > v35);
    }
    MEMORY[0x1B5E4DE64](v16, 0x1000C80BDFB0063);
  }
  else
  {
    memset(v56, 0, 24);
    v56[3] = (unint64_t)v9;
    v56[4] = (unint64_t)v10;
    v56[5] = 1;
    objc_msgSend(v7, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v13, v14, v56, 0);
    if (objc_msgSend(v7, "pixelFormat") == 80 && v12)
    {
      if (v12 >= 5
        && ((v36 = (v12 - 1) >> 2, (~(_DWORD)v36 & 0x3FFFFFFF) != 0) ? (_ZF = v36 >> 30 == 0) : (_ZF = 0),
            _ZF ? (v38 = (v12 - 1) >> 34 == 0) : (v38 = 0),
            v38))
      {
        v48 = v36 + 1;
        v49 = (v36 + 1) & 0x7FFFFFFFFFFFFFFELL;
        v50 = v13 + 4;
        v51 = v49;
        do
        {
          v52 = *(v50 - 4);
          v53 = *v50;
          v54 = v50[2];
          *(v50 - 4) = *(v50 - 2);
          *v50 = v54;
          *(v50 - 2) = v52;
          v50[2] = v53;
          v50 += 8;
          v51 -= 2;
        }
        while (v51);
        if (v48 == v49)
          goto LABEL_34;
        v39 = 4 * v49;
        v40 = &v13[4 * v49];
      }
      else
      {
        v39 = 0;
        v40 = v13;
      }
      v41 = v39 + 4;
      do
      {
        v42 = *v40;
        *v40 = v40[2];
        v40[2] = v42;
        v40 += 4;
        v43 = v41;
        v41 += 4;
      }
      while (v43 < v12);
    }
  }
LABEL_34:
  v44 = CGDataProviderCreateWithData(0, v13, v12, (CGDataProviderReleaseDataCallback)sub_1B5689C14);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v46 = CGImageCreate((unint64_t)v9, (unint64_t)v10, 8uLL, 0x20uLL, v14, DeviceRGB, 0x4001u, v44, 0, 0, kCGRenderingIntentDefault);
  v47 = objc_retainAutorelease(v8);
  objc_msgSend(v47, "UTF8String");
  CGImageWriteToFile();
  CFRelease(v44);
  CFRelease(DeviceRGB);
  CFRelease(v46);

}

- (void)configureRenderPipeline
{
  void *v3;
  void *v4;
  MTLDepthStencilState *v5;
  MTLDepthStencilState *depthStencilState;
  MTLRenderPassDescriptor *v7;
  MTLRenderPassDescriptor *tcRenderDesc;
  MTLTexture *tcTexture;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MTLTexture *tcDepthTexture;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = (void *)objc_opt_new();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v3);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setDepthCompareFunction:", 1);
  objc_msgSend(v15, "setDepthWriteEnabled:", 1);
  v4 = (void *)-[MTLDeviceSPI newDepthStencilStateWithDescriptor:](self->_device, "newDepthStencilStateWithDescriptor:", v15);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v4);
  v5 = (MTLDepthStencilState *)objc_claimAutoreleasedReturnValue();
  depthStencilState = self->_depthStencilState;
  self->_depthStencilState = v5;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:");
  v7 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  tcRenderDesc = self->_tcRenderDesc;
  self->_tcRenderDesc = v7;

  tcTexture = self->_tcTexture;
  -[MTLRenderPassDescriptor colorAttachments](self->_tcRenderDesc, "colorAttachments");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTexture:", tcTexture);

  -[MTLRenderPassDescriptor colorAttachments](self->_tcRenderDesc, "colorAttachments");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLoadAction:", 2);

  -[MTLRenderPassDescriptor colorAttachments](self->_tcRenderDesc, "colorAttachments");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStoreAction:", 1);

  -[MTLRenderPassDescriptor colorAttachments](self->_tcRenderDesc, "colorAttachments");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  tcDepthTexture = self->_tcDepthTexture;
  -[MTLRenderPassDescriptor depthAttachment](self->_tcRenderDesc, "depthAttachment");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:", tcDepthTexture);

  -[MTLRenderPassDescriptor depthAttachment](self->_tcRenderDesc, "depthAttachment");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLoadAction:", 2);

  -[MTLRenderPassDescriptor depthAttachment](self->_tcRenderDesc, "depthAttachment");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStoreAction:", 1);

  -[MTLRenderPassDescriptor depthAttachment](self->_tcRenderDesc, "depthAttachment");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClearDepth:", 1.0);

}

- (void)updateModelAndPose:(void *)a3 camera:(void *)a4
{
  FaceKitStreamedData *p_faceKitStreamedData;
  _OWORD *v7;
  _OWORD *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t *v15;
  _OWORD *v16[3];
  _OWORD *v17[3];

  p_faceKitStreamedData = &self->_faceKitStreamedData;
  sub_1B5674EC0(self->_faceKitStreamedData.intrinsics, a4);
  v7 = operator new(0x40uLL);
  v17[1] = v7 + 4;
  v17[2] = v7 + 4;
  *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v17[0] = v7;
  sub_1B5675048(p_faceKitStreamedData->camR, p_faceKitStreamedData->camT, v17);
  v8 = operator new(0x40uLL);
  v16[1] = v8 + 4;
  v16[2] = v8 + 4;
  *v8 = 0u;
  v8[1] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  v16[0] = v8;
  sub_1B5675048(p_faceKitStreamedData->poseR, p_faceKitStreamedData->poseT, v16);
  v9 = *((float32x4_t *)v7 + 1);
  v10 = *((float32x4_t *)v7 + 2);
  v11 = *((float32x4_t *)v7 + 3);
  v12 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[1])), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 20))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 24))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 28)));
  v13 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[2])), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 36))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 40))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 44)));
  v14 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[3])), v9, COERCE_FLOAT(*(_QWORD *)((char *)v8 + 52))), v10, COERCE_FLOAT(*((_QWORD *)v8 + 7))), v11, *((float *)v8 + 15));
  v15 = *(float32x4_t **)a3;
  *v15 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(*v8)), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 4))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 8))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 12)));
  v15[1] = v12;
  v15[2] = v13;
  v15[3] = v14;
  -[VideoRelightingMetal setModelVertices](self, "setModelVertices");
  operator delete(v8);
  operator delete(v7);
}

- (void)setModelVertices
{
  vector<FaceVertex, std::allocator<FaceVertex>> *p_modelVertices;
  char *v4;
  NSUInteger v5;
  _QWORD *v6;
  optional<unsigned long> *p_closestLeftCheekVertexID;
  void *v8;
  CVAPhotoMTLRingBuffer *vertexBuffer;
  CVAPhotoMTLRingBuffer *v10;
  uint64_t v11;
  CVAPhotoMTLRingBuffer *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  FaceVertex *end;
  float v19;
  char *v20;
  float32x4_t v21;
  uint64_t v22;
  FaceVertex *value;
  FaceVertex *begin;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  FaceVertex *v31;
  __int128 v32;
  __int128 v33;
  FaceVertex *v34;
  float32x4_t v35;
  float32x4_t v36;
  float v37;
  VideoRelightingMetal *v38;
  id v39;
  id v40[2];

  p_modelVertices = &self->_modelVertices;
  self->_modelVertices.__end_ = self->_modelVertices.__begin_;
  v4 = -[NSData bytes](self->_faceKitStreamedData.verticesPos, "bytes");
  v5 = -[NSData length](self->_faceKitStreamedData.verticesPos, "length");
  v6 = -[NSData bytes](self->_faceKitMeshTexcoords, "bytes");
  v38 = self;
  p_closestLeftCheekVertexID = &self->_closestLeftCheekVertexID;
  p_closestLeftCheekVertexID->m_initialized = 0;
  if (v5 >= 0xC)
  {
    v15 = v6;
    v16 = 0;
    v17 = v5 / 0xC;
    end = p_modelVertices->__end_;
    v19 = 3.4028e38;
    do
    {
      v20 = &v4[12 * v16];
      v21.i64[0] = *(_QWORD *)v20;
      v21.i32[2] = *((_DWORD *)v20 + 2);
      v21.i32[3] = 1.0;
      v22 = v15[v16];
      value = p_modelVertices->__end_cap_.__value_;
      if (end >= value)
      {
        begin = p_modelVertices->__begin_;
        v25 = 0xAAAAAAAAAAAAAAABLL * ((end - p_modelVertices->__begin_) >> 4);
        v26 = v25 + 1;
        if (v25 + 1 > 0x555555555555555)
          abort();
        v27 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 4);
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x2AAAAAAAAAAAAAALL)
          v28 = 0x555555555555555;
        else
          v28 = v26;
        *(float32x4_t *)v40 = v21;
        if (v28)
        {
          if (v28 > 0x555555555555555)
            sub_1B566A9AC();
          v29 = (char *)operator new(48 * v28);
          v21 = *(float32x4_t *)v40;
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[48 * v25];
        *(float32x4_t *)v30 = v21;
        *((_OWORD *)v30 + 1) = xmmword_1B56AC1A0;
        *((_QWORD *)v30 + 4) = v22;
        if (end == begin)
        {
          v34 = end;
          v31 = (FaceVertex *)&v29[48 * v25];
        }
        else
        {
          v31 = (FaceVertex *)&v29[48 * v25];
          do
          {
            v32 = *((_OWORD *)end - 3);
            v33 = *((_OWORD *)end - 1);
            *((_OWORD *)v31 - 2) = *((_OWORD *)end - 2);
            *((_OWORD *)v31 - 1) = v33;
            *((_OWORD *)v31 - 3) = v32;
            v31 = (FaceVertex *)((char *)v31 - 48);
            end = (FaceVertex *)((char *)end - 48);
          }
          while (end != begin);
          v34 = p_modelVertices->__begin_;
        }
        end = (FaceVertex *)(v30 + 48);
        p_modelVertices->__begin_ = v31;
        p_modelVertices->__end_ = (FaceVertex *)(v30 + 48);
        p_modelVertices->__end_cap_.__value_ = (FaceVertex *)&v29[48 * v28];
        if (v34)
        {
          operator delete(v34);
          v21 = *(float32x4_t *)v40;
        }
      }
      else
      {
        *(float32x4_t *)end = v21;
        *((_OWORD *)end + 1) = xmmword_1B56AC1A0;
        *((_QWORD *)end + 4) = v22;
        end = (FaceVertex *)((char *)end + 48);
      }
      v35 = vaddq_f32(v21, (float32x4_t)xmmword_1B56AC1B0);
      v36 = vmulq_f32(v35, v35);
      p_modelVertices->__end_ = end;
      v37 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0];
      if (v37 < v19)
      {
        p_closestLeftCheekVertexID->m_storage = v16;
        p_closestLeftCheekVertexID->m_initialized = 1;
        v19 = v37;
      }
      ++v16;
    }
    while (v16 != v17);
  }
  -[VideoRelightingMetal generateModelNormals](v38, "generateModelNormals");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", p_modelVertices->__begin_, p_modelVertices->__end_ - p_modelVertices->__begin_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  vertexBuffer = v38->_vertexBuffer;
  if (!vertexBuffer)
  {
    v10 = -[CVAPhotoMTLRingBuffer initWithLength:options:device:]([CVAPhotoMTLRingBuffer alloc], "initWithLength:options:device:", objc_msgSend(v8, "length"), 0, v38->_device);
    +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v38->_vertexBuffer;
    v38->_vertexBuffer = (CVAPhotoMTLRingBuffer *)v11;

    vertexBuffer = v38->_vertexBuffer;
  }
  -[CVAPhotoMTLRingBuffer advancedBuffer](vertexBuffer, "advancedBuffer");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (void *)objc_msgSend(v13, "contents");
  v39 = objc_retainAutorelease(v8);
  memcpy(v14, (const void *)objc_msgSend(v39, "bytes"), objc_msgSend(v39, "length"));

}

- (void)generateModelNormals
{
  vector<FaceVertex, std::allocator<FaceVertex>> *p_modelVertices;
  FaceVertex *begin;
  FaceVertex *i;
  unsigned __int16 *v5;
  unint64_t v6;
  unsigned __int16 *v7;
  float32x4_t *v8;
  float32x4_t *v9;
  float32x4_t *v10;
  float32x4_t v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x4_t v14;
  FaceVertex *j;
  FaceVertex *v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x2_t v19;
  float32x2_t v20;

  p_modelVertices = &self->_modelVertices;
  begin = self->_modelVertices.__begin_;
  for (i = self->_modelVertices.__end_; begin != i; begin = (FaceVertex *)((char *)begin + 48))
    *((_OWORD *)begin + 1) = 0uLL;
  v5 = self->_faceKitMeshTris.__begin_;
  if (self->_faceKitMeshTris.__end_ != v5)
  {
    v6 = 0;
    do
    {
      v7 = &v5[v6];
      v8 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * *v7);
      v9 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * v7[1]);
      v10 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * v7[2]);
      v11 = vsubq_f32(*v9, *v8);
      v12 = vsubq_f32(*v10, *v8);
      v13 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v11)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL));
      v14 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v13, v13), (int8x16_t)v13, 0xCuLL);
      v8[1] = vaddq_f32(v8[1], v14);
      v9[1] = vaddq_f32(v9[1], v14);
      v10[1] = vaddq_f32(v14, v10[1]);
      v6 += 3;
      v5 = self->_faceKitMeshTris.__begin_;
    }
    while (v6 < self->_faceKitMeshTris.__end_ - v5);
  }
  v16 = p_modelVertices->__begin_;
  for (j = self->_modelVertices.__end_; v16 != j; v16 = (FaceVertex *)((char *)v16 + 48))
  {
    v17 = *((float32x4_t *)v16 + 1);
    v18 = (int32x4_t)vmulq_f32(v17, v17);
    v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
    v19 = vrsqrte_f32((float32x2_t)v18.u32[0]);
    v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v19, v19)));
    *((float32x4_t *)v16 + 1) = vmulq_n_f32(v17, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20))).f32[0]);
  }
}

- (void)updateMatrixWithWidth:(int)a3 height:(int)a4 camera:(const void *)a5 pose:(const void *)a6
{
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float v12;
  unsigned int v13;
  unint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v18;
  float32x4_t v19;
  int32x4_t v20;
  optional<float> *p_cheekAngle;
  optional<unsigned long> *p_closestLeftCheekVertexID;
  float32x4_t v27;
  int32x4_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x4_t v31;
  float v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  float v38;
  uint64_t v39;

  v7 = *(float32x4_t *)*(_QWORD *)a6;
  *(float32x4_t *)&self->_anon_2c0[4] = v7;
  v8 = *(float32x4_t *)(*(_QWORD *)a6 + 16);
  *(float32x4_t *)&self->_anon_2c0[20] = v8;
  v9 = *(float32x4_t *)(*(_QWORD *)a6 + 32);
  *(float32x4_t *)&self->_anon_2c0[36] = v9;
  v10 = *(float32x4_t *)(*(_QWORD *)a6 + 48);
  *(float32x4_t *)&self->_anon_2c0[52] = v10;
  v11 = vaddq_f32(v10, vmlaq_f32(vmlaq_f32(vmulq_f32(v7, (float32x4_t)0), (float32x4_t)0, v8), (float32x4_t)0, v9));
  *(float32x4_t *)&self->_face3DCenter[4] = v11;
  v12 = fmaxf((float)(v11.f32[2] + 800.0) + -50.0, 1.0);
  *(float32x2_t *)v8.f32 = vdiv_f32((float32x2_t)0xC000000040000000, vcvt_f32_s32((int32x2_t)__PAIR64__(a4, a3)));
  *(float *)&v13 = **(float **)a5 * v8.f32[0];
  LODWORD(v14) = 0;
  HIDWORD(v14) = vmuls_lane_f32(*(float *)(*(_QWORD *)a5 + 16), *(float32x2_t *)v8.f32, 1);
  *(float32x2_t *)v15.f32 = vmla_f32((float32x2_t)0x3F800000BF800000, vadd_f32(*(float32x2_t *)(*(_QWORD *)a5 + 24), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)v8.f32);
  v15.f32[2] = (float)((float)(v11.f32[2] + 800.0) + 50.0) / v12;
  v15.i32[3] = 1.0;
  v9.i64[0] = 0;
  v9.i32[3] = 0;
  v9.f32[2] = (float)((float)((float)(v11.f32[2] + 800.0) * -2.0) * 50.0) / v12;
  *(_OWORD *)&self->_anon_300[4] = v13;
  *(_OWORD *)&self->_anon_300[20] = v14;
  *(float32x4_t *)&self->_anon_300[36] = v15;
  *(float32x4_t *)&self->_anon_300[52] = v9;
  v16 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[4])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[4], 1), v15, *(float32x4_t *)&self->_anon_2c0[4], 2), v9, *(float32x4_t *)&self->_anon_2c0[4], 3);
  _Q2 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[20])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[20], 1), v15, *(float32x4_t *)&self->_anon_2c0[20], 2), v9, *(float32x4_t *)&self->_anon_2c0[20], 3);
  v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[36])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[36], 1), v15, *(float32x4_t *)&self->_anon_2c0[36], 2), v9, *(float32x4_t *)&self->_anon_2c0[36], 3);
  v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[52])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[52], 1), v15, *(float32x4_t *)&self->_anon_2c0[52], 2), v9, *(float32x4_t *)&self->_anon_2c0[52], 3);
  *(float32x4_t *)&self->_anon_280[4] = v16;
  *(float32x4_t *)&self->_anon_280[20] = _Q2;
  v20 = (int32x4_t)vaddq_f32(v19, vmlaq_f32(vmlaq_f32(vmulq_f32(v16, (float32x4_t)0), (float32x4_t)0, _Q2), (float32x4_t)0, v18));
  *(float32x2_t *)v20.i8 = vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_laneq_s32(v20, 3));
  __asm { FMOV            V2.2S, #1.0 }
  v9.i64[0] = vadd_f32(*(float32x2_t *)v20.i8, *(float32x2_t *)_Q2.f32).u32[0];
  v9.i32[1] = vsub_f32(*(float32x2_t *)&_Q2, *(float32x2_t *)&v20).i32[1];
  *(float32x4_t *)&self->_anon_280[36] = v18;
  *(float32x4_t *)&self->_anon_280[52] = v19;
  *(float32x2_t *)&self->_faceModelCenterProjected[4] = vmul_f32(*(float32x2_t *)v9.f32, (float32x2_t)0x3F0000003F000000);
  p_cheekAngle = &self->_cheekAngle;
  self->_cheekAngle.m_initialized = 0;
  p_closestLeftCheekVertexID = &self->_closestLeftCheekVertexID;
  if (self->_closestLeftCheekVertexID.m_initialized)
  {
    v27 = *((float32x4_t *)self->_modelVertices.__begin_ + 3 * self->_closestLeftCheekVertexID.m_storage + 1);
    v27.i32[1] = 0;
    v28 = (int32x4_t)vmulq_f32(v27, v27);
    v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
    v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
    v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
    v31 = vmulq_f32(vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]), (float32x4_t)xmmword_1B56AC1C0);
    v32 = fabsf(acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]))+ -1.57079633;
    p_cheekAngle->m_storage = v32;
    p_cheekAngle->m_initialized = 1;
    if (!self->_debugFace)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cheek angle = %.1f"), (float)(v32 * 57.296));
  }
  else
  {
    if (!self->_debugFace)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cheek angle = FATAL ERROR: not found"), v39);
  }

LABEL_7:
  if (self->_debugFaceDraw && p_closestLeftCheekVertexID->m_initialized)
  {
    v33 = *((float32x4_t *)self->_modelVertices.__begin_ + 3 * p_closestLeftCheekVertexID->m_storage + 1);
    v33.i32[1] = 0;
    v34 = (int32x4_t)vmulq_f32(v33, v33);
    v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    v37 = vmulq_f32(vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]), (float32x4_t)xmmword_1B56AC1C0);
    v38 = fabsf(acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]))+ -1.57079633;
    p_cheekAngle->m_storage = v38;
    p_cheekAngle->m_initialized = 1;
  }
}

- (void)updateUniforms:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64x2_t v8;
  unsigned __int8 v9;
  CIColor *backgroundColor;
  unsigned int v11;
  CIColor *v12;
  double v13;
  float64_t v14;
  float64x2_t v15;
  double v16;
  float32x4_t v17;
  MTLTexture **p_texSelectedColorCube;
  MTLTexture *texSelectedColorCube;
  VideoRelightingMetal *v20;
  uint64_t v21;
  void *v22;
  void *colorCubeUserData;
  MTLTexture *v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned __int8 v31;
  unsigned __int8 v32;
  uint64_t *v33;
  unsigned int v35;
  unsigned __int8 v38;
  float v41;
  unint64_t v42;
  float v43;
  float v44;
  float32x4_t v45;
  int32x4_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x4_t v49;
  float32x4_t v50;
  int32x4_t v51;
  float32x2_t v52;
  float32x2_t v53;
  float32x4_t v54;
  float v56;
  float v57;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  float *v62;
  float32x2_t v63;
  float *v64;
  float32x2_t v65;
  float *v66;
  float32x2_t v67;
  float *v68;
  float32x2_t v69;
  float32x2_t v71;
  float32x2_t v72;
  float32x2_t v73;
  float32x2_t v74;
  float32x2_t v75;
  float32x2_t v77;
  float32x4_t v78;
  int16x4_t v79;
  float32x2_t v80;
  float v81;
  float32x2_t v82;
  float32x2_t v83;
  float v84;
  float32x2_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v97;
  float v100;
  float v105;
  float v106;
  float v107;
  float v108;
  float v111;
  float v114;
  unsigned __int8 v119;
  float m_storage;
  float v121;
  float v122;
  float v123;
  float v127;
  float v128;
  unint64_t v129;
  float v130;
  unsigned __int8 v131;
  unsigned __int8 v132;
  float32x4_t v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float32x4_t v144;
  int32x4_t v145;
  float32x2_t v146;
  float32x2_t v147;
  float32x4_t v148;
  float32x4_t v149;
  int32x4_t v150;
  float32x2_t v151;
  float32x2_t v152;
  float32x4_t v153;
  float v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  float v159;
  float v160;
  unint64_t v161;
  float v162;
  float proxyToFaceEffectLerpTemporal;
  float v164;
  double v165;
  float *v166;
  float *v167;
  uint64_t v168;
  uint64_t v169;
  float *v170;
  float *v171;
  _DWORD *v172;
  float *v173;
  float *v174;
  uint64_t v175;
  _DWORD *v176;
  float v177;
  float *v178;
  float *v179;
  float v180;
  float v181;
  _BOOL8 faceDetected;
  float v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  float v189;
  double v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  float v197;
  float v202;
  float v203;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  double v210;
  double v211;
  double v212;
  void *v213;
  char v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  float32x2_t v220;
  float32x2_t v221;
  float v222;
  float32x2_t v223;
  float32x4_t v224;
  float32x4_t v225;
  float32x4_t v226;
  float64_t v227;
  float32x4_t v228;
  float64_t v229;
  float32x2_t v230;
  unsigned int v231;
  float32x2_t v232;
  float32x4_t v233;
  char *v234[4];

  v3 = a3;
  self->_uniformBuffer_slide = *(SlideUniforms *)&self->_faceModelCenterProjected[4];
  v5 = &self->_anon_220[4];
  v6 = -[MTLTexture width](self->_dstTexture, "width");
  v7 = -[MTLTexture height](self->_dstTexture, "height");
  v8.i64[0] = v6;
  v8.i64[1] = v7;
  *(float32x2_t *)v5 = vdiv_f32((float32x2_t)0x4000000040000000, vcvt_f32_f64(vcvtq_f64_u64(v8)));
  v9 = atomic_load((unsigned __int8 *)&qword_1EF12D788);
  if ((v9 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D788))
  {
    LODWORD(v210) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v210);
    qword_1EF12D780 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D788);
  }
  if ((byte_1EF12D790 & 1) == 0)
  {
    HIBYTE(v234[2]) = 15;
    strcpy((char *)v234, "backgroundAlpha");
    sub_1B5667F7C((uint64_t)&qword_1EF12D780, (uint64_t)v234);
    if (SHIBYTE(v234[2]) < 0)
      operator delete(v234[0]);
    byte_1EF12D790 = 1;
  }
  backgroundColor = self->_backgroundColor;
  objc_msgSend((id)qword_1EF12D780, "floatValue");
  v231 = v11;
  v12 = backgroundColor;
  -[CIColor red](v12, "red");
  v229 = v13;
  -[CIColor green](v12, "green");
  v227 = v14;
  -[CIColor blue](v12, "blue");
  v15.f64[0] = v229;
  v15.f64[1] = v227;
  *(float *)&v16 = v16;
  LODWORD(v227) = LODWORD(v16);
  v230 = vcvt_f32_f64(v15);

  *(float32x2_t *)v17.f32 = v230;
  v17.i64[1] = __PAIR64__(v231, LODWORD(v227));
  *((float16x4_t *)v5 + 1) = vcvt_f16_f32(v17);
  if ((byte_1EF12D791 & 1) == 0)
  {
    strcpy((char *)v234, "userFriendlyConfigName");
    HIBYTE(v234[2]) = 22;
    sub_1B5667F7C((uint64_t)&qword_1EF12D2C8, (uint64_t)v234);
    if (SHIBYTE(v234[2]) < 0)
      operator delete(v234[0]);
    byte_1EF12D791 = 1;
  }
  p_texSelectedColorCube = &self->_texSelectedColorCube;
  texSelectedColorCube = self->_texSelectedColorCube;
  self->_texSelectedColorCube = 0;

  if (!objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STAGE LIGHT MONO")))
  {
    if (objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STAGE LIGHT CUSTOM MONO")))
    {
      if (v3)
      {
        v20 = self;
        v21 = 6;
        goto LABEL_16;
      }
LABEL_31:
      v22 = *p_texSelectedColorCube;
      *p_texSelectedColorCube = 0;
      goto LABEL_32;
    }
    if (objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STUDIO LIGHT")))
    {
      if (v3)
        v25 = 3;
      else
        v25 = 0;
    }
    else
    {
      if ((objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("CONTOUR LIGHT")) & 1) == 0
        && !objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STAGE LIGHT")))
      {
        goto LABEL_31;
      }
      if (v3)
        v25 = 4;
      else
        v25 = 1;
    }
    -[VideoRelightingMetal getInternalColorCube:](self, "getInternalColorCube:", v25);
    v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    v22 = *p_texSelectedColorCube;
    *p_texSelectedColorCube = v24;
    goto LABEL_32;
  }
  if (!v3)
  {
    colorCubeUserData = self->_colorCubeUserData;
    if (colorCubeUserData)
      colorCubeUserData = self->_texColorCubeUserData;
    v24 = colorCubeUserData;
    goto LABEL_30;
  }
  v20 = self;
  v21 = 5;
LABEL_16:
  -[VideoRelightingMetal getInternalColorCube:](v20, "getInternalColorCube:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_texSelectedColorCube, v22);
LABEL_32:

  v26 = atomic_load((unsigned __int8 *)&qword_1EF12D7A0);
  if ((v26 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D7A0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    qword_1EF12D798 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D7A0);
  }
  if ((byte_1EF12D7A8 & 1) == 0)
  {
    HIBYTE(v234[2]) = 15;
    strcpy((char *)v234, "applyCubeOnFace");
    sub_1B5667F7C((uint64_t)&qword_1EF12D798, (uint64_t)v234);
    if (SHIBYTE(v234[2]) < 0)
      operator delete(v234[0]);
    byte_1EF12D7A8 = 1;
  }
  _S0 = (float)(objc_msgSend((id)qword_1EF12D798, "BOOLValue") ^ 1);
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 11) = LOWORD(_S0);
  v31 = atomic_load((unsigned __int8 *)&qword_1EF12D7B8);
  if ((v31 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D7B8))
  {
    LODWORD(v211) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v211);
    qword_1EF12D7B0 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D7B8);
  }
  if ((byte_1EF12D7C0 & 1) == 0)
  {
    HIBYTE(v234[2]) = 21;
    strcpy((char *)v234, "colorCubeIntensity_v1");
    sub_1B5667F7C((uint64_t)&qword_1EF12D7B0, (uint64_t)v234);
    if (SHIBYTE(v234[2]) < 0)
      operator delete(v234[0]);
    byte_1EF12D7C0 = 1;
  }
  v32 = atomic_load((unsigned __int8 *)&qword_1EF12D7D0);
  if ((v32 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D7D0))
  {
    LODWORD(v212) = 1.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v212);
    qword_1EF12D7C8 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D7D0);
  }
  if ((byte_1EF12D7D8 & 1) == 0)
  {
    HIBYTE(v234[2]) = 21;
    strcpy((char *)v234, "colorCubeIntensity_v2");
    sub_1B5667F7C((uint64_t)&qword_1EF12D7C8, (uint64_t)v234);
    if (SHIBYTE(v234[2]) < 0)
      operator delete(v234[0]);
    byte_1EF12D7D8 = 1;
  }
  v33 = &qword_1EF12D7B0;
  if (v3)
    v33 = &qword_1EF12D7C8;
  objc_msgSend((id)*v33, "floatValue");
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 12) = _S0;
  if ((objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STAGE LIGHT")) & 1) != 0)
    v35 = 1;
  else
    v35 = objc_msgSend((id)qword_1EF12D2C8, "isEqualToString:", CFSTR("STAGE LIGHT MONO"));
  _S0 = (float)v35;
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 13) = LOWORD(_S0);
  _S0 = self->_vignettingScale;
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 14) = LOWORD(_S0);
  v38 = atomic_load((unsigned __int8 *)&qword_1EF12D7E0);
  if ((v38 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D7E0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = objc_msgSend(v213, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

    byte_1EF12D7D9 = v214;
    __cxa_guard_release(&qword_1EF12D7E0);
  }
  if (byte_1EF12D7D9)
  {
    _H0 = *((_WORD *)v5 + 12);
    __asm { FCVT            D0, H0 }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ColorCube.intensity = %.2f"), _D0);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ColorCube.applyOnFace = %d"), objc_msgSend((id)qword_1EF12D798, "intValue"));
  }
  v41 = 1.0;
  v42 = 0x1EF12B000;
  v43 = 1.0;
  v44 = 1.0;
  if (self->_faceDetected)
  {
    v224 = *(float32x4_t *)&self->_anon_2c0[20];
    v225 = *(float32x4_t *)&self->_anon_2c0[4];
    v226 = *(float32x4_t *)&self->_anon_2c0[36];
    v228 = *(float32x4_t *)&self->_anon_2c0[52];
    v45 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v225, (float32x4_t)0, v224), (float32x4_t)0, v226), (float32x4_t)0, v228);
    v46 = (int32x4_t)vmulq_f32(v45, v45);
    v46.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v46, 2), vadd_f32(*(float32x2_t *)v46.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v46.i8, 1))).u32[0];
    v47 = vrsqrte_f32((float32x2_t)v46.u32[0]);
    v48 = vmul_f32(v47, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(v47, v47)));
    v49 = vmulq_n_f32(v45, vmul_f32(v48, vrsqrts_f32((float32x2_t)v46.u32[0], vmul_f32(v48, v48))).f32[0]);
    v50 = *(float32x4_t *)&self->_face3DCenter[4];
    v51 = (int32x4_t)vmulq_f32(v50, v50);
    v51.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v51, 2), vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v51.i8, 1))).u32[0];
    v52 = vrsqrte_f32((float32x2_t)v51.u32[0]);
    v53 = vmul_f32(v52, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v52, v52)));
    v54 = vmulq_f32(v49, vmulq_n_f32(v50, vmul_f32(v53, vrsqrts_f32((float32x2_t)v51.u32[0], vmul_f32(v53, v53))).f32[0]));
    _S12 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).f32[0])+ -1.57079633;
    if (v3)
    {
      v56 = (float)(fabsf(_S12 * 57.296) + -15.0) / 30.0;
      v57 = 1.0 - v56;
      if (v56 >= 1.0)
        v57 = 0.0;
      if (v56 >= 0.0)
        v43 = v57;
      else
        v43 = 1.0;
    }
    v58 = -[NSData bytes](self->_faceKitStreamedData.landmarks, "bytes");
    v59 = -[MTLTexture width](self->_dstTexture, "width");
    v60 = -[MTLTexture height](self->_dstTexture, "height");
    if (!self->_trustAlpha)
    {
      v62 = (float *)&v58[8 * self->_indexOfCheekLandmark_bottomRight];
      v63.f32[0] = *v62 / (float)v59;
      v63.f32[1] = v62[1] / (float)v60;
      v223 = v63;
      v64 = (float *)&v58[8 * self->_indexOfCheekLandmark_topRight];
      v65.f32[0] = *v64 / (float)v59;
      v65.f32[1] = v64[1] / (float)v60;
      v66 = (float *)&v58[8 * self->_indexOfCheekLandmark_bottomLeft];
      v67.f32[0] = *v66 / (float)v59;
      v67.f32[1] = v66[1] / (float)v60;
      v68 = (float *)&v58[8 * self->_indexOfCheekLandmark_topLeft];
      v69.f32[0] = *v68 / (float)v59;
      v69.f32[1] = v68[1] / (float)v60;
      *(float32x2_t *)_Q1.f32 = vadd_f32(v63, vadd_f32(v65, vadd_f32(v67, v69)));
      __asm { FMOV            V3.2S, #0.25 }
      v71 = vmul_f32(*(float32x2_t *)_Q1.f32, _D3);
      *((float32x2_t *)v5 + 4) = v71;
      __asm { FCVT            H1, S12 }
      *((_WORD *)v5 + 20) = _Q1.i16[0];
      v72 = vsub_f32(v69, v71);
      v220 = v67;
      v221 = vsub_f32(v65, v71);
      *(float32x2_t *)_Q1.f32 = vadd_f32(v72, v221);
      v73 = vmul_f32(*(float32x2_t *)_Q1.f32, *(float32x2_t *)_Q1.f32);
      v73.i32[0] = vadd_f32(v73, (float32x2_t)vdup_lane_s32((int32x2_t)v73, 1)).u32[0];
      v74 = vrsqrte_f32((float32x2_t)v73.u32[0]);
      v75 = vmul_f32(v74, vrsqrts_f32((float32x2_t)v73.u32[0], vmul_f32(v74, v74)));
      _D2 = vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)vmul_f32(v75, vrsqrts_f32((float32x2_t)v73.u32[0], vmul_f32(v75, v75))), 0));
      *(float32x2_t *)_Q1.f32 = vmul_f32(*(float32x2_t *)_Q1.f32, _D2);
      _D2.i32[0] = _Q1.i32[1];
      v77 = (float32x2_t)vzip1_s32(vdup_lane_s32(*(int32x2_t *)_Q1.f32, 1), *(int32x2_t *)_Q1.f32);
      v78 = _Q1;
      v78.i32[1] = vneg_f32(*(float32x2_t *)&_Q1).i32[1];
      v232 = *(float32x2_t *)v78.f32;
      v79 = (int16x4_t)vcvt_f16_f32(v78);
      __asm { FCVT            H2, S2 }
      *(int32x2_t *)(v5 + 44) = vzip1_s32((int32x2_t)v79, (int32x2_t)vzip1_s16((int16x4_t)_D2, v79));
      v80 = vmla_lane_f32(vmul_n_f32(*(float32x2_t *)v78.f32, v72.f32[0]), v77, v72, 1);
      v81 = atan2f(v80.f32[1], v80.f32[0]);
      v82 = vsub_f32(v220, v71);
      v83 = vmla_lane_f32(vmul_n_f32(v232, v82.f32[0]), v77, v82, 1);
      v84 = atan2f(v83.f32[1], v83.f32[0]);
      v85 = vmla_lane_f32(vmul_n_f32(v232, v221.f32[0]), v77, v221, 1);
      v222 = atan2f(v85.f32[1], v85.f32[0]);
      v86 = vsub_f32(v223, v71);
      v87 = vmla_lane_f32(vmul_n_f32(v232, v86.f32[0]), v77, v86, 1);
      v88 = atan2f(v87.f32[1], v87.f32[0]);
      v89 = atomic_load((unsigned __int8 *)&qword_1EF12D7F0);
      if ((v89 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D7F0))
      {
        LODWORD(v217) = 25.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v217);
        qword_1EF12D7E8 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D7F0);
      }
      if ((byte_1EF12D7F8 & 1) == 0)
      {
        HIBYTE(v234[2]) = 20;
        strcpy((char *)v234, "faceSideAngleFadeTop");
        sub_1B5667F7C((uint64_t)&qword_1EF12D7E8, (uint64_t)v234);
        if (SHIBYTE(v234[2]) < 0)
          operator delete(v234[0]);
        byte_1EF12D7F8 = 1;
      }
      v90 = atomic_load((unsigned __int8 *)&qword_1EF12D808);
      if ((v90 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D808))
      {
        LODWORD(v218) = 25.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v218);
        qword_1EF12D800 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D808);
      }
      if ((byte_1EF12D810 & 1) == 0)
      {
        v234[0] = (char *)operator new(0x19uLL);
        *(_OWORD *)&v234[1] = xmmword_1B56AC1D0;
        strcpy(v234[0], "faceSideAngleFadeBottom");
        sub_1B5667F7C((uint64_t)&qword_1EF12D800, (uint64_t)v234);
        if (SHIBYTE(v234[2]) < 0)
          operator delete(v234[0]);
        byte_1EF12D810 = 1;
      }
      objc_msgSend((id)qword_1EF12D7E8, "floatValue");
      v92 = v81 - (float)(v91 * 0.017453);
      v93 = fminf(v92, 3.1416);
      if (v92 >= -3.1416)
        v94 = v93;
      else
        v94 = -3.1416;
      objc_msgSend((id)qword_1EF12D800, "floatValue");
      _S0 = v84 + (float)(v97 * 0.017453);
      _S1 = fminf(_S0, 3.1416);
      if (_S0 >= -3.1416)
        v100 = _S1;
      else
        v100 = -3.1416;
      if (v81 <= v84 && v94 < v81 && v84 < v100)
      {
        if (v94 != v81)
        {
          _S0 = 1.0 / (float)(v81 - v94);
          __asm { FCVT            H0, S0 }
          _H3 = 0;
          _S1 = 0.0 - (float)(v94 / (float)(v81 - v94));
          __asm { FCVT            H1, S1 }
        }
        if (v100 != v84)
        {
          _S3 = 1.0 / (float)(v84 - v100);
          __asm { FCVT            H3, S3 }
          _S2 = 0.0 - (float)(v100 / (float)(v84 - v100));
          __asm { FCVT            H4, S2 }
        }
      }
      *((_WORD *)v5 + 32) = LOWORD(_S0);
      *((_WORD *)v5 + 33) = LOWORD(_S1);
      *((_WORD *)v5 + 34) = _H3;
      *((_WORD *)v5 + 35) = _H4;
      *((_DWORD *)v5 + 18) = 1006632960;
      objc_msgSend((id)qword_1EF12D7E8, "floatValue");
      v106 = v222 + (float)(v105 * 0.017453);
      v107 = fminf(v106, 3.1416);
      if (v106 >= -3.1416)
        v108 = v107;
      else
        v108 = -3.1416;
      objc_msgSend((id)qword_1EF12D800, "floatValue");
      _S0 = v88 - (float)(v111 * 0.017453);
      _S1 = fminf(_S0, 3.1416);
      if (_S0 >= -3.1416)
        v114 = _S1;
      else
        v114 = -3.1416;
      if (v222 < v108 && v88 <= v222 && v114 < v88)
      {
        if (v114 != v88)
        {
          _S0 = 1.0 / (float)(v88 - v114);
          __asm { FCVT            H0, S0 }
          _H2 = 0;
          _S1 = 0.0 - (float)(v114 / (float)(v88 - v114));
          __asm { FCVT            H1, S1 }
        }
        if (v108 != v222)
        {
          _S2 = 1.0 / (float)(v222 - v108);
          __asm { FCVT            H2, S2 }
          _S3 = 0.0 - (float)(v108 / (float)(v222 - v108));
          __asm { FCVT            H3, S3 }
        }
      }
      *((_WORD *)v5 + 26) = LOWORD(_S0);
      *((_WORD *)v5 + 27) = LOWORD(_S1);
      *((_WORD *)v5 + 28) = _H2;
      *((_WORD *)v5 + 29) = _H3;
      *((_DWORD *)v5 + 15) = 1006632960;
      v119 = atomic_load((unsigned __int8 *)&qword_1EF12D820);
      if ((v119 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D820))
      {
        LODWORD(v219) = 1093926912;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v219);
        qword_1EF12D818 = objc_claimAutoreleasedReturnValue();
        __cxa_guard_release(&qword_1EF12D820);
      }
      if ((byte_1EF12D828 & 1) == 0)
      {
        HIBYTE(v234[2]) = 14;
        strcpy((char *)v234, "cheekFadeAngle");
        sub_1B5667F7C((uint64_t)&qword_1EF12D818, (uint64_t)v234);
        if (SHIBYTE(v234[2]) < 0)
          operator delete(v234[0]);
        byte_1EF12D828 = 1;
      }
      m_storage = self->_cheekAngle.m_storage;
      objc_msgSend((id)qword_1EF12D818, "floatValue");
      v122 = m_storage + (float)(v121 * -0.017453);
      v123 = self->_cheekAngle.m_storage;
      if (v122 != v123)
      {
        _S1 = v122 - v123;
        _S2 = 1.0 / _S1;
        _S0 = 0.0 - (float)(v123 / _S1);
        __asm
        {
          FCVT            H1, S2
          FCVT            H0, S0
        }
        *((_DWORD *)v5 + 19) = LOWORD(_S1) | (LOWORD(_S0) << 16);
      }
      *((_DWORD *)v5 + 20) = 1006632960;
    }
    v233 = *(float32x4_t *)&self->_face3DCenter[4];
    v127 = *((float *)self->_modelVertices.__begin_ + 12 * self->_closestLeftCheekVertexID.m_storage);
    v128 = *(float *)&self->_anon_300[24];
    v129 = -[MTLTexture width](self->_dstTexture, "width");
    if (v129 >= -[MTLTexture height](self->_dstTexture, "height"))
      v130 = fabsf(v128);
    else
      v130 = fabsf(*(float *)&self->_anon_300[4]);
    v131 = atomic_load((unsigned __int8 *)&qword_1EF12D838);
    if ((v131 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D838))
    {
      LODWORD(v215) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v215);
      qword_1EF12D830 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D838);
    }
    if ((byte_1EF12D840 & 1) == 0)
    {
      HIBYTE(v234[2]) = 16;
      strcpy((char *)v234, "faceSizeCVMLNear");
      sub_1B5667F7C((uint64_t)&qword_1EF12D830, (uint64_t)v234);
      if (SHIBYTE(v234[2]) < 0)
        operator delete(v234[0]);
      byte_1EF12D840 = 1;
    }
    v132 = atomic_load((unsigned __int8 *)&qword_1EF12D850);
    if ((v132 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D850))
    {
      LODWORD(v216) = 0.25;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v216);
      qword_1EF12D848 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D850);
    }
    if ((byte_1EF12D858 & 1) == 0)
    {
      HIBYTE(v234[2]) = 15;
      strcpy((char *)v234, "faceSizeCVMLFar");
      sub_1B5667F7C((uint64_t)&qword_1EF12D848, (uint64_t)v234);
      if (SHIBYTE(v234[2]) < 0)
        operator delete(v234[0]);
      byte_1EF12D858 = 1;
    }
    v133 = vmulq_f32(v233, v233);
    v134 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v133, 2), vaddq_f32(v133, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v133.f32, 1))).f32[0])/ 1000.0;
    v135 = (float)((float)(fabsf(v127) / 1000.0) * v130) / v134;
    objc_msgSend((id)qword_1EF12D830, "floatValue");
    v137 = v136 / 1.2264;
    objc_msgSend((id)qword_1EF12D848, "floatValue");
    v139 = (float)((float)((float)(1.0 / v135) - (float)(1.0 / v137))
                 / (float)((float)(1.0 / (float)(v138 / 1.2264)) - (float)(1.0 / v137)))
         + 0.0;
    v140 = fminf(v139, 1.0);
    if (v139 >= 0.0)
      v141 = v140;
    else
      v141 = 0.0;
    self->_lightMapsNearFarLerp = v141;
    v142 = (float)(v141 * -0.5) + 1.0;
    v143 = fminf(v142, 1.0);
    if (v142 >= 0.5)
      v44 = v143;
    else
      v44 = 0.5;
    if (!self->_debugFace)
    {
      v42 = 0x1EF12B000;
LABEL_146:
      v41 = 1.0;
      goto LABEL_147;
    }
    v144 = vmlaq_f32(vmlaq_f32(vaddq_f32(v224, vmulq_f32(v225, (float32x4_t)0)), (float32x4_t)0, v226), (float32x4_t)0, v228);
    v145 = (int32x4_t)vmulq_f32(v144, v144);
    v145.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v145, 2), vadd_f32(*(float32x2_t *)v145.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v145.i8, 1))).u32[0];
    v146 = vrsqrte_f32((float32x2_t)v145.u32[0]);
    v147 = vmul_f32(v146, vrsqrts_f32((float32x2_t)v145.u32[0], vmul_f32(v146, v146)));
    v148 = vmulq_n_f32(v144, vmul_f32(v147, vrsqrts_f32((float32x2_t)v145.u32[0], vmul_f32(v147, v147))).f32[0]);
    v149 = *(float32x4_t *)&self->_face3DCenter[4];
    v150 = (int32x4_t)vmulq_f32(v149, v149);
    v150.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v150, 2), vadd_f32(*(float32x2_t *)v150.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v150.i8, 1))).u32[0];
    v151 = vrsqrte_f32((float32x2_t)v150.u32[0]);
    v152 = vmul_f32(v151, vrsqrts_f32((float32x2_t)v150.u32[0], vmul_f32(v151, v151)));
    v153 = vmulq_f32(v148, vmulq_n_f32(v149, vmul_f32(v152, vrsqrts_f32((float32x2_t)v150.u32[0], vmul_f32(v152, v152))).f32[0]));
    v154 = 1.57079633
         - acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v153, 2), vaddq_f32(v153, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v153.f32, 1))).f32[0]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceConfidence = %.0f%%"), (float)(self->_faceKitStreamedData.confidence * 100.0));

    v155 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    if (v155)
    {
      v156 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      v157 = v156 + 4 * v155;
      v158 = v156;
      v42 = 0x1EF12B000;
      if (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23))
      {
LABEL_143:
        v159 = fabsf(_S12 * 57.296);
        v160 = v154 * 57.296;
        v161 = ((v157 - v158) >> 2)
             - (v155 == (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v156) >> 2);
        v162 = 0.0;
        if (v161 >= 2)
          v162 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59)
               / (float)(v161 - 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceConfidence.stddev = %.1f%%"), (float)(sqrtf(v162) * 100.0));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceDistance = %.2fm"), v134);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceSizeProjection = %.0f%%"), (float)(v135 * 100.0));

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lerpNearFar = %.0f%%"), (float)(self->_lightMapsNearFarLerp * 100.0));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceAngleHorAbs = %.0f"), v159);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceAngleVer = %.0f"), v160);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("geometricHaloRemoval = %i"), !self->_trustAlpha);

        goto LABEL_146;
      }
    }
    else
    {
      v156 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      v157 = v156;
      v42 = 0x1EF12B000uLL;
    }
    v158 = v156 + 4 * v155;
    goto LABEL_143;
  }
LABEL_147:
  *(float *)&v165 = v41
                  / (float)(unint64_t)-[CVAVideoPipelinePropertiesSPI proxyToFaceEffectLerpNumFrames](self->_properties, "proxyToFaceEffectLerpNumFrames");
  proxyToFaceEffectLerpTemporal = self->_proxyToFaceEffectLerpTemporal;
  v164 = fmaxf(proxyToFaceEffectLerpTemporal - *(float *)&v165, 0.0);
  *(float *)&v165 = fminf(*(float *)&v165 + proxyToFaceEffectLerpTemporal, v41);
  if (!self->_faceDetected)
    *(float *)&v165 = v164;
  self->_proxyToFaceEffectLerpTemporal = *(float *)&v165;
  v166 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14);
  v167 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 22);
  v168 = v167 - v166;
  v169 = *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46);
  if (v168 == v169)
  {
    if (v167 != v166)
    {
      v170 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38);
      *v170 = v43;
      v171 = v170 + 1;
      if (v171 != v167)
        v166 = v171;
      *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30) = v166;
      *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38) = v166;
    }
    v172 = (_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58);
    goto LABEL_158;
  }
  v173 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38);
  *v173 = v43;
  v174 = v173 + 1;
  if (v174 == v167)
    v174 = v166;
  v175 = v169 + 1;
  *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38) = v174;
  *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46) = v169 + 1;
  v172 = (_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58);
  if (v168 != v169 + 1)
  {
    LODWORD(v165) = *v172;
    if (*(float *)v172 > v43)
    {
      if (v169 == -1)
      {
        v178 = v166;
      }
      else
      {
        v178 = &v166[v175];
        if (*(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30))
        {
LABEL_172:
          *(float *)&v165 = *(float *)&v165
                          - (float)((float)(*(float *)&v165 - v43) / (float)(unint64_t)(v178 - v166));
          goto LABEL_177;
        }
      }
      v166 += v175;
      goto LABEL_172;
    }
    if (*(float *)v172 >= v43)
      goto LABEL_178;
    if (v169 == -1)
    {
      v179 = v166;
    }
    else
    {
      v179 = &v166[v175];
      if (*(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30))
      {
LABEL_175:
        v177 = (float)(v43 - *(float *)&v165) / (float)(unint64_t)(v179 - v166);
LABEL_176:
        *(float *)&v165 = *(float *)&v165 + v177;
        goto LABEL_177;
      }
    }
    v166 += v175;
    goto LABEL_175;
  }
LABEL_158:
  v176 = *(_DWORD **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30);
  LODWORD(v165) = *v176;
  if (*(float *)v176 <= v43)
  {
    if (*(float *)v176 >= v43)
      goto LABEL_178;
    *(float *)&v165 = (float)(v43 - *(float *)&v165) / (float)(unint64_t)(v168 - 1);
    v177 = *(float *)v172;
    goto LABEL_176;
  }
  *(float *)&v165 = *(float *)v172 - (float)((float)(*(float *)&v165 - v43) / (float)(unint64_t)(v168 - 1));
LABEL_177:
  *v172 = LODWORD(v165);
LABEL_178:
  v180 = self->_proxyToFaceEffectLerpTemporal;
  -[CVAVideoPipelinePropertiesSPI relightEffectStrength](self->_properties, "relightEffectStrength", v165);
  self->_proxyToFaceEffectLerpFinal = (float)(v180 * v181) * *(float *)v172;
  self->_relightingStability = self->_proxyToFaceEffectLerpTemporal;
  faceDetected = self->_faceDetected;
  v183 = 0.4;
  if (!self->_faceDetected)
    v183 = 0.1;
  self->_vignettingScale = self->_vignettingScale + (float)((float)(v44 - self->_vignettingScale) * v183);
  if (byte_1EF12D7D9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("vignettingScaleRealTime = %.3f"), v44);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("vignettingScale = %.3f"), self->_vignettingScale);
    faceDetected = self->_faceDetected;
  }
  if (!self->_debugFace)
    goto LABEL_205;
  v184 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
  if (v184)
  {
    v185 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    v186 = v185 + 4 * v184;
    v187 = v185;
    if (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23))
      goto LABEL_188;
  }
  else
  {
    v185 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    v186 = v185;
  }
  v187 = v185 + 4 * v184;
LABEL_188:
  v188 = ((v186 - v187) >> 2)
       - (v184 == (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v185) >> 2);
  v189 = 0.0;
  if (v188 >= 2)
    v189 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59) / (float)(v188 - 1);
  v190 = sqrtf(v189);
  v191 = " [face]";
  if (!faceDetected)
    v191 = " [face skipped]";
  if (!self->_faceDetectedReal)
    v191 = " []";
  NSLog(CFSTR("> > > CVAPhoto: frame = %lld, faceReceived = %i, faceConsidered = %i, stddevRollingConfidence = %.3f, proxyToFaceEffectLerp = %.3f%s"), self->_frameIndex, self->_faceDetectedReal, faceDetected, *(_QWORD *)&v190, self->_proxyToFaceEffectLerpFinal, v191);
  if (self->_faceDetected)
  {
    LODWORD(faceDetected) = 1;
    goto LABEL_205;
  }
  LODWORD(faceDetected) = self->_faceDetectedReal;
  if (self->_faceDetectedReal)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("geometricHaloRemoval = %i"), !self->_trustAlpha);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face was detected, but skipped"));
    v192 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    if (v192)
    {
      v193 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      v194 = v193 + 4 * v192;
      v195 = v193;
      if (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23))
      {
LABEL_202:
        v196 = ((v194 - v195) >> 2)
             - (v192 == (*(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v193) >> 2);
        v197 = 0.0;
        if (v196 >= 2)
          v197 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59)
               / (float)(v196 - 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("faceConfidence.stddev = %.1f%%"), (float)(sqrtf(v197) * 100.0));

        LODWORD(faceDetected) = self->_faceDetected;
        goto LABEL_205;
      }
    }
    else
    {
      v193 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      v194 = v193;
    }
    v195 = v193 + 4 * v192;
    goto LABEL_202;
  }
LABEL_205:
  _S0 = self->_proxyToFaceEffectLerpFinal;
  __asm { FCVT            H1, S0 }
  *((_WORD *)v5 + 8) = _H1;
  _S1 = self->_portraitStyleStrength;
  __asm { FCVT            H1, S1 }
  *((_WORD *)v5 + 10) = LOWORD(_S1);
  _S1 = (float)(*(float *)((char *)&self->super.super.super.isa + *(int *)(v42 + 3100)) * -0.5) + 1.0;
  if (!faceDetected)
  {
    v202 = (float)((float)((float)(self->_focusDistance + -0.54) / 0.76) * -0.5) + 1.0;
    v203 = fminf(v202, 1.0);
    if (v202 < 0.5)
      v203 = 0.5;
    _S1 = v203 + (float)((float)(_S1 - v203) * _S0);
  }
  __asm { FCVT            H0, S1 }
  *((_WORD *)v5 + 9) = _H0;
  if (self->_debugFace)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("focusDistance = %.3fm"), self->_focusDistance);

    _H0 = *((_WORD *)v5 + 9);
    __asm { FCVT            S0, H0 }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blurStrengthByDistance = %.1f%%"), (float)(_S0 * 100.0));

    if (self->_debugFace)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proxyToFaceLerp = %.2f"), self->_proxyToFaceEffectLerpFinal);

    }
  }
  v207 = *(_OWORD *)&self->_anon_280[52];
  v209 = *(_OWORD *)&self->_anon_280[4];
  v208 = *(_OWORD *)&self->_anon_280[20];
  *(_OWORD *)&self->_anon_60[32] = *(_OWORD *)&self->_anon_280[36];
  *(_OWORD *)&self->_anon_60[48] = v207;
  *(_OWORD *)self->_anon_60 = v209;
  *(_OWORD *)&self->_anon_60[16] = v208;
}

- (void)loadRGBTransformMapsOnceTo:(id *)a3 namePrefix:(const void *)a4 forIntermediateResults:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  size_t v21;
  char *v22;
  char *v23;
  void *v24;
  unint64_t v25;
  size_t v26;
  _BYTE *v27;
  char v28;
  const std::string::value_type *v29;
  std::string::size_type v30;
  std::string *v31;
  __int128 v32;
  std::string *v33;
  std::string::size_type size;
  std::string *v35;
  __int128 v36;
  const char *v37;
  FILE *v38;
  id v39;
  _QWORD v40[6];
  std::string v41;
  std::string v42;
  std::string v43;
  __int128 v44;
  int64_t v45;
  id v46[2];

  v5 = a5;
  if ((byte_1EF12D859 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = 0;
    objc_msgSend(v9, "attributesOfItemAtPath:error:", CFSTR("/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/rgbTransformMap_Contour_NEAR_fp16_RGBAslice0"), v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v46[0];
    qword_1EF12D860 = objc_msgSend(v10, "fileSize");

    if (v11)
      qword_1EF12D860 = 0;
    byte_1EF12D859 = 1;

  }
  if (qword_1EF12D860 && !*a3)
  {
    v12 = (int)sqrtf((float)((unint64_t)qword_1EF12D860 >> 2) + 0.5);
    if (8 * v12 * (uint64_t)v12 == 2 * qword_1EF12D860)
    {
      v13 = (void *)objc_opt_new();
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setTextureType:", 3);
      objc_msgSend(v14, "setPixelFormat:", 115);
      v15 = (unint64_t)v12 >> 1;
      objc_msgSend(v14, "setWidth:", v15);
      objc_msgSend(v14, "setHeight:", v12);
      objc_msgSend(v14, "setMipmapLevelCount:", 1);
      objc_msgSend(v14, "setArrayLength:", 12);
      if (v5)
        v16 = 3;
      else
        v16 = 1;
      objc_msgSend(v14, "setUsage:", v16);
      v17 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v14);
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a3;
      *a3 = v18;

      v20 = v15 * v12;
      if (4 * v20)
      {
        if (((4 * v20) & 0x8000000000000000) != 0)
          abort();
        v21 = 8 * v20;
        v22 = (char *)operator new(8 * v20);
        bzero(v22, v21);
        v23 = &v22[v21];
        v24 = v14;
        if (!v5)
          goto LABEL_21;
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v24 = v14;
        if (!v5)
        {
LABEL_21:
          v25 = 0;
          v26 = (v23 - v22) >> 1;
          do
          {
            v27 = operator new(0x48uLL);
            v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
            *(_OWORD *)&v42.__r_.__value_.__r.__words[1] = xmmword_1B56AC1E0;
            qmemcpy(v27, "/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/", 68);
            v28 = *((_BYTE *)a4 + 23);
            if (v28 >= 0)
              v29 = (const std::string::value_type *)a4;
            else
              v29 = *(const std::string::value_type **)a4;
            if (v28 >= 0)
              v30 = *((unsigned __int8 *)a4 + 23);
            else
              v30 = *((_QWORD *)a4 + 1);
            v27[68] = 0;
            v31 = std::string::append(&v42, v29, v30);
            v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
            v43.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v32;
            v31->__r_.__value_.__l.__size_ = 0;
            v31->__r_.__value_.__r.__words[2] = 0;
            v31->__r_.__value_.__r.__words[0] = 0;
            std::to_string(&v41, v25);
            if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v33 = &v41;
            else
              v33 = (std::string *)v41.__r_.__value_.__r.__words[0];
            if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
            else
              size = v41.__r_.__value_.__l.__size_;
            v35 = std::string::append(&v43, (const std::string::value_type *)v33, size);
            v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
            v45 = v35->__r_.__value_.__r.__words[2];
            v44 = v36;
            v35->__r_.__value_.__l.__size_ = 0;
            v35->__r_.__value_.__r.__words[2] = 0;
            v35->__r_.__value_.__r.__words[0] = 0;
            if (v45 >= 0)
              v37 = (const char *)&v44;
            else
              v37 = (const char *)v44;
            v38 = fopen(v37, "rb");
            if (SHIBYTE(v45) < 0)
            {
              operator delete((void *)v44);
              if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_39:
                if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_40;
                goto LABEL_45;
              }
            }
            else if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_39;
            }
            operator delete(v41.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_40:
              if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
                goto LABEL_46;
              goto LABEL_41;
            }
LABEL_45:
            operator delete(v43.__r_.__value_.__l.__data_);
            if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
LABEL_46:
              operator delete(v42.__r_.__value_.__l.__data_);
LABEL_41:
            fread(v22, 2uLL, v26, v38);
            v39 = *a3;
            memset(v40, 0, 24);
            v40[3] = (unint64_t)v12 >> 1;
            v40[4] = v12;
            v40[5] = 1;
            objc_msgSend(v39, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v40, 0, v25, v22, (4 * v12) & 0xFFFFFFFFFFFFFFF8, 0);
            fclose(v38);
            ++v25;
            v24 = v14;
          }
          while (v25 != 12);
        }
      }
      if (v22)
        operator delete(v22);

    }
    else
    {
      NSLog(CFSTR("CVAPhoto (Error): Wrong rgbTransformMap_Contour_NEAR_fp16_RGBAslice0 fileSize!"), a2);
      qword_1EF12D860 = 0;
    }
  }
}

- (void)loadRGBTransformMapsForEffectVersion:(BOOL)a3
{
  _BOOL4 v3;
  unsigned __int8 v5;
  _BOOL8 v6;
  MTLTexture **v7;
  const char *v8;
  size_t v9;
  void **v10;
  std::string::size_type v11;
  std::string *v12;
  __int128 v13;
  void **v14;
  std::string::size_type v15;
  std::string *v16;
  __int128 v17;
  void **v18;
  std::string::size_type v19;
  std::string *v20;
  __int128 v21;
  void **v22;
  std::string::size_type v23;
  std::string *v24;
  __int128 v25;
  int v26;
  int *v27;
  MTLTexture *v28;
  MTLTexture *rgbTransformMapTextureSelectedPtr;
  MTLTexture *rgbTransformMapCurrentNearTexturePtr;
  MTLTexture *rgbTransformMapCurrentFarTexturePtr;
  __int128 v32;
  std::string v33;
  void *v34[2];
  std::string::size_type v35;
  void *__p[3];

  v3 = a3;
  v5 = atomic_load((unsigned __int8 *)&qword_1EF12D870);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D870))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    qword_1EF12D868 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D870);
  }
  if ((byte_1EF12D878 & 1) == 0)
  {
    HIBYTE(__p[2]) = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1B5667F7C((uint64_t)&qword_1EF12D868, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D878 = 1;
  }
  if (objc_msgSend((id)qword_1EF12D868, "intValue") == -1)
  {
    rgbTransformMapCurrentNearTexturePtr = self->_rgbTransformMapCurrentNearTexturePtr;
    self->_rgbTransformMapCurrentNearTexturePtr = 0;

    rgbTransformMapCurrentFarTexturePtr = self->_rgbTransformMapCurrentFarTexturePtr;
    self->_rgbTransformMapCurrentFarTexturePtr = 0;

    rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
    self->_rgbTransformMapTextureSelectedPtr = 0;
    goto LABEL_55;
  }
  v6 = v3;
  v7 = &self->_rgbTransformMapContourNearTexture[v3];
  if (!*v7)
  {
    __p[0] = operator new(0x30uLL);
    *(_OWORD *)&__p[1] = xmmword_1B56AC1F0;
    strcpy((char *)__p[0], "rgbTransformMap_Contour_NEAR_fp16_RGBAslice");
    -[VideoRelightingMetal loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:](self, "loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:", &self->_rgbTransformMapCurrentTextureInterpolated, __p, 1);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    if (v3)
      v8 = "rgbTransformMap_";
    else
      v8 = "rgbTransformMap_v1_";
    if (v3)
      v9 = 16;
    else
      v9 = 19;
    HIBYTE(__p[2]) = v9;
    memcpy(__p, v8, v9);
    *((_BYTE *)__p + v9) = 0;
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v33.__r_.__value_.__r.__words[1] = xmmword_1B56AC140;
    strcpy(v33.__r_.__value_.__l.__data_, "Contour_NEAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0)
      v10 = __p;
    else
      v10 = (void **)__p[0];
    if (SHIBYTE(__p[2]) >= 0)
      v11 = HIBYTE(__p[2]);
    else
      v11 = (std::string::size_type)__p[1];
    v12 = std::string::insert(&v33, 0, (const std::string::value_type *)v10, v11);
    v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    v35 = v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)v34 = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    -[VideoRelightingMetal loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:](self, "loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:", v7, v34, 0);
    if (SHIBYTE(v35) < 0)
    {
      operator delete(v34[0]);
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_24;
    }
    else if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_24;
    }
    operator delete(v33.__r_.__value_.__l.__data_);
LABEL_24:
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    v32 = xmmword_1B56AC200;
    *(_OWORD *)&v33.__r_.__value_.__r.__words[1] = xmmword_1B56AC200;
    strcpy(v33.__r_.__value_.__l.__data_, "Contour_FAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0)
      v14 = __p;
    else
      v14 = (void **)__p[0];
    if (SHIBYTE(__p[2]) >= 0)
      v15 = HIBYTE(__p[2]);
    else
      v15 = (std::string::size_type)__p[1];
    v16 = std::string::insert(&v33, 0, (const std::string::value_type *)v14, v15);
    v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
    v35 = v16->__r_.__value_.__r.__words[2];
    *(_OWORD *)v34 = v17;
    v16->__r_.__value_.__l.__size_ = 0;
    v16->__r_.__value_.__r.__words[2] = 0;
    v16->__r_.__value_.__r.__words[0] = 0;
    -[VideoRelightingMetal loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:](self, "loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:", &self->_rgbTransformMapContourFarTexture[v6], v34, 0);
    if (SHIBYTE(v35) < 0)
    {
      operator delete(v34[0]);
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_32;
    }
    else if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete(v33.__r_.__value_.__l.__data_);
LABEL_32:
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v33.__r_.__value_.__r.__words[1] = xmmword_1B56AC200;
    strcpy(v33.__r_.__value_.__l.__data_, "Studio_NEAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0)
      v18 = __p;
    else
      v18 = (void **)__p[0];
    if (SHIBYTE(__p[2]) >= 0)
      v19 = HIBYTE(__p[2]);
    else
      v19 = (std::string::size_type)__p[1];
    v20 = std::string::insert(&v33, 0, (const std::string::value_type *)v18, v19);
    v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
    v35 = v20->__r_.__value_.__r.__words[2];
    *(_OWORD *)v34 = v21;
    v20->__r_.__value_.__l.__size_ = 0;
    v20->__r_.__value_.__r.__words[2] = 0;
    v20->__r_.__value_.__r.__words[0] = 0;
    -[VideoRelightingMetal loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:](self, "loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:", &self->_rgbTransformMapStudioNearTexture[v6], v34, 0);
    if (SHIBYTE(v35) < 0)
    {
      operator delete(v34[0]);
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_40;
    }
    else if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_40;
    }
    operator delete(v33.__r_.__value_.__l.__data_);
LABEL_40:
    v33.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v33.__r_.__value_.__r.__words[1] = xmmword_1B56AC210;
    strcpy(v33.__r_.__value_.__l.__data_, "Studio_FAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0)
      v22 = __p;
    else
      v22 = (void **)__p[0];
    if (SHIBYTE(__p[2]) >= 0)
      v23 = HIBYTE(__p[2]);
    else
      v23 = (std::string::size_type)__p[1];
    v24 = std::string::insert(&v33, 0, (const std::string::value_type *)v22, v23);
    v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    v35 = v24->__r_.__value_.__r.__words[2];
    *(_OWORD *)v34 = v25;
    v24->__r_.__value_.__l.__size_ = 0;
    v24->__r_.__value_.__r.__words[2] = 0;
    v24->__r_.__value_.__r.__words[0] = 0;
    -[VideoRelightingMetal loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:](self, "loadRGBTransformMapsOnceTo:namePrefix:forIntermediateResults:", &self->_rgbTransformMapStudioFarTexture[v6], v34, 0);
    if (SHIBYTE(v35) < 0)
    {
      operator delete(v34[0]);
      if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_48:
        if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
          goto LABEL_49;
LABEL_64:
        operator delete(__p[0]);
        goto LABEL_49;
      }
    }
    else if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_48;
    }
    operator delete(v33.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      goto LABEL_49;
    goto LABEL_64;
  }
LABEL_49:
  if (objc_msgSend((id)qword_1EF12D868, "intValue", v32) != 1)
    v7 = &self->_rgbTransformMapStudioNearTexture[v6];
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentNearTexturePtr, *v7);
  v26 = objc_msgSend((id)qword_1EF12D868, "intValue");
  v27 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapStudioFarTexture;
  if (v26 == 1)
    v27 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapContourFarTexture;
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentFarTexturePtr, *(id *)((char *)&self->super.super.super.isa + 8 * v6 + *v27));
  v28 = self->_rgbTransformMapCurrentTextureInterpolated;
  rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
  self->_rgbTransformMapTextureSelectedPtr = v28;
LABEL_55:

}

- (void)encodeTCKernelToCommandBuffer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "renderCommandEncoderWithDescriptor:", self->_tcRenderDesc);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CVAPhotoMTLRingBuffer currentBuffer](self->_vertexBuffer, "currentBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVertexBuffer:offset:atIndex:", v5, 0, 0);

  objc_msgSend(v6, "setVertexBytes:length:atIndex:", self->_anon_60, 64, 1);
  objc_msgSend(v6, "setLabel:", CFSTR("_tcKernel"));
  objc_msgSend(v6, "setRenderPipelineState:", self->_tcKernel);
  objc_msgSend(v6, "setCullMode:", 2);
  objc_msgSend(v6, "setFrontFacingWinding:", 1);
  objc_msgSend(v6, "setDepthStencilState:", self->_depthStencilState);
  objc_msgSend(v6, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, (unint64_t)-[MTLBuffer length](self->_indexBufferImmutable, "length") >> 1, 0, self->_indexBufferImmutable, 0);
  objc_msgSend(v6, "endEncoding");

}

- (void)encodeRelightKernelToCommandBuffer:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  double x;
  unint64_t v8;
  float v9;
  double y;
  unint64_t v11;
  float v12;
  double width;
  unint64_t v14;
  float v15;
  double height;
  unint64_t v17;
  float v18;
  _BOOL4 trustAlpha;
  unsigned __int8 v20;
  MTLComputePipelineState *v21;
  void *v22;
  void *v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  void *__p[2];
  char v28;
  BOOL isUnifiedRendering;
  float v30[4];

  v4 = a3;
  v5 = -[MTLTexture width](self->_dstTexture, "width");
  v6 = -[MTLTexture height](self->_dstTexture, "height");
  x = self->_primaryCaptureRect.origin.x;
  v8 = -[MTLTexture width](self->_dstTexture, "width");
  v9 = x;
  v30[0] = v9 / (float)v8;
  y = self->_primaryCaptureRect.origin.y;
  v11 = -[MTLTexture height](self->_dstTexture, "height");
  v12 = y;
  v30[1] = v12 / (float)v11;
  width = self->_primaryCaptureRect.size.width;
  v14 = -[MTLTexture width](self->_dstTexture, "width");
  v15 = width;
  v30[2] = v15 / (float)v14;
  height = self->_primaryCaptureRect.size.height;
  v17 = -[MTLTexture height](self->_dstTexture, "height");
  v18 = height;
  v30[3] = v18 / (float)v17;
  isUnifiedRendering = self->_isUnifiedRendering;
  trustAlpha = self->_trustAlpha;
  v20 = atomic_load((unsigned __int8 *)&qword_1EF12D888);
  if ((v20 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D888))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    qword_1EF12D880 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D888);
  }
  if ((byte_1EF12D890 & 1) == 0)
  {
    v28 = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1B5667F7C((uint64_t)&qword_1EF12D880, (uint64_t)__p);
    if (v28 < 0)
      operator delete(__p[0]);
    byte_1EF12D890 = 1;
  }
  v21 = self->_kernel_Relight[1][!trustAlpha][objc_msgSend((id)qword_1EF12D880, "intValue") == 1];
  objc_msgSend(v4, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setLabel:", CFSTR("krnRelight"));
  objc_msgSend(v23, "setComputePipelineState:", v21);
  objc_msgSend(v23, "setTexture:atIndex:", self->_srcTexture, 0);
  objc_msgSend(v23, "setTexture:atIndex:", self->_dstTexture, 1);
  objc_msgSend(v23, "setTexture:atIndex:", self->_dstUVTexture, 2);
  objc_msgSend(v23, "setTexture:atIndex:", self->_tcTexture, 3);
  objc_msgSend(v23, "setTexture:atIndex:", self->_slideTexture, 4);
  objc_msgSend(v23, "setTexture:atIndex:", self->_alphaTexture, 5);
  objc_msgSend(v23, "setTexture:atIndex:", self->_countTexture, 7);
  objc_msgSend(v23, "setTexture:atIndex:", self->_rgbTransformMapTextureSelectedPtr, 18);
  objc_msgSend(v23, "setTexture:atIndex:", self->_texSelectedColorCube, 22);
  objc_msgSend(v23, "setTexture:atIndex:", self->_texSkinSegmentationAlias, 27);
  objc_msgSend(v23, "setTexture:atIndex:", self->_texSkinRGBAPyramid, 28);
  objc_msgSend(v23, "setBytes:length:atIndex:", &self->_anon_220[4], 88, 0);
  objc_msgSend(v23, "setBytes:length:atIndex:", v30, 16, 1);
  objc_msgSend(v23, "setBytes:length:atIndex:", &isUnifiedRendering, 1, 2);
  v26[0] = (unint64_t)(double)(v5 >> 1);
  v26[1] = (unint64_t)(double)(v6 >> 1);
  v26[2] = 1;
  v25 = 1;
  v24 = xmmword_1B56AC920;
  objc_msgSend(v23, "dispatchThreads:threadsPerThreadgroup:", v26, &v24);
  objc_msgSend(v23, "endEncoding");

}

- (void)encodeVertCountKernelToCommandBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[MTLTexture width](self->_vertCountTexture, "width");
  v6 = -[MTLTexture height](self->_vertCountTexture, "height");
  v12 = 0uLL;
  v13 = 0;
  sub_1B56A22B8((uint64_t *)&v12, self->_kernel_CountVertical);
  objc_msgSend(v4, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLabel:", CFSTR("_kernel_CountVertical"));
  objc_msgSend(v8, "setComputePipelineState:", self->_kernel_CountVertical);
  objc_msgSend(v8, "setTexture:atIndex:", self->_tcTexture, 0);
  objc_msgSend(v8, "setTexture:atIndex:", self->_vertCountTexture, 1);
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  v9 = v12;
  v10 = v13;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v11, &v9);
  objc_msgSend(v8, "endEncoding");

}

- (void)encodeCountKernelToCommandBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[MTLTexture width](self->_countTexture, "width");
  v6 = -[MTLTexture height](self->_countTexture, "height");
  v12 = 0uLL;
  v13 = 0;
  sub_1B56A22B8((uint64_t *)&v12, self->_kernel_Count);
  objc_msgSend(v4, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLabel:", CFSTR("_kernel_Count"));
  objc_msgSend(v8, "setComputePipelineState:", self->_kernel_Count);
  objc_msgSend(v8, "setTexture:atIndex:", self->_vertCountTexture, 0);
  objc_msgSend(v8, "setTexture:atIndex:", self->_countTexture, 1);
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  v9 = v12;
  v10 = v13;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v11, &v9);
  objc_msgSend(v8, "endEncoding");

}

- (void)encodeSlideKernelToCommandBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  __int128 v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[MTLTexture width](self->_slideTexture, "width");
  v6 = -[MTLTexture height](self->_slideTexture, "height");
  v12 = 0uLL;
  v13 = 0;
  sub_1B56A22B8((uint64_t *)&v12, self->_kernel_Slide);
  objc_msgSend(v4, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLabel:", CFSTR("_kernel_Slide"));
  objc_msgSend(v8, "setComputePipelineState:", self->_kernel_Slide);
  objc_msgSend(v8, "setTexture:atIndex:", self->_tcTexture, 0);
  objc_msgSend(v8, "setTexture:atIndex:", self->_slideTexture, 1);
  objc_msgSend(v8, "setBytes:length:atIndex:", &self->_uniformBuffer_slide, 8, 0);
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  v9 = v12;
  v10 = v13;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v11, &v9);
  objc_msgSend(v8, "endEncoding");

}

- (void)updateFaceKitStreamedDataFromProcessOutput:(id)a3
{
  id v4;
  NSData *verticesPos;
  NSArray *intrinsics;
  NSArray *camR;
  NSArray *camT;
  NSArray *poseR;
  NSArray *poseT;
  NSData *landmarks;
  void *v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  NSArray *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  uint64_t v23;
  NSArray *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSData *v28;
  uint64_t v29;
  NSData *v30;
  VideoRelightingMetal *v31;
  NSData *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  float v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  VideoRelightingMetal *v43;
  _QWORD v44[4];
  _QWORD v45[3];
  _QWORD *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43 = self;
  v4 = a3;
  verticesPos = self->_faceKitStreamedData.verticesPos;
  self->_faceKitStreamedData.verticesPos = 0;

  intrinsics = self->_faceKitStreamedData.intrinsics;
  self->_faceKitStreamedData.intrinsics = 0;

  camR = self->_faceKitStreamedData.camR;
  self->_faceKitStreamedData.camR = 0;

  camT = self->_faceKitStreamedData.camT;
  self->_faceKitStreamedData.camT = 0;

  poseR = self->_faceKitStreamedData.poseR;
  self->_faceKitStreamedData.poseR = 0;

  poseT = self->_faceKitStreamedData.poseT;
  self->_faceKitStreamedData.poseT = 0;

  landmarks = self->_faceKitStreamedData.landmarks;
  self->_faceKitStreamedData.landmarks = 0;

  self->_faceKitStreamedData.confidence = 0.0;
  self->_faceDetectedReal = 0;
  self->_faceDetected = 0;
  v44[0] = &off_1E6936800;
  v44[1] = &v43;
  v44[3] = v44;
  v45[0] = &off_1E6936800;
  v46 = v45;
  v45[1] = &v43;
  if (qword_1EF12D648 == -1)
  {
    if (!v4)
      goto LABEL_11;
  }
  else
  {
    dispatch_once(&qword_1EF12D648, &unk_1E6936BD0);
    if (!v4)
      goto LABEL_11;
  }
  if (byte_1EF12D640)
  {
    v41 = v4;
    objc_msgSend(v41, "objectForKeyedSubscript:", qword_1EF12D5D8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "count"))
    {
      objc_msgSend(v42, "objectAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", qword_1EF12D588);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", qword_1EF12D568);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v43->_faceKitStreamedData.intrinsics;
      v43->_faceKitStreamedData.intrinsics = (NSArray *)v13;

      objc_msgSend(v40, "objectForKeyedSubscript:", qword_1EF12D560);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKeyedSubscript:", qword_1EF12D550);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v43->_faceKitStreamedData.camR;
      v43->_faceKitStreamedData.camR = (NSArray *)v15;

      objc_msgSend(v39, "objectForKeyedSubscript:", qword_1EF12D590);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v43->_faceKitStreamedData.camT;
      v43->_faceKitStreamedData.camT = (NSArray *)v17;

      objc_msgSend(v12, "objectForKeyedSubscript:", qword_1EF12D570);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", qword_1EF12D540);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "objectForKeyedSubscript:", qword_1EF12D550);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v43->_faceKitStreamedData.poseR;
      v43->_faceKitStreamedData.poseR = (NSArray *)v21;

      objc_msgSend(v20, "objectForKeyedSubscript:", qword_1EF12D590);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v43->_faceKitStreamedData.poseT;
      v43->_faceKitStreamedData.poseT = (NSArray *)v23;

      objc_msgSend(v12, "objectForKeyedSubscript:", qword_1EF12D570);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", qword_1EF12D548);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "objectForKeyedSubscript:", qword_1EF12D5C0);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v43->_faceKitStreamedData.verticesPos;
      v43->_faceKitStreamedData.verticesPos = (NSData *)v27;

      objc_msgSend(v26, "objectForKeyedSubscript:", qword_1EF12D5D0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v43->_faceKitStreamedData.landmarks;
      v43->_faceKitStreamedData.landmarks = (NSData *)v29;

      v31 = v43;
      v32 = v43->_faceKitStreamedData.verticesPos;
      if (v32 && (v33 = -[NSData length](v32, "length"), v31 = v43, v33))
      {
        v34 = -[NSData length](v43->_faceKitStreamedData.landmarks, "length") != 0;
        v31 = v43;
      }
      else
      {
        v34 = 0;
      }
      v31->_faceDetectedReal = v34;
      v43->_faceDetected = v34;
      objc_msgSend(v12, "objectForKeyedSubscript:", qword_1EF12D558);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v43->_faceKitStreamedData.confidence = v36;

    }
  }
LABEL_11:
  if (!v46)
  {
    sub_1B5658FA0();
    __break(1u);
  }
  (*(void (**)(_QWORD *))(*v46 + 48))(v46);
  v37 = v46;
  if (v46 == v45)
  {
    v38 = 4;
    v37 = v45;
    goto LABEL_16;
  }
  if (v46)
  {
    v38 = 5;
LABEL_16:
    (*(void (**)(void))(*v37 + 8 * v38))();
  }

}

- (void)encodeAlphaBlendRGBATextureArrayToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(const float *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];
  __int128 v20;
  uint64_t v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0uLL;
  v21 = 0;
  sub_1B56A22B8((uint64_t *)&v20, self->_kernel_AlphaBlendRGBATextureArray);
  objc_msgSend(v16, "setLabel:", CFSTR("_kernel_AlphaBlendRGBATextureArray"));
  objc_msgSend(v16, "setComputePipelineState:", self->_kernel_AlphaBlendRGBATextureArray);
  objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v16, "setBytes:length:atIndex:", a7, 4, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 2);
  v19[0] = objc_msgSend(v14, "width");
  v19[1] = objc_msgSend(v14, "height");
  v19[2] = 1;
  v17 = v20;
  v18 = v21;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v16, "endEncoding");

}

- (void)encodeLerpNearFarMapsToCommandBuffer:(id)a3
{
  id v4;
  float lightMapsNearFarLerp;
  MTLTexture **p_rgbTransformMapCurrentTextureInterpolated;
  int *v7;
  MTLTexture *v8;
  MTLTexture *rgbTransformMapTextureSelectedPtr;
  id v10;

  v4 = a3;
  lightMapsNearFarLerp = self->_lightMapsNearFarLerp;
  v10 = v4;
  if (lightMapsNearFarLerp <= 0.0)
  {
    v7 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapCurrentNearTexturePtr;
LABEL_6:
    p_rgbTransformMapCurrentTextureInterpolated = (Class *)((char *)&self->super.super.super.isa + *v7);
    goto LABEL_7;
  }
  if (lightMapsNearFarLerp >= 1.0)
  {
    v7 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapCurrentFarTexturePtr;
    goto LABEL_6;
  }
  p_rgbTransformMapCurrentTextureInterpolated = &self->_rgbTransformMapCurrentTextureInterpolated;
  -[VideoRelightingMetal encodeAlphaBlendRGBATextureArrayToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:](self, "encodeAlphaBlendRGBATextureArrayToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:", v4, self->_rgbTransformMapCurrentNearTexturePtr, self->_rgbTransformMapCurrentFarTexturePtr, self->_rgbTransformMapCurrentTextureInterpolated);
LABEL_7:
  v8 = *p_rgbTransformMapCurrentTextureInterpolated;
  rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
  self->_rgbTransformMapTextureSelectedPtr = v8;

}

- (void)renderWithSrcImage:(__CVBuffer *)a3 srcAlpha:(__CVBuffer *)a4 trustAlpha:(BOOL)a5 isUnifiedRendering:(BOOL)a6 yuvSourceDownsampled:(id)a7 skinSegmentation:(__CVBuffer *)a8 dstImage:(__CVBuffer *)a9 faceKitProcessOutput:(id)a10 portraitStyleStrength:(float)a11 colorSim:(id)a12 disparity:(id)a13 focusDistance:(float)a14 singleCubeData:(id)a15 properties:(id)a16 callbackQueue:(id)a17 callback:(id)a18
{
  unsigned __int8 v22;
  float v23;
  VideoRelightingMetal *v24;
  float v25;
  unsigned __int8 v26;
  double v27;
  float *p_portraitStyleStrength;
  float v29;
  BOOL v30;
  float v31;
  unsigned __int8 v32;
  VideoRelightingMetal *v33;
  double v34;
  const char *v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  VideoRelightingMetal *v38;
  __CVBuffer *v39;
  void **p_colorCubeUserData;
  void *v41;
  uint64_t v42;
  MTLTexture *texColorCubeUserData;
  size_t Height;
  MTLTexture *srcTexture;
  MTLTexture *alphaTexture;
  uint64_t v47;
  MTLTexture *texSkinSegmentationAlias;
  unsigned __int8 v49;
  size_t v50;
  void *v51;
  void *v52;
  void *v53;
  size_t WidthOfPlane;
  void *v55;
  void *v56;
  VideoRelightingMetal *v57;
  void *v58;
  uint64_t v59;
  MTLTexture *dstTexture;
  void *v61;
  uint64_t v62;
  MTLTexture *dstUVTexture;
  _OWORD *v64;
  _OWORD *v65;
  MTLTexture *rgbTransformMapCurrentNearTexturePtr;
  void *v67;
  void *v68;
  double x;
  size_t v70;
  double y;
  size_t v72;
  double v73;
  size_t v74;
  unsigned __int8 v75;
  VideoRelightingMetal *v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  VideoRelightingMetal *v79;
  id *p_verticesPos;
  uint64_t v81;
  int v82;
  signed int v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unsigned __int8 v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  FaceKitStreamedData *p_faceKitStreamedData;
  NSData *verticesPos;
  NSArray *intrinsics;
  NSArray *camR;
  NSArray *camT;
  NSArray *poseR;
  NSArray *poseT;
  NSData *landmarks;
  void *v106;
  char v107;
  void *v108;
  int v109;
  int v110;
  void *v111;
  char v112;
  void *v113;
  char v114;
  void *v115;
  char v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  size_t Width;
  unint64_t v124;
  id v125;
  NSData *v126;
  id v127;
  _QWORD v130[5];
  id v131;
  id v132;
  void **v133;
  VideoRelightingMetal **v134;
  __CVBuffer *v135;
  __CVBuffer *v136;
  __CVBuffer *v137;
  __CVBuffer *v138;
  void *__p[5];
  OS_dispatch_semaphore *v140;
  void *v141;
  void *v142;
  char *v143;
  VideoRelightingMetal *v144;
  _QWORD v145[2];
  _QWORD v146[4];

  v146[2] = *MEMORY[0x1E0C80C00];
  v144 = self;
  v125 = a7;
  v127 = a10;
  v117 = a12;
  v118 = a13;
  v126 = (NSData *)a15;
  v119 = a16;
  v120 = a17;
  v121 = a18;
  v22 = atomic_load((unsigned __int8 *)&qword_1EF12D8A0);
  if ((v22 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8A0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

    byte_1EF12D898 = v107;
    __cxa_guard_release(&qword_1EF12D8A0);
  }
  if (a8)
    v23 = a11;
  else
    v23 = NAN;
  v24 = v144;
  v144->_portraitStyleStrength = v23;
  v25 = fminf(v23, 1.0);
  if (v23 < 0.0)
    v25 = 0.0;
  v24->_portraitStyleStrength = v25;
  v26 = atomic_load((unsigned __int8 *)&qword_1EF12D8B0);
  if ((v26 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8B0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL);
    qword_1EF12D8A8 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D8B0);
  }
  if ((byte_1EF12D8B8 & 1) == 0)
  {
    HIBYTE(__p[2]) = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1B5667F7C((uint64_t)&qword_1EF12D8A8, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D8B8 = 1;
  }
  if (objc_msgSend((id)qword_1EF12D8A8, "intValue"))
  {
    if (objc_msgSend((id)qword_1EF12D8A8, "intValue") != 1)
      goto LABEL_19;
    p_portraitStyleStrength = &v144->_portraitStyleStrength;
    *(float *)&v27 = (float)(v144->_portraitStyleStrength * 1.8)
                   + (float)((float)(v144->_portraitStyleStrength * -0.8) * v144->_portraitStyleStrength);
  }
  else
  {
    p_portraitStyleStrength = &v144->_portraitStyleStrength;
    *(float *)&v27 = powf(v144->_portraitStyleStrength, 0.75);
  }
  v29 = fminf(*(float *)&v27, 1.0);
  v30 = *(float *)&v27 < 0.0;
  v31 = 0.0;
  if (!v30)
    v31 = v29;
  *p_portraitStyleStrength = v31;
LABEL_19:
  v32 = atomic_load((unsigned __int8 *)&qword_1EF12D8C0);
  if ((v32 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8C0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "floatForKey:", CFSTR("CVAPhotoStyleStrengthMultiplier"));
    v110 = v109;

    dword_1EF12D8BC = v110;
    __cxa_guard_release(&qword_1EF12D8C0);
  }
  LODWORD(v27) = dword_1EF12D8BC;
  v33 = v144;
  if (*(float *)&dword_1EF12D8BC != 0.0)
  {
    *(float *)&v27 = *(float *)&dword_1EF12D8BC * v144->_portraitStyleStrength;
    v144->_portraitStyleStrength = *(float *)&v27;
  }
  v33->_focusDistance = a14;
  if (byte_1EF12D898)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("portraitStyleStrength (API) = %f"), a11);

    LODWORD(v34) = dword_1EF12D8BC;
    if (*(float *)&dword_1EF12D8BC != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("portraitStyleStrength (rescaled) = %f"), v33->_portraitStyleStrength);

    }
    v35 = "non-nil";
    if (!a8)
      v35 = "nil";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("skinSegmentation is %s"), v34, v35);

  }
  v36 = atomic_load((unsigned __int8 *)&qword_1EF12D8D0);
  if ((v36 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8D0))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend(v111, "BOOLForKey:", CFSTR("CVAPhotoLogValidation"));

    byte_1EF12D8C8 = v112;
    __cxa_guard_release(&qword_1EF12D8D0);
  }
  if (byte_1EF12D8C8)
  {
    v37 = atomic_load((unsigned __int8 *)&qword_1EF12D8E0);
    if ((v37 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8E0))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "BOOLForKey:", CFSTR("CVAPhotoLogValidationPassed"));

      byte_1EF12D8D8 = v114;
      __cxa_guard_release(&qword_1EF12D8E0);
    }
    if (a8)
    {
      if (byte_1EF12D8D8)
        NSLog(CFSTR("%s (skinSegmentation != nil) check PASSED"), v27, "> > > CVAPhoto validation PASSED:");
    }
    else
    {
      NSLog(CFSTR("%s skinSegmentation shouldn't be nil in V2 mode"), v27, "> > > CVAPhoto validation FAILED:");
    }
    if (v127)
    {
      if (byte_1EF12D8D8)
        NSLog(CFSTR("%s (faceKitProcessOutput != nil) check PASSED"), v27, "> > > CVAPhoto validation PASSED:");
    }
    else
    {
      NSLog(CFSTR("%s faceKitProcessOutput is nil!"), v27, "> > > CVAPhoto validation FAILED:");
    }
  }
  v38 = v144;
  objc_storeStrong((id *)&v144->_properties, a16);
  ++v38->_frameIndex;
  -[VideoRelightingMetal updateFaceKitStreamedDataFromProcessOutput:](v38, "updateFaceKitStreamedDataFromProcessOutput:", v127);
  v39 = a3;
  p_colorCubeUserData = (void **)&v38->_colorCubeUserData;
  if (v38->_colorCubeUserData != v126)
  {
    objc_storeStrong((id *)&v38->_colorCubeUserData, a15);
    v39 = a3;
    if (*p_colorCubeUserData)
    {
      sub_1B56A2BF0(*p_colorCubeUserData, v38->_device);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      texColorCubeUserData = v38->_texColorCubeUserData;
      v38->_texColorCubeUserData = (MTLTexture *)v42;

      v39 = a3;
    }
  }
  CVPixelBufferRetain(v39);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a9);
  CVPixelBufferRetain(a8);
  Width = CVPixelBufferGetWidth(v39);
  Height = CVPixelBufferGetHeight(v39);
  sub_1B56A28A0((uint64_t *)__p, v39, a4, v38->_device);
  srcTexture = v38->_srcTexture;
  v38->_srcTexture = (MTLTexture *)__p[0];

  alphaTexture = v38->_alphaTexture;
  v38->_alphaTexture = (MTLTexture *)__p[1];

  v38->_trustAlpha = a5;
  v38->_isUnifiedRendering = a6;
  if (a8)
  {
    sub_1B56A281C(a8, v38->_device);
    v47 = objc_claimAutoreleasedReturnValue();
    texSkinSegmentationAlias = v38->_texSkinSegmentationAlias;
    v38->_texSkinSegmentationAlias = (MTLTexture *)v47;

  }
  v49 = atomic_load((unsigned __int8 *)&qword_1EF12D8F0);
  if ((v49 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D8F0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D8E8 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D8F0);
  }
  if ((byte_1EF12D8F8 & 1) == 0)
  {
    HIBYTE(__p[2]) = 15;
    strcpy((char *)__p, "forceTrustAlpha");
    sub_1B5667F7C((uint64_t)&qword_1EF12D8E8, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D8F8 = 1;
  }
  if (sub_1B5669844("forceTrustAlpha") && objc_msgSend((id)qword_1EF12D8E8, "BOOLValue"))
    v144->_trustAlpha = 1;
  v50 = CVPixelBufferGetWidth(a9);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v50, CVPixelBufferGetHeight(a9), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v52, "setUsage:", 3);
  v53 = (void *)MEMORY[0x1E0CC6BB0];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a9, 1uLL);
  objc_msgSend(v53, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a9, 1uLL), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "setUsage:", 3);
  v57 = v144;
  v58 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](v144->_device, "newTextureWithDescriptor:iosurface:plane:", v52, CVPixelBufferGetIOSurface(a9), 0);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v58);
  v59 = objc_claimAutoreleasedReturnValue();
  dstTexture = v57->_dstTexture;
  v57->_dstTexture = (MTLTexture *)v59;

  v61 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](v57->_device, "newTextureWithDescriptor:iosurface:plane:", v56, CVPixelBufferGetIOSurface(a9), 1);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v61);
  v62 = objc_claimAutoreleasedReturnValue();
  dstUVTexture = v57->_dstUVTexture;
  v57->_dstUVTexture = (MTLTexture *)v62;

  if (!v57->_tcTexture)
  {
    -[VideoRelightingMetal createTexturesWith:imgHeight:](v57, "createTexturesWith:imgHeight:", (int)Width, (int)Height);
    -[VideoRelightingMetal configureRenderPipeline](v57, "configureRenderPipeline");
  }
  if (v57->_debugFace)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("frame = %lld"), v57->_frameIndex);

  }
  if (v57->_faceDetected)
  {
    v64 = operator new(0x40uLL);
    __p[1] = v64 + 4;
    __p[2] = v64 + 4;
    *v64 = 0u;
    v64[1] = 0u;
    v64[2] = 0u;
    v64[3] = 0u;
    __p[0] = v64;
    v65 = operator new(0x24uLL);
    v142 = (char *)v65 + 36;
    v143 = (char *)v65 + 36;
    *v65 = 0u;
    v65[1] = 0u;
    *((_DWORD *)v65 + 8) = 0;
    v141 = v65;
    -[VideoRelightingMetal updateModelAndPose:camera:](v57, "updateModelAndPose:camera:", __p, &v141);
    -[VideoRelightingMetal updateMatrixWithWidth:height:camera:pose:](v57, "updateMatrixWithWidth:height:camera:pose:", Width, Height, &v141, __p);
    if (v141)
    {
      v142 = v141;
      operator delete(v141);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  -[VideoRelightingMetal loadRGBTransformMapsForEffectVersion:](v57, "loadRGBTransformMapsForEffectVersion:", 1);
  -[VideoRelightingMetal updateUniforms:](v57, "updateUniforms:", 1);
  rgbTransformMapCurrentNearTexturePtr = v57->_rgbTransformMapCurrentNearTexturePtr;
  -[MTLCommandQueue commandBuffer](v57->_commandQueue, "commandBuffer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v68, "setLabel:", CFSTR("video relighting"));
  if (rgbTransformMapCurrentNearTexturePtr)
  {
    x = v57->_primaryCaptureRect.origin.x;
    v70 = CVPixelBufferGetWidth(a9);
    y = v57->_primaryCaptureRect.origin.y;
    v72 = CVPixelBufferGetHeight(a9);
    v73 = v57->_primaryCaptureRect.size.width;
    v74 = CVPixelBufferGetWidth(a9);
    -[CVAFilterColorAlphaToFgBg encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:normalizedPrimaryCaptureRect:isUnifiedRendering:](v57->_colorAlphaToFgBg, "encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:normalizedPrimaryCaptureRect:isUnifiedRendering:", v68, v125, v57->_texSkinSegmentationAlias, v57->_texSkinRGBAPyramid, v57->_isUnifiedRendering, x / (double)v70, y / (double)v72, v73 / (double)v74, v57->_primaryCaptureRect.size.height / (double)CVPixelBufferGetHeight(a9));
    -[CVAFilterMaskedVariableBlur encodeBlurPyramidInPlaceToCommandBuffer:inoutTexture:](v57->_blurPyramidForSkinFg, "encodeBlurPyramidInPlaceToCommandBuffer:inoutTexture:", v68, v57->_texSkinRGBAPyramid);
    -[VideoRelightingMetal encodeLerpNearFarMapsToCommandBuffer:](v57, "encodeLerpNearFarMapsToCommandBuffer:", v68);
    if (v57->_faceDetected)
    {
      -[VideoRelightingMetal encodeTCKernelToCommandBuffer:](v57, "encodeTCKernelToCommandBuffer:", v68);
      -[VideoRelightingMetal encodeVertCountKernelToCommandBuffer:](v57, "encodeVertCountKernelToCommandBuffer:", v68);
      -[VideoRelightingMetal encodeCountKernelToCommandBuffer:](v57, "encodeCountKernelToCommandBuffer:", v68);
      -[VideoRelightingMetal encodeSlideKernelToCommandBuffer:](v57, "encodeSlideKernelToCommandBuffer:", v68);
    }
    -[VideoRelightingMetal encodeRelightKernelToCommandBuffer:](v57, "encodeRelightKernelToCommandBuffer:", v68);
  }
  v75 = atomic_load((unsigned __int8 *)&qword_1EF12D908);
  if ((v75 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D908))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    qword_1EF12D900 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D908);
  }
  if ((byte_1EF12D910 & 1) == 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "saveRelitModelToPNG");
    sub_1B5667F7C((uint64_t)&qword_1EF12D900, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    byte_1EF12D910 = 1;
  }
  v76 = v144;
  if (v144->_debugFace && -[NSData length](v144->_faceKitStreamedData.landmarks, "length"))
  {
    v77 = atomic_load((unsigned __int8 *)&qword_1EF12D920);
    if ((v77 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D920))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      qword_1EF12D918 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D920);
    }
    if ((byte_1EF12D928 & 1) == 0)
    {
      __p[0] = operator new(0x20uLL);
      *(_OWORD *)&__p[1] = xmmword_1B56AC220;
      strcpy((char *)__p[0], "debugDrawFaceStartVertex");
      sub_1B5667F7C((uint64_t)&qword_1EF12D918, (uint64_t)__p);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      byte_1EF12D928 = 1;
    }
    v78 = atomic_load((unsigned __int8 *)&qword_1EF12D938);
    if ((v78 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D938))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      qword_1EF12D930 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D938);
    }
    if ((byte_1EF12D940 & 1) == 0)
    {
      __p[0] = operator new(0x20uLL);
      *(_OWORD *)&__p[1] = xmmword_1B56AC220;
      strcpy((char *)__p[0], "debugDrawFaceVertexCount");
      sub_1B5667F7C((uint64_t)&qword_1EF12D930, (uint64_t)__p);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      byte_1EF12D940 = 1;
    }
    CVPixelBufferGetWidthOfPlane(a9, 0);
    CVPixelBufferGetHeightOfPlane(a9, 0);
    v79 = v144;
    p_verticesPos = (id *)&v144->_faceKitStreamedData.verticesPos;
    v124 = -[NSData length](v144->_faceKitStreamedData.landmarks, "length");
    objc_msgSend(p_verticesPos[6], "bytes");
    objc_msgSend(*p_verticesPos, "bytes");
    v81 = (((int)objc_msgSend(*p_verticesPos, "length") / 3) >> 2);
    if (v79->_faceDetected)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Face is detected, nVerts = %d"), v81);

    }
    if (v79->_debugFaceDraw && (objc_msgSend((id)qword_1EF12D918, "intValue") & 0x80000000) == 0)
    {
      v82 = objc_msgSend((id)qword_1EF12D918, "intValue");
      if ((int)(objc_msgSend((id)qword_1EF12D930, "intValue") + v82) <= (int)v81)
      {
        v83 = objc_msgSend((id)qword_1EF12D918, "intValue") - 1;
        do
        {
          v84 = objc_msgSend((id)qword_1EF12D918, "intValue");
          ++v83;
        }
        while (v83 < (int)(objc_msgSend((id)qword_1EF12D930, "intValue") + v84));
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v79->_indexOfCheekLandmark_topLeft);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v146[0] = v85;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v79->_indexOfCheekLandmark_topRight);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v146[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v79->_indexOfCheekLandmark_bottomLeft);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v88;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v79->_indexOfCheekLandmark_bottomRight);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v89;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 2);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = atomic_load((unsigned __int8 *)&qword_1EF12D948);
    if ((v91 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D948))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "BOOLForKey:", CFSTR("CVAPhotoDrawFaceLandmarks"));

      byte_1EF12D941 = v116;
      __cxa_guard_release(&qword_1EF12D948);
    }
    v76 = v144;
    if (v144->_debugFaceDraw && v124 >= 8)
    {
      v92 = 0;
      if (v124 >> 3 <= 1)
        v93 = 1;
      else
        v93 = v124 >> 3;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v92);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "containsObject:", v94);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v92);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "containsObject:", v95);

        ++v92;
      }
      while (v93 != v92);
    }

  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v76->_inflightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  __p[0] = 0;
  __p[1] = __p;
  __p[2] = (void *)0x3032000000;
  __p[3] = sub_1B5688398;
  __p[4] = sub_1B56883A8;
  v140 = v76->_inflightSemaphore;
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = sub_1B56883B0;
  v130[3] = &unk_1E6936DB8;
  v135 = a3;
  v136 = a4;
  v137 = a8;
  v134 = &v144;
  v130[4] = v76;
  v96 = v120;
  v131 = v96;
  v97 = v121;
  v138 = a9;
  v132 = v97;
  v133 = __p;
  objc_msgSend(v68, "addCompletedHandler:", v130);
  objc_msgSend(v68, "commit");
  p_faceKitStreamedData = &v144->_faceKitStreamedData;
  verticesPos = v144->_faceKitStreamedData.verticesPos;
  v144->_faceKitStreamedData.verticesPos = 0;

  intrinsics = p_faceKitStreamedData->intrinsics;
  p_faceKitStreamedData->intrinsics = 0;

  camR = p_faceKitStreamedData->camR;
  p_faceKitStreamedData->camR = 0;

  camT = p_faceKitStreamedData->camT;
  p_faceKitStreamedData->camT = 0;

  poseR = p_faceKitStreamedData->poseR;
  p_faceKitStreamedData->poseR = 0;

  poseT = p_faceKitStreamedData->poseT;
  p_faceKitStreamedData->poseT = 0;

  landmarks = p_faceKitStreamedData->landmarks;
  p_faceKitStreamedData->landmarks = 0;

  p_faceKitStreamedData->confidence = 0.0;
  _Block_object_dispose(__p, 8);

}

- (double)gpuStartTime
{
  return self->_gpuStartTime;
}

- (double)gpuEndTime
{
  return self->_gpuEndTime;
}

- (float)relightingStability
{
  return self->_relightingStability;
}

- (CGRect)primaryCaptureRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  unsigned __int16 *begin;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL *m_first;
  BOOL *m_end;
  int64_t m_size;
  BOOL *m_buff;
  int64_t v20;
  BOOL *v21;
  FaceVertex *v22;

  objc_storeStrong((id *)&self->_texSkinSegmentationAlias, 0);
  objc_storeStrong((id *)&self->_texSkinRGBAPyramid, 0);
  objc_storeStrong((id *)&self->_blurPyramidForSkinFg, 0);
  objc_storeStrong((id *)&self->_colorAlphaToFgBg, 0);
  objc_storeStrong((id *)&self->_faceKitMeshTexcoords, 0);
  objc_storeStrong((id *)&self->_indexBufferImmutable, 0);
  begin = self->_faceKitMeshTris.__begin_;
  if (begin)
  {
    self->_faceKitMeshTris.__end_ = begin;
    operator delete(begin);
  }
  if (self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6])
  {
    v5 = *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 22);
    v4 = *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30);
    v6 = *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46);
    v7 = *(void **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14);
    v8 = v5 - v4;
    v9 = (unint64_t)(v5 - (_QWORD)v7) >> 2;
    if (v6 < v8 >> 2)
      v9 = 0;
    *(_QWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30) = v4 + 4 * (v6 - v9);
    if (v7)
      operator delete(v7);
    self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6] = 0;
  }
  if (self->_faceConfidenceRollingVariance.m_initialized)
  {
    v11 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15);
    v10 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23);
    v12 = *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    v13 = *(void **)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    v14 = v11 - v10;
    v15 = (unint64_t)(v11 - (_QWORD)v13) >> 2;
    if (v12 < v14 >> 2)
      v15 = 0;
    *(_QWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23) = v10 + 4 * (v12 - v15);
    if (v13)
      operator delete(v13);
    self->_faceConfidenceRollingVariance.m_initialized = 0;
  }
  m_end = self->_faceDetectedRealHistory.m_end;
  m_first = self->_faceDetectedRealHistory.m_first;
  m_size = self->_faceDetectedRealHistory.m_size;
  m_buff = self->_faceDetectedRealHistory.m_buff;
  v20 = m_end - m_first;
  v21 = &m_buff[m_size - (_QWORD)m_end];
  if (v20 <= m_size)
    m_size = (int64_t)v21;
  self->_faceDetectedRealHistory.m_first = &m_first[m_size];
  if (m_buff)
    operator delete(m_buff);

  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  v22 = self->_modelVertices.__begin_;
  if (v22)
  {
    self->_modelVertices.__end_ = v22;
    operator delete(v22);
  }
  objc_storeStrong((id *)&self->_facemaskRegionTexture, 0);
  objc_storeStrong((id *)&self->_kernel_Face, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc3, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc2, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc1, 0);
  objc_storeStrong((id *)&self->_inflightSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRelightingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapTextureSelectedPtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentTextureInterpolated, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentFarTexturePtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentNearTexturePtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapStudioFarTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapStudioFarTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapContourFarTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapContourFarTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapStudioNearTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapStudioNearTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapContourNearTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapContourNearTexture, 0);
  objc_storeStrong((id *)&self->_slideTexture, 0);
  objc_storeStrong((id *)&self->_countTexture, 0);
  objc_storeStrong((id *)&self->_vertCountTexture, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_dstUVTexture, 0);
  objc_storeStrong((id *)&self->_dstTexture, 0);
  objc_storeStrong((id *)&self->_srcTexture, 0);
  objc_storeStrong((id *)&self->_texSelectedColorCube, 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[6], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[5], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[4], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[3], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[2], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[1], 0);
  objc_storeStrong((id *)self->_texColorCubeStaticArray, 0);
  objc_storeStrong((id *)&self->_texColorCubeUserData, 0);
  objc_storeStrong((id *)&self->_colorCubeUserData, 0);
  objc_storeStrong((id *)&self->_texStub, 0);
  objc_storeStrong((id *)&self->_kernel_AlphaBlendRGBATextureArray, 0);
  objc_storeStrong((id *)&self->_kernel_Relight[1][1][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[1][1], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[1][0][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[1][0], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[0][1][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[0][1], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[0][0][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[0][0], 0);
  objc_storeStrong((id *)&self->_kernel_Slide, 0);
  objc_storeStrong((id *)&self->_kernel_Count, 0);
  objc_storeStrong((id *)&self->_kernel_CountVertical, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_lightTexture, 0);
  objc_storeStrong((id *)&self->_tcTexture, 0);
  objc_storeStrong((id *)&self->_tcDepthTexture, 0);
  objc_storeStrong((id *)&self->_tcKernel, 0);
  objc_storeStrong((id *)&self->_tcRenderDesc, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 41) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_OWORD *)self + 46) = 0u;
  *((_OWORD *)self + 47) = 0u;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_OWORD *)self + 50) = 0u;
  *((_OWORD *)self + 51) = 0u;
  *((_QWORD *)self + 119) = 0;
  *((_QWORD *)self + 120) = 0;
  *((_QWORD *)self + 118) = 0;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  *((_OWORD *)self + 63) = 0u;
  *(_OWORD *)((char *)self + 1020) = 0u;
  *(_OWORD *)((char *)self + 1048) = 0u;
  *(_OWORD *)((char *)self + 1064) = 0u;
  *((_QWORD *)self + 135) = 0;
  *((_BYTE *)self + 1088) = 0;
  *((_BYTE *)self + 1160) = 0;
  *((_QWORD *)self + 154) = 0;
  *((_QWORD *)self + 155) = 0;
  *((_QWORD *)self + 153) = 0;
  *((_BYTE *)self + 1304) = 0;
  *((_BYTE *)self + 1320) = 0;
  return self;
}

@end
