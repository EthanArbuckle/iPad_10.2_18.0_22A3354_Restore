@implementation _MTLDeviceFeatureQueries

- (BOOL)familySupportsExtendedXR10Formats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsReadWriteTextureArgumentsTier2
{
  return (unint64_t)-[MTLDeviceSPI readWriteTextureSupport](self->_device, "readWriteTextureSupport") > 1;
}

- (BOOL)familySupportsNonPrivateDepthStencilTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsNonPrivateMSAATextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsLossyCompression
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1008);
}

- (BOOL)familySupportsUnalignedVertexFetch
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsBfloat16Buffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsGlobalVariableRelocationCompute
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsTextureSwizzle
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (_MTLDeviceFeatureQueries)initWithDevice:(id)a3
{
  _MTLDeviceFeatureQueries *v4;
  _MTLDeviceFeatureQueries *v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  char v82;
  char v83;
  char v84;
  char v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  char v120;
  char v121;
  char v122;
  char v123;
  char v124;
  char v125;
  char v126;
  char v127;
  char v128;
  char v129;
  char v130;
  char v131;
  char v132;
  char v133;
  char v134;
  char v135;
  char v136;
  char v137;
  char v138;
  char v139;
  char v140;
  char v141;
  char v142;
  char v143;
  char v144;
  char v145;
  char v146;
  char v147;
  char v148;
  char v149;
  char v150;
  char v151;
  char v152;
  char v153;
  char v154;
  char v155;
  char v156;
  char v157;
  char v158;
  char v159;
  char v160;
  char v161;
  char v162;
  char v163;
  char v164;
  char v165;
  char v166;
  char v167;
  char v168;
  char v169;
  char v170;
  char v171;
  char v172;
  char v173;
  char v174;
  char v175;
  char v176;
  char v177;
  char v178;
  char v179;
  char v180;
  char v181;
  char v182;
  char v183;
  char v184;
  char v185;
  char v186;
  char v187;
  char v188;
  char v189;
  char v190;
  char v191;
  char v192;
  char v193;
  char v194;
  char v195;
  char v196;
  char v197;
  char v198;
  char v199;
  char v200;
  char v201;
  char v202;
  char v203;
  char v204;
  char v205;
  char v206;
  char v207;
  char v208;
  char v209;
  char v210;
  char v211;
  char v212;
  char v213;
  _BYTE v214[7];
  _BYTE v215[7];
  _BYTE v216[7];
  _BYTE v217[7];
  _BYTE v218[7];
  _BYTE v219[7];
  _BYTE v220[7];
  _BYTE v221[7];
  _BYTE v222[7];
  _BYTE v223[7];
  _BYTE v224[7];
  _BYTE v225[7];
  _BYTE v226[7];
  _BYTE v227[7];
  _BYTE v228[7];
  _BYTE v229[7];
  _BYTE v230[7];
  _BYTE v231[7];
  _BYTE v232[7];
  _BYTE v233[7];
  _BYTE v234[7];
  _BYTE v235[7];
  _BYTE v236[7];
  _BYTE v237[7];
  _BYTE v238[7];
  _BYTE v239[7];
  _BYTE v240[7];
  _BYTE v241[7];
  _BYTE v242[7];
  _BYTE v243[7];
  _BYTE v244[7];
  _BYTE v245[7];
  _BYTE v246[7];
  _BYTE v247[7];
  _BYTE v248[7];
  _BYTE v249[7];
  _BYTE v250[7];
  _BYTE v251[7];
  _BYTE v252[7];
  _BYTE v253[7];
  _BYTE v254[7];
  _BYTE v255[7];
  _BYTE v256[7];
  _BYTE v257[7];
  _BYTE v258[7];
  _BYTE v259[7];
  _BYTE v260[7];
  _BYTE v261[7];
  _BYTE v262[7];
  _BYTE v263[7];
  _BYTE v264[7];
  _BYTE v265[7];
  _BYTE v266[7];
  _BYTE v267[7];
  _BYTE v268[7];
  _BYTE v269[7];
  _BYTE v270[7];
  _BYTE v271[7];
  _BYTE v272[7];
  _BYTE v273[7];
  _BYTE v274[7];
  _BYTE v275[7];
  _BYTE v276[7];
  _BYTE v277[7];
  _BYTE v278[7];
  _BYTE v279[7];
  _BYTE v280[7];
  _BYTE v281[7];
  _BYTE v282[7];
  _BYTE v283[7];
  _BYTE v284[7];
  _BYTE v285[7];
  _BYTE v286[7];
  _BYTE v287[7];
  _BYTE v288[7];
  _BYTE v289[7];
  _BYTE v290[7];
  _BYTE v291[7];
  _BYTE v292[7];
  _BYTE v293[7];
  _BYTE v294[7];
  _BYTE v295[7];
  _BYTE v296[7];
  _BYTE v297[7];
  _BYTE v298[7];
  _BYTE v299[7];
  _BYTE v300[7];
  _BYTE v301[7];
  _BYTE v302[7];
  _BYTE v303[7];
  _BYTE v304[7];
  _BYTE v305[7];
  _BYTE v306[7];
  _BYTE v307[7];
  _BYTE v308[7];
  _BYTE v309[7];
  _BYTE v310[7];
  _BYTE v311[7];
  _BYTE v312[7];
  _BYTE v313[7];
  _BYTE v314[7];
  _BYTE v315[7];
  _BYTE v316[7];
  _BYTE v317[7];
  _BYTE v318[7];
  _BYTE v319[7];
  _BYTE v320[7];
  _BYTE v321[7];
  _BYTE v322[7];
  _BYTE v323[7];
  _BYTE v324[7];
  _BYTE v325[7];
  _BYTE v326[7];
  _BYTE v327[7];
  _BYTE v328[7];
  _BYTE v329[7];
  _BYTE v330[7];
  _BYTE v331[7];
  _BYTE v332[7];
  _BYTE v333[7];
  _BYTE v334[7];
  _BYTE v335[7];
  _BYTE v336[7];
  _BYTE v337[7];
  _BYTE v338[7];
  _BYTE v339[7];
  _BYTE v340[7];
  _BYTE v341[7];
  _BYTE v342[7];
  _BYTE v343[7];
  _BYTE v344[7];
  _BYTE v345[7];
  _BYTE v346[7];
  _BYTE v347[7];
  _BYTE v348[7];
  _BYTE v349[7];
  _BYTE v350[7];
  _BYTE v351[7];
  _BYTE v352[7];
  _BYTE v353[7];
  _BYTE v354[7];
  _BYTE v355[7];
  _BYTE v356[7];
  _BYTE v357[7];
  _BYTE v358[7];
  _BYTE v359[7];
  _BYTE v360[7];
  _BYTE v361[7];
  _BYTE v362[7];
  _BYTE v363[7];
  _BYTE v364[7];
  _BYTE v365[7];
  _BYTE v366[7];
  _BYTE v367[7];
  _BYTE v368[7];
  _BYTE v369[7];
  _BYTE v370[7];
  _BYTE v371[7];
  _BYTE v372[7];
  _BYTE v373[7];
  _BYTE v374[7];
  _BYTE v375[7];
  _BYTE v376[7];
  _BYTE v377[7];
  _BYTE v378[7];
  _BYTE v379[7];
  _BYTE v380[7];
  _BYTE v381[7];
  _BYTE v382[7];
  _BYTE v383[7];
  _BYTE v384[7];
  _BYTE v385[7];
  _BYTE v386[7];
  _BYTE v387[7];
  _BYTE v388[7];
  _BYTE v389[7];
  _BYTE v390[7];
  _BYTE v391[7];
  _BYTE v392[7];
  _BYTE v393[7];
  _BYTE v394[7];
  _BYTE v395[7];
  _BYTE v396[7];
  _BYTE v397[7];
  _BYTE v398[7];
  _BYTE v399[7];
  _BYTE v400[7];
  _BYTE v401[7];
  _BYTE v402[7];
  _BYTE v403[7];
  _BYTE v404[7];
  _BYTE v405[7];
  _BYTE v406[7];
  _BYTE v407[7];
  _BYTE v408[7];
  _BYTE v409[7];
  _BYTE v410[7];
  _BYTE v411[7];
  _BYTE v412[7];
  _BYTE v413[7];
  _BYTE v414[7];
  _BYTE v415[7];
  _BYTE v416[7];
  _BYTE v417[7];
  _BYTE v418[7];
  objc_super v419;

  v419.receiver = self;
  v419.super_class = (Class)_MTLDeviceFeatureQueries;
  v4 = -[_MTLDeviceFeatureQueries init](&v419, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDeviceSPI *)a3;
    v6 = objc_msgSend(a3, "featureProfile");
    v7 = 1;
    if (v6 > 9999)
    {
      if (v6 > 19999)
      {
        if (v6 != 20000 && v6 != 30000 && v6 != 30002)
          goto LABEL_13;
      }
      else
      {
        if ((unint64_t)(v6 - 10000) >= 3)
        {
LABEL_13:
          v105 = objc_msgSend(a3, "supportsBufferlessClientStorageTexture");
          v104 = objc_msgSend(a3, "supportsComputeMemoryBarrier");
          v103 = objc_msgSend(a3, "supportsRenderMemoryBarrier");
          v102 = objc_msgSend(a3, "supportsPartialRenderMemoryBarrier");
          v101 = objc_msgSend(a3, "supportsArgumentBuffersTier2");
          v100 = objc_msgSend(a3, "supportsReadWriteTextureArgumentsTier2");
          v99 = objc_msgSend(a3, "supportsStreamingCodecSignaling");
          v98 = objc_msgSend(a3, "supportsProgrammableSamplePositions");
          v97 = objc_msgSend(a3, "supportsLargeFramebufferConfigs");
          v96 = objc_msgSend(a3, "supportsCustomBorderColor");
          v95 = objc_msgSend(a3, "supportsSamplerAddressModeClampToHalfBorder");
          v94 = objc_msgSend(a3, "supportsBCTextureCompression");
          v93 = objc_msgSend(a3, "supports3DBCTextures");
          v92 = objc_msgSend(a3, "supportsRGBA10A2Gamma");
          v91 = objc_msgSend(a3, "supportsBGR10A2");
          v90 = objc_msgSend(a3, "supportsPrimitiveRestartOverride");
          v89 = objc_msgSend(a3, "supportsGlobalVariableRelocation");
          v88 = objc_msgSend(a3, "supportsGlobalVariableRelocationRender");
          v87 = objc_msgSend(a3, "supportsGlobalVariableRelocationCompute");
          v86 = objc_msgSend(a3, "supportsTLS");
          v85 = objc_msgSend(a3, "supportsGlobalVariableBindings");
          v84 = objc_msgSend(a3, "supportsGlobalVariableBindingInDylibs");
          v83 = objc_msgSend(a3, "supports32bpcMSAATextures");
          v82 = objc_msgSend(a3, "supports32BitMSAA");
          v81 = objc_msgSend(a3, "supports32BitFloatFiltering");
          v80 = objc_msgSend(a3, "supportsQueryTextureLOD");
          v79 = objc_msgSend(a3, "supportsVertexAmplification");
          v78 = objc_msgSend(a3, "supportsPlacementHeaps");
          v77 = objc_msgSend(a3, "supportsOpenCLTextureWriteSwizzles");
          v76 = objc_msgSend(a3, "supportsPullModelInterpolation");
          v75 = objc_msgSend(a3, "supportsInt64");
          v73 = objc_msgSend(a3, "supportsFixedLinePointFillDepthGradient");
          v72 = objc_msgSend(a3, "supportsLateEvalEvent");
          v71 = objc_msgSend(a3, "supportsNonZeroTextureWriteLOD");
          v69 = objc_msgSend(a3, "supportsSharedTextureHandles");
          v68 = objc_msgSend(a3, "supportsBufferPrefetchStatistics");
          v66 = objc_msgSend(a3, "supportsLimitedYUVFormats");
          v65 = objc_msgSend(a3, "supportsNonPrivateDepthStencilTextures");
          v64 = objc_msgSend(a3, "supportsNonPrivateMSAATextures");
          v62 = objc_msgSend(a3, "supportsSharedStorageHeapResources");
          v61 = objc_msgSend(a3, "supportsSharedStorageTextures");
          v60 = objc_msgSend(a3, "supportsLinearTextureFromSharedBuffer");
          v59 = objc_msgSend(a3, "supportsPipelineLibraries");
          v58 = objc_msgSend(a3, "supportsFragmentOnlyEncoders");
          v57 = objc_msgSend(a3, "supportsBufferWithIOSurface");
          v56 = objc_msgSend(a3, "supportsProgrammableBlending");
          v55 = objc_msgSend(a3, "supportsRenderToLinearTextures");
          v54 = objc_msgSend(a3, "supportsMemorylessRenderTargets");
          v53 = objc_msgSend(a3, "supportsFastMathInfNaNPropagation");
          v52 = objc_msgSend(a3, "supportsInvariantVertexPosition");
          v51 = objc_msgSend(a3, "supportsShaderLODAverage");
          v50 = objc_msgSend(a3, "supportsRelaxedTextureViewRequirements");
          v49 = objc_msgSend(a3, "supportsSeparateDepthStencil");
          v48 = objc_msgSend(a3, "supportsGPUStatistics");
          v47 = objc_msgSend(a3, "supportsCompressedTextureViewSPI");
          v45 = objc_msgSend(a3, "supportsRenderTargetTextureRotation");
          v44 = objc_msgSend(a3, "supportsDynamicControlPointCount");
          v43 = objc_msgSend(a3, "supportsIABHashForTools");
          v42 = objc_msgSend(a3, "supportsBinaryArchives");
          v41 = objc_msgSend(a3, "supportsBinaryLibraries");
          v40 = objc_msgSend(a3, "supportsDeadlineProfile");
          v46 = objc_msgSend(a3, "supportsFillTexture");
          v213 = objc_msgSend(a3, "supportsSetThreadgroupPackingDisabled");
          v212 = objc_msgSend(a3, "supportsASTCTextureCompression");
          v211 = objc_msgSend(a3, "supportsExtendedYUVFormats");
          v210 = objc_msgSend(a3, "supportsPublicXR10Formats");
          v209 = objc_msgSend(a3, "supportsSRGBwrites");
          v208 = objc_msgSend(a3, "supportsDepthClipMode");
          v206 = objc_msgSend(a3, "supportsResourceHeaps");
          v207 = objc_msgSend(a3, "supportsArgumentBuffers");
          v205 = objc_msgSend(a3, "supportsPacked32TextureBufferWrites");
          v204 = objc_msgSend(a3, "supports3DASTCTextures");
          v203 = objc_msgSend(a3, "supportsExtendedXR10Formats");
          v202 = objc_msgSend(a3, "supportsFragmentBufferWrites");
          v201 = objc_msgSend(a3, "supportsCountingOcclusionQuery");
          v200 = objc_msgSend(a3, "supportsBaseVertexInstanceDrawing");
          v199 = objc_msgSend(a3, "supportsIndirectDrawAndDispatch");
          v198 = objc_msgSend(a3, "supportsTessellation");
          v197 = objc_msgSend(a3, "supportsReadWriteBufferArguments");
          v196 = objc_msgSend(a3, "supportsArrayOfTextures");
          v195 = objc_msgSend(a3, "supportsArrayOfSamplers");
          v194 = objc_msgSend(a3, "supportsCombinedMSAAStoreAndResolveAction");
          v193 = objc_msgSend(a3, "supportsMutableTier1ArgumentBuffers");
          v192 = objc_msgSend(a3, "supportsSamplerCompareFunction");
          v191 = objc_msgSend(a3, "supportsMSAADepthResolve");
          v190 = objc_msgSend(a3, "supportsMSAAStencilResolve");
          v189 = objc_msgSend(a3, "supportsMSAADepthResolveFilter");
          v188 = objc_msgSend(a3, "supportsGFXIndirectCommandBuffers");
          v187 = objc_msgSend(a3, "supportsCMPIndirectCommandBuffers");
          v186 = objc_msgSend(a3, "supportsIndirectStageInRegion");
          v184 = objc_msgSend(a3, "supportsIndirectTextures");
          v183 = objc_msgSend(a3, "supportsNorm16BCubicFiltering");
          v182 = objc_msgSend(a3, "supportsTextureOutOfBoundsReads");
          v181 = objc_msgSend(a3, "supportsTextureSwizzle");
          v180 = objc_msgSend(a3, "supportsAlphaYUVFormats");
          v179 = objc_msgSend(a3, "supportsMemoryOrderAtomics");
          v178 = objc_msgSend(a3, "supportsQuadGroup");
          v177 = objc_msgSend(a3, "supportsRenderTextureWrites");
          v176 = objc_msgSend(a3, "supportsImageBlocks");
          v172 = objc_msgSend(a3, "supportsTileShaders");
          v164 = objc_msgSend(a3, "supportsImageBlockSampleCoverageControl");
          v161 = objc_msgSend(a3, "supportsNativeHardwareFP16");
          v168 = objc_msgSend(a3, "supportsPostDepthCoverage");
          v167 = objc_msgSend(a3, "supportsMipLevelsSmallerThanBlockSize");
          v166 = objc_msgSend(a3, "supportsNonUniformThreadgroupSize");
          v163 = objc_msgSend(a3, "supportsReadWriteTextureArguments");
          v174 = objc_msgSend(a3, "supportsReadWriteTextureCubeArguments");
          v171 = objc_msgSend(a3, "supportsTextureCubeArray");
          v165 = objc_msgSend(a3, "supportsQuadShufflesAndBroadcast");
          v185 = objc_msgSend(a3, "supportsConcurrentComputeDispatch");
          v170 = objc_msgSend(a3, "supportsRenderPassWithoutRenderTarget");
          v162 = objc_msgSend(a3, "supportsRasterOrderGroups");
          v175 = objc_msgSend(a3, "supportsRasterOrderGroupsColorAttachment");
          v173 = objc_msgSend(a3, "supportsDynamicAttributeStride");
          v169 = objc_msgSend(a3, "supportsLinearTexture2DArray");
          v160 = objc_msgSend(a3, "supportsNonSquareTileShaders");
          v159 = objc_msgSend(a3, "supportsSeparateVisibilityAndShadingRate");
          v158 = objc_msgSend(a3, "supports2DLinearTexArraySPI");
          v157 = objc_msgSend(a3, "supportsLayeredRendering");
          v156 = objc_msgSend(a3, "supportsViewportAndScissorArray");
          v155 = objc_msgSend(a3, "supportsIndirectTessellation");
          v154 = objc_msgSend(a3, "supportsMSAAStencilResolveFilter");
          v153 = objc_msgSend(a3, "supportsStencilFeedback");
          v152 = objc_msgSend(a3, "supportsFP32TessFactors");
          v151 = objc_msgSend(a3, "supportsUnalignedVertexFetch");
          v150 = objc_msgSend(a3, "supportsExtendedVertexFormats");
          v149 = objc_msgSend(a3, "supportsResourceDetachBacking");
          v148 = objc_msgSend(a3, "supportsBufferWithAddressRanges");
          v147 = objc_msgSend(a3, "supportsHeapWithAddressRanges");
          v146 = objc_msgSend(a3, "supportsSIMDGroup");
          v144 = objc_msgSend(a3, "supportsShaderMinLODClamp");
          v141 = objc_msgSend(a3, "supportsSIMDShufflesAndBroadcast");
          v138 = objc_msgSend(a3, "supportsWritableArrayOfTextures");
          v135 = objc_msgSend(a3, "supportsVariableRateRasterization");
          v131 = objc_msgSend(a3, "supportsYCBCRFormats");
          v128 = objc_msgSend(a3, "supportsYCBCRFormatsPQ");
          v125 = objc_msgSend(a3, "supportsYCBCRFormats12");
          v122 = objc_msgSend(a3, "supportsYCBCRFormatsXR");
          v118 = objc_msgSend(a3, "supportsASTCHDRTextureCompression");
          v115 = objc_msgSend(a3, "supportsSparseTextures");
          v112 = objc_msgSend(a3, "supportsSparseHeaps");
          v145 = objc_msgSend(a3, "supportsIndirectWritableTextures");
          v143 = objc_msgSend(a3, "supportsFunctionPointers");
          v142 = objc_msgSend(a3, "supportsDynamicLibraries");
          v140 = objc_msgSend(a3, "supportsStatefulDynamicLibraries");
          v139 = objc_msgSend(a3, "supportsRenderDynamicLibraries");
          v137 = objc_msgSend(a3, "supportsFunctionPointersFromRender");
          v136 = objc_msgSend(a3, "supportsSharedFunctionTables");
          v134 = objc_msgSend(a3, "supportsRaytracingFromRender");
          v133 = objc_msgSend(a3, "supportsPrimitiveMotionBlur");
          v132 = objc_msgSend(a3, "supportsRayTracingExtendedVertexFormats");
          v130 = objc_msgSend(a3, "supportsHeapAccelerationStructureAllocation");
          v129 = objc_msgSend(a3, "supportsRayTracingPerPrimitiveData");
          v127 = objc_msgSend(a3, "supportsRayTracingTraversalMetrics");
          v126 = objc_msgSend(a3, "supportsRayTracingBuffersFromTables");
          v124 = objc_msgSend(a3, "supportsRayTracingAccelerationStructureCPUDeserialization");
          v123 = objc_msgSend(a3, "supportsRayTracingMultiLevelInstancing");
          v121 = objc_msgSend(a3, "supportsRayTracingIndirectInstanceAccelerationStructureBuild");
          v120 = objc_msgSend(a3, "supportsRayTracingGPUTableUpdateBuffers");
          v119 = objc_msgSend(a3, "supportsRayTracingCurves");
          v117 = objc_msgSend(a3, "supportsShaderBarycentricCoordinates");
          v116 = objc_msgSend(a3, "supportsBlackOrWhiteSamplerBorderColors");
          v114 = objc_msgSend(a3, "supportsMirrorClampToEdgeSamplerMode");
          v113 = objc_msgSend(a3, "supportsSIMDReduction");
          v111 = objc_msgSend(a3, "supportsDepthClipModeClampExtended");
          v110 = objc_msgSend(a3, "supportsTexture2DMultisampleArray");
          v109 = objc_msgSend(a3, "supportsForceSeamsOnCubemaps");
          v108 = objc_msgSend(a3, "supportsFloat16BCubicFiltering");
          v106 = objc_msgSend(a3, "supportsFloat16InfNanFiltering");
          v107 = objc_msgSend(a3, "supportsRTZRounding");
          v8 = objc_msgSend(a3, "supportsAnisoSampleFix");
          v9 = objc_msgSend(a3, "supportsYCBCRPackedFormatsPQ");
          v12 = objc_msgSend(a3, "supportsYCBCRPackedFormats12");
          v13 = objc_msgSend(a3, "supportsYCBCRPackedFormatsXR");
          v14 = objc_msgSend(a3, "supportsBufferBoundsChecking");
          v15 = objc_msgSend(a3, "supportsForkJoin");
          v16 = objc_msgSend(a3, "supportsDevicePartitioning");
          v17 = objc_msgSend(a3, "supportsComputeCompressedTextureWrite");
          v18 = objc_msgSend(a3, "supportsSIMDGroupMatrix");
          v19 = objc_msgSend(a3, "supportsInterchangeTiled");
          v20 = objc_msgSend(a3, "supportsQuadReduction");
          v21 = objc_msgSend(a3, "supportsVirtualSubstreams");
          v22 = objc_msgSend(a3, "supportsSIMDShuffleAndFill");
          v23 = objc_msgSend(a3, "supportsBfloat16Format");
          v24 = objc_msgSend(a3, "supportsSparseDepthAttachments");
          v25 = objc_msgSend(a3, "supportsAtomicUlongVoidMinMax");
          v26 = objc_msgSend(a3, "supportsLossyCompression");
          v27 = objc_msgSend(a3, "supportsMeshShaders");
          v28 = objc_msgSend(a3, "supportsFunctionPointersFromMesh");
          v29 = objc_msgSend(a3, "supportsMeshShadersInICB");
          v30 = objc_msgSend(a3, "supportsMeshRenderDynamicLibraries");
          v31 = objc_msgSend(a3, "supportsBfloat16Buffers");
          v32 = objc_msgSend(a3, "supportsCommandBufferJump");
          v33 = objc_msgSend(a3, "supportsColorSpaceConversionMatrixSelection");
          v34 = objc_msgSend(a3, "supportsPerPlaneCompression");
          v35 = objc_msgSend(a3, "supportsConditionalLoadStore");
          v36 = objc_msgSend(a3, "supportsStackOverflowErrorCode");
          v37 = objc_msgSend(a3, "supportsRayTracingICBs");
          v38 = objc_msgSend(a3, "supportsPerformanceStateAssertion");
          v39 = objc_msgSend(a3, "supportsExplicitVisibilityGroups");
          v63 = objc_msgSend(a3, "supportsRayTracingMatrixLayout");
          v67 = objc_msgSend(a3, "supportsRayTracingDirectIntersectionResultAccess");
          v70 = objc_msgSend(a3, "supportsRayTracingPerComponentMotionInterpolation");
          v74 = objc_msgSend(a3, "supportsExtendedSamplerLODBiasRange");
          v10 = objc_msgSend(a3, "supportsDeviceCoherency");
          *((_DWORD *)&v5->_featureInfo[10].supported + 1) = *(_DWORD *)&v408[3];
          *(_DWORD *)(&v5->_featureInfo[10].supported + 1) = *(_DWORD *)v408;
          *((_DWORD *)&v5->_featureInfo[11].supported + 1) = *(_DWORD *)&v407[3];
          *(_DWORD *)(&v5->_featureInfo[11].supported + 1) = *(_DWORD *)v407;
          *((_DWORD *)&v5->_featureInfo[12].supported + 1) = *(_DWORD *)&v406[3];
          *(_DWORD *)(&v5->_featureInfo[12].supported + 1) = *(_DWORD *)v406;
          *((_DWORD *)&v5->_featureInfo[13].supported + 1) = *(_DWORD *)&v405[3];
          *(_DWORD *)(&v5->_featureInfo[13].supported + 1) = *(_DWORD *)v405;
          *((_DWORD *)&v5->_featureInfo[14].supported + 1) = *(_DWORD *)&v404[3];
          *(_DWORD *)(&v5->_featureInfo[14].supported + 1) = *(_DWORD *)v404;
          *((_DWORD *)&v5->_featureInfo[15].supported + 1) = *(_DWORD *)&v403[3];
          *(_DWORD *)(&v5->_featureInfo[15].supported + 1) = *(_DWORD *)v403;
          *((_DWORD *)&v5->_featureInfo[16].supported + 1) = *(_DWORD *)&v402[3];
          *(_DWORD *)(&v5->_featureInfo[16].supported + 1) = *(_DWORD *)v402;
          *((_DWORD *)&v5->_featureInfo[17].supported + 1) = *(_DWORD *)&v401[3];
          *(_DWORD *)(&v5->_featureInfo[17].supported + 1) = *(_DWORD *)v401;
          *((_DWORD *)&v5->_featureInfo[18].supported + 1) = *(_DWORD *)&v400[3];
          *(_DWORD *)(&v5->_featureInfo[18].supported + 1) = *(_DWORD *)v400;
          *((_DWORD *)&v5->_featureInfo[19].supported + 1) = *(_DWORD *)&v399[3];
          *(_DWORD *)(&v5->_featureInfo[19].supported + 1) = *(_DWORD *)v399;
          *((_DWORD *)&v5->_featureInfo[20].supported + 1) = *(_DWORD *)&v398[3];
          *(_DWORD *)(&v5->_featureInfo[20].supported + 1) = *(_DWORD *)v398;
          *((_DWORD *)&v5->_featureInfo[21].supported + 1) = *(_DWORD *)&v397[3];
          *(_DWORD *)(&v5->_featureInfo[21].supported + 1) = *(_DWORD *)v397;
          *((_DWORD *)&v5->_featureInfo[22].supported + 1) = *(_DWORD *)&v396[3];
          *(_DWORD *)(&v5->_featureInfo[22].supported + 1) = *(_DWORD *)v396;
          *((_DWORD *)&v5->_featureInfo[23].supported + 1) = *(_DWORD *)&v395[3];
          *(_DWORD *)(&v5->_featureInfo[23].supported + 1) = *(_DWORD *)v395;
          *((_DWORD *)&v5->_featureInfo[24].supported + 1) = *(_DWORD *)&v394[3];
          *(_DWORD *)(&v5->_featureInfo[24].supported + 1) = *(_DWORD *)v394;
          *((_DWORD *)&v5->_featureInfo[25].supported + 1) = *(_DWORD *)&v393[3];
          *(_DWORD *)(&v5->_featureInfo[25].supported + 1) = *(_DWORD *)v393;
          *((_DWORD *)&v5->_featureInfo[26].supported + 1) = *(_DWORD *)&v392[3];
          *(_DWORD *)(&v5->_featureInfo[26].supported + 1) = *(_DWORD *)v392;
          *((_DWORD *)&v5->_featureInfo[27].supported + 1) = *(_DWORD *)&v391[3];
          *(_DWORD *)(&v5->_featureInfo[27].supported + 1) = *(_DWORD *)v391;
          *((_DWORD *)&v5->_featureInfo[28].supported + 1) = *(_DWORD *)&v390[3];
          *(_DWORD *)(&v5->_featureInfo[28].supported + 1) = *(_DWORD *)v390;
          *((_DWORD *)&v5->_featureInfo[29].supported + 1) = *(_DWORD *)&v389[3];
          *(_DWORD *)(&v5->_featureInfo[29].supported + 1) = *(_DWORD *)v389;
          *((_DWORD *)&v5->_featureInfo[30].supported + 1) = *(_DWORD *)&v388[3];
          *(_DWORD *)(&v5->_featureInfo[30].supported + 1) = *(_DWORD *)v388;
          *((_DWORD *)&v5->_featureInfo[31].supported + 1) = *(_DWORD *)&v387[3];
          *(_DWORD *)(&v5->_featureInfo[31].supported + 1) = *(_DWORD *)v387;
          *((_DWORD *)&v5->_featureInfo[32].supported + 1) = *(_DWORD *)&v386[3];
          *(_DWORD *)(&v5->_featureInfo[32].supported + 1) = *(_DWORD *)v386;
          *((_DWORD *)&v5->_featureInfo[33].supported + 1) = *(_DWORD *)&v385[3];
          *(_DWORD *)(&v5->_featureInfo[33].supported + 1) = *(_DWORD *)v385;
          *((_DWORD *)&v5->_featureInfo[34].supported + 1) = *(_DWORD *)&v384[3];
          *(_DWORD *)(&v5->_featureInfo[34].supported + 1) = *(_DWORD *)v384;
          *((_DWORD *)&v5->_featureInfo[35].supported + 1) = *(_DWORD *)&v383[3];
          *(_DWORD *)(&v5->_featureInfo[35].supported + 1) = *(_DWORD *)v383;
          *((_DWORD *)&v5->_featureInfo[36].supported + 1) = *(_DWORD *)&v382[3];
          *(_DWORD *)(&v5->_featureInfo[36].supported + 1) = *(_DWORD *)v382;
          *((_DWORD *)&v5->_featureInfo[37].supported + 1) = *(_DWORD *)&v381[3];
          *(_DWORD *)(&v5->_featureInfo[37].supported + 1) = *(_DWORD *)v381;
          *((_DWORD *)&v5->_featureInfo[38].supported + 1) = *(_DWORD *)&v380[3];
          *(_DWORD *)(&v5->_featureInfo[38].supported + 1) = *(_DWORD *)v380;
          *((_DWORD *)&v5->_featureInfo[39].supported + 1) = *(_DWORD *)&v379[3];
          *(_DWORD *)(&v5->_featureInfo[39].supported + 1) = *(_DWORD *)v379;
          *((_DWORD *)&v5->_featureInfo[40].supported + 1) = *(_DWORD *)&v378[3];
          *(_DWORD *)(&v5->_featureInfo[40].supported + 1) = *(_DWORD *)v378;
          *((_DWORD *)&v5->_featureInfo[41].supported + 1) = *(_DWORD *)&v377[3];
          *(_DWORD *)(&v5->_featureInfo[41].supported + 1) = *(_DWORD *)v377;
          *((_DWORD *)&v5->_featureInfo[42].supported + 1) = *(_DWORD *)&v376[3];
          *(_DWORD *)(&v5->_featureInfo[42].supported + 1) = *(_DWORD *)v376;
          *((_DWORD *)&v5->_featureInfo[43].supported + 1) = *(_DWORD *)&v375[3];
          *(_DWORD *)(&v5->_featureInfo[43].supported + 1) = *(_DWORD *)v375;
          *((_DWORD *)&v5->_featureInfo[44].supported + 1) = *(_DWORD *)&v374[3];
          *(_DWORD *)(&v5->_featureInfo[44].supported + 1) = *(_DWORD *)v374;
          *((_DWORD *)&v5->_featureInfo[45].supported + 1) = *(_DWORD *)&v373[3];
          *(_DWORD *)(&v5->_featureInfo[45].supported + 1) = *(_DWORD *)v373;
          *((_DWORD *)&v5->_featureInfo[46].supported + 1) = *(_DWORD *)&v372[3];
          *(_DWORD *)(&v5->_featureInfo[46].supported + 1) = *(_DWORD *)v372;
          *((_DWORD *)&v5->_featureInfo[47].supported + 1) = *(_DWORD *)&v371[3];
          *(_DWORD *)(&v5->_featureInfo[47].supported + 1) = *(_DWORD *)v371;
          *((_DWORD *)&v5->_featureInfo[48].supported + 1) = *(_DWORD *)&v370[3];
          *(_DWORD *)(&v5->_featureInfo[48].supported + 1) = *(_DWORD *)v370;
          *((_DWORD *)&v5->_featureInfo[49].supported + 1) = *(_DWORD *)&v369[3];
          *(_DWORD *)(&v5->_featureInfo[49].supported + 1) = *(_DWORD *)v369;
          *((_DWORD *)&v5->_featureInfo[50].supported + 1) = *(_DWORD *)&v368[3];
          *(_DWORD *)(&v5->_featureInfo[50].supported + 1) = *(_DWORD *)v368;
          *((_DWORD *)&v5->_featureInfo[51].supported + 1) = *(_DWORD *)&v367[3];
          *(_DWORD *)(&v5->_featureInfo[51].supported + 1) = *(_DWORD *)v367;
          *((_DWORD *)&v5->_featureInfo[52].supported + 1) = *(_DWORD *)&v366[3];
          *(_DWORD *)(&v5->_featureInfo[52].supported + 1) = *(_DWORD *)v366;
          *((_DWORD *)&v5->_featureInfo[53].supported + 1) = *(_DWORD *)&v365[3];
          *(_DWORD *)(&v5->_featureInfo[53].supported + 1) = *(_DWORD *)v365;
          *((_DWORD *)&v5->_featureInfo[54].supported + 1) = *(_DWORD *)&v364[3];
          *(_DWORD *)(&v5->_featureInfo[54].supported + 1) = *(_DWORD *)v364;
          *((_DWORD *)&v5->_featureInfo[55].supported + 1) = *(_DWORD *)&v363[3];
          *(_DWORD *)(&v5->_featureInfo[55].supported + 1) = *(_DWORD *)v363;
          *((_DWORD *)&v5->_featureInfo[56].supported + 1) = *(_DWORD *)&v362[3];
          *(_DWORD *)(&v5->_featureInfo[56].supported + 1) = *(_DWORD *)v362;
          *((_DWORD *)&v5->_featureInfo[57].supported + 1) = *(_DWORD *)&v361[3];
          *(_DWORD *)(&v5->_featureInfo[57].supported + 1) = *(_DWORD *)v361;
          *((_DWORD *)&v5->_featureInfo[58].supported + 1) = *(_DWORD *)&v360[3];
          *(_DWORD *)(&v5->_featureInfo[58].supported + 1) = *(_DWORD *)v360;
          *((_DWORD *)&v5->_featureInfo[59].supported + 1) = *(_DWORD *)&v359[3];
          *(_DWORD *)(&v5->_featureInfo[59].supported + 1) = *(_DWORD *)v359;
          *((_DWORD *)&v5->_featureInfo[60].supported + 1) = *(_DWORD *)&v358[3];
          *(_DWORD *)(&v5->_featureInfo[60].supported + 1) = *(_DWORD *)v358;
          *((_DWORD *)&v5->_featureInfo[61].supported + 1) = *(_DWORD *)&v357[3];
          *(_DWORD *)(&v5->_featureInfo[61].supported + 1) = *(_DWORD *)v357;
          *((_DWORD *)&v5->_featureInfo[62].supported + 1) = *(_DWORD *)&v356[3];
          *(_DWORD *)(&v5->_featureInfo[62].supported + 1) = *(_DWORD *)v356;
          *((_DWORD *)&v5->_featureInfo[63].supported + 1) = *(_DWORD *)&v355[3];
          *(_DWORD *)(&v5->_featureInfo[63].supported + 1) = *(_DWORD *)v355;
          *((_DWORD *)&v5->_featureInfo[64].supported + 1) = *(_DWORD *)&v354[3];
          *(_DWORD *)(&v5->_featureInfo[64].supported + 1) = *(_DWORD *)v354;
          *((_DWORD *)&v5->_featureInfo[65].supported + 1) = *(_DWORD *)&v353[3];
          *(_DWORD *)(&v5->_featureInfo[65].supported + 1) = *(_DWORD *)v353;
          *((_DWORD *)&v5->_featureInfo[66].supported + 1) = *(_DWORD *)&v352[3];
          *(_DWORD *)(&v5->_featureInfo[66].supported + 1) = *(_DWORD *)v352;
          *((_DWORD *)&v5->_featureInfo[67].supported + 1) = *(_DWORD *)&v351[3];
          *(_DWORD *)(&v5->_featureInfo[67].supported + 1) = *(_DWORD *)v351;
          *((_DWORD *)&v5->_featureInfo[68].supported + 1) = *(_DWORD *)&v350[3];
          *(_DWORD *)(&v5->_featureInfo[68].supported + 1) = *(_DWORD *)v350;
          *((_DWORD *)&v5->_featureInfo[69].supported + 1) = *(_DWORD *)&v349[3];
          *(_DWORD *)(&v5->_featureInfo[69].supported + 1) = *(_DWORD *)v349;
          *((_DWORD *)&v5->_featureInfo[70].supported + 1) = *(_DWORD *)&v348[3];
          *(_DWORD *)(&v5->_featureInfo[70].supported + 1) = *(_DWORD *)v348;
          *((_DWORD *)&v5->_featureInfo[71].supported + 1) = *(_DWORD *)&v347[3];
          *(_DWORD *)(&v5->_featureInfo[71].supported + 1) = *(_DWORD *)v347;
          *((_DWORD *)&v5->_featureInfo[72].supported + 1) = *(_DWORD *)&v346[3];
          *(_DWORD *)(&v5->_featureInfo[72].supported + 1) = *(_DWORD *)v346;
          *((_DWORD *)&v5->_featureInfo[73].supported + 1) = *(_DWORD *)&v345[3];
          *(_DWORD *)(&v5->_featureInfo[73].supported + 1) = *(_DWORD *)v345;
          *((_DWORD *)&v5->_featureInfo[74].supported + 1) = *(_DWORD *)&v344[3];
          *(_DWORD *)(&v5->_featureInfo[74].supported + 1) = *(_DWORD *)v344;
          *((_DWORD *)&v5->_featureInfo[75].supported + 1) = *(_DWORD *)&v343[3];
          *(_DWORD *)(&v5->_featureInfo[75].supported + 1) = *(_DWORD *)v343;
          *((_DWORD *)&v5->_featureInfo[76].supported + 1) = *(_DWORD *)&v342[3];
          *(_DWORD *)(&v5->_featureInfo[76].supported + 1) = *(_DWORD *)v342;
          *((_DWORD *)&v5->_featureInfo[77].supported + 1) = *(_DWORD *)&v341[3];
          *(_DWORD *)(&v5->_featureInfo[77].supported + 1) = *(_DWORD *)v341;
          *((_DWORD *)&v5->_featureInfo[78].supported + 1) = *(_DWORD *)&v340[3];
          *(_DWORD *)(&v5->_featureInfo[78].supported + 1) = *(_DWORD *)v340;
          *((_DWORD *)&v5->_featureInfo[79].supported + 1) = *(_DWORD *)&v339[3];
          *(_DWORD *)(&v5->_featureInfo[79].supported + 1) = *(_DWORD *)v339;
          *((_DWORD *)&v5->_featureInfo[80].supported + 1) = *(_DWORD *)&v338[3];
          *(_DWORD *)(&v5->_featureInfo[80].supported + 1) = *(_DWORD *)v338;
          *((_DWORD *)&v5->_featureInfo[81].supported + 1) = *(_DWORD *)&v337[3];
          *(_DWORD *)(&v5->_featureInfo[81].supported + 1) = *(_DWORD *)v337;
          *((_DWORD *)&v5->_featureInfo[82].supported + 1) = *(_DWORD *)&v336[3];
          *(_DWORD *)(&v5->_featureInfo[82].supported + 1) = *(_DWORD *)v336;
          *((_DWORD *)&v5->_featureInfo[83].supported + 1) = *(_DWORD *)&v335[3];
          *(_DWORD *)(&v5->_featureInfo[83].supported + 1) = *(_DWORD *)v335;
          *((_DWORD *)&v5->_featureInfo[84].supported + 1) = *(_DWORD *)&v334[3];
          *(_DWORD *)(&v5->_featureInfo[84].supported + 1) = *(_DWORD *)v334;
          *((_DWORD *)&v5->_featureInfo[85].supported + 1) = *(_DWORD *)&v333[3];
          *(_DWORD *)(&v5->_featureInfo[85].supported + 1) = *(_DWORD *)v333;
          *((_DWORD *)&v5->_featureInfo[86].supported + 1) = *(_DWORD *)&v332[3];
          *(_DWORD *)(&v5->_featureInfo[86].supported + 1) = *(_DWORD *)v332;
          *((_DWORD *)&v5->_featureInfo[87].supported + 1) = *(_DWORD *)&v331[3];
          *(_DWORD *)(&v5->_featureInfo[87].supported + 1) = *(_DWORD *)v331;
          *((_DWORD *)&v5->_featureInfo[88].supported + 1) = *(_DWORD *)&v330[3];
          *(_DWORD *)(&v5->_featureInfo[88].supported + 1) = *(_DWORD *)v330;
          *((_DWORD *)&v5->_featureInfo[89].supported + 1) = *(_DWORD *)&v329[3];
          *(_DWORD *)(&v5->_featureInfo[89].supported + 1) = *(_DWORD *)v329;
          *((_DWORD *)&v5->_featureInfo[90].supported + 1) = *(_DWORD *)&v328[3];
          *(_DWORD *)(&v5->_featureInfo[90].supported + 1) = *(_DWORD *)v328;
          *((_DWORD *)&v5->_featureInfo[91].supported + 1) = *(_DWORD *)&v327[3];
          *(_DWORD *)(&v5->_featureInfo[91].supported + 1) = *(_DWORD *)v327;
          *((_DWORD *)&v5->_featureInfo[92].supported + 1) = *(_DWORD *)&v326[3];
          *(_DWORD *)(&v5->_featureInfo[92].supported + 1) = *(_DWORD *)v326;
          *((_DWORD *)&v5->_featureInfo[93].supported + 1) = *(_DWORD *)&v325[3];
          *(_DWORD *)(&v5->_featureInfo[93].supported + 1) = *(_DWORD *)v325;
          *((_DWORD *)&v5->_featureInfo[94].supported + 1) = *(_DWORD *)&v324[3];
          *(_DWORD *)(&v5->_featureInfo[94].supported + 1) = *(_DWORD *)v324;
          *((_DWORD *)&v5->_featureInfo[95].supported + 1) = *(_DWORD *)&v323[3];
          *(_DWORD *)(&v5->_featureInfo[95].supported + 1) = *(_DWORD *)v323;
          *((_DWORD *)&v5->_featureInfo[96].supported + 1) = *(_DWORD *)&v322[3];
          *(_DWORD *)(&v5->_featureInfo[96].supported + 1) = *(_DWORD *)v322;
          *((_DWORD *)&v5->_featureInfo[97].supported + 1) = *(_DWORD *)&v321[3];
          *(_DWORD *)(&v5->_featureInfo[97].supported + 1) = *(_DWORD *)v321;
          *((_DWORD *)&v5->_featureInfo[98].supported + 1) = *(_DWORD *)&v320[3];
          *(_DWORD *)(&v5->_featureInfo[98].supported + 1) = *(_DWORD *)v320;
          *((_DWORD *)&v5->_featureInfo[99].supported + 1) = *(_DWORD *)&v319[3];
          *(_DWORD *)(&v5->_featureInfo[99].supported + 1) = *(_DWORD *)v319;
          *((_DWORD *)&v5->_featureInfo[100].supported + 1) = *(_DWORD *)&v318[3];
          *(_DWORD *)(&v5->_featureInfo[100].supported + 1) = *(_DWORD *)v318;
          *((_DWORD *)&v5->_featureInfo[101].supported + 1) = *(_DWORD *)&v317[3];
          *(_DWORD *)(&v5->_featureInfo[101].supported + 1) = *(_DWORD *)v317;
          *((_DWORD *)&v5->_featureInfo[102].supported + 1) = *(_DWORD *)&v316[3];
          *(_DWORD *)(&v5->_featureInfo[102].supported + 1) = *(_DWORD *)v316;
          *((_DWORD *)&v5->_featureInfo[103].supported + 1) = *(_DWORD *)&v315[3];
          *(_DWORD *)(&v5->_featureInfo[103].supported + 1) = *(_DWORD *)v315;
          *((_DWORD *)&v5->_featureInfo[104].supported + 1) = *(_DWORD *)&v314[3];
          *(_DWORD *)(&v5->_featureInfo[104].supported + 1) = *(_DWORD *)v314;
          *((_DWORD *)&v5->_featureInfo[105].supported + 1) = *(_DWORD *)&v313[3];
          *(_DWORD *)(&v5->_featureInfo[105].supported + 1) = *(_DWORD *)v313;
          *((_DWORD *)&v5->_featureInfo[106].supported + 1) = *(_DWORD *)&v312[3];
          *(_DWORD *)(&v5->_featureInfo[106].supported + 1) = *(_DWORD *)v312;
          *((_DWORD *)&v5->_featureInfo[107].supported + 1) = *(_DWORD *)&v311[3];
          *(_DWORD *)(&v5->_featureInfo[107].supported + 1) = *(_DWORD *)v311;
          *((_DWORD *)&v5->_featureInfo[108].supported + 1) = *(_DWORD *)&v310[3];
          *(_DWORD *)(&v5->_featureInfo[108].supported + 1) = *(_DWORD *)v310;
          *((_DWORD *)&v5->_featureInfo[109].supported + 1) = *(_DWORD *)&v309[3];
          *(_DWORD *)(&v5->_featureInfo[109].supported + 1) = *(_DWORD *)v309;
          *((_DWORD *)&v5->_featureInfo[110].supported + 1) = *(_DWORD *)&v308[3];
          *(_DWORD *)(&v5->_featureInfo[110].supported + 1) = *(_DWORD *)v308;
          *((_DWORD *)&v5->_featureInfo[111].supported + 1) = *(_DWORD *)&v307[3];
          *(_DWORD *)(&v5->_featureInfo[111].supported + 1) = *(_DWORD *)v307;
          *((_DWORD *)&v5->_featureInfo[112].supported + 1) = *(_DWORD *)&v306[3];
          *(_DWORD *)(&v5->_featureInfo[112].supported + 1) = *(_DWORD *)v306;
          *((_DWORD *)&v5->_featureInfo[113].supported + 1) = *(_DWORD *)&v305[3];
          *(_DWORD *)(&v5->_featureInfo[113].supported + 1) = *(_DWORD *)v305;
          *((_DWORD *)&v5->_featureInfo[114].supported + 1) = *(_DWORD *)&v304[3];
          *(_DWORD *)(&v5->_featureInfo[114].supported + 1) = *(_DWORD *)v304;
          *((_DWORD *)&v5->_featureInfo[115].supported + 1) = *(_DWORD *)&v303[3];
          *(_DWORD *)(&v5->_featureInfo[115].supported + 1) = *(_DWORD *)v303;
          *((_DWORD *)&v5->_featureInfo[116].supported + 1) = *(_DWORD *)&v302[3];
          *(_DWORD *)(&v5->_featureInfo[116].supported + 1) = *(_DWORD *)v302;
          *((_DWORD *)&v5->_featureInfo[117].supported + 1) = *(_DWORD *)&v301[3];
          *(_DWORD *)(&v5->_featureInfo[117].supported + 1) = *(_DWORD *)v301;
          *((_DWORD *)&v5->_featureInfo[118].supported + 1) = *(_DWORD *)&v300[3];
          *(_DWORD *)(&v5->_featureInfo[118].supported + 1) = *(_DWORD *)v300;
          *((_DWORD *)&v5->_featureInfo[119].supported + 1) = *(_DWORD *)&v299[3];
          *(_DWORD *)(&v5->_featureInfo[119].supported + 1) = *(_DWORD *)v299;
          *((_DWORD *)&v5->_featureInfo[120].supported + 1) = *(_DWORD *)&v298[3];
          *(_DWORD *)(&v5->_featureInfo[120].supported + 1) = *(_DWORD *)v298;
          *((_DWORD *)&v5->_featureInfo[121].supported + 1) = *(_DWORD *)&v297[3];
          *(_DWORD *)(&v5->_featureInfo[121].supported + 1) = *(_DWORD *)v297;
          *((_DWORD *)&v5->_featureInfo[122].supported + 1) = *(_DWORD *)&v296[3];
          *(_DWORD *)(&v5->_featureInfo[122].supported + 1) = *(_DWORD *)v296;
          *((_DWORD *)&v5->_featureInfo[123].supported + 1) = *(_DWORD *)&v295[3];
          *(_DWORD *)(&v5->_featureInfo[123].supported + 1) = *(_DWORD *)v295;
          *((_DWORD *)&v5->_featureInfo[124].supported + 1) = *(_DWORD *)&v294[3];
          *(_DWORD *)(&v5->_featureInfo[124].supported + 1) = *(_DWORD *)v294;
          *((_DWORD *)&v5->_featureInfo[125].supported + 1) = *(_DWORD *)&v293[3];
          *(_DWORD *)(&v5->_featureInfo[125].supported + 1) = *(_DWORD *)v293;
          *((_DWORD *)&v5->_featureInfo[126].supported + 1) = *(_DWORD *)&v292[3];
          *(_DWORD *)(&v5->_featureInfo[126].supported + 1) = *(_DWORD *)v292;
          *((_DWORD *)&v5->_featureInfo[127].supported + 1) = *(_DWORD *)&v291[3];
          *(_DWORD *)(&v5->_featureInfo[127].supported + 1) = *(_DWORD *)v291;
          *((_DWORD *)&v5->_featureInfo[128].supported + 1) = *(_DWORD *)&v290[3];
          *(_DWORD *)(&v5->_featureInfo[128].supported + 1) = *(_DWORD *)v290;
          *((_DWORD *)&v5->_featureInfo[129].supported + 1) = *(_DWORD *)&v289[3];
          *(_DWORD *)(&v5->_featureInfo[129].supported + 1) = *(_DWORD *)v289;
          *((_DWORD *)&v5->_featureInfo[130].supported + 1) = *(_DWORD *)&v288[3];
          *(_DWORD *)(&v5->_featureInfo[130].supported + 1) = *(_DWORD *)v288;
          *((_DWORD *)&v5->_featureInfo[131].supported + 1) = *(_DWORD *)&v287[3];
          *(_DWORD *)(&v5->_featureInfo[131].supported + 1) = *(_DWORD *)v287;
          *((_DWORD *)&v5->_featureInfo[132].supported + 1) = *(_DWORD *)&v286[3];
          *(_DWORD *)(&v5->_featureInfo[132].supported + 1) = *(_DWORD *)v286;
          v5->_featureInfo[0].supported = v105;
          *(_DWORD *)(&v5->_featureInfo[0].supported + 1) = *(_DWORD *)v418;
          *((_DWORD *)&v5->_featureInfo[0].supported + 1) = *(_DWORD *)&v418[3];
          v5->_featureInfo[1].supported = v104;
          *(_DWORD *)(&v5->_featureInfo[1].supported + 1) = *(_DWORD *)v417;
          *((_DWORD *)&v5->_featureInfo[1].supported + 1) = *(_DWORD *)&v417[3];
          v5->_featureInfo[2].name = (NSString *)CFSTR("Memory barrier in render");
          v5->_featureInfo[2].supported = v103;
          *((_DWORD *)&v5->_featureInfo[2].supported + 1) = *(_DWORD *)&v416[3];
          *(_DWORD *)(&v5->_featureInfo[2].supported + 1) = *(_DWORD *)v416;
          v5->_featureInfo[3].name = (NSString *)CFSTR("Vertex->Vertex,Vertex->Fragment memory barriers in render");
          v5->_featureInfo[3].supported = v102;
          *((_DWORD *)&v5->_featureInfo[3].supported + 1) = *(_DWORD *)&v415[3];
          *(_DWORD *)(&v5->_featureInfo[3].supported + 1) = *(_DWORD *)v415;
          v5->_featureInfo[4].name = (NSString *)CFSTR("Argument Buffers Tier 2");
          v5->_featureInfo[4].supported = v101;
          *(_DWORD *)(&v5->_featureInfo[4].supported + 1) = *(_DWORD *)v414;
          *((_DWORD *)&v5->_featureInfo[4].supported + 1) = *(_DWORD *)&v414[3];
          v5->_featureInfo[5].supported = v100;
          *((_DWORD *)&v5->_featureInfo[5].supported + 1) = *(_DWORD *)&v413[3];
          *(_DWORD *)(&v5->_featureInfo[5].supported + 1) = *(_DWORD *)v413;
          v5->_featureInfo[6].name = (NSString *)CFSTR("Command buffer streaming codec signalling SPI");
          v5->_featureInfo[6].supported = v99;
          *((_DWORD *)&v5->_featureInfo[6].supported + 1) = *(_DWORD *)&v412[3];
          *(_DWORD *)(&v5->_featureInfo[6].supported + 1) = *(_DWORD *)v412;
          v5->_featureInfo[7].name = (NSString *)CFSTR("Programmable Sample Positions");
          v5->_featureInfo[7].supported = v98;
          *((_DWORD *)&v5->_featureInfo[7].supported + 1) = *(_DWORD *)&v411[3];
          *(_DWORD *)(&v5->_featureInfo[7].supported + 1) = *(_DWORD *)v411;
          v5->_featureInfo[8].name = (NSString *)CFSTR("Framebuffer sizes larger than 64 bytes");
          v5->_featureInfo[8].supported = v97;
          *((_DWORD *)&v5->_featureInfo[8].supported + 1) = *(_DWORD *)&v410[3];
          *(_DWORD *)(&v5->_featureInfo[8].supported + 1) = *(_DWORD *)v410;
          v5->_featureInfo[9].name = (NSString *)CFSTR("MTLClampToBorder with custom color");
          v5->_featureInfo[9].supported = v96;
          *((_DWORD *)&v5->_featureInfo[9].supported + 1) = *(_DWORD *)&v409[3];
          *(_DWORD *)(&v5->_featureInfo[9].supported + 1) = *(_DWORD *)v409;
          v5->_featureInfo[10].name = (NSString *)CFSTR("Clamp to half border");
          v5->_featureInfo[10].supported = v95;
          v5->_featureInfo[11].name = (NSString *)CFSTR("BC-format texture compression");
          v5->_featureInfo[11].supported = v94;
          v5->_featureInfo[12].name = (NSString *)CFSTR("BC-format textures with MTLTextureType3D");
          v5->_featureInfo[12].supported = v93;
          v5->_featureInfo[13].name = (NSString *)CFSTR("RGB10A2 format with gamma");
          v5->_featureInfo[13].supported = v92;
          v5->_featureInfo[14].name = (NSString *)CFSTR("BGR10A2 format with gamma");
          v5->_featureInfo[14].supported = v91;
          v5->_featureInfo[15].supported = v90;
          v5->_featureInfo[16].name = (NSString *)CFSTR("Global Variable Relocation");
          v5->_featureInfo[16].supported = v89;
          v5->_featureInfo[17].name = (NSString *)CFSTR("Global Variable Relocation for Render");
          v5->_featureInfo[17].supported = v88;
          v5->_featureInfo[18].name = (NSString *)CFSTR("Global Variable Relocation for Compute");
          v5->_featureInfo[18].supported = v87;
          v5->_featureInfo[19].name = (NSString *)CFSTR("TLS variables in metal programs");
          v5->_featureInfo[19].supported = v86;
          v5->_featureInfo[20].name = (NSString *)CFSTR("Resource bindings using global variables");
          v5->_featureInfo[20].supported = v85;
          v5->_featureInfo[21].name = (NSString *)CFSTR("Resource bindings using global variables in dylibs");
          v5->_featureInfo[21].supported = v84;
          v5->_featureInfo[22].supported = v83;
          v5->_featureInfo[22].name = (NSString *)CFSTR("32 bits per channel MSAA textures");
          v5->_featureInfo[23].name = (NSString *)CFSTR("32 bits per channel MSAA textures");
          v5->_featureInfo[23].supported = v82;
          v5->_featureInfo[24].name = (NSString *)CFSTR("32 bits per channel Float texture filtering");
          v5->_featureInfo[24].supported = v81;
          v5->_featureInfo[25].name = (NSString *)CFSTR("Query Texture LOD");
          v5->_featureInfo[25].supported = v80;
          v5->_featureInfo[26].name = (NSString *)CFSTR("Vertex Amplification");
          v5->_featureInfo[26].supported = v79;
          v5->_featureInfo[27].name = (NSString *)CFSTR("Placement heaps");
          v5->_featureInfo[27].supported = v78;
          v5->_featureInfo[28].name = (NSString *)CFSTR("OpenCL Texture Write Swizzles");
          v5->_featureInfo[28].supported = v77;
          v5->_featureInfo[29].name = (NSString *)CFSTR("Pull model interpolation");
          v5->_featureInfo[29].supported = v76;
          v5->_featureInfo[30].name = (NSString *)CFSTR("Int64 Types");
          v5->_featureInfo[30].supported = v75;
          v5->_featureInfo[31].name = (NSString *)CFSTR("Fixed line/point fill depth gradient");
          v5->_featureInfo[31].supported = v73;
          v5->_featureInfo[32].name = (NSString *)CFSTR("Late Eval Events");
          v5->_featureInfo[32].supported = v72;
          v5->_featureInfo[33].name = (NSString *)CFSTR("texture.write() with a non-zero LOD");
          v5->_featureInfo[33].supported = v71;
          v5->_featureInfo[34].name = (NSString *)CFSTR("Shared Texture Handles");
          v5->_featureInfo[34].supported = v69;
          v5->_featureInfo[35].name = (NSString *)CFSTR("Gathering buffer prefetch statistics");
          v5->_featureInfo[35].supported = v68;
          v5->_featureInfo[36].name = (NSString *)CFSTR("YUV pixel formats");
          v5->_featureInfo[36].supported = v66;
          v5->_featureInfo[37].name = (NSString *)CFSTR("Non-Private Depth/Stencil textures");
          v5->_featureInfo[37].supported = v65;
          v5->_featureInfo[38].name = (NSString *)CFSTR("Non-Private MSAA textures");
          v5->_featureInfo[38].supported = v64;
          v5->_featureInfo[39].name = (NSString *)CFSTR("MTLStorageModeShared Heap resources");
          v5->_featureInfo[39].supported = v62;
          v5->_featureInfo[40].name = (NSString *)CFSTR("MTLStorageModeShared textures");
          v5->_featureInfo[40].supported = v61;
          v5->_featureInfo[41].name = (NSString *)CFSTR("Linear textures from shared buffers");
          v5->_featureInfo[41].supported = v60;
          v5->_featureInfo[42].name = (NSString *)CFSTR("Pipeline Libraries");
          v5->_featureInfo[42].supported = v59;
          v5->_featureInfo[43].name = (NSString *)CFSTR("Fragment Only Render Encoders");
          v5->_featureInfo[43].supported = v58;
          v5->_featureInfo[44].name = (NSString *)CFSTR("Create a buffer from an IOSurface");
          v5->_featureInfo[44].supported = v57;
          v5->_featureInfo[45].name = (NSString *)CFSTR("Programmable Blending");
          v5->_featureInfo[45].supported = v56;
          v5->_featureInfo[46].name = (NSString *)CFSTR("Render To Linear Textures");
          v5->_featureInfo[46].supported = v55;
          v5->_featureInfo[47].name = (NSString *)CFSTR("Memoryless Render Targets");
          v5->_featureInfo[47].supported = v54;
          v5->_featureInfo[48].name = (NSString *)CFSTR("Fast Math Inf/NaN Propagation");
          v5->_featureInfo[48].supported = v53;
          v5->_featureInfo[49].name = (NSString *)CFSTR("Invariant Vertex Position");
          v5->_featureInfo[49].supported = v52;
          v5->_featureInfo[50].name = (NSString *)CFSTR("LOD Average in shaders");
          v5->_featureInfo[50].supported = v51;
          v5->_featureInfo[51].name = (NSString *)CFSTR("sRGB views without MTLTextureUsagePixelFormatView");
          v5->_featureInfo[51].supported = v50;
          v5->_featureInfo[52].name = (NSString *)CFSTR("separate depth/stencil");
          v5->_featureInfo[52].supported = v49;
          v5->_featureInfo[53].name = (NSString *)CFSTR("gpu statistics");
          v5->_featureInfo[53].supported = v48;
          v5->_featureInfo[54].name = (NSString *)CFSTR("CompressedTextureView SPI");
          v5->_featureInfo[54].supported = v47;
          v5->_featureInfo[55].name = (NSString *)CFSTR("Render target rotation");
          v5->_featureInfo[55].supported = v45;
          v5->_featureInfo[56].name = (NSString *)CFSTR("Dynamic control point counts");
          v5->_featureInfo[56].supported = v44;
          v5->_featureInfo[57].name = (NSString *)CFSTR("Hash support for IAB layouts for use by Tools");
          v5->_featureInfo[57].supported = v43;
          v5->_featureInfo[58].name = (NSString *)CFSTR("Binary Archives");
          v5->_featureInfo[58].supported = v42;
          v5->_featureInfo[59].name = (NSString *)CFSTR("Binary Libraries");
          v5->_featureInfo[59].supported = v41;
          v5->_featureInfo[60].name = (NSString *)CFSTR("Deadline-profile objects");
          v5->_featureInfo[60].supported = v40;
          v5->_featureInfo[15].name = (NSString *)CFSTR("Override default primitive restart");
          v5->_featureInfo[15].requirement = 1001;
          v5->_featureInfo[61].name = (NSString *)CFSTR("FillTexture on blit encoder");
          v5->_featureInfo[1].name = (NSString *)CFSTR("Memory barrier in compute");
          v5->_featureInfo[1].requirement = 1001;
          v5->_featureInfo[6].requirement = 0;
          v5->_featureInfo[7].requirement = 0;
          v5->_featureInfo[14].requirement = 1007;
          v5->_featureInfo[8].requirement = 0;
          v5->_featureInfo[9].requirement = 0;
          v5->_featureInfo[10].requirement = 0;
          v5->_featureInfo[11].requirement = 0;
          v5->_featureInfo[12].requirement = 0;
          v5->_featureInfo[13].requirement = 0;
          v5->_featureInfo[33].requirement = 1001;
          v5->_featureInfo[34].requirement = 1001;
          v5->_featureInfo[35].requirement = 1001;
          v5->_featureInfo[36].requirement = 1001;
          v5->_featureInfo[37].requirement = 1001;
          v5->_featureInfo[38].requirement = 1001;
          v5->_featureInfo[39].requirement = 1001;
          v5->_featureInfo[40].requirement = 1001;
          v5->_featureInfo[41].requirement = 1001;
          v5->_featureInfo[42].requirement = 1001;
          v5->_featureInfo[43].requirement = 1001;
          v5->_featureInfo[44].requirement = 1001;
          v5->_featureInfo[45].requirement = 1001;
          v5->_featureInfo[46].requirement = 1001;
          v5->_featureInfo[47].requirement = 1001;
          v5->_featureInfo[48].requirement = 1001;
          v5->_featureInfo[49].requirement = 1001;
          v5->_featureInfo[50].requirement = 1001;
          v5->_featureInfo[51].requirement = 1001;
          v5->_featureInfo[52].requirement = 1001;
          v5->_featureInfo[53].requirement = 1001;
          v5->_featureInfo[54].requirement = 1001;
          v5->_featureInfo[55].requirement = 1001;
          v5->_featureInfo[56].requirement = 1001;
          v5->_featureInfo[57].requirement = 1001;
          v5->_featureInfo[60].requirement = 1001;
          v5->_featureInfo[61].requirement = 1001;
          v5->_featureInfo[61].supported = v46;
          v5->_featureInfo[5].name = (NSString *)CFSTR("Read-Write Texture Arguments Tier 2");
          v5->_featureInfo[5].requirement = 0;
          v5->_featureInfo[62].name = (NSString *)CFSTR("setThreadgroupPackingDisabled on ComputeEncoder");
          v5->_featureInfo[0].name = (NSString *)CFSTR("Client storage textures");
          v5->_featureInfo[0].requirement = 0;
          v5->_featureInfo[2].requirement = 0;
          v5->_featureInfo[3].requirement = 0;
          v5->_featureInfo[4].requirement = 0;
          v5->_featureInfo[16].requirement = 0;
          v5->_featureInfo[17].requirement = 1006;
          v5->_featureInfo[18].requirement = 1006;
          v5->_featureInfo[19].requirement = 0;
          v5->_featureInfo[20].requirement = 1006;
          v5->_featureInfo[21].requirement = 1006;
          v5->_featureInfo[22].requirement = 0;
          v5->_featureInfo[23].requirement = 0;
          v5->_featureInfo[24].requirement = 0;
          v5->_featureInfo[25].requirement = 0;
          v5->_featureInfo[26].requirement = 0;
          v5->_featureInfo[27].requirement = 0;
          v5->_featureInfo[28].requirement = 1003;
          v5->_featureInfo[29].requirement = 1003;
          v5->_featureInfo[30].requirement = 1003;
          v5->_featureInfo[31].requirement = 0;
          v5->_featureInfo[32].requirement = 1004;
          v5->_featureInfo[58].requirement = 1003;
          v5->_featureInfo[59].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[133].supported + 1) = *(_DWORD *)&v285[3];
          *(_DWORD *)(&v5->_featureInfo[133].supported + 1) = *(_DWORD *)v285;
          *((_DWORD *)&v5->_featureInfo[134].supported + 1) = *(_DWORD *)&v284[3];
          *(_DWORD *)(&v5->_featureInfo[134].supported + 1) = *(_DWORD *)v284;
          *((_DWORD *)&v5->_featureInfo[135].supported + 1) = *(_DWORD *)&v283[3];
          *(_DWORD *)(&v5->_featureInfo[135].supported + 1) = *(_DWORD *)v283;
          *((_DWORD *)&v5->_featureInfo[136].supported + 1) = *(_DWORD *)&v282[3];
          *(_DWORD *)(&v5->_featureInfo[136].supported + 1) = *(_DWORD *)v282;
          *((_DWORD *)&v5->_featureInfo[137].supported + 1) = *(_DWORD *)&v281[3];
          *(_DWORD *)(&v5->_featureInfo[137].supported + 1) = *(_DWORD *)v281;
          *((_DWORD *)&v5->_featureInfo[138].supported + 1) = *(_DWORD *)&v280[3];
          *(_DWORD *)(&v5->_featureInfo[138].supported + 1) = *(_DWORD *)v280;
          *((_DWORD *)&v5->_featureInfo[139].supported + 1) = *(_DWORD *)&v279[3];
          *(_DWORD *)(&v5->_featureInfo[139].supported + 1) = *(_DWORD *)v279;
          *((_DWORD *)&v5->_featureInfo[140].supported + 1) = *(_DWORD *)&v278[3];
          *(_DWORD *)(&v5->_featureInfo[140].supported + 1) = *(_DWORD *)v278;
          v5->_featureInfo[170].supported = v8;
          *(_DWORD *)(&v5->_featureInfo[170].supported + 1) = *(_DWORD *)v248;
          *((_DWORD *)&v5->_featureInfo[141].supported + 1) = *(_DWORD *)&v277[3];
          *(_DWORD *)(&v5->_featureInfo[141].supported + 1) = *(_DWORD *)v277;
          v5->_featureInfo[171].supported = v9;
          *(_DWORD *)(&v5->_featureInfo[171].supported + 1) = *(_DWORD *)v247;
          *((_DWORD *)&v5->_featureInfo[142].supported + 1) = *(_DWORD *)&v276[3];
          *(_DWORD *)(&v5->_featureInfo[142].supported + 1) = *(_DWORD *)v276;
          v5->_featureInfo[172].supported = v12;
          *(_DWORD *)(&v5->_featureInfo[172].supported + 1) = *(_DWORD *)v246;
          *((_DWORD *)&v5->_featureInfo[143].supported + 1) = *(_DWORD *)&v275[3];
          *(_DWORD *)(&v5->_featureInfo[143].supported + 1) = *(_DWORD *)v275;
          v5->_featureInfo[173].supported = v13;
          *(_DWORD *)(&v5->_featureInfo[173].supported + 1) = *(_DWORD *)v245;
          *((_DWORD *)&v5->_featureInfo[144].supported + 1) = *(_DWORD *)&v274[3];
          *(_DWORD *)(&v5->_featureInfo[144].supported + 1) = *(_DWORD *)v274;
          v5->_featureInfo[174].supported = v14;
          *(_DWORD *)(&v5->_featureInfo[174].supported + 1) = *(_DWORD *)v244;
          *((_DWORD *)&v5->_featureInfo[145].supported + 1) = *(_DWORD *)&v273[3];
          *(_DWORD *)(&v5->_featureInfo[145].supported + 1) = *(_DWORD *)v273;
          v5->_featureInfo[175].supported = v15;
          *(_DWORD *)(&v5->_featureInfo[175].supported + 1) = *(_DWORD *)v243;
          *((_DWORD *)&v5->_featureInfo[146].supported + 1) = *(_DWORD *)&v272[3];
          *(_DWORD *)(&v5->_featureInfo[146].supported + 1) = *(_DWORD *)v272;
          v5->_featureInfo[176].supported = v16;
          *(_DWORD *)(&v5->_featureInfo[176].supported + 1) = *(_DWORD *)v242;
          *((_DWORD *)&v5->_featureInfo[147].supported + 1) = *(_DWORD *)&v271[3];
          *(_DWORD *)(&v5->_featureInfo[147].supported + 1) = *(_DWORD *)v271;
          v5->_featureInfo[177].supported = v17;
          *(_DWORD *)(&v5->_featureInfo[177].supported + 1) = *(_DWORD *)v241;
          *((_DWORD *)&v5->_featureInfo[148].supported + 1) = *(_DWORD *)&v270[3];
          *(_DWORD *)(&v5->_featureInfo[148].supported + 1) = *(_DWORD *)v270;
          v5->_featureInfo[178].supported = v18;
          *(_DWORD *)(&v5->_featureInfo[178].supported + 1) = *(_DWORD *)v240;
          *((_DWORD *)&v5->_featureInfo[149].supported + 1) = *(_DWORD *)&v269[3];
          *(_DWORD *)(&v5->_featureInfo[149].supported + 1) = *(_DWORD *)v269;
          v5->_featureInfo[179].supported = v19;
          *(_DWORD *)(&v5->_featureInfo[179].supported + 1) = *(_DWORD *)v239;
          *((_DWORD *)&v5->_featureInfo[150].supported + 1) = *(_DWORD *)&v268[3];
          *(_DWORD *)(&v5->_featureInfo[150].supported + 1) = *(_DWORD *)v268;
          v5->_featureInfo[180].supported = v20;
          *(_DWORD *)(&v5->_featureInfo[180].supported + 1) = *(_DWORD *)v238;
          *((_DWORD *)&v5->_featureInfo[151].supported + 1) = *(_DWORD *)&v267[3];
          *(_DWORD *)(&v5->_featureInfo[151].supported + 1) = *(_DWORD *)v267;
          v5->_featureInfo[181].supported = v21;
          *(_DWORD *)(&v5->_featureInfo[181].supported + 1) = *(_DWORD *)v237;
          *((_DWORD *)&v5->_featureInfo[152].supported + 1) = *(_DWORD *)&v266[3];
          *(_DWORD *)(&v5->_featureInfo[152].supported + 1) = *(_DWORD *)v266;
          v5->_featureInfo[182].supported = v22;
          *(_DWORD *)(&v5->_featureInfo[182].supported + 1) = *(_DWORD *)v236;
          *((_DWORD *)&v5->_featureInfo[153].supported + 1) = *(_DWORD *)&v265[3];
          *(_DWORD *)(&v5->_featureInfo[153].supported + 1) = *(_DWORD *)v265;
          v5->_featureInfo[183].supported = v23;
          *(_DWORD *)(&v5->_featureInfo[183].supported + 1) = *(_DWORD *)v235;
          *((_DWORD *)&v5->_featureInfo[154].supported + 1) = *(_DWORD *)&v264[3];
          *(_DWORD *)(&v5->_featureInfo[154].supported + 1) = *(_DWORD *)v264;
          v5->_featureInfo[184].supported = v24;
          *(_DWORD *)(&v5->_featureInfo[184].supported + 1) = *(_DWORD *)v234;
          *((_DWORD *)&v5->_featureInfo[155].supported + 1) = *(_DWORD *)&v263[3];
          *(_DWORD *)(&v5->_featureInfo[155].supported + 1) = *(_DWORD *)v263;
          v5->_featureInfo[185].supported = v25;
          *(_DWORD *)(&v5->_featureInfo[185].supported + 1) = *(_DWORD *)v233;
          *((_DWORD *)&v5->_featureInfo[156].supported + 1) = *(_DWORD *)&v262[3];
          *(_DWORD *)(&v5->_featureInfo[156].supported + 1) = *(_DWORD *)v262;
          v5->_featureInfo[186].supported = v26;
          *(_DWORD *)(&v5->_featureInfo[186].supported + 1) = *(_DWORD *)v232;
          *((_DWORD *)&v5->_featureInfo[157].supported + 1) = *(_DWORD *)&v261[3];
          *(_DWORD *)(&v5->_featureInfo[157].supported + 1) = *(_DWORD *)v261;
          v5->_featureInfo[187].supported = v27;
          *(_DWORD *)(&v5->_featureInfo[187].supported + 1) = *(_DWORD *)v231;
          *((_DWORD *)&v5->_featureInfo[158].supported + 1) = *(_DWORD *)&v260[3];
          *(_DWORD *)(&v5->_featureInfo[158].supported + 1) = *(_DWORD *)v260;
          v5->_featureInfo[188].supported = v28;
          *(_DWORD *)(&v5->_featureInfo[188].supported + 1) = *(_DWORD *)v230;
          *((_DWORD *)&v5->_featureInfo[159].supported + 1) = *(_DWORD *)&v259[3];
          *(_DWORD *)(&v5->_featureInfo[159].supported + 1) = *(_DWORD *)v259;
          v5->_featureInfo[189].supported = v29;
          *(_DWORD *)(&v5->_featureInfo[189].supported + 1) = *(_DWORD *)v229;
          *((_DWORD *)&v5->_featureInfo[160].supported + 1) = *(_DWORD *)&v258[3];
          *(_DWORD *)(&v5->_featureInfo[160].supported + 1) = *(_DWORD *)v258;
          v5->_featureInfo[190].supported = v30;
          *(_DWORD *)(&v5->_featureInfo[190].supported + 1) = *(_DWORD *)v228;
          *((_DWORD *)&v5->_featureInfo[161].supported + 1) = *(_DWORD *)&v257[3];
          *(_DWORD *)(&v5->_featureInfo[161].supported + 1) = *(_DWORD *)v257;
          v5->_featureInfo[191].supported = v31;
          *(_DWORD *)(&v5->_featureInfo[191].supported + 1) = *(_DWORD *)v227;
          *((_DWORD *)&v5->_featureInfo[162].supported + 1) = *(_DWORD *)&v256[3];
          *(_DWORD *)(&v5->_featureInfo[162].supported + 1) = *(_DWORD *)v256;
          v5->_featureInfo[192].supported = v32;
          *(_DWORD *)(&v5->_featureInfo[192].supported + 1) = *(_DWORD *)v226;
          *((_DWORD *)&v5->_featureInfo[163].supported + 1) = *(_DWORD *)&v255[3];
          *(_DWORD *)(&v5->_featureInfo[163].supported + 1) = *(_DWORD *)v255;
          v5->_featureInfo[193].supported = v33;
          *(_DWORD *)(&v5->_featureInfo[193].supported + 1) = *(_DWORD *)v225;
          *((_DWORD *)&v5->_featureInfo[164].supported + 1) = *(_DWORD *)&v254[3];
          *(_DWORD *)(&v5->_featureInfo[164].supported + 1) = *(_DWORD *)v254;
          v5->_featureInfo[194].supported = v34;
          *(_DWORD *)(&v5->_featureInfo[194].supported + 1) = *(_DWORD *)v224;
          *((_DWORD *)&v5->_featureInfo[165].supported + 1) = *(_DWORD *)&v253[3];
          *(_DWORD *)(&v5->_featureInfo[165].supported + 1) = *(_DWORD *)v253;
          v5->_featureInfo[195].supported = v35;
          *(_DWORD *)(&v5->_featureInfo[195].supported + 1) = *(_DWORD *)v223;
          *((_DWORD *)&v5->_featureInfo[166].supported + 1) = *(_DWORD *)&v252[3];
          *(_DWORD *)(&v5->_featureInfo[166].supported + 1) = *(_DWORD *)v252;
          v5->_featureInfo[196].supported = v36;
          *(_DWORD *)(&v5->_featureInfo[196].supported + 1) = *(_DWORD *)v222;
          *((_DWORD *)&v5->_featureInfo[167].supported + 1) = *(_DWORD *)&v251[3];
          *(_DWORD *)(&v5->_featureInfo[167].supported + 1) = *(_DWORD *)v251;
          v5->_featureInfo[197].supported = v37;
          *(_DWORD *)(&v5->_featureInfo[197].supported + 1) = *(_DWORD *)v221;
          *((_DWORD *)&v5->_featureInfo[168].supported + 1) = *(_DWORD *)&v250[3];
          *(_DWORD *)(&v5->_featureInfo[168].supported + 1) = *(_DWORD *)v250;
          v5->_featureInfo[198].supported = v38;
          *(_DWORD *)(&v5->_featureInfo[198].supported + 1) = *(_DWORD *)v220;
          *((_DWORD *)&v5->_featureInfo[169].supported + 1) = *(_DWORD *)&v249[3];
          *(_DWORD *)(&v5->_featureInfo[169].supported + 1) = *(_DWORD *)v249;
          v5->_featureInfo[199].supported = v39;
          *(_DWORD *)(&v5->_featureInfo[199].supported + 1) = *(_DWORD *)v219;
          v5->_featureInfo[62].supported = v213;
          v5->_featureInfo[63].name = (NSString *)CFSTR("ASTC-format texture compression");
          v5->_featureInfo[63].supported = v212;
          v5->_featureInfo[64].name = (NSString *)CFSTR("Extended YUV pixel formats");
          v5->_featureInfo[64].supported = v211;
          v5->_featureInfo[65].name = (NSString *)CFSTR("XR10 pixel formats");
          v5->_featureInfo[65].supported = v210;
          v5->_featureInfo[66].name = (NSString *)CFSTR("sRGBwrites");
          v5->_featureInfo[66].supported = v209;
          v5->_featureInfo[67].name = (NSString *)CFSTR("Depth Clip Mode");
          v5->_featureInfo[67].supported = v208;
          v5->_featureInfo[68].name = (NSString *)CFSTR("Resource heaps");
          v5->_featureInfo[68].supported = v206;
          v5->_featureInfo[69].name = (NSString *)CFSTR("Argument buffers");
          v5->_featureInfo[63].requirement = 1002;
          v5->_featureInfo[64].requirement = 1002;
          v5->_featureInfo[65].requirement = 1002;
          v5->_featureInfo[66].requirement = 1002;
          v5->_featureInfo[67].requirement = 1002;
          v5->_featureInfo[68].requirement = 1002;
          v5->_featureInfo[69].requirement = 1002;
          v5->_featureInfo[69].supported = v207;
          v5->_featureInfo[70].name = (NSString *)CFSTR("Packed 32-bit format Texture Buffer Writes");
          v5->_featureInfo[70].supported = v205;
          v5->_featureInfo[71].name = (NSString *)CFSTR("ASTC-format textures with MTLTextureType3D");
          v5->_featureInfo[71].supported = v204;
          v5->_featureInfo[72].name = (NSString *)CFSTR("Extended XR10 pixel formats");
          v5->_featureInfo[72].supported = v203;
          v5->_featureInfo[73].name = (NSString *)CFSTR("Writes to buffers from fragment functions");
          v5->_featureInfo[73].supported = v202;
          v5->_featureInfo[74].name = (NSString *)CFSTR("Counting Occlusion Query");
          v5->_featureInfo[74].supported = v201;
          v5->_featureInfo[75].name = (NSString *)CFSTR("Base Vertex Instance Drawing");
          v5->_featureInfo[75].supported = v200;
          v5->_featureInfo[76].name = (NSString *)CFSTR("Indirect draw & dispatch arguments");
          v5->_featureInfo[76].supported = v199;
          v5->_featureInfo[77].name = (NSString *)CFSTR("Tessellation");
          v5->_featureInfo[77].supported = v198;
          v5->_featureInfo[78].name = (NSString *)CFSTR("Read-Write Buffer Arguments");
          v5->_featureInfo[78].supported = v197;
          v5->_featureInfo[79].name = (NSString *)CFSTR("Readable Array Of Textures");
          v5->_featureInfo[79].supported = v196;
          v5->_featureInfo[80].name = (NSString *)CFSTR("Array Of Samplers");
          v5->_featureInfo[80].supported = v195;
          v5->_featureInfo[81].name = (NSString *)CFSTR("Combined MSAA Store And Resolve Action");
          v5->_featureInfo[81].supported = v194;
          v5->_featureInfo[82].name = (NSString *)CFSTR("Mutable Tier1 Argument Buffers");
          v5->_featureInfo[82].supported = v193;
          v5->_featureInfo[83].name = (NSString *)CFSTR("Sampler Compare Function");
          v5->_featureInfo[83].supported = v192;
          v5->_featureInfo[84].name = (NSString *)CFSTR("MSAA Depth Resolve");
          v5->_featureInfo[84].supported = v191;
          v5->_featureInfo[85].name = (NSString *)CFSTR("MSAA Stencil Resolve");
          v5->_featureInfo[85].supported = v190;
          v5->_featureInfo[86].name = (NSString *)CFSTR("MSAA Depth Resolve Filter");
          v5->_featureInfo[86].supported = v189;
          v5->_featureInfo[87].name = (NSString *)CFSTR("Indirect Command Buffers for graphics");
          v5->_featureInfo[87].supported = v188;
          v5->_featureInfo[88].name = (NSString *)CFSTR("Indirect Command Buffers for compute");
          v5->_featureInfo[88].supported = v187;
          v5->_featureInfo[89].name = (NSString *)CFSTR("Indirect Stage In Region");
          v5->_featureInfo[89].supported = v186;
          v5->_featureInfo[90].name = (NSString *)CFSTR("Indirect texture access");
          v5->_featureInfo[90].supported = v184;
          v5->_featureInfo[91].name = (NSString *)CFSTR("Bicubic filtering of 16-bit normalized values");
          v5->_featureInfo[91].supported = v183;
          v5->_featureInfo[92].name = (NSString *)CFSTR("Out of Bounds Reads on Textures");
          v5->_featureInfo[92].supported = v182;
          v5->_featureInfo[93].name = (NSString *)CFSTR("Texture Swizzle");
          v5->_featureInfo[93].supported = v181;
          v5->_featureInfo[94].name = (NSString *)CFSTR("YUV + Alpha pixel formats");
          v5->_featureInfo[94].supported = v180;
          v5->_featureInfo[95].name = (NSString *)CFSTR("Atomic functions with memory order");
          v5->_featureInfo[95].supported = v179;
          v5->_featureInfo[96].name = (NSString *)CFSTR("Support quad_group* attributes in kernel functions");
          v5->_featureInfo[96].supported = v178;
          v5->_featureInfo[97].name = (NSString *)CFSTR("Writes to textures from vertex and fragment functions");
          v5->_featureInfo[97].supported = v177;
          v5->_featureInfo[98].name = (NSString *)CFSTR("Image Blocks");
          v5->_featureInfo[98].supported = v176;
          v5->_featureInfo[99].name = (NSString *)CFSTR("Tile Shaders");
          v5->_featureInfo[99].supported = v172;
          v5->_featureInfo[100].name = (NSString *)CFSTR("Image Block Sample Coverage Control");
          v5->_featureInfo[100].supported = v164;
          v5->_featureInfo[140].name = (NSString *)CFSTR("Sparse heaps");
          v5->_featureInfo[140].supported = v112;
          v5->_featureInfo[140].requirement = 1006;
          v5->_featureInfo[101].name = (NSString *)CFSTR("FP16 on native hardware");
          v5->_featureInfo[101].supported = v161;
          v5->_featureInfo[139].supported = v115;
          v5->_featureInfo[139].requirement = 1006;
          v5->_featureInfo[138].supported = v118;
          v5->_featureInfo[139].name = (NSString *)CFSTR("Sparse textures");
          v5->_featureInfo[138].name = (NSString *)CFSTR("ASTC HDR Texture Compression");
          v5->_featureInfo[138].requirement = 1006;
          v5->_featureInfo[102].name = (NSString *)CFSTR("Post-Depth Coverage");
          v5->_featureInfo[137].name = (NSString *)CFSTR("YCBCR XR pixel formats");
          v5->_featureInfo[137].supported = v122;
          v5->_featureInfo[137].requirement = 1006;
          v5->_featureInfo[102].supported = v168;
          v5->_featureInfo[136].name = (NSString *)CFSTR("YCBCR 12 pixel formats");
          v5->_featureInfo[136].supported = v125;
          v5->_featureInfo[136].requirement = 1006;
          v5->_featureInfo[103].name = (NSString *)CFSTR("Mip Levels smaller than Block Size");
          v5->_featureInfo[135].supported = v128;
          v5->_featureInfo[135].name = (NSString *)CFSTR("YCBCR PQ pixel formats");
          v5->_featureInfo[135].requirement = 1006;
          v5->_featureInfo[103].supported = v167;
          v5->_featureInfo[134].name = (NSString *)CFSTR("YCBCR PQ pixel formats");
          v5->_featureInfo[134].supported = v131;
          v5->_featureInfo[134].requirement = 1006;
          v5->_featureInfo[104].name = (NSString *)CFSTR("Dispatch Threads with Non-Uniform Threadgroup Size");
          v5->_featureInfo[133].name = (NSString *)CFSTR("Variable Rate Rasterization");
          v5->_featureInfo[133].supported = v135;
          v5->_featureInfo[133].requirement = 1006;
          v5->_featureInfo[104].supported = v166;
          v5->_featureInfo[132].name = (NSString *)CFSTR("Writable Array Of Textures");
          v5->_featureInfo[132].supported = v138;
          v5->_featureInfo[132].requirement = 1006;
          v5->_featureInfo[105].name = (NSString *)CFSTR("Read-Write Texture Arguments");
          v5->_featureInfo[105].supported = v163;
          v5->_featureInfo[131].supported = v141;
          v5->_featureInfo[131].requirement = 1006;
          v5->_featureInfo[130].supported = v144;
          v5->_featureInfo[131].name = (NSString *)CFSTR("SIMD Shuffles And Broadcast");
          v5->_featureInfo[130].name = (NSString *)CFSTR("Shader Min LOD Clamp");
          v5->_featureInfo[130].requirement = 1006;
          v5->_featureInfo[106].name = (NSString *)CFSTR("Read-Write Texture Cube Arguments");
          v5->_featureInfo[129].name = (NSString *)CFSTR("Support simd_group* attributes in kernel functions");
          v5->_featureInfo[129].supported = v146;
          v5->_featureInfo[129].requirement = 1006;
          v5->_featureInfo[128].name = (NSString *)CFSTR("Create a heap from a set of address ranges");
          v5->_featureInfo[128].supported = v147;
          v5->_featureInfo[128].requirement = 1005;
          v5->_featureInfo[106].supported = v174;
          v5->_featureInfo[127].name = (NSString *)CFSTR("Create a buffer from a set of address ranges");
          v5->_featureInfo[127].supported = v148;
          v5->_featureInfo[127].requirement = 1005;
          v5->_featureInfo[107].name = (NSString *)CFSTR("Texture Cube Array");
          v5->_featureInfo[107].supported = v171;
          v5->_featureInfo[126].supported = v149;
          v5->_featureInfo[126].requirement = 0;
          v5->_featureInfo[108].name = (NSString *)CFSTR("QUAD Shuffles And Broadcast");
          v5->_featureInfo[108].supported = v165;
          v5->_featureInfo[125].supported = v150;
          v5->_featureInfo[126].name = (NSString *)CFSTR("Resource detach backing");
          v5->_featureInfo[125].name = (NSString *)CFSTR("RGB9E5 & RG11B10 vertex fetch");
          v5->_featureInfo[125].requirement = 1005;
          v5->_featureInfo[123].name = (NSString *)CFSTR("FP32 Tessellation Factors");
          v5->_featureInfo[124].name = (NSString *)CFSTR("Unaligned vertex fetch");
          v5->_featureInfo[124].supported = v151;
          v5->_featureInfo[124].requirement = 1005;
          v5->_featureInfo[123].supported = v152;
          v5->_featureInfo[123].requirement = 1005;
          v5->_featureInfo[109].name = (NSString *)CFSTR("Concurrent Compute Dispatch");
          v5->_featureInfo[122].name = (NSString *)CFSTR("Stencil Feedback");
          v5->_featureInfo[122].supported = v153;
          v5->_featureInfo[122].requirement = 1005;
          v5->_featureInfo[110].name = (NSString *)CFSTR("A Render Pass without a Render Target");
          v5->_featureInfo[110].supported = v170;
          v5->_featureInfo[121].supported = v154;
          v5->_featureInfo[121].requirement = 1005;
          v5->_featureInfo[111].name = (NSString *)CFSTR("Raster Order Groups");
          v5->_featureInfo[111].supported = v162;
          v5->_featureInfo[120].supported = v155;
          v5->_featureInfo[121].name = (NSString *)CFSTR("MSAA Stencil Resolve Filter");
          v5->_featureInfo[120].name = (NSString *)CFSTR("Indirect Tessellation");
          v5->_featureInfo[120].requirement = 1005;
          v5->_featureInfo[118].name = (NSString *)CFSTR("Layered Rendering");
          v5->_featureInfo[119].name = (NSString *)CFSTR("Viewport and Scissor Array");
          v5->_featureInfo[119].supported = v156;
          v5->_featureInfo[119].requirement = 1005;
          v5->_featureInfo[118].supported = v157;
          v5->_featureInfo[118].requirement = 1005;
          v5->_featureInfo[112].name = (NSString *)CFSTR("Raster Order Groups on Color Attachments");
          v5->_featureInfo[117].name = (NSString *)CFSTR("2D Linear Texture Array");
          v5->_featureInfo[117].supported = v158;
          v5->_featureInfo[117].requirement = 1005;
          v5->_featureInfo[112].supported = v175;
          v5->_featureInfo[116].name = (NSString *)CFSTR("Separate Visibility And Shading Rate");
          v5->_featureInfo[116].supported = v159;
          v5->_featureInfo[116].requirement = 1005;
          v5->_featureInfo[113].name = (NSString *)CFSTR("Dynamic Attribute Stride in vertex fetching");
          v5->_featureInfo[113].supported = v173;
          v5->_featureInfo[115].supported = v160;
          v5->_featureInfo[115].requirement = 1005;
          v5->_featureInfo[114].name = (NSString *)CFSTR("Linear Texture 2D arrays");
          v5->_featureInfo[114].requirement = 1005;
          v5->_featureInfo[114].supported = v169;
          v5->_featureInfo[115].name = (NSString *)CFSTR("Non-Square Tile Shaders");
          v5->_featureInfo[94].requirement = 1004;
          v5->_featureInfo[96].requirement = 1004;
          v5->_featureInfo[97].requirement = 1004;
          v5->_featureInfo[98].requirement = 1004;
          v5->_featureInfo[112].requirement = 1004;
          v5->_featureInfo[113].requirement = 1004;
          v5->_featureInfo[99].requirement = 1004;
          v5->_featureInfo[100].requirement = 1004;
          v5->_featureInfo[101].requirement = 1004;
          v5->_featureInfo[102].requirement = 1004;
          v5->_featureInfo[103].requirement = 1004;
          v5->_featureInfo[111].requirement = 1004;
          v5->_featureInfo[104].requirement = 1004;
          v5->_featureInfo[105].requirement = 1004;
          v5->_featureInfo[106].requirement = 1004;
          v5->_featureInfo[107].requirement = 1004;
          v5->_featureInfo[108].requirement = 1004;
          v5->_featureInfo[110].requirement = 1004;
          v5->_featureInfo[109].requirement = 1004;
          v5->_featureInfo[109].supported = v185;
          v5->_featureInfo[141].name = (NSString *)CFSTR("access::write on indirect textures");
          v5->_featureInfo[141].supported = v145;
          v5->_featureInfo[142].name = (NSString *)CFSTR("Function Pointers");
          v5->_featureInfo[142].supported = v143;
          v5->_featureInfo[143].name = (NSString *)CFSTR("Dynamic Libraries");
          v5->_featureInfo[143].supported = v142;
          v5->_featureInfo[144].name = (NSString *)CFSTR("Dynamic Libraries created with compute state");
          v5->_featureInfo[144].supported = v140;
          v5->_featureInfo[145].name = (NSString *)CFSTR("Dynamic Libraries created with render/tileRender state");
          v5->_featureInfo[145].supported = v139;
          v5->_featureInfo[146].name = (NSString *)CFSTR("Function Pointers from Render stages");
          v5->_featureInfo[146].supported = v137;
          v5->_featureInfo[147].name = (NSString *)CFSTR("Shared function tables");
          v5->_featureInfo[147].supported = v136;
          v5->_featureInfo[148].name = (NSString *)CFSTR("Raytracing from Render stages");
          v5->_featureInfo[148].supported = v134;
          v5->_featureInfo[149].name = (NSString *)CFSTR("Raytracing Primitive Motion Blur");
          v5->_featureInfo[149].supported = v133;
          v5->_featureInfo[150].name = (NSString *)CFSTR("Ray Tracing Extended Vertex Formats and Transformation");
          v5->_featureInfo[150].supported = v132;
          v5->_featureInfo[151].name = (NSString *)CFSTR("Heap Acceleration Structure Allocation");
          v5->_featureInfo[151].supported = v130;
          v5->_featureInfo[152].name = (NSString *)CFSTR("RayTracing Per Primitive Data");
          v5->_featureInfo[152].supported = v129;
          v5->_featureInfo[153].name = (NSString *)CFSTR("Ray Tracing Traversal Metrics");
          v5->_featureInfo[153].supported = v127;
          v5->_featureInfo[154].name = (NSString *)CFSTR("Raytracing Buffers from Intersection Function Tables");
          v5->_featureInfo[154].supported = v126;
          v5->_featureInfo[155].name = (NSString *)CFSTR("Deserialization of Acceleration Structures on CPU");
          v5->_featureInfo[155].supported = v124;
          v5->_featureInfo[156].name = (NSString *)CFSTR("Ray tracing multi-level instancing");
          v5->_featureInfo[156].supported = v123;
          v5->_featureInfo[157].name = (NSString *)CFSTR("Ray Tracing Indirect Instance Acceleration Structure Build");
          v5->_featureInfo[157].supported = v121;
          v5->_featureInfo[158].name = (NSString *)CFSTR("Ray Tracing GPU Table Update Buffers");
          v5->_featureInfo[158].supported = v120;
          v5->_featureInfo[159].name = (NSString *)CFSTR("Ray tracing curve primitives");
          v5->_featureInfo[159].supported = v119;
          v5->_featureInfo[160].name = (NSString *)CFSTR("Barycentrics coordinates and PrimitiveID");
          v5->_featureInfo[160].supported = v117;
          v5->_featureInfo[161].name = (NSString *)CFSTR("Black Or White Sampler Border Colors");
          v5->_featureInfo[161].supported = v116;
          v5->_featureInfo[162].name = (NSString *)CFSTR("MirrorClampToEdge Sampler Mode");
          v5->_featureInfo[162].supported = v114;
          v5->_featureInfo[163].name = (NSString *)CFSTR("SIMD Reduction");
          v5->_featureInfo[163].supported = v113;
          v5->_featureInfo[164].name = (NSString *)CFSTR("DepthClipModeClamp with zMin != 0 or zMax != 1");
          v5->_featureInfo[164].supported = v111;
          v5->_featureInfo[165].name = (NSString *)CFSTR("Texture 2D Multisample Array");
          v5->_featureInfo[165].supported = v110;
          v5->_featureInfo[166].name = (NSString *)CFSTR("Force seams on cubemap filtering");
          v5->_featureInfo[166].supported = v109;
          v5->_featureInfo[167].name = (NSString *)CFSTR("Bicubic filtering of 16-bit float values");
          v5->_featureInfo[167].supported = v108;
          v5->_featureInfo[168].name = (NSString *)CFSTR("Inf/Nan filtering of 16-bit float values");
          v5->_featureInfo[95].requirement = 0;
          v5->_featureInfo[168].supported = v106;
          v5->_featureInfo[200].supported = v63;
          *(_DWORD *)(&v5->_featureInfo[200].supported + 1) = *(_DWORD *)v218;
          v5->_featureInfo[169].name = (NSString *)CFSTR("RTZ Rounding and Clamping");
          v5->_featureInfo[169].supported = v107;
          v5->_featureInfo[170].name = (NSString *)CFSTR("Aniso sampling controls for certain conditions");
          *((_DWORD *)&v5->_featureInfo[170].supported + 1) = *(_DWORD *)&v248[3];
          v5->_featureInfo[171].name = (NSString *)CFSTR("YCBCR Packed PQ pixel formats");
          *((_DWORD *)&v5->_featureInfo[171].supported + 1) = *(_DWORD *)&v247[3];
          v5->_featureInfo[93].requirement = 1003;
          v5->_featureInfo[172].name = (NSString *)CFSTR("YCBCR Packed 12 pixel formats");
          v5->_featureInfo[201].supported = v67;
          *((_DWORD *)&v5->_featureInfo[172].supported + 1) = *(_DWORD *)&v246[3];
          *(_DWORD *)(&v5->_featureInfo[201].supported + 1) = *(_DWORD *)v217;
          v5->_featureInfo[173].name = (NSString *)CFSTR("YCBCR Packed XR pixel formats");
          v5->_featureInfo[91].requirement = 1003;
          v5->_featureInfo[92].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[173].supported + 1) = *(_DWORD *)&v245[3];
          v5->_featureInfo[174].name = (NSString *)CFSTR("Buffer Bounds Checking");
          v5->_featureInfo[202].supported = v70;
          *(_DWORD *)(&v5->_featureInfo[202].supported + 1) = *(_DWORD *)v216;
          *((_DWORD *)&v5->_featureInfo[174].supported + 1) = *(_DWORD *)&v244[3];
          v5->_featureInfo[175].name = (NSString *)CFSTR("Forkable command buffers");
          *((_DWORD *)&v5->_featureInfo[175].supported + 1) = *(_DWORD *)&v243[3];
          v5->_featureInfo[176].name = (NSString *)CFSTR("Support device partitioning");
          *((_DWORD *)&v5->_featureInfo[176].supported + 1) = *(_DWORD *)&v242[3];
          v5->_featureInfo[90].requirement = 1003;
          v5->_featureInfo[177].name = (NSString *)CFSTR("Support compute writes on compressed textures");
          *((_DWORD *)&v5->_featureInfo[177].supported + 1) = *(_DWORD *)&v241[3];
          v5->_featureInfo[88].requirement = 1003;
          v5->_featureInfo[178].name = (NSString *)CFSTR("Support SIMD group matrix multiply add");
          *((_DWORD *)&v5->_featureInfo[178].supported + 1) = *(_DWORD *)&v240[3];
          v5->_featureInfo[89].requirement = 1003;
          v5->_featureInfo[179].name = (NSString *)CFSTR("Support compression interchange");
          v5->_featureInfo[203].supported = v74;
          *(_DWORD *)(&v5->_featureInfo[203].supported + 1) = *(_DWORD *)v215;
          *((_DWORD *)&v5->_featureInfo[179].supported + 1) = *(_DWORD *)&v239[3];
          v5->_featureInfo[180].name = (NSString *)CFSTR("Quad Reduction");
          v5->_featureInfo[80].requirement = 1003;
          v5->_featureInfo[83].requirement = 1003;
          v5->_featureInfo[84].requirement = 1003;
          v5->_featureInfo[87].requirement = 1003;
          v5->_featureInfo[85].requirement = 1003;
          v5->_featureInfo[86].requirement = 1003;
          v5->_featureInfo[160].requirement = 1007;
          v5->_featureInfo[161].requirement = 1007;
          v5->_featureInfo[162].requirement = 1007;
          v5->_featureInfo[163].requirement = 1007;
          v5->_featureInfo[164].requirement = 1007;
          v5->_featureInfo[165].requirement = 1007;
          v5->_featureInfo[166].requirement = 1007;
          v5->_featureInfo[167].requirement = 1007;
          v5->_featureInfo[168].requirement = 1007;
          v5->_featureInfo[171].requirement = 1007;
          v5->_featureInfo[172].requirement = 1007;
          v5->_featureInfo[173].requirement = 1007;
          v5->_featureInfo[175].requirement = 1007;
          v5->_featureInfo[176].requirement = 1007;
          v5->_featureInfo[177].requirement = 1007;
          v5->_featureInfo[178].requirement = 1007;
          v5->_featureInfo[179].requirement = 1007;
          v5->_featureInfo[180].requirement = 1007;
          *((_DWORD *)&v5->_featureInfo[180].supported + 1) = *(_DWORD *)&v238[3];
          v5->_featureInfo[82].requirement = 1003;
          v5->_featureInfo[181].name = (NSString *)CFSTR("Compute Virtual Substreams");
          *((_DWORD *)&v5->_featureInfo[181].supported + 1) = *(_DWORD *)&v237[3];
          v5->_featureInfo[81].requirement = 1003;
          v5->_featureInfo[182].name = (NSString *)CFSTR("SIMD Shuffle and fill");
          *((_DWORD *)&v5->_featureInfo[182].supported + 1) = *(_DWORD *)&v236[3];
          v5->_featureInfo[183].name = (NSString *)CFSTR("Bfloat16 Texture format");
          *((_DWORD *)&v5->_featureInfo[183].supported + 1) = *(_DWORD *)&v235[3];
          v5->_featureInfo[184].name = (NSString *)CFSTR("Sparse Depth Texture Attachments");
          *((_DWORD *)&v5->_featureInfo[184].supported + 1) = *(_DWORD *)&v234[3];
          v5->_featureInfo[185].name = (NSString *)CFSTR("ulong atomic min and max without return");
          *((_DWORD *)&v5->_featureInfo[185].supported + 1) = *(_DWORD *)&v233[3];
          v5->_featureInfo[186].name = (NSString *)CFSTR("Texture lossy compression footprint selection");
          v5->_featureInfo[182].requirement = 1008;
          v5->_featureInfo[183].requirement = 1008;
          v5->_featureInfo[184].requirement = 1008;
          v5->_featureInfo[185].requirement = 1008;
          v5->_featureInfo[186].requirement = 1008;
          v5->_featureInfo[77].requirement = 1003;
          v5->_featureInfo[79].requirement = 1003;
          v5->_featureInfo[78].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[186].supported + 1) = *(_DWORD *)&v232[3];
          v5->_featureInfo[187].name = (NSString *)CFSTR("Object and Mesh shader stages");
          *((_DWORD *)&v5->_featureInfo[187].supported + 1) = *(_DWORD *)&v231[3];
          v5->_featureInfo[188].name = (NSString *)CFSTR("Function Pointers and Ray Tracing from Mesh and Object stages");
          *((_DWORD *)&v5->_featureInfo[188].supported + 1) = *(_DWORD *)&v230[3];
          v5->_featureInfo[204].supported = v10;
          v5->_featureInfo[189].name = (NSString *)CFSTR("Mesh shader draws can be encoded into ICBs");
          *(_DWORD *)(&v5->_featureInfo[204].supported + 1) = *(_DWORD *)v214;
          *((_DWORD *)&v5->_featureInfo[189].supported + 1) = *(_DWORD *)&v229[3];
          v5->_featureInfo[190].name = (NSString *)CFSTR("Dynamic library linking inside Mesh render pipelines");
          *((_DWORD *)&v5->_featureInfo[190].supported + 1) = *(_DWORD *)&v228[3];
          v5->_featureInfo[191].name = (NSString *)CFSTR("Bfloat16 Buffer content");
          v5->_featureInfo[76].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[191].supported + 1) = *(_DWORD *)&v227[3];
          v5->_featureInfo[192].name = (NSString *)CFSTR("Command Buffer Jump");
          v5->_featureInfo[70].requirement = 1003;
          v5->_featureInfo[71].requirement = 1003;
          v5->_featureInfo[75].requirement = 1003;
          v5->_featureInfo[72].requirement = 1003;
          v5->_featureInfo[73].requirement = 1003;
          v5->_featureInfo[74].requirement = 1003;
          v5->_featureInfo[141].requirement = 1006;
          v5->_featureInfo[142].requirement = 1006;
          v5->_featureInfo[143].requirement = 1006;
          v5->_featureInfo[144].requirement = 1006;
          v5->_featureInfo[145].requirement = 1006;
          v5->_featureInfo[146].requirement = 1006;
          v5->_featureInfo[147].requirement = 1006;
          v5->_featureInfo[148].requirement = 1006;
          v5->_featureInfo[149].requirement = 1006;
          v5->_featureInfo[150].requirement = 1006;
          v5->_featureInfo[192].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[192].supported + 1) = *(_DWORD *)&v226[3];
          v5->_featureInfo[151].requirement = 1006;
          v5->_featureInfo[193].name = (NSString *)CFSTR("Selection of per-texture color space conversion matrix");
          *((_DWORD *)&v5->_featureInfo[193].supported + 1) = *(_DWORD *)&v225[3];
          v5->_featureInfo[152].requirement = 1006;
          v5->_featureInfo[194].name = (NSString *)CFSTR("Selection of lossy compression rate per-iosurface plane");
          *((_DWORD *)&v5->_featureInfo[194].supported + 1) = *(_DWORD *)&v224[3];
          v5->_featureInfo[154].requirement = 1006;
          v5->_featureInfo[195].name = (NSString *)CFSTR("Conditional edge checked load/store");
          *((_DWORD *)&v5->_featureInfo[195].supported + 1) = *(_DWORD *)&v223[3];
          v5->_featureInfo[155].requirement = 1006;
          v5->_featureInfo[196].name = (NSString *)CFSTR("Stack Overflow, maximum call stack depth exceeded");
          *((_DWORD *)&v5->_featureInfo[196].supported + 1) = *(_DWORD *)&v222[3];
          v5->_featureInfo[156].requirement = 1006;
          v5->_featureInfo[197].name = (NSString *)CFSTR("Ray tracing from indirect command buffers");
          *((_DWORD *)&v5->_featureInfo[197].supported + 1) = *(_DWORD *)&v221[3];
          v5->_featureInfo[157].requirement = 1006;
          v5->_featureInfo[198].name = (NSString *)CFSTR("Performance State Assertion");
          *((_DWORD *)&v5->_featureInfo[198].supported + 1) = *(_DWORD *)&v220[3];
          v5->_featureInfo[199].name = (NSString *)CFSTR("Explicit visibility groups");
          *((_DWORD *)&v5->_featureInfo[199].supported + 1) = *(_DWORD *)&v219[3];
          v5->_featureInfo[200].name = (NSString *)CFSTR("Ray Tracing Matrix Layout");
          *((_DWORD *)&v5->_featureInfo[200].supported + 1) = *(_DWORD *)&v218[3];
          v5->_featureInfo[201].name = (NSString *)CFSTR("Direct access to ray tracing intersection result state");
          *((_DWORD *)&v5->_featureInfo[201].supported + 1) = *(_DWORD *)&v217[3];
          v5->_featureInfo[202].name = (NSString *)CFSTR("Ray tracing per-component motion transform interpolation");
          v5->_featureInfo[188].requirement = 1009;
          v5->_featureInfo[189].requirement = 1009;
          v5->_featureInfo[193].requirement = 1009;
          v5->_featureInfo[194].requirement = 1009;
          v5->_featureInfo[195].requirement = 1009;
          v5->_featureInfo[200].requirement = 1009;
          v5->_featureInfo[201].requirement = 1009;
          v5->_featureInfo[202].requirement = 1009;
          *((_DWORD *)&v5->_featureInfo[202].supported + 1) = *(_DWORD *)&v216[3];
          v5->_featureInfo[203].name = (NSString *)CFSTR("Extended Sampler LOD Bias Range");
          *((_DWORD *)&v5->_featureInfo[203].supported + 1) = *(_DWORD *)&v215[3];
          v5->_featureInfo[204].name = (NSString *)CFSTR("Device scoped memory coherency for buffers and textures");
          v5->_featureInfo[158].requirement = 1006;
          v5->_featureInfo[159].requirement = 1006;
          v5->_featureInfo[191].requirement = 1006;
          v5->_featureInfo[197].requirement = 1006;
          v5->_featureInfo[204].requirement = 1006;
          *((_DWORD *)&v5->_featureInfo[204].supported + 1) = *(_DWORD *)&v214[3];
          v5->_featureInfo[62].requirement = 0;
          v5->_featureInfo[153].requirement = 0;
          v5->_featureInfo[169].requirement = 0;
          v5->_featureInfo[170].requirement = 0;
          v5->_featureInfo[174].requirement = 0;
          v5->_featureInfo[181].requirement = 0;
          v5->_featureInfo[187].requirement = 0;
          v5->_featureInfo[190].requirement = 0;
          v5->_featureInfo[196].requirement = 0;
          v5->_featureInfo[198].requirement = 0;
          v5->_featureInfo[199].requirement = 0;
          v5->_featureInfo[203].requirement = 0;
          return v5;
        }
        v7 = 0;
      }
    }
    else if ((unint64_t)v6 > 0xB || ((1 << v6) & 0xFF3) == 0)
    {
      goto LABEL_13;
    }
    v5->isAGX = v7;
    goto LABEL_13;
  }
  return v5;
}

