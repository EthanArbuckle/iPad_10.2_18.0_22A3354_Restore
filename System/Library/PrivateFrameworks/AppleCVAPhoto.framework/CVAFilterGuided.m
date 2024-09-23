@implementation CVAFilterGuided

- (CVAFilterGuided)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 textureSize:(id *)a7 alphaSize:(id *)a8 kernelSize:(int)a9 infConvolutionDownsampling:(int)a10 laplacianLimitingDownsampling:(int)a11 laplacianLimitingBlurSize:(int)a12 error:(id *)a13
{
  id v20;
  CVAFilterGuided *v21;
  objc_class *v22;
  uint64_t v23;
  NSString *label;
  unint64_t var1;
  unint64_t var0;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  void *v30;
  void *v31;
  id *p_device;
  uint64_t v33;
  uint64_t v34;
  MTLSamplerState *inputAlphaBlurredSampler;
  char *v36;
  uint64_t v37;
  MPSImageBox *mpsBox;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  __int128 v43;
  __int128 v44;
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
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  CVAFilterBox *v77;
  id v78;
  void *v79;
  uint64_t v80;
  CVAFilterBox *boxFilter;
  CVAFilterHybridResampling *v82;
  CVAFilterHybridResampling *hybridResampler;
  CVAFilterInfimumConvolution *v84;
  CVAFilterInfimumConvolution *infConvolution;
  CVAFilterGuided *v86;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v88;
  __int128 *v89;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v90;
  void **p_library;
  void **p_pipelineLibrary;
  id v93;
  id v94;
  id v95;
  id v96;
  __int128 v97;
  uint64_t v98;
  id v99[3];
  void **p_guidedFilterInvertKernel;
  __CFString *v101;
  void *v102;
  void **p_guidedFilterMultiplyKernel;
  __CFString *v104;
  void *v105;
  void **p_guidedFilterEmbedGuideKernel;
  __CFString *v107;
  void *v108;
  void **p_guidedFilterPremultiplyKernel;
  __CFString *v110;
  void *v111;
  void **p_guidedFilterSecondOrderProductsKernel;
  __CFString *v113;
  void *v114;
  void **p_guidedFilterRegressionKernel;
  __CFString *v116;
  void *v117;
  void **p_postProcessAlphaKernel;
  __CFString *v119;
  void *v120;
  objc_super v121;

  v20 = a3;
  v95 = a4;
  v94 = a5;
  v96 = a6;
  v121.receiver = self;
  v121.super_class = (Class)CVAFilterGuided;
  v21 = -[ImageSaverRegistrator init](&v121, sel_init);
  if (v21)
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v93 = v20;
    label = v21->_label;
    v21->_label = (NSString *)v23;

    objc_storeStrong((id *)&v21->_device, a3);
    p_library = (void **)&v21->_library;
    objc_storeStrong((id *)&v21->_library, a4);
    p_pipelineLibrary = (void **)&v21->_pipelineLibrary;
    objc_storeStrong((id *)&v21->_pipelineLibrary, a5);
    v21->_smallGuidedFilterKernelSize = a9;
    var0 = a7->var0;
    var1 = a7->var1;
    v88 = a7;
    v27 = a8->var0;
    v28 = a8->var1;
    v90 = a8;
    v29 = (char *)operator new(0x2A8uLL);
    *(_QWORD *)v29 = &v21->_gfSrcWithGuide;
    *((_QWORD *)v29 + 1) = 115;
    *((_QWORD *)v29 + 2) = var0;
    *((_QWORD *)v29 + 3) = var1;
    *((_DWORD *)v29 + 8) = 0;
    *((_QWORD *)v29 + 5) = &v21->_gfMeanSrcWithGuide;
    *((_QWORD *)v29 + 6) = 115;
    *((_QWORD *)v29 + 7) = var0;
    *((_QWORD *)v29 + 8) = var1;
    *((_DWORD *)v29 + 18) = 0;
    *((_QWORD *)v29 + 10) = &v21->_gfSrcGuide;
    *((_QWORD *)v29 + 11) = 115;
    *((_QWORD *)v29 + 12) = var0;
    *((_QWORD *)v29 + 13) = var1;
    *((_QWORD *)v29 + 15) = &v21->_gfMeanSrcGuide;
    *((_DWORD *)v29 + 28) = 0;
    *((_QWORD *)v29 + 16) = 115;
    *((_QWORD *)v29 + 17) = var0;
    *((_QWORD *)v29 + 18) = var1;
    *((_DWORD *)v29 + 38) = 0;
    *((_QWORD *)v29 + 20) = &v21->_gfRRRGRB;
    *((_QWORD *)v29 + 21) = 115;
    *((_QWORD *)v29 + 22) = var0;
    *((_QWORD *)v29 + 23) = var1;
    *((_DWORD *)v29 + 48) = 0;
    *((_QWORD *)v29 + 25) = &v21->_gfGGGBBB;
    *((_QWORD *)v29 + 26) = 115;
    *((_QWORD *)v29 + 27) = var0;
    *((_QWORD *)v29 + 28) = var1;
    *((_DWORD *)v29 + 58) = 0;
    *((_QWORD *)v29 + 30) = &v21->_gfMeanRRRGRB;
    *((_QWORD *)v29 + 31) = 115;
    *((_QWORD *)v29 + 32) = var0;
    *((_QWORD *)v29 + 33) = var1;
    *((_DWORD *)v29 + 68) = 0;
    *((_QWORD *)v29 + 35) = &v21->_gfMeanGGGBBB;
    *((_QWORD *)v29 + 36) = 115;
    *((_QWORD *)v29 + 37) = var0;
    *((_QWORD *)v29 + 38) = var1;
    *((_DWORD *)v29 + 78) = 0;
    *((_QWORD *)v29 + 40) = &v21->_gfTmp;
    *((_QWORD *)v29 + 41) = 115;
    *((_QWORD *)v29 + 42) = var0;
    *((_QWORD *)v29 + 43) = var1;
    *((_DWORD *)v29 + 88) = 0;
    *((_QWORD *)v29 + 45) = &v21->_gfTmp2;
    *((_QWORD *)v29 + 46) = 115;
    *((_QWORD *)v29 + 47) = var0;
    *((_QWORD *)v29 + 48) = var1;
    *((_DWORD *)v29 + 98) = 0;
    *((_QWORD *)v29 + 50) = &v21->_gfMeanWeight;
    *((_QWORD *)v29 + 51) = 25;
    *((_QWORD *)v29 + 52) = var0;
    *((_QWORD *)v29 + 53) = var1;
    *((_DWORD *)v29 + 108) = 0;
    *((_QWORD *)v29 + 55) = &v21->_gfMeanNormalizationFactor;
    *((_QWORD *)v29 + 56) = 25;
    *((_QWORD *)v29 + 57) = var0;
    *((_QWORD *)v29 + 58) = var1;
    *((_DWORD *)v29 + 118) = 0;
    *((_QWORD *)v29 + 60) = &v21->_convolutedCoeff;
    *((_QWORD *)v29 + 61) = 115;
    *((_QWORD *)v29 + 62) = var0;
    *((_QWORD *)v29 + 63) = var1;
    *((_DWORD *)v29 + 128) = 0;
    *((_QWORD *)v29 + 65) = &v21->_upscaledCoeff;
    *((_QWORD *)v29 + 66) = 115;
    *((_QWORD *)v29 + 67) = v27 >> 1;
    *((_QWORD *)v29 + 68) = v28 >> 1;
    *((_DWORD *)v29 + 138) = 0;
    *((_QWORD *)v29 + 70) = &v21->_lowResGammaMatte;
    *((_QWORD *)v29 + 71) = 10;
    *((_QWORD *)v29 + 72) = v27 / a10;
    *((_QWORD *)v29 + 73) = v28 / a10;
    *((_DWORD *)v29 + 148) = 1;
    *((_QWORD *)v29 + 75) = &v21->_inputAlphaDownsampled;
    *((_QWORD *)v29 + 76) = 10;
    *((_QWORD *)v29 + 77) = v27 / a11;
    *((_QWORD *)v29 + 78) = v28 / a11;
    *((_DWORD *)v29 + 158) = 1;
    *((_QWORD *)v29 + 80) = &v21->_gammaMatteTexture;
    *((_QWORD *)v29 + 81) = 10;
    *((_QWORD *)v29 + 82) = v27;
    *((_QWORD *)v29 + 83) = v28;
    *((_DWORD *)v29 + 168) = 1;
    v30 = (void *)objc_opt_new();
    v31 = v30;
    objc_msgSend(v30, "setMinFilter:", 0);
    p_device = (id *)&v21->_device;
    if (a12)
      v33 = 1;
    else
      v33 = 2;
    objc_msgSend(v30, "setMagFilter:", v33, v88);
    objc_msgSend(v30, "setSAddressMode:", 0);
    objc_msgSend(v30, "setTAddressMode:", 0);
    objc_msgSend(v30, "setNormalizedCoordinates:", 1);
    v34 = objc_msgSend(*p_device, "newSamplerStateWithDescriptor:", v30);
    inputAlphaBlurredSampler = v21->_inputAlphaBlurredSampler;
    v21->_inputAlphaBlurredSampler = (MTLSamplerState *)v34;

    if (v21->_inputAlphaBlurredSampler)
    {
      v36 = v29 + 680;
      if (a12 && !sub_1B569090C(CFSTR("harvesting.enabled"), CFSTR("com.apple.coremedia"), 0))
      {
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E10]), "initWithDevice:kernelWidth:kernelHeight:", *p_device, a12, a12);
        mpsBox = v21->_mpsBox;
        v21->_mpsBox = (MPSImageBox *)v37;

        -[MPSImageBox setEdgeMode:](v21->_mpsBox, "setEdgeMode:", 1);
        objc_msgSend(v96, "commandBuffer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setLabel:", CFSTR("MPSImageBox"));
        sub_1B56A3104(v21->_mpsBox, *p_device, v39, 10);
        objc_msgSend(v39, "commit");

        v40 = v90->var0;
        v41 = v90->var1;
        v42 = (char *)operator new(0x550uLL);
        *((_QWORD *)v42 + 85) = &v21->_inputAlphaBlurred;
        *((_QWORD *)v42 + 86) = 10;
        *((_QWORD *)v42 + 87) = v40 / a11;
        *((_QWORD *)v42 + 88) = v41 / a11;
        *((_DWORD *)v42 + 178) = 0;
        v43 = *((_OWORD *)v29 + 41);
        *((_OWORD *)v42 + 40) = *((_OWORD *)v29 + 40);
        *((_OWORD *)v42 + 41) = v43;
        *((_DWORD *)v42 + 168) = *((_DWORD *)v29 + 168);
        v44 = *(_OWORD *)(v29 + 616);
        *(_OWORD *)(v42 + 600) = *(_OWORD *)(v29 + 600);
        *(_OWORD *)(v42 + 616) = v44;
        *((_DWORD *)v42 + 158) = *((_DWORD *)v29 + 158);
        v45 = *((_OWORD *)v29 + 35);
        v46 = *((_OWORD *)v29 + 36);
        *((_DWORD *)v42 + 148) = *((_DWORD *)v29 + 148);
        *((_OWORD *)v42 + 35) = v45;
        *((_OWORD *)v42 + 36) = v46;
        *((_DWORD *)v42 + 138) = *((_DWORD *)v29 + 138);
        v47 = *(_OWORD *)(v29 + 536);
        *(_OWORD *)(v42 + 520) = *(_OWORD *)(v29 + 520);
        *(_OWORD *)(v42 + 536) = v47;
        *((_DWORD *)v42 + 128) = *((_DWORD *)v29 + 128);
        v48 = *((_OWORD *)v29 + 31);
        *((_OWORD *)v42 + 30) = *((_OWORD *)v29 + 30);
        *((_OWORD *)v42 + 31) = v48;
        v49 = *(_OWORD *)(v29 + 440);
        v50 = *(_OWORD *)(v29 + 456);
        *((_DWORD *)v42 + 118) = *((_DWORD *)v29 + 118);
        *(_OWORD *)(v42 + 440) = v49;
        *(_OWORD *)(v42 + 456) = v50;
        v51 = *((_OWORD *)v29 + 25);
        v52 = *((_OWORD *)v29 + 26);
        *((_DWORD *)v42 + 108) = *((_DWORD *)v29 + 108);
        *((_OWORD *)v42 + 25) = v51;
        *((_OWORD *)v42 + 26) = v52;
        v53 = *(_OWORD *)(v29 + 360);
        v54 = *(_OWORD *)(v29 + 376);
        *((_DWORD *)v42 + 98) = *((_DWORD *)v29 + 98);
        *(_OWORD *)(v42 + 360) = v53;
        *(_OWORD *)(v42 + 376) = v54;
        v55 = *((_OWORD *)v29 + 20);
        v56 = *((_OWORD *)v29 + 21);
        *((_DWORD *)v42 + 88) = *((_DWORD *)v29 + 88);
        *((_OWORD *)v42 + 20) = v55;
        *((_OWORD *)v42 + 21) = v56;
        v57 = *(_OWORD *)(v29 + 280);
        v58 = *(_OWORD *)(v29 + 296);
        *((_DWORD *)v42 + 78) = *((_DWORD *)v29 + 78);
        *(_OWORD *)(v42 + 280) = v57;
        *(_OWORD *)(v42 + 296) = v58;
        v59 = *((_OWORD *)v29 + 15);
        v60 = *((_OWORD *)v29 + 16);
        *((_DWORD *)v42 + 68) = *((_DWORD *)v29 + 68);
        *((_OWORD *)v42 + 15) = v59;
        *((_OWORD *)v42 + 16) = v60;
        v61 = *(_OWORD *)(v29 + 200);
        v62 = *(_OWORD *)(v29 + 216);
        *((_DWORD *)v42 + 58) = *((_DWORD *)v29 + 58);
        *(_OWORD *)(v42 + 216) = v62;
        *(_OWORD *)(v42 + 200) = v61;
        v63 = *((_OWORD *)v29 + 10);
        v64 = *((_OWORD *)v29 + 11);
        *((_DWORD *)v42 + 48) = *((_DWORD *)v29 + 48);
        *((_OWORD *)v42 + 10) = v63;
        *((_OWORD *)v42 + 11) = v64;
        v65 = *(_OWORD *)(v29 + 120);
        v66 = *(_OWORD *)(v29 + 136);
        *((_DWORD *)v42 + 38) = *((_DWORD *)v29 + 38);
        *(_OWORD *)(v42 + 136) = v66;
        *(_OWORD *)(v42 + 120) = v65;
        v67 = *((_OWORD *)v29 + 5);
        v68 = *((_OWORD *)v29 + 6);
        *((_DWORD *)v42 + 28) = *((_DWORD *)v29 + 28);
        *((_OWORD *)v42 + 5) = v67;
        *((_OWORD *)v42 + 6) = v68;
        v69 = *(_OWORD *)(v29 + 40);
        v70 = *(_OWORD *)(v29 + 56);
        *((_DWORD *)v42 + 18) = *((_DWORD *)v29 + 18);
        *(_OWORD *)(v42 + 56) = v70;
        *(_OWORD *)(v42 + 40) = v69;
        v71 = *(_OWORD *)v29;
        v72 = *((_OWORD *)v29 + 1);
        *((_DWORD *)v42 + 8) = *((_DWORD *)v29 + 8);
        v36 = v42 + 720;
        *(_OWORD *)v42 = v71;
        *((_OWORD *)v42 + 1) = v72;
        operator delete(v29);
        v29 = v42;
        v20 = v93;
      }
      v73 = v29;
      do
      {
        sub_1B56A2BD0(*p_device, *((_QWORD *)v73 + 1), *((_QWORD *)v73 + 2), *((_QWORD *)v73 + 3), a13);
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = **(void ***)v73;
        **(_QWORD **)v73 = v74;

        if (!*(_QWORD *)v73)
          goto LABEL_25;
        v73 += 40;
      }
      while (v73 != v36);
      v76 = v31;
      if (!v21->_gammaMatteTexture)
      {
        v86 = 0;
        goto LABEL_31;
      }
      v99[0] = &v21->_guidedFilterApplyRGBAKernel;
      v99[1] = CFSTR("guidedFilterApplyRGBA");
      v99[2] = 0;
      p_guidedFilterInvertKernel = (void **)&v21->_guidedFilterInvertKernel;
      v101 = CFSTR("invert");
      v102 = 0;
      p_guidedFilterMultiplyKernel = (void **)&v21->_guidedFilterMultiplyKernel;
      v104 = CFSTR("multiply");
      v105 = 0;
      p_guidedFilterEmbedGuideKernel = (void **)&v21->_guidedFilterEmbedGuideKernel;
      v107 = CFSTR("embedGuide");
      v108 = 0;
      p_guidedFilterPremultiplyKernel = (void **)&v21->_guidedFilterPremultiplyKernel;
      v110 = CFSTR("premultiply");
      v111 = 0;
      p_guidedFilterSecondOrderProductsKernel = (void **)&v21->_guidedFilterSecondOrderProductsKernel;
      v113 = CFSTR("secondOrderProducts");
      v114 = 0;
      p_guidedFilterRegressionKernel = (void **)&v21->_guidedFilterRegressionKernel;
      v116 = CFSTR("getRegressionCoeffs");
      v117 = 0;
      p_postProcessAlphaKernel = (void **)&v21->_postProcessAlphaKernel;
      v119 = CFSTR("postProcessAlpha");
      v120 = 0;
      sub_1B5674B88((void **)&v21->_guidedFilterApplyRGBAKernel, *p_library, *p_pipelineLibrary, *p_device, CFSTR("guidedFilterApplyRGBA"), a13, 0);
      if (v21 != (CVAFilterGuided *)-232)
      {
        sub_1B5674B88(p_guidedFilterInvertKernel, *p_library, *p_pipelineLibrary, *p_device, v101, a13, v102);
        if (p_guidedFilterInvertKernel)
        {
          sub_1B5674B88(p_guidedFilterMultiplyKernel, *p_library, *p_pipelineLibrary, *p_device, v104, a13, v105);
          if (p_guidedFilterMultiplyKernel)
          {
            sub_1B5674B88(p_guidedFilterEmbedGuideKernel, *p_library, *p_pipelineLibrary, *p_device, v107, a13, v108);
            if (p_guidedFilterEmbedGuideKernel)
            {
              sub_1B5674B88(p_guidedFilterPremultiplyKernel, *p_library, *p_pipelineLibrary, *p_device, v110, a13, v111);
              if (p_guidedFilterPremultiplyKernel)
              {
                sub_1B5674B88(p_guidedFilterSecondOrderProductsKernel, *p_library, *p_pipelineLibrary, *p_device, v113, a13, v114);
                if (p_guidedFilterSecondOrderProductsKernel)
                {
                  sub_1B5674B88(p_guidedFilterRegressionKernel, *p_library, *p_pipelineLibrary, *p_device, v116, a13, v117);
                  if (p_guidedFilterRegressionKernel)
                  {
                    sub_1B5674B88(p_postProcessAlphaKernel, *p_library, *p_pipelineLibrary, *p_device, v119, a13, v120);
                    if (p_postProcessAlphaKernel)
                    {
                      v77 = [CVAFilterBox alloc];
                      v78 = *p_device;
                      v79 = *p_pipelineLibrary;
                      v97 = *v89;
                      v98 = *((_QWORD *)v89 + 2);
                      v80 = -[CVAFilterBox initWithDevice:library:pipelineLibrary:textureSize:error:](v77, "initWithDevice:library:pipelineLibrary:textureSize:error:", v78, v95, v79, &v97, a13);
                      boxFilter = v21->_boxFilter;
                      v21->_boxFilter = (CVAFilterBox *)v80;

                      if (v21->_boxFilter)
                      {
                        v82 = -[CVAFilterHybridResampling initWithDevice:library:pipelineLibrary:commandQueue:error:]([CVAFilterHybridResampling alloc], "initWithDevice:library:pipelineLibrary:commandQueue:error:", *p_device, v95, *p_pipelineLibrary, v96, a13);
                        hybridResampler = v21->_hybridResampler;
                        v21->_hybridResampler = v82;

                        if (!v21->_hybridResampler)
                        {
                          v86 = 0;
                          v76 = v31;
                          goto LABEL_30;
                        }
                        v84 = -[CVAFilterInfimumConvolution initWithDevice:library:pipelineLibrary:bufferWidth:bufferHeight:error:]([CVAFilterInfimumConvolution alloc], "initWithDevice:library:pipelineLibrary:bufferWidth:bufferHeight:error:", *p_device, *p_library, *p_pipelineLibrary, -[MTLTexture width](v21->_lowResGammaMatte, "width"), -[MTLTexture height](v21->_lowResGammaMatte, "height"), a13);
                        infConvolution = v21->_infConvolution;
                        v21->_infConvolution = v84;

                        v76 = v31;
                        if (v21->_infConvolution)
                        {
                          v86 = v21;
LABEL_30:
                          sub_1B5674E20(v99);
                          goto LABEL_31;
                        }
                      }
                      else
                      {
                        v76 = v31;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v86 = 0;
      goto LABEL_30;
    }
LABEL_25:
    v86 = 0;
    v76 = v31;
LABEL_31:

    operator delete(v29);
  }
  else
  {
    v86 = 0;
  }

  return v86;
}

- (void)encodeRegressionToCommandBuffer:(id)a3 inSourceTexture:(id)a4 inGuidanceTexture:(id)a5 inWeightTexture:(id)a6 outCoeffTexture:(id)a7 epsilon:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  int64x2_t v40;
  uint64_t v41;
  _QWORD v42[3];
  float v43;
  int64x2_t v44;
  uint64_t v45;
  _QWORD v46[3];
  int64x2_t v47;
  uint64_t v48;
  _QWORD v49[3];
  int64x2_t v50;
  uint64_t v51;
  _QWORD v52[3];
  int64x2_t v53;
  uint64_t v54;
  _QWORD v55[3];
  int64x2_t v56;
  uint64_t v57;
  _QWORD v58[3];
  int64x2_t v59;
  uint64_t v60;
  _QWORD v61[3];
  int64x2_t v62;
  uint64_t v63;
  _QWORD v64[3];
  int64x2_t v65;
  uint64_t v66;
  _QWORD v67[3];
  int64x2_t v68;
  uint64_t v69;
  _QWORD v70[3];
  int64x2_t v71;
  uint64_t v72;
  _QWORD v73[3];
  int64x2_t v74;
  uint64_t v75;
  _QWORD v76[3];
  int64x2_t v77;
  uint64_t v78;
  _QWORD v79[4];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v36 = a7;
  v38 = v16;
  v37 = v15;
  v39 = v17;
  v18 = objc_msgSend(v17, "width");
  v19 = objc_msgSend(v17, "height");
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v18, v19, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setUsage:", 1);
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v14, v17, self->_gfMeanWeight, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 0);
  objc_msgSend(v14, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLabel:", CFSTR("_guidedFilterInvertKernel"));
  objc_msgSend(v20, "setComputePipelineState:", self->_guidedFilterInvertKernel);
  objc_msgSend(v20, "setTexture:atIndex:", self->_gfMeanWeight, 0);
  objc_msgSend(v20, "setTexture:atIndex:", self->_gfMeanNormalizationFactor, 1);
  v21 = (unint64_t)(v18 + 15) >> 4;
  v22 = (unint64_t)(v19 + 15) >> 4;
  v79[0] = v21;
  v79[1] = v22;
  v79[2] = 1;
  v77 = vdupq_n_s64(0x10uLL);
  v78 = 1;
  objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v79, &v77);
  objc_msgSend(v20, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setLabel:", CFSTR("_guidedFilterEmbedGuideKernel"));
  objc_msgSend(v23, "setComputePipelineState:", self->_guidedFilterEmbedGuideKernel);
  objc_msgSend(v23, "setTexture:atIndex:", v38, 0);
  objc_msgSend(v23, "setTexture:atIndex:", v37, 1);
  objc_msgSend(v23, "setTexture:atIndex:", self->_gfSrcWithGuide, 2);
  v76[0] = v21;
  v76[1] = v22;
  v76[2] = 1;
  v74 = vdupq_n_s64(0x10uLL);
  v75 = 1;
  objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", v76, &v74);
  objc_msgSend(v23, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v24, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v24, "setTexture:atIndex:", self->_gfSrcWithGuide, 0);
  objc_msgSend(v24, "setTexture:atIndex:", v39, 1);
  objc_msgSend(v24, "setTexture:atIndex:", self->_gfTmp, 2);
  v73[0] = v21;
  v73[1] = v22;
  v73[2] = 1;
  v71 = vdupq_n_s64(0x10uLL);
  v72 = 1;
  objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", v73, &v71);
  objc_msgSend(v24, "endEncoding");
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v14, self->_gfTmp, self->_gfTmp2, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 0);
  objc_msgSend(v14, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v25, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v25, "setTexture:atIndex:", self->_gfTmp2, 0);
  objc_msgSend(v25, "setTexture:atIndex:", self->_gfMeanNormalizationFactor, 1);
  objc_msgSend(v25, "setTexture:atIndex:", self->_gfMeanSrcWithGuide, 2);
  v70[0] = v21;
  v70[1] = v22;
  v70[2] = 1;
  v68 = vdupq_n_s64(0x10uLL);
  v69 = 1;
  objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", v70, &v68);
  objc_msgSend(v25, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setLabel:", CFSTR("_guidedFilterPremultiplyKernel"));
  objc_msgSend(v26, "setComputePipelineState:", self->_guidedFilterPremultiplyKernel);
  objc_msgSend(v26, "setTexture:atIndex:", self->_gfSrcWithGuide, 0);
  objc_msgSend(v26, "setTexture:atIndex:", self->_gfSrcGuide, 1);
  v67[0] = v21;
  v67[1] = v22;
  v67[2] = 1;
  v65 = vdupq_n_s64(0x10uLL);
  v66 = 1;
  objc_msgSend(v26, "dispatchThreadgroups:threadsPerThreadgroup:", v67, &v65);
  objc_msgSend(v26, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v27, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v27, "setTexture:atIndex:", self->_gfSrcGuide, 0);
  objc_msgSend(v27, "setTexture:atIndex:", v39, 1);
  objc_msgSend(v27, "setTexture:atIndex:", self->_gfTmp, 2);
  v64[0] = v21;
  v64[1] = v22;
  v64[2] = 1;
  v62 = vdupq_n_s64(0x10uLL);
  v63 = 1;
  objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", v64, &v62);
  objc_msgSend(v27, "endEncoding");
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v14, self->_gfTmp, self->_gfTmp2, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 0);
  objc_msgSend(v14, "computeCommandEncoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v28, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v28, "setTexture:atIndex:", self->_gfTmp2, 0);
  objc_msgSend(v28, "setTexture:atIndex:", self->_gfMeanNormalizationFactor, 1);
  objc_msgSend(v28, "setTexture:atIndex:", self->_gfMeanSrcGuide, 2);
  v61[0] = v21;
  v61[1] = v22;
  v61[2] = 1;
  v59 = vdupq_n_s64(0x10uLL);
  v60 = 1;
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v61, &v59);
  objc_msgSend(v28, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setLabel:", CFSTR("_guidedFilterSecondOrderProductsKernel"));
  objc_msgSend(v29, "setComputePipelineState:", self->_guidedFilterSecondOrderProductsKernel);
  objc_msgSend(v29, "setTexture:atIndex:", self->_gfSrcWithGuide, 0);
  objc_msgSend(v29, "setTexture:atIndex:", self->_gfRRRGRB, 1);
  objc_msgSend(v29, "setTexture:atIndex:", self->_gfGGGBBB, 2);
  v58[0] = v21;
  v58[1] = v22;
  v58[2] = 1;
  v56 = vdupq_n_s64(0x10uLL);
  v57 = 1;
  objc_msgSend(v29, "dispatchThreadgroups:threadsPerThreadgroup:", v58, &v56);
  objc_msgSend(v29, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v30, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v30, "setTexture:atIndex:", self->_gfRRRGRB, 0);
  objc_msgSend(v30, "setTexture:atIndex:", v39, 1);
  objc_msgSend(v30, "setTexture:atIndex:", self->_gfTmp, 2);
  v55[0] = v21;
  v55[1] = v22;
  v55[2] = 1;
  v53 = vdupq_n_s64(0x10uLL);
  v54 = 1;
  objc_msgSend(v30, "dispatchThreadgroups:threadsPerThreadgroup:", v55, &v53);
  objc_msgSend(v30, "endEncoding");
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v14, self->_gfTmp, self->_gfTmp2, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 0);
  objc_msgSend(v14, "computeCommandEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v31, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v31, "setTexture:atIndex:", self->_gfTmp2, 0);
  objc_msgSend(v31, "setTexture:atIndex:", self->_gfMeanNormalizationFactor, 1);
  objc_msgSend(v31, "setTexture:atIndex:", self->_gfMeanRRRGRB, 2);
  v52[0] = v21;
  v52[1] = v22;
  v52[2] = 1;
  v50 = vdupq_n_s64(0x10uLL);
  v51 = 1;
  objc_msgSend(v31, "dispatchThreadgroups:threadsPerThreadgroup:", v52, &v50);
  objc_msgSend(v31, "endEncoding");
  objc_msgSend(v14, "computeCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v32, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v32, "setTexture:atIndex:", self->_gfGGGBBB, 0);
  objc_msgSend(v32, "setTexture:atIndex:", v39, 1);
  objc_msgSend(v32, "setTexture:atIndex:", self->_gfTmp, 2);
  v49[0] = v21;
  v49[1] = v22;
  v49[2] = 1;
  v47 = vdupq_n_s64(0x10uLL);
  v48 = 1;
  objc_msgSend(v32, "dispatchThreadgroups:threadsPerThreadgroup:", v49, &v47);
  objc_msgSend(v32, "endEncoding");
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v14, self->_gfTmp, self->_gfTmp2, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 0);
  objc_msgSend(v14, "computeCommandEncoder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "setLabel:", CFSTR("_guidedFilterMultiplyKernel"));
  objc_msgSend(v33, "setComputePipelineState:", self->_guidedFilterMultiplyKernel);
  objc_msgSend(v33, "setTexture:atIndex:", self->_gfTmp2, 0);
  objc_msgSend(v33, "setTexture:atIndex:", self->_gfMeanNormalizationFactor, 1);
  objc_msgSend(v33, "setTexture:atIndex:", self->_gfMeanGGGBBB, 2);
  v46[0] = v21;
  v46[1] = v22;
  v46[2] = 1;
  v44 = vdupq_n_s64(0x10uLL);
  v45 = 1;
  objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v46, &v44);
  objc_msgSend(v33, "endEncoding");
  v43 = a8;
  objc_msgSend(v14, "computeCommandEncoder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "setLabel:", CFSTR("_guidedFilterRegressionKernel"));
  objc_msgSend(v34, "setComputePipelineState:", self->_guidedFilterRegressionKernel);
  objc_msgSend(v34, "setTexture:atIndex:", self->_gfMeanSrcWithGuide, 0);
  objc_msgSend(v34, "setTexture:atIndex:", self->_gfMeanSrcGuide, 1);
  objc_msgSend(v34, "setTexture:atIndex:", self->_gfMeanRRRGRB, 2);
  objc_msgSend(v34, "setTexture:atIndex:", self->_gfMeanGGGBBB, 3);
  objc_msgSend(v34, "setTexture:atIndex:", v36, 4);
  objc_msgSend(v34, "setBytes:length:atIndex:", &v43, 4, 0);
  v42[0] = v21;
  v42[1] = v22;
  v42[2] = 1;
  v40 = vdupq_n_s64(0x10uLL);
  v41 = 1;
  objc_msgSend(v34, "dispatchThreadgroups:threadsPerThreadgroup:", v42, &v40);
  objc_msgSend(v34, "endEncoding");

}

- (void)encodeReconstructToCommandBuffer:(id)a3 inGuidancePixelBuffer:(__CVBuffer *)a4 inCoeffTexture:(id)a5 outFilteredTexture:(id)a6
{
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v10 = a5;
  v11 = a6;
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v12, v10, self->_convolutedCoeff, (uint64_t)(self->_smallGuidedFilterKernelSize + (self->_smallGuidedFilterKernelSize < 0)) >> 1, 2);
  -[CVAFilterGuided encodeHybridUpSamplingToCommandBuffer:source:destination:](self, "encodeHybridUpSamplingToCommandBuffer:source:destination:", v12, self->_convolutedCoeff, self->_upscaledCoeff);
  -[CVAFilterGuided initSourceTexture:](self, "initSourceTexture:", a4);
  -[CVAFilterGuided encodeFilterApplyToBuffer:coeff:source:destination:](self, "encodeFilterApplyToBuffer:coeff:source:destination:", v12, self->_upscaledCoeff, self->_srcTexture, v11);

}

- (void)initSourceTexture:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  void *v8;
  int v9;
  uint64_t v10;
  MTLTexture *v11;
  MTLTexture *srcTexture;
  id v13;
  id v14;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v13, "containsObject:", v8);

  if (v9)
    v10 = 500;
  else
    v10 = 70;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v10, Width, Height, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStorageMode:", 0);
  v11 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v14, CVPixelBufferGetIOSurface(a3), 0);
  srcTexture = self->_srcTexture;
  self->_srcTexture = v11;

}

- (void)encodeFilterApplyToBuffer:(id)a3 coeff:(id)a4 source:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64x2_t v19;
  uint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("_guidedFilterApplyRGBAKernel"));
  objc_msgSend(v13, "setComputePipelineState:", self->_guidedFilterApplyRGBAKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
  v14 = objc_msgSend(v12, "width");
  v15 = objc_msgSend(v12, "height");
  v16.i64[0] = v14;
  v16.i64[1] = v15;
  v19 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v16, 1uLL), 4uLL);
  v20 = 1;
  v17 = vdupq_n_s64(0x10uLL);
  v18 = 1;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodePostProcessAlphaToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 alphaMaxLaplacian:(float)a6 infConvOrientation:(float)a7 infConvMajorRadius:(float)a8 infConvMinorRadius:(float)a9 gammaExponent:(float)a10 enableInfConvolution:(BOOL)a11
{
  _BOOL4 v11;
  id v20;
  id v21;
  _BOOL8 v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  MTLTexture *gammaMatteTexture;
  MTLTexture *inputAlphaBlurred;
  uint64_t v28;
  uint64_t v29;
  uint64x2_t v30;
  unsigned __int8 v31;
  CVAFilterInfimumConvolution *infConvolution;
  MTLTexture *v33;
  MTLTexture *lowResGammaMatte;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  char v40;
  id v41;
  void *__p[2];
  char v43;
  __int128 v44;
  uint64_t v45;
  uint64x2_t v46;
  uint64_t v47;
  _DWORD v48[4];

  v11 = a11;
  v20 = a3;
  v21 = a4;
  v41 = a5;
  *(float *)v48 = a10;
  *(float *)&v48[1] = a6;
  v22 = v11;
  v23 = atomic_load((unsigned __int8 *)&qword_1EF12D428);
  if ((v23 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D428))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

    byte_1EF12D746 = v40;
    __cxa_guard_release(&qword_1EF12D428);
  }
  -[CVAFilterHybridResampling encodeHybridDownsamplingToCommandBuffer:source:destination:](self->_hybridResampler, "encodeHybridDownsamplingToCommandBuffer:source:destination:", v20, v21, self->_inputAlphaDownsampled);
  if (byte_1EF12D746)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AP.laplacianLimDownsampling = %lu"), objc_msgSend(v21, "width") / (unint64_t)-[MTLTexture width](self->_inputAlphaDownsampled, "width"));

  }
  if (self->_inputAlphaBlurred)
  {
    -[MPSImageBox encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_mpsBox, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v20, self->_inputAlphaDownsampled);
    if (byte_1EF12D746)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AP.laplacianLimBlurSize = %lu"), -[MPSImageBox kernelWidth](self->_mpsBox, "kernelWidth"));

    }
  }
  v24 = v41;
  objc_msgSend(v20, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLabel:", CFSTR("_postProcessAlphaKernel"));
  objc_msgSend(v25, "setComputePipelineState:", self->_postProcessAlphaKernel);
  objc_msgSend(v25, "setTexture:atIndex:", v21, 0);
  gammaMatteTexture = (MTLTexture *)v41;
  if (v22)
    gammaMatteTexture = self->_gammaMatteTexture;
  objc_msgSend(v25, "setTexture:atIndex:", gammaMatteTexture, 1);
  inputAlphaBlurred = self->_inputAlphaBlurred;
  if (!inputAlphaBlurred)
    inputAlphaBlurred = self->_inputAlphaDownsampled;
  objc_msgSend(v25, "setTexture:atIndex:", inputAlphaBlurred, 2);
  objc_msgSend(v25, "setSamplerState:atIndex:", self->_inputAlphaBlurredSampler, 0);
  objc_msgSend(v25, "setBytes:length:atIndex:", v48, 8, 0);
  v28 = objc_msgSend(v21, "width");
  v29 = objc_msgSend(v21, "height");
  v30.i64[0] = v28;
  v30.i64[1] = v29;
  v46 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v30, 1uLL), 4uLL);
  v47 = 1;
  v45 = 1;
  v44 = xmmword_1B56AC968;
  objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v46, &v44);
  objc_msgSend(v25, "endEncoding");
  if (byte_1EF12D746)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AP.InfimumConvolution = %d"), v22);

  }
  if (v22)
  {
    if (byte_1EF12D746)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AP.infConvMinorRadius = %.2f"), a9);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AP.infConvMajorRadius = %.2f"), a8);
    }
    -[CVAFilterHybridResampling encodeHybridDownsamplingToCommandBuffer:source:destination:](self->_hybridResampler, "encodeHybridDownsamplingToCommandBuffer:source:destination:", v20, self->_gammaMatteTexture, self->_lowResGammaMatte);
    v31 = atomic_load((unsigned __int8 *)&qword_1EF12D750);
    if ((v31 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D750))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 5);
      qword_1EF12D748 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D750);
      v24 = v41;
    }
    if ((byte_1EF12D758 & 1) == 0)
    {
      v43 = 12;
      strcpy((char *)__p, "infConvIters");
      sub_1B5667F7C((uint64_t)&qword_1EF12D748, (uint64_t)__p);
      if (v43 < 0)
        operator delete(__p[0]);
      byte_1EF12D758 = 1;
    }
    infConvolution = self->_infConvolution;
    v33 = self->_gammaMatteTexture;
    lowResGammaMatte = self->_lowResGammaMatte;
    v35 = objc_msgSend((id)qword_1EF12D748, "intValue");
    *(float *)&v36 = a7;
    *(float *)&v37 = a8;
    *(float *)&v38 = a9;
    -[CVAFilterInfimumConvolution encodeToCommandBuffer:sourceTexture:smallSourceTexture:destinationTexture:orientation:majorRadius:minorRadius:iterations:](infConvolution, "encodeToCommandBuffer:sourceTexture:smallSourceTexture:destinationTexture:orientation:majorRadius:minorRadius:iterations:", v20, v33, lowResGammaMatte, v24, v35, v36, v37, v38);
  }

}

