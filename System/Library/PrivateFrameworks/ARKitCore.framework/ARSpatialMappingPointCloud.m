@implementation ARSpatialMappingPointCloud

- (id)initWithPointCloud:(__n128)a3 transform:(__n128)a4 identifier:(__n128)a5 timestamp:(double)a6
{
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint64_t PointsRawPtr;
  __int128 v21;
  unint64_t v22;
  _DWORD *v23;
  uint64_t ColorRawPtr;
  __int128 v25;
  unint64_t v26;
  _DWORD *v27;
  uint64_t NormalsRawPtr;
  __int128 v29;
  unint64_t v30;
  _DWORD *v31;
  uint64_t SemanticHistogramLabelsRawPtr;
  uint64_t SemanticHistogramVotesRawPtr;
  uint64_t v34;
  uint16x8_t v35;
  unint64_t v36;
  uint8x8_t v37;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a9;
  v42.receiver = a1;
  v42.super_class = (Class)ARSpatialMappingPointCloud;
  v13 = -[ARSpatialMappingPointCloud init](&v42, sel_init);
  if (!v13)
  {
LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  *((_QWORD *)v13 + 22) = CV3DReconPointCloudGetPointsCount();
  v14 = *MEMORY[0x1E0D840E8];
  if (*MEMORY[0x1E0D840E8] != 4)
  {
    _ARLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v17;
      v45 = 2048;
      v46 = v13;
      v47 = 2048;
      v48 = v14;
      _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Compressed semantics bin size must be 4, found %lu", buf, 0x20u);

    }
    goto LABEL_6;
  }
  PointsRawPtr = CV3DReconPointCloudGetPointsRawPtr();
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 8, *((_QWORD *)v13 + 22));
  if (*((_QWORD *)v13 + 22))
  {
    v22 = 0;
    v23 = (_DWORD *)(PointsRawPtr + 8);
    do
    {
      *(_QWORD *)&v21 = *((_QWORD *)v23 - 1);
      DWORD2(v21) = *v23;
      *(_OWORD *)(*((_QWORD *)v13 + 1) + 16 * v22++) = v21;
      v23 += 3;
    }
    while (v22 < *((_QWORD *)v13 + 22));
  }
  ColorRawPtr = CV3DReconPointCloudGetColorRawPtr();
  if (ColorRawPtr)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 56, *((_QWORD *)v13 + 22));
    if (*((_QWORD *)v13 + 22))
    {
      v26 = 0;
      v27 = (_DWORD *)(ColorRawPtr + 8);
      do
      {
        *(_QWORD *)&v25 = *((_QWORD *)v27 - 1);
        DWORD2(v25) = *v27;
        *(_OWORD *)(*((_QWORD *)v13 + 7) + 16 * v26++) = v25;
        v27 += 3;
      }
      while (v26 < *((_QWORD *)v13 + 22));
    }
  }
  NormalsRawPtr = CV3DReconPointCloudGetNormalsRawPtr();
  if (NormalsRawPtr)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 32, *((_QWORD *)v13 + 22));
    if (*((_QWORD *)v13 + 22))
    {
      v30 = 0;
      v31 = (_DWORD *)(NormalsRawPtr + 8);
      do
      {
        *(_QWORD *)&v29 = *((_QWORD *)v31 - 1);
        DWORD2(v29) = *v31;
        *(_OWORD *)(*((_QWORD *)v13 + 4) + 16 * v30++) = v29;
        v31 += 3;
      }
      while (v30 < *((_QWORD *)v13 + 22));
    }
  }
  SemanticHistogramLabelsRawPtr = CV3DReconPointCloudGetSemanticHistogramLabelsRawPtr();
  SemanticHistogramVotesRawPtr = CV3DReconPointCloudGetSemanticHistogramVotesRawPtr();
  if (SemanticHistogramLabelsRawPtr)
  {
    v34 = SemanticHistogramVotesRawPtr;
    if (!SemanticHistogramVotesRawPtr)
      __assert_rtn("-[ARSpatialMappingPointCloud initWithPointCloud:transform:identifier:timestamp:]", "ARSpatialMappingPointCloud.mm", 106, "votes");
    std::vector<unsigned char>::resize((unint64_t *)v13 + 10, *((_QWORD *)v13 + 22));
    *((_QWORD *)v13 + 23) = 4;
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 104, *((_QWORD *)v13 + 22));
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE6resizeEm((uint64_t)v13 + 128, *((_QWORD *)v13 + 22));
    if (*((_QWORD *)v13 + 22))
    {
      v36 = 0;
      do
      {
        *(_DWORD *)(*((_QWORD *)v13 + 13) + 4 * v36) = *(_DWORD *)(SemanticHistogramLabelsRawPtr
                                                                 + *((_QWORD *)v13 + 23) * v36);
        v35.i32[0] = *(_DWORD *)(v34 + *((_QWORD *)v13 + 23) * v36);
        v37 = (uint8x8_t)vmovl_u8(*(uint8x8_t *)v35.i8).u64[0];
        *(uint8x8_t *)(*((_QWORD *)v13 + 16) + 8 * v36) = v37;
        v37.i32[0] = *(_DWORD *)(*((_QWORD *)v13 + 13) + 4 * v36);
        v35 = vmovl_u8(v37);
        *(_BYTE *)(*((_QWORD *)v13 + 10) + v36++) = v35.i8[0];
      }
      while (v36 < *((_QWORD *)v13 + 22));
    }
  }
  *((__n128 *)v13 + 13) = a2;
  *((__n128 *)v13 + 14) = a3;
  *((__n128 *)v13 + 15) = a4;
  *((__n128 *)v13 + 16) = a5;
  objc_storeStrong((id *)v13 + 24, a9);
  *((double *)v13 + 25) = a6;
  v18 = v13;
