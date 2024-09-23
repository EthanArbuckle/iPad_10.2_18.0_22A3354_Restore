@implementation PanoramaStitchingStage

- (PanoramaStitchingStage)initWithContext:(id)a3
{
  id v5;
  PanoramaStitchingStage *v6;
  PanoramaStitchingStage *v7;
  PanoramaStitchingShaders *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  PanoramaStitchingShaders *shaders;
  PanoramaStitchingStage *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PanoramaStitchingStage;
  v6 = -[PanoramaStitchingStage init](&v15, sel_init);
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [PanoramaStitchingShaders alloc],
        v11 = objc_msgSend_initWithContext_(v8, v9, (uint64_t)v5, v10),
        shaders = v7->_shaders,
        v7->_shaders = (PanoramaStitchingShaders *)v11,
        shaders,
        v7->_shaders))
  {
    v7->_direction = 1;
    v7->_isReadyToProcess = 0;
    v13 = v7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (uint64_t)_centralStitchAddSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:(int)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v57;
  uint64_t v58;
  _QWORD v59[3];
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  int v65;
  int v66;
  simd_float3x3 v67;

  v65 = *(_DWORD *)(a1 + 80);
  v66 = a5;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  v67 = __invert_f3(a2);
  DWORD2(v62) = v67.columns[0].i32[2];
  DWORD2(v63) = v67.columns[1].i32[2];
  *(_QWORD *)&v62 = v67.columns[0].i64[0];
  *(_QWORD *)&v63 = v67.columns[1].i64[0];
  DWORD2(v64) = v67.columns[2].i32[2];
  *(_QWORD *)&v64 = v67.columns[2].i64[0];
  objc_msgSend_commandQueue(*(void **)(a1 + 8), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandBuffer(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setLabel_(v14, v15, (uint64_t)CFSTR("Panorama:StitchingStage:_centralStitchAddSlice"), v16);
  objc_msgSend_computeCommandEncoder(v14, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_computeCentralStitchingMask(*(void **)(a1 + 16), v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  getThreadgroupSizeForShader(v24, (unint64_t *)&v60);

  objc_msgSend_computeCentralStitchingMask(*(void **)(a1 + 16), v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v20, v29, (uint64_t)v28, v30);

  objc_msgSend_setTexture_atIndex_(v20, v31, *(_QWORD *)(a1 + 120), 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v32, (uint64_t)&v66, 4, 0);
  objc_msgSend_setBytes_length_atIndex_(v20, v33, (uint64_t)&v65, 4, 1);
  objc_msgSend_setBytes_length_atIndex_(v20, v34, (uint64_t)&v62, 48, 2);
  v38 = objc_msgSend_width(*(void **)(a1 + 120), v35, v36, v37);
  v42 = objc_msgSend_height(*(void **)(a1 + 120), v39, v40, v41);
  v59[0] = v38;
  v59[1] = v42;
  v59[2] = 1;
  v57 = v60;
  v58 = v61;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v20, v43, (uint64_t)v59, (uint64_t)&v57);
  objc_msgSend_endEncoding(v20, v44, v45, v46);
  objc_msgSend_commit(v14, v47, v48, v49);
  switch(a5)
  {
    case 0:
      if (*(_DWORD *)(a1 + 80) != 1)
        goto LABEL_6;
      break;
    case 1:
      v50 = 0x3FDF5C28F5C28F5CLL;
      goto LABEL_7;
    case 2:
      if (*(_DWORD *)(a1 + 80) == 2)
      {
LABEL_6:
        v50 = 0x3FE0000000000000;
LABEL_7:
        *(_QWORD *)(a1 + 136) = v50;
      }
      break;
    case 3:
      *(_QWORD *)(a1 + 136) = 0;
      *(_QWORD *)(a1 + 144) = 0;
      break;
    default:
      break;
  }
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a1 + 152) = _Q0;

  return 0;
}

- (uint64_t)_seamStitchAddSlice:(uint64_t)a3 sliceHomography:(int)a4 sliceType:(__n128)a5
{
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  id v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  _BYTE v181[48];
  _QWORD v182[3];
  _QWORD v183[3];
  __int128 v184;
  uint64_t v185;
  __int128 v186;
  uint64_t v187;
  __int128 v188;
  uint64_t v189;
  __int128 v190;
  uint64_t v191;
  __int128 v192;
  uint64_t v193;
  _QWORD v194[3];
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD v198[3];
  __int128 v199;
  uint64_t v200;
  int v201;
  simd_float3x3 v202;

  *(__n128 *)&v181[16] = a6;
  *(__n128 *)&v181[32] = a7;
  *(__n128 *)v181 = a5;
  v201 = *(_DWORD *)(a1 + 80);
  v199 = 0uLL;
  v200 = 0;
  v10 = 3;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), a2, a3, 10, 3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v10 = 3;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(*(void **)(a1 + 8), v11, a3, 30, 3, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend_commandQueue(*(void **)(a1 + 8), v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_commandBuffer(v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setLabel_(v21, v22, (uint64_t)CFSTR("Panorama:StitchingStage:_seamStitchAddSlice"), v23);
      objc_msgSend_computeCommandEncoder(v21, v24, v25, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 1)
      {
        v196 = 0u;
        v197 = 0u;
        v195 = 0u;
        v202 = __invert_f3(*(simd_float3x3 *)v181);
        DWORD2(v195) = v202.columns[0].i32[2];
        DWORD2(v196) = v202.columns[1].i32[2];
        *(_QWORD *)&v195 = v202.columns[0].i64[0];
        *(_QWORD *)&v196 = v202.columns[1].i64[0];
        DWORD2(v197) = v202.columns[2].i32[2];
        *(_QWORD *)&v197 = v202.columns[2].i64[0];
        objc_msgSend_computeSeamCost(*(void **)(a1 + 16), v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        getThreadgroupSizeForShader(v56, (unint64_t *)&v199);

        objc_msgSend_computeSeamCost(*(void **)(a1 + 16), v57, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v30, v61, (uint64_t)v60, v62);

        objc_msgSend_setTexture_atIndex_(v30, v63, *(_QWORD *)(a1 + 24), 0);
        objc_msgSend_setTexture_atIndex_(v30, v64, *(_QWORD *)(a1 + 32), 1);
        objc_msgSend_setTexture_atIndex_(v30, v65, (uint64_t)v12, 2);
        objc_msgSend_setTexture_atIndex_(v30, v66, (uint64_t)v16, 3);
        objc_msgSend_setTexture_atIndex_(v30, v67, *(_QWORD *)(a1 + 72), 4);
        objc_msgSend_setTexture_atIndex_(v30, v68, *(_QWORD *)(a1 + 128), 5);
        objc_msgSend_setBytes_length_atIndex_(v30, v69, (uint64_t)&v195, 48, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v70, (uint64_t)&v201, 4, 1);
        v194[0] = objc_msgSend_width(v16, v71, v72, v73);
        v194[1] = objc_msgSend_height(v16, v74, v75, v76);
        v194[2] = 1;
        v192 = v199;
        v193 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v77, (uint64_t)v194, (uint64_t)&v192);
        objc_msgSend_seamCutDescend(*(void **)(a1 + 16), v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v30, v82, (uint64_t)v81, v83);

        objc_msgSend_setTexture_atIndex_(v30, v84, *(_QWORD *)(a1 + 72), 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v85, (uint64_t)&v201, 4, 0);
        v190 = xmmword_22764C640;
        v191 = 1;
        v188 = xmmword_22764C640;
        v189 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v86, (uint64_t)&v190, (uint64_t)&v188);
        objc_msgSend_seamCutAscend(*(void **)(a1 + 16), v87, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v30, v91, (uint64_t)v90, v92);

        objc_msgSend_setTexture_atIndex_(v30, v93, *(_QWORD *)(a1 + 72), 0);
        objc_msgSend_setTexture_atIndex_(v30, v94, *(_QWORD *)(a1 + 120), 1);
        objc_msgSend_setBytes_length_atIndex_(v30, v95, (uint64_t)&v201, 4, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v96, (uint64_t)&v195, 48, 1);
        v186 = xmmword_22764C640;
        v187 = 1;
        v184 = xmmword_22764C640;
        v185 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v97, (uint64_t)&v186, (uint64_t)&v184);
        objc_msgSend_initializeSeamPreviousSliceWithMask(*(void **)(a1 + 16), v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        getThreadgroupSizeForShader(v101, (unint64_t *)&v192);
        v199 = v192;
        v200 = v193;

        objc_msgSend_initializeSeamPreviousSliceWithMask(*(void **)(a1 + 16), v102, v103, v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v30, v106, (uint64_t)v105, v107);

        objc_msgSend_setTexture_atIndex_(v30, v108, (uint64_t)v12, 0);
        objc_msgSend_setTexture_atIndex_(v30, v109, (uint64_t)v16, 1);
        objc_msgSend_setTexture_atIndex_(v30, v110, *(_QWORD *)(a1 + 120), 2);
        objc_msgSend_setTexture_atIndex_(v30, v111, *(_QWORD *)(a1 + 24), 3);
        objc_msgSend_setTexture_atIndex_(v30, v112, *(_QWORD *)(a1 + 32), 4);
        objc_msgSend_setTexture_atIndex_(v30, v113, *(_QWORD *)(a1 + 40), 5);
        objc_msgSend_setTexture_atIndex_(v30, v114, *(_QWORD *)(a1 + 48), 6);
        objc_msgSend_setTexture_atIndex_(v30, v115, *(_QWORD *)(a1 + 56), 7);
        objc_msgSend_setTexture_atIndex_(v30, v116, *(_QWORD *)(a1 + 64), 8);
        objc_msgSend_setBytes_length_atIndex_(v30, v117, (uint64_t)&v195, 48, 0);
        objc_msgSend_setBytes_length_atIndex_(v30, v118, (uint64_t)&v201, 4, 1);
        v183[0] = objc_msgSend_width(v16, v119, v120, v121);
        v183[1] = objc_msgSend_height(v16, v122, v123, v124);
        v183[2] = 1;
        v192 = v199;
        v193 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v125, (uint64_t)v183, (uint64_t)&v192);
        v126 = *(id *)(a1 + 24);
        objc_storeStrong((id *)(a1 + 24), *(id *)(a1 + 40));
        v127 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v126;
        v128 = v126;

        v129 = *(id *)(a1 + 32);
        objc_storeStrong((id *)(a1 + 32), *(id *)(a1 + 48));
        v130 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v129;

      }
      else if (!a4)
      {
        v31 = objc_msgSend__centralStitchAddSlice_sliceHomography_sliceType_((void *)a1, v27, a3, 3, *(double *)v181, *(double *)&v181[16], *(double *)&v181[32]);
        if ((_DWORD)v31)
        {
          v10 = v31;
          goto LABEL_9;
        }
        objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        getThreadgroupSizeForShader(v35, (unint64_t *)&v199);

        objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setComputePipelineState_(v30, v40, (uint64_t)v39, v41);

        objc_msgSend_setTexture_atIndex_(v30, v42, (uint64_t)v12, 0);
        objc_msgSend_setTexture_atIndex_(v30, v43, (uint64_t)v16, 1);
        objc_msgSend_setTexture_atIndex_(v30, v44, *(_QWORD *)(a1 + 24), 2);
        objc_msgSend_setTexture_atIndex_(v30, v45, *(_QWORD *)(a1 + 32), 3);
        v198[0] = objc_msgSend_width(v16, v46, v47, v48);
        v198[1] = objc_msgSend_height(v16, v49, v50, v51);
        v198[2] = 1;
        v195 = v199;
        *(_QWORD *)&v196 = v200;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v52, (uint64_t)v198, (uint64_t)&v195);
      }
      objc_msgSend_endEncoding(v30, v27, v28, v29);
      objc_msgSend_commit(v21, v131, v132, v133);
      objc_msgSend_commandQueue(*(void **)(a1 + 8), v134, v135, v136);
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_commandBuffer(v137, v138, v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_setLabel_(v141, v142, (uint64_t)CFSTR("Panorama:StitchingStage:initializeSeamPreviousSlice"), v143);
      objc_msgSend_computeCommandEncoder(v141, v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      getThreadgroupSizeForShader(v151, (unint64_t *)&v195);
      v199 = v195;
      v200 = v196;

      objc_msgSend_initializeSeamPreviousSlice(*(void **)(a1 + 16), v152, v153, v154);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setComputePipelineState_(v147, v156, (uint64_t)v155, v157);

      objc_msgSend_setTexture_atIndex_(v147, v158, (uint64_t)v12, 0);
      objc_msgSend_setTexture_atIndex_(v147, v159, (uint64_t)v16, 1);
      objc_msgSend_setTexture_atIndex_(v147, v160, *(_QWORD *)(a1 + 56), 2);
      objc_msgSend_setTexture_atIndex_(v147, v161, *(_QWORD *)(a1 + 64), 3);
      v182[0] = objc_msgSend_width(v16, v162, v163, v164);
      v182[1] = objc_msgSend_height(v16, v165, v166, v167);
      v182[2] = 1;
      v195 = v199;
      *(_QWORD *)&v196 = v200;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v147, v168, (uint64_t)v182, (uint64_t)&v195);
      objc_msgSend_endEncoding(v147, v169, v170, v171);
      objc_msgSend_commit(v141, v172, v173, v174);
      v10 = 0;
      *(_QWORD *)(a1 + 136) = 0;
      *(_QWORD *)(a1 + 144) = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(a1 + 152) = _Q0;
      v30 = v147;
      v21 = v141;
    }
    else
    {
      v30 = 0;
      v21 = 0;
    }
  }
  else
  {
    v16 = 0;
    v30 = 0;
    v21 = 0;
  }
LABEL_9:

  return v10;
}