- (BOOL)familySupportsSharedStorageHeapResources
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsRenderPassWithoutRenderTarget
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsSeparateVisibilityAndShadingRate
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsSeparateDepthStencil
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsTextureCubeArray
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsTessellation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsReadWriteTextureCubeArguments
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsProgrammableBlending
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsNonUniformThreadgroupSize
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsMSAAStencilResolve
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsMSAADepthResolve
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsLayeredRendering
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsDepthClipMode
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsBaseVertexInstanceDrawing
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsSIMDShuffleAndFill
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1008);
}

- (BOOL)familySupports32BitFloatFiltering
{
  return -[MTLDeviceSPI isFloat32FilteringSupported](self->_device, "isFloat32FilteringSupported");
}

- (BOOL)familySupportsSIMDShufflesAndBroadcast
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsSIMDReduction
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsQuadShufflesAndBroadcast
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsNorm16BCubicFiltering
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsFloat16BCubicFiltering
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsConditionalLoadStore
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsCommandBufferJump
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsArrayOfTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsBinaryArchives
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsYCBCRPackedFormats12
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsYCBCRFormats12
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsTileShaders
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsSIMDGroup
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRasterOrderGroups
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsNativeHardwareFP16
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsBufferlessClientStorageTexture
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsComputeMemoryBarrier
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsRenderMemoryBarrier
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsPartialRenderMemoryBarrier
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsArgumentBuffersTier2
{
  return -[MTLDeviceSPI argumentBuffersSupport](self->_device, "argumentBuffersSupport") == 1;
}

