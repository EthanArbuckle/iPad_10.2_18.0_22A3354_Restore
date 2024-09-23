@implementation ARFaceTrackingData

+ (id)sharedNeutralGeometry
{
  if (+[ARFaceTrackingData sharedNeutralGeometry]::onceToken != -1)
    dispatch_once(&+[ARFaceTrackingData sharedNeutralGeometry]::onceToken, &__block_literal_global_17);
  return (id)+[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry;
}

void __43__ARFaceTrackingData_sharedNeutralGeometry__block_invoke()
{
  ARFaceGeometry *v0;
  uint64_t v1;
  void *v2;

  v0 = [ARFaceGeometry alloc];
  v1 = -[ARFaceGeometry initWithBlendShapes:](v0, "initWithBlendShapes:", MEMORY[0x1E0C9AA70]);
  v2 = (void *)+[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry;
  +[ARFaceTrackingData sharedNeutralGeometry]::neutralGeometry = v1;

}

- (id)initPrivate
{
  ARFaceTrackingData *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *normalsSemaphore;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *imageVerticesSemaphore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARFaceTrackingData;
  v2 = -[ARFaceTrackingData init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    normalsSemaphore = v2->_normalsSemaphore;
    v2->_normalsSemaphore = (OS_dispatch_semaphore *)v3;

    v5 = dispatch_semaphore_create(1);
    imageVerticesSemaphore = v2->_imageVerticesSemaphore;
    v2->_imageVerticesSemaphore = (OS_dispatch_semaphore *)v5;

  }
  return v2;
}

- (ARFaceTrackingData)initWithTrackingData:(id)a3 anchorIdentifier:(id)a4
{
  return -[ARFaceTrackingData initWithTrackingData:transformToMirrored:anchorIdentifier:](self, "initWithTrackingData:transformToMirrored:anchorIdentifier:", a3, 0, a4);
}

- (ARFaceTrackingData)initWithTrackingData:(id)a3 transformToMirrored:(BOOL)a4 anchorIdentifier:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id *v11;
  ARFaceTrackingData *v12;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = -[ARFaceTrackingData initPrivate](self, "initPrivate");
  v12 = (ARFaceTrackingData *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 28, a3);
    objc_storeStrong((id *)&v12->_anchorIdentifier, a5);
    -[ARFaceTrackingData _extractMetaDataAndTransformToMirrored:](v12, "_extractMetaDataAndTransformToMirrored:", v6);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  objc_storeStrong((id *)(v4 + 224), self->_trackingData);
  objc_storeStrong((id *)(v4 + 192), self->_anchorIdentifier);
  objc_storeStrong((id *)(v4 + 208), self->_trackingError);
  v5 = *(_OWORD *)self->_anon_70;
  v6 = *(_OWORD *)&self->_anon_70[16];
  v7 = *(_OWORD *)&self->_anon_70[48];
  *(_OWORD *)(v4 + 144) = *(_OWORD *)&self->_anon_70[32];
  *(_OWORD *)(v4 + 160) = v7;
  *(_OWORD *)(v4 + 112) = v5;
  *(_OWORD *)(v4 + 128) = v6;
  if ((ARFaceTrackingData *)v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)(v4 + 8), (char *)self->_meshVertices.var0, *(_QWORD *)self->_anon_10, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v4 + 80), (char *)self->_blendShapeCoefficients.__begin_, (uint64_t)self->_blendShapeCoefficients.__end_, self->_blendShapeCoefficients.__end_ - self->_blendShapeCoefficients.__begin_);
  }
  v8 = *(_OWORD *)self->_anon_100;
  v9 = *(_OWORD *)&self->_anon_100[16];
  v10 = *(_OWORD *)&self->_anon_100[48];
  *(_OWORD *)(v4 + 288) = *(_OWORD *)&self->_anon_100[32];
  *(_OWORD *)(v4 + 304) = v10;
  *(_OWORD *)(v4 + 256) = v8;
  *(_OWORD *)(v4 + 272) = v9;
  v11 = *(_OWORD *)&self[1].super.isa;
  v12 = *(_OWORD *)self[1]._anon_10;
  v13 = *(_OWORD *)&self[1]._anon_20[16];
  *(_OWORD *)(v4 + 352) = *(_OWORD *)self[1]._anon_20;
  *(_OWORD *)(v4 + 368) = v13;
  *(_OWORD *)(v4 + 320) = v11;
  *(_OWORD *)(v4 + 336) = v12;
  *(_OWORD *)(v4 + 240) = *(_OWORD *)self->_gazePoint;
  *(float *)(v4 + 200) = self->_tongueOut;
  *(double *)(v4 + 216) = self->_timestamp;
  return (id)v4;
}