LABEL_7:

  return v18;
}

- (uint64_t)updateTransform:(_QWORD *)a1
{
  uint64_t result;

  result = objc_msgSend(a1, "setCameraPose:");
  a1[20] = a1[19];
  return result;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)normals
{
  return *(_QWORD *)(a1 + 32);
}

- (uint64_t)colors
{
  return *(_QWORD *)(a1 + 56);
}

- (char)semantics
{
  return self->_semantics.__begin_;
}

- (uint64_t)semanticLabels
{
  return *(_QWORD *)(a1 + 104);
}

- (uint64_t)semanticVotes
{
  return *(_QWORD *)(a1 + 128);
}

- (uint64_t)pointsToWorld
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  float32x4_t *v5;
  float32x4_t *v6;
  float32x4_t *v7;
  _QWORD *v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;

  v2 = (uint64_t)(a1 + 19);
  v3 = a1[20] - a1[19];
  if (objc_msgSend(a1, "count") != v3 >> 4)
  {
    v4 = a1;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(v2, objc_msgSend(v4, "count"));
    v5 = (float32x4_t *)v4[1];
    v6 = (float32x4_t *)v4[2];
    v7 = *(float32x4_t **)v2;
    v8 = v4;
    while (v5 != v6)
    {
      objc_msgSend(v8, "cameraPose");
      v9 = *v5++;
      *v7++ = vaddq_f32(v13, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, v9.f32[0]), v11, *(float32x2_t *)v9.f32, 1), v12, v9, 2));
    }

  }
  return *(_QWORD *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 176) = self->_count;
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v4 + 8, *(_QWORD *)(v4 + 16), (char *)self->_points.var0, *(char **)self->_anon_10, (uint64_t)(*(_QWORD *)self->_anon_10 - (unint64_t)self->_points.var0) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 32, *(_QWORD *)(v5 + 40), (char *)self->_normals.var0, *(char **)self->_anon_28, (uint64_t)(*(_QWORD *)self->_anon_28 - (unint64_t)self->_normals.var0) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 56, *(_QWORD *)(v5 + 64), (char *)self->_colors.var0, *(char **)self->_anon_40, (uint64_t)(*(_QWORD *)self->_anon_40 - (unint64_t)self->_colors.var0) >> 4);
    *(_QWORD *)(v5 + 184) = self->_semanticsBinSize;
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(v5 + 80, *(char **)(v5 + 88), self->_semantics.__begin_, self->_semantics.__end_, self->_semantics.__end_ - self->_semantics.__begin_);
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 104, *(_QWORD *)(v5 + 112), *(char **)self->_anon_68, *(char **)&self->_anon_68[8], (uint64_t)(*(_QWORD *)&self->_anon_68[8] - *(_QWORD *)self->_anon_68) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__insert_with_sizeB8ne180100INS_11__wrap_iterIPS1_EES8_EES8_NS6_IPKS1_EET_T0_l(v5 + 128, *(_QWORD *)(v5 + 136), *(char **)self->_anon_80, *(char **)&self->_anon_80[8], (uint64_t)(*(_QWORD *)&self->_anon_80[8] - *(_QWORD *)self->_anon_80) >> 3);
    v6 = *(_OWORD *)&self[1].super.isa;
    v7 = *(_OWORD *)self[1]._anon_10;
    v8 = *(_OWORD *)&self[1]._anon_28[8];
    *(_OWORD *)(v5 + 240) = *(_OWORD *)&self[1]._normals.var0;
    *(_OWORD *)(v5 + 256) = v8;
    *(_OWORD *)(v5 + 208) = v6;
    *(_OWORD *)(v5 + 224) = v7;
    objc_storeStrong((id *)(v5 + 192), self->_identifier);
    *(double *)(v5 + 200) = self->_timestamp;
  }
  return (id)v5;
}