- (BOOL)familySupportsStreamingCodecSignaling
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsProgrammableSamplePositions
{
  return -[MTLDeviceSPI areProgrammableSamplePositionsSupported](self->_device, "areProgrammableSamplePositionsSupported");
}

- (BOOL)familySupportsLargeFramebufferConfigs
{
  return -[MTLDeviceSPI isLargeMRTSupported](self->_device, "isLargeMRTSupported");
}

- (BOOL)familySupportsCustomBorderColor
{
  return -[MTLDeviceSPI isCustomBorderColorSupported](self->_device, "isCustomBorderColorSupported");
}

- (BOOL)familySupportsSamplerAddressModeClampToHalfBorder
{
  return -[MTLDeviceSPI isClampToHalfBorderSupported](self->_device, "isClampToHalfBorderSupported");
}

- (BOOL)familySupportsBCTextureCompression
{
  return -[MTLDeviceSPI isBCTextureCompressionSupported](self->_device, "isBCTextureCompressionSupported");
}

- (BOOL)familySupports3DBCTextures
{
  return -[MTLDeviceSPI isBCTextureCompressionSupported](self->_device, "isBCTextureCompressionSupported");
}

- (BOOL)familySupportsRGBA10A2Gamma
{
  return -[MTLDeviceSPI isRGB10A2GammaSupported](self->_device, "isRGB10A2GammaSupported");
}