- (uint64_t)addSlice:(uint64_t)a3 sliceHomography:(uint64_t)a4 sliceType:
{
  int v4;

  if (!*(_BYTE *)(a1 + 84))
    return 2;
  v4 = *(_DWORD *)(a1 + 88);
  if (v4 != 1)
  {
    if (!v4)
      return objc_msgSend__centralStitchAddSlice_sliceHomography_sliceType_((void *)a1, a2, a3, a4);
    return 2;
  }
  return MEMORY[0x24BEDD108](a1, sel__seamStitchAddSlice_sliceHomography_sliceType_, a3, a4);
}

- (int)prepareToProcessSliceWidth:(unint64_t)a3 sliceHeight:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  MTLTexture *v18;
  MTLTexture *stitchingMask;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  MTLTexture *v30;
  MTLTexture *seamStagingLuma;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  MTLTexture *v38;
  MTLTexture *seamStagingLumaDst;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  MTLTexture *v46;
  MTLTexture *prevLuma;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  MTLTexture *v57;
  MTLTexture *seamStagingChroma;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  MTLTexture *v65;
  MTLTexture *seamStagingChromaDst;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  MTLTexture *v73;
  MTLTexture *prevChroma;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  MTLTexture *v85;
  MTLTexture *seamCost;
  int v87;

  v7 = a3 >> 1;
  v8 = a4 >> 1;
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], a2, 25, a3 >> 1, a4 >> 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsage_(v9, v10, 3, v11);
  objc_msgSend_device(self->_metal, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v15, v16, (uint64_t)v9, v17);
  stitchingMask = self->_stitchingMask;
  self->_stitchingMask = v18;

  if (!self->_stitchingMask)
    goto LABEL_12;
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v20, 25, a3, a4, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v21, v22, 3, v23);
  objc_msgSend_device(self->_metal, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v27, v28, (uint64_t)v21, v29);
  seamStagingLuma = self->_seamStagingLuma;
  self->_seamStagingLuma = v30;

  if (!self->_seamStagingLuma)
    goto LABEL_13;
  objc_msgSend_device(self->_metal, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v35, v36, (uint64_t)v21, v37);
  seamStagingLumaDst = self->_seamStagingLumaDst;
  self->_seamStagingLumaDst = v38;

  if (!self->_seamStagingLumaDst
    || (objc_msgSend_device(self->_metal, v40, v41, v42),
        v43 = (void *)objc_claimAutoreleasedReturnValue(),
        v46 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v43, v44, (uint64_t)v21, v45),
        prevLuma = self->_prevLuma,
        self->_prevLuma = v46,
        prevLuma,
        v43,
        !self->_prevLuma))
  {
LABEL_13:
    v87 = 2;
    v9 = v21;
    goto LABEL_11;
  }
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v48, 65, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v9, v49, 3, v50);
  objc_msgSend_device(self->_metal, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v54, v55, (uint64_t)v9, v56);
  seamStagingChroma = self->_seamStagingChroma;
  self->_seamStagingChroma = v57;

  if (!self->_seamStagingChroma)
    goto LABEL_12;
  objc_msgSend_device(self->_metal, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v62, v63, (uint64_t)v9, v64);
  seamStagingChromaDst = self->_seamStagingChromaDst;
  self->_seamStagingChromaDst = v65;

  if (!self->_seamStagingChromaDst)
    goto LABEL_12;
  objc_msgSend_device(self->_metal, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v70, v71, (uint64_t)v9, v72);
  prevChroma = self->_prevChroma;
  self->_prevChroma = v73;

  if (self->_prevChroma)
  {
    objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v75, 25, v7, v8, 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setUsage_(v76, v77, 3, v78);
    objc_msgSend_device(self->_metal, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v82, v83, (uint64_t)v76, v84);
    seamCost = self->_seamCost;
    self->_seamCost = v85;

    if (self->_seamCost)
    {
      v87 = 0;
      self->_isReadyToProcess = 1;
    }
    else
    {
      v87 = 2;
    }
    v9 = v76;
  }
  else
  {
LABEL_12:
    v87 = 2;
  }