- (BOOL)isValid
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  -[ARFaceTrackingData trackingData](self, "trackingData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CFCC98];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ARFaceTrackingData trackingData](self, "trackingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CFCCF8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCF8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[ARFaceTrackingData trackingData](self, "trackingData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0CFCD68];
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD68]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[ARFaceTrackingData trackingData](self, "trackingData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *MEMORY[0x1E0CFCD90];
        objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD90]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[ARFaceTrackingData trackingData](self, "trackingData");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD78]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_15;
          v22 = *MEMORY[0x1E0CFCD58];
          objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD58]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
            goto LABEL_15;
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v13);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            goto LABEL_15;
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            v28 = *MEMORY[0x1E0CFCD10];
            objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD10]);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v29)
              goto LABEL_15;
            objc_msgSend(v21, "objectForKeyedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD28]);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v27 = (void *)*MEMORY[0x1E0CFCC40];
              objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC40]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC48]);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v27) = v33 != 0;

                goto LABEL_16;
              }
LABEL_15:
              LOBYTE(v27) = 0;
            }
          }
LABEL_16:

          return (char)v27;
        }
      }
    }
  }
  LOBYTE(v27) = 0;
  return (char)v27;
}

- (void)_extractMetaDataAndTransformToMirrored:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSError *v15;
  void *v16;
  void *v17;
  NSError *trackingError;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  float32x4_t v31;
  __int128 v32;
  __float2 v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  __float2 v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  __float2 v43;
  float32x4_t v44;
  float32x4_t v45;
  uint64_t v46;
  __int128 v47;
  float32x4_t v48;
  uint64_t v49;
  unint64_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  __int128 v55;
  float32x4_t v56;
  float32x4_t v57;
  unint64_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  unint64_t v77;
  unint64_t v78;
  __int128 v79;
  float32x4_t v80;
  float32x4_t v81;
  uint64_t v82;
  void *v83;
  ARFaceTrackingData *v84;
  void *v85;
  unint64_t v86;
  uint64_t v87;
  float32x4_t v88;
  uint64_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float *v92;
  float32x4_t v93;
  float32x4_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  unint64_t v98;
  const void *v99;
  float *begin;
  vector<float, std::allocator<float>> *p_blendShapeCoefficients;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  float v112;
  float v113;
  void *v114;
  void *v115;
  float v116;
  float v117;
  __float2 v118;
  float32x4_t v119;
  float32x4_t v120;
  __int128 v121;
  float32x4_t v122;
  __float2 v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  float v137;
  float v138;
  void *v139;
  void *v140;
  float v141;
  float v142;
  __float2 v143;
  float32x4_t v144;
  float32x4_t v145;
  __int128 v146;
  float32x4_t v147;
  __float2 v148;
  float32x4_t v149;
  float32x4_t v150;
  float32x4_t v151;
  float32x4_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  float v165;
  uint64_t v166;
  void *v167;
  void *v168;
  double v169;
  float32x4_t v170;
  float32x2_t v171;
  float32x4_t v172;
  __int128 v173;
  float32x4_t v174;
  float32x4_t v175;
  __int128 v176;
  float32x4_t v177;
  float32x4_t v178;
  float32x4_t v179;
  float32x2_t v180;
  float32x4_t v181;
  __n128 v182;
  float32x4_t v183;
  float32x4_t v184;
  __n128 v185;
  id v186;
  __int128 v187;
  __int128 v188;
  id v189;
  void *v190;
  float32x4_t v191;
  uint64_t v192;
  float32x4_t v193;
  __int128 v194;
  float32x4_t v195;
  float32x4_t v196;
  float32x4_t v197;
  __int128 v198;
  float32x4_t v199;
  float32x4_t v200;

  v3 = a3;
  -[ARFaceTrackingData trackingData](self, "trackingData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFCD08];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD08]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ARFaceTrackingData trackingData](self, "trackingData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_opt_new();
    ARKitCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Face tracking failed."), &stru_1E6676798, CFSTR("Localizable_iOS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D50]);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);
    MEMORY[0x1B5E2CDF0](objc_msgSend(v10, "integerValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2D68]);
    }
    else
    {
      ARKitCoreBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("An unknown error occurred"), &stru_1E6676798, CFSTR("Localizable_iOS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB2D68]);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.arkit.error"), 1002, v11);
    v15 = (NSError *)objc_claimAutoreleasedReturnValue();
    trackingError = self->_trackingError;
    self->_trackingError = v15;

  }
  -[ARFaceTrackingData trackingData](self, "trackingData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD78]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = *MEMORY[0x1E0CFCD58];
    v190 = v20;
    objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD58]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CFCD68];
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD68]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ARMatrix3x3FromArray(v24);

    objc_msgSend(v20, "objectForKeyedSubscript:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0CFCD90];
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD90]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = (float32x2_t)ARVector3FromArray(v27).n128_u64[0];

    ARVector3ScalarMultiplication(v180, 0.001);
    ARMatrix4x4FromRotationAndTranslation();
    v187 = (__int128)v29;
    v191 = v31;
    if (v3)
    {
      *(double *)&v32 = AREulerAnglesFromMatrix(v28, v29, v30);
      v188 = v32;
      v33 = __sincosf_stret(-0.5 * *(float *)&v32);
      v34 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, v33.__sinval);
      v34.i32[3] = LODWORD(v33.__cosval);
      *(__n64 *)v35.f32 = simd_matrix3x3(v34);
      v181 = v36;
      v184 = v35;
      v177 = v37;
      v38 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)&v188, 1));
      v39 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v38.__sinval);
      v39.i32[3] = LODWORD(v38.__cosval);
      *(__n64 *)v40.f32 = simd_matrix3x3(v39);
      v172 = v41;
      v174 = v40;
      v170 = v42;
      v43 = __sincosf_stret((float)(*((float *)&v188 + 2) + 3.1416) * 0.5);
      v44 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFF70, v43.__sinval);
      v44.i32[3] = LODWORD(v43.__cosval);
      *(__n64 *)v45.f32 = simd_matrix3x3(v44);
      v46 = 0;
      v45.i32[3] = 0;
      HIDWORD(v47) = 0;
      v48.i32[3] = 0;
      v193 = v45;
      v194 = v47;
      v195 = v48;
      do
      {
        *(float32x4_t *)((char *)&v197 + v46 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v174, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v46 * 4))), v172, *(float32x2_t *)&v193.f32[v46], 1), v170, *(float32x4_t *)((char *)&v193 + v46 * 4), 2);
        v46 += 4;
      }
      while (v46 != 12);
      v49 = 0;
      v193 = v197;
      v194 = v198;
      v195 = v199;
      do
      {
        *(float32x4_t *)((char *)&v197 + v49 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v184, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v49 * 4))), v181, *(float32x2_t *)&v193.f32[v49], 1), v177, *(float32x4_t *)((char *)&v193 + v49 * 4), 2);
        v49 += 4;
      }
      while (v49 != 12);
      ARMatrix4x4FromRotationAndTranslation();
      v50 = 0;
      v51 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
      v52 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
      v53 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
      v193 = v54;
      v194 = v55;
      v195 = v56;
      v196 = v57;
      do
      {
        *(float32x4_t *)((char *)&v197 + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v50))), (float32x4_t)xmmword_1B3BE00E0, *(float32x2_t *)&v193.f32[v50 / 4], 1), v52, *(float32x4_t *)((char *)&v193 + v50), 2), v53, *(float32x4_t *)((char *)&v193 + v50), 3);
        v50 += 16;
      }
      while (v50 != 64);
      v58 = 0;
      v59 = v197;
      v60 = (float32x4_t)v198;
      v61 = v199;
      v62 = v200;
      v193 = v51;
      v194 = xmmword_1B3BE00E0;
      v195 = v52;
      v196 = v53;
      do
      {
        *(float32x4_t *)((char *)&v197 + v58) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v59, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v58))), v60, *(float32x2_t *)&v193.f32[v58 / 4], 1), v61, *(float32x4_t *)((char *)&v193 + v58), 2), v62, *(float32x4_t *)((char *)&v193 + v58), 3);
        v58 += 16;
      }
      while (v58 != 64);
      v187 = v198;
      v182 = (__n128)v197;
      v185 = (__n128)v199;
      v191 = v200;
    }
    else
    {
      v182 = v28;
      v185 = v30;
    }
    -[ARFaceTrackingData trackingData](self, "trackingData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0CFCC98];
    objc_msgSend(v63, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC98]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *MEMORY[0x1E0CFCCF8];
    objc_msgSend(v65, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCF8]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", v23);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    ARMatrix3x3FromArray(v68);

    -[ARFaceTrackingData trackingData](self, "trackingData");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKeyedSubscript:", v64);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "objectForKeyedSubscript:", v66);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "objectForKeyedSubscript:", v26);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (float32x2_t)ARVector3FromArray(v72).n128_u64[0];

    ARVector3ScalarMultiplication(v171, 0.001);
    ARMatrix4x4FromRotationAndTranslation();
    v77 = 0;
    v193 = (float32x4_t)v182;
    v194 = v187;
    v195 = (float32x4_t)v185;
    v196 = v191;
    do
    {
      *(float32x4_t *)((char *)&v197 + v77) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v77))), v74, *(float32x2_t *)&v193.f32[v77 / 4], 1), v75, *(float32x4_t *)((char *)&v193 + v77), 2), v76, *(float32x4_t *)((char *)&v193 + v77), 3);
      v77 += 16;
    }
    while (v77 != 64);
    v78 = 0;
    v193 = v197;
    v194 = v198;
    v195 = v199;
    v196 = v200;
    do
    {
      *(float32x4_t *)((char *)&v197 + v78) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v78))), (float32x4_t)xmmword_1B3BE00E0, *(float32x2_t *)&v193.f32[v78 / 4], 1), (float32x4_t)xmmword_1B3BDFDE0, *(float32x4_t *)((char *)&v193 + v78), 2), (float32x4_t)xmmword_1B3BDFD50, *(float32x4_t *)((char *)&v193 + v78), 3);
      v78 += 16;
    }
    while (v78 != 64);
    v79 = v198;
    v80 = v199;
    v81 = v200;
    *(float32x4_t *)self->_anon_70 = v197;
    *(_OWORD *)&self->_anon_70[16] = v79;
    *(float32x4_t *)&self->_anon_70[32] = v80;
    *(float32x4_t *)&self->_anon_70[48] = v81;
    v82 = *MEMORY[0x1E0CFCD10];
    objc_msgSend(v190, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD10]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = v82;
    v84 = self;
    objc_msgSend(v83, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD28]);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = (int)objc_msgSend(v85, "length");
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_meshVertices, (int)(v86 / 0xC));
    v189 = objc_retainAutorelease(v85);
    v87 = objc_msgSend(v189, "bytes");
    if ((int)(v86 / 0xC) >= 1)
    {
      v89 = 0;
      v91 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 16);
      v90 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32);
      v92 = (float *)(v87 + 4);
      do
      {
        v88.f32[0] = *(v92 - 1) / 1000.0;
        v93 = v88;
        v93.f32[1] = *v92 / 1000.0;
        v94 = v93;
        v94.f32[2] = v92[1] / 1000.0;
        if (v3)
        {
          v88 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B3BE00D0, v88.f32[0]), v91, *(float32x2_t *)v93.f32, 1), v90, v94, 2);
          v94 = v88;
        }
        *(float32x4_t *)&self->_meshVertices.var0[v89] = v94;
        v92 += 3;
        v89 += 2;
      }
      while (2 * (v86 / 0xC) != v89);
    }
    v95 = *MEMORY[0x1E0CFCC40];
    objc_msgSend(v190, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC40]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC48]);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = objc_msgSend(v97, "length", v97);
    v186 = objc_retainAutorelease(v97);
    v99 = (const void *)objc_msgSend(v186, "bytes");
    v197 = 0uLL;
    *(_QWORD *)&v198 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v197, v99, (uint64_t)v99 + ((uint64_t)(v98 >> 2 << 32) >> 30), (int)(v98 >> 2));
    p_blendShapeCoefficients = &v84->_blendShapeCoefficients;
    begin = v84->_blendShapeCoefficients.__begin_;
    if (begin)
    {
      v84->_blendShapeCoefficients.__end_ = begin;
      operator delete(begin);
      p_blendShapeCoefficients->__begin_ = 0;
      v84->_blendShapeCoefficients.__end_ = 0;
      v84->_blendShapeCoefficients.__end_cap_.__value_ = 0;
    }
    *(float32x4_t *)&v84->_blendShapeCoefficients.__begin_ = v197;
    v84->_blendShapeCoefficients.__end_cap_.__value_ = (float *)v198;
    if (v3)
    {
      +[ARFaceAnchor blendShapeToMirroredBlendShapeMapping](ARFaceAnchor, "blendShapeToMirroredBlendShapeMapping");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)(v98 >> 2) >= 1)
      {
        v103 = 0;
        v104 = (v98 >> 2);
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v103);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "objectForKeyedSubscript:", v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "integerValue");

          p_blendShapeCoefficients->__begin_[v107] = *((float *)v99 + v103++);
        }
        while (v104 != v103);
      }

    }
    v20 = v190;
    objc_msgSend(v190, "objectForKeyedSubscript:", v192);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD18]);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    ARVector3FromArray(v109);

    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC60]);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "floatValue");
    v113 = v112;

    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC58]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "floatValue");
    v117 = v116;

    v118 = __sincosf_stret(v113 * 0.5);
    v119 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v118.__sinval);
    v119.i32[3] = LODWORD(v118.__cosval);
    *(__n64 *)v120.f32 = simd_matrix3x3(v119);
    v120.i32[3] = 0;
    HIDWORD(v121) = 0;
    v173 = v121;
    v175 = v120;
    v122.i32[3] = 0;
    v178 = v122;
    v123 = __sincosf_stret(v117 * 0.5);
    v124 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, v123.__sinval);
    v124.i32[3] = LODWORD(v123.__cosval);
    *(__n64 *)v125.f32 = simd_matrix3x3(v124);
    v128 = 0;
    v193 = v175;
    v194 = v173;
    v195 = v178;
    do
    {
      *(float32x4_t *)((char *)&v197 + v128 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v128 * 4))), v126, *(float32x2_t *)&v193.f32[v128], 1), v127, *(float32x4_t *)((char *)&v193 + v128 * 4), 2);
      v128 += 4;
    }
    while (v128 != 12);
    ARMatrix4x4FromRotationAndTranslation();
    *(_OWORD *)v84->_anon_100 = v129;
    *(_OWORD *)&v84->_anon_100[16] = v130;
    *(_OWORD *)&v84->_anon_100[32] = v131;
    *(_OWORD *)&v84->_anon_100[48] = v132;
    objc_msgSend(v190, "objectForKeyedSubscript:", v192);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD20]);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    ARVector3FromArray(v134);

    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC70]);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "floatValue");
    v138 = v137;

    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC68]);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "floatValue");
    v142 = v141;

    v143 = __sincosf_stret(v138 * 0.5);
    v144 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDD0, v143.__sinval);
    v144.i32[3] = LODWORD(v143.__cosval);
    *(__n64 *)v145.f32 = simd_matrix3x3(v144);
    v145.i32[3] = 0;
    HIDWORD(v146) = 0;
    v176 = v146;
    v179 = v145;
    v147.i32[3] = 0;
    v183 = v147;
    v148 = __sincosf_stret(v142 * 0.5);
    v149 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFDC0, v148.__sinval);
    v149.i32[3] = LODWORD(v148.__cosval);
    *(__n64 *)v150.f32 = simd_matrix3x3(v149);
    v153 = 0;
    v193 = v179;
    v194 = v176;
    v195 = v183;
    do
    {
      *(float32x4_t *)((char *)&v197 + v153 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v150, COERCE_FLOAT(*(_OWORD *)((char *)&v193 + v153 * 4))), v151, *(float32x2_t *)&v193.f32[v153], 1), v152, *(float32x4_t *)((char *)&v193 + v153 * 4), 2);
      v153 += 4;
    }
    while (v153 != 12);
    ARMatrix4x4FromRotationAndTranslation();
    *(_OWORD *)&v84[1].super.isa = v154;
    *(_OWORD *)v84[1]._anon_10 = v155;
    *(_OWORD *)v84[1]._anon_20 = v156;
    *(_OWORD *)&v84[1]._anon_20[16] = v157;
    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC50]);
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v159, "count"))
      *(float32x4_t *)v84->_gazePoint = vdivq_f32((float32x4_t)ARVector3FromArray(v159), (float32x4_t)vdupq_n_s32(0x447A0000u));
    objc_msgSend(v190, "objectForKeyedSubscript:", v95);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v161 = *MEMORY[0x1E0CFCC78];
    objc_msgSend(v160, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC78]);
    v162 = (void *)objc_claimAutoreleasedReturnValue();

    if (v162)
    {
      objc_msgSend(v190, "objectForKeyedSubscript:", v95);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "objectForKeyedSubscript:", v161);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "floatValue");
      v84->_tongueOut = v165;

    }
    v166 = *MEMORY[0x1E0CFCD80];
    objc_msgSend(v190, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD80]);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (v167)
    {
      objc_msgSend(v190, "objectForKeyedSubscript:", v166);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "doubleValue");
      v84->_timestamp = v169;

    }
  }

}