- (BOOL)familySupportsBGR10A2
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsPrimitiveRestartOverride
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsGlobalVariableRelocation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsGlobalVariableRelocationRender
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsTLS
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsGlobalVariableBindings
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsGlobalVariableBindingInDylibs
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupports32bpcMSAATextures
{
  return -[MTLDeviceSPI isMsaa32bSupported](self->_device, "isMsaa32bSupported");
}

- (BOOL)familySupports32BitMSAA
{
  return -[MTLDeviceSPI isMsaa32bSupported](self->_device, "isMsaa32bSupported");
}

- (BOOL)familySupportsQueryTextureLOD
{
  return 0;
}

- (BOOL)familySupportsVertexAmplification
{
  return -[MTLDeviceSPI supportsVertexAmplificationCount:](self->_device, "supportsVertexAmplificationCount:", 2);
}

- (BOOL)familySupportsPlacementHeaps
{
  return -[MTLDeviceSPI isPlacementHeapSupported](self->_device, "isPlacementHeapSupported");
}

- (BOOL)familySupportsOpenCLTextureWriteSwizzles
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsPullModelInterpolation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsInt64
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsFixedLinePointFillDepthGradient
{
  return -[MTLDeviceSPI isFixedLinePointFillDepthGradientSupported](self->_device, "isFixedLinePointFillDepthGradientSupported");
}