+ (id)dictionaryFromArray:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id obj;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[8];
  _QWORD v62[8];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[3];
  _QWORD v66[3];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v44;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v3)
  {
    v46 = *(_QWORD *)v58;
    do
    {
      v48 = 0;
      v54 = v3;
      do
      {
        if (*(_QWORD *)v58 != v46)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v48);
        +[ARQAHelper arrayOf3dPoints:count:](ARQAHelper, "arrayOf3dPoints:count:", objc_msgSend(v4, "pointsToWorld"), objc_msgSend(v4, "count"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObjectsFromArray:", v5);

        v55 = 0;
        v56 = 0;
        v6 = 0;
        v7 = 0;
        while (v56 < objc_msgSend(v4, "count"))
        {
          v8 = objc_msgSend(v4, "semanticLabels");
          v9 = objc_msgSend(v4, "semanticVotes");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(objc_msgSend(v4, "semantics") + v56));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v10);

          v11 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v12) = *(_DWORD *)(objc_msgSend(v4, "normals") + v55);
          objc_msgSend(v11, "numberWithFloat:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = v13;
          v14 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v15) = *(_DWORD *)(objc_msgSend(v4, "normals") + 4 * v7 + 4);
          objc_msgSend(v14, "numberWithFloat:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v16;
          v17 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v18) = *(_DWORD *)(objc_msgSend(v4, "normals") + 4 * v7 + 8);
          objc_msgSend(v17, "numberWithFloat:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v66[2] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v20);

          v21 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v22) = *(_DWORD *)(objc_msgSend(v4, "colors") + v55);
          objc_msgSend(v21, "numberWithFloat:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = v23;
          v24 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v25) = *(_DWORD *)(objc_msgSend(v4, "colors") + 4 * v7 + 4);
          objc_msgSend(v24, "numberWithFloat:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v65[1] = v26;
          v27 = (void *)MEMORY[0x1E0CB37E8];
          LODWORD(v28) = *(_DWORD *)(objc_msgSend(v4, "colors") + 4 * v7 + 8);
          objc_msgSend(v27, "numberWithFloat:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v65[2] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v30);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v8 + v7));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = v31;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v8 + v7 + 1));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v64[1] = v32;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v8 + v7 + 2));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v64[2] = v33;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v8 + v7 + 3));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v64[3] = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v35);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + v6));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v63[0] = v36;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + v6 + 1));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v63[1] = v37;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + v6 + 2));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v63[2] = v38;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v9 + v6 + 3));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v63[3] = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v40);

          v7 += 4;
          v6 += 8;
          v55 += 16;
          ++v56;
        }
        ++v48;
      }
      while (v48 != v54);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v3);
  }

  v62[0] = CFSTR("V8A");
  v61[0] = CFSTR("semanticVersion");
  v61[1] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v41;
  v62[2] = v47;
  v61[2] = CFSTR("points");
  v61[3] = CFSTR("normals");
  v62[3] = v52;
  v62[4] = v51;
  v61[4] = CFSTR("colors");
  v61[5] = CFSTR("semantics");
  v62[5] = v53;
  v62[6] = v50;
  v61[6] = CFSTR("semanticLabels");
  v61[7] = CFSTR("semanticVotes");
  v62[7] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (int64_t)count
{
  return self->_count;
}

- (double)cameraPose
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 208), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setCameraPose:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 208), v5, 64, 1, 0);
}

- (unint64_t)semanticsBinSize
{
  return self->_semanticsBinSize;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **var0;
  void *v4;
  void *v5;
  char *begin;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v7;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v8;
  __compressed_pair<float * __attribute__((ext_vector_type(3))), std::allocator<float __attribute__((ext_vector_type(3)))>> **v9;

  objc_storeStrong((id *)&self->_identifier, 0);
  var0 = self->_pointsToWorld.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_a0 = var0;
    operator delete(var0);
  }
  v4 = *(void **)self->_anon_80;
  if (v4)
  {
    *(_QWORD *)&self->_anon_80[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_68;
  if (v5)
  {
    *(_QWORD *)&self->_anon_68[8] = v5;
    operator delete(v5);
  }
  begin = self->_semantics.__begin_;
  if (begin)
  {
    self->_semantics.__end_ = begin;
    operator delete(begin);
  }
  v7 = self->_colors.var0;
  if (v7)
  {
    *(_QWORD *)self->_anon_40 = v7;
    operator delete(v7);
  }
  v8 = self->_normals.var0;
  if (v8)
  {
    *(_QWORD *)self->_anon_28 = v8;
    operator delete(v8);
  }
  v9 = self->_points.var0;
  if (v9)
  {
    *(_QWORD *)self->_anon_10 = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 21) = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