- (NSUUID)identifier
{
  return self->_anchorIdentifier;
}

- (__n128)transform
{
  return a1[7];
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4;
}

- (uint64_t)vertices
{
  return *(_QWORD *)(a1 + 8);
}

- (unint64_t)blendShapeCoefficientsCount
{
  return self->_blendShapeCoefficients.__end_ - self->_blendShapeCoefficients.__begin_;
}

- (const)blendShapeCoefficients
{
  return self->_blendShapeCoefficients.__begin_;
}

- (unint64_t)normalCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_meshVertices.var0) >> 4;
}

- (uint64_t)normals
{
  void **v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  __int128 v20;
  uint64_t v21;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 176), 0xFFFFFFFFFFFFFFFFLL);
  v2 = (void **)(a1 + 56);
  if (*(_QWORD *)(a1 + 64) - *(_QWORD *)(a1 + 56) != *(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8))
  {
    kdebug_trace();
    +[ARFaceTrackingData sharedNeutralGeometry](ARFaceTrackingData, "sharedNeutralGeometry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "triangleIndices");
    v5 = objc_msgSend((id)a1, "vertices");
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v20, (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 4);
    v6 = *v2;
    if (*v2)
    {
      *(_QWORD *)(a1 + 64) = v6;
      operator delete(v6);
      *v2 = 0;
      *(_QWORD *)(a1 + 64) = 0;
      *(_QWORD *)(a1 + 72) = 0;
    }
    v7 = 0;
    v8 = 0;
    *(_OWORD *)(a1 + 56) = v20;
    *(_QWORD *)(a1 + 72) = v21;
    while (objc_msgSend(v3, "triangleCount") > v8)
    {
      v9 = *(__int16 *)(v4 + 2 * v7);
      v10 = *(__int16 *)(v4 + 2 * (v7 + 1));
      v11 = *(__int16 *)(v4 + 2 * (v7 + 2));
      v12 = *(float32x4_t *)(v5 + 16 * v9);
      v13 = vsubq_f32(*(float32x4_t *)(v5 + 16 * v10), v12);
      v14 = vsubq_f32(*(float32x4_t *)(v5 + 16 * v11), v12);
      v15 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v14, (int32x4_t)v14), (int8x16_t)v14, 0xCuLL), vnegq_f32(v13)), v14, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v13, (int32x4_t)v13), (int8x16_t)v13, 0xCuLL));
      v16 = (int32x4_t)vmulq_f32(v15, v15);
      v16.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), *(float32x2_t *)v16.i8)).u32[0];
      v17 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL);
      *(float32x2_t *)v15.f32 = vrsqrte_f32((float32x2_t)v16.u32[0]);
      *(float32x2_t *)v15.f32 = vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32)));
      v18 = vmulq_n_f32(v17, vmul_f32(*(float32x2_t *)v15.f32, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32))).f32[0]);
      *((float32x4_t *)*v2 + v9) = vaddq_f32(*((float32x4_t *)*v2 + v9), v18);
      *((float32x4_t *)*v2 + v10) = vaddq_f32(v18, *((float32x4_t *)*v2 + v10));
      *((float32x4_t *)*v2 + v11) = vaddq_f32(v18, *((float32x4_t *)*v2 + v11));
      ++v8;
      v7 += 3;
    }
    kdebug_trace();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 176));
  return *(_QWORD *)(a1 + 56);
}