LABEL_11:

  return v87;
}

- (int)prewarm
{
  return 0;
}

- (int)process
{
  return 0;
}

- (int)purgeResources
{
  return 0;
}

- (int)finishProcessing
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)setDirection:(int)a3
{
  self->_direction = a3;
  return 0;
}

- (int)setup
{
  return 0;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->cameraInfoByPortType, a3);
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->metalCommandQueue, a3);
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->tuningParameters, a3);
}

- (MTLTexture)stitchingMask
{
  return self->_stitchingMask;
}

- (CGRect)roi
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_roi.origin.x;
  y = self->_roi.origin.y;
  width = self->_roi.size.width;
  height = self->_roi.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isReadyToProcess
{
  return self->_isReadyToProcess;
}

- (void)setIsReadyToProcess:(BOOL)a3
{
  self->_isReadyToProcess = a3;
}

- (int)stitchingMode
{
  return self->_stitchingMode;
}

- (void)setStitchingMode:(int)a3
{
  self->_stitchingMode = a3;
}

- (MTLTexture)motionMask
{
  return self->_motionMask;
}

- (void)setMotionMask:(id)a3
{
  objc_storeStrong((id *)&self->_motionMask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionMask, 0);
  objc_storeStrong((id *)&self->_stitchingMask, 0);
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->metalCommandQueue, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_seamCost, 0);
  objc_storeStrong((id *)&self->_prevChroma, 0);
  objc_storeStrong((id *)&self->_prevLuma, 0);
  objc_storeStrong((id *)&self->_seamStagingChromaDst, 0);
  objc_storeStrong((id *)&self->_seamStagingLumaDst, 0);
  objc_storeStrong((id *)&self->_seamStagingChroma, 0);
  objc_storeStrong((id *)&self->_seamStagingLuma, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