- (void)encodeHybridUpSamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v7;
  id v8;
  id v9;
  CVAFilterGuided *v10;
  uint64_t v11;
  MTLTexture *hybridUpscalingIntermediateR32Texture;
  uint64_t v13;
  void *v14;
  MTLTexture *v15;
  void *v16;
  _QWORD *v17;
  SEL v18;
  CVAFilterGuided *v19;

  v18 = a2;
  v19 = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "pixelFormat", &v19, &v18) == 55 || objc_msgSend(v8, "pixelFormat") == 25)
  {
    v10 = v19;
    v11 = 208;
    hybridUpscalingIntermediateR32Texture = v19->_hybridUpscalingIntermediateR32Texture;
    if (!hybridUpscalingIntermediateR32Texture)
    {
      sub_1B567C7B4(&v17, 55, (unint64_t)objc_msgSend(v9, "width") >> 1, (unint64_t)objc_msgSend(v9, "height") >> 1);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v14 = *(Class *)((char *)&v19->super.super.isa + v11);
      *(Class *)((char *)&v19->super.super.isa + v11) = (Class)v13;

      v10 = v19;
      hybridUpscalingIntermediateR32Texture = *(Class *)((char *)&v19->super.super.isa + v11);
    }
  }
  else
  {
    v10 = v19;
    v11 = 200;
    hybridUpscalingIntermediateR32Texture = v19->_hybridUpscalingIntermediateTexture;
    if (!hybridUpscalingIntermediateR32Texture)
    {
      sub_1B567C7B4(&v17, 115, (unint64_t)objc_msgSend(v9, "width") >> 1, (unint64_t)objc_msgSend(v9, "height") >> 1);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  v15 = hybridUpscalingIntermediateR32Texture;
  -[CVAFilterHybridResampling scaler](v10->_hybridResampler, "scaler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v7, v8, v15);

  -[CVAFilterHybridResampling encodeBilinearScalingToCommandBuffer:source:destination:mode:](v19->_hybridResampler, "encodeBilinearScalingToCommandBuffer:source:destination:mode:", v7, v15, v9, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_mpsBox, 0);
  objc_storeStrong((id *)&self->_infConvolution, 0);
  objc_storeStrong((id *)&self->_postProcessAlphaKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterRegressionKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterSecondOrderProductsKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterPremultiplyKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterEmbedGuideKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterMultiplyKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterInvertKernel, 0);
  objc_storeStrong((id *)&self->_guidedFilterApplyRGBAKernel, 0);
  objc_storeStrong((id *)&self->_lowResGammaMatte, 0);
  objc_storeStrong((id *)&self->_srcTexture, 0);
  objc_storeStrong((id *)&self->_hybridUpscalingIntermediateR32Texture, 0);
  objc_storeStrong((id *)&self->_hybridUpscalingIntermediateTexture, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_gammaMatteTexture, 0);
  objc_storeStrong((id *)&self->_inputAlphaBlurredSampler, 0);
  objc_storeStrong((id *)&self->_inputAlphaBlurred, 0);
  objc_storeStrong((id *)&self->_inputAlphaDownsampled, 0);
  objc_storeStrong((id *)&self->_upscaledCoeff, 0);
  objc_storeStrong((id *)&self->_convolutedCoeff, 0);
  objc_storeStrong((id *)&self->_gfMeanNormalizationFactor, 0);
  objc_storeStrong((id *)&self->_gfMeanWeight, 0);
  objc_storeStrong((id *)&self->_gfTmp2, 0);
  objc_storeStrong((id *)&self->_gfTmp, 0);
  objc_storeStrong((id *)&self->_gfMeanGGGBBB, 0);
  objc_storeStrong((id *)&self->_gfMeanRRRGRB, 0);
  objc_storeStrong((id *)&self->_gfGGGBBB, 0);
  objc_storeStrong((id *)&self->_gfRRRGRB, 0);
  objc_storeStrong((id *)&self->_gfMeanSrcGuide, 0);
  objc_storeStrong((id *)&self->_gfSrcGuide, 0);
  objc_storeStrong((id *)&self->_gfMeanSrcWithGuide, 0);
  objc_storeStrong((id *)&self->_gfSrcWithGuide, 0);
  objc_storeStrong((id *)&self->_hybridResampler, 0);
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