- (uint64_t)imageVertices
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __n128 v23;
  float32x4_t v24;
  float32x4_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  unint64_t v45;
  uint64_t v46;
  int32x4_t v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  __n128 v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x2_t v56;
  __int128 v57;
  float32x4_t v58;
  __int128 v59;
  float32x4_t v60;
  __int128 v61;
  float32x4_t v62;
  __int128 v63;
  float32x4_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE buf[32];
  float32x4_t v70;
  float32x4_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 184), 0xFFFFFFFFFFFFFFFFLL);
  v2 = (_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32);
  if (objc_msgSend((id)a1, "vertexCount") == v3 >> 3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
    return *(_QWORD *)(a1 + 32);
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(buf, objc_msgSend((id)a1, "vertexCount"));
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      *(_QWORD *)(a1 + 40) = v5;
      operator delete(v5);
      *v2 = 0;
      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
    *(_OWORD *)(a1 + 32) = *(_OWORD *)buf;
    *(_QWORD *)(a1 + 48) = *(_QWORD *)&buf[16];
    objc_msgSend((id)a1, "trackingData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = *MEMORY[0x1E0CFCD58];
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD58]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0CFCD68];
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD68]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ARMatrix3x3FromArray(v11);

      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0CFCD90];
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD90]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (float32x2_t)ARVector3FromArray(v14).n128_u64[0];

      ARVector3ScalarMultiplication(v56, 0.001);
      ARMatrix4x4FromRotationAndTranslation();
      v57 = v16;
      v59 = v15;
      v61 = v18;
      v63 = v17;
      objc_msgSend((id)a1, "trackingData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CFCC98];
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC98]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCD30]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = ARMatrix3x3FromArray(v22);
      v54 = v24;
      v55 = (float32x4_t)v23;
      v53 = v25;

      objc_msgSend((id)a1, "trackingData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *MEMORY[0x1E0CFCCF8];
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCCF8]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v10);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ARMatrix3x3FromArray(v30);

      objc_msgSend((id)a1, "trackingData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v13);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = ARVector3FromArray(v34);

      ARVector3ScalarMultiplication((float32x2_t)v52.n128_u64[0], 0.001);
      ARMatrix4x4FromRotationAndTranslation();
      v35 = 0;
      v65 = v36;
      v66 = v37;
      v67 = v38;
      v68 = v39;
      do
      {
        *(float32x4_t *)&buf[v35] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, COERCE_FLOAT(*(__int128 *)((char *)&v65 + v35))), v54, *(float32x2_t *)((char *)&v65 + v35), 1), v53, *(float32x4_t *)((char *)&v65 + v35), 2), (float32x4_t)0, *(float32x4_t *)((char *)&v65 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      v40 = 0;
      v41 = *(float32x4_t *)buf;
      v42 = *(float32x4_t *)&buf[16];
      v43 = v70;
      v44 = v71;
      v65 = v59;
      v66 = v57;
      v67 = v63;
      v68 = v61;
      do
      {
        *(float32x4_t *)&buf[v40] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v41, COERCE_FLOAT(*(__int128 *)((char *)&v65 + v40))), v42, *(float32x2_t *)((char *)&v65 + v40), 1), v43, *(float32x4_t *)((char *)&v65 + v40), 2), v44, *(float32x4_t *)((char *)&v65 + v40), 3);
        v40 += 16;
      }
      while (v40 != 64);
      v45 = 0;
      v62 = *(float32x4_t *)&buf[16];
      v64 = *(float32x4_t *)buf;
      v58 = v71;
      v60 = v70;
      while (objc_msgSend((id)a1, "vertexCount", *(_OWORD *)&v52) > v45)
      {
        v46 = objc_msgSend((id)a1, "vertices");
        v47 = (int32x4_t)vaddq_f32(v58, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)(v46 + 16 * v45))), v62, *(float32x2_t *)(v46 + 16 * v45), 1), v60, *(float32x4_t *)(v46 + 16 * v45), 2));
        *(float32x2_t *)(*v2 + 8 * v45++) = vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2));
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      if (_ARLogGeneral(void)::onceToken != -1)
        dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_234);
      v48 = (id)_ARLogGeneral(void)::logObj;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a1;
        _os_log_impl(&dword_1B3A68000, v48, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No smoothed data available in tracking data", buf, 0x16u);

      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 184));
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackingData, CFSTR("trackingData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorIdentifier, CFSTR("anchorIdentifier"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);

}