- (BOOL)familySupportsLateEvalEvent
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsNonZeroTextureWriteLOD
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsSharedTextureHandles
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsBufferPrefetchStatistics
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsLimitedYUVFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsSharedStorageTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsLinearTextureFromSharedBuffer
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsPipelineLibraries
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsFragmentOnlyEncoders
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsBufferWithIOSurface
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsRenderToLinearTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsMemorylessRenderTargets
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsFastMathInfNaNPropagation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsInvariantVertexPosition
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsShaderLODAverage
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsRelaxedTextureViewRequirements
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsGPUStatistics
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsCompressedTextureViewSPI
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsRenderTargetTextureRotation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsDynamicControlPointCount
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsIABHashForTools
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsBinaryLibraries
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsDeadlineProfile
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsFillTexture
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1001);
}

- (BOOL)familySupportsSetThreadgroupPackingDisabled
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsASTCTextureCompression
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsExtendedYUVFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsPublicXR10Formats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsSRGBwrites
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsResourceHeaps
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsArgumentBuffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1002);
}

- (BOOL)familySupportsPacked32TextureBufferWrites
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupports3DASTCTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsFragmentBufferWrites
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsCountingOcclusionQuery
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsIndirectDrawAndDispatch
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsReadWriteBufferArguments
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsArrayOfSamplers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsCombinedMSAAStoreAndResolveAction
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsMutableTier1ArgumentBuffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsSamplerCompareFunction
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsMSAADepthResolveFilter
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsGFXIndirectCommandBuffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsCMPIndirectCommandBuffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsIndirectStageInRegion
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsIndirectTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsTextureOutOfBoundsReads
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1003);
}

- (BOOL)familySupportsAlphaYUVFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsMemoryOrderAtomics
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsQuadGroup
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsRenderTextureWrites
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsImageBlocks
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsImageBlockSampleCoverageControl
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsPostDepthCoverage
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsMipLevelsSmallerThanBlockSize
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsReadWriteTextureArguments
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsConcurrentComputeDispatch
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsRasterOrderGroupsColorAttachment
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsDynamicAttributeStride
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1004);
}

- (BOOL)familySupportsLinearTexture2DArray
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsNonSquareTileShaders
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupports2DLinearTexArraySPI
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsViewportAndScissorArray
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsIndirectTessellation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsMSAAStencilResolveFilter
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsStencilFeedback
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsFP32TessFactors
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsExtendedVertexFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsResourceDetachBacking
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsBufferWithAddressRanges
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsHeapWithAddressRanges
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1005);
}

- (BOOL)familySupportsShaderMinLODClamp
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsWritableArrayOfTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsVariableRateRasterization
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsYCBCRFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsYCBCRFormatsPQ
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsYCBCRFormatsXR
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsASTCHDRTextureCompression
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsSparseTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsSparseHeaps
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsIndirectWritableTextures
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsFunctionPointers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsDynamicLibraries
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsStatefulDynamicLibraries
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRenderDynamicLibraries
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsFunctionPointersFromRender
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsSharedFunctionTables
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRaytracingFromRender
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsPrimitiveMotionBlur
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingExtendedVertexFormats
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsHeapAccelerationStructureAllocation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingPerPrimitiveData
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingTraversalMetrics
{
  MTLDeviceSPI *device;
  int v3;

  device = self->_device;
  v3 = -[MTLDeviceSPI supportsRaytracing](device, "supportsRaytracing");
  if (v3)
    LOBYTE(v3) = -[MTLDeviceSPI requiresRaytracingEmulation](device, "requiresRaytracingEmulation");
  return v3;
}