- (ARFaceTrackingData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSUUID *v12;
  NSUUID *anchorIdentifier;
  ARFaceTrackingData *v14;
  double v15;
  ARFaceTrackingData *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v53;
  uint64_t v54;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("trackingData")))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("trackingData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchorIdentifier"));
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    anchorIdentifier = self->_anchorIdentifier;
    self->_anchorIdentifier = v12;

    v14 = -[ARFaceTrackingData initWithTrackingData:anchorIdentifier:](self, "initWithTrackingData:anchorIdentifier:", v11, self->_anchorIdentifier);
    if (v14)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
      v14->_timestamp = v15;
    }
    v16 = v14;

  }
  else
  {
    v17 = -[ARFaceTrackingData initPrivate](self, "initPrivate");
    if (v17)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertexData"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = objc_msgSend(v18, "length");
        v21 = (const void *)objc_msgSend(objc_retainAutorelease(v19), "bytes");
        v53 = 0uLL;
        v54 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v21, (uint64_t)v21 + 16 * (int)((unint64_t)v20 >> 4), (int)(v20 >> 4));
        v22 = (void *)*((_QWORD *)v17 + 1);
        if (v22)
        {
          *((_QWORD *)v17 + 2) = v22;
          operator delete(v22);
          *((_QWORD *)v17 + 1) = 0;
          *((_QWORD *)v17 + 2) = 0;
          *((_QWORD *)v17 + 3) = 0;
        }
        *(_OWORD *)(v17 + 8) = v53;
        *((_QWORD *)v17 + 3) = v54;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertexData2D"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = objc_msgSend(v23, "length");
        v26 = (const void *)objc_msgSend(objc_retainAutorelease(v24), "bytes");
        v53 = 0uLL;
        v54 = 0;
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v26, (uint64_t)v26 + 8 * (int)((unint64_t)v25 >> 3), (int)(v25 >> 3));
        v27 = (void *)*((_QWORD *)v17 + 4);
        if (v27)
        {
          *((_QWORD *)v17 + 5) = v27;
          operator delete(v27);
          *((_QWORD *)v17 + 4) = 0;
          *((_QWORD *)v17 + 5) = 0;
          *((_QWORD *)v17 + 6) = 0;
        }
        *((_OWORD *)v17 + 2) = v53;
        *((_QWORD *)v17 + 6) = v54;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normalsData"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = objc_msgSend(v28, "length");
        v31 = (const void *)objc_msgSend(objc_retainAutorelease(v29), "bytes");
        v53 = 0uLL;
        v54 = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v53, v31, (uint64_t)v31 + 16 * (int)((unint64_t)v30 >> 4), (int)(v30 >> 4));
        v32 = (void *)*((_QWORD *)v17 + 7);
        if (v32)
        {
          *((_QWORD *)v17 + 8) = v32;
          operator delete(v32);
          *((_QWORD *)v17 + 7) = 0;
          *((_QWORD *)v17 + 8) = 0;
          *((_QWORD *)v17 + 9) = 0;
        }
        *(_OWORD *)(v17 + 56) = v53;
        *((_QWORD *)v17 + 9) = v54;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendShapeCoefficientsData"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v33)
      {
        v35 = objc_msgSend(v33, "length");
        v36 = (const void *)objc_msgSend(objc_retainAutorelease(v34), "bytes");
        v53 = 0uLL;
        v54 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float const*,float const*>(&v53, v36, (uint64_t)v36 + 4 * (int)((unint64_t)v35 >> 2), (int)(v35 >> 2));
        v37 = (void *)*((_QWORD *)v17 + 10);
        if (v37)
        {
          *((_QWORD *)v17 + 11) = v37;
          operator delete(v37);
          *((_QWORD *)v17 + 10) = 0;
          *((_QWORD *)v17 + 11) = 0;
          *((_QWORD *)v17 + 12) = 0;
        }
        *((_OWORD *)v17 + 5) = v53;
        *((_QWORD *)v17 + 12) = v54;
      }
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("transform"));
      *((_OWORD *)v17 + 7) = v38;
      *((_OWORD *)v17 + 8) = v39;
      *((_OWORD *)v17 + 9) = v40;
      *((_OWORD *)v17 + 10) = v41;
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("leftEyeTransform"));
      *((_OWORD *)v17 + 16) = v42;
      *((_OWORD *)v17 + 17) = v43;
      *((_OWORD *)v17 + 18) = v44;
      *((_OWORD *)v17 + 19) = v45;
      objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("rightEyeTransform"));
      *((_OWORD *)v17 + 20) = v46;
      *((_OWORD *)v17 + 21) = v47;
      *((_OWORD *)v17 + 22) = v48;
      *((_OWORD *)v17 + 23) = v49;
      objc_msgSend(v4, "ar_decodeVector3ForKey:", CFSTR("gaze"));
      *((_OWORD *)v17 + 15) = v50;
      *((float *)v17 + 50) = (float)objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tongueOut"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
      *((_QWORD *)v17 + 27) = v51;

    }
    v16 = v17;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  NSUUID *anchorIdentifier;
  NSDictionary *v8;
  uint64_t v9;
  unint64_t v10;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v12;
  BOOL v13;
  uint64_t v14;
  uint32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (v5[2] - v5[1] != *(_QWORD *)self->_anon_10 - (unint64_t)self->_meshVertices.var0)
      goto LABEL_22;
    if (v5[11] - v5[10] != (char *)self->_blendShapeCoefficients.__end_
                          - (char *)self->_blendShapeCoefficients.__begin_)
      goto LABEL_22;
    if (*((float *)v5 + 50) != self->_tongueOut)
      goto LABEL_22;
    if (*((double *)v5 + 27) != self->_timestamp)
      goto LABEL_22;
    anchorIdentifier = self->_anchorIdentifier;
    if (anchorIdentifier != *((NSUUID **)v6 + 24) && !-[NSUUID isEqual:](anchorIdentifier, "isEqual:"))
      goto LABEL_22;
    v8 = (NSDictionary *)*((_QWORD *)v6 + 28);
    if (v8 != self->_trackingData && !-[NSDictionary isEqualToDictionary:](v8, "isEqualToDictionary:"))
      goto LABEL_22;
    v9 = *((_QWORD *)v6 + 1);
    v10 = (*((_QWORD *)v6 + 2) - v9) >> 4;
    var0 = self->_meshVertices.var0;
    v12 = *(__compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> ***)self->_anon_10;
    if (v10 != ((char *)v12 - (char *)var0) >> 4)
      goto LABEL_22;
    if (v12 != var0)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(v9 + 16 * v14), *(float32x4_t *)&var0[2 * v14]);
        v15.i32[3] = v15.i32[2];
        if ((vminvq_u32(v15) & 0x80000000) == 0)
          break;
        v13 = ++v14 >= v10;
      }
      while (v10 != v14);
      if (!v13)
        goto LABEL_22;
    }
    if (!memcmp(*((const void **)v6 + 10), self->_blendShapeCoefficients.__begin_, (char *)self->_blendShapeCoefficients.__end_ - (char *)self->_blendShapeCoefficients.__begin_)&& AREqualTransforms(*((float32x4_t *)v6 + 7), *((float32x4_t *)v6 + 8), *((float32x4_t *)v6 + 9), *((float32x4_t *)v6 + 10), *(float32x4_t *)self->_anon_70, *(float32x4_t *)&self->_anon_70[16], *(float32x4_t *)&self->_anon_70[32], *(float32x4_t *)&self->_anon_70[48])&& AREqualTransforms(*((float32x4_t *)v6 + 16), *((float32x4_t *)v6 + 17), *((float32x4_t *)v6 + 18), *((float32x4_t *)v6 + 19), *(float32x4_t *)self->_anon_100, *(float32x4_t *)&self->_anon_100[16],
                         *(float32x4_t *)&self->_anon_100[32],
                         *(float32x4_t *)&self->_anon_100[48])
      && AREqualTransforms(*((float32x4_t *)v6 + 20), *((float32x4_t *)v6 + 21), *((float32x4_t *)v6 + 22), *((float32x4_t *)v6 + 23), *(float32x4_t *)&self[1].super.isa, *(float32x4_t *)self[1]._anon_10, *(float32x4_t *)self[1]._anon_20, *(float32x4_t *)&self[1]._anon_20[16]))
    {
      v16 = vsubq_f32(*((float32x4_t *)v6 + 15), *(float32x4_t *)self->_gazePoint);
      v17 = vmulq_f32(v16, v16);
      v18 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]) < 0.00000011921;
    }
    else
    {
LABEL_22:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSError)trackingError
{
  return self->_trackingError;
}