- (BOOL)familySupportsRayTracingBuffersFromTables
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingAccelerationStructureCPUDeserialization
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingMultiLevelInstancing
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingGPUTableUpdateBuffers
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsRayTracingCurves
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsShaderBarycentricCoordinates
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsBlackOrWhiteSamplerBorderColors
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsMirrorClampToEdgeSamplerMode
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsDepthClipModeClampExtended
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsTexture2DMultisampleArray
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsForceSeamsOnCubemaps
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsFloat16InfNanFiltering
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsRTZRounding
{
  return -[MTLDeviceSPI isRTZRoundingSupported](self->_device, "isRTZRoundingSupported");
}

- (BOOL)familySupportsAnisoSampleFix
{
  return -[MTLDeviceSPI isAnisoSampleFixSupported](self->_device, "isAnisoSampleFixSupported");
}

- (BOOL)familySupportsYCBCRPackedFormatsPQ
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsYCBCRPackedFormatsXR
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsBufferBoundsChecking
{
  return 0;
}

- (BOOL)familySupportsForkJoin
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsDevicePartitioning
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsComputeCompressedTextureWrite
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsSIMDGroupMatrix
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsInterchangeTiled
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsQuadReduction
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1007);
}

- (BOOL)familySupportsVirtualSubstreams
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsBfloat16Format
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1008);
}