- (float)tongueOut
{
  return self->_tongueOut;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)leftEyeTransform
{
  return a1[16];
}

- (__n128)setLeftEyeTransform:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  result[19] = a5;
  return result;
}

- (__n128)rightEyeTransform
{
  return a1[20];
}

- (__n128)setRightEyeTransform:(__n128)a3
{
  result[20] = a2;
  result[21] = a3;
  result[22] = a4;
  result[23] = a5;
  return result;
}

- (__n128)gazePoint
{
  return a1[15];
}

- (void)setGazePoint:(ARFaceTrackingData *)self
{
  __int128 v2;

  *(_OWORD *)self->_gazePoint = v2;
}

- (NSDictionary)trackingData
{
  return self->_trackingData;
}

- (void)setTrackingData:(id)a3
{
  objc_storeStrong((id *)&self->_trackingData, a3);
}

- (void).cxx_destruct
{
  float *begin;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  void *v5;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v6;

  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_trackingError, 0);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_storeStrong((id *)&self->_imageVerticesSemaphore, 0);
  objc_storeStrong((id *)&self->_normalsSemaphore, 0);
  begin = self->_blendShapeCoefficients.__begin_;
  if (begin)
  {
    self->_blendShapeCoefficients.__end_ = begin;
    operator delete(begin);
  }
  var0 = self->_normals.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_40 = var0;
    operator delete(var0);
  }
  v5 = *(void **)self->_anon_20;
  if (v5)
  {
    *(_QWORD *)&self->_anon_20[8] = v5;
    operator delete(v5);
  }
  v6 = self->_meshVertices.var0;
  if (v6)
  {
    *(_QWORD *)self->_anon_10 = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