- (BOOL)familySupportsSparseDepthAttachments
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1008);
}

- (BOOL)familySupportsAtomicUlongVoidMinMax
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1008);
}

- (BOOL)familySupportsMeshShaders
{
  return 0;
}

- (BOOL)familySupportsFunctionPointersFromMesh
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsMeshShadersInICB
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsMeshRenderDynamicLibraries
{
  return 0;
}

- (BOOL)familySupportsColorSpaceConversionMatrixSelection
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsPerPlaneCompression
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsStackOverflowErrorCode
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsRayTracingICBs
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (BOOL)familySupportsPerformanceStateAssertion
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsExplicitVisibilityGroups
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsRayTracingMatrixLayout
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsRayTracingDirectIntersectionResultAccess
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsRayTracingPerComponentMotionInterpolation
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1009);
}

- (BOOL)familySupportsExtendedSamplerLODBiasRange
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 0);
}

- (BOOL)familySupportsDeviceCoherency
{
  return -[MTLDeviceSPI supportsFamily:](self->_device, "supportsFamily:", 1006);
}

- (int64_t)requirementForFeature:(int64_t)a3
{
  if (a3 > 204)
    return 0;
  else
    return self->_featureInfo[a3].requirement;
}

- (BOOL)supportForFeature:(int64_t)a3
{
  return a3 <= 204 && self->_featureInfo[a3].supported;
}

- (id)nameForFeature:(int64_t)a3
{
  if (a3 > 204)
    return 0;
  else
    return self->_featureInfo[a3].name;
}

@end
