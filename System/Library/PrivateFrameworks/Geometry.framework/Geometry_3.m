uint64_t geom::fixed_pool_list<unsigned long>::fixed_pool_list(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t *v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  v4 = a2 + 2;
  if (a2 == -2)
  {
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v7 = (uint64_t *)(a1 + 40);
    *(_QWORD *)(a1 + 56) = 0;
  }
  else
  {
    _ZNSt3__16vectorIDv3_dNS_9allocatorIS1_EEE11__vallocateB8nn180100Em((_QWORD *)(a1 + 16), a2 + 2);
    v5 = *(_QWORD **)(a1 + 24);
    v6 = &v5[4 * v4];
    do
    {
      *v5 = 0;
      v5[1] = -1;
      v5[2] = -1;
      v5[3] = -1;
      v5 += 4;
    }
    while (v5 != v6);
    *(_QWORD *)(a1 + 40) = 0;
    v7 = (uint64_t *)(a1 + 40);
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = 0;
    if (!a2)
    {
      v8 = *(_QWORD **)(a1 + 16);
      v8[2] = 1;
      v8[7] = 0;
      goto LABEL_8;
    }
  }
  std::vector<double>::__vallocate[abi:nn180100](v7, a2);
  v9 = *(char **)(a1 + 48);
  memset(v9, 255, 8 * a2);
  *(_QWORD *)(a1 + 48) = &v9[8 * a2];
  v8 = *(_QWORD **)(a1 + 16);
  v8[2] = 1;
  v8[7] = 0;
  if (!v4)
  {
LABEL_11:
    v12 = 0;
    v13 = *v7;
    do
    {
      *(_QWORD *)(v13 + 8 * v12) = v12 + 2;
      ++v12;
    }
    while (a2 != v12);
    return a1;
  }
LABEL_8:
  v10 = 0;
  v11 = v8 + 1;
  do
  {
    *v11 = v10;
    v11 += 4;
    ++v10;
  }
  while (a2 + 2 != v10);
  if (a2)
    goto LABEL_11;
  return a1;
}

unint64_t *geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::fixed_pool_list(unint64_t *a1, unint64_t a2)
{
  unint64_t v4;
  _QWORD *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;

  *a1 = a2;
  a1[1] = 0;
  v4 = a2 + 2;
  v5 = std::vector<geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::node,std::allocator<std::allocator>>::vector(a1 + 2, a2 + 2);
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:nn180100](a1 + 5, a2);
    v6 = (char *)a1[6];
    memset(v6, 255, 8 * a2);
    a1[6] = (unint64_t)&v6[8 * a2];
    v7 = (_QWORD *)a1[2];
    v7[3] = 1;
    v7[9] = 0;
    if (!v4)
    {
LABEL_8:
      v10 = 0;
      v11 = a1[5];
      do
      {
        *(_QWORD *)(v11 + 8 * v10) = v10 + 2;
        ++v10;
      }
      while (a2 != v10);
      return a1;
    }
  }
  else
  {
    v7 = (_QWORD *)*v5;
    v7[3] = 1;
    v7[9] = 0;
  }
  v8 = 0;
  v9 = v7 + 2;
  do
  {
    *v9 = v8;
    v9 += 5;
    ++v8;
  }
  while (v4 != v8);
  if (a2)
    goto LABEL_8;
  return a1;
}

_QWORD *std::vector<geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::node,std::allocator<std::allocator>>::vector(_QWORD *a1, unint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<geom::interpolating_key<double>>::__vallocate[abi:nn180100](a1, a2);
    v4 = (_QWORD *)a1[1];
    v5 = &v4[5 * a2];
    do
    {
      *v4 = -1;
      v4[1] = 0;
      v4[2] = -1;
      v4[3] = -1;
      v4[4] = -1;
      v4 += 5;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

uint64_t geom::is_triangle_incident_to_vertex_concave_free<float>(uint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t a5, float a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float v26;
  int v27;
  float v28;
  int v29;
  float v30;
  float v31;
  BOOL v32;
  float v33;
  float v34;
  int v35;
  float v36;
  float v37;
  BOOL v38;
  float v39;
  int v40;
  uint64_t v41;
  unint64_t v42;

  if (*(_QWORD *)(a2 + 8) < 3uLL)
    return 0;
  v8 = *a1;
  v7 = a1[1];
  if (v7 == a2 && v8 == 1)
  {
    v10 = 1;
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 16) == -1)
      v10 = *a1;
    else
      v10 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 16);
    v11 = v7 == a2 && v10 == 1;
    v12 = a1[1];
    if (!v11)
      goto LABEL_18;
    v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16);
  }
  v12 = a2;
  if (v7 != a2)
    goto LABEL_71;
LABEL_18:
  if (v8 == 1)
  {
    v13 = 1;
    goto LABEL_23;
  }
  v41 = *(_QWORD *)(a2 + 16);
  if (v8 == *(_QWORD *)(v41 + 16))
  {
    v42 = *(_QWORD *)(v41 + 56);
    if (v42 <= 1)
      v13 = 1;
    else
      v13 = v42;
  }
  else
  {
LABEL_71:
    if (*(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 24))
      v13 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 24);
    else
      v13 = *a1;
    a2 = a1[1];
  }
LABEL_23:
  v14 = *(_QWORD *)(a5 + 16);
  v15 = *(_QWORD *)(v14 + 24);
  if (v15 != 1)
  {
    v16 = *a4;
    v17 = *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8));
    v18 = *(float32x2_t *)(*a4 + 8 * *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(a2 + 16) + 32 * v13)));
    do
    {
      v19 = *(float32x2_t *)(v16
                           + 8
                           * *(_QWORD *)(*a3
                                       + 8
                                       * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 40 * v15 + 8) + 16)
                                                   + 32 * *(_QWORD *)(v14 + 40 * v15))));
      v20 = vsub_f32(v19, v18);
      if (sqrtf(vaddv_f32(vmul_f32(v20, v20))) <= a6)
        goto LABEL_59;
      v21 = *(float32x2_t *)(v16 + 8 * v17);
      v22 = vsub_f32(v19, v21);
      if (sqrtf(vaddv_f32(vmul_f32(v22, v22))) <= a6)
        goto LABEL_59;
      v23 = *(float32x2_t *)(v16 + 8 * *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(v12 + 16) + 32 * v10)));
      v24 = vsub_f32(v19, v23);
      if (sqrtf(vaddv_f32(vmul_f32(v24, v24))) <= a6)
        goto LABEL_59;
      v19.f32[0] = vmlas_n_f32((float)-(float)(v18.f32[1] - v23.f32[1]) * v24.f32[0], v19.f32[1] - v23.f32[1], vsub_f32(v18, v23).f32[0]);
      v25 = vmlas_n_f32((float)-(float)(v21.f32[1] - v18.f32[1]) * v20.f32[0], v19.f32[1] - v18.f32[1], vsub_f32(v21, v18).f32[0]);
      if (v19.f32[0] == 0.0)
      {
        if (v25 != 0.0)
        {
          v27 = 0;
LABEL_35:
          v28 = fabsf(v25);
          v29 = v25 < 0.0;
          v30 = (float)(v28 + 1.0) * a6;
          if (v28 != INFINITY)
            v29 = (float)(0.0 - v30) >= v25;
          if (v19.f32[0] != 0.0 && v27 != v29)
          {
            v31 = fabsf(v19.f32[0]);
            v32 = v31 != INFINITY && v31 < (float)((float)(v31 + 1.0) * a6);
            if (!v32 && (v28 == INFINITY || v28 >= v30))
              goto LABEL_59;
          }
        }
      }
      else
      {
        v26 = fabsf(v19.f32[0]);
        v27 = v19.f32[0] < 0.0;
        if (v26 != INFINITY)
          v27 = (float)(0.0 - (float)((float)(v26 + 1.0) * a6)) >= v19.f32[0];
        if (v25 != 0.0)
          goto LABEL_35;
      }
      v33 = vmlas_n_f32((float)-(float)(v23.f32[1] - COERCE_FLOAT(HIDWORD(*(_QWORD *)(v16 + 8 * v17)))) * v22.f32[0], v19.f32[1] - COERCE_FLOAT(HIDWORD(*(_QWORD *)(v16 + 8 * v17))), vsub_f32(v23, v21).f32[0]);
      if (v33 == 0.0)
        return 0;
      v34 = fabsf(v33);
      if (v34 == INFINITY)
      {
        v35 = v33 < 0.0;
      }
      else
      {
        v36 = (float)(v34 + 1.0) * a6;
        if (v34 < v36)
          return 0;
        v35 = (float)(0.0 - v36) >= v33;
      }
      v37 = v25 + v19.f32[0];
      v38 = (float)(v25 + v19.f32[0]) > 0.0;
      if ((float)(v25 + v19.f32[0]) == 0.0)
      {
        if ((v35 & 1) != 0)
          return 0;
      }
      else
      {
        v39 = fabsf(v37);
        v40 = !v38;
        if (v39 != INFINITY)
          v40 = (float)((float)((float)(v39 + 1.0) * a6) + 0.0) >= v37;
        if (v35 == v40)
          return 0;
      }
LABEL_59:
      if (*(_QWORD *)(v14 + 40 * v15 + 24) != -1)
        v15 = *(_QWORD *)(v14 + 40 * v15 + 24);
    }
    while (v15 != 1);
  }
  return 1;
}

void geom::add_triangle_helper<float>(int *a1, _QWORD *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t *v7;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  int32x2_t v14;
  int32x2_t v15;
  float32x2_t v16;
  char v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t internal;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  unsigned int *v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  float v38;
  float32x2_t v39;
  float32x2_t v40;
  float v41;
  uint64_t *v42;
  char *v43;
  _DWORD *v44;
  unint64_t v45;
  uint64_t *v46;
  char *v47;
  char **v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  int v57;
  char *v58;
  char **v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  int v69;
  int v70;
  char *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  int v79;
  int v80;
  _DWORD *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  int v90;
  unint64_t v91;
  uint64_t *v92;
  char *v93;
  int v94;
  unint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  int v104;
  _DWORD *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  int v114;
  unint64_t v115;
  unint64_t v116;
  int8x16_t v117;
  uint64_t v118;
  unint64_t v119;
  float32x2_t v120;
  float32x2_t v121;
  float32x2_t v122;
  uint64_t v123;

  v7 = a3;
  v123 = *MEMORY[0x24BDAC8D0];
  v119 = ((uint64_t)(a2[1] - *a2) >> 2) / 3uLL;
  v10 = *(float32x2_t *)(a5 + 8 * *(_QWORD *)(*a4 + 8 * *(_QWORD *)a1));
  v11 = *(float32x2_t *)(a5 + 8 * *(_QWORD *)(*a4 + 8 * *((_QWORD *)a1 + 1)));
  v12 = *(float32x2_t *)(a5 + 8 * *(_QWORD *)(*a4 + 8 * *((_QWORD *)a1 + 2)));
  v120 = vsub_f32(v11, v10);
  v121 = vsub_f32(v12, v11);
  v122 = vsub_f32(v10, v12);
  v13 = vmul_f32(v120, v120);
  v14 = (int32x2_t)vmul_f32(v121, v121);
  v15 = (int32x2_t)vmul_f32(v122, v122);
  v16 = vadd_f32((float32x2_t)vzip1_s32(v14, v15), (float32x2_t)vzip2_s32(v14, v15));
  v17 = vmvn_s8((int8x8_t)vcge_f32(vadd_f32(v13, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 1)), v16)).u8[0] | (vaddv_f32(v13) < v16.f32[1]);
  if (v16.f32[0] >= v16.f32[1])
    v18 = 1;
  else
    v18 = 2;
  if ((v17 & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  if (v19 == 2)
    v20 = 0;
  else
    v20 = v19 + 1;
  v21 = *(_QWORD *)&a1[2 * v19];
  v22 = *(_QWORD *)&a1[2 * v20];
  v115 = v21;
  v116 = v22;
  internal = geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::find_internal(a3, (uint64_t *)&v115);
  if (internal != -1)
  {
    if ((_DWORD)v20 == 2)
      v24 = 0;
    else
      v24 = (v20 + 1);
    v118 = 0;
    v25 = v7;
    v118 = *(_QWORD *)(v7[1] + 24 * internal + 16);
    v26 = 3 * v118;
    v27 = (_DWORD *)(*a2 + 12 * v118);
    v28 = 3 * v118 + 1;
    v29 = (unsigned int *)(*a2 + 4 * v28);
    if (v21 != *v27)
    {
      v30 = v21 == *v29;
      v29 = v27 + 2;
      if (!v30)
        v29 = (unsigned int *)(*a2 + 12 * v118);
    }
    v31 = *(_QWORD *)&a1[2 * v24];
    v32 = *v29;
    v33 = *a4;
    v34 = v32;
    v35 = *(float32x2_t *)(a5 + 8 * *(_QWORD *)(v33 + 8 * v32));
    v36 = vsub_f32(v35, *(float32x2_t *)(a5 + 8 * *(_QWORD *)(v33 + 8 * v21)));
    v37 = vsub_f32(*(float32x2_t *)(a5 + 8 * *(_QWORD *)(v33 + 8 * v22)), v35);
    v38 = vaddv_f32(vmul_f32(v37, vneg_f32(v36)));
    v39 = *(&v120 + v20);
    v40 = *(&v120 + v24);
    v41 = vaddv_f32(vmul_f32(v40, vneg_f32(v39)));
    if (v38 < 0.0 && v41 < 0.0
      || (float)((float)(vmlas_n_f32(vmuls_lane_f32(-v37.f32[0], v36, 1), v37.f32[1], v36.f32[0]) * v41)
               + (float)(v38 * vmlas_n_f32(vmuls_lane_f32(-v40.f32[0], v39, 1), v40.f32[1], v39.f32[0]))) < 0.0)
    {
      v115 = v21;
      v116 = v22;
      v42 = v25;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v25, (uint64_t *)&v115);
      v115 = v34;
      v116 = v21;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v42, (uint64_t *)&v115);
      v115 = v22;
      v116 = v34;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v42, (uint64_t *)&v115);
      v43 = (char *)*a2;
      v44 = (_DWORD *)(*a2 + 4 * v26);
      v45 = v31;
      *v44 = v31;
      *(_DWORD *)&v43[4 * v28] = v34;
      v46 = v42;
      v44[2] = v22;
      v117.i64[0] = v34;
      v117.i64[1] = v31;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v117.i64[0] = v22;
      v117.i64[1] = v34;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v117.i64[0] = v31;
      v117.i64[1] = v22;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v48 = (char **)(a2 + 2);
      v47 = (char *)a2[2];
      v49 = (char *)a2[1];
      if (v49 >= v47)
      {
        v51 = (char *)*a2;
        v52 = (uint64_t)&v49[-*a2] >> 2;
        v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 62)
          goto LABEL_120;
        v54 = v47 - v51;
        if (v54 >> 1 > v53)
          v53 = v54 >> 1;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
          v55 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v55 = v53;
        if (v55)
        {
          v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v55);
          v51 = (char *)*a2;
          v49 = (char *)a2[1];
        }
        else
        {
          v56 = 0;
        }
        v93 = &v56[4 * v52];
        v47 = &v56[4 * v55];
        *(_DWORD *)v93 = v34;
        v50 = v93 + 4;
        while (v49 != v51)
        {
          v94 = *((_DWORD *)v49 - 1);
          v49 -= 4;
          *((_DWORD *)v93 - 1) = v94;
          v93 -= 4;
        }
        *a2 = v93;
        a2[1] = v50;
        a2[2] = v47;
        if (v51)
        {
          operator delete(v51);
          v47 = *v48;
        }
      }
      else
      {
        *(_DWORD *)v49 = v34;
        v50 = v49 + 4;
      }
      a2[1] = v50;
      if (v50 >= v47)
      {
        v97 = (char *)*a2;
        v98 = (uint64_t)&v50[-*a2] >> 2;
        v99 = v98 + 1;
        if ((unint64_t)(v98 + 1) >> 62)
          goto LABEL_120;
        v100 = v47 - v97;
        if (v100 >> 1 > v99)
          v99 = v100 >> 1;
        if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFFCLL)
          v101 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v101 = v99;
        v95 = v34;
        if (v101)
        {
          v102 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v101);
          v97 = (char *)*a2;
          v50 = (char *)a2[1];
        }
        else
        {
          v102 = 0;
        }
        v103 = &v102[4 * v98];
        v47 = &v102[4 * v101];
        *(_DWORD *)v103 = v45;
        v96 = v103 + 4;
        while (v50 != v97)
        {
          v104 = *((_DWORD *)v50 - 1);
          v50 -= 4;
          *((_DWORD *)v103 - 1) = v104;
          v103 -= 4;
        }
        *a2 = v103;
        a2[1] = v96;
        a2[2] = v47;
        if (v97)
        {
          operator delete(v97);
          v47 = *v48;
        }
      }
      else
      {
        v95 = v34;
        *(_DWORD *)v50 = v45;
        v96 = v50 + 4;
      }
      a2[1] = v96;
      if (v96 < v47)
      {
        *(_DWORD *)v96 = v21;
        v105 = v96 + 4;
LABEL_118:
        a2[1] = v105;
        v117.i64[0] = v45;
        v117.i64[1] = v95;
        geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v46, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
        v117.i64[0] = v21;
        v117.i64[1] = v45;
        geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v46, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
        v117.i64[0] = v95;
        v117.i64[1] = v21;
        v92 = v46;
        goto LABEL_119;
      }
      v106 = (char *)*a2;
      v107 = (uint64_t)&v96[-*a2] >> 2;
      v108 = v107 + 1;
      if (!((unint64_t)(v107 + 1) >> 62))
      {
        v109 = v47 - v106;
        if (v109 >> 1 > v108)
          v108 = v109 >> 1;
        if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFFCLL)
          v110 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v110 = v108;
        if (v110)
        {
          v111 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v110);
          v106 = (char *)*a2;
          v96 = (char *)a2[1];
        }
        else
        {
          v111 = 0;
        }
        v112 = &v111[4 * v107];
        v113 = &v111[4 * v110];
        *(_DWORD *)v112 = v21;
        v105 = v112 + 4;
        while (v96 != v106)
        {
          v114 = *((_DWORD *)v96 - 1);
          v96 -= 4;
          *((_DWORD *)v112 - 1) = v114;
          v112 -= 4;
        }
        *a2 = v112;
        a2[1] = v105;
        a2[2] = v113;
        if (v106)
          operator delete(v106);
        goto LABEL_118;
      }
LABEL_120:
      abort();
    }
    v7 = v25;
  }
  v57 = *a1;
  v59 = (char **)(a2 + 2);
  v58 = (char *)a2[2];
  v60 = (char *)a2[1];
  if (v60 >= v58)
  {
    v62 = (char *)*a2;
    v63 = (uint64_t)&v60[-*a2] >> 2;
    v64 = v63 + 1;
    if ((unint64_t)(v63 + 1) >> 62)
      goto LABEL_120;
    v65 = v58 - v62;
    if (v65 >> 1 > v64)
      v64 = v65 >> 1;
    if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL)
      v66 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v66 = v64;
    if (v66)
    {
      v67 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v66);
      v62 = (char *)*a2;
      v60 = (char *)a2[1];
    }
    else
    {
      v67 = 0;
    }
    v68 = &v67[4 * v63];
    v58 = &v67[4 * v66];
    *(_DWORD *)v68 = v57;
    v61 = v68 + 4;
    while (v60 != v62)
    {
      v69 = *((_DWORD *)v60 - 1);
      v60 -= 4;
      *((_DWORD *)v68 - 1) = v69;
      v68 -= 4;
    }
    *a2 = v68;
    a2[1] = v61;
    a2[2] = v58;
    if (v62)
    {
      operator delete(v62);
      v58 = *v59;
    }
  }
  else
  {
    *(_DWORD *)v60 = v57;
    v61 = v60 + 4;
  }
  a2[1] = v61;
  v70 = a1[2];
  if (v61 >= v58)
  {
    v72 = (char *)*a2;
    v73 = (uint64_t)&v61[-*a2] >> 2;
    v74 = v73 + 1;
    if ((unint64_t)(v73 + 1) >> 62)
      goto LABEL_120;
    v75 = v58 - v72;
    if (v75 >> 1 > v74)
      v74 = v75 >> 1;
    if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFFCLL)
      v76 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v76 = v74;
    if (v76)
    {
      v77 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v76);
      v72 = (char *)*a2;
      v61 = (char *)a2[1];
    }
    else
    {
      v77 = 0;
    }
    v78 = &v77[4 * v73];
    v58 = &v77[4 * v76];
    *(_DWORD *)v78 = v70;
    v71 = v78 + 4;
    while (v61 != v72)
    {
      v79 = *((_DWORD *)v61 - 1);
      v61 -= 4;
      *((_DWORD *)v78 - 1) = v79;
      v78 -= 4;
    }
    *a2 = v78;
    a2[1] = v71;
    a2[2] = v58;
    if (v72)
    {
      operator delete(v72);
      v58 = *v59;
    }
  }
  else
  {
    *(_DWORD *)v61 = v70;
    v71 = v61 + 4;
  }
  a2[1] = v71;
  v80 = a1[4];
  if (v71 >= v58)
  {
    v82 = (char *)*a2;
    v83 = (uint64_t)&v71[-*a2] >> 2;
    v84 = v83 + 1;
    if ((unint64_t)(v83 + 1) >> 62)
      goto LABEL_120;
    v85 = v58 - v82;
    if (v85 >> 1 > v84)
      v84 = v85 >> 1;
    if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL)
      v86 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v86 = v84;
    if (v86)
    {
      v87 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v86);
      v82 = (char *)*a2;
      v71 = (char *)a2[1];
    }
    else
    {
      v87 = 0;
    }
    v88 = &v87[4 * v83];
    v89 = &v87[4 * v86];
    *(_DWORD *)v88 = v80;
    v81 = v88 + 4;
    while (v71 != v82)
    {
      v90 = *((_DWORD *)v71 - 1);
      v71 -= 4;
      *((_DWORD *)v88 - 1) = v90;
      v88 -= 4;
    }
    *a2 = v88;
    a2[1] = v81;
    a2[2] = v89;
    if (v82)
      operator delete(v82);
  }
  else
  {
    *(_DWORD *)v71 = v80;
    v81 = v71 + 4;
  }
  a2[1] = v81;
  v117 = vextq_s8(*(int8x16_t *)a1, *(int8x16_t *)a1, 8uLL);
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v7, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
  v117 = vextq_s8(*(int8x16_t *)(a1 + 2), *(int8x16_t *)(a1 + 2), 8uLL);
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v7, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
  v91 = *((_QWORD *)a1 + 2);
  v117.i64[0] = *(_QWORD *)a1;
  v117.i64[1] = v91;
  v92 = v7;
LABEL_119:
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v92, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
}

_QWORD *geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::init(_QWORD *result, unint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  __int128 v8;
  size_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;

  v2 = result;
  result[4] = 0;
  if (a2 <= 1)
    v3 = 1;
  else
    v3 = a2;
  v4 = 151 * v3;
  v5 = ((unint64_t)(151 * v3) >> 7) + 15;
  *result = 0;
  result[1] = 0;
  result[2] = v5 & 0x3FFFFFFFFFFFFF0;
  if ((v5 & 0x3FFFFFFFFFFFFF0) == 0)
    goto LABEL_18;
  if ((((v5 & 0x3FFFFFFFFFFFFF0) + 63) & 0x7FFFFFFFFFFFFC0) <= 0x40)
    v6 = 64;
  else
    v6 = ((v5 & 0x3FFFFFFFFFFFFF0) + 63) & 0x7FFFFFFFFFFFFC0;
  *result = malloc_type_aligned_alloc(0x40uLL, v6, 0x85081AA1uLL);
  if (v4 >= 0x80)
  {
    v7 = 0;
    *(_QWORD *)&v8 = -1;
    *((_QWORD *)&v8 + 1) = -1;
    do
      *(_OWORD *)(*v2 + 16 * v7++) = v8;
    while (v5 >> 4 != v7);
  }
  v9 = ((24 * v2[2] + 63) & 0xFFFFFFFFFFFFFFC0) <= 0x40 ? 64 : (24 * v2[2] + 63) & 0xFFFFFFFFFFFFFFC0;
  result = malloc_type_aligned_alloc(0x40uLL, v9, 0x3A3CE064uLL);
  v2[1] = result;
  if (v2[2])
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = (_QWORD *)(v2[1] + v10);
      *v12 = 0;
      v12[1] = 0;
      v12[2] = 0;
      ++v11;
      v13 = v2[2];
      v10 += 24;
    }
    while (v11 < v13);
  }
  else
  {
LABEL_18:
    v13 = 0;
  }
  v2[3] = 0;
  v2[4] = v13;
  return result;
}

double geom::indexed_priority_queue<unsigned long,double>::push_or_change_cost(void **a1, double *a2)
{
  double v4;
  _QWORD *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  double v10;
  __int128 v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  _QWORD *v16;
  double v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  uint64_t i;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  _QWORD *v46;
  double v47;
  double v48;
  double *v49;
  double v50;
  double v51;
  _QWORD *v52;

  v4 = *a2;
  v5 = a1[3];
  v6 = v5[*(_QWORD *)a2];
  if (v6 == -1)
  {
    v22 = (char *)*a1;
    v21 = (char *)a1[1];
    v23 = (v21 - (_BYTE *)*a1) >> 4;
    v5[*(_QWORD *)&v4] = v23;
    v24 = (uint64_t)(a1 + 2);
    v25 = (unint64_t)a1[2];
    if ((unint64_t)v21 >= v25)
    {
      v34 = v23 + 1;
      if ((v23 + 1) >> 60)
        abort();
      v35 = v25 - (_QWORD)v22;
      if (v35 >> 3 > v34)
        v34 = v35 >> 3;
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF0)
        v36 = 0xFFFFFFFFFFFFFFFLL;
      else
        v36 = v34;
      if (v36)
        v37 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v24, v36);
      else
        v37 = 0;
      v38 = &v37[16 * v23];
      v39 = &v37[16 * v36];
      v11 = *(_OWORD *)a2;
      *(_OWORD *)v38 = *(_OWORD *)a2;
      v26 = v38 + 16;
      v41 = (char *)*a1;
      v40 = (char *)a1[1];
      if (v40 != *a1)
      {
        do
        {
          v11 = *((_OWORD *)v40 - 1);
          *((_OWORD *)v38 - 1) = v11;
          v38 -= 16;
          v40 -= 16;
        }
        while (v40 != v41);
        v40 = (char *)*a1;
      }
      *a1 = v38;
      a1[1] = v26;
      a1[2] = v39;
      if (v40)
        operator delete(v40);
    }
    else
    {
      v11 = *(_OWORD *)a2;
      *(_OWORD *)v21 = *(_OWORD *)a2;
      v26 = v21 + 16;
    }
    a1[1] = v26;
    if (v21 != v22)
    {
      v42 = (char *)*a1;
      *(_QWORD *)&v11 = *((_QWORD *)*a1 + 2 * v23 + 1);
      do
      {
        v43 = v23 - 1;
        v44 = (v23 - 1) >> 1;
        v45 = &v42[16 * v44];
        v47 = *((double *)v45 + 1);
        v46 = v45 + 8;
        v48 = v47;
        if (v47 <= *(double *)&v11)
          break;
        v49 = (double *)&v42[16 * v23];
        v50 = *v49;
        *(double *)&v11 = v49[1];
        *v49 = *(double *)&v42[16 * v44];
        *(double *)&v42[16 * v44] = v50;
        v49[1] = v48;
        *v46 = v11;
        v51 = *v49;
        v52 = a1[3];
        v52[*(_QWORD *)&v51] = v23;
        v52[*(_QWORD *)&v42[16 * v44]] = v44;
        v23 = (v23 - 1) >> 1;
      }
      while (v43 >= 2);
    }
  }
  else
  {
    v7 = (char *)*a1;
    v8 = (uint64_t)*a1 + 16 * v6;
    v10 = *(double *)(v8 + 8);
    v9 = (_QWORD *)(v8 + 8);
    *(double *)&v11 = a2[1];
    v12 = v10 < *(double *)&v11;
    if (v10 <= *(double *)&v11)
    {
      *(double *)v8 = v4;
      *v9 = v11;
      if (v12)
      {
        v27 = ((_BYTE *)a1[1] - v7) >> 4;
        for (i = v6; ; v6 = i)
        {
          v29 = (2 * v6) | 1;
          if (v29 < v27)
          {
            i = v6;
            if (*(double *)&v7[16 * v29 + 8] < *(double *)&v11)
              i = (2 * v6) | 1;
          }
          v30 = 2 * v6 + 2;
          if (v30 < v27)
          {
            *(_QWORD *)&v11 = *(_QWORD *)&v7[16 * v30 + 8];
            if (*(double *)&v11 < *(double *)&v7[16 * i + 8])
              i = 2 * v6 + 2;
          }
          if (i == v6)
            break;
          v31 = &v7[16 * v6];
          v32 = &v7[16 * i];
          v33 = *(_QWORD *)v31;
          *(_QWORD *)&v11 = *((_QWORD *)v31 + 1);
          *(_QWORD *)v31 = *(_QWORD *)v32;
          *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
          *(_QWORD *)v32 = v33;
          *((_QWORD *)v32 + 1) = v11;
          v5[*(_QWORD *)v31] = v6;
          v5[*(_QWORD *)v32] = i;
        }
      }
    }
    else
    {
      *(double *)v8 = v4;
      *v9 = v11;
      if (v6)
      {
        do
        {
          v13 = v6 - 1;
          v14 = (v6 - 1) >> 1;
          v15 = &v7[16 * v14];
          v17 = *((double *)v15 + 1);
          v16 = v15 + 8;
          *(double *)&v11 = v17;
          if (v17 <= a2[1])
            break;
          v18 = &v7[16 * v6];
          v19 = *(_QWORD *)v18;
          v20 = *((_QWORD *)v18 + 1);
          *(_QWORD *)v18 = *(_QWORD *)&v7[16 * v14];
          *((_QWORD *)v18 + 1) = v11;
          *(_QWORD *)&v7[16 * v14] = v19;
          *v16 = v20;
          v5[*(_QWORD *)v18] = v6;
          v5[*(_QWORD *)&v7[16 * v14]] = v14;
          v6 = (v6 - 1) >> 1;
        }
        while (v13 >= 2);
      }
    }
  }
  return *(double *)&v11;
}

void std::vector<geom::indexed_priority_queue<unsigned long,double>::key,std::allocator<geom::indexed_priority_queue<unsigned long,double>::key>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    std::vector<geom::indexed_priority_queue<unsigned long,double>::key,std::allocator<geom::indexed_priority_queue<unsigned long,double>::key>>::__append((void **)a1, a2 - v2);
  }
}

void std::vector<geom::indexed_priority_queue<unsigned long,double>::key,std::allocator<geom::indexed_priority_queue<unsigned long,double>::key>>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if (a2 <= (v6 - (_BYTE *)v7) >> 4)
  {
    if (a2)
    {
      v14 = &v7[2 * a2];
      do
      {
        *v7 = -1;
        v7[1] = 0x7FF0000000000000;
        v7 += 2;
      }
      while (v7 != v14);
      v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = (char *)v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      abort();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v4, v12);
    else
      v13 = 0;
    v15 = &v13[16 * v10];
    v16 = &v15[16 * a2];
    v17 = v15;
    do
    {
      *(_QWORD *)v17 = -1;
      *((_QWORD *)v17 + 1) = 0x7FF0000000000000;
      v17 += 16;
    }
    while (v17 != v16);
    v18 = &v13[16 * v12];
    v20 = (char *)*a1;
    v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v19 - 1);
        v15 -= 16;
        v19 -= 16;
      }
      while (v19 != v20);
      v19 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19)
      operator delete(v19);
  }
}

BOOL geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t internal;

  internal = geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::find_internal(a1, a2);
  return internal != -1
      && geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::remove_internal(a1, internal);
}

void geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(uint64_t *a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  char v9;
  unint64_t v10;

  if (geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::find_internal(a1, (uint64_t *)a2) == -1)
  {
    geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::internal_add<unsigned long>(a1, a2, *a3);
    if (v10 >> 4 >= (unint64_t)a1[2] >> 4)
      v8 = 0;
    else
      v8 = (unsigned __int16)~*(_QWORD *)&vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vcltzq_s8(*(int8x16_t *)(*a1 + 16 * (v10 >> 4))), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800);
    v9 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = -1;
  }
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = v8;
  *(_QWORD *)(a4 + 16) = v10;
  *(_BYTE *)(a4 + 24) = v9;
}

uint64_t geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::find_internal(_QWORD *a1, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  unint64_t v10;
  int8x16_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1[2];
  if (v2 < 0x10)
    return -1;
  v3 = v2 >> 4;
  v4 = *a2;
  v5 = a2[1];
  v6 = v5 + (*a2 << 6);
  v7 = ((v6 + ((unint64_t)*a2 >> 2) - 0x61C8864680B583E9) ^ *a2) % (v2 >> 4);
  v8 = vdupq_n_s8(((v6 + ((unint64_t)*a2 >> 2) + 23) ^ *a2) & 0x7F);
  v9.i64[0] = -1;
  v9.i64[1] = -1;
  v10 = v7;
  while (1)
  {
    v11 = *(int8x16_t *)(*a1 + 16 * v10);
    v12 = (unint64_t)vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vceqq_s8(v8, v11), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800);
    v13 = __clz(__rbit64(v12));
    if (v13 <= 0x3F)
      break;
LABEL_11:
    if (vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vceqq_s8(v11, v9), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800))
    {
      return -1;
    }
    if (v10 + 1 == v3)
      v10 = 0;
    else
      ++v10;
    v15 = -1;
    if (v10 == v7)
      return v15;
  }
  v14 = 16 * v10;
  while (1)
  {
    v15 = v13 + v14;
    v16 = (uint64_t *)(a1[1] + 24 * (v13 + v14));
    v18 = *v16;
    v17 = v16[1];
    if (v4 == v18 && v5 == v17)
      return v15;
    if (v13 <= 0x3E)
    {
      v13 = __clz(__rbit64((-2 << v13) & v12));
      if (v13 < 0x40)
        continue;
    }
    goto LABEL_11;
  }
}

BOOL geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::remove_internal(_QWORD *a1, uint64_t a2)
{
  int8x16_t *v3;
  int8x16_t v4;
  int8x8_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;

  if (a2 != -1)
  {
    v3 = (int8x16_t *)(*a1 + (a2 & 0xFFFFFFFFFFFFFFF0));
    v4.i64[0] = -1;
    v4.i64[1] = -1;
    v5 = vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vceqq_s8(*v3, v4), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800);
    if (v5)
      v6 = -1;
    else
      v6 = 0x80;
    v3->i8[a2 & 0xF] = v6;
    v7 = a1[4];
    if (v5)
      ++v7;
    v8 = a1[3] - 1;
    a1[3] = v8;
    a1[4] = v7;
    if (v8 >= 0x11 && v8 < a1[2] >> 2)
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::grow_to_count((uint64_t)a1);
  }
  return a2 != -1;
}

void geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::grow_to_count(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v1 = *(_QWORD *)(a1 + 24);
  v3 = (((151 * v1) >> 7) + 15) & 0x3FFFFFFFFFFFFF0;
  if (v3 != v2)
  {
    if (v3 > v2)
      v1 = 150 * v1 / 0x64;
    goto LABEL_6;
  }
  if (!*(_QWORD *)(a1 + 32))
LABEL_6:
    geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::do_resize((__int128 *)a1, v1);
}

void geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::do_resize(__int128 *a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t i;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (a2 <= 1)
    a2 = 1;
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::init(&v19, a2);
  v17[0] = a1;
  v3 = *((_QWORD *)a1 + 2);
  if (v3 >= 0x10)
  {
    v4 = 0;
    v5 = *(_QWORD *)a1;
    v6 = v3 >> 4;
    while (1)
    {
      v7 = vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vcltzq_s8(*(int8x16_t *)(v5 + v4)), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800).u16[0];
      v17[1] = (unsigned __int16)~v7;
      if (v7 != 0xFFFF)
        break;
      v4 += 16;
      if (!--v6)
        goto LABEL_10;
    }
    v8 = __clz(__rbit64((unsigned __int16)~v7)) + v4;
    for (i = v8; i != -1; v8 = i)
    {
      v9 = (__n128 *)(*(_QWORD *)(v17[0] + 8) + 24 * v8);
      v10 = v9[1].n128_i64[0];
      v15 = *v9;
      v16 = v10;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::internal_add<unsigned long>((uint64_t *)&v19, &v15, v10);
      _ZN4geom10hash_brownIZNS_23marching_squares_2_implIfRKNSt3__18functionIFfDv2_fEEEEEvOT0_tNS_4bboxIT_Lh2EEERNS2_6vectorINS_11vector_typeISC_Lh2EvE5valueENS2_9allocatorISH_EEEERNSE_IjNSI_IjEEEEE14edge_map_queryNS_12_GLOBAL__N_19cell_edgeEZNS1_IfS8_EEvSA_tSD_SL_SO_ENSP_4hashENS2_8equal_toISP_EEE19hash_brown_iteratorIRNS2_4pairIKSP_SR_EEEppEv(v17);
    }
  }
LABEL_10:
  if (&v19 != a1)
  {
    v11 = v20;
    v12 = *a1;
    v13 = a1[1];
    *a1 = v19;
    a1[1] = v11;
    v19 = v12;
    v20 = v13;
    v14 = *((_QWORD *)a1 + 4);
    *((_QWORD *)a1 + 4) = v21;
    v21 = v14;
  }
  _ZN4geom10hash_brownIZNS_23marching_squares_2_implIfRKNSt3__18functionIFfDv2_fEEEEEvOT0_tNS_4bboxIT_Lh2EEERNS2_6vectorINS_11vector_typeISC_Lh2EvE5valueENS2_9allocatorISH_EEEERNSE_IjNSI_IjEEEEE16vertex_map_queryS4_ZNS1_IfS8_EEvSA_tSD_SL_SO_ENSP_4hashENS2_8equal_toISP_EEE6deinitEv((uint64_t)&v19);
}

__n128 geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::internal_add<unsigned long>(uint64_t *a1, __n128 *a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  _BOOL8 v15;
  uint64_t v16;
  __n128 result;
  uint64_t v18;

  if (!a1[4])
    geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::grow_to_count(a1);
  v6 = a2->n128_u64[1];
  v7 = a2->n128_u64[0] << 6;
  v8 = a2->n128_u64[0] >> 2;
  v9 = (unint64_t)a1[2] >> 4;
  v10 = ((v6 + v7 + v8 - 0x61C8864680B583E9) ^ a2->n128_u64[0]) % v9;
  v11 = *a1;
  v12 = __clz(__rbit64(*(_QWORD *)&vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vcltzq_s8(*(int8x16_t *)(*a1 + 16 * v10)), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800)));
  if (v12 >= 0x40)
  {
    do
    {
      if (v10 + 1 == v9)
        v10 = 0;
      else
        ++v10;
      v12 = __clz(__rbit64(*(_QWORD *)&vqtbl1_s8((int8x16_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vandq_s8(vcltzq_s8(*(int8x16_t *)(v11 + 16 * v10)), (int8x16_t)xmmword_2289B6F60)))), (int8x8_t)0x3830282018100800)));
    }
    while (v12 > 0x3F);
  }
  v13 = v11 + 16 * v10;
  v14 = ((v6 + v7 + v8 + 23) ^ a2->n128_u64[0]) & 0x7F;
  v15 = *(unsigned __int8 *)(v13 + v12) == 255;
  *(_BYTE *)(v13 + v12) = v14;
  v16 = a1[1] + 24 * (v12 + 16 * v10);
  result = *a2;
  *(__n128 *)v16 = *a2;
  *(_QWORD *)(v16 + 16) = a3;
  v18 = a1[4] - v15;
  ++a1[3];
  a1[4] = v18;
  return result;
}

uint64_t geom::fixed_pool_list<unsigned long>::erase(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[2];
  v3 = (_QWORD *)(v2 + 32 * a2);
  v4 = v3[1];
  v5 = v2 + 32 * v3[2];
  v6 = v2 + 32 * v3[3];
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v5 + 8);
  *(_QWORD *)(v5 + 24) = *(_QWORD *)(v6 + 8);
  v3[2] = -1;
  v3[3] = -1;
  v7 = a1[1] - 1;
  a1[1] = v7;
  *(_QWORD *)(a1[5] + 8 * v7) = v4;
  return *(_QWORD *)(v5 + 8);
}

uint64_t geom::is_triangle_incident_to_vertex_concave_free<double>(uint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t a5, double a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  double v28;
  int v29;
  int v30;
  double v31;
  BOOL v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  _BOOL4 v38;
  uint64_t v39;
  unint64_t v40;

  if (*(_QWORD *)(a2 + 8) < 3uLL)
    return 0;
  v8 = *a1;
  v7 = a1[1];
  if (v7 == a2 && v8 == 1)
  {
    v10 = 1;
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 16) == -1)
      v10 = *a1;
    else
      v10 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 16);
    v11 = v7 == a2 && v10 == 1;
    v12 = a1[1];
    if (!v11)
      goto LABEL_18;
    v10 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16);
  }
  v12 = a2;
  if (v7 != a2)
    goto LABEL_62;
LABEL_18:
  if (v8 == 1)
  {
    v13 = 1;
    goto LABEL_23;
  }
  v39 = *(_QWORD *)(a2 + 16);
  if (v8 == *(_QWORD *)(v39 + 16))
  {
    v40 = *(_QWORD *)(v39 + 56);
    if (v40 <= 1)
      v13 = 1;
    else
      v13 = v40;
  }
  else
  {
LABEL_62:
    if (*(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 24))
      v13 = *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8 + 24);
    else
      v13 = *a1;
    a2 = a1[1];
  }
LABEL_23:
  v14 = *(_QWORD *)(a5 + 16);
  v15 = *(_QWORD *)(v14 + 24);
  if (v15 != 1)
  {
    v16 = *a4;
    v17 = *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(v7 + 16) + 32 * v8));
    v18 = *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(v12 + 16) + 32 * v10));
    v19 = *(float64x2_t *)(*a4 + 16 * *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(a2 + 16) + 32 * v13)));
    v20 = *(double *)(*a4 + 16 * *(_QWORD *)(*a3 + 8 * *(_QWORD *)(*(_QWORD *)(a2 + 16) + 32 * v13)) + 8);
    v21 = 0.0 - a6;
    while (1)
    {
      v22 = *(float64x2_t *)(v16
                           + 16
                           * *(_QWORD *)(*a3
                                       + 8
                                       * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v14 + 40 * v15 + 8) + 16)
                                                   + 32 * *(_QWORD *)(v14 + 40 * v15))));
      v23 = vsubq_f64(v22, v19);
      if (sqrt(vaddvq_f64(vmulq_f64(v23, v23))) > a6)
      {
        v24 = *(float64x2_t *)(v16 + 16 * v17);
        v25 = vsubq_f64(v22, v24);
        if (sqrt(vaddvq_f64(vmulq_f64(v25, v25))) > a6)
        {
          v26 = *(float64x2_t *)(v16 + 16 * v18);
          v27 = vsubq_f64(v22, v26);
          if (sqrt(vaddvq_f64(vmulq_f64(v27, v27))) > a6)
          {
            v22.f64[0] = vmlad_n_f64(-(v20 - v26.f64[1]) * v27.f64[0], v22.f64[1] - v26.f64[1], vsubq_f64(v19, v26).f64[0]);
            v28 = vmlad_n_f64(-(v24.f64[1] - v20) * v23.f64[0], v22.f64[1] - v20, vsubq_f64(v24, v19).f64[0]);
            v29 = v22.f64[0] != 0.0;
            if (v21 < v22.f64[0])
              v29 = 0;
            v30 = v28 != 0.0;
            if (v21 < v28)
              v30 = 0;
            if (v30 == v29
              || ((v31 = fabs(v22.f64[0]), v22.f64[0] != 0.0) ? (v32 = v31 > a6) : (v32 = 0),
                  !v32 || ((v33 = fabs(v28), v28 != 0.0) ? (v34 = v33 > a6) : (v34 = 0), !v34)))
            {
              v35 = vmlad_n_f64(-(v26.f64[1] - *(double *)(v16 + 16 * v17 + 8)) * v25.f64[0], v22.f64[1] - *(double *)(v16 + 16 * v17 + 8), vsubq_f64(v26, v24).f64[0]);
              v36 = fabs(v35);
              if (v35 == 0.0 || v36 <= a6)
                break;
              v38 = v28 + v22.f64[0] == 0.0;
              if (a6 + 0.0 >= v28 + v22.f64[0])
                v38 = 1;
              if ((((v21 < v35) ^ v38) & 1) != 0)
                break;
            }
          }
        }
      }
      if (*(_QWORD *)(v14 + 40 * v15 + 24) != -1)
        v15 = *(_QWORD *)(v14 + 40 * v15 + 24);
      if (v15 == 1)
        return 1;
    }
    return 0;
  }
  return 1;
}

void geom::add_triangle_helper<double>(int *a1, _QWORD *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t *v7;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  float64x2_t v16;
  char v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t internal;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  _DWORD *v27;
  uint64_t v28;
  unsigned int *v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  double v38;
  float64x2_t v39;
  float64x2_t v40;
  double v41;
  uint64_t *v42;
  char *v43;
  _DWORD *v44;
  unint64_t v45;
  uint64_t *v46;
  char *v47;
  char **v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  int v57;
  char *v58;
  char **v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  int v69;
  int v70;
  char *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  int v79;
  int v80;
  _DWORD *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  int v90;
  unint64_t v91;
  uint64_t *v92;
  char *v93;
  int v94;
  unint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  int v104;
  _DWORD *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  int v114;
  unint64_t v115;
  unint64_t v116;
  int8x16_t v117;
  uint64_t v118;
  unint64_t v119;
  float64x2_t v120;
  float64x2_t v121;
  float64x2_t v122;
  uint64_t v123;

  v7 = a3;
  v123 = *MEMORY[0x24BDAC8D0];
  v119 = ((uint64_t)(a2[1] - *a2) >> 2) / 3uLL;
  v10 = *(float64x2_t *)(a5 + 16 * *(_QWORD *)(*a4 + 8 * *(_QWORD *)a1));
  v11 = *(float64x2_t *)(a5 + 16 * *(_QWORD *)(*a4 + 8 * *((_QWORD *)a1 + 1)));
  v12 = *(float64x2_t *)(a5 + 16 * *(_QWORD *)(*a4 + 8 * *((_QWORD *)a1 + 2)));
  v120 = vsubq_f64(v11, v10);
  v121 = vsubq_f64(v12, v11);
  v122 = vsubq_f64(v10, v12);
  v13 = (int64x2_t)vmulq_f64(v120, v120);
  v14 = (int64x2_t)vmulq_f64(v121, v121);
  v15 = (int64x2_t)vmulq_f64(v122, v122);
  v16 = vaddq_f64((float64x2_t)vzip1q_s64(v14, v15), (float64x2_t)vzip2q_s64(v14, v15));
  v17 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgeq_f64(vaddq_f64((float64x2_t)v13, (float64x2_t)vdupq_laneq_s64(v13, 1)), v16))).u8[0] | (vaddvq_f64((float64x2_t)v13) < v16.f64[1]);
  if (v16.f64[0] >= v16.f64[1])
    v18 = 1;
  else
    v18 = 2;
  if ((v17 & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  if (v19 == 2)
    v20 = 0;
  else
    v20 = v19 + 1;
  v21 = *(_QWORD *)&a1[2 * v19];
  v22 = *(_QWORD *)&a1[2 * v20];
  v115 = v21;
  v116 = v22;
  internal = geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::find_internal(a3, (uint64_t *)&v115);
  if (internal != -1)
  {
    if ((_DWORD)v20 == 2)
      v24 = 0;
    else
      v24 = (v20 + 1);
    v118 = 0;
    v25 = v7;
    v118 = *(_QWORD *)(v7[1] + 24 * internal + 16);
    v26 = 3 * v118;
    v27 = (_DWORD *)(*a2 + 12 * v118);
    v28 = 3 * v118 + 1;
    v29 = (unsigned int *)(*a2 + 4 * v28);
    if (v21 != *v27)
    {
      v30 = v21 == *v29;
      v29 = v27 + 2;
      if (!v30)
        v29 = (unsigned int *)(*a2 + 12 * v118);
    }
    v31 = *(_QWORD *)&a1[2 * v24];
    v32 = *v29;
    v33 = *a4;
    v34 = v32;
    v35 = *(float64x2_t *)(a5 + 16 * *(_QWORD *)(v33 + 8 * v32));
    v36 = vsubq_f64(v35, *(float64x2_t *)(a5 + 16 * *(_QWORD *)(v33 + 8 * v21)));
    v37 = vsubq_f64(*(float64x2_t *)(a5 + 16 * *(_QWORD *)(v33 + 8 * v22)), v35);
    v38 = vaddvq_f64(vmulq_f64(v37, vnegq_f64(v36)));
    v39 = *(&v120 + v20);
    v40 = *(&v120 + v24);
    v41 = vaddvq_f64(vmulq_f64(v40, vnegq_f64(v39)));
    if (v38 < 0.0 && v41 < 0.0
      || vmlad_n_f64(vmuld_lane_f64(-v37.f64[0], v36, 1), v37.f64[1], v36.f64[0]) * v41
       + v38 * vmlad_n_f64(vmuld_lane_f64(-v40.f64[0], v39, 1), v40.f64[1], v39.f64[0]) < 0.0)
    {
      v115 = v21;
      v116 = v22;
      v42 = v25;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v25, (uint64_t *)&v115);
      v115 = v34;
      v116 = v21;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v42, (uint64_t *)&v115);
      v115 = v22;
      v116 = v34;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::erase(v42, (uint64_t *)&v115);
      v43 = (char *)*a2;
      v44 = (_DWORD *)(*a2 + 4 * v26);
      v45 = v31;
      *v44 = v31;
      *(_DWORD *)&v43[4 * v28] = v34;
      v46 = v42;
      v44[2] = v22;
      v117.i64[0] = v34;
      v117.i64[1] = v31;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v117.i64[0] = v22;
      v117.i64[1] = v34;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v117.i64[0] = v31;
      v117.i64[1] = v22;
      geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v42, (__n128 *)&v117, &v118, (uint64_t)&v115);
      v48 = (char **)(a2 + 2);
      v47 = (char *)a2[2];
      v49 = (char *)a2[1];
      if (v49 >= v47)
      {
        v51 = (char *)*a2;
        v52 = (uint64_t)&v49[-*a2] >> 2;
        v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 62)
          goto LABEL_120;
        v54 = v47 - v51;
        if (v54 >> 1 > v53)
          v53 = v54 >> 1;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
          v55 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v55 = v53;
        if (v55)
        {
          v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v55);
          v51 = (char *)*a2;
          v49 = (char *)a2[1];
        }
        else
        {
          v56 = 0;
        }
        v93 = &v56[4 * v52];
        v47 = &v56[4 * v55];
        *(_DWORD *)v93 = v34;
        v50 = v93 + 4;
        while (v49 != v51)
        {
          v94 = *((_DWORD *)v49 - 1);
          v49 -= 4;
          *((_DWORD *)v93 - 1) = v94;
          v93 -= 4;
        }
        *a2 = v93;
        a2[1] = v50;
        a2[2] = v47;
        if (v51)
        {
          operator delete(v51);
          v47 = *v48;
        }
      }
      else
      {
        *(_DWORD *)v49 = v34;
        v50 = v49 + 4;
      }
      a2[1] = v50;
      if (v50 >= v47)
      {
        v97 = (char *)*a2;
        v98 = (uint64_t)&v50[-*a2] >> 2;
        v99 = v98 + 1;
        if ((unint64_t)(v98 + 1) >> 62)
          goto LABEL_120;
        v100 = v47 - v97;
        if (v100 >> 1 > v99)
          v99 = v100 >> 1;
        if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFFCLL)
          v101 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v101 = v99;
        v95 = v34;
        if (v101)
        {
          v102 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v101);
          v97 = (char *)*a2;
          v50 = (char *)a2[1];
        }
        else
        {
          v102 = 0;
        }
        v103 = &v102[4 * v98];
        v47 = &v102[4 * v101];
        *(_DWORD *)v103 = v45;
        v96 = v103 + 4;
        while (v50 != v97)
        {
          v104 = *((_DWORD *)v50 - 1);
          v50 -= 4;
          *((_DWORD *)v103 - 1) = v104;
          v103 -= 4;
        }
        *a2 = v103;
        a2[1] = v96;
        a2[2] = v47;
        if (v97)
        {
          operator delete(v97);
          v47 = *v48;
        }
      }
      else
      {
        v95 = v34;
        *(_DWORD *)v50 = v45;
        v96 = v50 + 4;
      }
      a2[1] = v96;
      if (v96 < v47)
      {
        *(_DWORD *)v96 = v21;
        v105 = v96 + 4;
LABEL_118:
        a2[1] = v105;
        v117.i64[0] = v45;
        v117.i64[1] = v95;
        geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v46, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
        v117.i64[0] = v21;
        v117.i64[1] = v45;
        geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v46, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
        v117.i64[0] = v95;
        v117.i64[1] = v21;
        v92 = v46;
        goto LABEL_119;
      }
      v106 = (char *)*a2;
      v107 = (uint64_t)&v96[-*a2] >> 2;
      v108 = v107 + 1;
      if (!((unint64_t)(v107 + 1) >> 62))
      {
        v109 = v47 - v106;
        if (v109 >> 1 > v108)
          v108 = v109 >> 1;
        if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFFCLL)
          v110 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v110 = v108;
        if (v110)
        {
          v111 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v110);
          v106 = (char *)*a2;
          v96 = (char *)a2[1];
        }
        else
        {
          v111 = 0;
        }
        v112 = &v111[4 * v107];
        v113 = &v111[4 * v110];
        *(_DWORD *)v112 = v21;
        v105 = v112 + 4;
        while (v96 != v106)
        {
          v114 = *((_DWORD *)v96 - 1);
          v96 -= 4;
          *((_DWORD *)v112 - 1) = v114;
          v112 -= 4;
        }
        *a2 = v112;
        a2[1] = v105;
        a2[2] = v113;
        if (v106)
          operator delete(v106);
        goto LABEL_118;
      }
LABEL_120:
      abort();
    }
    v7 = v25;
  }
  v57 = *a1;
  v59 = (char **)(a2 + 2);
  v58 = (char *)a2[2];
  v60 = (char *)a2[1];
  if (v60 >= v58)
  {
    v62 = (char *)*a2;
    v63 = (uint64_t)&v60[-*a2] >> 2;
    v64 = v63 + 1;
    if ((unint64_t)(v63 + 1) >> 62)
      goto LABEL_120;
    v65 = v58 - v62;
    if (v65 >> 1 > v64)
      v64 = v65 >> 1;
    if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL)
      v66 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v66 = v64;
    if (v66)
    {
      v67 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v66);
      v62 = (char *)*a2;
      v60 = (char *)a2[1];
    }
    else
    {
      v67 = 0;
    }
    v68 = &v67[4 * v63];
    v58 = &v67[4 * v66];
    *(_DWORD *)v68 = v57;
    v61 = v68 + 4;
    while (v60 != v62)
    {
      v69 = *((_DWORD *)v60 - 1);
      v60 -= 4;
      *((_DWORD *)v68 - 1) = v69;
      v68 -= 4;
    }
    *a2 = v68;
    a2[1] = v61;
    a2[2] = v58;
    if (v62)
    {
      operator delete(v62);
      v58 = *v59;
    }
  }
  else
  {
    *(_DWORD *)v60 = v57;
    v61 = v60 + 4;
  }
  a2[1] = v61;
  v70 = a1[2];
  if (v61 >= v58)
  {
    v72 = (char *)*a2;
    v73 = (uint64_t)&v61[-*a2] >> 2;
    v74 = v73 + 1;
    if ((unint64_t)(v73 + 1) >> 62)
      goto LABEL_120;
    v75 = v58 - v72;
    if (v75 >> 1 > v74)
      v74 = v75 >> 1;
    if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFFCLL)
      v76 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v76 = v74;
    if (v76)
    {
      v77 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v76);
      v72 = (char *)*a2;
      v61 = (char *)a2[1];
    }
    else
    {
      v77 = 0;
    }
    v78 = &v77[4 * v73];
    v58 = &v77[4 * v76];
    *(_DWORD *)v78 = v70;
    v71 = v78 + 4;
    while (v61 != v72)
    {
      v79 = *((_DWORD *)v61 - 1);
      v61 -= 4;
      *((_DWORD *)v78 - 1) = v79;
      v78 -= 4;
    }
    *a2 = v78;
    a2[1] = v71;
    a2[2] = v58;
    if (v72)
    {
      operator delete(v72);
      v58 = *v59;
    }
  }
  else
  {
    *(_DWORD *)v61 = v70;
    v71 = v61 + 4;
  }
  a2[1] = v71;
  v80 = a1[4];
  if (v71 >= v58)
  {
    v82 = (char *)*a2;
    v83 = (uint64_t)&v71[-*a2] >> 2;
    v84 = v83 + 1;
    if ((unint64_t)(v83 + 1) >> 62)
      goto LABEL_120;
    v85 = v58 - v82;
    if (v85 >> 1 > v84)
      v84 = v85 >> 1;
    if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL)
      v86 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v86 = v84;
    if (v86)
    {
      v87 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 2), v86);
      v82 = (char *)*a2;
      v71 = (char *)a2[1];
    }
    else
    {
      v87 = 0;
    }
    v88 = &v87[4 * v83];
    v89 = &v87[4 * v86];
    *(_DWORD *)v88 = v80;
    v81 = v88 + 4;
    while (v71 != v82)
    {
      v90 = *((_DWORD *)v71 - 1);
      v71 -= 4;
      *((_DWORD *)v88 - 1) = v90;
      v88 -= 4;
    }
    *a2 = v88;
    a2[1] = v81;
    a2[2] = v89;
    if (v82)
      operator delete(v82);
  }
  else
  {
    *(_DWORD *)v71 = v80;
    v81 = v71 + 4;
  }
  a2[1] = v81;
  v117 = vextq_s8(*(int8x16_t *)a1, *(int8x16_t *)a1, 8uLL);
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v7, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
  v117 = vextq_s8(*(int8x16_t *)(a1 + 2), *(int8x16_t *)(a1 + 2), 8uLL);
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v7, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
  v91 = *((_QWORD *)a1 + 2);
  v117.i64[0] = *(_QWORD *)a1;
  v117.i64[1] = v91;
  v92 = v7;
LABEL_119:
  geom::hash_brown<std::pair<unsigned long,unsigned long>,unsigned long,geom::edge_hash,std::equal_to<std::pair<unsigned long,unsigned long>>>::insert(v92, (__n128 *)&v117, (uint64_t *)&v119, (uint64_t)&v115);
}

void std::vector<unsigned long>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      abort();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void std::vector<geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::const_node_iterator,std::allocator<std::allocator>>::__append(_QWORD *a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _OWORD *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void *__p;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_OWORD **)(v6 - 8);
  if (a2 <= (v8 - (uint64_t)v9) >> 4)
  {
    if (a2)
    {
      v16 = 16 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 16;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (uint64_t)v9 - *a1;
    v11 = a2 + (v10 >> 4);
    if (v11 >> 60)
      abort();
    v12 = v10 >> 4;
    v13 = v7 - *a1;
    if (v13 >> 3 > v11)
      v11 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    v25 = v6;
    if (v14)
      v15 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v6, v14);
    else
      v15 = 0;
    v18 = &v15[16 * v12];
    __p = v15;
    v22 = v18;
    v24 = &v15[16 * v14];
    v19 = 16 * a2;
    v20 = &v18[16 * a2];
    do
    {
      *(_OWORD *)v18 = *a3;
      v18 += 16;
      v19 -= 16;
    }
    while (v19);
    v23 = v20;
    std::vector<geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::const_node_iterator,std::allocator<std::allocator>>::__swap_out_circular_buffer(a1, &__p);
    if (v23 != v22)
      v23 += (v22 - v23 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (__p)
      operator delete(__p);
  }
}

_QWORD *std::vector<geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::const_node_iterator,std::allocator<std::allocator>>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = (_QWORD *)a2[1];
  if (v2 != (_QWORD *)*result)
  {
    do
    {
      *(v4 - 2) = -1;
      v4 -= 2;
      v5 = *(v2 - 2);
      v2 -= 2;
      v4[1] = 0;
      v6 = v2[1];
      *v4 = v5;
      v4[1] = v6;
      *v2 = -1;
      v2[1] = 0;
    }
    while (v2 != v3);
  }
  a2[1] = v4;
  v7 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v7;
  v8 = result[1];
  result[1] = a2[2];
  a2[2] = v8;
  v9 = result[2];
  result[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,false>(uint64_t result, uint64_t *a2, uint64_t **a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  char v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v20 = *(a2 - 1);
        v21 = *v9;
        if (COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * v20))) > COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * *v9))))
        {
          *v9 = v20;
          *(a2 - 1) = v21;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, a2 - 1, a3);
      case 4uLL:
        return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, v9 + 2, a2 - 1, a3);
      case 5uLL:
        return std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, a3);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, a2, a3);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(&v9[v13 >> 1], v9, a2 - 1, a3);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, &v9[v13 >> 1], a2 - 1, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9 + 1, v15 - 1, a2 - 2, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9 + 2, &v9[v14 + 1], a2 - 3, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v15 - 1, v15, &v9[v14 + 1], a3);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * *(v9 - 1)))) <= COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * *v9))))
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(v9, a2, a3);
            v9 = (uint64_t *)result;
            goto LABEL_17;
          }
LABEL_12:
          v17 = std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(v9, a2, a3);
          if ((v18 & 1) == 0)
            goto LABEL_15;
          v19 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v17, a3);
          v9 = v17 + 1;
          result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v17 + 1, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v19)
              continue;
LABEL_15:
            result = std::__introsort<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,false>(v8, v17, a3, -v11, a5 & 1);
            v9 = v17 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v17;
          if (v19)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,unsigned long *>(v9, a2, a2, a3);
        return result;
    }
  }
}

uint64_t *std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  if (result != a2)
  {
    v3 = result + 1;
    if (result + 1 != a2)
    {
      v4 = 0;
      v5 = *a3[1];
      v6 = **a3;
      v7 = result;
      do
      {
        v9 = *v7;
        v8 = v7[1];
        v7 = v3;
        if (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v8))) > COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v9))))
        {
          v10 = v4;
          while (1)
          {
            *(uint64_t *)((char *)result + v10 + 8) = v9;
            if (!v10)
              break;
            v9 = *(uint64_t *)((char *)result + v10 - 8);
            v10 -= 8;
            if (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v8))) <= COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v9))))
            {
              v11 = (uint64_t *)((char *)result + v10 + 8);
              goto LABEL_10;
            }
          }
          v11 = result;
LABEL_10:
          *v11 = v8;
        }
        v3 = v7 + 1;
        v4 += 8;
      }
      while (v7 + 1 != a2);
    }
  }
  return result;
}

uint64_t *std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result != a2)
  {
    v3 = result + 1;
    if (result + 1 != a2)
    {
      v4 = *a3[1];
      v5 = **a3;
      do
      {
        v7 = *result;
        v6 = result[1];
        result = v3;
        if (COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v6))) > COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v7))))
        {
          do
          {
            *v3 = v7;
            v7 = *(v3 - 2);
            --v3;
          }
          while (COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v6))) > COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v7))));
          *v3 = v6;
        }
        v3 = result + 1;
      }
      while (result + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  v5 = *a1;
  v6 = *a4[1];
  v7 = **a4;
  v8 = *(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a2));
  v9 = *a3;
  v10 = *(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a3));
  if (*(float *)&v8 > COERCE_FLOAT(*(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a1))))
  {
    if (*(float *)&v10 > *(float *)&v8)
    {
      *a1 = v9;
      *a3 = v5;
      return 1;
    }
    *a1 = v4;
    *a2 = v5;
    if (COERCE_FLOAT(*(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a3))) <= COERCE_FLOAT(*(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * v5))))
      return 1;
    *a2 = *a3;
    *a3 = v5;
    return 2;
  }
  if (*(float *)&v10 > *(float *)&v8)
  {
    *a2 = v9;
    *a3 = v4;
    v11 = *a1;
    if (COERCE_FLOAT(*(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a2))) <= COERCE_FLOAT(*(_QWORD *)(v7 + 8 * *(_QWORD *)(v6 + 8 * *a1))))
      return 1;
    *a1 = *a2;
    *a2 = v11;
    return 2;
  }
  return 0;
}

uint64_t *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *a1;
  v4 = *a3[1];
  v5 = **a3;
  v6 = *(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * *a1));
  if (*(float *)&v6 <= COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * *(a2 - 1)))))
  {
    v9 = a1 + 1;
    do
    {
      v7 = v9;
      if (v9 >= a2)
        break;
      ++v9;
    }
    while (*(float *)&v6 <= COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * *v7))));
  }
  else
  {
    v7 = a1;
    do
    {
      v8 = v7[1];
      ++v7;
    }
    while (*(float *)&v6 <= COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v8))));
  }
  if (v7 < a2)
  {
    do
      v10 = *--a2;
    while (*(float *)&v6 > COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v10))));
  }
  if (v7 < a2)
  {
    v11 = *v7;
    v12 = *a2;
    do
    {
      *v7 = v12;
      *a2 = v11;
      v13 = *(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v3));
      do
      {
        v14 = v7[1];
        ++v7;
        v11 = v14;
      }
      while (*(float *)&v13 <= COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v14))));
      do
      {
        v15 = *--a2;
        v12 = v15;
      }
      while (*(float *)&v13 > COERCE_FLOAT(*(_QWORD *)(v5 + 8 * *(_QWORD *)(v4 + 8 * v15))));
    }
    while (v7 < a2);
  }
  if (v7 - 1 != a1)
    *a1 = *(v7 - 1);
  *(v7 - 1) = v3;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = 0;
  v4 = *a1;
  v5 = *a3[1];
  v6 = **a3;
  v7 = *(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * *a1));
  do
    v8 = a1[++v3];
  while (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v8))) > *(float *)&v7);
  v9 = &a1[v3];
  v10 = &a1[v3 - 1];
  if (v3 == 1)
  {
    do
    {
      if (v9 >= a2)
        break;
      v12 = *--a2;
    }
    while (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v12))) <= *(float *)&v7);
  }
  else
  {
    do
      v11 = *--a2;
    while (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v11))) <= *(float *)&v7);
  }
  if (v9 < a2)
  {
    v13 = *a2;
    v14 = &a1[v3];
    v15 = a2;
    do
    {
      *v14 = v13;
      *v15 = v8;
      v16 = *(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v4));
      do
      {
        v17 = v14[1];
        ++v14;
        v8 = v17;
      }
      while (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v17))) > *(float *)&v16);
      do
      {
        v18 = *--v15;
        v13 = v18;
      }
      while (COERCE_FLOAT(*(_QWORD *)(v6 + 8 * *(_QWORD *)(v5 + 8 * v18))) <= *(float *)&v16);
    }
    while (v14 < v15);
    v10 = v14 - 1;
  }
  if (v10 != a1)
    *a1 = *v10;
  *v10 = v4;
  return v10;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = *a1;
      if (COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * v8))) > COERCE_FLOAT(*(_QWORD *)(**a3 + 8 * *(_QWORD *)(*a3[1] + 8 * *a1))))
      {
        *a1 = v8;
        *(a2 - 1) = v9;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v10 = a1 + 2;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a3);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = *a3[1];
      v14 = **a3;
      v15 = 24;
      break;
  }
  while (1)
  {
    v16 = *v11;
    v17 = *v10;
    if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *v11))) > COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *v10))))
    {
      v18 = v15;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v18) = v17;
        v19 = v18 - 8;
        if (v18 == 8)
          break;
        v17 = *(uint64_t *)((char *)a1 + v18 - 16);
        v18 -= 8;
        if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * v16))) <= COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * v17))))
        {
          v20 = (uint64_t *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      v20 = a1;
LABEL_12:
      *v20 = v16;
      if (++v12 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v15 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a2, a3, a5);
  v11 = *a5[1];
  v12 = **a5;
  v13 = *a3;
  if (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a4))) > COERCE_FLOAT(*(_QWORD *)(v12
                                                                                                  + 8 * *(_QWORD *)(v11 + 8 * *a3))))
  {
    *a3 = *a4;
    *a4 = v13;
    v14 = *a2;
    if (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a3))) > COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a2))))
    {
      *a2 = *a3;
      *a3 = v14;
      v15 = *a1;
      if (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a2))) > COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a1))))
      {
        *a1 = *a2;
        *a2 = v15;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t **a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a2, a3, a4, a6);
  v13 = *a6[1];
  v14 = **a6;
  v15 = *a4;
  if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a5))) > COERCE_FLOAT(*(_QWORD *)(v14
                                                                                                  + 8 * *(_QWORD *)(v13 + 8 * *a4))))
  {
    *a4 = *a5;
    *a5 = v15;
    v16 = *a3;
    if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a4))) > COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a3))))
    {
      *a3 = *a4;
      *a4 = v16;
      v17 = *a2;
      if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a3))) > COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a2))))
      {
        *a2 = *a3;
        *a3 = v17;
        v18 = *a1;
        if (COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a2))) > COERCE_FLOAT(*(_QWORD *)(v14 + 8 * *(_QWORD *)(v13 + 8 * *a1))))
        {
          *a1 = *a2;
          *a2 = v18;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        if (COERCE_FLOAT(*(_QWORD *)(**a4 + 8 * *(_QWORD *)(*a4[1] + 8 * *v14))) > COERCE_FLOAT(*(_QWORD *)(**a4 + 8 * *(_QWORD *)(*a4[1] + 8 * *a1))))
        {
          *v14 = *a1;
          *a1 = v15;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v16 = (unint64_t)v8 >> 3;
      v17 = a2 - 1;
      do
      {
        v18 = *a1;
        v19 = std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, (uint64_t)a4, v16);
        if (v17 == v19)
        {
          *v19 = v18;
        }
        else
        {
          *v19 = *v17;
          *v17 = v18;
          std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, (uint64_t)(v19 + 1), a4, v19 + 1 - a1);
        }
        --v17;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t result, uint64_t **a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (uint64_t *)(result + 8 * v7);
      v9 = v6 + 2;
      v10 = *a2;
      if (v6 + 2 >= a3)
      {
        v11 = *a2[1];
        v12 = *v10;
      }
      else
      {
        v11 = *a2[1];
        v12 = *v10;
        if (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *v8))) > COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * v8[1]))))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *v8))) <= COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *a4))))
      {
        do
        {
          v15 = v8;
          *a4 = v13;
          if (v5 < v7)
            break;
          v16 = 2 * v7;
          v7 = (2 * v7) | 1;
          v8 = (uint64_t *)(result + 8 * v7);
          v17 = v16 + 2;
          if (v17 < a3
            && COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *v8))) > COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * v8[1]))))
          {
            ++v8;
            v7 = v17;
          }
          v13 = *v8;
          a4 = v15;
        }
        while (COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * *v8))) <= COERCE_FLOAT(*(_QWORD *)(v12 + 8 * *(_QWORD *)(v11 + 8 * v14))));
        *v15 = v14;
      }
    }
  }
  return result;
}

_QWORD *std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  v6 = *(_QWORD **)a2;
  v7 = *(_QWORD **)(a2 + 8);
  do
  {
    v8 = result;
    result += v3 + 1;
    v9 = 2 * v3;
    v3 = (2 * v3) | 1;
    v10 = v9 + 2;
    if (v10 < a3
      && COERCE_FLOAT(*(_QWORD *)(*v6 + 8 * *(_QWORD *)(*v7 + 8 * *result))) > COERCE_FLOAT(*(_QWORD *)(*v6 + 8 * *(_QWORD *)(*v7 + 8 * result[1]))))
    {
      ++result;
      v3 = v10;
    }
    *v8 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<float>(geom::slice<geom::vector_type<float,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t result, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  if (a4 >= 2)
  {
    v4 = (unint64_t)(a4 - 2) >> 1;
    v5 = (_QWORD *)(result + 8 * v4);
    v6 = *v5;
    v9 = *(_QWORD *)(a2 - 8);
    v7 = (_QWORD *)(a2 - 8);
    v8 = v9;
    v10 = *a3[1];
    v11 = **a3;
    if (COERCE_FLOAT(*(_QWORD *)(v11 + 8 * *(_QWORD *)(v10 + 8 * *v5))) > COERCE_FLOAT(*(_QWORD *)(v11 + 8 * *(_QWORD *)(v10 + 8 * v9))))
    {
      do
      {
        v12 = v5;
        *v7 = v6;
        if (!v4)
          break;
        v4 = (v4 - 1) >> 1;
        v5 = (_QWORD *)(result + 8 * v4);
        v6 = *v5;
        v7 = v12;
      }
      while (COERCE_FLOAT(*(_QWORD *)(v11 + 8 * *(_QWORD *)(v10 + 8 * *v5))) > COERCE_FLOAT(*(_QWORD *)(v11 + 8 * *(_QWORD *)(v10 + 8 * v8))));
      *v12 = v8;
    }
  }
  return result;
}

uint64_t geom::fixed_pool_list<geom::fixed_pool_list<unsigned long>::const_node_iterator>::erase(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[2];
  v3 = (_QWORD *)(v2 + 40 * a2);
  v4 = v3[2];
  v5 = v2 + 40 * v3[3];
  v6 = v2 + 40 * v3[4];
  *(_QWORD *)(v6 + 24) = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v6 + 16);
  v3[3] = -1;
  v3[4] = -1;
  v7 = a1[1] - 1;
  a1[1] = v7;
  *(_QWORD *)(a1[5] + 8 * v7) = v4;
  return *(_QWORD *)(v5 + 16);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,false>(uint64_t result, uint64_t *a2, uint64_t **a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  char v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v20 = *(a2 - 1);
        v21 = *v9;
        if (*(double *)(**a3 + 16 * *(_QWORD *)(*a3[1] + 8 * v20)) > *(double *)(**a3
                                                                                  + 16 * *(_QWORD *)(*a3[1] + 8 * *v9)))
        {
          *v9 = v20;
          *(a2 - 1) = v21;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, a2 - 1, a3);
      case 4uLL:
        return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, v9 + 2, a2 - 1, a3);
      case 5uLL:
        return std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, a3);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, a2, a3);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(&v9[v13 >> 1], v9, a2 - 1, a3);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, &v9[v13 >> 1], a2 - 1, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9 + 1, v15 - 1, a2 - 2, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9 + 2, &v9[v14 + 1], a2 - 3, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v15 - 1, v15, &v9[v14 + 1], a3);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (*(double *)(**a3 + 16 * *(_QWORD *)(*a3[1] + 8 * *(v9 - 1))) <= *(double *)(**a3
                                                                                           + 16
                                                                                           * *(_QWORD *)(*a3[1] + 8 * *v9)))
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(v9, a2, a3);
            v9 = (uint64_t *)result;
            goto LABEL_17;
          }
LABEL_12:
          v17 = std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(v9, a2, a3);
          if ((v18 & 1) == 0)
            goto LABEL_15;
          v19 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v9, v17, a3);
          v9 = v17 + 1;
          result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(v17 + 1, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v19)
              continue;
LABEL_15:
            result = std::__introsort<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,false>(v8, v17, a3, -v11, a5 & 1);
            v9 = v17 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v17;
          if (v19)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,unsigned long *>(v9, a2, a2, a3);
        return result;
    }
  }
}

uint64_t *std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;

  if (result != a2)
  {
    v3 = result + 1;
    if (result + 1 != a2)
    {
      v4 = 0;
      v5 = *a3[1];
      v6 = **a3;
      v7 = result;
      do
      {
        v9 = *v7;
        v8 = v7[1];
        v7 = v3;
        if (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v8)) > *(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v9)))
        {
          v10 = v4;
          while (1)
          {
            *(uint64_t *)((char *)result + v10 + 8) = v9;
            if (!v10)
              break;
            v9 = *(uint64_t *)((char *)result + v10 - 8);
            v10 -= 8;
            if (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v8)) <= *(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v9)))
            {
              v11 = (uint64_t *)((char *)result + v10 + 8);
              goto LABEL_10;
            }
          }
          v11 = result;
LABEL_10:
          *v11 = v8;
        }
        v3 = v7 + 1;
        v4 += 8;
      }
      while (v7 + 1 != a2);
    }
  }
  return result;
}

uint64_t *std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *result, uint64_t *a2, uint64_t **a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result != a2)
  {
    v3 = result + 1;
    if (result + 1 != a2)
    {
      v4 = *a3[1];
      v5 = **a3;
      do
      {
        v7 = *result;
        v6 = result[1];
        result = v3;
        if (*(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v6)) > *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v7)))
        {
          do
          {
            *v3 = v7;
            v7 = *(v3 - 2);
            --v3;
          }
          while (*(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v6)) > *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v7)));
          *v3 = v6;
        }
        v3 = result + 1;
      }
      while (result + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v4 = *a2;
  v5 = *a1;
  v6 = *a4[1];
  v7 = **a4;
  v8 = *(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a2));
  v9 = *a3;
  v10 = *(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a3));
  if (v8 > *(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a1)))
  {
    if (v10 > v8)
    {
      *a1 = v9;
      *a3 = v5;
      return 1;
    }
    *a1 = v4;
    *a2 = v5;
    if (*(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a3)) <= *(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * v5)))
      return 1;
    *a2 = *a3;
    *a3 = v5;
    return 2;
  }
  if (v10 > v8)
  {
    *a2 = v9;
    *a3 = v4;
    v11 = *a1;
    if (*(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a2)) <= *(double *)(v7 + 16 * *(_QWORD *)(v6 + 8 * *a1)))
      return 1;
    *a1 = *a2;
    *a2 = v11;
    return 2;
  }
  return 0;
}

uint64_t *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *a1;
  v4 = *a3[1];
  v5 = **a3;
  v6 = *(_OWORD *)(v5 + 16 * *(_QWORD *)(v4 + 8 * *a1));
  if (*(double *)&v6 <= *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * *(a2 - 1))))
  {
    v9 = a1 + 1;
    do
    {
      v7 = v9;
      if (v9 >= a2)
        break;
      ++v9;
    }
    while (*(double *)&v6 <= *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * *v7)));
  }
  else
  {
    v7 = a1;
    do
    {
      v8 = v7[1];
      ++v7;
    }
    while (*(double *)&v6 <= *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v8)));
  }
  if (v7 < a2)
  {
    do
      v10 = *--a2;
    while (*(double *)&v6 > *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v10)));
  }
  if (v7 < a2)
  {
    v11 = *v7;
    v12 = *a2;
    do
    {
      *v7 = v12;
      *a2 = v11;
      v13 = *(_OWORD *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v3));
      do
      {
        v14 = v7[1];
        ++v7;
        v11 = v14;
      }
      while (*(double *)&v13 <= *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v14)));
      do
      {
        v15 = *--a2;
        v12 = v15;
      }
      while (*(double *)&v13 > *(double *)(v5 + 16 * *(_QWORD *)(v4 + 8 * v15)));
    }
    while (v7 < a2);
  }
  if (v7 - 1 != a1)
    *a1 = *(v7 - 1);
  *(v7 - 1) = v3;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,unsigned long *,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = 0;
  v4 = *a1;
  v5 = *a3[1];
  v6 = **a3;
  v7 = *(_OWORD *)(v6 + 16 * *(_QWORD *)(v5 + 8 * *a1));
  do
    v8 = a1[++v3];
  while (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v8)) > *(double *)&v7);
  v9 = &a1[v3];
  v10 = &a1[v3 - 1];
  if (v3 == 1)
  {
    do
    {
      if (v9 >= a2)
        break;
      v12 = *--a2;
    }
    while (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v12)) <= *(double *)&v7);
  }
  else
  {
    do
      v11 = *--a2;
    while (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v11)) <= *(double *)&v7);
  }
  if (v9 < a2)
  {
    v13 = *a2;
    v14 = &a1[v3];
    v15 = a2;
    do
    {
      *v14 = v13;
      *v15 = v8;
      v16 = *(_OWORD *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v4));
      do
      {
        v17 = v14[1];
        ++v14;
        v8 = v17;
      }
      while (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v17)) > *(double *)&v16);
      do
      {
        v18 = *--v15;
        v13 = v18;
      }
      while (*(double *)(v6 + 16 * *(_QWORD *)(v5 + 8 * v18)) <= *(double *)&v16);
    }
    while (v14 < v15);
    v10 = v14 - 1;
  }
  if (v10 != a1)
    *a1 = *v10;
  *v10 = v4;
  return v10;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t **a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = *a1;
      if (*(double *)(**a3 + 16 * *(_QWORD *)(*a3[1] + 8 * v8)) > *(double *)(**a3
                                                                               + 16 * *(_QWORD *)(*a3[1] + 8 * *a1)))
      {
        *a1 = v8;
        *(a2 - 1) = v9;
      }
      return result;
    case 3:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v10 = a1 + 2;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a1 + 1, a1 + 2, a3);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = *a3[1];
      v14 = **a3;
      v15 = 24;
      break;
  }
  while (1)
  {
    v16 = *v11;
    v17 = *v10;
    if (*(double *)(v14 + 16 * *(_QWORD *)(v13 + 8 * *v11)) > *(double *)(v14 + 16 * *(_QWORD *)(v13 + 8 * *v10)))
    {
      v18 = v15;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v18) = v17;
        v19 = v18 - 8;
        if (v18 == 8)
          break;
        v17 = *(uint64_t *)((char *)a1 + v18 - 16);
        v18 -= 8;
        if (*(double *)(v14 + 16 * *(_QWORD *)(v13 + 8 * v16)) <= *(double *)(v14 + 16 * *(_QWORD *)(v13 + 8 * v17)))
        {
          v20 = (uint64_t *)((char *)a1 + v19);
          goto LABEL_12;
        }
      }
      v20 = a1;
LABEL_12:
      *v20 = v16;
      if (++v12 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v15 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t **a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a2, a3, a5);
  v11 = *a3;
  v12 = *a5[1];
  v13 = **a5;
  if (*(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a4)) > *(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a3)))
  {
    *a3 = *a4;
    *a4 = v11;
    v14 = *a2;
    if (*(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a3)) > *(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a2)))
    {
      *a2 = *a3;
      *a3 = v14;
      v15 = *a1;
      if (*(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a2)) > *(double *)(v13 + 16 * *(_QWORD *)(v12 + 8 * *a1)))
      {
        *a1 = *a2;
        *a2 = v15;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t **a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, a2, a3, a4, a6);
  v13 = *a4;
  v14 = *a6[1];
  v15 = **a6;
  if (*(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a5)) > *(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a4)))
  {
    *a4 = *a5;
    *a5 = v13;
    v16 = *a3;
    if (*(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a4)) > *(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a3)))
    {
      *a3 = *a4;
      *a4 = v16;
      v17 = *a2;
      if (*(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a3)) > *(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a2)))
      {
        *a2 = *a3;
        *a3 = v17;
        v18 = *a1;
        if (*(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a2)) > *(double *)(v15 + 16 * *(_QWORD *)(v14 + 8 * *a1)))
        {
          *a1 = *a2;
          *a2 = v18;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *,unsigned long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t **a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        if (*(double *)(**a4 + 16 * *(_QWORD *)(*a4[1] + 8 * *v14)) > *(double *)(**a4
                                                                                   + 16
                                                                                   * *(_QWORD *)(*a4[1] + 8 * *a1)))
        {
          *v14 = *a1;
          *a1 = v15;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v16 = (unint64_t)v8 >> 3;
      v17 = a2 - 1;
      do
      {
        v18 = *a1;
        v19 = std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(a1, (uint64_t)a4, v16);
        if (v17 == v19)
        {
          *v19 = v18;
        }
        else
        {
          *v19 = *v17;
          *v17 = v18;
          std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>((uint64_t)a1, (uint64_t)(v19 + 1), a4, v19 + 1 - a1);
        }
        --v17;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t result, uint64_t **a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (uint64_t *)(result + 8 * v7);
      v9 = v6 + 2;
      v10 = *a2;
      if (v6 + 2 >= a3)
      {
        v11 = *a2[1];
        v12 = *v10;
      }
      else
      {
        v11 = *a2[1];
        v12 = *v10;
        if (*(double *)(v12 + 16 * *(_QWORD *)(v11 + 8 * *v8)) > *(double *)(v12 + 16
                                                                                    * *(_QWORD *)(v11 + 8 * v8[1])))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(double *)(v12 + 16 * *(_QWORD *)(v11 + 8 * *v8)) <= *(double *)(v12 + 16 * *(_QWORD *)(v11 + 8 * *a4)))
      {
        do
        {
          v15 = v8;
          *a4 = v13;
          if (v5 < v7)
            break;
          v16 = 2 * v7;
          v7 = (2 * v7) | 1;
          v8 = (uint64_t *)(result + 8 * v7);
          v17 = v16 + 2;
          if (v17 < a3
            && *(double *)(v12 + 16 * *(_QWORD *)(v11 + 8 * *v8)) > *(double *)(v12
                                                                                + 16 * *(_QWORD *)(v11 + 8 * v8[1])))
          {
            ++v8;
            v7 = v17;
          }
          v13 = *v8;
          a4 = v15;
        }
        while (*(double *)(v12 + 16 * *(_QWORD *)(v11 + 8 * *v8)) <= *(double *)(v12
                                                                                  + 16 * *(_QWORD *)(v11 + 8 * v14)));
        *v15 = v14;
      }
    }
  }
  return result;
}

_QWORD *std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  v6 = *(_QWORD **)a2;
  v7 = *(_QWORD **)(a2 + 8);
  do
  {
    v8 = result;
    result += v3 + 1;
    v9 = 2 * v3;
    v3 = (2 * v3) | 1;
    v10 = v9 + 2;
    if (v10 < a3
      && *(double *)(*v6 + 16 * *(_QWORD *)(*v7 + 8 * *result)) > *(double *)(*v6
                                                                                + 16
                                                                                * *(_QWORD *)(*v7 + 8 * result[1])))
    {
      ++result;
      v3 = v10;
    }
    *v8 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,void geom::triangulate_by_ear_clipping<double>(geom::slice<geom::vector_type<double,(unsigned char)2,void>::value> const&,geom::slice<unsigned int> const&,std::vector<unsigned int> &)::{lambda(unsigned long,unsigned long)#1} &,unsigned long *>(uint64_t result, uint64_t a2, uint64_t **a3, uint64_t a4)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  if (a4 >= 2)
  {
    v4 = (unint64_t)(a4 - 2) >> 1;
    v5 = (_QWORD *)(result + 8 * v4);
    v6 = *v5;
    v9 = *(_QWORD *)(a2 - 8);
    v7 = (_QWORD *)(a2 - 8);
    v8 = v9;
    v10 = *a3[1];
    v11 = **a3;
    if (*(double *)(v11 + 16 * *(_QWORD *)(v10 + 8 * *v5)) > *(double *)(v11 + 16 * *(_QWORD *)(v10 + 8 * v9)))
    {
      do
      {
        v12 = v5;
        *v7 = v6;
        if (!v4)
          break;
        v4 = (v4 - 1) >> 1;
        v5 = (_QWORD *)(result + 8 * v4);
        v6 = *v5;
        v7 = v12;
      }
      while (*(double *)(v11 + 16 * *(_QWORD *)(v10 + 8 * *v5)) > *(double *)(v11 + 16
                                                                                       * *(_QWORD *)(v10 + 8 * v8)));
      *v12 = v8;
    }
  }
  return result;
}

OS_geom_interpolating_curve_1f __swiftcall OS_geom_interpolating_curve_1f.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_1f)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_1f, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_1f);
}

Swift::tuple_Float_Float __swiftcall OS_geom_interpolating_curve_1f.knots(span:)(Swift::Int span)
{
  float v1;
  float v2;
  Swift::tuple_Float_Float result;

  v1 = sub_228989D7C(span, (void (*)(uint64_t, _QWORD, char *, _QWORD *))geom_interpolating_curve_get_knots_1f);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_1d __swiftcall OS_geom_interpolating_curve_1d.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_1d)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_1d, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_1d);
}

Swift::tuple_Double_Double __swiftcall OS_geom_interpolating_curve_1d.knots(span:)(Swift::Int span)
{
  double v1;
  double v2;
  Swift::tuple_Double_Double result;

  v1 = sub_228989E98(span, (void (*)(uint64_t, _QWORD, _QWORD *, uint64_t *))geom_interpolating_curve_get_knots_1d);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_2f __swiftcall OS_geom_interpolating_curve_2f.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_2f)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_2f, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_2f);
}

Swift::tuple_Float_Float __swiftcall OS_geom_interpolating_curve_2f.knots(span:)(Swift::Int span)
{
  float v1;
  float v2;
  Swift::tuple_Float_Float result;

  v1 = sub_228989D7C(span, (void (*)(uint64_t, _QWORD, char *, _QWORD *))geom_interpolating_curve_get_knots_2f);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_2d __swiftcall OS_geom_interpolating_curve_2d.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_2d)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_2d, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_2d);
}

Swift::tuple_Double_Double __swiftcall OS_geom_interpolating_curve_2d.knots(span:)(Swift::Int span)
{
  double v1;
  double v2;
  Swift::tuple_Double_Double result;

  v1 = sub_228989E98(span, (void (*)(uint64_t, _QWORD, _QWORD *, uint64_t *))geom_interpolating_curve_get_knots_2d);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_3f __swiftcall OS_geom_interpolating_curve_3f.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_3f)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_3f, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_3f);
}

Swift::tuple_Float_Float __swiftcall OS_geom_interpolating_curve_3f.knots(span:)(Swift::Int span)
{
  float v1;
  float v2;
  Swift::tuple_Float_Float result;

  v1 = sub_228989D7C(span, (void (*)(uint64_t, _QWORD, char *, _QWORD *))geom_interpolating_curve_get_knots_3f);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_3d __swiftcall OS_geom_interpolating_curve_3d.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_3d)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_3d, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_3d);
}

Swift::tuple_Double_Double __swiftcall OS_geom_interpolating_curve_3d.knots(span:)(Swift::Int span)
{
  double v1;
  double v2;
  Swift::tuple_Double_Double result;

  v1 = sub_228989E98(span, (void (*)(uint64_t, _QWORD, _QWORD *, uint64_t *))geom_interpolating_curve_get_knots_3d);
  result._1 = v2;
  result._0 = v1;
  return result;
}

OS_geom_interpolating_curve_4f __swiftcall OS_geom_interpolating_curve_4f.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_4f)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_4f, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_4f);
}

Swift::tuple_Float_Float __swiftcall OS_geom_interpolating_curve_4f.knots(span:)(Swift::Int span)
{
  float v1;
  float v2;
  Swift::tuple_Float_Float result;

  v1 = sub_228989D7C(span, (void (*)(uint64_t, _QWORD, char *, _QWORD *))geom_interpolating_curve_get_knots_4f);
  result._1 = v2;
  result._0 = v1;
  return result;
}

float sub_228989D7C(unint64_t a1, void (*a2)(uint64_t, _QWORD, char *, _QWORD *))
{
  uint64_t v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16)
    goto LABEL_5;
  a2(v2, (unsigned __int16)a1, (char *)v4 + 4, v4);
  return *((float *)v4 + 1);
}

OS_geom_interpolating_curve_4d __swiftcall OS_geom_interpolating_curve_4d.init(keys:arcLengthParameterized:)(Swift::OpaquePointer keys, Swift::Bool arcLengthParameterized)
{
  return (OS_geom_interpolating_curve_4d)sub_228989E08((uint64_t)keys._rawValue, arcLengthParameterized, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_arc_length_parameterized_4d, (uint64_t (*)(uint64_t, uint64_t))geom_create_interpolating_curve_4d);
}

uint64_t sub_228989E08(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 16);
  if ((a2 & 1) != 0)
    v6 = a3(v5, a1 + 32);
  else
    v6 = a4(v5, a1 + 32);
  v7 = v6;
  swift_bridgeObjectRelease();
  return v7;
}

Swift::tuple_Double_Double __swiftcall OS_geom_interpolating_curve_4d.knots(span:)(Swift::Int span)
{
  double v1;
  double v2;
  Swift::tuple_Double_Double result;

  v1 = sub_228989E98(span, (void (*)(uint64_t, _QWORD, _QWORD *, uint64_t *))geom_interpolating_curve_get_knots_4d);
  result._1 = v2;
  result._0 = v1;
  return result;
}

double sub_228989E98(unint64_t a1, void (*a2)(uint64_t, _QWORD, _QWORD *, uint64_t *))
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5[0] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16)
    goto LABEL_5;
  a2(v2, (unsigned __int16)a1, v5, &v4);
  return *(double *)v5;
}

void type metadata accessor for BVHBuiltInCreateStrategy(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21A0);
}

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void type metadata accessor for QuadraticBezier2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21A8);
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void type metadata accessor for CubicBezier2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21B0);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_228989F8C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_228989FAC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for QuadraticBezier2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21B8);
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21C0);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_22898A00C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CubicBezier2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21C8);
}

void type metadata accessor for PlanePointNormal3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21D0);
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for PlanePointNormal3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21D8);
}

void type metadata accessor for Line2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21E0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for Line2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21E8);
}

void type metadata accessor for LineSegment3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21F0);
}

void type metadata accessor for LineSegment3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D21F8);
}

void type metadata accessor for LineSegment2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2200);
}

void type metadata accessor for LineSegment2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2208);
}

__n128 __swift_memcpy96_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void type metadata accessor for Triangle3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2210);
}

void type metadata accessor for Triangle3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2218);
}

void type metadata accessor for Sphere3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2220);
}

void type metadata accessor for Sphere3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2228);
}

__n128 __swift_memcpy160_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

void type metadata accessor for OrientedBBox3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2230);
}

__n128 __swift_memcpy80_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_22898A1CC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A1EC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 80) = v3;
  return result;
}

void type metadata accessor for OrientedBBox3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2238);
}

void type metadata accessor for OrientedBBox2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2240);
}

void type metadata accessor for OrientedBBox2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2248);
}

__n128 __swift_memcpy224_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v10;
  return result;
}

uint64_t sub_22898A2A4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 224))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A2C4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 224) = v3;
  return result;
}

void type metadata accessor for Dop26Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2250);
}

__n128 __swift_memcpy128_16(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

void type metadata accessor for Dop26Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2258);
}

void type metadata accessor for Dop20Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2260);
}

void type metadata accessor for Dop20Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2268);
}

uint64_t sub_22898A39C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 160))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A3BC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 160) = v3;
  return result;
}

void type metadata accessor for Dop18Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2270);
}

void type metadata accessor for Dop18Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2278);
}

uint64_t sub_22898A438(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A458(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 128) = v3;
  return result;
}

void type metadata accessor for Dop14Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2280);
}

void type metadata accessor for Dop14Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2288);
}

uint64_t sub_22898A4CC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A4EC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 96) = v3;
  return result;
}

void type metadata accessor for Dop12Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2290);
}

void type metadata accessor for Dop12Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2298);
}

void type metadata accessor for Dop8Axes3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22A0);
}

void type metadata accessor for Dop8Axes3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22A8);
}

void type metadata accessor for Node(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22B0);
}

void type metadata accessor for BBox3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22B8);
}

void _s3__C4NodeVMa_0(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22C0);
}

void type metadata accessor for BBox2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22C8);
}

void _s3__C4NodeVMa_1(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22D0);
}

void type metadata accessor for BBox3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22D8);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_22898A60C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A62C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void _s3__C4NodeVMa_2(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22E0);
}

void type metadata accessor for BBox2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22E8);
}

uint64_t sub_22898A688(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A6A8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for Plane3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22F0);
}

void type metadata accessor for Plane3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D22F8);
}

void type metadata accessor for simd_double3x3(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2300);
}

uint64_t sub_22898A71C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A73C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for Ray3d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2308);
}

uint64_t sub_22898A78C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_22898A7BC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

void type metadata accessor for Ray2d(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2310);
}

void type metadata accessor for Ray3f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2318);
}

uint64_t sub_22898A804(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22898A824(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for Ray2f(uint64_t a1)
{
  sub_22898A860(a1, &qword_2559D2320);
}

void sub_22898A860(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

double geom_oriented_bbox_2f.init(points:)(uint64_t a1)
{
  double v1;

  v1 = geom_robust_oriented_bounding_box_2f(*(_QWORD *)(a1 + 16), (_QWORD *)(a1 + 32));
  swift_bridgeObjectRelease();
  return v1;
}

__n128 geom_oriented_bbox_2d.init(points:)(uint64_t a1)
{
  __int128 v1;
  __int128 v3;

  *(double *)&v1 = geom_robust_oriented_bounding_box_2d(*(_QWORD *)(a1 + 16), (_OWORD *)(a1 + 32));
  v3 = v1;
  swift_bridgeObjectRelease();
  return (__n128)v3;
}

__n128 geom_oriented_bbox_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  __n128 result;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9[5];

  geom_oriented_bounding_box_3f(a1[1].u64[0], a1 + 2, v9);
  v7 = v9[1];
  v8 = v9[0];
  v5 = v9[3];
  v6 = v9[2];
  v4 = v9[4];
  swift_bridgeObjectRelease();
  *a2 = v8;
  a2[1] = v7;
  a2[2] = v6;
  a2[3] = v5;
  result = (__n128)v4;
  a2[4] = v4;
  return result;
}

__n128 geom_oriented_bbox_3d.init(_:)@<Q0>(uint64_t a1@<X0>, float64x2_t *a2@<X8>)
{
  __n128 result;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14[10];

  geom_oriented_bounding_box_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), v14);
  v12 = v14[2];
  v13 = v14[0];
  v7 = v14[3];
  v8 = v14[1];
  v10 = v14[6];
  v11 = v14[4];
  v5 = v14[7];
  v6 = v14[5];
  v9 = v14[8];
  v4 = v14[9];
  swift_bridgeObjectRelease();
  *a2 = v13;
  a2[1] = v8;
  a2[2] = v12;
  a2[3] = v7;
  a2[4] = v11;
  a2[5] = v6;
  a2[6] = v10;
  a2[7] = v5;
  result = (__n128)v9;
  a2[8] = v9;
  a2[9] = v4;
  return result;
}

__n128 geom_bbox_3f.init(points:)(float32x4_t *a1)
{
  __int128 v1;
  __int128 v3;

  *(double *)&v1 = geom_dop6_for_points_3f(a1[1].i64[0], a1 + 2);
  v3 = v1;
  swift_bridgeObjectRelease();
  return (__n128)v3;
}

__n128 geom_dop8_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result;
  __n128 v4;
  __int128 v5;
  _OWORD v6[2];

  geom_dop8_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v6);
  v4 = (__n128)v6[1];
  v5 = v6[0];
  swift_bridgeObjectRelease();
  result = v4;
  *a2 = v5;
  a2[1] = v4;
  return result;
}

__n128 geom_dop12_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;

  geom_dop12_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)&v8);
  v3 = v9;
  v6 = v10;
  v7 = v8;
  v4 = v11;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v7;
  *(_QWORD *)(a2 + 16) = v3;
  result = v6;
  *(__n128 *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 48) = v4;
  return result;
}

__n128 geom_dop14_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __n128 v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  __n128 v13;
  uint64_t v14;
  int v15;

  geom_dop14_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)&v10);
  v3 = v12;
  v4 = v15;
  v5 = v11;
  v8 = v10;
  v9 = v13;
  v6 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v8;
  *(_QWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 24) = v3;
  result = v9;
  *(__n128 *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 48) = v6;
  *(_DWORD *)(a2 + 56) = v4;
  return result;
}

__n128 geom_dop18_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  int v3;
  int v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __n128 v8;
  __int128 v9;
  _OWORD v10[2];
  int v11;
  __int128 v12;
  __n128 v13;
  int v14;

  geom_dop18_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v10);
  v3 = v11;
  v4 = v14;
  v6 = v10[1];
  v7 = v10[0];
  v8 = v13;
  v9 = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v6;
  *(_DWORD *)(a2 + 32) = v3;
  result = v8;
  *(_OWORD *)(a2 + 48) = v9;
  *(__n128 *)(a2 + 64) = v8;
  *(_DWORD *)(a2 + 80) = v4;
  return result;
}

__n128 geom_dop20_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __n128 v13;
  uint64_t v14;

  geom_dop20_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v10);
  v8 = v10[1];
  v9 = v10[0];
  v3 = v11;
  v6 = v13;
  v7 = v12;
  v4 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v9;
  *(_OWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 32) = v3;
  result = v6;
  *(_OWORD *)(a2 + 48) = v7;
  *(__n128 *)(a2 + 64) = v6;
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

__n128 geom_dop26_3f.init(points:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  int v3;
  int v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];
  int v13;
  __int128 v14;
  __int128 v15;
  __n128 v16;
  int v17;

  geom_dop26_for_points_3f(a1[1].i64[0], a1 + 2, (uint64_t)v12);
  v3 = v13;
  v4 = v17;
  v7 = v12[1];
  v8 = v12[0];
  v6 = v12[2];
  v10 = v15;
  v11 = v14;
  v9 = v16;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v8;
  *(_OWORD *)(a2 + 16) = v7;
  *(_OWORD *)(a2 + 32) = v6;
  *(_DWORD *)(a2 + 48) = v3;
  *(_OWORD *)(a2 + 64) = v11;
  *(_OWORD *)(a2 + 80) = v10;
  result = v9;
  *(__n128 *)(a2 + 96) = v9;
  *(_DWORD *)(a2 + 112) = v4;
  return result;
}

__n128 geom_bbox_3d.init(points:)(uint64_t a1)
{
  __int128 v2;
  __int128 v3;

  geom_dop6_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)&v3);
  v2 = v3;
  swift_bridgeObjectRelease();
  return (__n128)v2;
}

__n128 geom_dop8_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  geom_dop8_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v12, a3, a4, a5);
  v10 = v12[1];
  v11 = v12[0];
  v9 = (__n128)v12[2];
  v6 = v13;
  v7 = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v11;
  *(_OWORD *)(a2 + 16) = v10;
  result = v9;
  *(__n128 *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 48) = v6;
  *(_QWORD *)(a2 + 56) = v7;
  return result;
}

__n128 geom_dop12_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[5];
  uint64_t v12;
  uint64_t v13;

  geom_dop12_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v11);
  v9 = v11[1];
  v10 = v11[0];
  v7 = v11[3];
  v8 = v11[2];
  v6 = (__n128)v11[4];
  v3 = v12;
  v4 = v13;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v10;
  *(_OWORD *)(a2 + 16) = v9;
  *(_OWORD *)(a2 + 32) = v8;
  *(_OWORD *)(a2 + 48) = v7;
  result = v6;
  *(__n128 *)(a2 + 64) = v6;
  *(_QWORD *)(a2 + 80) = v3;
  *(_QWORD *)(a2 + 88) = v4;
  return result;
}

__n128 geom_dop14_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[3];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __n128 v19;
  uint64_t v20;

  geom_dop14_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v15, a3, a4, a5);
  v13 = v15[1];
  v14 = v15[0];
  v6 = v16;
  v11 = v17;
  v12 = v15[2];
  v9 = v19;
  v10 = v18;
  v7 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v14;
  *(_OWORD *)(a2 + 16) = v13;
  *(_OWORD *)(a2 + 32) = v12;
  *(_QWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v11;
  *(_OWORD *)(a2 + 80) = v10;
  result = v9;
  *(__n128 *)(a2 + 96) = v9;
  *(_QWORD *)(a2 + 112) = v7;
  return result;
}

__n128 geom_dop18_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[4];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __n128 v19;
  uint64_t v20;

  geom_dop18_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v14);
  v12 = v14[1];
  v13 = v14[0];
  v10 = v14[3];
  v11 = v14[2];
  v3 = v15;
  v8 = v17;
  v9 = v16;
  v6 = v19;
  v7 = v18;
  v4 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v13;
  *(_OWORD *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v10;
  *(_QWORD *)(a2 + 64) = v3;
  *(_OWORD *)(a2 + 80) = v9;
  *(_OWORD *)(a2 + 96) = v8;
  result = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 128) = v6;
  *(_QWORD *)(a2 + 144) = v4;
  return result;
}

__n128 geom_dop20_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[9];
  uint64_t v19;
  uint64_t v20;

  geom_dop20_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v18, a3, a4, a5);
  v16 = v18[1];
  v17 = v18[0];
  v14 = v18[3];
  v15 = v18[2];
  v12 = v18[5];
  v13 = v18[4];
  v10 = v18[7];
  v11 = v18[6];
  v9 = (__n128)v18[8];
  v6 = v19;
  v7 = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v17;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v13;
  *(_OWORD *)(a2 + 80) = v12;
  *(_OWORD *)(a2 + 96) = v11;
  *(_OWORD *)(a2 + 112) = v10;
  result = v9;
  *(__n128 *)(a2 + 128) = v9;
  *(_QWORD *)(a2 + 144) = v6;
  *(_QWORD *)(a2 + 152) = v7;
  return result;
}

__n128 geom_dop26_3d.init(points:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, float64x2_t a5@<Q2>)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[6];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __n128 v28;
  uint64_t v29;

  geom_dop26_for_points_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), (uint64_t)v21, a3, a4, a5);
  v19 = v21[1];
  v20 = v21[0];
  v17 = v21[3];
  v18 = v21[2];
  v15 = v21[5];
  v16 = v21[4];
  v6 = v22;
  v13 = v24;
  v14 = v23;
  v11 = v26;
  v12 = v25;
  v9 = v28;
  v10 = v27;
  v7 = v29;
  swift_bridgeObjectRelease();
  *(_OWORD *)a2 = v20;
  *(_OWORD *)(a2 + 16) = v19;
  *(_OWORD *)(a2 + 32) = v18;
  *(_OWORD *)(a2 + 48) = v17;
  *(_OWORD *)(a2 + 64) = v16;
  *(_OWORD *)(a2 + 80) = v15;
  *(_QWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v14;
  *(_OWORD *)(a2 + 128) = v13;
  *(_OWORD *)(a2 + 144) = v12;
  *(_OWORD *)(a2 + 160) = v11;
  result = v9;
  *(_OWORD *)(a2 + 176) = v10;
  *(__n128 *)(a2 + 192) = v9;
  *(_QWORD *)(a2 + 208) = v7;
  return result;
}

Swift::Void __swiftcall convexHull(points:hull:)(Swift::OpaquePointer points, OS_geom_collection_u *hull)
{
  geom_convex_hull_2f(*((_QWORD *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)hull->super.isa);
}

{
  geom_convex_hull_2d(*((_QWORD *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)hull->super.isa);
}

Swift::Void __swiftcall convexHull(points:hullVertexIndices:hullFaceAccumulatedValence:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence)
{
  geom_convex_hull_3f(*((_QWORD *)points._rawValue + 2), (float32x4_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa);
}

{
  geom_convex_hull_3d(*((_QWORD *)points._rawValue + 2), (float64x2_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa);
}

Swift::Float __swiftcall convexHullApproximate(points:hullVertexIndices:hullFaceAccumulatedValence:maxIterations:coplanarityTolerance:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence, Swift::Int maxIterations, Swift::Float coplanarityTolerance)
{
  if (maxIterations < 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(maxIterations))
  {
    return geom_convex_hull_approx_with_tolerance_3f(*((_QWORD *)points._rawValue + 2), (float32x4_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa, maxIterations, coplanarityTolerance);
  }
  __break(1u);
  return coplanarityTolerance;
}

Swift::Double __swiftcall convexHullApproximate(points:hullVertexIndices:hullFaceAccumulatedValence:maxIterations:coplanarityTolerance:)(Swift::OpaquePointer points, OS_geom_collection_u *hullVertexIndices, OS_geom_collection_u *hullFaceAccumulatedValence, Swift::Int maxIterations, Swift::Double coplanarityTolerance)
{
  if (maxIterations < 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(maxIterations))
  {
    return geom_convex_hull_approx_with_tolerance_3d(*((_QWORD *)points._rawValue + 2), (float64x2_t *)points._rawValue + 2, (uint64_t)hullVertexIndices->super.isa, (uint64_t)hullFaceAccumulatedValence->super.isa, maxIterations, coplanarityTolerance);
  }
  __break(1u);
  return coplanarityTolerance;
}

OS_geom_exact_winding_number_3f __swiftcall OS_geom_exact_winding_number_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_exact_winding_number_3f)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3f);
}

uint64_t sub_22898B3D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3f, a3);
}

void sub_22898B3DC(float32x4_t *a1@<X0>, float *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_query_exact_winding_number_3f(*v2, *a1);
}

OS_geom_exact_winding_number_3d __swiftcall OS_geom_exact_winding_number_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_exact_winding_number_3d)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3d);
}

uint64_t sub_22898B414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_exact_winding_number_3d, a3);
}

void sub_22898B420(float64x2_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t *v2;
  float64x2_t v3;
  float64x2_t v4;
  uint64_t v5;
  float64x2_t v6[2];

  v3 = *a1;
  v4 = a1[1];
  v5 = *v2;
  v6[0] = v3;
  v6[1] = v4;
  *a2 = geom_query_exact_winding_number_3d(v5, v6);
}

OS_geom_approximate_winding_number_3f __swiftcall OS_geom_approximate_winding_number_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_approximate_winding_number_3f)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3f);
}

uint64_t sub_22898B468@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3f, a3);
}

void sub_22898B474(float32x4_t *a1@<X0>, float *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_query_approximate_winding_number_3f(*v2, *a1);
}

OS_geom_approximate_winding_number_3d __swiftcall OS_geom_approximate_winding_number_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_approximate_winding_number_3d)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3d);
}

uint64_t sub_22898B4AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v3;

  v3 = a3(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22898B514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_approximate_winding_number_3d, a3);
}

uint64_t sub_22898B520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD, uint64_t, unint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = a3(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_22898B588(float64x2_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t *v2;
  float64x2_t v3;
  float64x2_t v4;
  uint64_t v5;
  float64x2_t v6[2];

  v3 = *a1;
  v4 = a1[1];
  v5 = *v2;
  v6[0] = v3;
  v6[1] = v4;
  *a2 = geom_query_approximate_winding_number_3d(v5, v6);
}

void sub_22898B5C4(_QWORD *a1@<X8>)
{
  uint64_t v2;

  geom_create_approximate_convex_decomposition_opt_3f();
  *a1 = v2;
}

uint64_t sub_22898B5E8()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_opt_get_max_cluster_count_3f(*v0);
}

uint64_t sub_22898B5F0(int a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3f(*v1, a1);
}

uint64_t (*sub_22898B5FC(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_max_cluster_count_3f(v3);
  return sub_22898B634;
}

uint64_t sub_22898B634(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3f(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

void sub_22898B644(float *a1@<X8>)
{
  uint64_t *v1;

  *a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3f(*v1);
}

uint64_t sub_22898B66C(float *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3f(*v1, *a1);
}

uint64_t (*sub_22898B678(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(float *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3f(v3);
  return sub_22898B6B0;
}

uint64_t sub_22898B6B0(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3f(*(_QWORD *)a1, *(float *)(a1 + 8));
}

void sub_22898B6C0(float *a1@<X8>)
{
  uint64_t *v1;

  *a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3f(*v1);
}

uint64_t sub_22898B6E8(float *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3f(*v1, *a1);
}

uint64_t (*sub_22898B6F4(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(float *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3f(v3);
  return sub_22898B72C;
}

uint64_t sub_22898B72C(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3f(*(_QWORD *)a1, *(float *)(a1 + 8));
}

uint64_t sub_22898B73C()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3f(*v0);
}

uint64_t sub_22898B754(char a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3f(*v1, a1 & 1);
}

uint64_t (*sub_22898B764(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3f(v3);
  return sub_22898B79C;
}

uint64_t sub_22898B79C(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void sub_22898B7AC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  geom_create_approximate_convex_decomposition_opt_3d();
  *a1 = v2;
}

uint64_t sub_22898B7D0()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_opt_get_max_cluster_count_3d(*v0);
}

uint64_t sub_22898B7D8(int a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3d(*v1, a1);
}

uint64_t (*sub_22898B7E4(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_max_cluster_count_3d(v3);
  return sub_22898B81C;
}

uint64_t sub_22898B81C(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_max_cluster_count_3d(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

void sub_22898B82C(double *a1@<X8>)
{
  uint64_t *v1;

  *a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3d(*v1);
}

uint64_t sub_22898B854(double *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3d(*v1, *a1);
}

uint64_t (*sub_22898B860(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(a1 + 8) = *v1;
  *(double *)a1 = geom_approximate_convex_decomposition_opt_get_split_min_concavity_reduction_3d(v3);
  return sub_22898B898;
}

uint64_t sub_22898B898(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_split_min_concavity_reduction_3d(*(_QWORD *)(a1 + 8), *(double *)a1);
}

void sub_22898B8A8(double *a1@<X8>)
{
  uint64_t *v1;

  *a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3d(*v1);
}

uint64_t sub_22898B8D0(double *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3d(*v1, *a1);
}

uint64_t (*sub_22898B8DC(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(a1 + 8) = *v1;
  *(double *)a1 = geom_approximate_convex_decomposition_opt_get_merge_max_allowed_volume_increase_3d(v3);
  return sub_22898B914;
}

uint64_t sub_22898B914(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_merge_max_allowed_volume_increase_3d(*(_QWORD *)(a1 + 8), *(double *)a1);
}

uint64_t sub_22898B924()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3d(*v0);
}

uint64_t sub_22898B93C(char a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3d(*v1, a1 & 1);
}

uint64_t (*sub_22898B94C(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_approximate_convex_decomposition_opt_get_recursive_cut_search_enabled_3d(v3);
  return sub_22898B984;
}

uint64_t sub_22898B984(uint64_t a1)
{
  return geom_approximate_convex_decomposition_opt_set_recursive_cut_search_enabled_3d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

OS_geom_approximate_convex_decomposition_3f __swiftcall OS_geom_approximate_convex_decomposition_3f.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2)
{
  return (OS_geom_approximate_convex_decomposition_3f)sub_22898BC00((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, *(uint64_t *)&voxelCountLog2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3f);
}

OS_geom_approximate_convex_decomposition_3f __swiftcall OS_geom_approximate_convex_decomposition_3f.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2, Swift::UInt32 clusterHullMaxVertices, Swift::Float clusterHullCoplanarityTolerance)
{
  uint64_t approximate_convex_decomposition_constrained_3f;

  approximate_convex_decomposition_constrained_3f = geom_create_approximate_convex_decomposition_constrained_3f(*((_QWORD *)vertexPositions._rawValue + 2), (float32x4_t *)vertexPositions._rawValue + 2, *((_QWORD *)triangleVertexIndices._rawValue + 2) / 3uLL, (_DWORD *)triangleVertexIndices._rawValue + 8, voxelCountLog2, clusterHullMaxVertices, clusterHullCoplanarityTolerance);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (OS_geom_approximate_convex_decomposition_3f)approximate_convex_decomposition_constrained_3f;
}

unint64_t OS_geom_approximate_convex_decomposition_3f.splitClusterWithPlane(clusterIndex:plane:)(unsigned int a1, float32x4_t a2, float32_t a3, float a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v8;
  float32x4_t v9;
  float v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  a2.f32[2] = a3;
  v8 = 0;
  v9 = a2;
  v10 = a4;
  v5 = geom_approximate_convex_decomposition_split_cluster_with_plane_3f(v4, a1, &v9, (__int32 *)&v8);
  v6 = v8;
  v9.i8[0] = v5 ^ 1;
  if (!v5)
    v6 = 0;
  return v6 | ((unint64_t)(v5 ^ 1u) << 32);
}

uint64_t sub_22898BA90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_22898BD64(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3f, a4);
}

uint64_t sub_22898BA9C@<X0>(float32x4_t *a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, int a4@<W3>, float *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t approximate_convex_decomposition_constrained_3f;
  uint64_t result;

  approximate_convex_decomposition_constrained_3f = geom_create_approximate_convex_decomposition_constrained_3f(a1[1].u64[0], a1 + 2, *(_QWORD *)(a2 + 16) / 3uLL, (_DWORD *)(a2 + 32), a3, a4, *a5);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a6 = approximate_convex_decomposition_constrained_3f;
  return result;
}

void sub_22898BB14(uint64_t *a1)
{
  uint64_t *v1;

  geom_approximate_convex_decomposition_split_clusters_automatically_3f(*v1, *a1);
}

uint64_t sub_22898BB20(uint64_t *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_merge_clusters_automatically_3f(*v1, *a1);
}

unint64_t sub_22898BB2C(unsigned int a1, float32x4_t *a2)
{
  uint64_t *v2;
  float32x4_t v4;
  __int32 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned int v10;
  float32x4_t v11;
  __int32 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v5 = a2[1].i32[0];
  v6 = *v2;
  v10 = 0;
  v11 = v4;
  v12 = v5;
  v7 = geom_approximate_convex_decomposition_split_cluster_with_plane_3f(v6, a1, &v11, (__int32 *)&v10);
  v8 = v10;
  v11.i8[0] = v7 ^ 1;
  if (!v7)
    v8 = 0;
  return v8 | ((unint64_t)(v7 ^ 1u) << 32);
}

uint64_t *sub_22898BBB8(unsigned int a1, unsigned int a2)
{
  uint64_t *v2;

  return geom_approximate_convex_decomposition_merge_clusters_3f(*v2, a1, a2);
}

void sub_22898BBC8(uint64_t a1)
{
  uint64_t *v1;

  geom_approximate_convex_decomposition_cluster_indices_3f(*v1, a1);
}

void sub_22898BBD4(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;

  geom_approximate_convex_decomposition_hull_for_cluster_3f(*v3, a1, *a2, a3);
}

uint64_t sub_22898BBEC()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_cluster_count_3f(*v0);
}

OS_geom_approximate_convex_decomposition_3d __swiftcall OS_geom_approximate_convex_decomposition_3d.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2)
{
  return (OS_geom_approximate_convex_decomposition_3d)sub_22898BC00((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, *(uint64_t *)&voxelCountLog2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3d);
}

uint64_t sub_22898BC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v4;

  v4 = a4(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

OS_geom_approximate_convex_decomposition_3d __swiftcall OS_geom_approximate_convex_decomposition_3d.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::UInt32 voxelCountLog2, Swift::UInt32 clusterHullMaxVertices, Swift::Double clusterHullCoplanarityTolerance)
{
  uint64_t approximate_convex_decomposition_constrained_3d;

  approximate_convex_decomposition_constrained_3d = geom_create_approximate_convex_decomposition_constrained_3d(*((_QWORD *)vertexPositions._rawValue + 2), (float64x2_t *)vertexPositions._rawValue + 2, *((_QWORD *)triangleVertexIndices._rawValue + 2) / 3uLL, (_DWORD *)triangleVertexIndices._rawValue + 8, voxelCountLog2, clusterHullMaxVertices, clusterHullCoplanarityTolerance);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (OS_geom_approximate_convex_decomposition_3d)approximate_convex_decomposition_constrained_3d;
}

unint64_t OS_geom_approximate_convex_decomposition_3d.splitClusterWithPlane(clusterIndex:plane:)(unsigned int a1, float64x2_t a2, float64x2_t a3, double a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v8;
  float64x2_t v9[2];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = a2;
  v9[1] = a3;
  v10 = a4;
  v5 = geom_approximate_convex_decomposition_split_cluster_with_plane_3d(v4, a1, v9, (int *)&v8);
  v6 = v8;
  LOBYTE(v9[0].f64[0]) = v5 ^ 1;
  if (!v5)
    v6 = 0;
  return v6 | ((unint64_t)(v5 ^ 1u) << 32);
}

uint64_t sub_22898BD58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_22898BD64(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_create_approximate_convex_decomposition_3d, a4);
}

uint64_t sub_22898BD64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(_QWORD, uint64_t, unint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = a4(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a5 = v6;
  return result;
}

uint64_t sub_22898BDD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, int a4@<W3>, double *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t approximate_convex_decomposition_constrained_3d;
  uint64_t result;

  approximate_convex_decomposition_constrained_3d = geom_create_approximate_convex_decomposition_constrained_3d(*(_QWORD *)(a1 + 16), (float64x2_t *)(a1 + 32), *(_QWORD *)(a2 + 16) / 3uLL, (_DWORD *)(a2 + 32), a3, a4, *a5);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a6 = approximate_convex_decomposition_constrained_3d;
  return result;
}

void sub_22898BE48(uint64_t *a1)
{
  uint64_t *v1;

  geom_approximate_convex_decomposition_split_clusters_automatically_3d(*v1, *a1);
}

uint64_t sub_22898BE54(uint64_t *a1)
{
  uint64_t *v1;

  return geom_approximate_convex_decomposition_merge_clusters_automatically_3d(*v1, *a1);
}

unint64_t sub_22898BE60(unsigned int a1, uint64_t a2)
{
  uint64_t *v2;
  float64x2_t v4;
  float64x2_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v11;
  float64x2_t v12[2];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(float64x2_t *)a2;
  v5 = *(float64x2_t *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *v2;
  v11 = 0;
  v12[0] = v4;
  v12[1] = v5;
  v13 = v6;
  v8 = geom_approximate_convex_decomposition_split_cluster_with_plane_3d(v7, a1, v12, (int *)&v11);
  v9 = v11;
  LOBYTE(v12[0].f64[0]) = v8 ^ 1;
  if (!v8)
    v9 = 0;
  return v9 | ((unint64_t)(v8 ^ 1u) << 32);
}

uint64_t *sub_22898BEEC(unsigned int a1, unsigned int a2)
{
  uint64_t *v2;

  return geom_approximate_convex_decomposition_merge_clusters_3d(*v2, a1, a2);
}

void sub_22898BEFC(uint64_t a1)
{
  uint64_t *v1;

  geom_approximate_convex_decomposition_cluster_indices_3d(*v1, a1);
}

void sub_22898BF08(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;

  geom_approximate_convex_decomposition_hull_for_cluster_3d(*v3, a1, *a2, a3);
}

uint64_t sub_22898BF20()
{
  uint64_t *v0;

  return geom_approximate_convex_decomposition_cluster_count_3d(*v0);
}

uint64_t _sSo12geom_bbox_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  v0 = geom_dop6_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 3;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  v5 = v0[1];
  v4 = v0[2];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v5;
  *(_OWORD *)(v1 + 64) = v4;
  return v1;
}

uint64_t _sSo12geom_dop8_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v0 = geom_dop8_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 4;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  v4 = v0[3];
  v6 = *v0;
  v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  return v1;
}

uint64_t _sSo13geom_dop12_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v0 = geom_dop12_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 6;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  v5 = v0[5];
  v7 = v0[2];
  v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  return v1;
}

uint64_t _sSo13geom_dop14_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v0 = geom_dop14_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 7;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  v5 = v0[1];
  v4 = v0[2];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v5;
  *(_OWORD *)(v1 + 64) = v4;
  v6 = v0[6];
  v8 = v0[3];
  v7 = v0[4];
  *(_OWORD *)(v1 + 112) = v0[5];
  *(_OWORD *)(v1 + 128) = v6;
  *(_OWORD *)(v1 + 80) = v8;
  *(_OWORD *)(v1 + 96) = v7;
  return v1;
}

uint64_t _sSo13geom_dop18_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v0 = geom_dop18_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 9;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  *(_OWORD *)(v1 + 32) = *v0;
  v4 = v0[4];
  v6 = v0[1];
  v5 = v0[2];
  *(_OWORD *)(v1 + 80) = v0[3];
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 48) = v6;
  *(_OWORD *)(v1 + 64) = v5;
  v7 = v0[8];
  v9 = v0[5];
  v8 = v0[6];
  *(_OWORD *)(v1 + 144) = v0[7];
  *(_OWORD *)(v1 + 160) = v7;
  *(_OWORD *)(v1 + 112) = v9;
  *(_OWORD *)(v1 + 128) = v8;
  return v1;
}

uint64_t _sSo13geom_dop20_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v0 = geom_dop20_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 10;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  v5 = v0[5];
  v7 = v0[2];
  v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  v8 = v0[9];
  v10 = v0[6];
  v9 = v0[7];
  *(_OWORD *)(v1 + 160) = v0[8];
  *(_OWORD *)(v1 + 176) = v8;
  *(_OWORD *)(v1 + 128) = v10;
  *(_OWORD *)(v1 + 144) = v9;
  return v1;
}

uint64_t _sSo13geom_dop26_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v0 = geom_dop26_axis_directions_3f[0];
  __swift_instantiateConcreteTypeFromMangledName(qword_2559D25E0);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 17;
  *(_QWORD *)(v1 + 16) = 13;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 4);
  *(_OWORD *)(v1 + 32) = *v0;
  v4 = v0[4];
  v6 = v0[1];
  v5 = v0[2];
  *(_OWORD *)(v1 + 80) = v0[3];
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 48) = v6;
  *(_OWORD *)(v1 + 64) = v5;
  v7 = v0[8];
  v9 = v0[5];
  v8 = v0[6];
  *(_OWORD *)(v1 + 144) = v0[7];
  *(_OWORD *)(v1 + 160) = v7;
  *(_OWORD *)(v1 + 112) = v9;
  *(_OWORD *)(v1 + 128) = v8;
  v10 = v0[12];
  v12 = v0[9];
  v11 = v0[10];
  *(_OWORD *)(v1 + 208) = v0[11];
  *(_OWORD *)(v1 + 224) = v10;
  *(_OWORD *)(v1 + 176) = v12;
  *(_OWORD *)(v1 + 192) = v11;
  return v1;
}

uint64_t _sSo12geom_bbox_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v0 = geom_dop6_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  *(_QWORD *)(v1 + 16) = 3;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 5);
  v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  v5 = v0[5];
  v7 = v0[2];
  v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  return v1;
}

uint64_t _sSo12geom_dop8_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v0 = geom_dop8_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  *(_QWORD *)(v1 + 16) = 4;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 5);
  v4 = v0[3];
  v6 = *v0;
  v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  v7 = v0[7];
  v9 = v0[4];
  v8 = v0[5];
  *(_OWORD *)(v1 + 128) = v0[6];
  *(_OWORD *)(v1 + 144) = v7;
  *(_OWORD *)(v1 + 96) = v9;
  *(_OWORD *)(v1 + 112) = v8;
  return v1;
}

uint64_t _sSo13geom_dop12_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v0 = geom_dop12_axis_directions_3d[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  *(_QWORD *)(v1 + 16) = 6;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 5);
  v4 = v0[3];
  v6 = *v0;
  v5 = v0[1];
  *(_OWORD *)(v1 + 64) = v0[2];
  *(_OWORD *)(v1 + 80) = v4;
  *(_OWORD *)(v1 + 32) = v6;
  *(_OWORD *)(v1 + 48) = v5;
  v7 = v0[7];
  v9 = v0[4];
  v8 = v0[5];
  *(_OWORD *)(v1 + 128) = v0[6];
  *(_OWORD *)(v1 + 144) = v7;
  *(_OWORD *)(v1 + 96) = v9;
  *(_OWORD *)(v1 + 112) = v8;
  v10 = v0[11];
  v12 = v0[8];
  v11 = v0[9];
  *(_OWORD *)(v1 + 192) = v0[10];
  *(_OWORD *)(v1 + 208) = v10;
  *(_OWORD *)(v1 + 160) = v12;
  *(_OWORD *)(v1 + 176) = v11;
  return v1;
}

uint64_t _sSo13geom_dop14_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  __int128 *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v0 = geom_dop14_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = swift_allocObject();
  v2 = _swift_stdlib_malloc_size((const void *)v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  *(_QWORD *)(v1 + 16) = 7;
  *(_QWORD *)(v1 + 24) = 2 * (v3 >> 5);
  v4 = v0[1];
  *(_OWORD *)(v1 + 32) = *v0;
  *(_OWORD *)(v1 + 48) = v4;
  v5 = v0[5];
  v7 = v0[2];
  v6 = v0[3];
  *(_OWORD *)(v1 + 96) = v0[4];
  *(_OWORD *)(v1 + 112) = v5;
  *(_OWORD *)(v1 + 64) = v7;
  *(_OWORD *)(v1 + 80) = v6;
  v8 = v0[9];
  v10 = v0[6];
  v9 = v0[7];
  *(_OWORD *)(v1 + 160) = v0[8];
  *(_OWORD *)(v1 + 176) = v8;
  *(_OWORD *)(v1 + 128) = v10;
  *(_OWORD *)(v1 + 144) = v9;
  v11 = v0[13];
  v13 = v0[10];
  v12 = v0[11];
  *(_OWORD *)(v1 + 224) = v0[12];
  *(_OWORD *)(v1 + 240) = v11;
  *(_OWORD *)(v1 + 192) = v13;
  *(_OWORD *)(v1 + 208) = v12;
  return v1;
}

_QWORD *_sSo13geom_dop18_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  const void *v0;
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;

  v0 = geom_dop18_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = (_QWORD *)swift_allocObject();
  v2 = _swift_stdlib_malloc_size(v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  v1[2] = 9;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x120uLL);
  return v1;
}

_QWORD *_sSo13geom_dop20_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  const void *v0;
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;

  v0 = geom_dop20_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = (_QWORD *)swift_allocObject();
  v2 = _swift_stdlib_malloc_size(v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  v1[2] = 10;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x140uLL);
  return v1;
}

_QWORD *_sSo13geom_dop26_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0()
{
  const void *v0;
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;

  v0 = geom_dop26_axis_directions_3d;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
  v1 = (_QWORD *)swift_allocObject();
  v2 = _swift_stdlib_malloc_size(v1);
  v3 = v2 - 32;
  if (v2 < 32)
    v3 = v2 - 1;
  v1[2] = 13;
  v1[3] = 2 * (v3 >> 5);
  memcpy(v1 + 4, v0, 0x1A0uLL);
  return v1;
}

unint64_t sub_22898C758()
{
  unint64_t result;

  result = qword_2559D2328;
  if (!qword_2559D2328)
  {
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE1538], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_2559D2328);
  }
  return result;
}

unint64_t sub_22898C7A0()
{
  unint64_t result;

  result = qword_2559D2358;
  if (!qword_2559D2358)
  {
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE1418], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2559D2358);
  }
  return result;
}

_UNKNOWN **sub_22898C7E4()
{
  return &protocol witness table for OS_geom_approximate_convex_decomposition_opt_3f;
}

uint64_t sub_22898C7F0()
{
  return sub_22898C854(&qword_2559D24C8, (uint64_t (*)(uint64_t))type metadata accessor for Plane3f, (uint64_t)&protocol conformance descriptor for geom_plane_3f);
}

_UNKNOWN **sub_22898C81C()
{
  return &protocol witness table for OS_geom_approximate_convex_decomposition_opt_3d;
}

uint64_t sub_22898C828()
{
  return sub_22898C854(&qword_2559D2550, (uint64_t (*)(uint64_t))type metadata accessor for Plane3d, (uint64_t)&protocol conformance descriptor for geom_plane_3d);
}

uint64_t sub_22898C854(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2B7AB8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of WindingNumber3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of WindingNumber3.query(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxClusterCount.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.minConcavityReduction.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.maxAllowedMergeVolumeIncrease.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of ApproximateConvexDecompositionOptions3.recursiveCutSearchEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.init(vertexPositions:triangleVertexIndices:voxelCountLog2:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.init(vertexPositions:triangleVertexIndices:voxelCountLog2:clusterHullMaxVertices:clusterHullCoplanarityTolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 64))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.splitClustersAutomatically(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.mergeClustersAutomatically(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.splitClusterWithPlane(clusterIndex:plane:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;

  v4 = (*(uint64_t (**)(void))(a4 + 88))();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.mergeClusters(destination:source:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.clusterIndices(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.convexHullOfCluster(clusterIndex:hullVertexPositions:hullFaceVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of ApproximateConvexDecomposition3.clusterCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B7AA0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  uint64_t result;
  int v7;
  float v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  result = geom_intersect_ray_bbox_2f((float *)v9 + 1, (float *)v9, a2, a3, a4, a5);
  v8 = *((float *)v9 + 1);
  v7 = v9[0];
  if ((_DWORD)result != 2)
    v8 = *(float *)v9;
  *(float *)a1 = v8;
  *(_DWORD *)(a1 + 4) = v7;
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, __n128 a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  uint64_t result;
  double v7;
  double v8;
  double v9;
  double v10[2];

  v10[1] = *(double *)MEMORY[0x24BDAC8D0];
  v9 = 0.0;
  v10[0] = 0.0;
  result = geom_intersect_ray_bbox_2d(v10, &v9, a2, a3, a4, a5);
  v7 = v9;
  v8 = v10[0];
  if ((_DWORD)result != 2)
    v8 = v9;
  *(double *)a1 = v8;
  *(double *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float32x4_t a8@<Q6>, float32_t a9@<S7>)
{
  uint64_t result;
  int v11;
  float v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  a8.f32[2] = a9;
  v13[0] = 0;
  result = geom_intersect_ray_bbox_3f((float *)v13 + 1, (__int32 *)v13, a2, a4, a6, a8);
  v12 = *((float *)v13 + 1);
  v11 = v13[0];
  if ((_DWORD)result != 2)
    v12 = *(float *)v13;
  *(float *)a1 = v12;
  *(_DWORD *)(a1 + 4) = v11;
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t intersect(ray:bbox:)@<X0>(double *a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>, __n128 a7@<Q5>, __n128 a8@<Q6>, __n128 a9@<Q7>)
{
  uint64_t result;
  uint64_t v11;
  double v12;
  _OWORD v13[4];
  _OWORD v14[4];
  double v15;
  double v16[2];

  v16[1] = *(double *)MEMORY[0x24BDAC8D0];
  v15 = 0.0;
  v16[0] = 0.0;
  v14[0] = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  v13[0] = a6;
  v13[1] = a7;
  v13[2] = a8;
  v13[3] = a9;
  result = geom_intersect_ray_bbox_3d(v14, (uint64_t)v13, v16, (uint64_t *)&v15);
  v11 = *(_QWORD *)&v15;
  v12 = v16[0];
  if ((_DWORD)result != 2)
    v12 = v15;
  *a1 = v12;
  *((_QWORD *)a1 + 1) = v11;
  *((_QWORD *)a1 + 2) = result;
  return result;
}

uint64_t intersect(ray:triangle:)@<X0>(int32x4_t *a1@<X0>, uint64_t a2@<X8>, float32x4_t a3@<Q0>, float32_t a4@<S1>, double a5@<D2>, float32_t a6@<S3>, float32x4_t a7@<Q5>)
{
  int32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  *(double *)a7.i64 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  a3.f32[2] = a4;
  a7.f32[2] = a6;
  v8 = a1[1];
  v9 = a1[2];
  v10 = *a1;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  result = geom_intersect_ray_triangle_3f((float *)&v17, (uint64_t)&v15, a3, a7, v10, v8, v9);
  v12 = v17;
  v14 = v15;
  v13 = v16;
  if (!(_DWORD)result)
  {
    v12 = 0;
    v14 = 0;
    v13 = 0;
  }
  *(_QWORD *)a2 = v12;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v14;
  *(_QWORD *)(a2 + 24) = v13;
  *(_BYTE *)(a2 + 32) = result ^ 1;
  return result;
}

uint64_t intersect(ray:triangle:)@<X0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, float64x2_t a4@<Q1>, float64x2_t a5@<Q2>, float64x2_t a6@<Q3>)
{
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  uint64_t result;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float64x2_t v19[6];
  float64x2_t v20[4];
  __int128 v21;
  __int128 v22;
  double v23[2];

  v23[1] = *(double *)MEMORY[0x24BDAC8D0];
  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v11 = a1[4];
  v12 = a1[5];
  v23[0] = 0.0;
  v21 = 0u;
  v22 = 0u;
  v20[0] = a3;
  v20[1] = a4;
  v20[2] = a5;
  v20[3] = a6;
  v19[0] = v7;
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v10;
  v19[4] = v11;
  v19[5] = v12;
  result = geom_intersect_ray_triangle_3d(v20, v19, v23, (uint64_t)&v21);
  v14 = 0.0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  if ((_DWORD)result)
  {
    v18 = *((_QWORD *)&v22 + 1);
    v14 = v23[0];
    v16 = *((_QWORD *)&v21 + 1);
    v15 = v21;
    v17 = v22;
  }
  *(double *)a2 = v14;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v15;
  *(_QWORD *)(a2 + 24) = v16;
  *(_QWORD *)(a2 + 32) = v17;
  *(_QWORD *)(a2 + 40) = v18;
  *(_BYTE *)(a2 + 48) = result ^ 1;
  return result;
}

float intersect(ray:circle:)@<S0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, uint64_t a4@<D2>, int a5@<S3>)
{
  unsigned int v6;
  float result;
  int v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v6 = geom_intersect_ray_circle_2f(a4, a5, (float *)v9 + 1, (float *)v9, a2, a3);
  result = *((float *)v9 + 1);
  v8 = v9[0];
  *(_DWORD *)a1 = HIDWORD(v9[0]);
  *(_DWORD *)(a1 + 4) = v8;
  *(_QWORD *)(a1 + 8) = v6;
  return result;
}

double intersect(ray:circle:)@<D0>(double *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, double a5@<D3>)
{
  unsigned int v6;
  double result;
  uint64_t v8;
  uint64_t v9;
  double v10;
  float64x2_t v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = 0.0;
  v11 = a4;
  v12 = a5;
  v6 = geom_intersect_ray_circle_2d(&v11, &v10, (double *)&v9, a2, a3);
  v8 = v9;
  result = v10;
  *a1 = v10;
  *((_QWORD *)a1 + 1) = v8;
  *((_QWORD *)a1 + 2) = v6;
  return result;
}

float intersect(ray:sphere:)@<S0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float a8@<S6>)
{
  unsigned int v9;
  float result;
  int v11;
  uint64_t v12;
  float32x4_t v13;
  float v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  a2.f32[2] = a3;
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  v12 = 0;
  v13 = a6;
  v14 = a8;
  v9 = geom_intersect_ray_sphere_3f(&v13, (float *)&v12 + 1, (float *)&v12, a2, a4);
  result = *((float *)&v12 + 1);
  v11 = v12;
  *(_DWORD *)a1 = HIDWORD(v12);
  *(_DWORD *)(a1 + 4) = v11;
  *(_QWORD *)(a1 + 8) = v9;
  return result;
}

double intersect(ray:sphere:)@<D0>(double *a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, double a8@<D6>)
{
  unsigned int v9;
  double result;
  uint64_t v11;
  float64x2_t v12[4];
  uint64_t v13;
  double v14;
  float64x2_t v15[2];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = 0.0;
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  v12[3] = a5;
  v15[0] = a6;
  v15[1] = a7;
  v16 = a8;
  v9 = geom_intersect_ray_sphere_3d(v12, v15, &v14, (double *)&v13);
  v11 = v13;
  result = v14;
  *a1 = v14;
  *((_QWORD *)a1 + 1) = v11;
  *((_QWORD *)a1 + 2) = v9;
  return result;
}

uint64_t intersect(ray:quadraticBezier:)@<X0>(float *a1@<X8>)
{
  return sub_22898D028((uint64_t (*)(float32x2_t *, _QWORD *))geom_intersect_ray_quadratic_bezier_2f, a1);
}

double intersect(ray:quadraticBezier:)@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_22898D0EC((uint64_t (*)(__n128 *, __int128 *))geom_intersect_ray_quadratic_bezier_2d, a1).n128_u64[0];
  return result;
}

uint64_t intersect(lineSegment:quadraticBezier:)@<X0>(float *a1@<X8>)
{
  return sub_22898D028((uint64_t (*)(float32x2_t *, _QWORD *))geom_intersect_line_segment_quadratic_bezier_2f, a1);
}

uint64_t sub_22898D028@<X0>(uint64_t (*a1)(float32x2_t *, _QWORD *)@<X0>, float *a2@<X8>)
{
  uint64_t result;
  float32x2_t v4;
  _QWORD v5[2];
  float32x2x2_t v6;

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5[0] = 0;
  result = a1(&v4, v5);
  v6.val[0] = v4;
  v6.val[1] = (float32x2_t)v5[0];
  vst2_f32(a2, v6);
  a2 += 4;
  *(_QWORD *)a2 = result;
  return result;
}

double intersect(lineSegment:quadraticBezier:)@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_22898D0EC((uint64_t (*)(__n128 *, __int128 *))geom_intersect_line_segment_quadratic_bezier_2d, a1).n128_u64[0];
  return result;
}

__n128 sub_22898D0EC@<Q0>(uint64_t (*a1)(__n128 *, __int128 *)@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  __n128 result;
  __int128 v5;
  __n128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v3 = a1(&v6, &v7);
  result = v6;
  *(_QWORD *)&v5 = v7;
  *(_QWORD *)(a2 + 24) = *((_QWORD *)&v7 + 1);
  *((_QWORD *)&v5 + 1) = result.n128_u64[1];
  *(_QWORD *)a2 = result.n128_u64[0];
  *(_OWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 32) = v3;
  return result;
}

double intersect(line:quadraticBezier:)@<D0>(_QWORD *a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  unsigned int v7;
  double result;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v7 = geom_intersect_line_quadratic_bezier_2f(a2, a3, (float *)v9, a4, a5, a6);
  result = *(double *)v9;
  *a1 = v9[0];
  a1[1] = v7;
  return result;
}

double intersect(line:quadraticBezier:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  unsigned int v7;
  double result;
  __int128 v9;
  __n128 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0uLL;
  v10 = a2;
  v11 = a3;
  v7 = geom_intersect_line_quadratic_bezier_2d((uint64_t)&v10, (double *)&v9, a4, a5, a6);
  result = *(double *)&v9;
  *(_OWORD *)a1 = v9;
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

uint64_t intersect(ray:cubicBezier:)@<X0>(uint64_t a1@<X8>)
{
  return sub_22898D35C((uint64_t (*)(__int128 *, __int128 *))geom_intersect_ray_cubic_bezier_2f, a1);
}

double intersect(ray:cubicBezier:)@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_22898D434((uint64_t (*)(__int128 *, int8x16_t *))geom_intersect_ray_cubic_bezier_2d, a1).u64[0];
  return result;
}

uint64_t intersect(lineSegment:cubicBezier:)@<X0>(uint64_t a1@<X8>)
{
  return sub_22898D35C((uint64_t (*)(__int128 *, __int128 *))geom_intersect_line_segment_cubic_bezier_2f, a1);
}

uint64_t sub_22898D35C@<X0>(uint64_t (*a1)(__int128 *, __int128 *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v4;
  int v5;
  float *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  float32x2x2_t v10;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  result = a1(&v7, &v8);
  v10.val[0] = (float32x2_t)v7;
  v10.val[1] = (float32x2_t)v8;
  v4 = DWORD2(v7);
  v5 = DWORD2(v8);
  v6 = (float *)a2;
  vst2_f32(v6, v10);
  v6 += 4;
  *(_DWORD *)v6 = v4;
  *(_DWORD *)(a2 + 20) = v5;
  *(_QWORD *)(a2 + 24) = result;
  return result;
}

double intersect(lineSegment:cubicBezier:)@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_22898D434((uint64_t (*)(__int128 *, int8x16_t *))geom_intersect_line_segment_cubic_bezier_2d, a1).u64[0];
  return result;
}

int8x16_t sub_22898D434@<Q0>(uint64_t (*a1)(__int128 *, int8x16_t *)@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  int8x16_t v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t result;
  __int128 v9;
  int8x16_t v10;
  int8x16_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = a1(&v9, &v11);
  v5 = *((_QWORD *)&v9 + 1);
  v4 = v10;
  v6 = v11;
  v7 = v12;
  *(_QWORD *)a2 = v9;
  result = vextq_s8(v6, v4, 8uLL);
  v6.i64[1] = v5;
  *(int8x16_t *)(a2 + 8) = v6;
  *(int8x16_t *)(a2 + 24) = result;
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v3;
  return result;
}

float intersect(line:cubicBezier:)@<S0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, float32x2_t a4@<D2>, double a5@<D3>, float32x2_t a6@<D4>, float32x2_t a7@<D5>)
{
  unsigned int v8;
  float result;
  uint64_t v10;
  float v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  *(_QWORD *)v11 = 0;
  v8 = geom_intersect_line_cubic_bezier_2f(a2, a3, (float *)&v10, a4, a5, a6, a7);
  result = v11[0];
  *(_QWORD *)a1 = v10;
  *(float *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = v8;
  return result;
}

double intersect(line:cubicBezier:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>)
{
  unsigned int v8;
  double result;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __n128 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = a2;
  v14 = a3;
  v8 = geom_intersect_line_cubic_bezier_2d((uint64_t)&v13, (double *)&v11, a4, a5, a6, a7);
  result = *(double *)&v11;
  v10 = v12;
  *(_OWORD *)a1 = v11;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

__n128 intersect(triangle:bbox:)@<Q0>(float32x4_t *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, float a4@<S1>, double a5@<D2>, float a6@<S3>, __n128 a7@<Q4>, __n128 a8@<Q5>)
{
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int32x4_t v19;
  __int128 v20;
  __n128 result;
  int32x4_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  a7.n128_f64[0] = a5;
  a8.n128_f64[0] = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  a8.n128_f32[2] = a4;
  a7.n128_f32[2] = a6;
  v9 = a1[1];
  v10 = a1[2];
  v11 = *a1;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = geom_intersect_triangle_bbox_3f(&v22, v11, v9, v10, a8, a7);
  v13 = v28;
  result = v29;
  v15 = v26;
  v14 = v27;
  v17 = v24;
  v16 = v25;
  v19 = v22;
  v18 = v23;
  v19.i32[3] = 0;
  HIDWORD(v18) = 0;
  HIDWORD(v17) = 0;
  HIDWORD(v16) = 0;
  HIDWORD(v15) = 0;
  HIDWORD(v14) = 0;
  HIDWORD(v13) = 0;
  v20 = v30;
  result.n128_u32[3] = 0;
  HIDWORD(v20) = 0;
  *(int32x4_t *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v16;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v14;
  *(_OWORD *)(a2 + 96) = v13;
  *(__n128 *)(a2 + 112) = result;
  *(_OWORD *)(a2 + 128) = v20;
  *(_QWORD *)(a2 + 144) = v12;
  return result;
}

__n128 intersect(triangle:bbox:)@<Q0>(float64x2_t *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, float64x2_t a4@<Q1>, float64x2_t a5@<Q2>, float64x2_t a6@<Q3>)
{
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  unsigned int v13;
  __n128 result;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  __int128 v18;
  unint64_t v19;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  __int128 v24;
  unint64_t v25;
  __int128 v26;
  unint64_t v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  float64x2_t v31[4];
  float64x2_t v32[6];
  int64x2_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
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
  __n128 v49;
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
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v11 = a1[4];
  v12 = a1[5];
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32[0] = v7;
  v32[1] = v8;
  v32[2] = v9;
  v32[3] = v10;
  v32[4] = v11;
  v32[5] = v12;
  v31[0] = a3;
  v31[1] = a4;
  v31[2] = a5;
  v31[3] = a6;
  v13 = geom_intersect_triangle_bbox_3d(v32, v31, &v33);
  result = v49;
  v15 = v50;
  v16 = v47;
  v17 = v48;
  v18 = v45;
  v19 = v46;
  v20 = v43;
  v21 = v44;
  v22 = v41;
  v23 = v42;
  v24 = v39;
  v25 = v40;
  v26 = v37;
  v27 = v38;
  v28 = v35;
  v29 = v36;
  v30 = v34;
  *(int64x2_t *)a2 = v33;
  *(_OWORD *)(a2 + 16) = v30;
  *(_OWORD *)(a2 + 32) = v28;
  *(_OWORD *)(a2 + 48) = v29;
  *(_OWORD *)(a2 + 64) = v26;
  *(_OWORD *)(a2 + 80) = v27;
  *(_OWORD *)(a2 + 96) = v24;
  *(_OWORD *)(a2 + 112) = v25;
  *(_OWORD *)(a2 + 128) = v22;
  *(_OWORD *)(a2 + 144) = v23;
  *(_OWORD *)(a2 + 160) = v20;
  *(_OWORD *)(a2 + 176) = v21;
  *(_OWORD *)(a2 + 192) = v18;
  *(_OWORD *)(a2 + 208) = v19;
  *(_OWORD *)(a2 + 224) = v16;
  *(_OWORD *)(a2 + 240) = v17;
  *(__n128 *)(a2 + 256) = result;
  *(_OWORD *)(a2 + 272) = v15;
  *(_QWORD *)(a2 + 288) = v13;
  return result;
}

uint64_t intersect(lineSegment:plane:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, float32x4_t a4@<Q2>, float32_t a5@<S3>, float32x4_t a6@<Q4>, float32_t a7@<S5>, float a8@<S6>)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  unsigned int v14;
  float32x4_t v15;
  float v16;
  uint64_t v17;

  a2.f32[2] = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  a4.f32[2] = a5;
  a6.f32[2] = a7;
  v14 = 0;
  v13 = 0uLL;
  v15 = a6;
  v16 = a8;
  result = geom_intersect_line_segment_plane_3f(&v15, (float *)&v14, &v13, a2, a4);
  v10 = v14;
  v11 = v13.i64[1];
  v12 = v13.i64[0];
  if (!(_DWORD)result)
  {
    v10 = 0;
    v12 = 0;
    v11 = 0;
  }
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(a1 + 24) = v11;
  *(_BYTE *)(a1 + 32) = result ^ 1;
  return result;
}

uint64_t intersect(lineSegment:plane:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>, float64x2_t a7@<Q5>, double a8@<D6>)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float64x2_t v15[4];
  int8x16_t v16;
  __int128 v17;
  uint64_t v18;
  float64x2_t v19[2];
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15[0] = a2;
  v15[1] = a3;
  v15[2] = a4;
  v15[3] = a5;
  v19[0] = a6;
  v19[1] = a7;
  v20 = a8;
  result = geom_intersect_line_segment_plane_3d(v15, v19, &v18, &v16);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if ((_DWORD)result)
  {
    v10 = v18;
    v12 = v16.i64[1];
    v11 = v16.i64[0];
    v14 = *((_QWORD *)&v17 + 1);
    v13 = v17;
  }
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v13;
  *(_QWORD *)(a1 + 40) = v14;
  *(_BYTE *)(a1 + 48) = result ^ 1;
  return result;
}

uint64_t intersect(ray:line:)@<X0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, double a3@<D1>, uint64_t a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  uint64_t result;
  char v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  result = geom_intersect_ray_line_2f(a4, SLODWORD(a5), (float *)&v10, a2, a3, *(double *)&a4, a5, a6, a7);
  if (!(_DWORD)result)
    goto LABEL_5;
  if ((_DWORD)result != 1)
  {
    result = 1;
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 0;
  result = v10;
LABEL_6:
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = v9;
  return result;
}

uint64_t intersect(ray:line:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, double a5@<D3>, float64x2_t a6@<Q4>, double a7@<D5>, int64x2_t a8@<Q6>)
{
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  float64x2_t v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = a4;
  v14 = a5;
  result = geom_intersect_ray_line_2d(&v13, (double *)&v12, a2, a3, a4.f64[0], a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    v11 = 0;
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  if ((_DWORD)result != 1)
  {
    v11 = 1;
    goto LABEL_6;
  }
  v10 = 0;
  v11 = v12;
LABEL_7:
  *(_QWORD *)a1 = v11;
  *(_BYTE *)(a1 + 8) = v10;
  return result;
}

uint64_t intersect(ray:lineSegment:)@<X0>(uint64_t a1@<X8>)
{
  return sub_22898DE8C((uint64_t (*)(char *, _QWORD *))geom_intersect_ray_line_segment_2f, a1);
}

{
  return sub_22898DF78((uint64_t (*)(_QWORD *, uint64_t *))geom_intersect_ray_line_segment_2d, a1);
}

uint64_t intersect(ray:ray:)@<X0>(uint64_t a1@<X8>)
{
  return sub_22898DE8C((uint64_t (*)(char *, _QWORD *))geom_intersect_ray_ray_2f, a1);
}

{
  return sub_22898DF78((uint64_t (*)(_QWORD *, uint64_t *))geom_intersect_ray_ray_2d, a1);
}

uint64_t intersect(line:line:)@<X0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, uint64_t a4@<D2>, int a5@<S3>)
{
  uint64_t result;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  result = geom_intersect_line_line_2f(a2, a3, a4, a5, v9);
  if (!(_DWORD)result)
  {
    v8 = 0;
LABEL_6:
    v7 = 1;
    goto LABEL_7;
  }
  if ((_DWORD)result != 1)
  {
    v8 = 1;
    goto LABEL_6;
  }
  v7 = 0;
  v8 = v9[0];
LABEL_7:
  *(_QWORD *)a1 = v8;
  *(_BYTE *)(a1 + 8) = v7;
  return result;
}

uint64_t intersect(line:line:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, double a5@<D3>)
{
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  float64x2_t v9;
  double v10;
  float64x2_t v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0uLL;
  v11 = a2;
  v12 = a3;
  v9 = a4;
  v10 = a5;
  result = geom_intersect_line_line_2d(&v11, &v9, &v8);
  if ((_DWORD)result == 1)
  {
    v7 = *((_QWORD *)&v8 + 1);
    *(_QWORD *)a1 = v8;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = 0;
  }
  else
  {
    if ((_DWORD)result)
    {
      *(_OWORD *)a1 = xmmword_2289C4000;
    }
    else
    {
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
    *(_BYTE *)(a1 + 16) = 1;
  }
  return result;
}

uint64_t intersect(line:lineSegment:)@<X0>(uint64_t a1@<X8>, uint64_t a2@<D0>, int a3@<S1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  uint64_t result;
  char v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  result = geom_intersect_line_line_segment_2f(a2, a3, (float *)&v10, *(float32x2_t *)&a4, *(float32x2_t *)&a5, a4, a5, a6, a7);
  if (!(_DWORD)result)
    goto LABEL_5;
  if ((_DWORD)result != 1)
  {
    result = 1;
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 0;
  result = v10;
LABEL_6:
  *(_DWORD *)a1 = result;
  *(_BYTE *)(a1 + 4) = v9;
  return result;
}

uint64_t intersect(line:lineSegment:)@<X0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, double a3@<D1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, double a6@<D4>, double a7@<D5>, int64x2_t a8@<Q6>)
{
  uint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  float64x2_t v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = a2;
  v14 = a3;
  result = geom_intersect_line_line_segment_2d(&v13, (double *)&v12, a4, a5, a4.f64[0], a5.f64[0], a6, a7, a8);
  if (!(_DWORD)result)
  {
    v11 = 0;
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  if ((_DWORD)result != 1)
  {
    v11 = 1;
    goto LABEL_6;
  }
  v10 = 0;
  v11 = v12;
LABEL_7:
  *(_QWORD *)a1 = v11;
  *(_BYTE *)(a1 + 8) = v10;
  return result;
}

uint64_t intersect(lineSegment:lineSegment:)@<X0>(uint64_t a1@<X8>)
{
  return sub_22898DE8C((uint64_t (*)(char *, _QWORD *))geom_intersect_line_segment_line_segment_2f, a1);
}

{
  return sub_22898DF78((uint64_t (*)(_QWORD *, uint64_t *))geom_intersect_line_segment_line_segment_2d, a1);
}

uint64_t sub_22898DE8C@<X0>(uint64_t (*a1)(char *, _QWORD *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;
  unint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  result = a1((char *)v6 + 4, v6);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 1)
    {
      v4 = 0;
      v5 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
    }
    else
    {
      v5 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      v4 = 1;
    }
  }
  else
  {
    v5 = 0;
    v4 = 2;
  }
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_22898DF78@<X0>(uint64_t (*a1)(_QWORD *, uint64_t *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8[0] = 0;
  result = a1(v8, &v7);
  if ((_DWORD)result == 1)
  {
    v5 = v7;
    *(_QWORD *)a2 = v8[0];
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = 0;
  }
  else
  {
    if ((_DWORD)result)
    {
      v6 = v7;
      *(_QWORD *)a2 = v8[0];
      *(_QWORD *)(a2 + 8) = v6;
      v4 = 1;
    }
    else
    {
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      v4 = 2;
    }
    *(_BYTE *)(a2 + 16) = v4;
  }
  return result;
}

unint64_t intersect(ray:triangle:)(float32x2_t a1, float32x2_t a2, double a3, double a4, double a5)
{
  int v5;
  unint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v5 = geom_intersect_ray_triangle_2f((float *)v8 + 1, (float *)v8, a1, a2, a3, a4, a5);
  v6 = HIDWORD(v8[0]) | ((unint64_t)LODWORD(v8[0]) << 32);
  if (!v5)
    return 0;
  return v6;
}

uint64_t intersect(ray:triangle:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5)
{
  int v5;
  double v6;
  uint64_t v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0.0;
  v5 = geom_intersect_ray_triangle_2d(v9, (double *)&v8, a1, a2, a3, a4, a5);
  v6 = v9[0];
  if (!v5)
    v6 = 0.0;
  return *(_QWORD *)&v6;
}

uint64_t sub_22898E0EC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for IntersectRayLineResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectRayLineResult);
}

uint64_t sub_22898E12C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for IntersectRayLineSegmentResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectRayLineSegmentResult);
}

uint64_t type metadata accessor for IntersectRayRayResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectRayRayResult);
}

uint64_t sub_22898E178()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

_QWORD *sub_22898E1E0(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  _BOOL8 v23;
  unsigned int v24;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = v7;
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      v10 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v10 > 0xFFFE)
      {
        v9 = 4;
      }
      else
      {
        v11 = v10 != 0;
        v12 = v10 >= 0xFF;
        v9 = 2;
        if (!v12)
          v9 = v11;
      }
    }
    else
    {
      v9 = 1;
    }
    v8 = v9 + v7;
  }
  v13 = *(_DWORD *)(v5 + 80);
  if (v13 > 7 || v8 > 0x18 || (*(_DWORD *)(v5 + 80) & 0x100000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v13 + 16) & ~v13));
    swift_retain();
    return a1;
  }
  if (v6 <= 1)
  {
    if (v7 <= 3)
    {
      v18 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v18 > 0xFFFE)
      {
        v17 = *(_DWORD *)((char *)a2 + v7);
        if (!v17)
          goto LABEL_36;
        goto LABEL_27;
      }
      if (v18 > 0xFE)
      {
        v17 = *(unsigned __int16 *)((char *)a2 + v7);
        if (!*(_WORD *)((char *)a2 + v7))
          goto LABEL_36;
        goto LABEL_27;
      }
      if (!v18)
      {
LABEL_36:
        if (v6)
          goto LABEL_37;
LABEL_50:
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
        if (v7 > 3)
          goto LABEL_54;
        goto LABEL_51;
      }
    }
    v17 = *((unsigned __int8 *)a2 + v7);
    if (!*((_BYTE *)a2 + v7))
      goto LABEL_36;
LABEL_27:
    v19 = (v17 - 1) << (8 * v7);
    if (v7 > 3)
      v19 = 0;
    if ((_DWORD)v7)
    {
      if (v7 <= 3)
        v20 = v7;
      else
        v20 = 4;
      __asm { BR              X11 }
    }
    if (v19 + v6 != -1)
      goto LABEL_44;
    goto LABEL_50;
  }
LABEL_37:
  if ((*(unsigned int (**)(_QWORD *, _QWORD, uint64_t))(v5 + 48))(a2, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
  {
    if (v6 > 1)
    {
LABEL_57:
      memcpy(a1, a2, v7);
      return a1;
    }
LABEL_44:
    if (v7 <= 3)
    {
      v22 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v22 > 0xFFFE)
      {
        v21 = 4;
      }
      else
      {
        v23 = v22 != 0;
        v12 = v22 >= 0xFF;
        v21 = 2;
        if (!v12)
          v21 = v23;
      }
    }
    else
    {
      v21 = 1;
    }
    v7 += v21;
    goto LABEL_57;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  if (v6 > 1)
    return a1;
  if (v7 > 3)
  {
LABEL_54:
    *((_BYTE *)a1 + v7) = 0;
    return a1;
  }
LABEL_51:
  v24 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v24 > 0xFFFE)
  {
    *(_DWORD *)((char *)a1 + v7) = 0;
    return a1;
  }
  if (v24 > 0xFE)
  {
    *(_WORD *)((char *)a1 + v7) = 0;
    return a1;
  }
  if (v24)
    goto LABEL_54;
  return a1;
}

uint64_t sub_22898E4DC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  char v6;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t result;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(_DWORD *)(v3 + 84);
  if (v4 > 1)
  {
LABEL_18:
    result = (*(uint64_t (**)(uint64_t))(v3 + 48))(a1);
    if ((_DWORD)result)
      return result;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  }
  v5 = *(_QWORD *)(v3 + 64);
  v6 = 8 * v5;
  if (v5 <= 3)
  {
    v8 = (~(-1 << v6) - v4 + 2) >> v6;
    if (v8 > 0xFFFE)
    {
      v7 = *(_DWORD *)(a1 + v5);
      if (!v7)
        goto LABEL_17;
      goto LABEL_10;
    }
    if (v8 > 0xFE)
    {
      v7 = *(unsigned __int16 *)(a1 + v5);
      if (!*(_WORD *)(a1 + v5))
        goto LABEL_17;
      goto LABEL_10;
    }
    if (!v8)
    {
LABEL_17:
      if (!v4)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
      goto LABEL_18;
    }
  }
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (!*(_BYTE *)(a1 + v5))
    goto LABEL_17;
LABEL_10:
  v9 = (v7 - 1) << v6;
  if (v5 > 3)
    v9 = 0;
  if ((_DWORD)v5)
  {
    if (v5 > 3)
      LODWORD(v5) = 4;
    __asm { BR              X11 }
  }
  result = v4 + v9 + 1;
  if (v4 + v9 == -1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  return result;
}

_BYTE *sub_22898E638(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;
  unsigned int v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (v6 > 1)
    goto LABEL_20;
  if (v7 > 3)
    goto LABEL_3;
  v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v9 > 0xFFFE)
  {
    v8 = *(_DWORD *)&a2[v7];
    if (!v8)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v9 > 0xFE)
  {
    v8 = *(unsigned __int16 *)&a2[v7];
    if (!*(_WORD *)&a2[v7])
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_3:
    v8 = a2[v7];
    if (!a2[v7])
      goto LABEL_19;
LABEL_10:
    v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3)
      v10 = 0;
    if ((_DWORD)v7)
    {
      if (v7 <= 3)
        v11 = *(_QWORD *)(v5 + 64);
      else
        v11 = 4;
      __asm { BR              X11 }
    }
    if (v10 + v6 != -1)
      goto LABEL_27;
LABEL_33:
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    if (v7 > 3)
    {
LABEL_37:
      a1[v7] = 0;
      return a1;
    }
    goto LABEL_34;
  }
LABEL_19:
  if (!v6)
    goto LABEL_33;
LABEL_20:
  if ((*(unsigned int (**)(_BYTE *, _QWORD, uint64_t))(v5 + 48))(a2, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
  {
    if (v6 > 1)
    {
LABEL_40:
      memcpy(a1, a2, v7);
      return a1;
    }
LABEL_27:
    if (v7 <= 3)
    {
      v13 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v13 > 0xFFFE)
      {
        v12 = 4;
      }
      else
      {
        v14 = v13 != 0;
        v15 = v13 >= 0xFF;
        v12 = 2;
        if (!v15)
          v12 = v14;
      }
    }
    else
    {
      v12 = 1;
    }
    v7 += v12;
    goto LABEL_40;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  if (v6 > 1)
    return a1;
  if (v7 > 3)
    goto LABEL_37;
LABEL_34:
  v16 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v16 > 0xFFFE)
  {
    *(_DWORD *)&a1[v7] = 0;
    return a1;
  }
  if (v16 > 0xFE)
  {
    *(_WORD *)&a1[v7] = 0;
    return a1;
  }
  if (v16)
    goto LABEL_37;
  return a1;
}

_BYTE *sub_22898E898(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8;
  unsigned int (*v9)(_BYTE *, uint64_t, uint64_t);
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  _BOOL8 v23;
  BOOL v24;
  unsigned int v25;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (v6 <= 1)
  {
    if (v7 > 3)
      goto LABEL_3;
    v10 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
    if (v10 > 0xFFFE)
    {
      v8 = *(_DWORD *)&a1[v7];
      if (v8)
        goto LABEL_13;
    }
    else
    {
      if (v10 <= 0xFE)
      {
        if (!v10)
          goto LABEL_22;
LABEL_3:
        v8 = a1[v7];
        if (!a1[v7])
          goto LABEL_22;
LABEL_13:
        v11 = (v8 - 1) << (8 * v7);
        if (v7 > 3)
          v11 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v12 = *(_QWORD *)(v5 + 64);
          else
            v12 = 4;
          __asm { BR              X11 }
        }
        if (v11 + (_DWORD)v6 == -1)
        {
LABEL_24:
          if (v7 > 3)
            goto LABEL_25;
          v14 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
          if (v14 > 0xFFFE)
          {
            v13 = *(_DWORD *)&a2[v7];
            if (v13)
              goto LABEL_32;
          }
          else
          {
            if (v14 <= 0xFE)
            {
              if (!v14)
                goto LABEL_62;
LABEL_25:
              v13 = a2[v7];
              if (!a2[v7])
                goto LABEL_62;
LABEL_32:
              v15 = (v13 - 1) << (8 * v7);
              if (v7 > 3)
                v15 = 0;
              if ((_DWORD)v7)
              {
                if (v7 <= 3)
                  v16 = v7;
                else
                  v16 = 4;
                __asm { BR              X11 }
              }
              if ((_DWORD)v6 + v15 != -1)
              {
LABEL_65:
                (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
                if (v6 <= 1)
                {
LABEL_68:
                  if (v7 <= 3)
                  {
                    v22 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
                    if (v22 > 0xFFFE)
                    {
                      v21 = 4;
                    }
                    else
                    {
                      v23 = v22 != 0;
                      v24 = v22 >= 0xFF;
                      v21 = 2;
                      if (!v24)
                        v21 = v23;
                    }
                  }
                  else
                  {
                    v21 = 1;
                  }
                  v7 += v21;
                }
LABEL_78:
                memcpy(a1, a2, v7);
                return a1;
              }
LABEL_85:
              (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
              return a1;
            }
            v13 = *(unsigned __int16 *)&a2[v7];
            if (*(_WORD *)&a2[v7])
              goto LABEL_32;
          }
LABEL_62:
          if (!(_DWORD)v6)
            goto LABEL_85;
          v9 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
          goto LABEL_64;
        }
LABEL_41:
        if (v7 > 3)
          goto LABEL_42;
        v18 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
        if (v18 > 0xFFFE)
        {
          v17 = *(_DWORD *)&a2[v7];
          if (v17)
            goto LABEL_49;
        }
        else
        {
          if (v18 <= 0xFE)
          {
            if (!v18)
              goto LABEL_58;
LABEL_42:
            v17 = a2[v7];
            if (!a2[v7])
              goto LABEL_58;
LABEL_49:
            v19 = (v17 - 1) << (8 * v7);
            if (v7 > 3)
              v19 = 0;
            if ((_DWORD)v7)
            {
              if (v7 <= 3)
                v20 = v7;
              else
                v20 = 4;
              __asm { BR              X11 }
            }
            if (v19 + (_DWORD)v6 != -1)
              goto LABEL_68;
LABEL_74:
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
            if (v7 <= 3)
            {
              v25 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
              if (v25 > 0xFFFE)
              {
                *(_DWORD *)&a1[v7] = 0;
                return a1;
              }
              if (v25 > 0xFE)
              {
                *(_WORD *)&a1[v7] = 0;
                return a1;
              }
              if (!v25)
                return a1;
            }
            a1[v7] = 0;
            return a1;
          }
          v17 = *(unsigned __int16 *)&a2[v7];
          if (*(_WORD *)&a2[v7])
            goto LABEL_49;
        }
LABEL_58:
        if ((_DWORD)v6
          && (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness))
        {
          goto LABEL_68;
        }
        goto LABEL_74;
      }
      v8 = *(unsigned __int16 *)&a1[v7];
      if (*(_WORD *)&a1[v7])
        goto LABEL_13;
    }
LABEL_22:
    if (!(_DWORD)v6
      || !(*(unsigned int (**)(_BYTE *, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
    {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
  v9 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  if (!v9(a1, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
  {
LABEL_64:
    if (v9(a2, v6, AssociatedTypeWitness))
      goto LABEL_65;
    goto LABEL_85;
  }
  if (v9(a2, v6, AssociatedTypeWitness))
    goto LABEL_78;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

_BYTE *sub_22898ED24(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;
  unsigned int v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (v6 > 1)
    goto LABEL_20;
  if (v7 > 3)
    goto LABEL_3;
  v9 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v9 > 0xFFFE)
  {
    v8 = *(_DWORD *)&a2[v7];
    if (!v8)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v9 > 0xFE)
  {
    v8 = *(unsigned __int16 *)&a2[v7];
    if (!*(_WORD *)&a2[v7])
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_3:
    v8 = a2[v7];
    if (!a2[v7])
      goto LABEL_19;
LABEL_10:
    v10 = (v8 - 1) << (8 * v7);
    if (v7 > 3)
      v10 = 0;
    if ((_DWORD)v7)
    {
      if (v7 <= 3)
        v11 = *(_QWORD *)(v5 + 64);
      else
        v11 = 4;
      __asm { BR              X11 }
    }
    if (v10 + v6 != -1)
      goto LABEL_27;
LABEL_33:
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    if (v7 > 3)
    {
LABEL_37:
      a1[v7] = 0;
      return a1;
    }
    goto LABEL_34;
  }
LABEL_19:
  if (!v6)
    goto LABEL_33;
LABEL_20:
  if ((*(unsigned int (**)(_BYTE *, _QWORD, uint64_t))(v5 + 48))(a2, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
  {
    if (v6 > 1)
    {
LABEL_40:
      memcpy(a1, a2, v7);
      return a1;
    }
LABEL_27:
    if (v7 <= 3)
    {
      v13 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
      if (v13 > 0xFFFE)
      {
        v12 = 4;
      }
      else
      {
        v14 = v13 != 0;
        v15 = v13 >= 0xFF;
        v12 = 2;
        if (!v15)
          v12 = v14;
      }
    }
    else
    {
      v12 = 1;
    }
    v7 += v12;
    goto LABEL_40;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  if (v6 > 1)
    return a1;
  if (v7 > 3)
    goto LABEL_37;
LABEL_34:
  v16 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
  if (v16 > 0xFFFE)
  {
    *(_DWORD *)&a1[v7] = 0;
    return a1;
  }
  if (v16 > 0xFE)
  {
    *(_WORD *)&a1[v7] = 0;
    return a1;
  }
  if (v16)
    goto LABEL_37;
  return a1;
}

_BYTE *sub_22898EF84(_BYTE *a1, _BYTE *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  int v8;
  unsigned int (*v9)(_BYTE *, uint64_t, uint64_t);
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  _BOOL8 v23;
  BOOL v24;
  unsigned int v25;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (v6 <= 1)
  {
    if (v7 > 3)
      goto LABEL_3;
    v10 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
    if (v10 > 0xFFFE)
    {
      v8 = *(_DWORD *)&a1[v7];
      if (v8)
        goto LABEL_13;
    }
    else
    {
      if (v10 <= 0xFE)
      {
        if (!v10)
          goto LABEL_22;
LABEL_3:
        v8 = a1[v7];
        if (!a1[v7])
          goto LABEL_22;
LABEL_13:
        v11 = (v8 - 1) << (8 * v7);
        if (v7 > 3)
          v11 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v12 = *(_QWORD *)(v5 + 64);
          else
            v12 = 4;
          __asm { BR              X11 }
        }
        if (v11 + (_DWORD)v6 == -1)
        {
LABEL_24:
          if (v7 > 3)
            goto LABEL_25;
          v14 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
          if (v14 > 0xFFFE)
          {
            v13 = *(_DWORD *)&a2[v7];
            if (v13)
              goto LABEL_32;
          }
          else
          {
            if (v14 <= 0xFE)
            {
              if (!v14)
                goto LABEL_62;
LABEL_25:
              v13 = a2[v7];
              if (!a2[v7])
                goto LABEL_62;
LABEL_32:
              v15 = (v13 - 1) << (8 * v7);
              if (v7 > 3)
                v15 = 0;
              if ((_DWORD)v7)
              {
                if (v7 <= 3)
                  v16 = v7;
                else
                  v16 = 4;
                __asm { BR              X11 }
              }
              if ((_DWORD)v6 + v15 != -1)
              {
LABEL_65:
                (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
                if (v6 <= 1)
                {
LABEL_68:
                  if (v7 <= 3)
                  {
                    v22 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
                    if (v22 > 0xFFFE)
                    {
                      v21 = 4;
                    }
                    else
                    {
                      v23 = v22 != 0;
                      v24 = v22 >= 0xFF;
                      v21 = 2;
                      if (!v24)
                        v21 = v23;
                    }
                  }
                  else
                  {
                    v21 = 1;
                  }
                  v7 += v21;
                }
LABEL_78:
                memcpy(a1, a2, v7);
                return a1;
              }
LABEL_85:
              (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
              return a1;
            }
            v13 = *(unsigned __int16 *)&a2[v7];
            if (*(_WORD *)&a2[v7])
              goto LABEL_32;
          }
LABEL_62:
          if (!(_DWORD)v6)
            goto LABEL_85;
          v9 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
          goto LABEL_64;
        }
LABEL_41:
        if (v7 > 3)
          goto LABEL_42;
        v18 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
        if (v18 > 0xFFFE)
        {
          v17 = *(_DWORD *)&a2[v7];
          if (v17)
            goto LABEL_49;
        }
        else
        {
          if (v18 <= 0xFE)
          {
            if (!v18)
              goto LABEL_58;
LABEL_42:
            v17 = a2[v7];
            if (!a2[v7])
              goto LABEL_58;
LABEL_49:
            v19 = (v17 - 1) << (8 * v7);
            if (v7 > 3)
              v19 = 0;
            if ((_DWORD)v7)
            {
              if (v7 <= 3)
                v20 = v7;
              else
                v20 = 4;
              __asm { BR              X11 }
            }
            if (v19 + (_DWORD)v6 != -1)
              goto LABEL_68;
LABEL_74:
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
            if (v7 <= 3)
            {
              v25 = (~(-1 << (8 * v7)) - v6 + 2) >> (8 * v7);
              if (v25 > 0xFFFE)
              {
                *(_DWORD *)&a1[v7] = 0;
                return a1;
              }
              if (v25 > 0xFE)
              {
                *(_WORD *)&a1[v7] = 0;
                return a1;
              }
              if (!v25)
                return a1;
            }
            a1[v7] = 0;
            return a1;
          }
          v17 = *(unsigned __int16 *)&a2[v7];
          if (*(_WORD *)&a2[v7])
            goto LABEL_49;
        }
LABEL_58:
        if ((_DWORD)v6
          && (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(a2, v6, AssociatedTypeWitness))
        {
          goto LABEL_68;
        }
        goto LABEL_74;
      }
      v8 = *(unsigned __int16 *)&a1[v7];
      if (*(_WORD *)&a1[v7])
        goto LABEL_13;
    }
LABEL_22:
    if (!(_DWORD)v6
      || !(*(unsigned int (**)(_BYTE *, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
    {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
  v9 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48);
  if (!v9(a1, *(unsigned int *)(v5 + 84), AssociatedTypeWitness))
  {
LABEL_64:
    if (v9(a2, v6, AssociatedTypeWitness))
      goto LABEL_65;
    goto LABEL_85;
  }
  if (v9(a2, v6, AssociatedTypeWitness))
    goto LABEL_78;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_22898F410(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t result;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = v6 - 2;
  v8 = *(_QWORD *)(v5 + 64);
  if (v6 <= 1)
  {
    v7 = 0;
    if (v8 <= 3)
    {
      v10 = (~(-1 << (8 * v8)) - v6 + 2) >> (8 * v8);
      if (v10 > 0xFFFE)
      {
        v9 = 4;
      }
      else
      {
        v11 = v10 != 0;
        v12 = v10 >= 0xFF;
        v9 = 2;
        if (!v12)
          v9 = v11;
      }
    }
    else
    {
      v9 = 1;
    }
    v8 += v9;
  }
  if (!a2)
    return 0;
  if (a2 <= v7)
    goto LABEL_27;
  v13 = 8 * v8;
  if (v8 > 3)
    goto LABEL_13;
  v15 = ((a2 - v7 + ~(-1 << v13)) >> v13) + 1;
  if (HIWORD(v15))
  {
    v14 = *(_DWORD *)(a1 + v8);
    if (v14)
      goto LABEL_20;
  }
  else
  {
    if (v15 <= 0xFF)
    {
      if (v15 < 2)
        goto LABEL_27;
LABEL_13:
      v14 = *(unsigned __int8 *)(a1 + v8);
      if (!*(_BYTE *)(a1 + v8))
        goto LABEL_27;
LABEL_20:
      v16 = (v14 - 1) << v13;
      if (v8 > 3)
        v16 = 0;
      if ((_DWORD)v8)
      {
        if (v8 > 3)
          LODWORD(v8) = 4;
        __asm { BR              X12 }
      }
      return v7 + v16 + 1;
    }
    v14 = *(unsigned __int16 *)(a1 + v8);
    if (*(_WORD *)(a1 + v8))
      goto LABEL_20;
  }
LABEL_27:
  if (!v7)
    return 0;
  if (!(_DWORD)v6)
    return 0;
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
  v12 = v17 >= 2;
  result = v17 - 2;
  if ((_DWORD)result == 0 || !v12)
    return 0;
  return result;
}

void sub_22898F5BC(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  unsigned int v12;
  _BOOL8 v13;
  BOOL v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = v7 - 2;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = v9;
  if (v7 <= 1)
  {
    v8 = 0;
    if (v9 <= 3)
    {
      v12 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v12 > 0xFFFE)
      {
        v11 = 4;
      }
      else
      {
        v13 = v12 != 0;
        v14 = v12 >= 0xFF;
        v11 = 2;
        if (!v14)
          v11 = v13;
      }
    }
    else
    {
      v11 = 1;
    }
    v10 = v11 + v9;
  }
  if (a3 <= v8)
  {
    v15 = 0;
  }
  else if (v10 <= 3)
  {
    v17 = ((a3 - v8 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v17))
    {
      v15 = 4u;
    }
    else if (v17 >= 0x100)
    {
      v15 = 2;
    }
    else
    {
      v15 = v17 > 1;
    }
  }
  else
  {
    v15 = 1u;
  }
  if (v8 < a2)
  {
    v16 = ~v8 + a2;
    if (v10 < 4)
    {
      if ((_DWORD)v10)
      {
        v18 = v16 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if ((_DWORD)v10 == 3)
        {
          *(_WORD *)a1 = v18;
          a1[2] = BYTE2(v18);
        }
        else if ((_DWORD)v10 == 2)
        {
          *(_WORD *)a1 = v18;
        }
        else
        {
          *a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

void sub_22898F864()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
  JUMPOUT(0x22898F850);
}

void sub_22898F874()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
  JUMPOUT(0x22898F850);
}

void sub_22898F87C()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  JUMPOUT(0x22898F850);
}

uint64_t sub_22898F888(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v7;
  int v8;

  v2 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v3 = *(_DWORD *)(v2 + 84);
  if (v3 > 1)
    return (*(uint64_t (**)(uint64_t))(v2 + 48))(a1);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = 8 * v4;
  if (v4 > 3)
    goto LABEL_3;
  v7 = (~(-1 << v5) - v3 + 2) >> v5;
  if (v7 > 0xFFFE)
  {
    v6 = *(_DWORD *)(a1 + v4);
    if (v6)
      goto LABEL_10;
  }
  else
  {
    if (v7 <= 0xFE)
    {
      if (!v7)
        goto LABEL_17;
LABEL_3:
      v6 = *(unsigned __int8 *)(a1 + v4);
      if (!*(_BYTE *)(a1 + v4))
        goto LABEL_17;
LABEL_10:
      v8 = (v6 - 1) << v5;
      if (v4 > 3)
        v8 = 0;
      if ((_DWORD)v4)
      {
        if (v4 > 3)
          LODWORD(v4) = 4;
        __asm { BR              X11 }
      }
      return v3 + v8 + 1;
    }
    v6 = *(unsigned __int16 *)(a1 + v4);
    if (*(_WORD *)(a1 + v4))
      goto LABEL_10;
  }
LABEL_17:
  if (v3)
    return (*(uint64_t (**)(uint64_t))(v2 + 48))(a1);
  return 0;
}

void sub_22898F9C4(_BYTE *a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(v4 + 64);
  if (v5 > 1)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = (~(-1 << (8 * v6)) - v5 + 2) >> (8 * v6);
    if (v9 > 0xFFFE)
    {
      v7 = 4u;
    }
    else if (v9 >= 0xFF)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 != 0;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (v5 < a2)
  {
    v8 = ~v5 + a2;
    if (v6 < 4)
    {
      if ((_DWORD)v6)
      {
        v10 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if ((_DWORD)v6 == 3)
        {
          *(_WORD *)a1 = v10;
          a1[2] = BYTE2(v10);
        }
        else if ((_DWORD)v6 == 2)
        {
          *(_WORD *)a1 = v10;
        }
        else
        {
          *a1 = v10;
        }
      }
    }
    else
    {
      bzero(a1, v6);
      *(_DWORD *)a1 = v8;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for IntersectLineLine2Result(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectLineLine2Result);
}

uint64_t sub_22898FBA4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

_QWORD *sub_22898FBFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _BOOL8 v24;
  unsigned int v25;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 = v10 + v8;
  }
  v14 = *(_DWORD *)(v6 + 80);
  if (v14 > 7 || v9 > 0x18 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
    return v4;
  }
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v19 > 0xFFFE)
      {
        v18 = *(_DWORD *)((char *)a2 + v8);
        if (!v18)
          goto LABEL_36;
        goto LABEL_27;
      }
      if (v19 > 0xFE)
      {
        v18 = *(unsigned __int16 *)((char *)a2 + v8);
        if (!*(_WORD *)((char *)a2 + v8))
          goto LABEL_36;
        goto LABEL_27;
      }
      if (!v19)
      {
LABEL_36:
        if (v7)
          goto LABEL_37;
LABEL_50:
        (*(void (**)(_QWORD *, _QWORD *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
        if (v8 > 3)
          goto LABEL_54;
        goto LABEL_51;
      }
    }
    v18 = *((unsigned __int8 *)a2 + v8);
    if (!*((_BYTE *)a2 + v8))
      goto LABEL_36;
LABEL_27:
    v20 = (v18 - 1) << (8 * v8);
    if (v8 > 3)
      v20 = 0;
    if ((_DWORD)v8)
    {
      if (v8 <= 3)
        v21 = v8;
      else
        v21 = 4;
      __asm { BR              X11 }
    }
    if (v20 + v7 != -1)
      goto LABEL_44;
    goto LABEL_50;
  }
LABEL_37:
  if ((*(unsigned int (**)(_QWORD *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
  {
    if (v7 > 1)
    {
LABEL_57:
      memcpy(v4, a2, v8);
      return v4;
    }
LABEL_44:
    if (v8 <= 3)
    {
      v23 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v23 > 0xFFFE)
      {
        v22 = 4;
      }
      else
      {
        v24 = v23 != 0;
        v13 = v23 >= 0xFF;
        v22 = 2;
        if (!v13)
          v22 = v24;
      }
    }
    else
    {
      v22 = 1;
    }
    v8 += v22;
    goto LABEL_57;
  }
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(v4, a2, v5);
  if (v7 > 1)
    return v4;
  if (v8 > 3)
  {
LABEL_54:
    *((_BYTE *)v4 + v8) = 0;
    return v4;
  }
LABEL_51:
  v25 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v25 > 0xFFFE)
  {
    *(_DWORD *)((char *)v4 + v8) = 0;
    return v4;
  }
  if (v25 > 0xFE)
  {
    *(_WORD *)((char *)v4 + v8) = 0;
    return v4;
  }
  if (v25)
    goto LABEL_54;
  return v4;
}

uint64_t sub_22898FEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  char v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 > 1)
  {
LABEL_18:
    result = (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
    if ((_DWORD)result)
      return result;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  v6 = *(_QWORD *)(v4 + 64);
  v7 = 8 * v6;
  if (v6 <= 3)
  {
    v9 = (~(-1 << v7) - v5 + 2) >> v7;
    if (v9 > 0xFFFE)
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_17;
      goto LABEL_10;
    }
    if (v9 > 0xFE)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_17;
      goto LABEL_10;
    }
    if (!v9)
    {
LABEL_17:
      if (!v5)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
      goto LABEL_18;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_17;
LABEL_10:
  v10 = (v8 - 1) << v7;
  if (v6 > 3)
    v10 = 0;
  if ((_DWORD)v6)
  {
    if (v6 > 3)
      LODWORD(v6) = 4;
    __asm { BR              X11 }
  }
  result = v5 + v10 + 1;
  if (v5 + v10 == -1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

_BYTE *sub_228990018(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL8 v15;
  BOOL v16;
  unsigned int v17;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 > 1)
    goto LABEL_20;
  if (v8 > 3)
    goto LABEL_3;
  v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v10 > 0xFFFE)
  {
    v9 = *(_DWORD *)&a2[v8];
    if (!v9)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v10 > 0xFE)
  {
    v9 = *(unsigned __int16 *)&a2[v8];
    if (!*(_WORD *)&a2[v8])
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_3:
    v9 = a2[v8];
    if (!a2[v8])
      goto LABEL_19;
LABEL_10:
    v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3)
      v11 = 0;
    if ((_DWORD)v8)
    {
      if (v8 <= 3)
        v12 = *(_QWORD *)(v6 + 64);
      else
        v12 = 4;
      __asm { BR              X11 }
    }
    if (v11 + v7 != -1)
      goto LABEL_27;
LABEL_33:
    (*(void (**)(_BYTE *, _BYTE *, _QWORD))(v6 + 16))(a1, a2, *(_QWORD *)(a3 + 16));
    if (v8 > 3)
    {
LABEL_37:
      a1[v8] = 0;
      return a1;
    }
    goto LABEL_34;
  }
LABEL_19:
  if (!v7)
    goto LABEL_33;
LABEL_20:
  if ((*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
  {
    if (v7 > 1)
    {
LABEL_40:
      memcpy(a1, a2, v8);
      return a1;
    }
LABEL_27:
    if (v8 <= 3)
    {
      v14 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v14 > 0xFFFE)
      {
        v13 = 4;
      }
      else
      {
        v15 = v14 != 0;
        v16 = v14 >= 0xFF;
        v13 = 2;
        if (!v16)
          v13 = v15;
      }
    }
    else
    {
      v13 = 1;
    }
    v8 += v13;
    goto LABEL_40;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
  if (v7 > 1)
    return a1;
  if (v8 > 3)
    goto LABEL_37;
LABEL_34:
  v17 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v17 > 0xFFFE)
  {
    *(_DWORD *)&a1[v8] = 0;
    return a1;
  }
  if (v17 > 0xFE)
  {
    *(_WORD *)&a1[v8] = 0;
    return a1;
  }
  if (v17)
    goto LABEL_37;
  return a1;
}

_BYTE *sub_22899025C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  unsigned int (*v10)(_BYTE *, uint64_t, uint64_t);
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _BOOL8 v24;
  BOOL v25;
  unsigned int v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 <= 1)
  {
    if (v8 > 3)
      goto LABEL_3;
    v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
    if (v11 > 0xFFFE)
    {
      v9 = *(_DWORD *)&a1[v8];
      if (v9)
        goto LABEL_13;
    }
    else
    {
      if (v11 <= 0xFE)
      {
        if (!v11)
          goto LABEL_22;
LABEL_3:
        v9 = a1[v8];
        if (!a1[v8])
          goto LABEL_22;
LABEL_13:
        v12 = (v9 - 1) << (8 * v8);
        if (v8 > 3)
          v12 = 0;
        if ((_DWORD)v8)
        {
          if (v8 <= 3)
            v13 = *(_QWORD *)(v6 + 64);
          else
            v13 = 4;
          __asm { BR              X11 }
        }
        if (v12 + (_DWORD)v7 == -1)
        {
LABEL_24:
          if (v8 > 3)
            goto LABEL_25;
          v15 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v15 > 0xFFFE)
          {
            v14 = *(_DWORD *)&a2[v8];
            if (v14)
              goto LABEL_32;
          }
          else
          {
            if (v15 <= 0xFE)
            {
              if (!v15)
                goto LABEL_62;
LABEL_25:
              v14 = a2[v8];
              if (!a2[v8])
                goto LABEL_62;
LABEL_32:
              v16 = (v14 - 1) << (8 * v8);
              if (v8 > 3)
                v16 = 0;
              if ((_DWORD)v8)
              {
                if (v8 <= 3)
                  v17 = v8;
                else
                  v17 = 4;
                __asm { BR              X11 }
              }
              if ((_DWORD)v7 + v16 != -1)
              {
LABEL_65:
                (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(a1, v5);
                if (v7 <= 1)
                {
LABEL_68:
                  if (v8 <= 3)
                  {
                    v23 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
                    if (v23 > 0xFFFE)
                    {
                      v22 = 4;
                    }
                    else
                    {
                      v24 = v23 != 0;
                      v25 = v23 >= 0xFF;
                      v22 = 2;
                      if (!v25)
                        v22 = v24;
                    }
                  }
                  else
                  {
                    v22 = 1;
                  }
                  v8 += v22;
                }
LABEL_78:
                memcpy(a1, a2, v8);
                return a1;
              }
LABEL_85:
              (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 24))(a1, a2, v5);
              return a1;
            }
            v14 = *(unsigned __int16 *)&a2[v8];
            if (*(_WORD *)&a2[v8])
              goto LABEL_32;
          }
LABEL_62:
          if (!(_DWORD)v7)
            goto LABEL_85;
          v10 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48);
          goto LABEL_64;
        }
LABEL_41:
        if (v8 > 3)
          goto LABEL_42;
        v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v19 > 0xFFFE)
        {
          v18 = *(_DWORD *)&a2[v8];
          if (v18)
            goto LABEL_49;
        }
        else
        {
          if (v19 <= 0xFE)
          {
            if (!v19)
              goto LABEL_58;
LABEL_42:
            v18 = a2[v8];
            if (!a2[v8])
              goto LABEL_58;
LABEL_49:
            v20 = (v18 - 1) << (8 * v8);
            if (v8 > 3)
              v20 = 0;
            if ((_DWORD)v8)
            {
              if (v8 <= 3)
                v21 = v8;
              else
                v21 = 4;
              __asm { BR              X11 }
            }
            if (v20 + (_DWORD)v7 != -1)
              goto LABEL_68;
LABEL_74:
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
            if (v8 <= 3)
            {
              v26 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
              if (v26 > 0xFFFE)
              {
                *(_DWORD *)&a1[v8] = 0;
                return a1;
              }
              if (v26 > 0xFE)
              {
                *(_WORD *)&a1[v8] = 0;
                return a1;
              }
              if (!v26)
                return a1;
            }
            a1[v8] = 0;
            return a1;
          }
          v18 = *(unsigned __int16 *)&a2[v8];
          if (*(_WORD *)&a2[v8])
            goto LABEL_49;
        }
LABEL_58:
        if ((_DWORD)v7 && (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
          goto LABEL_68;
        goto LABEL_74;
      }
      v9 = *(unsigned __int16 *)&a1[v8];
      if (*(_WORD *)&a1[v8])
        goto LABEL_13;
    }
LABEL_22:
    if (!(_DWORD)v7
      || !(*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
    {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
  v10 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48);
  if (!v10(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
  {
LABEL_64:
    if (v10(a2, v7, v5))
      goto LABEL_65;
    goto LABEL_85;
  }
  if (v10(a2, v7, v5))
    goto LABEL_78;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(a1, a2, v5);
  return a1;
}

_BYTE *sub_2289906CC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  _BOOL8 v15;
  BOOL v16;
  unsigned int v17;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 > 1)
    goto LABEL_20;
  if (v8 > 3)
    goto LABEL_3;
  v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v10 > 0xFFFE)
  {
    v9 = *(_DWORD *)&a2[v8];
    if (!v9)
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v10 > 0xFE)
  {
    v9 = *(unsigned __int16 *)&a2[v8];
    if (!*(_WORD *)&a2[v8])
      goto LABEL_19;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_3:
    v9 = a2[v8];
    if (!a2[v8])
      goto LABEL_19;
LABEL_10:
    v11 = (v9 - 1) << (8 * v8);
    if (v8 > 3)
      v11 = 0;
    if ((_DWORD)v8)
    {
      if (v8 <= 3)
        v12 = *(_QWORD *)(v6 + 64);
      else
        v12 = 4;
      __asm { BR              X11 }
    }
    if (v11 + v7 != -1)
      goto LABEL_27;
LABEL_33:
    (*(void (**)(_BYTE *, _BYTE *, _QWORD))(v6 + 32))(a1, a2, *(_QWORD *)(a3 + 16));
    if (v8 > 3)
    {
LABEL_37:
      a1[v8] = 0;
      return a1;
    }
    goto LABEL_34;
  }
LABEL_19:
  if (!v7)
    goto LABEL_33;
LABEL_20:
  if ((*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a2, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
  {
    if (v7 > 1)
    {
LABEL_40:
      memcpy(a1, a2, v8);
      return a1;
    }
LABEL_27:
    if (v8 <= 3)
    {
      v14 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v14 > 0xFFFE)
      {
        v13 = 4;
      }
      else
      {
        v15 = v14 != 0;
        v16 = v14 >= 0xFF;
        v13 = 2;
        if (!v16)
          v13 = v15;
      }
    }
    else
    {
      v13 = 1;
    }
    v8 += v13;
    goto LABEL_40;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
  if (v7 > 1)
    return a1;
  if (v8 > 3)
    goto LABEL_37;
LABEL_34:
  v17 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
  if (v17 > 0xFFFE)
  {
    *(_DWORD *)&a1[v8] = 0;
    return a1;
  }
  if (v17 > 0xFE)
  {
    *(_WORD *)&a1[v8] = 0;
    return a1;
  }
  if (v17)
    goto LABEL_37;
  return a1;
}

_BYTE *sub_228990910(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  unsigned int (*v10)(_BYTE *, uint64_t, uint64_t);
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  _BOOL8 v24;
  BOOL v25;
  unsigned int v26;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  if (v7 <= 1)
  {
    if (v8 > 3)
      goto LABEL_3;
    v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
    if (v11 > 0xFFFE)
    {
      v9 = *(_DWORD *)&a1[v8];
      if (v9)
        goto LABEL_13;
    }
    else
    {
      if (v11 <= 0xFE)
      {
        if (!v11)
          goto LABEL_22;
LABEL_3:
        v9 = a1[v8];
        if (!a1[v8])
          goto LABEL_22;
LABEL_13:
        v12 = (v9 - 1) << (8 * v8);
        if (v8 > 3)
          v12 = 0;
        if ((_DWORD)v8)
        {
          if (v8 <= 3)
            v13 = *(_QWORD *)(v6 + 64);
          else
            v13 = 4;
          __asm { BR              X11 }
        }
        if (v12 + (_DWORD)v7 == -1)
        {
LABEL_24:
          if (v8 > 3)
            goto LABEL_25;
          v15 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v15 > 0xFFFE)
          {
            v14 = *(_DWORD *)&a2[v8];
            if (v14)
              goto LABEL_32;
          }
          else
          {
            if (v15 <= 0xFE)
            {
              if (!v15)
                goto LABEL_62;
LABEL_25:
              v14 = a2[v8];
              if (!a2[v8])
                goto LABEL_62;
LABEL_32:
              v16 = (v14 - 1) << (8 * v8);
              if (v8 > 3)
                v16 = 0;
              if ((_DWORD)v8)
              {
                if (v8 <= 3)
                  v17 = v8;
                else
                  v17 = 4;
                __asm { BR              X11 }
              }
              if ((_DWORD)v7 + v16 != -1)
              {
LABEL_65:
                (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(a1, v5);
                if (v7 <= 1)
                {
LABEL_68:
                  if (v8 <= 3)
                  {
                    v23 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
                    if (v23 > 0xFFFE)
                    {
                      v22 = 4;
                    }
                    else
                    {
                      v24 = v23 != 0;
                      v25 = v23 >= 0xFF;
                      v22 = 2;
                      if (!v25)
                        v22 = v24;
                    }
                  }
                  else
                  {
                    v22 = 1;
                  }
                  v8 += v22;
                }
LABEL_78:
                memcpy(a1, a2, v8);
                return a1;
              }
LABEL_85:
              (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 40))(a1, a2, v5);
              return a1;
            }
            v14 = *(unsigned __int16 *)&a2[v8];
            if (*(_WORD *)&a2[v8])
              goto LABEL_32;
          }
LABEL_62:
          if (!(_DWORD)v7)
            goto LABEL_85;
          v10 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48);
          goto LABEL_64;
        }
LABEL_41:
        if (v8 > 3)
          goto LABEL_42;
        v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v19 > 0xFFFE)
        {
          v18 = *(_DWORD *)&a2[v8];
          if (v18)
            goto LABEL_49;
        }
        else
        {
          if (v19 <= 0xFE)
          {
            if (!v19)
              goto LABEL_58;
LABEL_42:
            v18 = a2[v8];
            if (!a2[v8])
              goto LABEL_58;
LABEL_49:
            v20 = (v18 - 1) << (8 * v8);
            if (v8 > 3)
              v20 = 0;
            if ((_DWORD)v8)
            {
              if (v8 <= 3)
                v21 = v8;
              else
                v21 = 4;
              __asm { BR              X11 }
            }
            if (v20 + (_DWORD)v7 != -1)
              goto LABEL_68;
LABEL_74:
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
            if (v8 <= 3)
            {
              v26 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
              if (v26 > 0xFFFE)
              {
                *(_DWORD *)&a1[v8] = 0;
                return a1;
              }
              if (v26 > 0xFE)
              {
                *(_WORD *)&a1[v8] = 0;
                return a1;
              }
              if (!v26)
                return a1;
            }
            a1[v8] = 0;
            return a1;
          }
          v18 = *(unsigned __int16 *)&a2[v8];
          if (*(_WORD *)&a2[v8])
            goto LABEL_49;
        }
LABEL_58:
        if ((_DWORD)v7 && (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(a2, v7, v5))
          goto LABEL_68;
        goto LABEL_74;
      }
      v9 = *(unsigned __int16 *)&a1[v8];
      if (*(_WORD *)&a1[v8])
        goto LABEL_13;
    }
LABEL_22:
    if (!(_DWORD)v7
      || !(*(unsigned int (**)(_BYTE *, _QWORD, _QWORD))(v6 + 48))(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
    {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
  v10 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48);
  if (!v10(a1, *(unsigned int *)(v6 + 84), *(_QWORD *)(a3 + 16)))
  {
LABEL_64:
    if (v10(a2, v7, v5))
      goto LABEL_65;
    goto LABEL_85;
  }
  if (v10(a2, v7, v5))
    goto LABEL_78;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(a1, a2, v5);
  return a1;
}

uint64_t sub_228990D80(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 2;
  v7 = *(_QWORD *)(v4 + 64);
  if (v5 <= 1)
  {
    v6 = 0;
    if (v7 <= 3)
    {
      v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        v8 = 4;
      }
      else
      {
        v10 = v9 != 0;
        v11 = v9 >= 0xFF;
        v8 = 2;
        if (!v11)
          v8 = v10;
      }
    }
    else
    {
      v8 = 1;
    }
    v7 += v8;
  }
  if (!a2)
    return 0;
  v12 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_29;
  v13 = 8 * v7;
  if (v7 > 3)
    goto LABEL_13;
  v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
  if (HIWORD(v15))
  {
    v14 = *(_DWORD *)(a1 + v7);
    if (v14)
      goto LABEL_20;
  }
  else
  {
    if (v15 <= 0xFF)
    {
      if (v15 < 2)
        goto LABEL_29;
LABEL_13:
      v14 = *(unsigned __int8 *)(a1 + v7);
      if (!*(_BYTE *)(a1 + v7))
        goto LABEL_29;
LABEL_20:
      v16 = (v14 - 1) << v13;
      if (v7 > 3)
        v16 = 0;
      if ((_DWORD)v7)
      {
        if (v7 <= 3)
          v17 = v7;
        else
          v17 = 4;
        __asm { BR              X12 }
      }
      return v6 + v16 + 1;
    }
    v14 = *(unsigned __int16 *)(a1 + v7);
    if (*(_WORD *)(a1 + v7))
      goto LABEL_20;
  }
LABEL_29:
  if (!v6)
    return 0;
  if (!v5)
    return 0;
  v18 = (*(uint64_t (**)(void))(v4 + 48))();
  v11 = v18 >= 2;
  result = v18 - 2;
  if ((_DWORD)result == 0 || !v11)
    return 0;
  return result;
}

void sub_228990F0C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  unsigned int v12;
  _BOOL8 v13;
  BOOL v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  int v19;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = v7 - 2;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = v9;
  if (v7 <= 1)
  {
    v8 = 0;
    if (v9 <= 3)
    {
      v12 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v12 > 0xFFFE)
      {
        v11 = 4;
      }
      else
      {
        v13 = v12 != 0;
        v14 = v12 >= 0xFF;
        v11 = 2;
        if (!v14)
          v11 = v13;
      }
    }
    else
    {
      v11 = 1;
    }
    v10 = v11 + v9;
  }
  v14 = a3 >= v8;
  v15 = a3 - v8;
  if (v15 != 0 && v14)
  {
    if (v10 <= 3)
    {
      v18 = ((v15 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v18))
      {
        v16 = 4u;
      }
      else if (v18 >= 0x100)
      {
        v16 = 2;
      }
      else
      {
        v16 = v18 > 1;
      }
    }
    else
    {
      v16 = 1u;
    }
  }
  else
  {
    v16 = 0;
  }
  if (v8 < a2)
  {
    v17 = ~v8 + a2;
    if (v10 < 4)
    {
      if ((_DWORD)v10)
      {
        v19 = v17 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if ((_DWORD)v10 == 3)
        {
          *a1 = v19;
          *((_BYTE *)a1 + 2) = BYTE2(v19);
        }
        else if ((_DWORD)v10 == 2)
        {
          *a1 = v19;
        }
        else
        {
          *(_BYTE *)a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v17;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

void sub_228991198()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
  JUMPOUT(0x228991184);
}

void sub_2289911A8()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
  JUMPOUT(0x228991184);
}

void sub_2289911B0()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  JUMPOUT(0x228991184);
}

uint64_t sub_2289911BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v7;
  int v8;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_DWORD *)(v2 + 84);
  if (v3 > 1)
    return (*(uint64_t (**)(void))(v2 + 48))();
  v4 = *(_QWORD *)(v2 + 64);
  v5 = 8 * v4;
  if (v4 > 3)
    goto LABEL_3;
  v7 = (~(-1 << v5) - v3 + 2) >> v5;
  if (v7 > 0xFFFE)
  {
    v6 = *(_DWORD *)(a1 + v4);
    if (v6)
      goto LABEL_10;
  }
  else
  {
    if (v7 <= 0xFE)
    {
      if (!v7)
        goto LABEL_17;
LABEL_3:
      v6 = *(unsigned __int8 *)(a1 + v4);
      if (!*(_BYTE *)(a1 + v4))
        goto LABEL_17;
LABEL_10:
      v8 = (v6 - 1) << v5;
      if (v4 > 3)
        v8 = 0;
      if (!(_DWORD)v4)
        return v3 + v8 + 1;
      if (v4 > 3)
        LODWORD(v4) = 4;
      return ((uint64_t (*)(void))((char *)&loc_228991264 + 4 * byte_2289C4092[(v4 - 1)]))();
    }
    v6 = *(unsigned __int16 *)(a1 + v4);
    if (*(_WORD *)(a1 + v4))
      goto LABEL_10;
  }
LABEL_17:
  if (v3)
    return (*(uint64_t (**)(void))(v2 + 48))();
  return 0;
}

void sub_2289912B4(_WORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  size_t v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(v4 + 64);
  if (v5 > 1)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = (~(-1 << (8 * v6)) - v5 + 2) >> (8 * v6);
    if (v9 > 0xFFFE)
    {
      v7 = 4u;
    }
    else if (v9 >= 0xFF)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 != 0;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (v5 < a2)
  {
    v8 = ~v5 + a2;
    if (v6 < 4)
    {
      if ((_DWORD)v6)
      {
        v10 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if ((_DWORD)v6 == 3)
        {
          *a1 = v10;
          *((_BYTE *)a1 + 2) = BYTE2(v10);
        }
        else if ((_DWORD)v6 == 2)
        {
          *a1 = v10;
        }
        else
        {
          *(_BYTE *)a1 = v10;
        }
      }
    }
    else
    {
      bzero(a1, v6);
      *(_DWORD *)a1 = v8;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for IntersectLineLineSegmentResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectLineLineSegmentResult);
}

uint64_t sub_228991470()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char *v4;
  uint64_t *v5;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v4 = &v3;
    swift_getTupleTypeLayout2();
    v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *sub_22899150C(_QWORD *__dst, unsigned __int8 *__src, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void (*v17)(_QWORD *, unsigned __int8 *, uint64_t);

  v4 = __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = ~v8;
  v10 = v7 + v8;
  v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || (unint64_t)(v11 + 1) > 0x18)
  {
    v14 = *(_QWORD *)__src;
    *v4 = *(_QWORD *)__src;
    v4 = (_QWORD *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    v15 = __src[v11];
    if (v15 >= 2)
    {
      if (v11 <= 3)
        v16 = v11;
      else
        v16 = 4;
      __asm { BR              X13 }
    }
    v17 = *(void (**)(_QWORD *, unsigned __int8 *, uint64_t))(v6 + 16);
    if (v15 == 1)
    {
      v17(__dst, __src, v5);
      v17((_QWORD *)(((unint64_t)v4 + v10) & v9), (unsigned __int8 *)((unint64_t)&__src[v10] & v9), v5);
      *((_BYTE *)v4 + v11) = 1;
    }
    else
    {
      v17(__dst, __src, v5);
      v17((_QWORD *)(((unint64_t)v4 + v10) & v9), (unsigned __int8 *)((unint64_t)&__src[v10] & v9), v5);
      *((_BYTE *)v4 + v11) = 0;
    }
  }
  return v4;
}

uint64_t sub_228991694(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = ((v5 + v6) & ~v6) + v5;
  if (*(unsigned __int8 *)(a1 + v8) >= 2u)
  {
    if (v8 <= 3)
      v9 = v8;
    else
      v9 = 4;
    __asm { BR              X15 }
  }
  v10 = ~v6;
  v12 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v12(a1, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v12)((v7 + a1) & v10, v3);
}

_BYTE *sub_228991794(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, unsigned __int8 *, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  v10 = ((v7 + v8) & ~v8) + v7;
  v11 = __src[v10];
  if (v11 >= 2)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X14 }
  }
  v13 = ~v8;
  v14 = *(void (**)(_BYTE *, unsigned __int8 *, uint64_t))(v6 + 16);
  if (v11 == 1)
  {
    v14(__dst, __src, *(_QWORD *)(a3 + 16));
    v14((_BYTE *)((unint64_t)&__dst[v9] & v13), (unsigned __int8 *)((unint64_t)&__src[v9] & v13), v5);
    __dst[v10] = 1;
  }
  else
  {
    v14(__dst, __src, *(_QWORD *)(a3 + 16));
    v14((_BYTE *)((unint64_t)&__dst[v9] & v13), (unsigned __int8 *)((unint64_t)&__src[v9] & v13), v5);
    __dst[v10] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_2289918E8(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(unsigned __int8 *, uint64_t);
  unsigned int v14;
  uint64_t v15;
  void (*v16)(unsigned __int8 *, unsigned __int8 *, uint64_t);

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    v10 = ((v7 + v8) & ~v8) + v7;
    if (__dst[v10] >= 2u)
    {
      if (v10 <= 3)
        v11 = v10;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    v12 = ~v8;
    v13 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
    v13(__dst, *(_QWORD *)(a3 + 16));
    v13((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), v5);
    v14 = __src[v10];
    if (v14 >= 2)
    {
      if (v10 <= 3)
        v15 = v10;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
    if (v14 == 1)
    {
      v16(__dst, __src, v5);
      v16((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), (unsigned __int8 *)((unint64_t)&__src[v9] & v12), v5);
      __dst[v10] = 1;
    }
    else
    {
      v16(__dst, __src, v5);
      v16((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), (unsigned __int8 *)((unint64_t)&__src[v9] & v12), v5);
      __dst[v10] = 0;
    }
  }
  return __dst;
}

_BYTE *sub_228991ADC(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, unsigned __int8 *, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  v10 = ((v7 + v8) & ~v8) + v7;
  v11 = __src[v10];
  if (v11 >= 2)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X14 }
  }
  v13 = ~v8;
  v14 = *(void (**)(_BYTE *, unsigned __int8 *, uint64_t))(v6 + 32);
  if (v11 == 1)
  {
    v14(__dst, __src, *(_QWORD *)(a3 + 16));
    v14((_BYTE *)((unint64_t)&__dst[v9] & v13), (unsigned __int8 *)((unint64_t)&__src[v9] & v13), v5);
    __dst[v10] = 1;
  }
  else
  {
    v14(__dst, __src, *(_QWORD *)(a3 + 16));
    v14((_BYTE *)((unint64_t)&__dst[v9] & v13), (unsigned __int8 *)((unint64_t)&__src[v9] & v13), v5);
    __dst[v10] = 0;
  }
  return __dst;
}

unsigned __int8 *sub_228991C30(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(unsigned __int8 *, uint64_t);
  unsigned int v14;
  uint64_t v15;
  void (*v16)(unsigned __int8 *, unsigned __int8 *, uint64_t);

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    v10 = ((v7 + v8) & ~v8) + v7;
    if (__dst[v10] >= 2u)
    {
      if (v10 <= 3)
        v11 = v10;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    v12 = ~v8;
    v13 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
    v13(__dst, *(_QWORD *)(a3 + 16));
    v13((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), v5);
    v14 = __src[v10];
    if (v14 >= 2)
    {
      if (v10 <= 3)
        v15 = v10;
      else
        v15 = 4;
      __asm { BR              X12 }
    }
    v16 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
    if (v14 == 1)
    {
      v16(__dst, __src, v5);
      v16((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), (unsigned __int8 *)((unint64_t)&__src[v9] & v12), v5);
      __dst[v10] = 1;
    }
    else
    {
      v16(__dst, __src, v5);
      v16((unsigned __int8 *)((unint64_t)&__dst[v9] & v12), (unsigned __int8 *)((unint64_t)&__src[v9] & v12), v5);
      __dst[v10] = 0;
    }
  }
  return __dst;
}

uint64_t sub_228991E24(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (!a2)
    return 0;
  v3 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 < 0xFE)
    goto LABEL_19;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_19:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_19;
LABEL_12:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_228991EEC + 4 * byte_2289C40C8[(v4 - 1)]))();
}

void sub_228991F38(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2289920E4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_228992130 + 4 * byte_2289C40D6[v3]))();
}

void sub_228992178(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v4 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for IntersectLineSegmentLineSegmentResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IntersectLineSegmentLineSegmentResult);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2B7A70](a1, v6, a5);
}

uint64_t (*OS_geom_ddg_evaluator_3f.Stencil.vertices.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*OS_geom_ddg_evaluator_3f.Stencil.weights.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

OS_geom_ddg_evaluator_3f __swiftcall OS_geom_ddg_evaluator_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_ddg_evaluator_3f)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3f);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexArea(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_area_3f(v1, vertexIndex);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexAngleDefect(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_angle_defect_3f(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3f.computeVertexNormal(vertexIndex:)(unsigned int a1)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_normal_3f(v1, a1);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexMeanCurvature(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_mean_curvature_3f(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3f.computeVertexMeanCurvatureVector(vertexIndex:)(unsigned int a1)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3f(v1, a1);
}

Swift::Float __swiftcall OS_geom_ddg_evaluator_3f.computeVertexDivergence(vertexIndex:faceVectorFunction:)(Swift::UInt32 vertexIndex, Swift::OpaquePointer faceVectorFunction)
{
  uint64_t v2;

  return geom_ddg_evaluator_compute_vertex_divergence_3f(v2, vertexIndex, (uint64_t)faceVectorFunction._rawValue + 32);
}

double OS_geom_ddg_evaluator_3f.computeFaceGradient(faceIndex:vertexScalarFunction:)(unsigned int a1, uint64_t a2)
{
  uint64_t v2;

  return geom_ddg_evaluator_compute_face_gradient_3f(v2, a1, a2 + 32);
}

uint64_t OS_geom_ddg_evaluator_3f.computeLaplacianStencil(vertexIndex:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_22899267C(a1, a2, (uint64_t (*)(void))geom_create_collection_f, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3f, a3);
}

Swift::Bool __swiftcall OS_geom_ddg_evaluator_3f.isBoundaryVertex(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_is_boundary_vertex_3f(v1, vertexIndex);
}

Swift::Void __swiftcall OS_geom_ddg_evaluator_3f.getVertexOneRing(vertexIndex:outVertices:)(Swift::UInt32 vertexIndex, OS_geom_collection_u *outVertices)
{
  uint64_t v2;

  geom_ddg_evaluator_get_vertex_one_ring_3f(v2, vertexIndex, (uint64_t)outVertices->super.isa);
}

uint64_t sub_228992380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3f, a3);
}

void sub_22899238C(unsigned int a1@<W0>, float *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_area_3f(*v2, a1);
}

void sub_2289923B8(unsigned int a1@<W0>, float *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_angle_defect_3f(*v2, a1);
}

void sub_2289923E4(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  __int128 v4;

  *(double *)&v4 = geom_ddg_evaluator_compute_vertex_normal_3f(*v2, a1);
  *a2 = v4;
}

void sub_228992410(unsigned int a1@<W0>, float *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_mean_curvature_3f(*v2, a1);
}

void sub_22899243C(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  __int128 v4;

  *(double *)&v4 = geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3f(*v2, a1);
  *a2 = v4;
}

void sub_228992468(unsigned int a1@<W0>, uint64_t a2@<X1>, float *a3@<X8>)
{
  uint64_t *v3;

  *a3 = geom_ddg_evaluator_compute_vertex_divergence_3f(*v3, a1, a2 + 32);
}

void sub_22899249C(unsigned int a1@<W0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  __int128 v5;

  *(double *)&v5 = geom_ddg_evaluator_compute_face_gradient_3f(*v3, a1, a2 + 32);
  *a3 = v5;
}

uint64_t sub_2289924D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_2289928C8(a1, a2, (uint64_t (*)(void))geom_create_collection_f, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3f, a3);
}

BOOL sub_2289924E4(unsigned int a1)
{
  uint64_t *v1;

  return geom_ddg_evaluator_is_boundary_vertex_3f(*v1, a1);
}

void sub_228992500(unsigned int a1, uint64_t *a2)
{
  uint64_t *v2;

  geom_ddg_evaluator_get_vertex_one_ring_3f(*v2, a1, *a2);
}

id OS_geom_ddg_evaluator_3d.Stencil.vertices.getter()
{
  id *v0;

  return *v0;
}

void OS_geom_ddg_evaluator_3d.Stencil.vertices.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*OS_geom_ddg_evaluator_3d.Stencil.vertices.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

id OS_geom_ddg_evaluator_3d.Stencil.weights.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

void OS_geom_ddg_evaluator_3d.Stencil.weights.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*OS_geom_ddg_evaluator_3d.Stencil.weights.modify())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

id sub_228992594()
{
  id *v0;

  return *v0;
}

id sub_22899259C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 8);
  *a1 = v2;
  return v2;
}

OS_geom_ddg_evaluator_3d __swiftcall OS_geom_ddg_evaluator_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_ddg_evaluator_3d)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3d);
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexArea(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_area_3d(v1, vertexIndex);
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexAngleDefect(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_angle_defect_3d(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3d.computeVertexNormal(vertexIndex:)(uint64_t a1)
{
  return sub_2289925F0(a1, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t))geom_ddg_evaluator_compute_vertex_normal_3d);
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexMeanCurvature(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_compute_vertex_mean_curvature_3d(v1, vertexIndex);
}

double OS_geom_ddg_evaluator_3d.computeVertexMeanCurvatureVector(vertexIndex:)(uint64_t a1)
{
  return sub_2289925F0(a1, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t))geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3d);
}

double sub_2289925F0(uint64_t a1, void (*a2)(__int128 *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v2;
  __int128 v4;

  a2(&v4, v2, a1);
  return *(double *)&v4;
}

Swift::Double __swiftcall OS_geom_ddg_evaluator_3d.computeVertexDivergence(vertexIndex:faceVectorFunction:)(Swift::UInt32 vertexIndex, Swift::OpaquePointer faceVectorFunction)
{
  uint64_t v2;

  return geom_ddg_evaluator_compute_vertex_divergence_3d(v2, vertexIndex, (uint64_t)faceVectorFunction._rawValue + 32);
}

double OS_geom_ddg_evaluator_3d.computeFaceGradient(faceIndex:vertexScalarFunction:)(unsigned int a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v4;

  geom_ddg_evaluator_compute_face_gradient_3d(v2, a1, a2 + 32, &v4);
  return *(double *)&v4;
}

uint64_t OS_geom_ddg_evaluator_3d.computeLaplacianStencil(vertexIndex:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_22899267C(a1, a2, (uint64_t (*)(void))geom_create_collection_d, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3d, a3);
}

uint64_t sub_22899267C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t)@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  _QWORD *collection_u;
  uint64_t v12;
  uint64_t result;

  collection_u = geom_create_collection_u();
  v12 = a3();
  result = a4(v5, a2, a1, collection_u, v12);
  *a5 = collection_u;
  a5[1] = v12;
  return result;
}

Swift::Bool __swiftcall OS_geom_ddg_evaluator_3d.isBoundaryVertex(vertexIndex:)(Swift::UInt32 vertexIndex)
{
  uint64_t v1;

  return geom_ddg_evaluator_is_boundary_vertex_3d(v1, vertexIndex);
}

Swift::Void __swiftcall OS_geom_ddg_evaluator_3d.getVertexOneRing(vertexIndex:outVertices:)(Swift::UInt32 vertexIndex, OS_geom_collection_u *outVertices)
{
  uint64_t v2;

  geom_ddg_evaluator_get_vertex_one_ring_3d(v2, vertexIndex, (uint64_t)outVertices->super.isa);
}

_UNKNOWN **sub_22899271C()
{
  return &protocol witness table for OS_geom_ddg_evaluator_3f.Stencil;
}

_UNKNOWN **sub_228992728()
{
  return &protocol witness table for OS_geom_ddg_evaluator_3d.Stencil;
}

uint64_t sub_228992734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_ddg_evaluator_create_3d, a3);
}

void sub_228992740(unsigned int a1@<W0>, double *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_area_3d(*v2, a1);
}

void sub_22899276C(unsigned int a1@<W0>, double *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_angle_defect_3d(*v2, a1);
}

float64_t sub_228992798@<D0>(unsigned int a1@<W0>, float64x2_t *a2@<X8>)
{
  uint64_t *v2;
  float64_t result;
  float64x2_t v5;
  float64x2_t v6[2];

  geom_ddg_evaluator_compute_vertex_normal_3d(*v2, a1, v6);
  result = v6[0].f64[0];
  v5 = v6[1];
  *a2 = v6[0];
  a2[1] = v5;
  return result;
}

void sub_2289927D4(unsigned int a1@<W0>, double *a2@<X8>)
{
  uint64_t *v2;

  *a2 = geom_ddg_evaluator_compute_vertex_mean_curvature_3d(*v2, a1);
}

double sub_228992800@<D0>(unsigned int a1@<W0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  double result;
  __int128 v5;
  _OWORD v6[2];

  geom_ddg_evaluator_compute_vertex_mean_curvature_vector_3d(*v2, a1, v6);
  result = *(double *)v6;
  v5 = v6[1];
  *a2 = v6[0];
  a2[1] = v5;
  return result;
}

void sub_22899283C(unsigned int a1@<W0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  uint64_t *v3;

  *a3 = geom_ddg_evaluator_compute_vertex_divergence_3d(*v3, a1, a2 + 32);
}

double sub_228992870@<D0>(unsigned int a1@<W0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  double result;
  __int128 v6;
  _OWORD v7[2];

  geom_ddg_evaluator_compute_face_gradient_3d(*v3, a1, a2 + 32, v7);
  result = *(double *)v7;
  v6 = v7[1];
  *a3 = v7[0];
  a3[1] = v6;
  return result;
}

uint64_t sub_2289928B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_2289928C8(a1, a2, (uint64_t (*)(void))geom_create_collection_d, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t))geom_ddg_evaluator_compute_laplacian_stencil_3d, a3);
}

uint64_t sub_2289928C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X4>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t)@<X5>, _QWORD *a5@<X8>)
{
  uint64_t *v5;
  uint64_t v11;
  _QWORD *collection_u;
  uint64_t v13;
  uint64_t result;

  v11 = *v5;
  collection_u = geom_create_collection_u();
  v13 = a3();
  result = a4(v11, a2, a1, collection_u, v13);
  *a5 = collection_u;
  a5[1] = v13;
  return result;
}

BOOL sub_22899293C(unsigned int a1)
{
  uint64_t *v1;

  return geom_ddg_evaluator_is_boundary_vertex_3d(*v1, a1);
}

void sub_228992958(unsigned int a1, uint64_t *a2)
{
  uint64_t *v2;

  geom_ddg_evaluator_get_vertex_one_ring_3d(*v2, a1, *a2);
}

uint64_t dispatch thunk of DDGStencil.vertices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DDGStencil.weights.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of DDGEvaluator3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexArea(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexAngleDefect(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexNormal(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexMeanCurvature(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexMeanCurvatureVector(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeVertexDivergence(vertexIndex:faceVectorFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeFaceGradient(faceIndex:vertexScalarFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of DDGEvaluator3.computeLaplacianStencil(vertexIndex:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of DDGEvaluator3.isBoundaryVertex(vertexIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of DDGEvaluator3.getVertexOneRing(vertexIndex:outVertices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

ValueMetadata *type metadata accessor for OS_geom_ddg_evaluator_3f.Stencil()
{
  return &type metadata for OS_geom_ddg_evaluator_3f.Stencil;
}

_QWORD *_s7StencilVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void _s7StencilVwxx_0(id *a1)
{

}

uint64_t _s7StencilVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t _s7StencilVwta_0(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t _s7StencilVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_228992B1C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OS_geom_ddg_evaluator_3d.Stencil()
{
  return &type metadata for OS_geom_ddg_evaluator_3d.Stencil;
}

uint64_t BoundedArray2.init(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v10 = type metadata accessor for BoundedArray2(0, a4, a3, a4);
  *(_QWORD *)(a5 + *(int *)(v10 + 32)) = 0;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32);
  v11(a5, a1, a4);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a5 + *(int *)(v10 + 28), a2, a4);
  v13 = *(int *)(v10 + 32);
  v14 = *(_QWORD *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 2)
  {
    *(_QWORD *)(a5 + v13) = a3;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BoundedArray2);
}

uint64_t BoundedArray3.init(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int *v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  unint64_t v16;

  v12 = (int *)type metadata accessor for BoundedArray3(0, a5, a3, a4);
  *(_QWORD *)(a6 + v12[9]) = 0;
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32);
  v13(a6, a1, a5);
  v13(a6 + v12[7], a2, a5);
  result = v13(a6 + v12[8], a3, a5);
  v15 = v12[9];
  v16 = *(_QWORD *)(a6 + v15);
  if ((v16 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v16 <= 3)
  {
    *(_QWORD *)(a6 + v15) = a4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray9.init(_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v22;
  unint64_t v23;

  v19 = (int *)type metadata accessor for BoundedArray9(0, a12, a3, a4);
  *(_QWORD *)(a9 + v19[15]) = 0;
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a12 - 8) + 32);
  v20(a9, a1, a12);
  v20(a9 + v19[7], a2, a12);
  v20(a9 + v19[8], a3, a12);
  v20(a9 + v19[9], a4, a12);
  v20(a9 + v19[10], a5, a12);
  v20(a9 + v19[11], a6, a12);
  v20(a9 + v19[12], a7, a12);
  v20(a9 + v19[13], a8, a12);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v20)(a9 + v19[14], a10, a12);
  v22 = v19[15];
  v23 = *(_QWORD *)(a9 + v22);
  if ((v23 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v23 <= 9)
  {
    *(_QWORD *)(a9 + v22) = a11;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray2.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(int *)(a2 + 32);
  v4 = *(_QWORD *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 2)
  {
    *(_QWORD *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BoundedArray3);
}

uint64_t BoundedArray2.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;

  v9 = type metadata accessor for BoundedArray2(0, a3, a3, a4);
  *(_QWORD *)(a5 + *(int *)(v9 + 32)) = 0;
  v10 = *(_QWORD *)(a3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a5, a1, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5 + *(int *)(v9 + 28), a1, a3);
  v12 = *(int *)(v9 + 32);
  v13 = *(_QWORD *)(a5 + v12);
  if ((v13 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v13 <= 2)
  {
    *(_QWORD *)(a5 + v12) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray2.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 32));
}

uint64_t *(*BoundedArray2.count.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v2 + *(int *)(a2 + 32));
  return sub_228992F68;
}

uint64_t *sub_228992F68(uint64_t *result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result[2];
  v3 = *result;
  v4 = *(int *)(result[1] + 32);
  v5 = *(_QWORD *)(v2 + v4);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 2)
    {
LABEL_7:
      *(_QWORD *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 2)
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray2.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray2.endIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 32));
}

uint64_t BoundedArray2.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_8;
  }
  v10 = *(_QWORD *)&v9[*(int *)(a2 + 32)];
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (a1 == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3 + *(int *)(a2 + 28));
  else
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3);
}

uint64_t BoundedArray2.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(_QWORD *)(v3 + *(int *)(a3 + 32)) <= a2)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  if (a2 == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + *(int *)(a3 + 28), result);
  if (a2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 8))(result);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3, result);
}

void (*BoundedArray2.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray2.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_2289931BC;
}

void sub_2289931BC(uint64_t **a1, char a2)
{
  sub_228995ECC(a1, a2, (void (*)(void *, uint64_t, uint64_t))BoundedArray2.subscript.setter);
}

uint64_t sub_2289931C8()
{
  return sub_2289B2AA4();
}

uint64_t sub_2289931D8()
{
  return sub_2289B2ABC();
}

uint64_t sub_2289931E4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray2.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_2289931EC(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray2.subscript.modify(v6, *a2, a3);
  return sub_228993248;
}

uint64_t sub_22899324C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228996648(a1, a2, a3, a4, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>);
}

uint64_t (*sub_228993258(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  _QWORD *v8;

  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[4] = sub_2289932BC(v8, a2, a3, a4);
  return sub_228993248;
}

void (*sub_2289932BC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v9 = malloc(0x50uLL);
  *a1 = v9;
  v9[1] = a4;
  v9[2] = v4;
  *v9 = a3;
  v10 = sub_2289B2B64();
  v9[3] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[4] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[5] = malloc(v12);
  v13 = (char *)malloc(v12);
  v9[6] = v13;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v14 = sub_2289B2B10();
  v9[7] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v9[8] = v15;
  v9[9] = malloc(*(_QWORD *)(v15 + 64));
  (*(void (**)(void))(v15 + 16))();
  sub_2289938A4(a2, a3, a4, v13);
  return sub_2289933FC;
}

void sub_2289933FC(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, uint64_t);
  uint64_t v10;

  v2 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v3 = *(void **)(*(_QWORD *)a1 + 72);
  v5 = *(void **)(*(_QWORD *)a1 + 48);
  v10 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v6 = *(void **)(*(_QWORD *)a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, _QWORD))(v7 + 16))(v2[5], v5, v2[3]);
    MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4238], v8);
    sub_2289B2B40();
    v9 = *(void (**)(void *, uint64_t))(v7 + 8);
    v9(v6, v8);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v10);
  }
  else
  {
    MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4238], v2[3]);
    sub_2289B2B40();
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v10);
    v9 = *(void (**)(void *, uint64_t))(v7 + 8);
  }
  v9(v5, v8);
  free(v3);
  free(v5);
  free(v6);
  free(v2);
}

uint64_t sub_228993530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a3);
  return sub_2289B2A50();
}

uint64_t sub_2289935A4()
{
  return sub_2289B2A38();
}

uint64_t sub_2289935C4()
{
  return sub_2289B2A2C();
}

uint64_t sub_2289935E4()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return sub_2289B2A98();
}

_QWORD *sub_228993634(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1880]);
}

uint64_t sub_228993648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a3);
  return sub_2289B2AA4();
}

uint64_t sub_2289936AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a4);
  return sub_2289B2A80();
}

uint64_t sub_228993710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a3);
  return sub_2289B2ABC();
}

void sub_228993764(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22899376C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = BoundedArray2.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_228993790(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_2289937EC(v6, *a2, a3);
  return sub_228993248;
}

uint64_t (*sub_2289937EC(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = v8;
  BoundedArray2.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_228993858;
}

uint64_t sub_22899385C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return sub_2289938A4(a1, a2, v6, a3);
}

uint64_t sub_2289938A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t TupleTypeMetadata2;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;

  v54 = a1;
  v55 = a4;
  v6 = *(_QWORD *)(a3 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v15 = (char *)&v46 - v14;
  v47 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v17 = MEMORY[0x24BDAC7A8](v13, v16);
  v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v46 - v21;
  swift_getAssociatedConformanceWitness();
  v51 = sub_2289B2B10();
  v49 = *(_QWORD *)(v51 - 8);
  v24 = MEMORY[0x24BDAC7A8](v51, v23);
  v26 = (char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24, v27);
  v46 = (char *)&v46 - v28;
  sub_2289B2AC8();
  v52 = a2;
  v53 = v4;
  v50 = v6;
  sub_2289B2AEC();
  result = sub_2289B2A20();
  if ((result & 1) != 0)
  {
    v31 = v47;
    v30 = TupleTypeMetadata2;
    v32 = &v15[*(int *)(TupleTypeMetadata2 + 48)];
    v33 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
    v33(v15, v22, AssociatedTypeWitness);
    v33(v32, v19, AssociatedTypeWitness);
    v34 = &v11[*(int *)(v30 + 48)];
    v35 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v35(v11, v15, AssociatedTypeWitness);
    v35(v34, v32, AssociatedTypeWitness);
    v33(v26, v11, AssociatedTypeWitness);
    v36 = *(void (**)(char *, uint64_t))(v31 + 8);
    v36(v34, AssociatedTypeWitness);
    v37 = &v11[*(int *)(v30 + 48)];
    v33(v11, v15, AssociatedTypeWitness);
    v33(v37, v32, AssociatedTypeWitness);
    v38 = v51;
    v33(&v26[*(int *)(v51 + 36)], v37, AssociatedTypeWitness);
    v36(v11, AssociatedTypeWitness);
    v39 = v49;
    v40 = v46;
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v46, v26, v38);
    v42 = v53;
    v41 = v54;
    v43 = v52;
    sub_2289B2AD4();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v38);
    v44 = sub_2289B2B64();
    v45 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(&v55[*(int *)(v44 + 40)], v42, v43);
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v40, v41, v38);
    v33(v45, v40, AssociatedTypeWitness);
    return ((uint64_t (*)(char *, char *, uint64_t))v33)(&v45[*(int *)(v44 + 36)], &v40[*(int *)(v38 + 36)], AssociatedTypeWitness);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_228993C2C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a1);
  return sub_2289B2AB0();
}

void sub_228993C80(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t sub_228993C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228999CE0(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x24BEE1B68], MEMORY[0x24BEE07E0]);
}

uint64_t sub_228993CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228999CE0(a1, a2, a3, a4, MEMORY[0x24BEE08B8], (uint64_t (*)(char *, char *, uint64_t, uint64_t))MEMORY[0x24BEE07F0]);
}

uint64_t sub_228993CDC()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return sub_2289B2A8C();
}

_QWORD *sub_228993D2C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1878]);
}

uint64_t sub_228993D40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_228996BB4(a1, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>, a2);
}

uint64_t sub_228993D4C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>, a1);
  return sub_2289B2AF8();
}

uint64_t sub_228993D80()
{
  return 2;
}

uint64_t sub_228993D88(uint64_t a1, uint64_t a2)
{
  return sub_228996C5C(a1, a2, (uint64_t)&protocol conformance descriptor for BoundedArray2<A>);
}

uint64_t sub_228993D98()
{
  return sub_2289B2A68();
}

uint64_t BoundedArray3.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(int *)(a2 + 36);
  v4 = *(_QWORD *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 3)
  {
    *(_QWORD *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BoundedArray9);
}

uint64_t BoundedArray3.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v9 = (int *)type metadata accessor for BoundedArray3(0, a3, a3, a4);
  *(_QWORD *)(a5 + v9[9]) = 0;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v11(a5, a1, a3);
  v11(a5 + v9[7], a1, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5 + v9[8], a1, a3);
  v13 = v9[9];
  v14 = *(_QWORD *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 3)
  {
    *(_QWORD *)(a5 + v13) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray3.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t *(*BoundedArray3.count.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v2 + *(int *)(a2 + 36));
  return sub_228993ED4;
}

uint64_t *sub_228993ED4(uint64_t *result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result[2];
  v3 = *result;
  v4 = *(int *)(result[1] + 36);
  v5 = *(_QWORD *)(v2 + v4);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 3)
    {
LABEL_7:
      *(_QWORD *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 3)
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray3.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray3.endIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t BoundedArray3.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_11;
  }
  v10 = *(_QWORD *)&v9[*(int *)(a2 + 36)];
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (a1 == 2)
  {
    v12 = *(int *)(a2 + 32);
  }
  else
  {
    if (a1 != 1)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3);
    v12 = *(int *)(a2 + 28);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
}

uint64_t BoundedArray3.subscript.setter(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(_QWORD *)(v3 + *(int *)(a3 + 36)) <= a2)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (a2 == 2)
  {
    v4 = *(int *)(a3 + 32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + v4, result);
  }
  if (a2 == 1)
  {
    v4 = *(int *)(a3 + 28);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + v4, result);
  }
  if (a2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 8))(result);
  else
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3, result);
}

void (*BoundedArray3.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray3.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_228994148;
}

void sub_228994148(uint64_t **a1, char a2)
{
  sub_228995ECC(a1, a2, (void (*)(void *, uint64_t, uint64_t))BoundedArray3.subscript.setter);
}

uint64_t sub_228994154(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray3.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_22899415C(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray3.subscript.modify(v6, *a2, a3);
  return sub_228993248;
}

uint64_t sub_2289941B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228996648(a1, a2, a3, a4, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>);
}

uint64_t sub_2289941C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a3);
  return sub_2289B2A50();
}

uint64_t sub_228994234()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return sub_2289B2A98();
}

_QWORD *sub_228994284(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1880]);
}

uint64_t sub_228994298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a3);
  return sub_2289B2AA4();
}

uint64_t sub_2289942FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a4);
  return sub_2289B2A80();
}

uint64_t sub_228994360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a3);
  return sub_2289B2ABC();
}

uint64_t sub_2289943B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = BoundedArray3.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_2289943D8(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_228994434(v6, *a2, a3);
  return sub_228993248;
}

uint64_t (*sub_228994434(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = v8;
  BoundedArray3.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_228993858;
}

uint64_t sub_2289944A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return sub_2289938A4(a1, a2, v6, a3);
}

uint64_t sub_2289944E8(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a1);
  return sub_2289B2AB0();
}

uint64_t sub_228994538()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return sub_2289B2A8C();
}

_QWORD *sub_228994588(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1878]);
}

uint64_t sub_22899459C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_228996BB4(a1, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>, a2);
}

uint64_t sub_2289945A8(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289945DC(uint64_t a1, uint64_t a2)
{
  return sub_228996C5C(a1, a2, (uint64_t)&protocol conformance descriptor for BoundedArray3<A>);
}

uint64_t BoundedArray4.init(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v17;
  unint64_t v18;

  v14 = (int *)type metadata accessor for BoundedArray4(0, a6, a3, a4);
  *(_QWORD *)(a7 + v14[10]) = 0;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32);
  v15(a7, a1, a6);
  v15(a7 + v14[7], a2, a6);
  v15(a7 + v14[8], a3, a6);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v15)(a7 + v14[9], a4, a6);
  v17 = v14[10];
  v18 = *(_QWORD *)(a7 + v17);
  if ((v18 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v18 <= 4)
  {
    *(_QWORD *)(a7 + v17) = a5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(int *)(a2 + 40);
  v4 = *(_QWORD *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 4)
  {
    *(_QWORD *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v9 = (int *)type metadata accessor for BoundedArray4(0, a3, a3, a4);
  *(_QWORD *)(a5 + v9[10]) = 0;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v11(a5, a1, a3);
  v11(a5 + v9[7], a1, a3);
  v11(a5 + v9[8], a1, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5 + v9[9], a1, a3);
  v13 = v9[10];
  v14 = *(_QWORD *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 4)
  {
    *(_QWORD *)(a5 + v13) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray4.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 40));
}

uint64_t *(*BoundedArray4.count.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v2 + *(int *)(a2 + 40));
  return sub_2289947EC;
}

uint64_t *sub_2289947EC(uint64_t *result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result[2];
  v3 = *result;
  v4 = *(int *)(result[1] + 40);
  v5 = *(_QWORD *)(v2 + v4);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 4)
    {
LABEL_7:
      *(_QWORD *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 4)
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray4.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray4.endIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 40));
}

uint64_t BoundedArray4.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_11;
  }
  v10 = *(_QWORD *)&v9[*(int *)(a2 + 40)];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x228994960);
  }
  switch(a1)
  {
    case 1:
      v12 = *(int *)(a2 + 28);
      goto LABEL_8;
    case 2:
      v12 = *(int *)(a2 + 32);
      goto LABEL_8;
    case 3:
      v12 = *(int *)(a2 + 36);
LABEL_8:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3);
      break;
  }
  return result;
}

uint64_t BoundedArray4.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(_QWORD *)(v3 + *(int *)(a3 + 40)) <= a2)
  {
LABEL_11:
    __break(1u);
    JUMPOUT(0x228994A08);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      v5 = *(int *)(a3 + 28);
      goto LABEL_9;
    case 2:
      v5 = *(int *)(a3 + 32);
      goto LABEL_9;
    case 3:
      v5 = *(int *)(a3 + 36);
LABEL_9:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray4.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray4.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_228994AAC;
}

void sub_228994AAC(uint64_t **a1, char a2)
{
  sub_228995ECC(a1, a2, (void (*)(void *, uint64_t, uint64_t))BoundedArray4.subscript.setter);
}

uint64_t sub_228994AB8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray4.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_228994AC0(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray4.subscript.modify(v6, *a2, a3);
  return sub_228993248;
}

uint64_t sub_228994B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228996648(a1, a2, a3, a4, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>);
}

uint64_t sub_228994B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a3);
  return sub_2289B2A50();
}

uint64_t sub_228994B98()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return sub_2289B2A98();
}

_QWORD *sub_228994BE8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1880]);
}

uint64_t sub_228994BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a3);
  return sub_2289B2AA4();
}

uint64_t sub_228994C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a4);
  return sub_2289B2A80();
}

uint64_t sub_228994CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a3);
  return sub_2289B2ABC();
}

uint64_t sub_228994D18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = BoundedArray4.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_228994D3C(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_228994D98(v6, *a2, a3);
  return sub_228993248;
}

uint64_t (*sub_228994D98(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = v8;
  BoundedArray4.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_228993858;
}

uint64_t sub_228994E04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return sub_2289938A4(a1, a2, v6, a3);
}

uint64_t sub_228994E4C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a1);
  return sub_2289B2AB0();
}

uint64_t sub_228994E9C()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return sub_2289B2A8C();
}

_QWORD *sub_228994EEC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1878]);
}

uint64_t sub_228994F00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_228996BB4(a1, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>, a2);
}

uint64_t sub_228994F0C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>, a1);
  return sub_2289B2AF8();
}

uint64_t sub_228994F40(uint64_t a1, uint64_t a2)
{
  return sub_228996C5C(a1, a2, (uint64_t)&protocol conformance descriptor for BoundedArray4<A>);
}

uint64_t BoundedArray6.init(_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int *v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v20;
  unint64_t v21;

  v17 = (int *)type metadata accessor for BoundedArray6(0, a8, a3, a4);
  *(_QWORD *)(a9 + v17[12]) = 0;
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32);
  v18(a9, a1, a8);
  v18(a9 + v17[7], a2, a8);
  v18(a9 + v17[8], a3, a8);
  v18(a9 + v17[9], a4, a8);
  v18(a9 + v17[10], a5, a8);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v18)(a9 + v17[11], a6, a8);
  v20 = v17[12];
  v21 = *(_QWORD *)(a9 + v20);
  if ((v21 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v21 <= 6)
  {
    *(_QWORD *)(a9 + v20) = a7;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(int *)(a2 + 48);
  v4 = *(_QWORD *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 6)
  {
    *(_QWORD *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v9 = (int *)type metadata accessor for BoundedArray6(0, a3, a3, a4);
  *(_QWORD *)(a5 + v9[12]) = 0;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v11(a5, a1, a3);
  v11(a5 + v9[7], a1, a3);
  v11(a5 + v9[8], a1, a3);
  v11(a5 + v9[9], a1, a3);
  v11(a5 + v9[10], a1, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5 + v9[11], a1, a3);
  v13 = v9[12];
  v14 = *(_QWORD *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 6)
  {
    *(_QWORD *)(a5 + v13) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray6.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 48));
}

uint64_t *(*BoundedArray6.count.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v2 + *(int *)(a2 + 48));
  return sub_2289951B4;
}

uint64_t *sub_2289951B4(uint64_t *result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result[2];
  v3 = *result;
  v4 = *(int *)(result[1] + 48);
  v5 = *(_QWORD *)(v2 + v4);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 6)
    {
LABEL_7:
      *(_QWORD *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 6)
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray6.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray6.endIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 48));
}

uint64_t BoundedArray6.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
    goto LABEL_13;
  }
  v10 = *(_QWORD *)&v9[*(int *)(a2 + 48)];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  if (v10 <= a1)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x228995338);
  }
  switch(a1)
  {
    case 1:
      v12 = *(int *)(a2 + 28);
      goto LABEL_10;
    case 2:
      v12 = *(int *)(a2 + 32);
      goto LABEL_10;
    case 3:
      v12 = *(int *)(a2 + 36);
      goto LABEL_10;
    case 4:
      v12 = *(int *)(a2 + 40);
      goto LABEL_10;
    case 5:
      v12 = *(int *)(a2 + 44);
LABEL_10:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3 + v12);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v3);
      break;
  }
  return result;
}

uint64_t BoundedArray6.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(_QWORD *)(v3 + *(int *)(a3 + 48)) <= a2)
  {
LABEL_13:
    __break(1u);
    JUMPOUT(0x2289953F8);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      v5 = *(int *)(a3 + 28);
      goto LABEL_11;
    case 2:
      v5 = *(int *)(a3 + 32);
      goto LABEL_11;
    case 3:
      v5 = *(int *)(a3 + 36);
      goto LABEL_11;
    case 4:
      v5 = *(int *)(a3 + 40);
      goto LABEL_11;
    case 5:
      v5 = *(int *)(a3 + 44);
LABEL_11:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray6.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray6.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_2289954A4;
}

void sub_2289954A4(uint64_t **a1, char a2)
{
  sub_228995ECC(a1, a2, (void (*)(void *, uint64_t, uint64_t))BoundedArray6.subscript.setter);
}

uint64_t sub_2289954B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray6.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_2289954B8(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray6.subscript.modify(v6, *a2, a3);
  return sub_228993248;
}

uint64_t sub_228995514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228996648(a1, a2, a3, a4, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>);
}

uint64_t sub_228995520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a3);
  return sub_2289B2A50();
}

uint64_t sub_228995590()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return sub_2289B2A98();
}

_QWORD *sub_2289955E0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1880]);
}

uint64_t sub_2289955F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a3);
  return sub_2289B2AA4();
}

uint64_t sub_228995658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a4);
  return sub_2289B2A80();
}

uint64_t sub_2289956BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a3);
  return sub_2289B2ABC();
}

uint64_t sub_228995710@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = BoundedArray6.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_228995734(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_228995790(v6, *a2, a3);
  return sub_228993248;
}

uint64_t (*sub_228995790(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = v8;
  BoundedArray6.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_228993858;
}

uint64_t sub_2289957FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return sub_2289938A4(a1, a2, v6, a3);
}

uint64_t sub_228995844(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a1);
  return sub_2289B2AB0();
}

uint64_t sub_228995894()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return sub_2289B2A8C();
}

_QWORD *sub_2289958E4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1878]);
}

uint64_t sub_2289958F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_228996BB4(a1, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>, a2);
}

uint64_t sub_228995904(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>, a1);
  return sub_2289B2AF8();
}

uint64_t sub_228995938(uint64_t a1, uint64_t a2)
{
  return sub_228996C5C(a1, a2, (uint64_t)&protocol conformance descriptor for BoundedArray6<A>);
}

uint64_t BoundedArray9.count.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(int *)(a2 + 60);
  v4 = *(_QWORD *)(v2 + v3);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 <= 9)
  {
    *(_QWORD *)(v2 + v3) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoundedArray4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BoundedArray4);
}

uint64_t type metadata accessor for BoundedArray6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BoundedArray6);
}

uint64_t BoundedArray9.init(initialValue:count:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v13;
  unint64_t v14;

  v9 = (int *)type metadata accessor for BoundedArray9(0, a3, a3, a4);
  *(_QWORD *)(a5 + v9[15]) = 0;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v11(a5, a1, a3);
  v11(a5 + v9[7], a1, a3);
  v11(a5 + v9[8], a1, a3);
  v11(a5 + v9[9], a1, a3);
  v11(a5 + v9[10], a1, a3);
  v11(a5 + v9[11], a1, a3);
  v11(a5 + v9[12], a1, a3);
  v11(a5 + v9[13], a1, a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5 + v9[14], a1, a3);
  v13 = v9[15];
  v14 = *(_QWORD *)(a5 + v13);
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 <= 9)
  {
    *(_QWORD *)(a5 + v13) = a2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t BoundedArray9.count.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 60));
}

uint64_t *(*BoundedArray9.count.modify(_QWORD *a1, uint64_t a2))(uint64_t *result, char a2)
{
  uint64_t v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v2 + *(int *)(a2 + 60));
  return sub_228995AE4;
}

uint64_t *sub_228995AE4(uint64_t *result, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = result[2];
  v3 = *result;
  v4 = *(int *)(result[1] + 60);
  v5 = *(_QWORD *)(v2 + v4);
  if ((a2 & 1) != 0)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v5 <= 9)
    {
LABEL_7:
      *(_QWORD *)(v2 + v4) = v3;
      return result;
    }
    __break(1u);
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= 9)
    goto LABEL_7;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t BoundedArray9.startIndex.getter()
{
  return 0;
}

uint64_t BoundedArray9.endIndex.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 60));
}

uint64_t BoundedArray9.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a2);
  if (a1 < 0)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a2);
    goto LABEL_16;
  }
  v11 = *(_QWORD *)&v10[*(int *)(a2 + 60)];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, a2);
  if (v11 <= a1)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x228995C84);
  }
  switch(a1)
  {
    case 1:
      v13 = *(int *)(a2 + 28);
      goto LABEL_13;
    case 2:
      v13 = *(int *)(a2 + 32);
      goto LABEL_13;
    case 3:
      v13 = *(int *)(a2 + 36);
      goto LABEL_13;
    case 4:
      v13 = *(int *)(a2 + 40);
      goto LABEL_13;
    case 5:
      v13 = *(int *)(a2 + 44);
      goto LABEL_13;
    case 6:
      v13 = *(int *)(a2 + 48);
      goto LABEL_13;
    case 7:
      v13 = *(int *)(a2 + 52);
      goto LABEL_13;
    case 8:
      v13 = *(int *)(a2 + 56);
LABEL_13:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v4 + v13);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 16))(a3, v4);
      break;
  }
  return result;
}

uint64_t sub_228995CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t), uint64_t (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v8 = *(_QWORD *)(a4 + a3 - 8);
  MEMORY[0x24BDAC7A8](a1, a1);
  v10 = (char *)&v16 - v9;
  v12 = *v11;
  (*(void (**)(char *))(v13 + 16))((char *)&v16 - v9);
  v14 = a5(0, v8);
  return a6(v10, v12, v14);
}

uint64_t BoundedArray9.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (*(_QWORD *)(v3 + *(int *)(a3 + 60)) <= a2)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x228995E08);
  }
  switch(a2)
  {
    case 0:
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3, a1);
    case 1:
      v5 = *(int *)(a3 + 28);
      goto LABEL_14;
    case 2:
      v5 = *(int *)(a3 + 32);
      goto LABEL_14;
    case 3:
      v5 = *(int *)(a3 + 36);
      goto LABEL_14;
    case 4:
      v5 = *(int *)(a3 + 40);
      goto LABEL_14;
    case 5:
      v5 = *(int *)(a3 + 44);
      goto LABEL_14;
    case 6:
      v5 = *(int *)(a3 + 48);
      goto LABEL_14;
    case 7:
      v5 = *(int *)(a3 + 52);
      goto LABEL_14;
    case 8:
      v5 = *(int *)(a3 + 56);
LABEL_14:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))(v3 + v5, a1);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 8))(a1);
      break;
  }
  return result;
}

void (*BoundedArray9.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  void *v11;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  *v7 = a2;
  v7[1] = a3;
  v8 = *(_QWORD *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v11 = malloc(v10);
  v7[6] = v11;
  BoundedArray9.subscript.getter(a2, a3, (uint64_t)v11);
  return sub_228995EC0;
}

void sub_228995EC0(uint64_t **a1, char a2)
{
  sub_228995ECC(a1, a2, (void (*)(void *, uint64_t, uint64_t))BoundedArray9.subscript.setter);
}

void sub_228995ECC(uint64_t **a1, char a2, void (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a1;
  v5 = (void *)(*a1)[5];
  v6 = (void *)(*a1)[6];
  if ((a2 & 1) != 0)
  {
    v7 = v4[3];
    v8 = v4[4];
    v9 = v4[1];
    v10 = *v4;
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))((*a1)[5], v6, v7);
    a3(v5, v10, v9);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3((void *)(*a1)[6], *v4, v4[1]);
  }
  free(v6);
  free(v5);
  free(v4);
}

void sub_228995F7C()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228995F8C()
{
  return sub_228996184(&qword_2559D2A28, MEMORY[0x24BEE1BD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B7AAC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_228995FF4()
{
  unint64_t result;

  result = qword_2559D2A38;
  if (!qword_2559D2A38)
  {
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2559D2A38);
  }
  return result;
}

uint64_t sub_228996038(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_228996080()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996090(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], a1, &v3);
}

uint64_t sub_2289960D8()
{
  return sub_228996184(&qword_2559D2A40, MEMORY[0x24BEE1BA8]);
}

uint64_t sub_2289960FC(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray2<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_228996144()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996154()
{
  return MEMORY[0x24BEE1780];
}

uint64_t sub_228996160()
{
  return sub_228996184(qword_2559D2A48, MEMORY[0x24BEE1BD8]);
}

uint64_t sub_228996184(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D2A30);
    v6 = sub_228995FF4();
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x22E2B7AB8](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2289961F0()
{
  JUMPOUT(0x22E2B7AB8);
}

void sub_228996200()
{
  JUMPOUT(0x22E2B7AB8);
}

void sub_228996210()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996220(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_228996268()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996278(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], a1, &v3);
}

uint64_t sub_2289962C0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray3<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_228996308()
{
  JUMPOUT(0x22E2B7AB8);
}

void sub_228996318()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996328(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_228996370()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996380(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], a1, &v3);
}

uint64_t sub_2289963C8(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray4<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_228996410()
{
  JUMPOUT(0x22E2B7AB8);
}

void sub_228996420()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996430(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_228996478()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996488(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], a1, &v3);
}

uint64_t sub_2289964D0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray6<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], a1, &v3);
}

void sub_228996518()
{
  JUMPOUT(0x22E2B7AB8);
}

void sub_228996528()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996538(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], a1, &v3);
}

void sub_228996580()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996590(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], a1, &v3);
}

uint64_t sub_2289965D8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return BoundedArray9.subscript.setter(a1, *a2, a3);
}

uint64_t (*sub_2289965E0(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = BoundedArray9.subscript.modify(v6, *a2, a3);
  return sub_228993248;
}

uint64_t sub_22899663C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228996648(a1, a2, a3, a4, (uint64_t)"͌x&hR");
}

uint64_t sub_228996648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;

  sub_228999E8C();
  MEMORY[0x22E2B7AB8](a5, a3);
  v8 = sub_2289B2B64();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
}

uint64_t sub_2289966BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>, a3);
  return sub_2289B2A50();
}

uint64_t sub_22899672C(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], a1, &v3);
}

uint64_t sub_228996774()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return sub_2289B2A98();
}

_QWORD *sub_2289967C4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray9<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1880]);
}

uint64_t sub_2289967D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>, a3);
  return sub_2289B2AA4();
}

uint64_t sub_22899683C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>, a4);
  return sub_2289B2A80();
}

uint64_t sub_2289968A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>, a3);
  return sub_2289B2ABC();
}

void sub_2289968F4()
{
  JUMPOUT(0x22E2B7AB8);
}

uint64_t sub_228996904@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = BoundedArray9.endIndex.getter(a1);
  *a2 = result;
  return result;
}

uint64_t (*sub_228996928(_QWORD *a1, uint64_t *a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_2289969B0(v6, *a2, a3);
  return sub_228993248;
}

void sub_228996984(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_2289969B0(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  *a1 = v6;
  a1[1] = v7;
  v8 = malloc(*(_QWORD *)(v7 + 64));
  a1[2] = v8;
  BoundedArray9.subscript.getter(a2, a3, (uint64_t)v8);
  return sub_228993858;
}

void sub_228996A1C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)a1[2];
  (*(void (**)(void *, _QWORD))(a1[1] + 8))(v1, *a1);
  free(v1);
}

uint64_t sub_228996A4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;

  v6 = MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return sub_2289938A4(a1, a2, v6, a3);
}

uint64_t sub_228996A94(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>, a1);
  return sub_2289B2AB0();
}

uint64_t sub_228996AE4()
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for BoundedArray9<A>);
  return sub_2289B2A8C();
}

_QWORD *sub_228996B34(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_228996B48(a1, a2, a3, (uint64_t)&protocol conformance descriptor for BoundedArray9<A>, (_QWORD *(*)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))MEMORY[0x24BEE1878]);
}

_QWORD *sub_228996B48(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *(*a5)(uint64_t *__return_ptr, _QWORD *, uint64_t, uint64_t, _QWORD))
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;

  v8 = MEMORY[0x22E2B7AB8](a4);
  result = a5(&v10, a1, a2, v8, MEMORY[0x24BEE17A8]);
  *a1 = v10;
  return result;
}

uint64_t sub_228996BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_228996BB4(a1, (uint64_t)"͌x&hR", a2);
}

uint64_t sub_228996BB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;

  v6 = v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(a3, v6, a1);
  MEMORY[0x22E2B7AB8](a2, a1);
  result = sub_2289B2B34();
  *(_QWORD *)(a3 + *(int *)(result + 36)) = 0;
  return result;
}

uint64_t sub_228996C1C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8]("͌x&hR", a1);
  return sub_2289B2AF8();
}

uint64_t sub_228996C50(uint64_t a1, uint64_t a2)
{
  return sub_228996C5C(a1, a2, (uint64_t)"͌x&hR");
}

uint64_t sub_228996C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = MEMORY[0x22E2B7AB8](a3, a1);
  v6 = sub_228999F04(v3, a1, v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v3, a1);
  return v6;
}

uint64_t sub_228996CB8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray2, BoundedArray2.count.getter, a3);
}

uint64_t sub_228996CCC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray2, BoundedArray2.count.setter);
}

uint64_t sub_228996CE0()
{
  return 8;
}

_QWORD *sub_228996CEC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_228996CF8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray2, (uint64_t (*)(uint64_t, uint64_t))BoundedArray2.subscript.getter);
}

uint64_t sub_228996D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228995CA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for BoundedArray2, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray2.subscript.setter);
}

uint64_t sub_228996D30()
{
  return 8;
}

uint64_t sub_228996D3C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray3, BoundedArray3.count.getter, a3);
}

uint64_t sub_228996D50(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray3, BoundedArray3.count.setter);
}

uint64_t sub_228996D64()
{
  return 8;
}

uint64_t sub_228996D70(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray3, (uint64_t (*)(uint64_t, uint64_t))BoundedArray3.subscript.getter);
}

uint64_t sub_228996D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228995CA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for BoundedArray3, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray3.subscript.setter);
}

uint64_t sub_228996DA8()
{
  return 8;
}

uint64_t sub_228996DB4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray4, BoundedArray4.count.getter, a3);
}

uint64_t sub_228996DC8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray4, BoundedArray4.count.setter);
}

uint64_t sub_228996DDC()
{
  return 8;
}

uint64_t sub_228996DE8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray4, (uint64_t (*)(uint64_t, uint64_t))BoundedArray4.subscript.getter);
}

uint64_t sub_228996DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228995CA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for BoundedArray4, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray4.subscript.setter);
}

uint64_t sub_228996E20()
{
  return 8;
}

uint64_t sub_228996E2C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray6, BoundedArray6.count.getter, a3);
}

uint64_t sub_228996E40(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray6, BoundedArray6.count.setter);
}

uint64_t sub_228996E54()
{
  return 8;
}

uint64_t sub_228996E60(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray6, (uint64_t (*)(uint64_t, uint64_t))BoundedArray6.subscript.getter);
}

uint64_t sub_228996E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228995CA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for BoundedArray6, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray6.subscript.setter);
}

uint64_t sub_228996E98()
{
  return 8;
}

uint64_t sub_228996EA4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  return keypath_getTm(a1, a2, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray9, BoundedArray9.count.getter, a3);
}

uint64_t keypath_getTm@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t (*a3)(_QWORD, _QWORD)@<X3>, uint64_t (*a4)(uint64_t)@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t result;

  v7 = a3(0, *(_QWORD *)(a2 + a1 - 8));
  result = a4(v7);
  *a5 = result;
  return result;
}

uint64_t sub_228996EFC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray9, BoundedArray9.count.setter);
}

uint64_t keypath_setTm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD), uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;

  v7 = *a1;
  v8 = a5(0, *(_QWORD *)(a4 + a3 - 8));
  return a6(v7, v8);
}

uint64_t sub_228996F58()
{
  return 8;
}

uint64_t sub_228996F64(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return keypath_get_1Tm(a1, a2, a3, (uint64_t (*)(_QWORD, _QWORD))type metadata accessor for BoundedArray9, (uint64_t (*)(uint64_t, uint64_t))BoundedArray9.subscript.getter);
}

uint64_t keypath_get_1Tm(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, _QWORD), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a2;
  v7 = a4(0, *(uint64_t *)((char *)a2 + a3 - 8));
  return a5(v6, v7);
}

uint64_t sub_228996FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_228995CA8(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t))type metadata accessor for BoundedArray9, (uint64_t (*)(char *, uint64_t, uint64_t))BoundedArray9.subscript.setter);
}

uint64_t sub_228996FF0()
{
  return 8;
}

uint64_t sub_228996FFC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_228997004()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_228997080(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    *(_QWORD *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v10 + v17) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_228997170(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)(unint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = *(uint64_t (**)(unint64_t, uint64_t))(v4 + 8);
  v6(a1, v3);
  return v6((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);
}

uint64_t sub_2289971D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2289972F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a1) & ~v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_QWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997418(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64)
         + ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
         + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_228997498 + 4 * byte_2289C4378[v8]))();
}

void sub_2289974F0(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64)+ ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_2289975E8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_2289975F0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x2289975F8);
}

void sub_228997614()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_22899761C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_228997624(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x22899762CLL);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_228997644()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2289976C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;
  unint64_t v18;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    *(_QWORD *)((v10 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v10 + v18) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_2289977D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v10(v8, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)((v7 + v8) & ~v6, v3);
}

uint64_t sub_228997858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(_QWORD *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(_QWORD *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2289979C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(_QWORD *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v10, v5);
  v11 = (v8 + v9 + v10) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v11, v5);
  *(_QWORD *)((v8 + 7 + ((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228997B38(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  if (((((*(_QWORD *)(v4 + 64)
         + ((*(_QWORD *)(v4 + 64)
           + *(unsigned __int8 *)(v4 + 80)
           + ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
         + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v6 = 2;
  else
    v6 = a2 - v5 + 1;
  if (v6 >= 0x10000)
    v7 = 4;
  else
    v7 = 2;
  if (v6 < 0x100)
    v7 = 1;
  if (v6 >= 2)
    v8 = v7;
  else
    v8 = 0;
  return ((uint64_t (*)(void))((char *)&loc_228997BC0 + 4 * byte_2289C4387[v8]))();
}

void sub_228997C18(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v8 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + *(unsigned __int8 *)(v6 + 80)
           + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v6 + 80))
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = v8 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64)
         + *(unsigned __int8 *)(v6 + 80)
         + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64)+ ((*(_QWORD *)(v6 + 64)+ *(unsigned __int8 *)(v6 + 80)+ ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_228997D18()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_228997D20(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x228997D28);
}

void sub_228997D44()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_228997D4C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_228997D54(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x228997D5CLL);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_228997D74()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_228997D7C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_228997DFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    *(_QWORD *)((v10 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v10 + v19) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_228997F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v11(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v11(v8, v3);
  v9 = (v7 + v8) & ~v6;
  v11(v9, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)((v7 + v9) & ~v6, v3);
}

uint64_t sub_228997FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2289980AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228998184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22899825C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228998334(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  v6 = *(unsigned __int8 *)(v4 + 80);
  if (((((*(_QWORD *)(v4 + 64)
         + ((*(_QWORD *)(v4 + 64) + v6 + ((*(_QWORD *)(v4 + 64) + v6 + ((*(_QWORD *)(v4 + 64) + v6) & ~v6)) & ~v6)) & ~v6)
         + 7) & 0xFFFFFFFFFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v7 = 2;
  else
    v7 = a2 - v5 + 1;
  if (v7 >= 0x10000)
    v8 = 4;
  else
    v8 = 2;
  if (v7 < 0x100)
    v8 = 1;
  if (v7 >= 2)
    v9 = v8;
  else
    v9 = 0;
  return ((uint64_t (*)(void))((char *)&loc_2289983C4 + 4 * byte_2289C4396[v9]))();
}

void sub_22899841C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 >= a3)
  {
    v12 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v9 = a3 - v7;
    if (((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + (_DWORD)v8
           + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8 + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & ~(_DWORD)v8)) & ~(_DWORD)v8)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((*(_DWORD *)(v6 + 64)
       + ((*(_DWORD *)(v6 + 64)
         + (_DWORD)v8
         + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8 + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & ~(_DWORD)v8)) & ~(_DWORD)v8)
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v13 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v6 + 64)+ ((*(_QWORD *)(v6 + 64) + v8 + ((*(_QWORD *)(v6 + 64) + v8 + ((*(_QWORD *)(v6 + 64) + v8) & ~v8)) & ~v8)) & ~v8)+ 7) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v13;
  }
  __asm { BR              X10 }
}

void sub_228998524()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_22899852C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x228998534);
}

void sub_228998550()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_228998558()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_228998560(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x228998568);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_228998580()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_228998588()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22899860C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    v20 = (v9 + v19) & v15;
    v16((uint64_t *)((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15), (uint64_t *)v20, v5);
    v21 = (v9 + v20) & v15;
    v16((uint64_t *)((v9 + ((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15)) & v15), (uint64_t *)v21, v5);
    *(_QWORD *)((v10 + ((v9 + ((v9 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v10 + v21) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_22899879C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v13)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v13 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v13(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v13(v8, v3);
  v9 = (v7 + v8) & ~v6;
  v13(v9, v3);
  v10 = (v7 + v9) & ~v6;
  v13(v10, v3);
  v11 = (v7 + v10) & ~v6;
  v13(v11, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v13)((v7 + v11) & ~v6, v3);
}

uint64_t sub_228998864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22899897C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228998A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228998BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  *(_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228998CC4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(v4 + 80);
  if ((((((_DWORD)v6
         + (((_DWORD)v6
           + v7
           + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)
         + 7) & 0xFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v8 = 2;
  else
    v8 = a2 - v5 + 1;
  if (v8 >= 0x10000)
    v9 = 4;
  else
    v9 = 2;
  if (v8 < 0x100)
    v9 = 1;
  if (v8 >= 2)
    v10 = v9;
  else
    v10 = 0;
  return ((uint64_t (*)(void))((char *)&loc_228998D64 + 4 * byte_2289C43A5[v10]))();
}

void sub_228998DBC(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = ((v8 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v7 >= a3)
  {
    v14 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v11 = a3 - v7;
    if ((((_DWORD)v8
         + (((_DWORD)v8
           + (_DWORD)v9
           + (((_DWORD)v8
             + (_DWORD)v9
             + (((_DWORD)v8
               + (_DWORD)v9
               + (((_DWORD)v8 + (_DWORD)v9 + (((_DWORD)v8 + (_DWORD)v9) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v12 = v11 + 1;
    else
      v12 = 2;
    if (v12 >= 0x10000)
      v13 = 4;
    else
      v13 = 2;
    if (v12 < 0x100)
      v13 = 1;
    if (v12 >= 2)
      v14 = v13;
    else
      v14 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if ((_DWORD)v10)
  {
    v15 = ~v7 + a2;
    bzero(a1, v10);
    *a1 = v15;
  }
  __asm { BR              X10 }
}

void sub_228998ED4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_228998EDC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x228998EE4);
}

void sub_228998F00()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_228998F08()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_228998F10(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x228998F18);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_228998F30()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_228998F38()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_228998FC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  v8 = v7 <= 7 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0;
  if (v8
    && (v9 = *(_QWORD *)(v6 + 64),
        v10 = v9 + v7,
        v11 = v9 + 7,
        ((v9
        + 7
        + ((v9
          + v7
          + ((v9
            + v7
            + ((v9
              + v7
              + ((v9 + v7 + ((v9 + v7 + ((v9 + v7 + ((v9 + v7 + ((v9 + v7) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & 0xFFFFFFFFFFFFFFF8)
      + 8 <= 0x18))
  {
    v12 = ~v7;
    v13 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v13(a1, a2, *(_QWORD *)(a3 + 16));
    v14 = ((unint64_t)a2 + v10) & v12;
    v13((uint64_t *)(((unint64_t)v4 + v10) & v12), (uint64_t *)v14, v5);
    v15 = (v10 + v14) & v12;
    v13((uint64_t *)((v10 + (((unint64_t)v4 + v10) & v12)) & v12), (uint64_t *)v15, v5);
    v16 = (v10 + v15) & v12;
    v13((uint64_t *)((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12), (uint64_t *)v16, v5);
    v17 = (v10 + v16) & v12;
    v13((uint64_t *)((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12), (uint64_t *)v17, v5);
    v18 = (v10 + v17) & v12;
    v13((uint64_t *)((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v18, v5);
    v19 = (v10 + v18) & v12;
    v13((uint64_t *)((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v19, v5);
    v20 = (v10 + v19) & v12;
    v13((uint64_t *)((v10+ ((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v20, v5);
    v21 = (v10 + v20) & v12;
    v13((uint64_t *)((v10+ ((v10+ ((v10+ ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12), (uint64_t *)v21, v5);
    *(_QWORD *)((v11
               + ((v10
                 + ((v10
                   + ((v10
                     + ((v10 + ((v10 + ((v10 + ((v10 + (((unint64_t)v4 + v10) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & v12)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v11 + v21) & 0xFFFFFFFFFFFFF8);
  }
  else
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v22 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  return v4;
}

uint64_t sub_2289991CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v16)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v16 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v16(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v16(v8, v3);
  v9 = (v7 + v8) & ~v6;
  v16(v9, v3);
  v10 = (v7 + v9) & ~v6;
  v16(v10, v3);
  v11 = (v7 + v10) & ~v6;
  v16(v11, v3);
  v12 = (v7 + v11) & ~v6;
  v16(v12, v3);
  v13 = (v7 + v12) & ~v6;
  v16(v13, v3);
  v14 = (v7 + v13) & ~v6;
  v16(v14, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v16)((v7 + v14) & ~v6, v3);
}

uint64_t sub_2289992DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(_QWORD *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228999454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(_QWORD *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2289995CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(_QWORD *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_228999744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (v8 + v9 + v13) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9, v14, v5);
  v15 = (v8 + v9 + v14) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v15, v5);
  v16 = (v8 + v9 + v15) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v16, v5);
  v17 = (v8 + v9 + v16) & ~v9;
  v7((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v17, v5);
  v18 = (v8 + v9 + v17) & ~v9;
  v7((v10+ ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9, v18, v5);
  *(_QWORD *)((v8
             + 7
             + ((v10
               + ((v10
                 + ((v10 + ((v10 + ((v10 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v8 + 7 + v18) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2289998BC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(v4 + 80);
  if ((((((_DWORD)v6
         + (((_DWORD)v6
           + v7
           + (((_DWORD)v6
             + v7
             + (((_DWORD)v6
               + v7
               + (((_DWORD)v6
                 + v7
                 + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7 + (((_DWORD)v6 + v7) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)) & ~v7)
         + 7) & 0xFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v8 = 2;
  else
    v8 = a2 - v5 + 1;
  if (v8 >= 0x10000)
    v9 = 4;
  else
    v9 = 2;
  if (v8 < 0x100)
    v9 = 1;
  if (v8 >= 2)
    v10 = v9;
  else
    v10 = 0;
  return ((uint64_t (*)(void))((char *)&loc_228999974 + 4 * byte_2289C43B4[v10]))();
}

void sub_2289999CC(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = ((v8
        + ((v8
          + v9
          + ((v8
            + v9
            + ((v8
              + v9
              + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9 + ((v8 + v9) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)) & ~v9)
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v7 >= a3)
  {
    v14 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v11 = a3 - v7;
    if ((((_DWORD)v8
         + (((_DWORD)v8
           + (_DWORD)v9
           + (((_DWORD)v8
             + (_DWORD)v9
             + (((_DWORD)v8
               + (_DWORD)v9
               + (((_DWORD)v8
                 + (_DWORD)v9
                 + (((_DWORD)v8
                   + (_DWORD)v9
                   + (((_DWORD)v8
                     + (_DWORD)v9
                     + (((_DWORD)v8 + (_DWORD)v9 + (((_DWORD)v8 + (_DWORD)v9) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)) & ~(_DWORD)v9)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v12 = v11 + 1;
    else
      v12 = 2;
    if (v12 >= 0x10000)
      v13 = 4;
    else
      v13 = 2;
    if (v12 < 0x100)
      v13 = 1;
    if (v12 >= 2)
      v14 = v13;
    else
      v14 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if ((_DWORD)v10)
  {
    v15 = ~v7 + a2;
    bzero(a1, v10);
    *a1 = v15;
  }
  __asm { BR              X10 }
}

void sub_228999AFC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_228999B04(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x228999B0CLL);
}

void sub_228999B28()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_228999B30()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_228999B38(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x228999B40);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t sub_228999B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t result;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v4 = sub_2289B2B10();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v19 - v11;
  v13 = sub_2289B2A20();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, a1, v4);
  v14(v9, a2, v4);
  if ((v13 & 1) == 0)
  {
    v18 = *(void (**)(char *, uint64_t))(v5 + 8);
    v18(v9, v4);
    result = ((uint64_t (*)(char *, uint64_t))v18)(v12, v4);
    goto LABEL_5;
  }
  v15 = sub_2289B2A20();
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v9, v4);
  result = ((uint64_t (*)(char *, uint64_t))v16)(v12, v4);
  if ((v15 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_228999CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t (*v25)(char *, char *, uint64_t, uint64_t);

  v25 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v24 - v15;
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v14, v18);
  v20 = (char *)&v24 - v19;
  v21 = sub_2289B2A20();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, a2, v11);
  if ((v21 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, AssociatedTypeWitness);
    goto LABEL_5;
  }
  v22 = v25(v20, &v16[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, AssociatedTypeWitness);
  if ((v22 & 1) == 0)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_228999E8C()
{
  uint64_t v0;

  v0 = sub_2289B2B64();
  MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4238], v0);
  return sub_2289B2B40();
}

Swift::Void __swiftcall simplifyTriangleMesh(vertexPositions:triangleVertexIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::Int targetTriangleCount, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_simplify_triangle_mesh_opt_3f_optional options)
{
  sub_228999F94((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, targetTriangleCount, outVertexPositions, outTriangleVertexIndices, (uint64_t)options.value.super.isa, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t))geom_simplify_triangle_mesh_with_options_3f, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD))geom_simplify_triangle_mesh_with_default_options_3f);
}

Swift::Void __swiftcall simplifyTriangleMesh(vertexPositions:triangleVertexIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::Int targetTriangleCount, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_simplify_triangle_mesh_opt_3d_optional options)
{
  sub_228999F94((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, targetTriangleCount, outVertexPositions, outTriangleVertexIndices, (uint64_t)options.value.super.isa, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t))geom_simplify_triangle_mesh_with_options_3d, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD))geom_simplify_triangle_mesh_with_default_options_3d);
}

uint64_t sub_228999F94(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4, _QWORD *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD, uint64_t), uint64_t (*a8)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, _QWORD, _QWORD))
{
  uint64_t result;
  unint64_t v11;

  result = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a2 + 16) / 3uLL;
  if (a6)
  {
    if ((a3 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (!HIDWORD(a3))
    {
      return a7(result, a1 + 32, v11, a2 + 32, a3, *a4, *a5, a6);
    }
    __break(1u);
    goto LABEL_10;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!HIDWORD(a3))
    return a8(result, a1 + 32, v11, a2 + 32, a3, *a4, *a5);
LABEL_11:
  __break(1u);
  return result;
}

Swift::Void __swiftcall simplifyTriangleMeshWithUVs(vertexPositions:triangleVertexIndices:uvValues:trianglesWithUVs:triangleUVIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, Swift::Int targetTriangleCount, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_collection_2f *outUVValues, OS_geom_collection_u *outTrianglesWithUVs, OS_geom_collection_u *outTriangleUVIndices)
{
  sub_22899A08C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, targetTriangleCount, outVertexPositions, outTriangleVertexIndices, outUVValues, outTrianglesWithUVs, outTriangleUVIndices, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _DWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))geom_simplify_triangle_mesh_with_uvs_3f);
}

Swift::Void __swiftcall simplifyTriangleMeshWithUVs(vertexPositions:triangleVertexIndices:uvValues:trianglesWithUVs:triangleUVIndices:targetTriangleCount:outVertexPositions:outTriangleVertexIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, Swift::Int targetTriangleCount, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_collection_2f *outUVValues, OS_geom_collection_u *outTrianglesWithUVs, OS_geom_collection_u *outTriangleUVIndices)
{
  sub_22899A08C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, targetTriangleCount, outVertexPositions, outTriangleVertexIndices, outUVValues, outTrianglesWithUVs, outTriangleUVIndices, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _DWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))geom_simplify_triangle_mesh_with_uvs_3d);
}

uint64_t sub_22899A08C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11, uint64_t (*a12)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _DWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  if ((a6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a6))
  {
    return a12(*(_QWORD *)(result + 16), result + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, *(_QWORD *)(a3 + 16), a3 + 32, *(_QWORD *)(a4 + 16), a4 + 32, a5 + 32, a6, *a7, *a8, *a9, *a10, *a11);
  }
  __break(1u);
  return result;
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.getter()
{
  return sub_22899A928(geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_22899B5C8);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_22899A670(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

void (*OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  const void *fixed_vertex_indices_data_3f;
  uint64_t fixed_vertex_indices_count_3f;
  _QWORD *v6;
  uint64_t v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  fixed_vertex_indices_data_3f = (const void *)geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f(v1);
  fixed_vertex_indices_count_3f = geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f(v1);
  v6 = sub_22899B5C8(fixed_vertex_indices_data_3f, fixed_vertex_indices_count_3f);
  v7 = (2 * v6[2]) | 1;
  *v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_22899A1E8;
}

void sub_22899A1E8(uint64_t a1, char a2)
{
  sub_22899A738(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

id OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.getter()
{
  uint64_t v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v0);
}

void OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.setter(void *a1)
{
  uint64_t v1;

  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(v1, (uint64_t)a1);

}

void (*OS_geom_simplify_triangle_mesh_opt_3f.outNewToOldVertexMap.modify(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v1);
  return sub_22899A27C;
}

void sub_22899A27C(uint64_t a1, uint64_t a2)
{
  sub_22899A874(a1, a2, (void (*)(_QWORD))geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.getter()
{
  uint64_t v0;

  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.setter(char a1)
{
  uint64_t v1;

  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(v1, a1 & 1);
}

uint64_t (*OS_geom_simplify_triangle_mesh_opt_3f.preserveUVBoundaries.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v1);
  return sub_22899A2E4;
}

uint64_t sub_22899A2E4(uint64_t a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.uvValues.getter()
{
  return sub_22899A928(geom_simplify_triangle_mesh_opt_get_uv_value_data_3f, geom_simplify_triangle_mesh_opt_get_uv_value_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_22899B668);
}

_QWORD *OS_geom_simplify_triangle_mesh_opt_3f.trianglesWithUVs.getter()
{
  return sub_22899A99C(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3f.triangleUVIndices.getter()
{
  return sub_22899AA08(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3f.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AA80((uint64_t)uvValues._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3f);
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3f.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AAC4((uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTrianglesWithUVs.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

uint64_t sub_22899A350(uint64_t a1, uint64_t a2)
{
  return sub_22899ACC8(a1, a2, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_22899B5C8);
}

uint64_t sub_22899A36C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AB3C(a1, a2, a3, a4, a5, a6, (void (*)(_QWORD, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

uint64_t (*sub_22899A378(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_simplify_triangle_mesh_opt_3f.fixedVertexIndices.modify(v2);
  return sub_228993248;
}

id sub_22899A3C0()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(*v0);
}

void sub_22899A3DC(void *a1)
{
  uint64_t *v1;

  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(*v1, (uint64_t)a1);

}

void (*sub_22899A408(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(v3);
  return sub_22899A27C;
}

uint64_t sub_22899A448()
{
  uint64_t *v0;

  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(*v0);
}

uint64_t sub_22899A460(char a1)
{
  uint64_t *v1;

  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*v1, a1 & 1);
}

uint64_t (*sub_22899A470(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(v3);
  return sub_22899A2E4;
}

uint64_t sub_22899A4A8(uint64_t a1, uint64_t a2)
{
  return sub_22899ACC8(a1, a2, geom_simplify_triangle_mesh_opt_get_uv_value_data_3f, geom_simplify_triangle_mesh_opt_get_uv_value_count_3f, (uint64_t (*)(uint64_t, uint64_t))sub_22899B668);
}

_QWORD *sub_22899A4C4(uint64_t a1, uint64_t a2)
{
  return sub_22899AD3C(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t sub_22899A4D8(uint64_t a1, uint64_t a2)
{
  return sub_22899ADA8(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

id sub_22899A4EC()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_uv_value_collection_3f(*v0);
}

id sub_22899A508()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3f(*v0);
}

id sub_22899A524()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3f(*v0);
}

uint64_t sub_22899A540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AE74(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3f);
}

uint64_t sub_22899A54C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22899AEDC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

_QWORD *sub_22899A574()
{
  _QWORD **v0;

  return geom_simplify_triangle_mesh_opt_clear_uvs_3f(*v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.getter()
{
  return sub_22899A928(geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_22899B5C8);
}

_QWORD *sub_22899A598@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;

  v6 = *a1;
  v7 = (const void *)a2(*a1);
  v8 = a3(v6);
  result = sub_22899B5C8(v7, v8);
  v10 = (2 * result[2]) | 1;
  *a4 = result;
  a4[1] = result + 4;
  a4[2] = 0;
  a4[3] = v10;
  return result;
}

_QWORD *sub_22899A5FC(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v5 = result[2];
  v6 = result[3] >> 1;
  v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
  }
  else
  {
    v9 = result[1] + 4 * v5;
    v10 = *a2;
    swift_unknownObjectRetain();
    a5(v10, v7, v9);
    return (_QWORD *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_22899A670(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

uint64_t sub_22899A670(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t, unint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t result;

  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a5(v5, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  const void *fixed_vertex_indices_data_3d;
  uint64_t fixed_vertex_indices_count_3d;
  _QWORD *v6;
  uint64_t v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  fixed_vertex_indices_data_3d = (const void *)geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d(v1);
  fixed_vertex_indices_count_3d = geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d(v1);
  v6 = sub_22899B5C8(fixed_vertex_indices_data_3d, fixed_vertex_indices_count_3d);
  v7 = (2 * v6[2]) | 1;
  *v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_22899A72C;
}

void sub_22899A72C(uint64_t a1, char a2)
{
  sub_22899A738(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

void sub_22899A738(uint64_t a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 24) >> 1;
  v7 = v6 - v5;
  v8 = __OFSUB__(v6, v5);
  if ((a2 & 1) != 0)
  {
    if (!v8)
    {
      v9 = v4[4];
      v10 = v4[1] + 4 * v5;
      swift_unknownObjectRetain();
      a3(v9, v7, v10);
      swift_unknownObjectRelease();
LABEL_9:
      swift_unknownObjectRelease();
      free(v4);
      return;
    }
    __break(1u);
  }
  else if (!v8)
  {
    a3(v4[4], v7, v4[1] + 4 * v5);
    goto LABEL_9;
  }
  __break(1u);
}

id OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.getter()
{
  uint64_t v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v0);
}

void OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.setter(void *a1)
{
  uint64_t v1;

  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(v1, (uint64_t)a1);

}

void (*OS_geom_simplify_triangle_mesh_opt_3d.outNewToOldVertexMap.modify(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v1);
  return sub_22899A868;
}

void sub_22899A868(uint64_t a1, uint64_t a2)
{
  sub_22899A874(a1, a2, (void (*)(_QWORD))geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d);
}

void sub_22899A874(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  id v3;

  v3 = *(id *)a1;
  a3(*(_QWORD *)(a1 + 8));

}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.getter()
{
  uint64_t v0;

  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v0);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.setter(char a1)
{
  uint64_t v1;

  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(v1, a1 & 1);
}

uint64_t (*OS_geom_simplify_triangle_mesh_opt_3d.preserveUVBoundaries.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v1);
  return sub_22899A8FC;
}

uint64_t sub_22899A8FC(uint64_t a1)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.uvValues.getter()
{
  return sub_22899A928(geom_simplify_triangle_mesh_opt_get_uv_value_data_3d, geom_simplify_triangle_mesh_opt_get_uv_value_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_22899B668);
}

uint64_t sub_22899A928(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = a1(v3);
  v7 = a2(v3);
  return a3(v6, v7);
}

_QWORD *OS_geom_simplify_triangle_mesh_opt_3d.trianglesWithUVs.getter()
{
  return sub_22899A99C(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

_QWORD *sub_22899A99C(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  const void *v5;

  v4 = a1(v2);
  v5 = (const void *)a2(v2);
  return sub_22899B5C8(v5, v4);
}

uint64_t OS_geom_simplify_triangle_mesh_opt_3d.triangleUVIndices.getter()
{
  return sub_22899AA08(geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_22899AA08(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  const void *v6;

  result = a1(v2);
  v5 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    v6 = (const void *)a2(v2);
    return (uint64_t)sub_22899B5C8(v6, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3d.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AA80((uint64_t)uvValues._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3d);
}

uint64_t sub_22899AA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  return a5(v5, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

Swift::Void __swiftcall OS_geom_simplify_triangle_mesh_opt_3d.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AAC4((uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTrianglesWithUVs.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

uint64_t sub_22899AAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;

  return a7(v7, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

uint64_t sub_22899AB14(uint64_t a1, uint64_t a2)
{
  return sub_22899ACC8(a1, a2, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_22899B5C8);
}

uint64_t sub_22899AB30(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AB3C(a1, a2, a3, a4, a5, a6, (void (*)(_QWORD, unint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

uint64_t sub_22899AB3C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(_QWORD, unint64_t, uint64_t))
{
  _QWORD *v7;
  uint64_t result;

  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a7(*v7, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_22899AB7C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_simplify_triangle_mesh_opt_3d.fixedVertexIndices.modify(v2);
  return sub_228993248;
}

id sub_22899ABC4()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(*v0);
}

void sub_22899ABE0(void *a1)
{
  uint64_t *v1;

  geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(*v1, (uint64_t)a1);

}

void (*sub_22899AC0C(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(v3);
  return sub_22899A868;
}

uint64_t sub_22899AC4C()
{
  uint64_t *v0;

  return geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(*v0);
}

uint64_t sub_22899AC64(char a1)
{
  uint64_t *v1;

  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*v1, a1 & 1);
}

uint64_t (*sub_22899AC74(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(v3);
  return sub_22899A8FC;
}

uint64_t sub_22899ACAC(uint64_t a1, uint64_t a2)
{
  return sub_22899ACC8(a1, a2, geom_simplify_triangle_mesh_opt_get_uv_value_data_3d, geom_simplify_triangle_mesh_opt_get_uv_value_count_3d, (uint64_t (*)(uint64_t, uint64_t))sub_22899B668);
}

uint64_t sub_22899ACC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = *v5;
  v9 = a3(v8);
  v10 = a4(v8);
  return a5(v9, v10);
}

_QWORD *sub_22899AD28(uint64_t a1, uint64_t a2)
{
  return sub_22899AD3C(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

_QWORD *sub_22899AD3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  v6 = *v4;
  v7 = a3(v6);
  v8 = (const void *)a4(v6);
  return sub_22899B5C8(v8, v7);
}

uint64_t sub_22899AD94(uint64_t a1, uint64_t a2)
{
  return sub_22899ADA8(a1, a2, geom_simplify_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_simplify_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

uint64_t sub_22899ADA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  const void *v9;

  v6 = *v4;
  result = a3(v6);
  v8 = 3 * result;
  if ((unsigned __int128)(result * (__int128)3) >> 64 == (3 * result) >> 63)
  {
    v9 = (const void *)a4(v6);
    return (uint64_t)sub_22899B5C8(v9, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_22899AE14()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_uv_value_collection_3d(*v0);
}

id sub_22899AE30()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3d(*v0);
}

id sub_22899AE4C()
{
  uint64_t *v0;

  return (id)geom_simplify_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3d(*v0);
}

uint64_t sub_22899AE68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AE74(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_3d);
}

uint64_t sub_22899AE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v7;

  return a7(*v7, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3, a4);
}

uint64_t sub_22899AEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22899AEDC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

uint64_t sub_22899AEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v9;

  return a9(*v9, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32, a3 + 32, a4, a5, a6);
}

_QWORD *sub_22899AF18()
{
  _QWORD **v0;

  return geom_simplify_triangle_mesh_opt_clear_uvs_3d(*v0);
}

void sub_22899AF20(void *a1)
{
  sub_22899B0A0(a1, (uint64_t (*)(void))geom_collection_size_d, &qword_2559D2E50, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A3FE8);
}

void sub_22899AF3C(void *a1)
{
  sub_22899AF90(a1, (uint64_t (*)(void))geom_collection_size_f, &qword_2559D2E58, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A3FEC);
}

void sub_22899AF58(void *a1)
{
  sub_22899AF90(a1, (uint64_t (*)(void))geom_collection_size_i, &qword_2559D2E38, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A3FF0);
}

void sub_22899AF74(void *a1)
{
  sub_22899AF90(a1, (uint64_t (*)(void))geom_collection_size_u, &qword_2559D2E40, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A4004);
}

void sub_22899AF90(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, _QWORD *, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14[2];

  v7 = a2();
  if (v7)
  {
    v8 = v7;
    if (v7 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 29;
      v9[2] = v8;
      v9[3] = 2 * (v11 >> 2);
    }
    v12 = a1;
    v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8)
      __break(1u);
  }
}

void sub_22899B068(void *a1)
{
  sub_22899B2C0(a1, (uint64_t (*)(void))geom_collection_size_2d, &qword_2559D2E18, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A4018);
}

void sub_22899B084(void *a1)
{
  sub_22899B0A0(a1, (uint64_t (*)(void))geom_collection_size_2f, &qword_2559D2E28, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A401C);
}

void sub_22899B0A0(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, _QWORD *, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14[2];

  v7 = a2();
  if (v7)
  {
    v8 = v7;
    if (v7 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v8;
      v9[3] = 2 * (v11 >> 3);
    }
    v12 = a1;
    v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8)
      __break(1u);
  }
}

void sub_22899B178(void *a1)
{
  sub_22899B1CC(a1, (uint64_t (*)(void))geom_collection_size_3d, &qword_2559D25D8, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A4020);
}

void sub_22899B194(void *a1)
{
  sub_22899B2C0(a1, (uint64_t (*)(void))geom_collection_size_3f, qword_2559D25E0, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A4034);
}

void sub_22899B1B0(void *a1)
{
  sub_22899B1CC(a1, (uint64_t (*)(void))geom_collection_size_4d, &qword_2559D2E10, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A4048);
}

void sub_22899B1CC(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, _QWORD *, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14[2];

  v7 = a2();
  if (v7)
  {
    v8 = v7;
    if (v7 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 1;
      v9[2] = v8;
      v9[3] = 2 * (v11 >> 5);
    }
    v12 = a1;
    v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8)
      __break(1u);
  }
}

void sub_22899B2A4(void *a1)
{
  sub_22899B2C0(a1, (uint64_t (*)(void))geom_collection_size_4f, &qword_2559D2E20, (uint64_t (*)(id *, _QWORD *, uint64_t))sub_2289A405C);
}

void sub_22899B2C0(void *a1, uint64_t (*a2)(void), uint64_t *a3, uint64_t (*a4)(id *, _QWORD *, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14[2];

  v7 = a2();
  if (v7)
  {
    v8 = v7;
    if (v7 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 17;
      v9[2] = v8;
      v9[3] = 2 * (v11 >> 4);
    }
    v12 = a1;
    v13 = a4(v14, v9 + 4, v8);

    if (v13 != v8)
      __break(1u);
  }
}

void sub_22899B398(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  size_t v5;
  id v6;
  uint64_t v7;
  id v8[2];

  v2 = geom_collection_size_i8((uint64_t)a1);
  if (v2)
  {
    v3 = v2;
    if (v2 <= 0)
    {
      v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E30);
      v4 = (_QWORD *)swift_allocObject();
      v5 = _swift_stdlib_malloc_size(v4);
      v4[2] = v3;
      v4[3] = 2 * v5 - 64;
    }
    v6 = a1;
    v7 = sub_2289A4070(v8, v4 + 4, v3);

    if (v7 != v3)
      __break(1u);
  }
}

void sub_22899B454(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  id v9[2];

  v2 = geom_collection_size_u16((uint64_t)a1);
  if (v2)
  {
    v3 = v2;
    if (v2 <= 0)
    {
      v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E48);
      v4 = (_QWORD *)swift_allocObject();
      v5 = _swift_stdlib_malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 31;
      v4[2] = v3;
      v4[3] = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
    v7 = a1;
    v8 = sub_2289A4074(v9, v4 + 4, v3);

    if (v8 != v3)
      __break(1u);
  }
}

_QWORD *sub_22899B51C(const void *a1, uint64_t a2)
{
  return sub_22899BB30(a1, a2, qword_2559D25E0);
}

_QWORD *sub_22899B528(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 32 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D25D8);
    v4 = 32 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 1;
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 5);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *sub_22899B5C8(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 4 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E40);
    v4 = 4 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 29;
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 2);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *sub_22899B668(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 8 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E28);
    v4 = 8 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 25;
    v5[2] = a2;
    v5[3] = 2 * (v7 >> 3);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *sub_22899B708@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22899A598(a1, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3f, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3f, a2);
}

_QWORD *sub_22899B72C(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899A5FC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3f);
}

id sub_22899B748@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3f(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22899B778(uint64_t *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3f(*a2, *a1);
}

uint64_t sub_22899B788@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3f(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22899B7B0(char *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3f(*a2, *a1);
}

_QWORD *sub_22899B7C0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22899A598(a1, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_data_3d, geom_simplify_triangle_mesh_opt_get_fixed_vertex_indices_count_3d, a2);
}

_QWORD *sub_22899B7E4(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899A5FC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_simplify_triangle_mesh_opt_set_fixed_vertex_indices_3d);
}

id sub_22899B800@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = (id)geom_simplify_triangle_mesh_opt_get_output_new_to_old_vertex_map_collection_3d(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22899B830(uint64_t *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_output_new_to_old_vertex_map_collection_3d(*a2, *a1);
}

uint64_t sub_22899B840@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = geom_simplify_triangle_mesh_opt_get_preserve_uv_boundaries_3d(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22899B868(char *a1, uint64_t *a2)
{
  return geom_simplify_triangle_mesh_opt_set_preserve_uv_boundaries_3d(*a2, *a1);
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.fixedVertexIndices.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outNewToOldVertexMap.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.preserveUVBoundaries.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.uvValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.trianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.triangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outUVValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outTrianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.outTriangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 136))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 144))();
}

uint64_t dispatch thunk of SimplifyTriangleMeshOptions3.clearUVs()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

_QWORD *sub_22899B908(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  size_t v6;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 40 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E78);
    v4 = 40 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 40);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *sub_22899B9B8(const void *a1, uint64_t a2)
{
  return sub_22899B9D0(a1, a2, &qword_2559D2E70);
}

_QWORD *sub_22899B9C4(const void *a1, uint64_t a2)
{
  return sub_22899B9D0(a1, a2, &qword_2559D2E68);
}

_QWORD *sub_22899B9D0(const void *a1, uint64_t a2, uint64_t *a3)
{
  size_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v5 = a2 << 6;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v5 = a2 << 6;
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v8 = v7 - 32;
    if (v7 < 32)
      v8 = v7 + 31;
    v6[2] = a2;
    v6[3] = 2 * (v8 >> 6);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
}

_QWORD *sub_22899BA70(const void *a1, uint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  size_t v6;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = 96 * a2;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E60);
    v4 = 96 * a2;
    v5 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 96);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

_QWORD *sub_22899BB24(const void *a1, uint64_t a2)
{
  return sub_22899BB30(a1, a2, &qword_2559D2E18);
}

_QWORD *sub_22899BB30(const void *a1, uint64_t a2, uint64_t *a3)
{
  size_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v5 = 16 * a2;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v5 = 16 * a2;
    v6 = (_QWORD *)swift_allocObject();
    v7 = _swift_stdlib_malloc_size(v6);
    v8 = v7 - 32;
    if (v7 < 32)
      v8 = v7 - 17;
    v6[2] = a2;
    v6[3] = 2 * (v8 >> 4);
  }
  memcpy(v6 + 4, a1, v5);
  return v6;
}

double geom_triangle_3f.closestPoint(to:)(float32x4_t a1)
{
  float32x4_t *v1;
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = v1[1];
  v3 = v1[2];
  v4 = *v1;
  v6 = 0uLL;
  return geom_closest_point_to_triangle_3f(&v6, a1, v4, v2, v3);
}

float64_t geom_triangle_3d.closestPoint(to:)(float64x2_t a1, float64x2_t a2)
{
  float64x2_t *v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v10;
  float64x2_t v11[6];
  float64x2_t v12[2];
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = v2[5];
  memset(v13, 0, sizeof(v13));
  v12[0] = a1;
  v12[1] = a2;
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  geom_closest_point_to_triangle_3d(v12, v11, (uint64_t)v13, &v10);
  return v10.f64[0];
}

float32x2_t geom_circle_2f.closestPoint(to:)(float32x2_t a1, double a2, float a3)
{
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  return geom_closest_point_to_circle_2f(*(uint64_t *)&a2, SLODWORD(a3), (float *)&v4, a1);
}

float64_t geom_circle_2d.closestPoint(to:)(float64x2_t a1, __n128 a2, double a3)
{
  uint64_t v4;
  __n128 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5 = a2;
  v6 = a3;
  return geom_closest_point_to_circle_2d((uint64_t)&v5, (double *)&v4, a1);
}

double geom_sphere_3f.closestPoint(to:)(float32x4_t a1, __n128 a2, float a3, float a4)
{
  int v5;
  __n128 v6;
  float v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  a2.n128_f32[2] = a3;
  v5 = 0;
  v6 = a2;
  v7 = a4;
  return geom_closest_point_to_sphere_3f((uint64_t)&v6, (float *)&v5, a1);
}

double geom_sphere_3d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5, float64x2_t a6)
{
  __int128 v7;
  float64x2_t v8[2];
  uint64_t v9;
  float64x2_t v10[2];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v8[0] = a1;
  v8[1] = a2;
  v10[0] = a3;
  v10[1] = a4;
  v11 = a5;
  geom_closest_point_to_sphere_3d(v8, v10, (double *)&v9, (uint64_t)&v7, a6);
  return *(double *)&v7;
}

uint64_t geom_quadratic_bezier_2f.closestPoint(to:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  return geom_closest_point_to_quadratic_bezier_2f((float *)v5, (float *)v5 + 1, a1, a2, a3, a4);
}

uint64_t geom_quadratic_bezier_2d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  uint64_t v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6[0] = 0.0;
  return geom_closest_point_to_quadratic_bezier_2d((double *)&v5, v6, a1, a2, a3, a4);
}

float *geom_cubic_bezier_2f.closestPoint(to:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double *a9)
{
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  return geom_closest_point_to_cubic_bezier_2f((float *)v10, (float *)v10 + 1, a1, a2, a3, a4, a5, a8, a9);
}

double geom_cubic_bezier_2f.approximateClosestPoint(to:withSampleCount:)(unint64_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float32x2_t a6)
{
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16)
    goto LABEL_5;
  return geom_approximate_closest_point_to_cubic_bezier_2f((unsigned __int16)a1, (float *)v7, (float *)v7 + 1, a2, a3, a4, a5, a6);
}

double *geom_cubic_bezier_2d.closestPoint(to:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double *a9)
{
  uint64_t v10;
  double v11[2];

  v11[1] = *(double *)MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11[0] = 0.0;
  return geom_closest_point_to_cubic_bezier_2d((double *)&v10, v11, a1, a2, a3, a4, a5, a8, a9);
}

double geom_cubic_bezier_2d.approximateClosestPoint(to:withSampleCount:)(unint64_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, float64x2_t a6)
{
  uint64_t v7;
  double v8[2];

  v8[1] = *(double *)MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8[0] = 0.0;
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a1 >> 16)
    goto LABEL_5;
  return geom_approximate_closest_point_to_cubic_bezier_2d((unsigned __int16)a1, (double *)&v7, v8, a2, a3, a4, a5, a6);
}

double findBestRigidTransform(from:to:)(float32x4_t *a1, float32x4_t *a2)
{
  unint64_t v3;
  int v5;
  __int128 v6;
  float32x4_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1[1].u64[0];
  if (v3 != a2[1].i64[0])
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v7 = 0uLL;
  v6 = xmmword_2289BCA10;
  v5 = 0;
  if (HIDWORD(v3))
    goto LABEL_5;
  geom_find_best_rigid_transform_3f(v3, a1 + 2, a2 + 2, &v7, (float32x4_t *)&v6, &v5);
  return *(double *)v7.i64;
}

float64_t findBestRigidTransform(from:to:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  float64_t result;
  __int128 v7;
  float64x2_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  float64x2_t v12;
  __int128 v13;
  float64x2_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 != *(_QWORD *)(a2 + 16))
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = xmmword_2289B3FE0;
  v11 = 0;
  if (HIDWORD(v5))
    goto LABEL_5;
  geom_find_best_rigid_transform_3d(v5, (float64x2_t *)(a1 + 32), (float64x2_t *)(a2 + 32), &v14, &v12, &v11);
  result = v14.f64[0];
  v7 = v15;
  v8 = v12;
  v9 = v13;
  v10 = v11;
  *(float64x2_t *)a3 = v14;
  *(_OWORD *)(a3 + 16) = v7;
  *(float64x2_t *)(a3 + 32) = v8;
  *(_OWORD *)(a3 + 48) = v9;
  *(_QWORD *)(a3 + 64) = v10;
  return result;
}

void __swiftcall findBestRigidTransformMatrix(from:to:)(simd_float4x4 *__return_ptr retstr, Swift::OpaquePointer from, Swift::OpaquePointer to)
{
  uint64_t v4;

  v4 = *((_QWORD *)from._rawValue + 2);
  if (v4 == *((_QWORD *)to._rawValue + 2))
  {
    if (!HIDWORD(v4))
    {
      geom_find_best_rigid_transform_matrix_3f(v4, (float32x4_t *)from._rawValue + 2, (float32x4_t *)to._rawValue + 2);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void __swiftcall findBestRigidTransformMatrix(from:to:)(simd_double4x4 *__return_ptr retstr, Swift::OpaquePointer from, Swift::OpaquePointer to)
{
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[8];

  v5 = *((_QWORD *)from._rawValue + 2);
  if (v5 == *((_QWORD *)to._rawValue + 2))
  {
    if (!HIDWORD(v5))
    {
      geom_find_best_rigid_transform_matrix_3d(v5, (float64x2_t *)from._rawValue + 2, (float64x2_t *)to._rawValue + 2, (uint64_t)v13);
      v6 = v13[1];
      v7 = v13[2];
      v8 = v13[3];
      v9 = v13[4];
      v10 = v13[5];
      v11 = v13[6];
      v12 = v13[7];
      *(_OWORD *)retstr->columns[0].f64 = v13[0];
      *(_OWORD *)&retstr->columns[0].f64[2] = v6;
      *(_OWORD *)retstr->columns[1].f64 = v7;
      *(_OWORD *)&retstr->columns[1].f64[2] = v8;
      *(_OWORD *)retstr->columns[2].f64 = v9;
      *(_OWORD *)&retstr->columns[2].f64[2] = v10;
      *(_OWORD *)retstr->columns[3].f64 = v11;
      *(_OWORD *)&retstr->columns[3].f64[2] = v12;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_22899C28C(_OWORD *a1, _DWORD *a2, float32x4_t *a3)
{
  __int128 *v3;
  float32x4_t v6;
  __int128 v7;
  int v8;
  __int128 v9;
  int v10;
  int v11;
  __int128 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = *((_DWORD *)v3 + 4);
  v11 = 0;
  v12 = v7;
  v13 = v8;
  *(double *)&v9 = geom_closest_point_to_sphere_3f((uint64_t)&v12, (float *)&v11, v6);
  v10 = v11;
  *a1 = v9;
  *a2 = v10;
}

double sub_22899C318(_OWORD *a1, _QWORD *a2, float64x2_t *a3, double a4, double a5, double a6, double a7, double a8, float64x2_t a9)
{
  uint64_t v9;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  uint64_t v16;
  double result;
  __int128 v18;
  uint64_t v19;
  _OWORD v20[2];
  float64x2_t v21[2];
  uint64_t v22;
  float64x2_t v23[2];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = *a3;
  v13 = a3[1];
  v14 = *(float64x2_t *)v9;
  v15 = *(float64x2_t *)(v9 + 16);
  v16 = *(_QWORD *)(v9 + 32);
  v22 = 0;
  v21[0] = v12;
  v21[1] = v13;
  v23[0] = v14;
  v23[1] = v15;
  v24 = v16;
  geom_closest_point_to_sphere_3d(v21, v23, (double *)&v22, (uint64_t)v20, a9);
  result = *(double *)v20;
  v18 = v20[1];
  v19 = v22;
  *a1 = v20[0];
  a1[1] = v18;
  *a2 = v19;
  return result;
}

void sub_22899C3B4(_OWORD *a1, float32x4_t *a2, float32x4_t *a3)
{
  float32x4_t *v3;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = v3[1];
  v8 = v3[2];
  v9 = *v3;
  v12 = 0uLL;
  *(double *)&v10 = geom_closest_point_to_triangle_3f(&v12, v6, v9, v7, v8);
  v11 = v12;
  *a1 = v10;
  *a2 = v11;
}

float64_t sub_22899C434(float64x2_t *a1, _OWORD *a2, float64x2_t *a3)
{
  float64x2_t *v3;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64_t result;
  float64x2_t v15;
  __int128 v16;
  __int128 v17;
  float64x2_t v18[2];
  float64x2_t v19[6];
  float64x2_t v20[2];
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = a3[1];
  v8 = *v3;
  v9 = v3[1];
  v10 = v3[2];
  v11 = v3[3];
  v12 = v3[4];
  v13 = v3[5];
  v21 = 0u;
  v22 = 0u;
  v20[0] = v6;
  v20[1] = v7;
  v19[0] = v8;
  v19[1] = v9;
  v19[2] = v10;
  v19[3] = v11;
  v19[4] = v12;
  v19[5] = v13;
  geom_closest_point_to_triangle_3d(v20, v19, (uint64_t)&v21, v18);
  result = v18[0].f64[0];
  v15 = v18[1];
  v16 = v21;
  v17 = v22;
  *a1 = v18[0];
  a1[1] = v15;
  *a2 = v16;
  a2[1] = v17;
  return result;
}

uint64_t sub_22899C4DC(_QWORD *a1, _DWORD *a2, _DWORD *a3, float32x2_t *a4)
{
  float32x2_t *v4;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = *a4;
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v15[0] = 0;
  result = geom_closest_point_to_quadratic_bezier_2f((float *)v15, (float *)v15 + 1, v8, v9, v10, v11);
  v13 = v15[0];
  *a1 = v14;
  *a2 = v13;
  *a3 = HIDWORD(v13);
  return result;
}

uint64_t sub_22899C568(_OWORD *a1, _QWORD *a2, double *a3, float64x2_t *a4)
{
  float64x2_t *v4;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  uint64_t result;
  uint64_t v13;
  double v14;
  __int128 v15;
  uint64_t v16;
  double v17[2];

  v17[1] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = *a4;
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v16 = 0;
  v17[0] = 0.0;
  result = geom_closest_point_to_quadratic_bezier_2d((double *)&v16, v17, v8, v9, v10, v11);
  v13 = v16;
  v14 = v17[0];
  *a1 = v15;
  *a2 = v13;
  *a3 = v14;
  return result;
}

float *sub_22899C5F4(_QWORD *a1, _DWORD *a2, _DWORD *a3, double *a4)
{
  float32x2_t *v4;
  double v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float *result;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = *a4;
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v12 = v4[3];
  v16[0] = 0;
  result = geom_closest_point_to_cubic_bezier_2f((float *)v16, (float *)v16 + 1, *(float32x2_t *)&v8, v9, v10, v11, v12, (uint64_t)a3, a4);
  v14 = v16[0];
  *a1 = v15;
  *a2 = v14;
  *a3 = HIDWORD(v14);
  return result;
}

void sub_22899C680(double *a1, _DWORD *a2, _DWORD *a3, float32x2_t *a4, unint64_t a5)
{
  float32x2_t *v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  double v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = *a4;
  v7 = *v5;
  v8 = v5[1];
  v9 = v5[2];
  v10 = v5[3];
  v16[0] = 0;
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a5 >> 16)
    goto LABEL_5;
  v14 = geom_approximate_closest_point_to_cubic_bezier_2f((unsigned __int16)a5, (float *)v16, (float *)v16 + 1, v6, v7, v8, v9, v10);
  v15 = v16[0];
  *a1 = v14;
  *a2 = v15;
  *a3 = HIDWORD(v15);
}

double *sub_22899C724(_OWORD *a1, _QWORD *a2, double *a3, double *a4)
{
  float64x2_t *v4;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  double *result;
  uint64_t v14;
  double v15;
  __int128 v16;
  uint64_t v17;
  double v18[2];

  v18[1] = *(double *)MEMORY[0x24BDAC8D0];
  v8 = *(float64x2_t *)a4;
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v12 = v4[3];
  v17 = 0;
  v18[0] = 0.0;
  result = geom_closest_point_to_cubic_bezier_2d((double *)&v17, v18, v8, v9, v10, v11, v12, (uint64_t)a3, a4);
  v14 = v17;
  v15 = v18[0];
  *a1 = v16;
  *a2 = v14;
  *a3 = v15;
  return result;
}

void sub_22899C7B0(_OWORD *a1, _QWORD *a2, double *a3, float64x2_t *a4, unint64_t a5)
{
  float64x2_t *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  __int128 v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18[2];

  v18[1] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = *a4;
  v7 = *v5;
  v8 = v5[1];
  v9 = v5[2];
  v10 = v5[3];
  v17 = 0;
  v18[0] = 0.0;
  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  if (a5 >> 16)
    goto LABEL_5;
  *(double *)&v14 = geom_approximate_closest_point_to_cubic_bezier_2d((unsigned __int16)a5, (double *)&v17, v18, v6, v7, v8, v9, v10);
  v15 = v17;
  v16 = v18[0];
  *a1 = v14;
  *a2 = v15;
  *a3 = v16;
}

uint64_t sub_22899C854(int a1, void (**a2)(uint64_t *__return_ptr, int *, _QWORD *), _DWORD *a3, double a4, double a5)
{
  void (*v6)(uint64_t *__return_ptr, int *, _QWORD *);
  uint64_t v8;
  _QWORD v9[2];
  int v10;

  if (!a2)
    return 0;
  v6 = *a2;
  v10 = a1;
  *(double *)v9 = a4;
  *(double *)&v9[1] = a5;
  swift_retain();
  v6(&v8, &v10, v9);
  swift_release();
  if ((v8 & 0x100000000) != 0)
    return 0;
  *a3 = v8;
  return 1;
}

uint64_t sub_22899C8D4(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _DWORD *a3, __n128 a4, float a5, __n128 a6, float a7)
{
  void (*v8)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v10;
  _OWORD v11[2];
  int v12;

  if (!a2)
    return 0;
  a6.n128_f32[2] = a7;
  a4.n128_f32[2] = a5;
  v8 = *a2;
  v12 = a1;
  v11[0] = a4;
  v11[1] = a6;
  swift_retain();
  v8(&v10, &v12, v11);
  swift_release();
  if ((v10 & 0x100000000) != 0)
    return 0;
  *a3 = v10;
  return 1;
}

int32x2_t sub_22899C95C(int a1, void (**a2)(_QWORD *__return_ptr, _QWORD, _QWORD), double a3)
{
  void (*v3)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v5;
  double v6;
  int v7;

  if (a2)
  {
    v3 = *a2;
    v7 = a1;
    v6 = a3;
    swift_retain();
    v3(&v5, &v7, &v6);
    swift_release();
    return (int32x2_t)v5;
  }
  else
  {
    return vdup_n_s32(0x7FC00000u);
  }
}

double sub_22899C9BC(int a1, void (**a2)(__int128 *__return_ptr, int *, __n128 *), __n128 a3)
{
  void (*v3)(__int128 *__return_ptr, int *, __n128 *);
  __int128 v5;
  __n128 v6;
  int v7;

  if (!a2)
    return 2.24711749e307;
  v3 = *a2;
  v7 = a1;
  v6 = a3;
  swift_retain();
  v3(&v5, &v7, &v6);
  swift_release();
  return *(double *)&v5;
}

uint64_t sub_22899CA1C(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _QWORD *a3, __n128 a4, __n128 a5)
{
  void (*v6)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v8;
  char v9;
  _OWORD v10[2];
  int v11;

  if (!a2)
    return 0;
  v6 = *a2;
  v11 = a1;
  v10[0] = a4;
  v10[1] = a5;
  swift_retain();
  v6(&v8, &v11, v10);
  swift_release();
  if ((v9 & 1) != 0)
    return 0;
  *a3 = v8;
  return 1;
}

uint64_t sub_22899CA9C(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _QWORD *a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  void (*v8)(uint64_t *__return_ptr, int *, _OWORD *);
  uint64_t v10;
  char v11;
  _OWORD v12[4];
  int v13;

  if (!a2)
    return 0;
  v8 = *a2;
  v13 = a1;
  v12[0] = a4;
  v12[1] = a5;
  v12[2] = a6;
  v12[3] = a7;
  swift_retain();
  v8(&v10, &v13, v12);
  swift_release();
  if ((v11 & 1) != 0)
    return 0;
  *a3 = v10;
  return 1;
}

double sub_22899CB20(int a1, void (**a2)(__int128 *__return_ptr, int *, __n128 *), __n128 a3)
{
  void (*v3)(__int128 *__return_ptr, int *, __n128 *);
  double result;
  __int128 v5;
  __n128 v6;
  int v7;

  if (a2)
  {
    v3 = *a2;
    v7 = a1;
    v6 = a3;
    swift_retain();
    v3(&v5, &v7, &v6);
    swift_release();
    return *(double *)&v5;
  }
  else
  {
    *(_QWORD *)&result = vdupq_n_s64(0x7FF8000000000000uLL).u64[0];
  }
  return result;
}

double sub_22899CB80(int a1, void (**a2)(__int128 *__return_ptr, int *, _OWORD *), __n128 a3, __n128 a4)
{
  void (*v4)(__int128 *__return_ptr, int *, _OWORD *);
  double result;
  __int128 v6;
  _OWORD v7[2];
  int v8;

  if (a2)
  {
    v4 = *a2;
    v8 = a1;
    v7[0] = a3;
    v7[1] = a4;
    swift_retain();
    v4(&v6, &v8, v7);
    swift_release();
    return *(double *)&v6;
  }
  else
  {
    *(_QWORD *)&result = vdupq_n_s64(0x7FF8000000000000uLL).u64[0];
  }
  return result;
}

uint64_t sub_22899CBE8()
{
  unsigned int *v0;

  return *v0;
}

uint64_t sub_22899CBF0()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 4);
}

uint64_t sub_22899CBF8()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8);
}

uint64_t sub_22899CC00()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 12);
}

uint64_t sub_22899CC08()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

double sub_22899CC10@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  uint64_t v3;

  result = *(double *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  *(double *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  return result;
}

__n128 sub_22899CC1C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 32);
  v3 = *(_OWORD *)(v1 + 48);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_22899CC28@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  result = *(__n128 *)(v1 + 32);
  v3 = *(_OWORD *)(v1 + 48);
  v4 = *(_OWORD *)(v1 + 64);
  v5 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = v5;
  return result;
}

uint64_t OS_geom_bvh_create_opt_2f.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22899D484((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_2f, geom_bvh_create_opt_get_strategy_builtin_2f, geom_bvh_create_opt_get_strategy_custom_heuristic_2f, a1);
}

uint64_t OS_geom_bvh_create_opt_2f.buildStrategy.setter(uint64_t *a1)
{
  return sub_22899D584(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

void (*OS_geom_bvh_create_opt_2f.buildStrategy.modify(_QWORD *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  void (*result)(unsigned int **, uint64_t);
  int v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  if (geom_bvh_create_opt_uses_builtin_strategy_2f(v1))
  {
    *v3 = geom_bvh_create_opt_get_strategy_builtin_2f(v1);
    *((_DWORD *)v3 + 2) = 0;
    *((_BYTE *)v3 + 12) = 0;
    return sub_22899CD88;
  }
  v3[2] = 0;
  *((_DWORD *)v3 + 8) = 0;
  result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_2f(v1, v3 + 2, (_DWORD *)v3 + 8);
  if (v3[2])
  {
    v5 = *((_DWORD *)v3 + 8);
    *v3 = v3[2];
    *((_DWORD *)v3 + 2) = v5;
    *((_BYTE *)v3 + 12) = 1;
    return sub_22899CD88;
  }
  __break(1u);
  return result;
}

void sub_22899CD88(unsigned int **a1, uint64_t a2)
{
  sub_22899D69C(a1, a2, (void (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (void (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

uint64_t sub_22899CD9C()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_should_copy_input_data_2f(*v0);
}

uint64_t sub_22899CDB4(char a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_should_copy_input_data_2f(*v1, a1 & 1);
}

uint64_t (*sub_22899CDC4(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_2f(v3);
  return sub_22899CDFC;
}

uint64_t sub_22899CDFC(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22899CE0C()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2f(*v0);
}

uint64_t sub_22899CE14(uint64_t a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2f(*v1, a1);
}

uint64_t (*sub_22899CE20(uint64_t *a1))(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2f(v3);
  return sub_22899CE58;
}

uint64_t sub_22899CE58(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2f(a1[1], *a1);
}

uint64_t sub_22899CE64@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_2f.buildStrategy.getter(a1);
}

uint64_t sub_22899CE84(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899D7DC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

uint64_t (*sub_22899CE98(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_2f.buildStrategy.modify(v2);
  return sub_228993248;
}

uint64_t OS_geom_bvh_create_opt_3f.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22899D484((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_3f, geom_bvh_create_opt_get_strategy_builtin_3f, geom_bvh_create_opt_get_strategy_custom_heuristic_3f, a1);
}

uint64_t OS_geom_bvh_create_opt_3f.buildStrategy.setter(uint64_t *a1)
{
  return sub_22899D584(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

void (*OS_geom_bvh_create_opt_3f.buildStrategy.modify(_QWORD *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  void (*result)(unsigned int **, uint64_t);
  int v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  if (geom_bvh_create_opt_uses_builtin_strategy_3f(v1))
  {
    *v3 = geom_bvh_create_opt_get_strategy_builtin_3f(v1);
    *((_DWORD *)v3 + 2) = 0;
    *((_BYTE *)v3 + 12) = 0;
    return sub_22899D02C;
  }
  v3[2] = 0;
  *((_DWORD *)v3 + 8) = 0;
  result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_3f(v1, v3 + 2, (_DWORD *)v3 + 8);
  if (v3[2])
  {
    v5 = *((_DWORD *)v3 + 8);
    *v3 = v3[2];
    *((_DWORD *)v3 + 2) = v5;
    *((_BYTE *)v3 + 12) = 1;
    return sub_22899D02C;
  }
  __break(1u);
  return result;
}

void sub_22899D02C(unsigned int **a1, uint64_t a2)
{
  sub_22899D69C(a1, a2, (void (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (void (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

uint64_t sub_22899D040()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_should_copy_input_data_3f(*v0);
}

uint64_t sub_22899D058(char a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_should_copy_input_data_3f(*v1, a1 & 1);
}

uint64_t (*sub_22899D068(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_3f(v3);
  return sub_22899D0A0;
}

uint64_t sub_22899D0A0(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22899D0B0()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3f(*v0);
}

uint64_t sub_22899D0B8(uint64_t a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3f(*v1, a1);
}

uint64_t (*sub_22899D0C4(uint64_t *a1))(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3f(v3);
  return sub_22899D0FC;
}

uint64_t sub_22899D0FC(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3f(a1[1], *a1);
}

uint64_t sub_22899D108@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_3f.buildStrategy.getter(a1);
}

uint64_t sub_22899D128(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899D7DC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

uint64_t (*sub_22899D13C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_3f.buildStrategy.modify(v2);
  return sub_228993248;
}

uint64_t OS_geom_bvh_create_opt_2d.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22899D484((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_2d, geom_bvh_create_opt_get_strategy_builtin_2d, geom_bvh_create_opt_get_strategy_custom_heuristic_2d, a1);
}

uint64_t OS_geom_bvh_create_opt_2d.buildStrategy.setter(uint64_t *a1)
{
  return sub_22899D584(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

void (*OS_geom_bvh_create_opt_2d.buildStrategy.modify(_QWORD *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  void (*result)(unsigned int **, uint64_t);
  int v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  if (geom_bvh_create_opt_uses_builtin_strategy_2d(v1))
  {
    *v3 = geom_bvh_create_opt_get_strategy_builtin_2d(v1);
    *((_DWORD *)v3 + 2) = 0;
    *((_BYTE *)v3 + 12) = 0;
    return sub_22899D2D0;
  }
  v3[2] = 0;
  *((_DWORD *)v3 + 8) = 0;
  result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_2d(v1, v3 + 2, (_DWORD *)v3 + 8);
  if (v3[2])
  {
    v5 = *((_DWORD *)v3 + 8);
    *v3 = v3[2];
    *((_DWORD *)v3 + 2) = v5;
    *((_BYTE *)v3 + 12) = 1;
    return sub_22899D2D0;
  }
  __break(1u);
  return result;
}

void sub_22899D2D0(unsigned int **a1, uint64_t a2)
{
  sub_22899D69C(a1, a2, (void (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (void (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

uint64_t sub_22899D2E4()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_should_copy_input_data_2d(*v0);
}

uint64_t sub_22899D2FC(char a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_should_copy_input_data_2d(*v1, a1 & 1);
}

uint64_t (*sub_22899D30C(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_2d(v3);
  return sub_22899D344;
}

uint64_t sub_22899D344(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_2d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22899D354()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2d(*v0);
}

uint64_t sub_22899D35C(uint64_t a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2d(*v1, a1);
}

uint64_t (*sub_22899D368(uint64_t *a1))(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_2d(v3);
  return sub_22899D3A0;
}

uint64_t sub_22899D3A0(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_2d(a1[1], *a1);
}

uint64_t sub_22899D3AC@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_2d.buildStrategy.getter(a1);
}

uint64_t sub_22899D3CC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899D7DC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

uint64_t (*sub_22899D3E0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_2d.buildStrategy.modify(v2);
  return sub_228993248;
}

uint64_t OS_geom_bvh_create_opt_3d.buildStrategy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22899D484((unsigned int (*)(uint64_t))geom_bvh_create_opt_uses_builtin_strategy_3d, geom_bvh_create_opt_get_strategy_builtin_3d, geom_bvh_create_opt_get_strategy_custom_heuristic_3d, a1);
}

uint64_t sub_22899D484@<X0>(unsigned int (*a1)(uint64_t)@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t (*a3)(uint64_t, _QWORD *, int *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  int v9;
  int v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a1(v4))
  {
    result = a2(v4);
    *(_QWORD *)a4 = result;
    *(_DWORD *)(a4 + 8) = 0;
    *(_BYTE *)(a4 + 12) = 0;
  }
  else
  {
    v11[0] = 0;
    v10 = 0;
    result = a3(v4, v11, &v10);
    if (v11[0])
    {
      v9 = v10;
      *(_QWORD *)a4 = v11[0];
      *(_DWORD *)(a4 + 8) = v9;
      *(_BYTE *)(a4 + 12) = 1;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22899D548(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t), uint64_t (*a6)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v7;
  uint64_t v8;

  v7 = *a1;
  v8 = *a2;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
    return a6(v8, v7, *((unsigned int *)a1 + 2));
  else
    return a5(v8, v7);
}

uint64_t OS_geom_bvh_create_opt_3d.buildStrategy.setter(uint64_t *a1)
{
  return sub_22899D584(a1, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t sub_22899D584(uint64_t *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v3;
  uint64_t v6;

  v6 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
    return a3(v3, v6, *((unsigned int *)a1 + 2));
  else
    return a2(v3, v6);
}

void (*OS_geom_bvh_create_opt_3d.buildStrategy.modify(_QWORD *a1))(unsigned int **a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  void (*result)(unsigned int **, uint64_t);
  int v5;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  if (geom_bvh_create_opt_uses_builtin_strategy_3d(v1))
  {
    *v3 = geom_bvh_create_opt_get_strategy_builtin_3d(v1);
    *((_DWORD *)v3 + 2) = 0;
    *((_BYTE *)v3 + 12) = 0;
    return sub_22899D688;
  }
  v3[2] = 0;
  *((_DWORD *)v3 + 8) = 0;
  result = (void (*)(unsigned int **, uint64_t))geom_bvh_create_opt_get_strategy_custom_heuristic_3d(v1, v3 + 2, (_DWORD *)v3 + 8);
  if (v3[2])
  {
    v5 = *((_DWORD *)v3 + 8);
    *v3 = v3[2];
    *((_DWORD *)v3 + 2) = v5;
    *((_BYTE *)v3 + 12) = 1;
    return sub_22899D688;
  }
  __break(1u);
  return result;
}

void sub_22899D688(unsigned int **a1, uint64_t a2)
{
  sub_22899D69C(a1, a2, (void (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (void (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

void sub_22899D69C(unsigned int **a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t, _QWORD))
{
  unsigned int *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a1;
  v5 = *(_QWORD *)*a1;
  v6 = *((_BYTE *)*a1 + 12);
  v7 = *((_QWORD *)*a1 + 3);
  if ((v6 & 1) != 0)
    a4(v7, v5, v4[2]);
  else
    a3(v7, v5);
  free(v4);
}

uint64_t sub_22899D6E0()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_should_copy_input_data_3d(*v0);
}

uint64_t sub_22899D6F8(char a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_should_copy_input_data_3d(*v1, a1 & 1);
}

uint64_t (*sub_22899D708(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_bvh_create_opt_get_should_copy_input_data_3d(v3);
  return sub_22899D740;
}

uint64_t sub_22899D740(uint64_t a1)
{
  return geom_bvh_create_opt_set_should_copy_input_data_3d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22899D750()
{
  uint64_t *v0;

  return geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3d(*v0);
}

uint64_t sub_22899D758(uint64_t a1)
{
  uint64_t *v1;

  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3d(*v1, a1);
}

uint64_t (*sub_22899D764(uint64_t *a1))(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_bvh_create_opt_get_minimum_primitives_in_interior_node_3d(v3);
  return sub_22899D79C;
}

uint64_t sub_22899D79C(uint64_t *a1)
{
  return geom_bvh_create_opt_set_minimum_primitives_in_interior_node_3d(a1[1], *a1);
}

uint64_t sub_22899D7A8@<X0>(uint64_t a1@<X8>)
{
  return OS_geom_bvh_create_opt_3d.buildStrategy.getter(a1);
}

uint64_t sub_22899D7C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899D7DC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t sub_22899D7DC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t, _QWORD))
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = *v5;
  v8 = *a1;
  if ((*((_BYTE *)a1 + 12) & 1) != 0)
    return a5(v7, v8, *((unsigned int *)a1 + 2));
  else
    return a4(v7, v8);
}

uint64_t (*sub_22899D7FC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_bvh_create_opt_3d.buildStrategy.modify(v2);
  return sub_228993248;
}

uint64_t OS_geom_bvh_2f.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2f);
}

uint64_t OS_geom_bvh_2f.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899EC3C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2f);
}

OS_geom_bvh_2f __swiftcall OS_geom_bvh_2f.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_2f)sub_2289A0090((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_2f);
}

OS_geom_bvh_2f __swiftcall OS_geom_bvh_2f.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2f options)
{
  return (OS_geom_bvh_2f)sub_2289A00F0((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bvh_with_options_2f);
}

Swift::Void __swiftcall OS_geom_bvh_2f.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2f options)
{
  uint64_t v3;

  geom_recreate_bvh_with_options_2f(v3, *((const void **)centroids._rawValue + 2), (char *)centroids._rawValue + 32, (char *)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_2f.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  sub_2289A0180((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_2f);
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_2f.statistics()()
{
  Swift::Int v0;
  Swift::Int v1;
  Swift::tuple_maxLevel_Int_sumOfLevels_Int result;

  v0 = sub_22899ED44((void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_2f);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_2f.nodes.getter()
{
  return sub_2289A0F8C(geom_bvh_get_nodes_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B908);
}

uint64_t OS_geom_bvh_2f.primitivePartition.getter()
{
  return sub_2289A0F8C(geom_bvh_get_primitive_partition_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *OS_geom_bvh_2f.primitives(forNode:)(uint64_t a1)
{
  return sub_22899EE98(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2f);
}

_QWORD *OS_geom_bvh_2f.primitives(forNode:)(unsigned int *a1)
{
  uint64_t v1;
  const void *primitives_for_node_2f;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  primitives_for_node_2f = (const void *)geom_bvh_get_primitives_for_node_2f(v1, *a1, v4);
  return sub_22899B5C8(primitives_for_node_2f, v4[0]);
}

unint64_t OS_geom_bvh_2f.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  uint64_t v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v12[0] = 0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v11[0] = sub_2289A130C;
  v11[1] = v9;
  LODWORD(a2) = geom_bvh_raycast_2f(v4, (uint64_t)sub_22899DB34, (uint64_t)v11, (float *)v12 + 1, (unsigned int *)v12, a3, a4);
  swift_release();
  if ((_DWORD)a2)
    return HIDWORD(v12[0]) | ((unint64_t)LODWORD(v12[0]) << 32);
  else
    return 0;
}

uint64_t sub_22899DB34(int a1, void (**a2)(uint64_t *__return_ptr, int *, _QWORD *), _DWORD *a3, double a4, double a5)
{
  return sub_22899C854(a1, a2, a3, a4, a5) & 1;
}

double OS_geom_bvh_2f.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float32x2_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  double v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v10[0] = sub_2289A1354;
  v10[1] = v7;
  v8 = geom_bvh_closest_point_2f(v3, (void (*)(_QWORD, uint64_t, double))sub_22899DC18, (uint64_t)v10, (float *)v11 + 1, (unsigned int *)v11, a3);
  swift_release();
  return v8;
}

uint64_t sub_22899DC1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2f, a5);
}

uint64_t sub_22899DC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899F1D4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2f, a6);
}

uint64_t sub_22899DC34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_2f, a3);
}

void sub_22899DC40(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bvh_with_options_2f, a4);
}

void sub_22899DC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_2f);
}

uint64_t sub_22899DC60(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bvh_with_options_2f);
}

uint64_t sub_22899DC6C(uint64_t a1, uint64_t a2)
{
  return sub_22899F2CC(a1, a2, (void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_2f);
}

uint64_t sub_22899DCB8(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_nodes_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B908);
}

uint64_t sub_22899DD0C(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_primitive_partition_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *sub_22899DD60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22899F420(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2f);
}

_QWORD *sub_22899DDAC(unsigned int *a1)
{
  uint64_t *v1;
  unsigned int v2;
  uint64_t v3;
  const void *primitives_for_node_2f;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *v1;
  v6[0] = 0;
  primitives_for_node_2f = (const void *)geom_bvh_get_primitives_for_node_2f(v3, v2, v6);
  return sub_22899B5C8(primitives_for_node_2f, v6[0]);
}

unint64_t sub_22899DE20@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  double v5;
  double v6;
  unint64_t result;
  char v8;
  _QWORD v9[4];

  v5 = *a1;
  v6 = a1[1];
  v9[2] = a2;
  v9[3] = a3;
  result = OS_geom_bvh_2f.raycast(ray:intersectFunction:)((uint64_t)sub_2289A2700, (uint64_t)v9, v5, v6);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v8 & 1;
  return result;
}

void sub_22899DE6C(double *a1, _DWORD *a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  float32x2_t v6;
  int v7;
  _QWORD v8[4];

  v6 = *a3;
  v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_2f.closestPoint(to:closestPointFunction:)((uint64_t)sub_2289A26C8, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_3f.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3f);
}

uint64_t OS_geom_bvh_3f.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899EC3C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3f);
}

OS_geom_bvh_3f __swiftcall OS_geom_bvh_3f.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_3f)sub_2289A0090((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_3f);
}

OS_geom_bvh_3f __swiftcall OS_geom_bvh_3f.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3f options)
{
  return (OS_geom_bvh_3f)sub_2289A00F0((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bvh_with_options_3f);
}

Swift::Void __swiftcall OS_geom_bvh_3f.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3f options)
{
  uint64_t v3;

  geom_recreate_bvh_with_options_3f(v3, *((const void **)centroids._rawValue + 2), (char *)centroids._rawValue + 32, (char *)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_3f.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  sub_2289A0180((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_3f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_3f);
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_3f.statistics()()
{
  Swift::Int v0;
  Swift::Int v1;
  Swift::tuple_maxLevel_Int_sumOfLevels_Int result;

  v0 = sub_22899ED44((void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_3f);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_3f.nodes.getter()
{
  return sub_2289A0F8C(geom_bvh_get_nodes_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B9B8);
}

uint64_t OS_geom_bvh_3f.primitivePartition.getter()
{
  return sub_2289A0F8C(geom_bvh_get_primitive_partition_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *OS_geom_bvh_3f.primitives(forNode:)(uint64_t a1)
{
  return sub_22899EE98(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

_QWORD *OS_geom_bvh_3f.primitives(forNode:)(unsigned int *a1)
{
  return sub_22899E6F4(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

unint64_t OS_geom_bvh_3f.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, float32x4_t a3, float32_t a4, __n128 a5, float a6)
{
  uint64_t v6;
  uint64_t v9;
  __n128 v11;
  float32x4_t v12;
  _QWORD v13[2];
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  a3.f32[2] = a4;
  a5.n128_f32[2] = a6;
  v11 = a5;
  v12 = a3;
  v15 = 0;
  v14 = 0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v13[0] = sub_2289A1394;
  v13[1] = v9;
  LODWORD(a2) = geom_bvh_raycast_3f(v6, (uint64_t)sub_22899E188, (uint64_t)v13, (float *)&v15, &v14, v12, v11);
  swift_release();
  if ((_DWORD)a2)
    return v15 | ((unint64_t)v14 << 32);
  else
    return 0;
}

uint64_t sub_22899E188(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _DWORD *a3, __n128 a4, __n128 a5)
{
  return sub_22899C8D4(a1, a2, a3, a4, a4.n128_f32[2], a5, a5.n128_f32[2]) & 1;
}

__n128 OS_geom_bvh_3f.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float32x4_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  __n128 v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v11[0] = 0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v10[0] = sub_2289A13E4;
  v10[1] = v6;
  v9 = geom_bvh_closest_point_3f(v3, (void (*)(_QWORD, uint64_t, __n128))sub_22899E270, (uint64_t)v10, (float *)v11 + 1, (unsigned int *)v11, a3);
  swift_release();
  return v9;
}

double sub_22899E270(int a1, void (**a2)(__int128 *__return_ptr, int *, __n128 *), __n128 a3)
{
  return sub_22899C9BC(a1, a2, a3);
}

uint64_t sub_22899E284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3f, a5);
}

uint64_t sub_22899E290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899F1D4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3f, a6);
}

uint64_t sub_22899E29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_3f, a3);
}

void sub_22899E2A8(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bvh_with_options_3f, a4);
}

void sub_22899E2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_3f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_3f);
}

uint64_t sub_22899E2C8(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bvh_with_options_3f);
}

uint64_t sub_22899E2D4(uint64_t a1, uint64_t a2)
{
  return sub_22899F2CC(a1, a2, (void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_3f);
}

uint64_t sub_22899E320(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_nodes_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B9B8);
}

uint64_t sub_22899E374(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_primitive_partition_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *sub_22899E3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22899F420(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

_QWORD *sub_22899E414(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899EB0C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3f);
}

unint64_t sub_22899E460@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  float32x4_t v5;
  __n128 v6;
  unint64_t result;
  char v8;
  _QWORD v9[4];

  v5 = *(float32x4_t *)a1;
  v6 = *((__n128 *)a1 + 1);
  v9[2] = a2;
  v9[3] = a3;
  result = OS_geom_bvh_3f.raycast(ray:intersectFunction:)((uint64_t)sub_2289A2678, (uint64_t)v9, v5, v5.f32[2], v6, v6.n128_f32[2]);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v8 & 1;
  return result;
}

void sub_22899E4B4(__n128 *a1, _DWORD *a2, float32x4_t *a3, uint64_t a4, uint64_t a5)
{
  float32x4_t v6;
  int v7;
  _QWORD v8[4];

  v6 = *a3;
  v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_3f.closestPoint(to:closestPointFunction:)((uint64_t)sub_2289A2604, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_2d.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2d);
}

uint64_t OS_geom_bvh_2d.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899EC3C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2d);
}

OS_geom_bvh_2d __swiftcall OS_geom_bvh_2d.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_2d)sub_2289A0090((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_2d);
}

OS_geom_bvh_2d __swiftcall OS_geom_bvh_2d.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2d options)
{
  return (OS_geom_bvh_2d)sub_2289A00F0((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bvh_with_options_2d);
}

Swift::Void __swiftcall OS_geom_bvh_2d.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_2d options)
{
  uint64_t v3;

  geom_recreate_bvh_with_options_2d(v3, *((const void **)centroids._rawValue + 2), (char *)centroids._rawValue + 32, (char *)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_2d.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  sub_2289A0180((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_2d);
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_2d.statistics()()
{
  Swift::Int v0;
  Swift::Int v1;
  Swift::tuple_maxLevel_Int_sumOfLevels_Int result;

  v0 = sub_22899ED44((void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_2d);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t OS_geom_bvh_2d.nodes.getter()
{
  return sub_2289A0F8C(geom_bvh_get_nodes_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B9C4);
}

uint64_t OS_geom_bvh_2d.primitivePartition.getter()
{
  return sub_2289A0F8C(geom_bvh_get_primitive_partition_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *OS_geom_bvh_2d.primitives(forNode:)(uint64_t a1)
{
  return sub_22899EE98(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

_QWORD *OS_geom_bvh_2d.primitives(forNode:)(unsigned int *a1)
{
  return sub_22899E6F4(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

_QWORD *sub_22899E6F4(unsigned int *a1, uint64_t (*a2)(uint64_t, _QWORD, uint64_t *))
{
  uint64_t v2;
  const void *v3;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = (const void *)a2(v2, *a1, v5);
  return sub_22899B5C8(v3, v5[0]);
}

uint64_t OS_geom_bvh_2d.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3, __n128 a4)
{
  uint64_t v4;
  uint64_t v7;
  _QWORD v11[2];
  unsigned int v12;
  double v13[2];

  v13[1] = *(double *)MEMORY[0x24BDAC8D0];
  v13[0] = 0.0;
  v12 = 0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v11[0] = sub_2289A1424;
  v11[1] = v7;
  LODWORD(a2) = geom_bvh_raycast_2d(v4, (uint64_t)sub_22899E84C, (uint64_t)v11, v13, &v12, a3, a4);
  swift_release();
  if ((_DWORD)a2)
    return *(_QWORD *)&v13[0];
  else
    return 0;
}

uint64_t sub_22899E84C(int a1, void (**a2)(uint64_t *__return_ptr, int *, _OWORD *), _QWORD *a3, __n128 a4, __n128 a5)
{
  return sub_22899CA1C(a1, a2, a3, a4, a5) & 1;
}

__n128 OS_geom_bvh_2d.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  __n128 v9;
  _QWORD v10[2];
  unsigned int v11;
  double v12[2];

  v12[1] = *(double *)MEMORY[0x24BDAC8D0];
  v12[0] = 0.0;
  v11 = 0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v10[0] = sub_2289A13E4;
  v10[1] = v6;
  v9 = geom_bvh_closest_point_2d(v3, (void (*)(_QWORD, uint64_t, __n128))sub_22899E92C, (uint64_t)v10, v12, &v11, a3);
  swift_release();
  return v9;
}

uint64_t sub_22899E930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_2d, a5);
}

uint64_t sub_22899E93C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899F1D4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_2d, a6);
}

uint64_t sub_22899E948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_2d, a3);
}

void sub_22899E954(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bvh_with_options_2d, a4);
}

void sub_22899E960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_2d);
}

uint64_t sub_22899E974(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bvh_with_options_2d);
}

uint64_t sub_22899E980(uint64_t a1, uint64_t a2)
{
  return sub_22899F2CC(a1, a2, (void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_2d);
}

uint64_t sub_22899E9CC(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_nodes_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B9C4);
}

uint64_t sub_22899EA20(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_primitive_partition_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *sub_22899EA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22899F420(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

_QWORD *sub_22899EAC0(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return sub_22899EB0C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_2d);
}

_QWORD *sub_22899EB0C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  uint64_t v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *v4;
  v9[0] = 0;
  v7 = (const void *)a4(v6, v5, v9);
  return sub_22899B5C8(v7, v9[0]);
}

uint64_t sub_22899EB80@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  float64x2_t v5;
  __n128 v6;
  uint64_t result;
  int v8;
  char v9;
  _QWORD v10[4];

  v5 = *(float64x2_t *)a1;
  v6 = *((__n128 *)a1 + 1);
  v10[2] = a2;
  v10[3] = a3;
  result = OS_geom_bvh_2d.raycast(ray:intersectFunction:)((uint64_t)sub_2289A263C, (uint64_t)v10, v5, v6);
  *(_QWORD *)a4 = result;
  *(_DWORD *)(a4 + 8) = v8;
  *(_BYTE *)(a4 + 12) = v9 & 1;
  return result;
}

void sub_22899EBD0(__n128 *a1, _QWORD *a2, float64x2_t *a3, uint64_t a4, uint64_t a5)
{
  float64x2_t v6;
  uint64_t v7;
  _QWORD v8[4];

  v6 = *a3;
  v8[2] = a4;
  v8[3] = a5;
  *a1 = OS_geom_bvh_2d.closestPoint(to:closestPointFunction:)((uint64_t)sub_2289A2604, (uint64_t)v8, v6);
  *a2 = v7;
}

uint64_t OS_geom_bvh_3d.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3d);
}

uint64_t OS_geom_bvh_3d.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899EC3C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3d);
}

uint64_t sub_22899EC3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v6;

  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    v6 = a6(*(_QWORD *)(result + 16), result + 32, a2 + 32, a3, a4, a5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

OS_geom_bvh_3d __swiftcall OS_geom_bvh_3d.init(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  return (OS_geom_bvh_3d)sub_2289A0090((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_3d);
}

OS_geom_bvh_3d __swiftcall OS_geom_bvh_3d.init(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3d options)
{
  return (OS_geom_bvh_3d)sub_2289A00F0((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bvh_with_options_3d);
}

Swift::Void __swiftcall OS_geom_bvh_3d.reinit(centroids:bboxs:options:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs, OS_geom_bvh_create_opt_3d options)
{
  uint64_t v3;

  geom_recreate_bvh_with_options_3d(v3, *((const void **)centroids._rawValue + 2), (char *)centroids._rawValue + 32, (char *)bboxs._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bvh_3d.reinit(centroids:bboxs:)(Swift::OpaquePointer centroids, Swift::OpaquePointer bboxs)
{
  sub_2289A0180((uint64_t)centroids._rawValue, (uint64_t)bboxs._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_3d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_3d);
}

Swift::tuple_maxLevel_Int_sumOfLevels_Int __swiftcall OS_geom_bvh_3d.statistics()()
{
  Swift::Int v0;
  Swift::Int v1;
  Swift::tuple_maxLevel_Int_sumOfLevels_Int result;

  v0 = sub_22899ED44((void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_3d);
  result.sumOfLevels = v1;
  result.maxLevel = v0;
  return result;
}

uint64_t sub_22899ED44(void (*a1)(uint64_t, char *, _QWORD *))
{
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0;
  a1(v1, (char *)v3 + 4, v3);
  return HIDWORD(v3[0]);
}

uint64_t OS_geom_bvh_3d.nodes.getter()
{
  return sub_2289A0F8C(geom_bvh_get_nodes_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899BA70);
}

uint64_t OS_geom_bvh_3d.primitivePartition.getter()
{
  return sub_2289A0F8C(geom_bvh_get_primitive_partition_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *OS_geom_bvh_3d.primitives(forNode:)(uint64_t a1)
{
  return sub_22899EE98(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3d);
}

_QWORD *sub_22899EE98(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t v2;
  const void *v3;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = (const void *)a2(v2, a1, v5);
  return sub_22899B5C8(v3, v5[0]);
}

_QWORD *OS_geom_bvh_3d.primitives(forNode:)(unsigned int *a1)
{
  uint64_t v1;
  const void *primitives_for_node_3d;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  primitives_for_node_3d = (const void *)geom_bvh_get_primitives_for_node_3d(v1, *a1, v4);
  return sub_22899B5C8(primitives_for_node_3d, v4[0]);
}

uint64_t OS_geom_bvh_3d.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  uint64_t v6;
  uint64_t v9;
  __int128 v15[4];
  _QWORD v16[2];
  unsigned int v17;
  double v18[2];

  v18[1] = *(double *)MEMORY[0x24BDAC8D0];
  v18[0] = 0.0;
  v17 = 0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v16[0] = sub_2289A147C;
  v16[1] = v9;
  v15[0] = (__int128)a3;
  v15[1] = (__int128)a4;
  v15[2] = (__int128)a5;
  v15[3] = (__int128)a6;
  LODWORD(a2) = geom_bvh_raycast_3d(v6, (uint64_t)sub_22899F080, v15, (uint64_t)v16, v18, &v17);
  swift_release();
  if ((_DWORD)a2)
    return *(_QWORD *)&v18[0];
  else
    return 0;
}

uint64_t sub_22899F080(int a1, __n128 *a2, void (**a3)(uint64_t *__return_ptr, int *, _OWORD *), _QWORD *a4, double a5, __n128 a6, double a7, __n128 a8)
{
  a6.n128_u64[0] = a2[1].n128_u64[0];
  a8.n128_u64[0] = a2[3].n128_u64[0];
  return sub_22899CA9C(a1, a3, a4, *a2, a6, a2[2], a8) & 1;
}

__n128 OS_geom_bvh_3d.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, float64x2_t a3, float64x2_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  __int128 v10;
  __int128 v12;
  float64x2_t v13[2];
  _QWORD v14[2];
  unsigned int v15;
  double v16[2];

  v16[1] = *(double *)MEMORY[0x24BDAC8D0];
  v16[0] = 0.0;
  v15 = 0;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v14[0] = sub_2289A14D0;
  v14[1] = v7;
  v13[0] = a3;
  v13[1] = a4;
  geom_bvh_closest_point_3d(v4, (void (*)(float64x2_t *__return_ptr, uint64_t, _OWORD *, uint64_t))sub_22899F190, v13, (uint64_t)v14, v16, &v15, (uint64_t)&v12);
  v10 = v12;
  swift_release();
  return (__n128)v10;
}

void sub_22899F190(int a1@<W0>, __n128 *a2@<X1>, void (**a3)(__int128 *__return_ptr, int *, _OWORD *)@<X2>, _OWORD *a4@<X8>)
{
  __int128 v5;
  __int128 v6;

  *(double *)&v5 = sub_22899CB80(a1, a3, *a2, a2[1]);
  *a4 = v5;
  a4[1] = v6;
}

uint64_t sub_22899F1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bvh_3d, a5);
}

uint64_t sub_22899F1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899F1D4(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_bvh_custom_heuristic_3d, a6);
}

uint64_t sub_22899F1D4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t (*a6)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, unint64_t)@<X7>, uint64_t *a7@<X8>)
{
  uint64_t v8;

  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    v8 = a6(*(_QWORD *)(result + 16), result + 32, a2 + 32, *a3, a4, a5);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a7 = v8;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_22899F248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bvh_with_default_options_3d, a3);
}

void sub_22899F254(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bvh_with_options_3d, a4);
}

void sub_22899F260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_3d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bvh_with_options_3d);
}

uint64_t sub_22899F274(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bvh_with_options_3d);
}

uint64_t sub_22899F280(uint64_t a1, uint64_t a2)
{
  return sub_22899F2CC(a1, a2, (void (*)(uint64_t, char *, _QWORD *))geom_bvh_tree_statistics_3d);
}

uint64_t sub_22899F2CC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *, _QWORD *))
{
  uint64_t *v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v4 = *v3;
  v6[0] = 0;
  a3(v4, (char *)v6 + 4, v6);
  return HIDWORD(v6[0]);
}

uint64_t sub_22899F32C(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_nodes_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899BA70);
}

uint64_t sub_22899F380(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_bvh_get_primitive_partition_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B5C8);
}

_QWORD *sub_22899F3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22899F420(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))geom_bvh_get_primitives_for_node_3d);
}

_QWORD *sub_22899F420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t *))
{
  uint64_t *v4;
  uint64_t v6;
  const void *v7;
  uint64_t v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = *v4;
  v9[0] = 0;
  v7 = (const void *)a4(v6, a1, v9);
  return sub_22899B5C8(v7, v9[0]);
}

_QWORD *sub_22899F494(unsigned int *a1)
{
  uint64_t *v1;
  unsigned int v2;
  uint64_t v3;
  const void *primitives_for_node_3d;
  uint64_t v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = *v1;
  v6[0] = 0;
  primitives_for_node_3d = (const void *)geom_bvh_get_primitives_for_node_3d(v3, v2, v6);
  return sub_22899B5C8(primitives_for_node_3d, v6[0]);
}

uint64_t sub_22899F508@<X0>(__n128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, __n128 a5@<Q1>, __n128 a6@<Q3>)
{
  __n128 v7;
  __n128 v8;
  uint64_t result;
  int v10;
  char v11;
  _QWORD v12[4];

  v7 = *a1;
  v8 = a1[2];
  v12[2] = a2;
  v12[3] = a3;
  a5.n128_u64[0] = a1[1].n128_u64[0];
  a6.n128_u64[0] = a1[3].n128_u64[0];
  result = OS_geom_bvh_3d.raycast(ray:intersectFunction:)((uint64_t)sub_2289A25C4, (uint64_t)v12, v7, a5, v8, a6);
  *(_QWORD *)a4 = result;
  *(_DWORD *)(a4 + 8) = v10;
  *(_BYTE *)(a4 + 12) = v11 & 1;
  return result;
}

void sub_22899F564(uint64_t a1, _QWORD *a2, float64x2_t *a3, uint64_t a4, uint64_t a5)
{
  float64x2_t v7;
  float64x2_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[4];

  v7 = *a3;
  v8 = a3[1];
  v11[2] = a4;
  v11[3] = a5;
  *(__n128 *)a1 = OS_geom_bvh_3d.closestPoint(to:closestPointFunction:)((uint64_t)sub_2289A258C, (uint64_t)v11, v7, v8);
  *(_OWORD *)(a1 + 16) = v9;
  *a2 = v10;
}

uint64_t OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22899F850(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3f);
}

uint64_t OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899F8BC(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3f);
}

OS_geom_triangle_mesh_bvh_3f __swiftcall OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_triangle_mesh_bvh_3f)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3f);
}

OS_geom_triangle_mesh_bvh_3f __swiftcall OS_geom_triangle_mesh_bvh_3f.init(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3f options)
{
  return (OS_geom_triangle_mesh_bvh_3f)sub_22899F94C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, void *))geom_create_triangle_mesh_bvh_with_options_3f);
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3f.reinit(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3f options)
{
  sub_22899F9CC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t)options.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_recreate_triangle_mesh_bvh_with_options_3f);
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3f.reinit(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  sub_22899FA14((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_3f, (void (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, id))geom_recreate_triangle_mesh_bvh_with_options_3f);
}

unint64_t OS_geom_triangle_mesh_bvh_3f.raycast(ray:)@<X0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>, float32_t a3@<S1>, __n128 a4@<Q2>, float a5@<S3>)
{
  uint64_t v5;
  unint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int32x4_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  a2.f32[2] = a3;
  a4.n128_f32[2] = a5;
  v12[0] = 0;
  v11 = 0uLL;
  result = geom_triangle_mesh_bvh_raycast_3f(v5, (float *)v12 + 1, (unsigned int *)v12, &v11, a2, a4);
  if ((_DWORD)result)
  {
    v9 = v11.i64[1];
    v8 = v11.i64[0];
    v10 = HIDWORD(v12[0]) | ((unint64_t)LODWORD(v12[0]) << 32);
  }
  else
  {
    v10 = 0;
    v8 = 0;
    v9 = 0;
  }
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = result ^ 1;
  return result;
}

void OS_geom_triangle_mesh_bvh_3f.closestPoint(to:)(uint64_t a1@<X8>, float32x4_t a2@<Q0>)
{
  _QWORD *v2;
  __int128 v4;
  float32x4_t v5;
  unint64_t v6;
  float32x4_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v7 = 0uLL;
  *(double *)&v4 = geom_triangle_mesh_bvh_closest_point_3f(v2, (float *)v8 + 1, (unsigned int *)v8, &v7, a2);
  v5 = v7;
  v6 = HIDWORD(v8[0]) | ((unint64_t)LODWORD(v8[0]) << 32);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = 0;
  *(float32x4_t *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 48) = 0;
}

uint64_t sub_22899F738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_22899FBFC(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3f, a5);
}

uint64_t sub_22899F744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899FC68(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3f, a6);
}

uint64_t sub_22899F750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3f, a3);
}

void sub_22899F75C(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_22899FCF8(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD))geom_create_triangle_mesh_bvh_with_options_3f, a4);
}

uint64_t sub_22899F768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[48];

  OS_geom_triangle_mesh_bvh_3f.raycast(ray:)((uint64_t)v4, *(float32x4_t *)a1, COERCE_FLOAT32_T(*(_QWORD *)(a1 + 8)), *(__n128 *)(a1 + 16), COERCE_FLOAT(*(_QWORD *)(a1 + 24)));
  return sub_2289A2548((uint64_t)v4, a2, &qword_2559D38E8);
}

void sub_22899F7B8(float32x4_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  float32x4_t v4;
  _QWORD *v5;
  __int128 v6;
  float32x4_t v7;
  unint64_t v8;
  float32x4_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *v2;
  v10[0] = 0;
  v9 = 0uLL;
  *(double *)&v6 = geom_triangle_mesh_bvh_closest_point_3f(v5, (float *)v10 + 1, (unsigned int *)v10, &v9, v4);
  v7 = v9;
  v8 = HIDWORD(v10[0]) | ((unint64_t)LODWORD(v10[0]) << 32);
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = 0;
  *(float32x4_t *)(a2 + 32) = v7;
  *(_BYTE *)(a2 + 48) = 0;
}

uint64_t OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22899F850(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3d);
}

uint64_t sub_22899F850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  v5 = a5(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_22899F8BC(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3d);
}

uint64_t sub_22899F8BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v6;

  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    v6 = a6(*(_QWORD *)(result + 16), result + 32, *(_QWORD *)(a2 + 16), a2 + 32, a3, a4, a5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

OS_geom_triangle_mesh_bvh_3d __swiftcall OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_triangle_mesh_bvh_3d)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3d);
}

OS_geom_triangle_mesh_bvh_3d __swiftcall OS_geom_triangle_mesh_bvh_3d.init(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3d options)
{
  return (OS_geom_triangle_mesh_bvh_3d)sub_22899F94C((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, void *))geom_create_triangle_mesh_bvh_with_options_3d);
}

uint64_t sub_22899F94C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(_QWORD, uint64_t, unint64_t, uint64_t, void *))
{
  uint64_t v5;

  v5 = a4(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v5;
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3d.reinit(vertexPositions:triangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_bvh_create_opt_3d options)
{
  sub_22899F9CC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t)options.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t))geom_recreate_triangle_mesh_bvh_with_options_3d);
}

uint64_t sub_22899F9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v4;

  return a4(v4, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, a3);
}

Swift::Void __swiftcall OS_geom_triangle_mesh_bvh_3d.reinit(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  sub_22899FA14((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_3d, (void (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, id))geom_recreate_triangle_mesh_bvh_with_options_3d);
}

void sub_22899FA14(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, id))
{
  uint64_t v4;
  id v8;

  v8 = (id)a3();
  a4(v4, *(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, v8);

}

uint64_t OS_geom_triangle_mesh_bvh_3d.raycast(ray:)@<X0>(uint64_t a1@<X8>, __int128 a2@<Q0>, __n128 a3@<Q1>, __int128 a4@<Q2>, __int128 a5@<Q3>)
{
  uint64_t v5;
  uint64_t result;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14[4];
  int64x2_t v15;
  __int128 v16;
  unsigned int v17;
  double v18[2];

  v18[1] = *(double *)MEMORY[0x24BDAC8D0];
  v18[0] = 0.0;
  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  v14[0] = a2;
  v14[1] = (__int128)a3;
  v14[2] = a4;
  v14[3] = a5;
  result = geom_triangle_mesh_bvh_raycast_3d(v5, v14, v18, &v17, &v15, *(double *)&a2, a3);
  v8 = 0.0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  if ((_DWORD)result)
  {
    v8 = v18[0];
    v9 = v17;
    v11 = v15.i64[1];
    v10 = v15.i64[0];
    v13 = *((_QWORD *)&v16 + 1);
    v12 = v16;
  }
  *(double *)a1 = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v12;
  *(_QWORD *)(a1 + 40) = v13;
  *(_BYTE *)(a1 + 48) = result ^ 1;
  return result;
}

double OS_geom_triangle_mesh_bvh_3d.closestPoint(to:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, __n128 a3@<Q1>)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  double result;
  double v8;
  uint64_t v9;
  __int128 v10;
  int64x2_t v11;
  int64x2_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  int64x2_t v16;
  __int128 v17;
  unsigned int v18;
  double v19[2];

  v19[1] = *(double *)MEMORY[0x24BDAC8D0];
  v19[0] = 0.0;
  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v15[0] = a2;
  v15[1] = a3;
  geom_triangle_mesh_bvh_closest_point_3d(v3, v15, v19, (int *)&v18, &v16, &v12);
  v6 = v13;
  v5 = v14;
  result = *(double *)v12.i64;
  v8 = v19[0];
  v9 = v18;
  v10 = v17;
  v11 = v16;
  *(int64x2_t *)a1 = v12;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  *(double *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(int64x2_t *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 80) = 0;
  return result;
}

uint64_t sub_22899FBF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_22899FBFC(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))geom_create_triangle_mesh_bvh_3d, a5);
}

uint64_t sub_22899FBFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v7;
  uint64_t result;

  v7 = a5(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a6 = v7;
  return result;
}

uint64_t sub_22899FC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_22899FC68(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, unint64_t))geom_create_triangle_mesh_bvh_custom_heuristic_3d, a6);
}

uint64_t sub_22899FC68@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t (*a6)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, unint64_t)@<X7>, uint64_t *a7@<X8>)
{
  uint64_t v8;

  if ((a5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(a5))
  {
    v8 = a6(*(_QWORD *)(result + 16), result + 32, *(_QWORD *)(a2 + 16), a2 + 32, *a3, a4, a5);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a7 = v8;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_22899FCE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_22898B520(a1, a2, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_create_triangle_mesh_bvh_with_default_options_3d, a3);
}

void sub_22899FCEC(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_22899FCF8(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD))geom_create_triangle_mesh_bvh_with_options_3d, a4);
}

void sub_22899FCF8(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(_QWORD, uint64_t, unint64_t, uint64_t, _QWORD)@<X5>, uint64_t *a5@<X8>)
{
  void *v6;
  uint64_t v7;

  v6 = (void *)*a3;
  v7 = a4(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16) / 3uLL, a2 + 32, *a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a5 = v7;
}

uint64_t sub_22899FD74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q1>, __n128 a4@<Q3>)
{
  _BYTE v6[64];

  a3.n128_u64[0] = *(_QWORD *)(a1 + 16);
  a4.n128_u64[0] = *(_QWORD *)(a1 + 48);
  OS_geom_triangle_mesh_bvh_3d.raycast(ray:)((uint64_t)v6, *(_OWORD *)a1, a3, *(_OWORD *)(a1 + 32), *(_OWORD *)&a4);
  return sub_2289A2548((uint64_t)v6, a2, &qword_2559D38E0);
}

double sub_22899FDC8@<D0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  __int128 v4;
  __int128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  double v10;
  uint64_t v11;
  __int128 v12;
  int64x2_t v13;
  int64x2_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];
  int64x2_t v18;
  __int128 v19;
  unsigned int v20;
  double v21[2];

  v21[1] = *(double *)MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = a1[1];
  v6 = *v2;
  v21[0] = 0.0;
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v17[0] = v4;
  v17[1] = v5;
  geom_triangle_mesh_bvh_closest_point_3d(v6, v17, v21, (int *)&v20, &v18, &v14);
  v8 = v15;
  v7 = v16;
  result = *(double *)v14.i64;
  v10 = v21[0];
  v11 = v20;
  v12 = v19;
  v13 = v18;
  *(int64x2_t *)a2 = v14;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 40) = v11;
  *(int64x2_t *)(a2 + 48) = v13;
  *(_OWORD *)(a2 + 64) = v12;
  *(_BYTE *)(a2 + 80) = 0;
  return result;
}

uint64_t OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2f);
}

OS_geom_bezier_curve_bvh_2f __swiftcall OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  return (OS_geom_bezier_curve_bvh_2f)sub_2289A0090((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bezier_curve_bvh_with_default_options_2f);
}

OS_geom_bezier_curve_bvh_2f __swiftcall OS_geom_bezier_curve_bvh_2f.init(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2f options)
{
  return (OS_geom_bezier_curve_bvh_2f)sub_2289A00F0((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bezier_curve_bvh_with_options_2f);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2f.reinit(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2f options)
{
  uint64_t v3;

  geom_recreate_bezier_curve_bvh_with_options_2f(v3, *((_QWORD *)accumulatedPointCount._rawValue + 2), (unsigned int *)accumulatedPointCount._rawValue + 8, (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2f.reinit(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  sub_2289A0180((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bezier_curve_bvh_with_options_2f);
}

double OS_geom_bezier_curve_bvh_2f.closestPoint(to:)(float32x2_t a1)
{
  _QWORD *v1;
  double v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v3 = 0.0;
  return geom_bezier_curve_bvh_closest_point_2f(v1, (float *)&v4, (unsigned int *)&v3 + 1, &v3, a1);
}

uint64_t sub_22899FF4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2f, a5);
}

uint64_t sub_22899FF58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bezier_curve_bvh_with_default_options_2f, a3);
}

void sub_22899FF64(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bezier_curve_bvh_with_options_2f, a4);
}

void sub_22899FF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bezier_curve_bvh_with_options_2f);
}

uint64_t sub_22899FF84(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bezier_curve_bvh_with_options_2f);
}

void sub_22899FF90(float32x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  float32x2_t v4;
  _QWORD *v5;
  double v6;
  int v7;
  unint64_t v8;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *v2;
  v10[0] = 0;
  v9 = 0;
  v6 = geom_bezier_curve_bvh_closest_point_2f(v5, (float *)v10 + 1, (unsigned int *)v10, (double *)&v9, v4);
  v7 = v9;
  v8 = HIDWORD(v10[0]) | ((unint64_t)LODWORD(v10[0]) << 32);
  *(double *)a2 = v6;
  *(_QWORD *)(a2 + 8) = v8;
  *(_DWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 20) = 0;
}

uint64_t OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A0028(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2d);
}

uint64_t sub_2289A0028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  v5 = a5(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

OS_geom_bezier_curve_bvh_2d __swiftcall OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  return (OS_geom_bezier_curve_bvh_2d)sub_2289A0090((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bezier_curve_bvh_with_default_options_2d);
}

uint64_t sub_2289A0090(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v3;

  v3 = a3(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

OS_geom_bezier_curve_bvh_2d __swiftcall OS_geom_bezier_curve_bvh_2d.init(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2d options)
{
  return (OS_geom_bezier_curve_bvh_2d)sub_2289A00F0((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, uint64_t, void *))geom_create_bezier_curve_bvh_with_options_2d);
}

uint64_t sub_2289A00F0(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, void *))
{
  uint64_t v5;

  v5 = a4(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v5;
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2d.reinit(accumulatedPointCount:points:options:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points, OS_geom_bvh_create_opt_2d options)
{
  uint64_t v3;

  geom_recreate_bezier_curve_bvh_with_options_2d(v3, *((_QWORD *)accumulatedPointCount._rawValue + 2), (unsigned int *)accumulatedPointCount._rawValue + 8, (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

Swift::Void __swiftcall OS_geom_bezier_curve_bvh_2d.reinit(accumulatedPointCount:points:)(Swift::OpaquePointer accumulatedPointCount, Swift::OpaquePointer points)
{
  sub_2289A0180((uint64_t)accumulatedPointCount._rawValue, (uint64_t)points._rawValue, (uint64_t (*)(void))geom_create_bvh_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bezier_curve_bvh_with_options_2d);
}

void sub_2289A0180(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(uint64_t, _QWORD, uint64_t, uint64_t, id))
{
  uint64_t v4;
  id v8;

  v8 = (id)a3();
  a4(v4, *(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, v8);

}

void OS_geom_bezier_curve_bvh_2d.closestPoint(to:)(uint64_t a1@<X8>, float64x2_t a2@<Q0>)
{
  _QWORD *v2;
  double v4;
  uint64_t v5;
  double v6;
  __int128 v7;
  double v8;
  unsigned int v9;
  double v10[2];

  v10[1] = *(double *)MEMORY[0x24BDAC8D0];
  v10[0] = 0.0;
  v9 = 0;
  v8 = 0.0;
  geom_bezier_curve_bvh_closest_point_2d(v2, v10, &v9, &v8, a2);
  v4 = v10[0];
  v5 = v9;
  v6 = v8;
  *(_OWORD *)a1 = v7;
  *(double *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(double *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t sub_2289A0264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  return sub_2289A0270(a1, a2, a3, a4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))geom_create_bezier_curve_bvh_2d, a5);
}

uint64_t sub_2289A0270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  uint64_t v7;
  uint64_t result;

  v7 = a5(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, a3, a4);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a6 = v7;
  return result;
}

uint64_t sub_2289A02CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A02D8(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_bezier_curve_bvh_with_default_options_2d, a3);
}

uint64_t sub_2289A02D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD, uint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = a3(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

void sub_2289A032C(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t *a4@<X8>)
{
  sub_2289A0338(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))geom_create_bezier_curve_bvh_with_options_2d, a4);
}

void sub_2289A0338(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, _QWORD)@<X5>, uint64_t *a5@<X8>)
{
  void *v6;
  uint64_t v7;

  v6 = (void *)*a3;
  v7 = a4(*(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, *a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  *a5 = v7;
}

void sub_2289A03A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2289A03B4(a1, a2, a3, a4, (uint64_t (*)(void))geom_create_bvh_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, uint64_t, id))geom_recreate_bezier_curve_bvh_with_options_2d);
}

void sub_2289A03B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(uint64_t, _QWORD, uint64_t, uint64_t, id))
{
  uint64_t *v6;
  uint64_t v10;
  id v11;

  v10 = *v6;
  v11 = (id)a5();
  a6(v10, *(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, v11);

}

uint64_t sub_2289A0410(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  return sub_2289A041C(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))geom_recreate_bezier_curve_bvh_with_options_2d);
}

uint64_t sub_2289A041C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD))
{
  _QWORD *v6;

  return a6(*v6, *(_QWORD *)(a1 + 16), a1 + 32, a2 + 32, *a3);
}

void sub_2289A043C(float64x2_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  float64x2_t v4;
  _QWORD *v5;
  double v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  double v10;
  unsigned int v11;
  double v12[2];

  v12[1] = *(double *)MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v5 = *v2;
  v12[0] = 0.0;
  v11 = 0;
  v10 = 0.0;
  geom_bezier_curve_bvh_closest_point_2d(v5, v12, &v11, &v10, v4);
  v6 = v12[0];
  v7 = v11;
  v8 = v10;
  *(_OWORD *)a2 = v9;
  *(double *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(double *)(a2 + 32) = v8;
  *(_BYTE *)(a2 + 40) = 0;
}

uint64_t sub_2289A04CC()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_should_copy_input_data_2f(*v0);
}

uint64_t sub_2289A04E4(char a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_should_copy_input_data_2f(*v1, a1 & 1);
}

uint64_t (*sub_2289A04F4(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_2f(v3);
  return sub_2289A052C;
}

uint64_t sub_2289A052C(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_2289A053C()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_build_strategy_2f(*v0);
}

uint64_t sub_2289A0544(int a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_build_strategy_2f(*v1, a1);
}

uint64_t (*sub_2289A0550(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_2f(v3);
  return sub_2289A0588;
}

uint64_t sub_2289A0588(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2f(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_2289A0598()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_should_copy_input_data_3f(*v0);
}

uint64_t sub_2289A05B0(char a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_should_copy_input_data_3f(*v1, a1 & 1);
}

uint64_t (*sub_2289A05C0(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_3f(v3);
  return sub_2289A05F8;
}

uint64_t sub_2289A05F8(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3f(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_2289A0608()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_build_strategy_3f(*v0);
}

uint64_t sub_2289A0610(int a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_build_strategy_3f(*v1, a1);
}

uint64_t (*sub_2289A061C(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_3f(v3);
  return sub_2289A0654;
}

uint64_t sub_2289A0654(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3f(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_2289A0664()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_should_copy_input_data_2d(*v0);
}

uint64_t sub_2289A067C(char a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_should_copy_input_data_2d(*v1, a1 & 1);
}

uint64_t (*sub_2289A068C(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_2d(v3);
  return sub_2289A06C4;
}

uint64_t sub_2289A06C4(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_2d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_2289A06D4()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_build_strategy_2d(*v0);
}

uint64_t sub_2289A06DC(int a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_build_strategy_2d(*v1, a1);
}

uint64_t (*sub_2289A06E8(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_2d(v3);
  return sub_2289A0720;
}

uint64_t sub_2289A0720(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_2d(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t sub_2289A0730()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_should_copy_input_data_3d(*v0);
}

uint64_t sub_2289A0748(char a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_should_copy_input_data_3d(*v1, a1 & 1);
}

uint64_t (*sub_2289A0758(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_BYTE *)(a1 + 8) = geom_kd_tree_create_opt_get_should_copy_input_data_3d(v3);
  return sub_2289A0790;
}

uint64_t sub_2289A0790(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_should_copy_input_data_3d(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_2289A07A0()
{
  uint64_t *v0;

  return geom_kd_tree_create_opt_get_build_strategy_3d(*v0);
}

uint64_t sub_2289A07A8(int a1)
{
  uint64_t *v1;

  return geom_kd_tree_create_opt_set_build_strategy_3d(*v1, a1);
}

uint64_t (*sub_2289A07B4(uint64_t a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)a1 = *v1;
  *(_DWORD *)(a1 + 8) = geom_kd_tree_create_opt_get_build_strategy_3d(v3);
  return sub_2289A07EC;
}

uint64_t sub_2289A07EC(uint64_t a1)
{
  return geom_kd_tree_create_opt_set_build_strategy_3d(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
}

uint64_t static KDTree.rootNode.getter()
{
  return 1;
}

uint64_t static KDTree.leftChild(ofNode:)(int a1)
{
  return (2 * a1);
}

uint64_t static KDTree.rightChild(ofNode:)(int a1)
{
  return (2 * a1) | 1u;
}

uint64_t KDTree.value(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 136))(a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 104))(a1, a2, a3);
  swift_getAssociatedTypeWitness();
  sub_2289B2B28();
  return swift_unknownObjectRelease();
}

uint64_t OS_geom_kd_tree_2f.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_2289A0DDC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_2f);
}

OS_geom_kd_tree_2f __swiftcall OS_geom_kd_tree_2f.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_2f)sub_2289A0E28((uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_2f);
}

OS_geom_kd_tree_2f __swiftcall OS_geom_kd_tree_2f.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2f options)
{
  return (OS_geom_kd_tree_2f)sub_2289A0E70((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, void *))geom_create_kd_tree_with_options_2f);
}

Swift::Void __swiftcall OS_geom_kd_tree_2f.reinit(points:)(Swift::OpaquePointer points)
{
  sub_2289A0ED4((uint64_t)points._rawValue, geom_create_kd_tree_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_2f);
}

Swift::Void __swiftcall OS_geom_kd_tree_2f.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2f options)
{
  uint64_t v2;

  geom_recreate_kd_tree_with_options_2f(v2, *((const void **)points._rawValue + 2), (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_2f.points.getter()
{
  return sub_2289A0F8C(geom_kd_tree_points_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B668);
}

uint64_t sub_2289A0978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A1018(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_2f, a3);
}

uint64_t sub_2289A0984@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289A106C(a1, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_2f, a2);
}

void sub_2289A0990(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_2289A10BC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD))geom_create_kd_tree_with_options_2f, a3);
}

void sub_2289A099C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2289A1120(a1, a2, a3, geom_create_kd_tree_create_opt_2f, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_2f);
}

uint64_t sub_2289A09B0(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return geom_recreate_kd_tree_with_options_2f(*v2, *(const void **)(a1 + 16), (void *)(a1 + 32), *a2);
}

BOOL sub_2289A09C8(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_is_node_valid_2f(*v1, a1);
}

uint64_t sub_2289A09E4(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_value_index_2f(*v1, a1);
}

uint64_t sub_2289A09F0(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_split_axis_2f(*v1, a1);
}

uint64_t sub_2289A0A0C(float32x2_t *a1)
{
  uint64_t *v1;

  return geom_kd_tree_find_closest_2f(*v1, *a1);
}

uint64_t sub_2289A0A18(float32x2_t *a1, float *a2, uint64_t a3)
{
  uint64_t *v3;

  return geom_kd_tree_find_within_radius_2f(*v3, a3, *a1, *a2);
}

uint64_t sub_2289A0A2C(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_kd_tree_points_2f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B668);
}

uint64_t OS_geom_kd_tree_3f.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_2289A0DDC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_3f);
}

OS_geom_kd_tree_3f __swiftcall OS_geom_kd_tree_3f.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_3f)sub_2289A0E28((uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_3f);
}

OS_geom_kd_tree_3f __swiftcall OS_geom_kd_tree_3f.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3f options)
{
  return (OS_geom_kd_tree_3f)sub_2289A0E70((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, void *))geom_create_kd_tree_with_options_3f);
}

Swift::Void __swiftcall OS_geom_kd_tree_3f.reinit(points:)(Swift::OpaquePointer points)
{
  sub_2289A0ED4((uint64_t)points._rawValue, geom_create_kd_tree_create_opt_3f, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_3f);
}

Swift::Void __swiftcall OS_geom_kd_tree_3f.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3f options)
{
  uint64_t v2;

  geom_recreate_kd_tree_with_options_3f(v2, *((const void **)points._rawValue + 2), (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_3f.points.getter()
{
  return sub_2289A0F8C(geom_kd_tree_points_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B51C);
}

uint64_t sub_2289A0B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A1018(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_3f, a3);
}

uint64_t sub_2289A0B2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289A106C(a1, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_3f, a2);
}

void sub_2289A0B38(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_2289A10BC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD))geom_create_kd_tree_with_options_3f, a3);
}

void sub_2289A0B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2289A1120(a1, a2, a3, geom_create_kd_tree_create_opt_3f, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_3f);
}

uint64_t sub_2289A0B58(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return geom_recreate_kd_tree_with_options_3f(*v2, *(const void **)(a1 + 16), (void *)(a1 + 32), *a2);
}

BOOL sub_2289A0B70(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_is_node_valid_3f(*v1, a1);
}

uint64_t sub_2289A0B8C(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_value_index_3f(*v1, a1);
}

uint64_t sub_2289A0B98(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_split_axis_3f(*v1, a1);
}

uint64_t sub_2289A0BB4(float32x4_t *a1)
{
  uint64_t *v1;

  return geom_kd_tree_find_closest_3f(*v1, *a1);
}

uint64_t sub_2289A0BC0(float32x4_t *a1, float *a2, uint64_t a3)
{
  uint64_t *v3;

  return geom_kd_tree_find_within_radius_3f(*v3, a3, *a1, *a2);
}

uint64_t sub_2289A0BD4(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_kd_tree_points_3f, (uint64_t (*)(uint64_t, _QWORD))sub_22899B51C);
}

uint64_t OS_geom_kd_tree_2d.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_2289A0DDC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_2d);
}

OS_geom_kd_tree_2d __swiftcall OS_geom_kd_tree_2d.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_2d)sub_2289A0E28((uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_2d);
}

OS_geom_kd_tree_2d __swiftcall OS_geom_kd_tree_2d.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2d options)
{
  return (OS_geom_kd_tree_2d)sub_2289A0E70((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, void *))geom_create_kd_tree_with_options_2d);
}

Swift::Void __swiftcall OS_geom_kd_tree_2d.reinit(points:)(Swift::OpaquePointer points)
{
  sub_2289A0ED4((uint64_t)points._rawValue, geom_create_kd_tree_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_2d);
}

Swift::Void __swiftcall OS_geom_kd_tree_2d.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_2d options)
{
  uint64_t v2;

  geom_recreate_kd_tree_with_options_2d(v2, *((const void **)points._rawValue + 2), (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_2d.points.getter()
{
  return sub_2289A0F8C(geom_kd_tree_points_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899BB24);
}

uint64_t sub_2289A0CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A1018(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_2d, a3);
}

uint64_t sub_2289A0CD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289A106C(a1, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_2d, a2);
}

void sub_2289A0CE0(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_2289A10BC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD))geom_create_kd_tree_with_options_2d, a3);
}

void sub_2289A0CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2289A1120(a1, a2, a3, geom_create_kd_tree_create_opt_2d, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_2d);
}

uint64_t sub_2289A0D00(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return geom_recreate_kd_tree_with_options_2d(*v2, *(const void **)(a1 + 16), (void *)(a1 + 32), *a2);
}

BOOL sub_2289A0D18(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_is_node_valid_2d(*v1, a1);
}

uint64_t sub_2289A0D34(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_value_index_2d(*v1, a1);
}

uint64_t sub_2289A0D40(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_split_axis_2d(*v1, a1);
}

uint64_t sub_2289A0D5C(float64x2_t *a1)
{
  uint64_t *v1;

  return geom_kd_tree_find_closest_2d(*v1, *a1);
}

uint64_t sub_2289A0D68(float64x2_t *a1, double *a2, uint64_t a3)
{
  uint64_t *v3;

  return geom_kd_tree_find_within_radius_2d(*v3, a3, *a1, *a2);
}

uint64_t sub_2289A0D7C(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_kd_tree_points_2d, (uint64_t (*)(uint64_t, _QWORD))sub_22899BB24);
}

uint64_t OS_geom_kd_tree_3d.init(points:strategy:)(uint64_t a1, uint64_t a2)
{
  return sub_2289A0DDC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_3d);
}

uint64_t sub_2289A0DDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v3;

  v3 = a3(*(_QWORD *)(a1 + 16), a1 + 32, a2);
  swift_bridgeObjectRelease();
  return v3;
}

OS_geom_kd_tree_3d __swiftcall OS_geom_kd_tree_3d.init(points:)(Swift::OpaquePointer points)
{
  return (OS_geom_kd_tree_3d)sub_2289A0E28((uint64_t)points._rawValue, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_3d);
}

uint64_t sub_2289A0E28(uint64_t a1, uint64_t (*a2)(_QWORD, uint64_t))
{
  uint64_t v2;

  v2 = a2(*(_QWORD *)(a1 + 16), a1 + 32);
  swift_bridgeObjectRelease();
  return v2;
}

OS_geom_kd_tree_3d __swiftcall OS_geom_kd_tree_3d.init(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3d options)
{
  return (OS_geom_kd_tree_3d)sub_2289A0E70((uint64_t)points._rawValue, options.super.isa, (uint64_t (*)(_QWORD, uint64_t, void *))geom_create_kd_tree_with_options_3d);
}

uint64_t sub_2289A0E70(uint64_t a1, void *a2, uint64_t (*a3)(_QWORD, uint64_t, void *))
{
  uint64_t v4;

  v4 = a3(*(_QWORD *)(a1 + 16), a1 + 32, a2);
  swift_bridgeObjectRelease();

  return v4;
}

Swift::Void __swiftcall OS_geom_kd_tree_3d.reinit(points:)(Swift::OpaquePointer points)
{
  sub_2289A0ED4((uint64_t)points._rawValue, geom_create_kd_tree_create_opt_3d, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_3d);
}

void sub_2289A0ED4(uint64_t a1, uint64_t (*a2)(void), void (*a3)(uint64_t, _QWORD, uint64_t, id))
{
  uint64_t v3;
  id v6;

  v6 = (id)a2();
  a3(v3, *(_QWORD *)(a1 + 16), a1 + 32, v6);

}

Swift::Void __swiftcall OS_geom_kd_tree_3d.reinit(points:options:)(Swift::OpaquePointer points, OS_geom_kd_tree_create_opt_3d options)
{
  uint64_t v2;

  geom_recreate_kd_tree_with_options_3d(v2, *((const void **)points._rawValue + 2), (char *)points._rawValue + 32, (uint64_t)options.super.isa);
}

uint64_t OS_geom_kd_tree_3d.points.getter()
{
  return sub_2289A0F8C(geom_kd_tree_points_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B528);
}

uint64_t sub_2289A0F8C(uint64_t (*a1)(uint64_t, _QWORD *), uint64_t (*a2)(uint64_t, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v4 = a1(v2, v6);
  return a2(v4, v6[0]);
}

uint64_t sub_2289A100C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289A1018(a1, a2, (uint64_t (*)(_QWORD, uint64_t, uint64_t))geom_create_kd_tree_3d, a3);
}

uint64_t sub_2289A1018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD, uint64_t, uint64_t)@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = a3(*(_QWORD *)(a1 + 16), a1 + 32, a2);
  result = swift_bridgeObjectRelease();
  *a4 = v5;
  return result;
}

uint64_t sub_2289A1060@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289A106C(a1, (uint64_t (*)(_QWORD, uint64_t))geom_create_kd_tree_with_default_options_3d, a2);
}

uint64_t sub_2289A106C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = a2(*(_QWORD *)(a1 + 16), a1 + 32);
  result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

void sub_2289A10B0(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  sub_2289A10BC(a1, a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD))geom_create_kd_tree_with_options_3d, a3);
}

void sub_2289A10BC(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t (*a3)(_QWORD, uint64_t, _QWORD)@<X4>, uint64_t *a4@<X8>)
{
  void *v5;
  uint64_t v6;

  v5 = (void *)*a2;
  v6 = a3(*(_QWORD *)(a1 + 16), a1 + 32, *a2);
  swift_bridgeObjectRelease();

  *a4 = v6;
}

void sub_2289A110C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2289A1120(a1, a2, a3, geom_create_kd_tree_create_opt_3d, (void (*)(uint64_t, _QWORD, uint64_t, id))geom_recreate_kd_tree_with_options_3d);
}

void sub_2289A1120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(uint64_t, _QWORD, uint64_t, id))
{
  uint64_t *v5;
  uint64_t v8;
  id v9;

  v8 = *v5;
  v9 = (id)a4();
  a5(v8, *(_QWORD *)(a1 + 16), a1 + 32, v9);

}

uint64_t sub_2289A1174(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return geom_recreate_kd_tree_with_options_3d(*v2, *(const void **)(a1 + 16), (void *)(a1 + 32), *a2);
}

BOOL sub_2289A118C(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_is_node_valid_3d(*v1, a1);
}

uint64_t sub_2289A11A8(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_value_index_3d(*v1, a1);
}

uint64_t sub_2289A11B4(unsigned int a1)
{
  uint64_t *v1;

  return geom_kd_tree_get_node_split_axis_3d(*v1, a1);
}

uint64_t sub_2289A11D0(float64x2_t *a1)
{
  uint64_t *v1;
  float64x2_t v2;
  float64x2_t v3;
  uint64_t v4;
  float64x2_t v6[2];

  v2 = *a1;
  v3 = a1[1];
  v4 = *v1;
  v6[0] = v2;
  v6[1] = v3;
  return geom_kd_tree_find_closest_3d(v4, v6);
}

uint64_t sub_2289A11FC(float64x2_t *a1, double *a2, uint64_t a3)
{
  uint64_t *v3;
  float64x2_t v4;
  float64x2_t v5;
  double v6;
  uint64_t v7;
  float64x2_t v9[2];

  v4 = *a1;
  v5 = a1[1];
  v6 = *a2;
  v7 = *v3;
  v9[0] = v4;
  v9[1] = v5;
  return geom_kd_tree_find_within_radius_3d(v7, v9, a3, v6);
}

uint64_t sub_2289A122C(uint64_t a1, uint64_t a2)
{
  return sub_2289A1280(a1, a2, geom_kd_tree_points_3d, (uint64_t (*)(uint64_t, _QWORD))sub_22899B528);
}

uint64_t sub_2289A1280(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD *), uint64_t (*a4)(uint64_t, _QWORD))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = *v4;
  v9[0] = 0;
  v7 = a3(v6, v9);
  return a4(v7, v9[0]);
}

uint64_t sub_2289A12FC()
{
  return swift_deallocObject();
}

uint64_t sub_2289A130C@<X0>(unsigned int *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, double, double))(v3 + 16))(*a1, *a2, a2[1]);
  *(_DWORD *)a3 = result;
  *(_BYTE *)(a3 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_2289A1344()
{
  return swift_deallocObject();
}

void sub_2289A1354(unsigned int *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  uint64_t v3;

  *a3 = (*(double (**)(_QWORD, double))(v3 + 16))(*a1, *a2);
}

uint64_t sub_2289A1384()
{
  return swift_deallocObject();
}

uint64_t sub_2289A1394@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, __n128, float, __n128, float))(v3 + 16))(*a1, *a2, COERCE_FLOAT(a2->n128_u64[1]), a2[1], COERCE_FLOAT(a2[1].n128_u64[1]));
  *(_DWORD *)a3 = result;
  *(_BYTE *)(a3 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t sub_2289A13D4()
{
  return swift_deallocObject();
}

void sub_2289A13E4(unsigned int *a1@<X0>, __n128 *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;

  *(double *)&v5 = (*(double (**)(_QWORD, __n128))(v3 + 16))(*a1, *a2);
  *a3 = v5;
}

uint64_t sub_2289A1414()
{
  return swift_deallocObject();
}

uint64_t sub_2289A1424@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v6;

  result = (*(uint64_t (**)(_QWORD, __n128, __n128))(v3 + 16))(*a1, *a2, a2[1]);
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v6 & 1;
  return result;
}

uint64_t sub_2289A145C()
{
  return swift_deallocObject();
}

uint64_t sub_2289A146C()
{
  return swift_deallocObject();
}

uint64_t sub_2289A147C@<X0>(unsigned int *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v6;

  result = (*(uint64_t (**)(_QWORD, __n128, double, __n128, double))(v3 + 16))(*a1, *a2, a2[1].n128_f64[0], a2[2], a2[3].n128_f64[0]);
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v6 & 1;
  return result;
}

uint64_t sub_2289A14C0()
{
  return swift_deallocObject();
}

void sub_2289A14D0(unsigned int *a1@<X0>, __n128 *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;

  *(double *)&v5 = (*(double (**)(_QWORD, __n128, __n128))(v3 + 16))(*a1, *a2, a2[1]);
  *a3 = v5;
  a3[1] = v6;
}

uint64_t sub_2289A1500()
{
  return sub_22898C854(&qword_2559D2E80, (uint64_t (*)(uint64_t))type metadata accessor for BBox2f, (uint64_t)&protocol conformance descriptor for geom_bbox_2f);
}

uint64_t sub_2289A152C()
{
  return sub_22898C854(&qword_2559D2ED8, (uint64_t (*)(uint64_t))type metadata accessor for BBox3f, (uint64_t)&protocol conformance descriptor for geom_bbox_3f);
}

uint64_t sub_2289A1558()
{
  return sub_22898C854(&qword_2559D2F30, (uint64_t (*)(uint64_t))type metadata accessor for BBox2d, (uint64_t)&protocol conformance descriptor for geom_bbox_2d);
}

uint64_t sub_2289A1584()
{
  return sub_22898C854(&qword_2559D2F88, (uint64_t (*)(uint64_t))type metadata accessor for BBox3d, (uint64_t)&protocol conformance descriptor for geom_bbox_3d);
}

_UNKNOWN **sub_2289A15B0()
{
  return &protocol witness table for OS_geom_bvh_create_opt_2f;
}

uint64_t sub_2289A15BC()
{
  return sub_22898C854(&qword_2559D3160, (uint64_t (*)(uint64_t))_s3__C4NodeVMa_2, (uint64_t)&protocol conformance descriptor for geom_bvh_node_2f);
}

uint64_t sub_2289A15E8()
{
  return sub_22898C854(&qword_2559D3168, (uint64_t (*)(uint64_t))type metadata accessor for Ray2f, (uint64_t)&protocol conformance descriptor for geom_ray_2f);
}

_UNKNOWN **sub_2289A1614()
{
  return &protocol witness table for OS_geom_bvh_create_opt_3f;
}

uint64_t sub_2289A1620()
{
  return sub_22898C854(&qword_2559D3230, (uint64_t (*)(uint64_t))_s3__C4NodeVMa_1, (uint64_t)&protocol conformance descriptor for geom_bvh_node_3f);
}

uint64_t sub_2289A164C()
{
  return sub_22898C854(&qword_2559D3238, (uint64_t (*)(uint64_t))type metadata accessor for Ray3f, (uint64_t)&protocol conformance descriptor for geom_ray_3f);
}

_UNKNOWN **sub_2289A1678()
{
  return &protocol witness table for OS_geom_bvh_create_opt_2d;
}

uint64_t sub_2289A1684()
{
  return sub_22898C854(&qword_2559D3300, (uint64_t (*)(uint64_t))_s3__C4NodeVMa_0, (uint64_t)&protocol conformance descriptor for geom_bvh_node_2d);
}

uint64_t sub_2289A16B0()
{
  return sub_22898C854(&qword_2559D3308, (uint64_t (*)(uint64_t))type metadata accessor for Ray2d, (uint64_t)&protocol conformance descriptor for geom_ray_2d);
}

_UNKNOWN **sub_2289A16DC()
{
  return &protocol witness table for OS_geom_bvh_create_opt_3d;
}

uint64_t sub_2289A16E8()
{
  return sub_22898C854(&qword_2559D33D0, (uint64_t (*)(uint64_t))type metadata accessor for Node, (uint64_t)&protocol conformance descriptor for geom_bvh_node_3d);
}

uint64_t sub_2289A1714()
{
  return sub_22898C854(&qword_2559D33D8, (uint64_t (*)(uint64_t))type metadata accessor for Ray3d, (uint64_t)&protocol conformance descriptor for geom_ray_3d);
}

uint64_t sub_2289A1740(uint64_t a1)
{
  uint64_t result;

  result = sub_2289A1784(&qword_2559D34A0, &qword_2559D34A8, (uint64_t)&off_24F147B70, (uint64_t)&protocol conformance descriptor for OS_geom_bvh_3f);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A1784(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_2289A1890(255, a2);
    result = MEMORY[0x22E2B7AB8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2289A17C4(uint64_t a1)
{
  uint64_t result;

  result = sub_2289A1784(&qword_2559D34B0, &qword_2559D34B8, (uint64_t)off_24F147B68, (uint64_t)&protocol conformance descriptor for OS_geom_bvh_3d);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A1808(uint64_t a1)
{
  uint64_t result;

  result = sub_2289A1784(&qword_2559D34C0, &qword_2559D34C8, (uint64_t)off_24F1479D0, (uint64_t)&protocol conformance descriptor for OS_geom_bvh_2f);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A184C(uint64_t a1)
{
  uint64_t result;

  result = sub_2289A1784(&qword_2559D34D0, &qword_2559D34D8, (uint64_t)off_24F1479C8, (uint64_t)&protocol conformance descriptor for OS_geom_bvh_2d);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A1890(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_UNKNOWN **sub_2289A18C8()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_2f;
}

uint64_t sub_2289A18D4()
{
  return sub_2289A19A8(&qword_2559D35E0, &qword_2559D35E8, MEMORY[0x24BEE40F0]);
}

_UNKNOWN **sub_2289A1900()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_3f;
}

uint64_t sub_2289A190C()
{
  return sub_2289A19A8(&qword_2559D3680, &qword_2559D3688, MEMORY[0x24BEE4120]);
}

_UNKNOWN **sub_2289A1938()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_2d;
}

uint64_t sub_2289A1944()
{
  return sub_2289A19A8(&qword_2559D3720, &qword_2559D3728, MEMORY[0x24BEE40F0]);
}

_UNKNOWN **sub_2289A1970()
{
  return &protocol witness table for OS_geom_kd_tree_create_opt_3d;
}

uint64_t sub_2289A197C()
{
  return sub_2289A19A8(&qword_2559D37C0, &qword_2559D37C8, MEMORY[0x24BEE4120]);
}

uint64_t sub_2289A19A8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2B7AB8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_2289A19E8@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((_QWORD *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_2f.buildStrategy.getter, a1);
}

uint64_t sub_2289A19F4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899D548(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2f);
}

_QWORD *sub_2289A1A18@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((_QWORD *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_3f.buildStrategy.getter, a1);
}

_QWORD *keypath_getTm_0@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X3>, uint64_t a2@<X8>)
{
  _QWORD *result;
  int v4;
  char v5;
  uint64_t v6;
  int v7;
  char v8;

  result = a1(&v6);
  v4 = v7;
  v5 = v8;
  *(_QWORD *)a2 = v6;
  *(_DWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 12) = v5;
  return result;
}

uint64_t sub_2289A1A6C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899D548(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3f, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3f);
}

_QWORD *sub_2289A1A90@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((_QWORD *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_2d.buildStrategy.getter, a1);
}

uint64_t sub_2289A1A9C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899D548(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_2d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_2d);
}

_QWORD *sub_2289A1AC0@<X0>(uint64_t a1@<X8>)
{
  return keypath_getTm_0((_QWORD *(*)(uint64_t *__return_ptr))OS_geom_bvh_create_opt_3d.buildStrategy.getter, a1);
}

uint64_t sub_2289A1ACC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_22899D548(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))geom_bvh_create_opt_set_strategy_builtin_3d, (uint64_t (*)(uint64_t, uint64_t, _QWORD))geom_bvh_create_opt_set_strategy_custom_heuristic_3d);
}

uint64_t dispatch thunk of BVH2Node.index.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BVH2Node.right.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BVH2Node.start.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BVH2Node.range.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_2289A1B10()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = MEMORY[0x24BEE0170] + 64;
  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2289A1BA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v13;
  unsigned int v14;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
    v7 = ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  else
    v7 = 4;
  v8 = *(_DWORD *)(v5 + 80);
  v9 = v8 & 0xFC | 3;
  v10 = v8 & 0x100000;
  if (v9 > 7 || v10 != 0 || (v7 | 1) > 0x18)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v13 + ((v9 + 16) & ~v9));
    swift_retain();
  }
  else
  {
    v14 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v14 >= 2)
      v14 = *(_DWORD *)a2 + 2;
    if (v14 == 1)
    {
      (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
      *(_DWORD *)(((unint64_t)v4 + v6 + 3) & 0xFFFFFFFFFFFFFCLL) = *(_DWORD *)(((unint64_t)a2 + v6 + 3) & 0xFFFFFFFFFFFFFCLL);
      *((_BYTE *)v4 + v7) = 1;
    }
    else
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return v4;
}

_DWORD *sub_2289A1C9C(_DWORD *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = 4;
  if (((*(_QWORD *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0
    && ((*(_QWORD *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
  {
    v3 = ((*(_QWORD *)(v2 + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  v4 = *((unsigned __int8 *)result + v3);
  v5 = v3 & 0xFFFFFFFC;
  if (v4 >= 2 && v5 != 0)
    v4 = *result + 2;
  if (v4 == 1)
    return (_DWORD *)(*(uint64_t (**)(void))(v2 + 8))();
  return result;
}

_DWORD *sub_2289A1CF0(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  char v11;

  v3 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
    v7 = ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  else
    v7 = 4;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    (*(void (**)(_DWORD *, _DWORD *))(v5 + 16))(a1, a2);
    v10 = (_DWORD *)(((unint64_t)a1 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    v3 = (_DWORD *)(((unint64_t)v3 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    v11 = 1;
  }
  else
  {
    v11 = 0;
    v10 = a1;
  }
  *v10 = *v3;
  *((_BYTE *)a1 + v7) = v11;
  return a1;
}

_DWORD *sub_2289A1DA8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v11;
  _DWORD *v13;
  char v14;

  if (a1 != a2)
  {
    v4 = a2;
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
      v8 = ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
    else
      v8 = 4;
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFFC) != 0)
      v9 = *a1 + 2;
    if (v9 == 1)
      (*(void (**)(_DWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v11 = *((unsigned __int8 *)v4 + v8);
    if ((v8 & 0xFFFFFFFC) != 0 && v11 >= 2)
      v11 = *v4 + 2;
    if (v11 == 1)
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, v4, v5);
      v13 = (_DWORD *)(((unint64_t)a1 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      v4 = (_DWORD *)(((unint64_t)v4 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v13 = a1;
    }
    *v13 = *v4;
    *((_BYTE *)a1 + v8) = v14;
  }
  return a1;
}

_DWORD *sub_2289A1EAC(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  char v11;

  v3 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
    v7 = ((v6 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  else
    v7 = 4;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    (*(void (**)(_DWORD *, _DWORD *))(v5 + 32))(a1, a2);
    v10 = (_DWORD *)(((unint64_t)a1 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    v3 = (_DWORD *)(((unint64_t)v3 + v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
    v11 = 1;
  }
  else
  {
    v11 = 0;
    v10 = a1;
  }
  *v10 = *v3;
  *((_BYTE *)a1 + v7) = v11;
  return a1;
}

_DWORD *sub_2289A1F64(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v11;
  _DWORD *v13;
  char v14;

  if (a1 != a2)
  {
    v4 = a2;
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    if (((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0 && ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
      v8 = ((v7 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
    else
      v8 = 4;
    v9 = *((unsigned __int8 *)a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFFC) != 0)
      v9 = *a1 + 2;
    if (v9 == 1)
      (*(void (**)(_DWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v11 = *((unsigned __int8 *)v4 + v8);
    if ((v8 & 0xFFFFFFFC) != 0 && v11 >= 2)
      v11 = *v4 + 2;
    if (v11 == 1)
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, v4, v5);
      v13 = (_DWORD *)(((unint64_t)a1 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      v4 = (_DWORD *)(((unint64_t)v4 + v7 + 3) & 0xFFFFFFFFFFFFFFFCLL);
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v13 = a1;
    }
    *v13 = *v4;
    *((_BYTE *)a1 + v8) = v14;
  }
  return a1;
}

uint64_t sub_2289A2068(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  char v5;
  unsigned int v6;
  int v7;
  int v9;
  int v10;
  unsigned int v11;

  v3 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v3 == 4
    || ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL)
  {
    v3 = 4;
  }
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_20;
  v4 = v3 | 1;
  v5 = 8 * (v3 | 1);
  if ((v3 | 1) <= 3)
  {
    v6 = (a2 + ~(-1 << v5) - 254) >> v5;
    if (v6 > 0xFFFE)
    {
      v7 = *(_DWORD *)&a1[v4];
      if (!v7)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v6 > 0xFE)
    {
      v7 = *(unsigned __int16 *)&a1[v4];
      if (!*(_WORD *)&a1[v4])
        goto LABEL_20;
      goto LABEL_13;
    }
    if (!v6)
      goto LABEL_20;
  }
  v7 = a1[v4];
  if (!a1[v4])
  {
LABEL_20:
    v11 = a1[v3];
    if (v11 >= 2)
      return (v11 ^ 0xFF) + 1;
    else
      return 0;
  }
LABEL_13:
  v9 = (v7 - 1) << v5;
  if (v4 >= 4)
    v9 = 0;
  if ((_DWORD)v4 == 1)
    v10 = *a1;
  else
    v10 = *(_DWORD *)a1;
  return (v10 | v9) + 255;
}

void sub_2289A2140(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  v5 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v5 == 4
    || ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL)
  {
    v5 = 4;
  }
  v6 = v5 | 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = (a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6);
    if (v9 > 0xFFFE)
    {
      v7 = 4u;
    }
    else if (v9 >= 0xFF)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 != 0;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    v8 &= ~(-1 << (8 * v6));
    bzero(a1, v6);
    if ((_DWORD)v6 == 1)
    {
      *a1 = v8;
      goto LABEL_18;
    }
  }
  else
  {
    bzero(a1, v5 | 1);
  }
  *(_DWORD *)a1 = v8;
LABEL_18:
  __asm { BR              X10 }
}

uint64_t sub_2289A22D4(_DWORD *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 4;
  if (((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) != 0
    && ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) < 0xFFFFFFFFFFFFFFFCLL)
  {
    v2 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  v3 = *((unsigned __int8 *)a1 + v2);
  v4 = v2 & 0xFFFFFFFC;
  if (v3 >= 2 && v4 != 0)
    return (*a1 + 2);
  return v3;
}

void sub_2289A231C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  char v5;
  unsigned int v6;

  v4 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if (v4 == 4
    || ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) + 3) & 0xFFFFFFFFFFFFFFFCLL) >= 0xFFFFFFFFFFFFFFFCLL)
  {
    v4 = 4;
  }
  if (a2 > 1)
  {
    if ((_DWORD)v4)
      v5 = 2;
    else
      v5 = a2;
    if ((_DWORD)v4)
      v6 = a2 - 2;
    else
      v6 = 0;
    a1[v4] = v5;
    bzero(a1, v4);
    *(_DWORD *)a1 = v6;
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for BVHBuildStrategy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BVHBuildStrategy);
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BVHCreateOptions.shouldCopyInputData.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of BVHCreateOptions.minimumPrimitivesInInteriorNode.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of BVHCreateOptions.buildStrategy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 96))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of BVH2.init(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of BVH2.reinit(centroids:bboxs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of BVH2.reinit(centroids:bboxs:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of BVH2.statistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of BVH2.raycast(ray:intersectFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 176))();
}

uint64_t dispatch thunk of BVH2.closestPoint(to:closestPointFunction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 184))();
}

uint64_t _s8Geometry4BVH2P5nodess10ArraySliceVy4NodeQzGvgTj_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t _s8Geometry4BVH2P18primitivePartitions10ArraySliceVys6UInt32VGvgTj_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t _s8Geometry4BVH2P10primitives7forNodes10ArraySliceVys6UInt32VGAI_tFTj_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t _s8Geometry4BVH2P10primitives7forNodes10ArraySliceVys6UInt32VG0E0Qz_tFTj_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:heuristicFunction:minimumPrimitivesInInteriorNode:bucketCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.init(vertexPositions:triangleVertexIndices:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of TriangleMeshBVH3.raycast(ray:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:strategy:minimumPrimitivesInInteriorNode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of BezierCurveBVH2.init(accumulatedPointCount:points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of BezierCurveBVH2.reinit(accumulatedPointCount:points:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of BezierCurveBVH2.reinit(accumulatedPointCount:points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 48))();
}

uint64_t dispatch thunk of BezierCurveBVH2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.shouldCopyInputData.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of KDTreeCreateOptions.buildStrategy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of KDTree.init(points:strategy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of KDTree.init(points:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of KDTree.init(points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of KDTree.reinit(points:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of KDTree.reinit(points:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of KDTree.isNodeValid(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of KDTree.valueIndex(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of KDTree.splitAxis(atNode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of KDTree.findClosest(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of KDTree.findWithinRadius(query:radius:pointIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of KDTree.points.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_2289A2548(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_2289A258C(uint64_t a1, __n128 a2, __n128 a3)
{
  uint64_t v3;
  void (*v4)(__int128 *__return_ptr, uint64_t, _OWORD *);
  __int128 v6;
  _OWORD v7[2];

  v4 = *(void (**)(__int128 *__return_ptr, uint64_t, _OWORD *))(v3 + 16);
  v7[0] = a2;
  v7[1] = a3;
  v4(&v6, a1, v7);
  return *(double *)&v6;
}

uint64_t sub_2289A25C4(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  uint64_t v5;
  void (*v6)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v8;
  _OWORD v9[4];

  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v5 + 16);
  v9[0] = a2;
  v9[1] = a3;
  v9[2] = a4;
  v9[3] = a5;
  v6(&v8, a1, v9);
  return v8;
}

double sub_2289A2604(uint64_t a1, __n128 a2)
{
  uint64_t v2;
  void (*v3)(__int128 *__return_ptr, uint64_t, __n128 *);
  __int128 v5;
  __n128 v6;

  v3 = *(void (**)(__int128 *__return_ptr, uint64_t, __n128 *))(v2 + 16);
  v6 = a2;
  v3(&v5, a1, &v6);
  return *(double *)&v5;
}

uint64_t sub_2289A263C(uint64_t a1, __n128 a2, __n128 a3)
{
  uint64_t v3;
  void (*v4)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v6;
  _OWORD v7[2];

  v4 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v3 + 16);
  v7[0] = a2;
  v7[1] = a3;
  v4(&v6, a1, v7);
  return v6;
}

unint64_t sub_2289A2678(uint64_t a1, __n128 a2, float a3, __n128 a4, float a5)
{
  uint64_t v5;
  void (*v6)(uint64_t *__return_ptr, uint64_t, _OWORD *);
  uint64_t v8;
  _OWORD v9[2];

  v6 = *(void (**)(uint64_t *__return_ptr, uint64_t, _OWORD *))(v5 + 16);
  a2.n128_f32[2] = a3;
  a4.n128_f32[2] = a5;
  v9[0] = a2;
  v9[1] = a4;
  v6(&v8, a1, v9);
  return v8 | ((unint64_t)BYTE4(v8) << 32);
}

double sub_2289A26C8(uint64_t a1, double a2)
{
  uint64_t v2;
  void (*v3)(double *__return_ptr, uint64_t, double *);
  double v5;
  double v6;

  v3 = *(void (**)(double *__return_ptr, uint64_t, double *))(v2 + 16);
  v6 = a2;
  v3(&v5, a1, &v6);
  return v5;
}

unint64_t sub_2289A2700(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  void (*v4)(uint64_t *__return_ptr, uint64_t, _QWORD *);
  uint64_t v6;
  _QWORD v7[2];

  v4 = *(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD *))(v3 + 16);
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  v4(&v6, a1, v7);
  return v6 | ((unint64_t)BYTE4(v6) << 32);
}

OS_geom_arap_deformer_3f __swiftcall OS_geom_arap_deformer_3f.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_arap_deformer_3f)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_arap_deformer_create_3f);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3f.addConstraints(vertexPositions:vertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer vertexIndices)
{
  uint64_t v2;

  geom_arap_deformer_add_constraints_3f(v2, *((_QWORD *)vertexPositions._rawValue + 2), (__int128 *)vertexPositions._rawValue + 2, (_DWORD *)vertexIndices._rawValue + 8);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3f.addStaticConstraints(vertexIndices:)(Swift::OpaquePointer vertexIndices)
{
  uint64_t v1;

  geom_arap_deformer_add_static_constraints_3f(v1, *((_QWORD *)vertexIndices._rawValue + 2), (_DWORD *)vertexIndices._rawValue + 8);
}

OS_geom_arap_deformer_3d __swiftcall OS_geom_arap_deformer_3d.init(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return (OS_geom_arap_deformer_3d)sub_22898B4AC((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, (uint64_t (*)(_QWORD, uint64_t, unint64_t, uint64_t))geom_arap_deformer_create_3d);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3d.addConstraints(vertexPositions:vertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer vertexIndices)
{
  uint64_t v2;

  geom_arap_deformer_add_constraints_3d(v2, *((_QWORD *)vertexPositions._rawValue + 2), (__int128 *)vertexPositions._rawValue + 2, (_DWORD *)vertexIndices._rawValue + 8);
}

Swift::Void __swiftcall OS_geom_arap_deformer_3d.addStaticConstraints(vertexIndices:)(Swift::OpaquePointer vertexIndices)
{
  uint64_t v1;

  geom_arap_deformer_add_static_constraints_3d(v1, *((_QWORD *)vertexIndices._rawValue + 2), (_DWORD *)vertexIndices._rawValue + 8);
}

uint64_t static DopAxes3.axisCount.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(void))(a2 + 32))();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_2289B2B58();
  v2 = sub_2289B2B1C();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t (*sub_2289A28D4())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*sub_2289A28E4())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t (*sub_2289A28F4())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A2904(uint64_t a1)
{
  uint64_t result;

  result = sub_22898C854(&qword_2559D3980, (uint64_t (*)(uint64_t))type metadata accessor for BBox3f, (uint64_t)&protocol conformance descriptor for geom_bbox_3f);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A2940(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo12geom_bbox_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t (*sub_2289A294C())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A295C(uint64_t a1)
{
  uint64_t result;

  result = sub_22898C854(&qword_2559D39B0, (uint64_t (*)(uint64_t))type metadata accessor for BBox3d, (uint64_t)&protocol conformance descriptor for geom_bbox_3d);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289A2998(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo12geom_bbox_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A29A4(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo12geom_dop8_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A29B0(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo12geom_dop8_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A29BC(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop12_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A29C8(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop12_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A29D4(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop14_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A29E0(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop14_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A29EC(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop18_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A29F8(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop18_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A2A04(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop20_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A2A10(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop20_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A2A1C(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop26_3fa8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySfGGvgZ_0);
}

uint64_t sub_2289A2A28(uint64_t a1, uint64_t a2)
{
  return sub_2289A2A34(a1, a2, (void (*)(void))_sSo13geom_dop26_3da8GeometryE14axisDirectionss10ArraySliceVys5SIMD3VySdGGvgZ_0);
}

uint64_t sub_2289A2A34(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  a3();
  v4 = v3;
  v6 = v5;
  swift_unknownObjectRelease();
  result = (v6 >> 1) - v4;
  if (__OFSUB__(v6 >> 1, v4))
    __break(1u);
  return result;
}

double sub_2289A2A6C@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

double sub_2289A2A78(double *a1)
{
  _QWORD *v1;
  double result;

  result = *a1;
  *v1 = *(_QWORD *)a1;
  return result;
}

double sub_2289A2A84@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 8);
  *a1 = result;
  return result;
}

double sub_2289A2A90(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 8) = *a1;
  return result;
}

double sub_2289A2A9C@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 16);
  *a1 = result;
  return result;
}

double sub_2289A2AA8(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 16) = *a1;
  return result;
}

double sub_2289A2AB4@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 24);
  *a1 = result;
  return result;
}

double sub_2289A2AC0(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 24) = *a1;
  return result;
}

uint64_t (*sub_2289A2ACC())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_2289A2ADC@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = *v1;
  *a1 = *v1;
  return result;
}

__n128 sub_2289A2AE8(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  *v1 = *a1;
  return result;
}

__n128 sub_2289A2AF4@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[1];
  *a1 = result;
  return result;
}

__n128 sub_2289A2B00(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[1] = *a1;
  return result;
}

__n128 sub_2289A2B0C@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[2];
  *a1 = result;
  return result;
}

__n128 sub_2289A2B18(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[2] = *a1;
  return result;
}

__n128 sub_2289A2B24@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[3];
  *a1 = result;
  return result;
}

__n128 sub_2289A2B30(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[3] = *a1;
  return result;
}

uint64_t (*sub_2289A2B3C())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_2289A2B4C@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v1;
  __n128 result;

  result = v1[4];
  *a1 = result;
  return result;
}

__n128 sub_2289A2B58(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = *a1;
  v1[4] = *a1;
  return result;
}

uint64_t (*sub_2289A2B64())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

__n128 sub_2289A2B74@<Q0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)v1;
  v3 = *(_OWORD *)(v1 + 16);
  *a1 = *(_OWORD *)v1;
  a1[1] = v3;
  return result;
}

__n128 sub_2289A2B80(uint64_t a1)
{
  _OWORD *v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *v1 = *(_OWORD *)a1;
  v1[1] = v3;
  return result;
}

__n128 sub_2289A2B8C(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 48) = v3;
  return result;
}

__n128 sub_2289A2B98@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 64);
  v3 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_2289A2BA4(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 80) = v3;
  return result;
}

__n128 sub_2289A2BB0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 128);
  v3 = *(_OWORD *)(v1 + 144);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 sub_2289A2BBC(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 128) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 144) = v3;
  return result;
}

uint64_t (*sub_2289A2BC8())(void)
{
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

void sub_2289A2BD8(__n128 *a1@<X0>, float *a2@<X8>)
{
  sub_2289A2EA8(a1, (float (*)(__int128 *, __n128))geom_signed_distance_point_to_sphere_3f, a2);
}

void sub_2289A2BE4(_OWORD *a1@<X0>, double *a2@<X8>)
{
  sub_2289A2F64(a1, (double (*)(_OWORD *, _OWORD *))geom_signed_distance_point_to_sphere_3d, a2);
}

uint64_t sub_2289A2BF0()
{
  return sub_22898C854(&qword_2559D4040, (uint64_t (*)(uint64_t))type metadata accessor for LineSegment2f, (uint64_t)&protocol conformance descriptor for geom_line_segment_2f);
}

uint64_t sub_2289A2C1C()
{
  return sub_22898C854(&qword_2559D3168, (uint64_t (*)(uint64_t))type metadata accessor for Ray2f, (uint64_t)&protocol conformance descriptor for geom_ray_2f);
}

uint64_t sub_2289A2C48@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289A2C60(a1, (uint64_t (*)(double, double))geom_line_from_line_segment_2f, a2);
}

uint64_t sub_2289A2C54@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289A2C60(a1, (uint64_t (*)(double, double))geom_line_from_ray_2f, a2);
}

uint64_t sub_2289A2C60@<X0>(double *a1@<X0>, uint64_t (*a2)(double, double)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result;
  int v5;

  result = a2(*a1, a1[1]);
  *(_QWORD *)a3 = result;
  *(_DWORD *)(a3 + 8) = v5;
  return result;
}

float sub_2289A2C8C@<S0>(float *a1@<X8>)
{
  uint64_t v1;
  float result;

  result = *(float *)(v1 + 8);
  *a1 = result;
  return result;
}

float sub_2289A2C98(float *a1)
{
  uint64_t v1;
  float result;

  result = *a1;
  *(float *)(v1 + 8) = *a1;
  return result;
}

void sub_2289A2CA4(float32x2_t *a1@<X0>, float *a2@<X8>)
{
  uint64_t v2;

  *a2 = geom_signed_distance_point_to_line_2f(*(_QWORD *)v2, *(_DWORD *)(v2 + 8), *a1);
}

uint64_t sub_2289A2CD4()
{
  return sub_22898C854(&qword_2559D40C8, (uint64_t (*)(uint64_t))type metadata accessor for LineSegment2d, (uint64_t)&protocol conformance descriptor for geom_line_segment_2d);
}

uint64_t sub_2289A2D00()
{
  return sub_22898C854(&qword_2559D3308, (uint64_t (*)(uint64_t))type metadata accessor for Ray2d, (uint64_t)&protocol conformance descriptor for geom_ray_2d);
}

double sub_2289A2D2C@<D0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289A2D44(a1, (void (*)(__int128 *__return_ptr, __n128, __n128))geom_line_from_line_segment_2d, a2);
}

double sub_2289A2D38@<D0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289A2D44(a1, (void (*)(__int128 *__return_ptr, __n128, __n128))geom_line_from_ray_2d, a2);
}

double sub_2289A2D44@<D0>(__n128 *a1@<X0>, void (*a2)(__int128 *__return_ptr, __n128, __n128)@<X3>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  a2(&v6, *a1, a1[1]);
  result = *(double *)&v6;
  v5 = v7;
  *(_OWORD *)a3 = v6;
  *(_QWORD *)(a3 + 16) = v5;
  return result;
}

void sub_2289A2D84(float64x2_t *a1@<X0>, float64_t *a2@<X8>)
{
  uint64_t v2;
  float64x2_t v3;
  uint64_t v4;
  float64x2_t v5;
  uint64_t v6;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(float64x2_t *)v2;
  v6 = v4;
  *a2 = geom_signed_distance_point_to_line_2d(&v5, v3);
}

void sub_2289A2DC8(float32x4_t *a1@<X0>, _DWORD *a2@<X8>)
{
  float32x4_t *v2;
  double v4;

  v4 = geom_signed_distance_point_to_plane_point_normal_3f(*a1, *v2, v2[1]);
  *a2 = LODWORD(v4);
}

void sub_2289A2DF4(float64x2_t *a1@<X0>, float64_t *a2@<X8>)
{
  float64x2_t *v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8[4];
  float64x2_t v9[2];

  v3 = a1[1];
  v4 = *v2;
  v5 = v2[1];
  v6 = v2[2];
  v7 = v2[3];
  v9[0] = *a1;
  v9[1] = v3;
  v8[0] = v4;
  v8[1] = v5;
  v8[2] = v6;
  v8[3] = v7;
  *a2 = geom_signed_distance_point_to_plane_point_normal_3d(v9, v8);
}

double sub_2289A2E40@<D0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, __n128 *a3@<X8>)
{
  double result;
  unsigned __int32 v5;
  __n128 v6;
  unsigned __int32 v7;

  geom_plane_from_point_and_normal_3f(&v6, *a1, *a2);
  result = v6.n128_f64[0];
  v5 = v7;
  *a3 = v6;
  a3[1].n128_u32[0] = v5;
  return result;
}

float sub_2289A2E84@<S0>(float *a1@<X8>)
{
  uint64_t v1;
  float result;

  result = *(float *)(v1 + 16);
  *a1 = result;
  return result;
}

float sub_2289A2E90(float *a1)
{
  uint64_t v1;
  float result;

  result = *a1;
  *(float *)(v1 + 16) = *a1;
  return result;
}

void sub_2289A2E9C(__n128 *a1@<X0>, float *a2@<X8>)
{
  sub_2289A2EA8(a1, (float (*)(__int128 *, __n128))geom_signed_distance_point_to_plane_3f, a2);
}

void sub_2289A2EA8(__n128 *a1@<X0>, float (*a2)(__int128 *, __n128)@<X3>, float *a3@<X8>)
{
  __int128 *v3;
  __n128 v4;
  int v5;
  __int128 v6;
  int v7;

  v4 = *a1;
  v5 = *((_DWORD *)v3 + 4);
  v6 = *v3;
  v7 = v5;
  *a3 = a2(&v6, v4);
}

double sub_2289A2EEC@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double result;
  __int128 v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  float64x2_t v12[2];
  float64x2_t v13[2];

  v4 = a1[1];
  v5 = *a2;
  v6 = a2[1];
  v13[0] = *a1;
  v13[1] = v4;
  v12[0] = v5;
  v12[1] = v6;
  geom_plane_from_point_and_normal_3d(v13, v12, (uint64_t)v10);
  result = *(double *)v10;
  v8 = v10[1];
  v9 = v11;
  *(_OWORD *)a3 = v10[0];
  *(_OWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 32) = v9;
  return result;
}

double sub_2289A2F40@<D0>(double *a1@<X8>)
{
  uint64_t v1;
  double result;

  result = *(double *)(v1 + 32);
  *a1 = result;
  return result;
}

double sub_2289A2F4C(double *a1)
{
  uint64_t v1;
  double result;

  result = *a1;
  *(double *)(v1 + 32) = *a1;
  return result;
}

void sub_2289A2F58(_OWORD *a1@<X0>, double *a2@<X8>)
{
  sub_2289A2F64(a1, (double (*)(_OWORD *, _OWORD *))geom_signed_distance_point_to_plane_3d, a2);
}

void sub_2289A2F64(_OWORD *a1@<X0>, double (*a2)(_OWORD *, _OWORD *)@<X3>, double *a3@<X8>)
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];

  v4 = a1[1];
  v5 = *v3;
  v6 = v3[1];
  v7 = *((_QWORD *)v3 + 4);
  v10[0] = *a1;
  v10[1] = v4;
  v8[0] = v5;
  v8[1] = v6;
  v9 = v7;
  *a3 = a2(v10, v8);
}

uint64_t dispatch thunk of static DopAxes3.axisCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static DopAxes3.axisDirections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BBox3.min.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BBox3.min.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of BBox3.min.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BBox3.max.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BBox3.max.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of BBox3.max.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of OrientedBBox2.y.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of OrientedBBox2.y.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of OrientedBBox2.y.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of OrientedBBox2.halfExtents.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of Sphere3.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 72))();
}

uint64_t dispatch thunk of Triangle3.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of LineSegment2.p0.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of LineSegment2.p0.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of LineSegment2.p0.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of LineSegment2.p1.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of LineSegment2.p1.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of LineSegment2.p1.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Line2.init(colinearWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Line2.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of PlanePointNormal3.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of Plane3.init(point:normal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of Plane3.normal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Plane3.normal.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Plane3.normal.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Plane3.signedOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Plane3.signedOffset.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of Plane3.signedOffset.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of Plane3.signedDistance(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(powerBasis:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of QuadraticBezier2.init(interpolatePoints:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of QuadraticBezier2.powerBasis.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 120))();
}

uint64_t dispatch thunk of QuadraticBezier2.subdivided(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 128))();
}

uint64_t dispatch thunk of QuadraticBezier2.findRoots(withXValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of QuadraticBezier2.findRoots(withYValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of QuadraticBezier2.extract(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 160))();
}

uint64_t dispatch thunk of QuadraticBezier2.demoteToLinear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of QuadraticBezier2.normal(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of QuadraticBezier2.derivative(withOrder:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 200))();
}

uint64_t dispatch thunk of QuadraticBezier2.curvature(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of QuadraticBezier2.arcLength(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 216))();
}

uint64_t dispatch thunk of QuadraticBezier2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 224))();
}

uint64_t dispatch thunk of QuadraticBezier2.tightBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of QuadraticBezier2.orientedBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of QuadraticBezier2.orientedBBoxMatrix()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of CubicBezier2.init(elevateFrom:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of CubicBezier2.init(powerBasis:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 120))();
}

uint64_t dispatch thunk of CubicBezier2.init(interpolatePoints:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 128))();
}

uint64_t dispatch thunk of CubicBezier2.init(interpolatePoints:derivatives:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 136))();
}

uint64_t dispatch thunk of CubicBezier2.extract(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of CubicBezier2.demoteToLinear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of CubicBezier2.demoteToQuadratic()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of CubicBezier2.position(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of CubicBezier2.tangent(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of CubicBezier2.normal(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of CubicBezier2.derivative(withOrder:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 192))();
}

uint64_t dispatch thunk of CubicBezier2.curvature(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of CubicBezier2.arcLength(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 208))();
}

uint64_t dispatch thunk of CubicBezier2.fitWithQuadraticBeziers(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t dispatch thunk of CubicBezier2.subdivided(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 224))();
}

uint64_t dispatch thunk of CubicBezier2.powerBasis.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 232))();
}

uint64_t dispatch thunk of CubicBezier2.findRoots(withXValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of CubicBezier2.findRoots(withYValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of CubicBezier2.findMonotonicIntervals()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of CubicBezier2.findCharacteristicPoints()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 264))();
}

uint64_t dispatch thunk of CubicBezier2.fitWithQuadraticBezierPair(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 272))();
}

uint64_t dispatch thunk of CubicBezier2.closestPoint(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 280))();
}

uint64_t dispatch thunk of CubicBezier2.approximateClosestPoint(to:withSampleCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 288))();
}

uint64_t dispatch thunk of CubicBezier2.tightBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 296))();
}

uint64_t dispatch thunk of CubicBezier2.orientedBBox()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of CubicBezier2.orientedBBoxMatrix()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 312))();
}

float64_t geom_signed_distance_point_to_plane_3d(float64x2_t *a1, float64x2_t *a2)
{
  return a2[2].f64[0] + vmulq_f64(a1[1], a2[1]).f64[0] + vaddvq_f64(vmulq_f64(*a1, *a2));
}

float64_t geom_plane_from_point_and_normal_3d@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64_t result;

  v4 = *a1;
  v3 = a1[1];
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(a3 + 40) = 0;
  *(float64x2_t *)a3 = v5;
  *(float64x2_t *)(a3 + 16) = v6;
  result = vmulq_f64(v6, vnegq_f64(v3)).f64[0] + vaddvq_f64(vmulq_f64(v5, vnegq_f64(v4)));
  *(float64_t *)(a3 + 32) = result;
  return result;
}

float geom_signed_distance_point_to_plane_3f(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t v2;

  v2 = vmulq_f32(*a1, a2);
  return a1[1].f32[0]
       + vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0];
}

double geom_plane_from_point_and_normal_3f@<D0>(__n128 *a1@<X8>, float32x4_t a2@<Q0>, float32x4_t a3@<Q1>)
{
  float32x4_t v3;
  double result;

  a1[1].n128_u64[0] = 0;
  a1[1].n128_u64[1] = 0;
  v3 = vmulq_f32(a3, vnegq_f32(a2));
  *a1 = (__n128)a3;
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  a1[1].n128_u32[0] = LODWORD(result);
  return result;
}

float64_t geom_signed_distance_point_to_plane_point_normal_3d(float64x2_t *a1, float64x2_t *a2)
{
  return vmulq_f64(vsubq_f64(a1[1], a2[1]), a2[3]).f64[0] + vaddvq_f64(vmulq_f64(vsubq_f64(*a1, *a2), a2[2]));
}

double geom_signed_distance_point_to_plane_point_normal_3f(float32x4_t a1, float32x4_t a2, float32x4_t a3)
{
  float32x4_t v3;
  double result;

  v3 = vmulq_f32(a3, vsubq_f32(a1, a2));
  *(_QWORD *)&result = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).u64[0];
  return result;
}

float64_t geom_signed_distance_point_to_line_2d(float64x2_t *a1, float64x2_t a2)
{
  return a1[1].f64[0] + vaddvq_f64(vmulq_f64(*a1, a2));
}

double geom_line_from_ray_2d@<D0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, int64x2_t a3@<Q1>, int64x2_t a4@<Q2>)
{
  float64x2_t v4;
  float64x2_t v5;
  double result;

  *(double *)a4.i64 = -*(double *)&a3.i64[1];
  v4 = (float64x2_t)vzip1q_s64(a4, a3);
  v5 = vmulq_n_f64(v4, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v4, v4))));
  *(_QWORD *)(a1 + 24) = 0;
  *(float64x2_t *)a1 = v5;
  result = -vaddvq_f64(vmulq_f64(a2, v5));
  *(double *)(a1 + 16) = result;
  return result;
}

double geom_line_from_line_segment_2d@<D0>(uint64_t a1@<X8>, int8x16_t a2@<Q0>, int8x16_t a3@<Q1>)
{
  float64x2_t v3;
  float64x2_t v4;
  double result;

  v3 = vsubq_f64((float64x2_t)vextq_s8(a2, a3, 8uLL), (float64x2_t)vextq_s8(a3, a2, 8uLL));
  v4 = vmulq_n_f64(v3, 1.0 / sqrt(vaddvq_f64(vmulq_f64(v3, v3))));
  *(_QWORD *)(a1 + 24) = 0;
  *(float64x2_t *)a1 = v4;
  result = -vaddvq_f64(vmulq_f64((float64x2_t)a2, v4));
  *(double *)(a1 + 16) = result;
  return result;
}

float geom_signed_distance_point_to_line_2f(uint64_t a1, int a2, float32x2_t a3)
{
  return vaddv_f32(vmul_f32((float32x2_t)a1, a3)) + *(float *)&a2;
}

uint64_t geom_line_from_ray_2f(double a1, int32x2_t a2, double a3)
{
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;

  *(float *)&a3 = -*(float *)&a2.i32[1];
  v3 = (float32x2_t)vzip1_s32(*(int32x2_t *)&a3, a2);
  v4 = vmul_f32(v3, v3);
  v4.i32[0] = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
  v5 = vrsqrte_f32((float32x2_t)v4.u32[0]);
  v6 = vmul_f32(v5, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v5, v5)));
  return (uint64_t)vmul_n_f32(v3, vmul_f32(v6, vrsqrts_f32((float32x2_t)v4.u32[0], vmul_f32(v6, v6))).f32[0]);
}

uint64_t geom_line_from_line_segment_2f(int8x8_t a1, int8x8_t a2)
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;

  v2 = vsub_f32((float32x2_t)vext_s8(a1, a2, 4uLL), (float32x2_t)vext_s8(a2, a1, 4uLL));
  v3 = vmul_f32(v2, v2);
  v3.i32[0] = vadd_f32(v3, (float32x2_t)vdup_lane_s32((int32x2_t)v3, 1)).u32[0];
  v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
  v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
  return (uint64_t)vmul_n_f32(v2, vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).f32[0]);
}

double geom_signed_distance_point_to_sphere_3d(float64x2_t *a1, float64x2_t *a2)
{
  float64x2_t v2;
  float64x2_t v3;

  v2 = vsubq_f64(*a1, *a2);
  v3 = vsubq_f64(a1[1], a2[1]);
  return sqrt(vmulq_f64(v3, v3).f64[0] + vaddvq_f64(vmulq_f64(v2, v2))) - a2[2].f64[0];
}

float geom_signed_distance_point_to_sphere_3f(float32x4_t *a1, float32x4_t a2)
{
  float32x4_t v2;
  float32x4_t v3;

  v2 = vsubq_f32(a2, *a1);
  v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0])- a1[1].f32[0];
}

uint64_t sub_2289A361C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  result = a4(v4);
  if (a1 < 0 || result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = a4(v4);
  if (a3 < 0 || result < a3)
    goto LABEL_17;
  v10 = a3 - a1;
  if (a2 >= 1)
  {
    if (v10 < 0 || v10 >= a2)
      goto LABEL_12;
    return 0;
  }
  if (v10 <= 0 && v10 > a2)
    return 0;
LABEL_12:
  v12 = __OFADD__(a1, a2);
  v11 = a1 + a2;
  if (v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = a4(v4);
  if ((v11 & 0x8000000000000000) == 0 && result >= v11)
    return v11;
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_2289A36E8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_f(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3778;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3778(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AAD00);
}

uint64_t sub_2289A3784(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_d(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3814;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3814(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AADDC);
}

void sub_2289A3820(id **a1, char a2, void (*a3)(id, id, id, id, id, id))
{
  id *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = *a1;
  v5 = **a1;
  v6 = (*a1)[1];
  v7 = (*a1)[4];
  v8 = (*a1)[5];
  v9 = (*a1)[2];
  v10 = (*a1)[3];
  if ((a2 & 1) != 0)
  {
    v11 = v9;
    a3(v8, v10, v7, v5, v6, v11);

  }
  else
  {
    a3((*a1)[5], v10, v7, v5, v6, v9);
  }

  free(v4);
}

uint64_t sub_2289A38B8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_u16(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3948;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3948(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AAEB8);
}

uint64_t sub_2289A3954(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_u(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A39E4;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A39E4(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_u, (uint64_t)geom_collection_data_u, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AAF94);
}

void sub_2289A3A00(id **a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(id, id, id, id, id, id, uint64_t, uint64_t))
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = *a1;
  v9 = **a1;
  v10 = (*a1)[1];
  v11 = (*a1)[4];
  v12 = (*a1)[5];
  v13 = (*a1)[2];
  v14 = (*a1)[3];
  if ((a2 & 1) != 0)
  {
    v15 = v13;
    a5(v12, v14, v11, v9, v10, v15, a3, a4);

  }
  else
  {
    a5((*a1)[5], v14, v11, v9, v10, v13, a3, a4);
  }

  free(v8);
}

uint64_t sub_2289A3AB8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_i(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3B48;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3B48(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_i, (uint64_t)geom_collection_data_i, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AAF94);
}

uint64_t sub_2289A3B64(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_i8(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3BF4;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3BF4(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AB074);
}

uint64_t sub_2289A3C00(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_2f(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3C90;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3C90(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AB150);
}

uint64_t sub_2289A3C9C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_3f(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3D2C;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3D2C(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_3f, (uint64_t)geom_collection_data_3f, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AB22C);
}

uint64_t sub_2289A3D48(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_4f(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3DD8;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3DD8(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_4f, (uint64_t)geom_collection_data_4f, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AB22C);
}

uint64_t sub_2289A3DF4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_2d(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3E84;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3E84(id **a1, char a2)
{
  sub_2289A3820(a1, a2, (void (*)(id, id, id, id, id, id))sub_2289AB31C);
}

uint64_t sub_2289A3E90(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_3d(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3F20;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3F20(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_3d, (uint64_t)geom_collection_data_3d, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AB400);
}

uint64_t sub_2289A3F3C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v7;
  void *v8;
  uint64_t result;
  id v10;

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[4] = a3;
  v7[5] = v3;
  v7[3] = a2;
  v8 = (void *)*v3;
  result = geom_collection_size_4d(*v3);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= a3)
  {
    *v7 = a2;
    v7[1] = a3;
    v7[2] = v8;
    v10 = v8;
    return (uint64_t)sub_2289A3FCC;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_2289A3FCC(id **a1, char a2)
{
  sub_2289A3A00(a1, a2, (uint64_t)geom_collection_size_4d, (uint64_t)geom_collection_data_4d, (void (*)(id, id, id, id, id, id, uint64_t, uint64_t))sub_2289AB400);
}

_QWORD *sub_2289A3FF0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC2A8(a1, a2, a3, geom_collection_size_i, geom_collection_data_i);
}

_QWORD *sub_2289A4004(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC2A8(a1, a2, a3, geom_collection_size_u, geom_collection_data_u);
}

_QWORD *sub_2289A4020(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC4F8(a1, a2, a3, geom_collection_size_3d, geom_collection_data_3d);
}

_QWORD *sub_2289A4034(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC5D0(a1, a2, a3, geom_collection_size_3f, geom_collection_data_3f);
}

_QWORD *sub_2289A4048(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC4F8(a1, a2, a3, geom_collection_size_4d, geom_collection_data_4d);
}

_QWORD *sub_2289A405C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC5D0(a1, a2, a3, geom_collection_size_4f, geom_collection_data_4f);
}

uint64_t GeometryCollection.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a4, v6 + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 72) * a1, AssociatedTypeWitness);
}

uint64_t GeometryCollection.startIndex.getter()
{
  return 0;
}

uint64_t GeometryCollection.endIndex.getter()
{
  return sub_2289B2AE0();
}

uint64_t sub_2289A411C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = *(uint64_t *)((char *)a3 + a4 - 16);
  v7 = *(uint64_t *)((char *)a3 + a4 - 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v9);
  v11 = (char *)&v15 - v10;
  v12 = *a3;
  (*(void (**)(char *, uint64_t))(v13 + 16))((char *)&v15 - v10, a1);
  return GeometryCollection.subscript.setter((uint64_t)v11, v12, v6, v7);
}

uint64_t GeometryCollection.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t AssociatedTypeWitness;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 40))(v6 + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 72) * a2, a1, AssociatedTypeWitness);
}

uint64_t (*sub_2289A4264(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  uint64_t *v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * a2);
  return sub_2289A42AC;
}

uint64_t sub_2289A42AC(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t result;

  v1 = *a1;
  v2 = *((_DWORD *)a1 + 4);
  result = geom_collection_data_f(*(_QWORD *)a1[1]);
  *(_DWORD *)(result + 4 * v1) = v2;
  return result;
}

uint64_t (*sub_2289A42E0(_QWORD *a1, uint64_t a2))(uint64_t *a1)
{
  uint64_t *v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(geom_collection_data_d(*v2) + 8 * a2);
  return sub_2289A4328;
}

uint64_t sub_2289A4328(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = a1[1];
  v2 = *a1;
  result = geom_collection_data_d(*(_QWORD *)a1[2]);
  *(_QWORD *)(result + 8 * v1) = v2;
  return result;
}

uint64_t (*sub_2289A435C(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  uint64_t *v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(geom_collection_data_u16(*v2) + 2 * a2);
  return sub_2289A43A4;
}

uint64_t sub_2289A43A4(uint64_t *a1)
{
  uint64_t v1;
  __int16 v2;
  uint64_t result;

  v1 = *a1;
  v2 = *((_WORD *)a1 + 8);
  result = geom_collection_data_u16(*(_QWORD *)a1[1]);
  *(_WORD *)(result + 2 * v1) = v2;
  return result;
}

uint64_t (*sub_2289A43D0(uint64_t a1, uint64_t a2))(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_u(*v2) + 4 * a2);
  return sub_2289A4418;
}

uint64_t sub_2289A4418(uint64_t *a1, uint64_t a2)
{
  return sub_2289A4478(a1, a2, geom_collection_data_u);
}

uint64_t (*sub_2289A4424(uint64_t a1, uint64_t a2))(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(geom_collection_data_i(*v2) + 4 * a2);
  return sub_2289A446C;
}

uint64_t sub_2289A446C(uint64_t *a1, uint64_t a2)
{
  return sub_2289A4478(a1, a2, geom_collection_data_i);
}

uint64_t sub_2289A4478(uint64_t *a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  int v4;
  uint64_t result;

  v3 = *a1;
  v4 = *((_DWORD *)a1 + 4);
  result = a3(*(_QWORD *)a1[1]);
  *(_DWORD *)(result + 4 * v3) = v4;
  return result;
}

uint64_t (*sub_2289A44A4(uint64_t a1, uint64_t a2))(uint64_t *a1)
{
  uint64_t *v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(geom_collection_data_i8(*v2) + a2);
  return sub_2289A44EC;
}

uint64_t sub_2289A44EC(uint64_t *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v1 = *a1;
  v2 = *((_BYTE *)a1 + 16);
  result = geom_collection_data_i8(*(_QWORD *)a1[1]);
  *(_BYTE *)(result + v1) = v2;
  return result;
}

uint64_t (*sub_2289A4518(_QWORD *a1, uint64_t a2))(uint64_t *a1)
{
  uint64_t *v2;

  a1[1] = a2;
  a1[2] = v2;
  *a1 = *(_QWORD *)(geom_collection_data_2f(*v2) + 8 * a2);
  return sub_2289A4560;
}

uint64_t sub_2289A4560(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = a1[1];
  v2 = *a1;
  result = geom_collection_data_2f(*(_QWORD *)a1[2]);
  *(_QWORD *)(result + 8 * v1) = v2;
  return result;
}

void (*sub_2289A4594(_QWORD *a1, uint64_t a2))(__int128 **a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v5;

  v5 = malloc(0x20uLL);
  *a1 = v5;
  v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)v5 = *(_OWORD *)(geom_collection_data_3f(*v2) + 16 * a2);
  return sub_2289A45EC;
}

void sub_2289A45EC(__int128 **a1, uint64_t a2)
{
  sub_2289A465C(a1, a2, geom_collection_data_3f);
}

void (*sub_2289A45F8(_QWORD *a1, uint64_t a2))(__int128 **a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v5;

  v5 = malloc(0x20uLL);
  *a1 = v5;
  v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)v5 = *(_OWORD *)(geom_collection_data_4f(*v2) + 16 * a2);
  return sub_2289A4650;
}

void sub_2289A4650(__int128 **a1, uint64_t a2)
{
  sub_2289A465C(a1, a2, geom_collection_data_4f);
}

void sub_2289A465C(__int128 **a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  __int128 *v3;
  uint64_t v4;
  __int128 v5;

  v3 = *a1;
  v4 = *((_QWORD *)*a1 + 2);
  v5 = **a1;
  *(_OWORD *)(a3(**((_QWORD **)*a1 + 3)) + 16 * v4) = v5;
  free(v3);
}

void (*sub_2289A46A0(_QWORD *a1, uint64_t a2))(__int128 **a1)
{
  uint64_t *v2;
  _QWORD *v5;

  v5 = malloc(0x20uLL);
  *a1 = v5;
  v5[2] = a2;
  v5[3] = v2;
  *(_OWORD *)v5 = *(_OWORD *)(geom_collection_data_2d(*v2) + 16 * a2);
  return sub_2289A46F8;
}

void sub_2289A46F8(__int128 **a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 v3;

  v1 = *a1;
  v2 = *((_QWORD *)*a1 + 2);
  v3 = **a1;
  *(_OWORD *)(geom_collection_data_2d(**((_QWORD **)*a1 + 3)) + 16 * v2) = v3;
  free(v1);
}

void (*sub_2289A473C(_QWORD *a1, uint64_t a2))(__int128 **a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v5;
  _OWORD *v6;
  __int128 v7;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  v6 = (_OWORD *)(geom_collection_data_3d(*v2) + 32 * a2);
  v7 = v6[1];
  *(_OWORD *)v5 = *v6;
  *((_OWORD *)v5 + 1) = v7;
  return sub_2289A4798;
}

void sub_2289A4798(__int128 **a1, uint64_t a2)
{
  sub_2289A480C(a1, a2, geom_collection_data_3d);
}

void (*sub_2289A47A4(_QWORD *a1, uint64_t a2))(__int128 **a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v5;
  _OWORD *v6;
  __int128 v7;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = a2;
  v5[5] = v2;
  v6 = (_OWORD *)(geom_collection_data_4d(*v2) + 32 * a2);
  v7 = v6[1];
  *(_OWORD *)v5 = *v6;
  *((_OWORD *)v5 + 1) = v7;
  return sub_2289A4800;
}

void sub_2289A4800(__int128 **a1, uint64_t a2)
{
  sub_2289A480C(a1, a2, geom_collection_data_4d);
}

void sub_2289A480C(__int128 **a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  __int128 *v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;

  v3 = *a1;
  v4 = *((_QWORD *)*a1 + 4);
  v6 = (*a1)[1];
  v7 = **a1;
  v5 = (_OWORD *)(a3(**((_QWORD **)*a1 + 5)) + 32 * v4);
  *v5 = v7;
  v5[1] = v6;
  free(v3);
}

void (*GeometryCollection.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t **a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  size_t v12;
  void *v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v13 = malloc(v12);
  v9[7] = v13;
  GeometryCollection.subscript.getter(a2, a3, a4, (uint64_t)v13);
  return sub_2289A4920;
}

void sub_2289A4920(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = (void *)(*a1)[6];
  v4 = (void *)(*a1)[7];
  if ((a2 & 1) != 0)
  {
    v5 = v2[4];
    v6 = v2[5];
    v7 = v2[2];
    v9 = *v2;
    v8 = v2[1];
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[6], v4, v5);
    GeometryCollection.subscript.setter((uint64_t)v3, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    GeometryCollection.subscript.setter((*a1)[7], *v2, v2[1], v2[2]);
  }
  free(v4);
  free(v3);
  free(v2);
}

Swift::Int __swiftcall GeometryCollection.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

_QWORD *sub_2289A49E0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_f();
  *a1 = result;
  return result;
}

uint64_t sub_2289A4A04()
{
  uint64_t *v0;

  return geom_collection_data_f(*v0);
}

float sub_2289A4A0C@<S0>(uint64_t a1@<X0>, float *a2@<X8>)
{
  uint64_t *v2;
  float result;

  result = *(float *)(geom_collection_data_f(*v2) + 4 * a1);
  *a2 = result;
  return result;
}

void sub_2289A4A44(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_f(*v1, a1);
}

void (*sub_2289A4A50(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_f(v3);
  return sub_2289A4A88;
}

void sub_2289A4A88(uint64_t a1)
{
  geom_collection_resize_f(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A4A94(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D43C0, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
  result = sub_2289A1784(&qword_2559D43D0, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A4B08()
{
  return sub_2289A1784(&qword_2559D43D8, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
}

unint64_t sub_2289A4B40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D43E0;
  if (!qword_2559D43E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D43E8);
    v2 = sub_2289A1784(&qword_2559D43D0, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D43E0);
  }
  return result;
}

_QWORD *sub_2289A4BC4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_f, a3);
}

uint64_t sub_2289A4BD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_f, a4);
}

uint64_t sub_2289A4BDC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_f);
}

uint64_t sub_2289A4BE8()
{
  return sub_2289A1784(&qword_2559D43F0, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
}

unint64_t sub_2289A4C20()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D43F8;
  if (!qword_2559D43F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D43E8);
    v2 = sub_2289A1784(&qword_2559D43C0, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D43F8);
  }
  return result;
}

uint64_t sub_2289A4CA4(int *a1, uint64_t *a2)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_f(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A4CD8(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A4264((uint64_t)v4, *a2);
  return sub_228993248;
}

void sub_2289A4D24(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AAD00);
}

uint64_t (*sub_2289A4D30(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A36E8(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A4D7C@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289AB500(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t *sub_2289A4DA4(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  v3 = *result;
  v4 = *a2;
  if (*result != *a2)
  {
    v5 = *v2;
    v6 = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * v3);
    v7 = 4 * v4;
    v8 = *(_DWORD *)(geom_collection_data_f(v5) + v7);
    *(_DWORD *)(geom_collection_data_f(v5) + 4 * v3) = v8;
    result = (uint64_t *)geom_collection_data_f(v5);
    *(_DWORD *)((char *)result + v7) = v6;
  }
  return result;
}

uint64_t sub_2289A4E18()
{
  sub_2289A1890(0, &qword_2559D43C8);
  return sub_2289B2A38();
}

uint64_t sub_2289A4E90()
{
  sub_2289A1890(0, &qword_2559D43C8);
  return sub_2289B2A2C();
}

unint64_t sub_2289A4F0C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4400;
  if (!qword_2559D4400)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D43E8);
    v2 = sub_2289A1784(&qword_2559D43D8, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4400);
  }
  return result;
}

_QWORD *sub_2289A4F90@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_f, a2);
}

uint64_t *sub_2289A4F9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_f);
}

uint64_t sub_2289A4FA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t a5@<X8>)
{
  uint64_t result;
  char v7;

  result = sub_2289A361C(*a1, a2, *a3, a4);
  *(_QWORD *)a5 = result;
  *(_BYTE *)(a5 + 8) = v7 & 1;
  return result;
}

uint64_t sub_2289A4FE4()
{
  return sub_2289A1784(&qword_2559D4408, &qword_2559D43C8, (uint64_t)off_24F147A50, (uint64_t)&protocol conformance descriptor for OS_geom_collection_f);
}

uint64_t sub_2289A5018()
{
  return sub_2289A19A8(&qword_2559D4410, &qword_2559D43E8, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A5044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A506C(_DWORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_f(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A50B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_f, a2);
}

uint64_t sub_2289A50BC@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_f, a1);
}

uint64_t sub_2289A50C8()
{
  uint64_t *v0;

  return geom_collection_size_f(*v0);
}

uint64_t sub_2289A50DC()
{
  return sub_2289A19A8(&qword_2559D4418, &qword_2559D4420, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A5108(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_f, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A513C()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899AF3C(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A516C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC1E8(a1, a2, a3);
}

uint64_t sub_2289A518C()
{
  sub_2289A1890(0, &qword_2559D43C8);
  return sub_2289B2A68();
}

_QWORD *sub_2289A5204@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_d();
  *a1 = result;
  return result;
}

uint64_t sub_2289A5228()
{
  uint64_t *v0;

  return geom_collection_data_d(*v0);
}

double sub_2289A5230@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t *v2;
  double result;

  result = *(double *)(geom_collection_data_d(*v2) + 8 * a1);
  *a2 = result;
  return result;
}

void sub_2289A5268(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_d(*v1, a1);
}

void (*sub_2289A5274(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_d(v3);
  return sub_2289A52AC;
}

void sub_2289A52AC(uint64_t a1)
{
  geom_collection_resize_d(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A52B8(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4428, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
  result = sub_2289A1784(&qword_2559D4438, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A532C()
{
  return sub_2289A1784(&qword_2559D4440, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
}

unint64_t sub_2289A5364()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4448;
  if (!qword_2559D4448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4450);
    v2 = sub_2289A1784(&qword_2559D4438, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4448);
  }
  return result;
}

_QWORD *sub_2289A53E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_d, a3);
}

uint64_t sub_2289A53F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_d, a4);
}

uint64_t sub_2289A5400(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_d);
}

uint64_t sub_2289A540C()
{
  return sub_2289A1784(&qword_2559D4458, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
}

unint64_t sub_2289A5444()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4460;
  if (!qword_2559D4460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4450);
    v2 = sub_2289A1784(&qword_2559D4428, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4460);
  }
  return result;
}

uint64_t sub_2289A54C8(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_d(*v2);
  *(_QWORD *)(result + 8 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A54FC(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A42E0(v4, *a2);
  return sub_228993248;
}

void sub_2289A5548(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AADDC);
}

void sub_2289A5554(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  id v6;

  v6 = (id)a1[2];
  a5(v5, *a2, a2[1], *a1, a1[1]);

}

uint64_t (*sub_2289A5590(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3784(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A55DC@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289AB64C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t *sub_2289A5604(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v4 = *a2;
  if (*result != *a2)
  {
    v5 = *v2;
    v6 = *(_QWORD *)(geom_collection_data_d(*v2) + 8 * v3);
    v7 = v4;
    v8 = *(_QWORD *)(geom_collection_data_d(v5) + v7 * 8);
    *(_QWORD *)(geom_collection_data_d(v5) + 8 * v3) = v8;
    result = (uint64_t *)geom_collection_data_d(v5);
    result[v7] = v6;
  }
  return result;
}

uint64_t sub_2289A5678()
{
  sub_2289A1890(0, &qword_2559D4430);
  return sub_2289B2A38();
}

uint64_t sub_2289A56F0()
{
  sub_2289A1890(0, &qword_2559D4430);
  return sub_2289B2A2C();
}

unint64_t sub_2289A576C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4468;
  if (!qword_2559D4468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4450);
    v2 = sub_2289A1784(&qword_2559D4440, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4468);
  }
  return result;
}

_QWORD *sub_2289A57F0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_d, a2);
}

uint64_t *sub_2289A57FC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_d);
}

uint64_t sub_2289A5808()
{
  return sub_2289A1784(&qword_2559D4470, &qword_2559D4430, (uint64_t)off_24F147A48, (uint64_t)&protocol conformance descriptor for OS_geom_collection_d);
}

uint64_t sub_2289A583C()
{
  return sub_2289A19A8(&qword_2559D4478, &qword_2559D4450, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A5868@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_d(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A5890(_QWORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_QWORD *)(geom_collection_data_d(*v2) + 8 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A58D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_d, a2);
}

uint64_t sub_2289A58E0@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_d, a1);
}

uint64_t sub_2289A58EC()
{
  uint64_t *v0;

  return geom_collection_size_d(*v0);
}

_QWORD *sub_2289A58F4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_2289A590C(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

uint64_t sub_2289A5924()
{
  return sub_2289A19A8(&qword_2559D4480, &qword_2559D4488, MEMORY[0x24BEE2C18]);
}

void sub_2289A5950(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_2289A595C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_d, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A5990()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899AF20(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A59C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC128(a1, a2, a3);
}

uint64_t sub_2289A59E0()
{
  sub_2289A1890(0, &qword_2559D4430);
  return sub_2289B2A68();
}

_QWORD *sub_2289A5A58@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_u16();
  *a1 = result;
  return result;
}

uint64_t sub_2289A5A7C()
{
  uint64_t *v0;

  return geom_collection_data_u16(*v0);
}

uint64_t sub_2289A5A84@<X0>(uint64_t a1@<X0>, _WORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = geom_collection_data_u16(*v2);
  *a2 = *(_WORD *)(result + 2 * a1);
  return result;
}

void sub_2289A5ABC(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_u16(*v1, a1);
}

void (*sub_2289A5AC8(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_u16(v3);
  return sub_2289A5B00;
}

void sub_2289A5B00(uint64_t a1)
{
  geom_collection_resize_u16(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A5B0C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4490, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
  result = sub_2289A1784(&qword_2559D44A0, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A5B80()
{
  return sub_2289A1784(&qword_2559D44A8, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
}

unint64_t sub_2289A5BB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D44B0;
  if (!qword_2559D44B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D44B8);
    v2 = sub_2289A1784(&qword_2559D44A0, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D44B0);
  }
  return result;
}

_QWORD *sub_2289A5C3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_u16, a3);
}

uint64_t sub_2289A5C48@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_u16, a4);
}

uint64_t sub_2289A5C54(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_u16);
}

uint64_t sub_2289A5C60()
{
  return sub_2289A1784(&qword_2559D44C0, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
}

unint64_t sub_2289A5C98()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D44C8;
  if (!qword_2559D44C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D44B8);
    v2 = sub_2289A1784(&qword_2559D4490, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D44C8);
  }
  return result;
}

uint64_t sub_2289A5D1C(__int16 *a1, uint64_t *a2)
{
  uint64_t *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_u16(*v2);
  *(_WORD *)(result + 2 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A5D50(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A435C((uint64_t)v4, *a2);
  return sub_228993248;
}

void sub_2289A5D9C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AAEB8);
}

uint64_t (*sub_2289A5DA8(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A38B8(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A5DF4@<X0>(uint64_t (*a1)(__int16 *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289AB798(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t *sub_2289A5E1C(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;

  v3 = *result;
  v4 = *a2;
  if (*result != *a2)
  {
    v5 = *v2;
    v6 = geom_collection_data_u16(*v2);
    v7 = 2 * v3;
    v8 = *(_WORD *)(v6 + 2 * v3);
    v9 = 2 * v4;
    v10 = *(_WORD *)(geom_collection_data_u16(v5) + v9);
    *(_WORD *)(geom_collection_data_u16(v5) + v7) = v10;
    result = (uint64_t *)geom_collection_data_u16(v5);
    *(_WORD *)((char *)result + v9) = v8;
  }
  return result;
}

uint64_t sub_2289A5E90()
{
  sub_2289A1890(0, &qword_2559D4498);
  return sub_2289B2A38();
}

uint64_t sub_2289A5F08()
{
  sub_2289A1890(0, &qword_2559D4498);
  return sub_2289B2A2C();
}

unint64_t sub_2289A5F84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D44D0;
  if (!qword_2559D44D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D44B8);
    v2 = sub_2289A1784(&qword_2559D44A8, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D44D0);
  }
  return result;
}

_QWORD *sub_2289A6008@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_u16, a2);
}

uint64_t *sub_2289A6014(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_u16);
}

uint64_t sub_2289A6020()
{
  return sub_2289A1784(&qword_2559D44D8, &qword_2559D4498, (uint64_t)off_24F147A70, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u16);
}

uint64_t sub_2289A6054()
{
  return sub_2289A19A8(&qword_2559D44E0, &qword_2559D44B8, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A6080@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_u16(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A60A8(_WORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_WORD *)(geom_collection_data_u16(*v2) + 2 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A60EC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_u16, a2);
}

uint64_t sub_2289A60F8@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_u16, a1);
}

uint64_t sub_2289A6104()
{
  uint64_t *v0;

  return geom_collection_size_u16(*v0);
}

uint64_t sub_2289A610C()
{
  return sub_2289A19A8(&qword_2559D44E8, &qword_2559D44F0, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A6138(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_u16, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A616C()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B454(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A619C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC75C(a1, a2, a3);
}

uint64_t sub_2289A61BC()
{
  sub_2289A1890(0, &qword_2559D4498);
  return sub_2289B2A68();
}

_QWORD *sub_2289A6234@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_u();
  *a1 = result;
  return result;
}

uint64_t sub_2289A6258()
{
  uint64_t *v0;

  return geom_collection_data_u(*v0);
}

uint64_t sub_2289A6260@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = geom_collection_data_u(*v2);
  *a2 = *(_DWORD *)(result + 4 * a1);
  return result;
}

void sub_2289A6298(std::vector<int>::size_type a1)
{
  uint64_t *v1;

  geom_collection_resize_u(*v1, a1);
}

void (*sub_2289A62A4(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_u(v3);
  return sub_2289A62DC;
}

void sub_2289A62DC(uint64_t a1)
{
  geom_collection_resize_u(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A62E8(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D44F8, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
  result = sub_2289A1784(&qword_2559D4508, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A635C()
{
  return sub_2289A1784(&qword_2559D4510, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
}

unint64_t sub_2289A6394()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4518;
  if (!qword_2559D4518)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4520);
    v2 = sub_2289A1784(&qword_2559D4508, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4518);
  }
  return result;
}

_QWORD *sub_2289A6418@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_u, a3);
}

uint64_t sub_2289A6424@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_u, a4);
}

uint64_t sub_2289A6430(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_u);
}

uint64_t sub_2289A643C()
{
  return sub_2289A1784(&qword_2559D4528, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
}

unint64_t sub_2289A6474()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4530;
  if (!qword_2559D4530)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4520);
    v2 = sub_2289A1784(&qword_2559D44F8, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4530);
  }
  return result;
}

uint64_t sub_2289A64F8(int *a1, uint64_t *a2)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_u(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A652C(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A43D0((uint64_t)v4, *a2);
  return sub_228993248;
}

void sub_2289A6578(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_u, (uint64_t)geom_collection_data_u, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AAF94);
}

void sub_2289A6594(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  id v8;

  v8 = (id)a1[2];
  a7(v7, *a2, a2[1], *a1, a1[1]);

}

uint64_t (*sub_2289A65D8(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3954(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A6624@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289AB8E4(a1, a2, geom_collection_size_u, geom_collection_data_u);
  if (!v3)
    *a3 = result;
  return result;
}

_QWORD *sub_2289A665C(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A6E0C(a1, a2, a3, a4, geom_collection_data_u);
}

uint64_t sub_2289A6668()
{
  sub_2289A1890(0, &qword_2559D4500);
  return sub_2289B2A38();
}

uint64_t sub_2289A66E0()
{
  sub_2289A1890(0, &qword_2559D4500);
  return sub_2289B2A2C();
}

unint64_t sub_2289A675C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4538;
  if (!qword_2559D4538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4520);
    v2 = sub_2289A1784(&qword_2559D4510, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4538);
  }
  return result;
}

_QWORD *sub_2289A67E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_u, a2);
}

uint64_t *sub_2289A67EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_u);
}

uint64_t sub_2289A67F8()
{
  return sub_2289A1784(&qword_2559D4540, &qword_2559D4500, (uint64_t)off_24F147A68, (uint64_t)&protocol conformance descriptor for OS_geom_collection_u);
}

uint64_t sub_2289A682C()
{
  return sub_2289A19A8(&qword_2559D4548, &qword_2559D4520, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A6858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_u(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A6880(_DWORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_u(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A68C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_u, a2);
}

uint64_t sub_2289A68D0@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_u, a1);
}

uint64_t sub_2289A68DC()
{
  uint64_t *v0;

  return geom_collection_size_u(*v0);
}

uint64_t sub_2289A68E4()
{
  return sub_2289A19A8(&qword_2559D4550, &qword_2559D4558, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A6910(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_u, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A6944()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899AF74(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289A6974(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC2A8(a1, a2, a3, geom_collection_size_u, geom_collection_data_u);
}

uint64_t sub_2289A69A4()
{
  sub_2289A1890(0, &qword_2559D4500);
  return sub_2289B2A68();
}

_QWORD *sub_2289A6A1C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_i();
  *a1 = result;
  return result;
}

uint64_t sub_2289A6A40()
{
  uint64_t *v0;

  return geom_collection_data_i(*v0);
}

uint64_t sub_2289A6A48@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = geom_collection_data_i(*v2);
  *a2 = *(_DWORD *)(result + 4 * a1);
  return result;
}

void sub_2289A6A80(std::vector<int>::size_type a1)
{
  uint64_t *v1;

  geom_collection_resize_i(*v1, a1);
}

void (*sub_2289A6A8C(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_i(v3);
  return sub_2289A6AC4;
}

void sub_2289A6AC4(uint64_t a1)
{
  geom_collection_resize_i(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A6AD0(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4560, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
  result = sub_2289A1784(&qword_2559D4570, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A6B44()
{
  return sub_2289A1784(&qword_2559D4578, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
}

unint64_t sub_2289A6B7C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4580;
  if (!qword_2559D4580)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4588);
    v2 = sub_2289A1784(&qword_2559D4570, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4580);
  }
  return result;
}

_QWORD *sub_2289A6C00@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_i, a3);
}

uint64_t sub_2289A6C0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_i, a4);
}

uint64_t sub_2289A6C18(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_i);
}

uint64_t sub_2289A6C24()
{
  return sub_2289A1784(&qword_2559D4590, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
}

unint64_t sub_2289A6C5C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4598;
  if (!qword_2559D4598)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4588);
    v2 = sub_2289A1784(&qword_2559D4560, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4598);
  }
  return result;
}

uint64_t sub_2289A6CE0(int *a1, uint64_t *a2)
{
  uint64_t *v2;
  int v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_i(*v2);
  *(_DWORD *)(result + 4 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A6D14(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A4424((uint64_t)v4, *a2);
  return sub_228993248;
}

void sub_2289A6D60(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_i, (uint64_t)geom_collection_data_i, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AAF94);
}

uint64_t (*sub_2289A6D7C(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3AB8(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A6DC8@<X0>(uint64_t (*a1)(int *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289AB8E4(a1, a2, geom_collection_size_i, geom_collection_data_i);
  if (!v3)
    *a3 = result;
  return result;
}

_QWORD *sub_2289A6E00(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289A6E0C(a1, a2, a3, a4, geom_collection_data_i);
}

_QWORD *sub_2289A6E0C(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;

  v6 = *a2;
  if (*result != *a2)
  {
    v8 = *v5;
    v9 = 4 * *result;
    v10 = *(_DWORD *)(a5(v8) + v9);
    v11 = 4 * v6;
    v12 = *(_DWORD *)(a5(v8) + v11);
    *(_DWORD *)(a5(v8) + v9) = v12;
    result = (_QWORD *)a5(v8);
    *(_DWORD *)((char *)result + v11) = v10;
  }
  return result;
}

uint64_t sub_2289A6E84()
{
  sub_2289A1890(0, &qword_2559D4568);
  return sub_2289B2A38();
}

uint64_t sub_2289A6EFC()
{
  sub_2289A1890(0, &qword_2559D4568);
  return sub_2289B2A2C();
}

unint64_t sub_2289A6F78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D45A0;
  if (!qword_2559D45A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4588);
    v2 = sub_2289A1784(&qword_2559D4578, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D45A0);
  }
  return result;
}

_QWORD *sub_2289A6FFC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_i, a2);
}

uint64_t *sub_2289A7008(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_i);
}

uint64_t sub_2289A7014()
{
  return sub_2289A1784(&qword_2559D45A8, &qword_2559D4568, (uint64_t)off_24F147A58, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i);
}

uint64_t sub_2289A7048()
{
  return sub_2289A19A8(&qword_2559D45B0, &qword_2559D4588, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A7074@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_i(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A709C(_DWORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_DWORD *)(geom_collection_data_i(*v2) + 4 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A70E0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_i, a2);
}

uint64_t sub_2289A70EC@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_i, a1);
}

uint64_t sub_2289A70F8()
{
  uint64_t *v0;

  return geom_collection_size_i(*v0);
}

uint64_t sub_2289A7100()
{
  return sub_2289A19A8(&qword_2559D45B8, &qword_2559D45C0, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A712C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_i, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A7160()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899AF58(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289A7190(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC2A8(a1, a2, a3, geom_collection_size_i, geom_collection_data_i);
}

uint64_t sub_2289A71C0()
{
  sub_2289A1890(0, &qword_2559D4568);
  return sub_2289B2A68();
}

_QWORD *sub_2289A7238@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_i8();
  *a1 = result;
  return result;
}

uint64_t sub_2289A725C()
{
  uint64_t *v0;

  return geom_collection_data_i8(*v0);
}

uint64_t sub_2289A7264@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = geom_collection_data_i8(*v2);
  *a2 = *(_BYTE *)(result + a1);
  return result;
}

void sub_2289A729C(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_i8(*v1, a1);
}

void (*sub_2289A72A8(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_i8(v3);
  return sub_2289A72E0;
}

void sub_2289A72E0(uint64_t a1)
{
  geom_collection_resize_i8(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A72EC(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D45C8, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
  result = sub_2289A1784(&qword_2559D45D8, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A7360()
{
  return sub_2289A1784(&qword_2559D45E0, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
}

unint64_t sub_2289A7398()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D45E8;
  if (!qword_2559D45E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D45F0);
    v2 = sub_2289A1784(&qword_2559D45D8, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D45E8);
  }
  return result;
}

_QWORD *sub_2289A741C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_i8, a3);
}

uint64_t sub_2289A7428@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_i8, a4);
}

uint64_t sub_2289A7434(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_i8);
}

uint64_t sub_2289A7440()
{
  return sub_2289A1784(&qword_2559D45F8, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
}

unint64_t sub_2289A7478()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4600;
  if (!qword_2559D4600)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D45F0);
    v2 = sub_2289A1784(&qword_2559D45C8, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4600);
  }
  return result;
}

uint64_t sub_2289A74FC(char *a1, uint64_t *a2)
{
  uint64_t *v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_i8(*v2);
  *(_BYTE *)(result + v4) = v3;
  return result;
}

uint64_t (*sub_2289A7530(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A44A4((uint64_t)v4, *a2);
  return sub_228993248;
}

void sub_2289A757C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB074);
}

uint64_t (*sub_2289A7588(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3B64(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A75D4@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289ABA50(a1);
  if (!v2)
    *a2 = result;
  return result;
}

_QWORD *sub_2289A75FC(_QWORD *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v3 = *result;
  v4 = *a2;
  if (*result != *a2)
  {
    v5 = *v2;
    v6 = *(_BYTE *)(geom_collection_data_i8(*v2) + v3);
    v7 = *(_BYTE *)(geom_collection_data_i8(v5) + v4);
    *(_BYTE *)(geom_collection_data_i8(v5) + v3) = v7;
    result = (_QWORD *)geom_collection_data_i8(v5);
    *((_BYTE *)result + v4) = v6;
  }
  return result;
}

uint64_t sub_2289A7668()
{
  sub_2289A1890(0, &qword_2559D45D0);
  return sub_2289B2A38();
}

uint64_t sub_2289A76E0()
{
  sub_2289A1890(0, &qword_2559D45D0);
  return sub_2289B2A2C();
}

unint64_t sub_2289A775C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4608;
  if (!qword_2559D4608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D45F0);
    v2 = sub_2289A1784(&qword_2559D45E0, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4608);
  }
  return result;
}

_QWORD *sub_2289A77E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_i8, a2);
}

uint64_t *sub_2289A77EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_i8);
}

uint64_t sub_2289A77F8()
{
  return sub_2289A1784(&qword_2559D4610, &qword_2559D45D0, (uint64_t)off_24F147A60, (uint64_t)&protocol conformance descriptor for OS_geom_collection_i8);
}

uint64_t sub_2289A782C()
{
  return sub_2289A19A8(&qword_2559D4618, &qword_2559D45F0, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A7858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_i8(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A7880(_BYTE *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_BYTE *)(geom_collection_data_i8(*v2) + v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A78C4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_i8, a2);
}

uint64_t sub_2289A78D0@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_i8, a1);
}

uint64_t sub_2289A78DC()
{
  uint64_t *v0;

  return geom_collection_size_i8(*v0);
}

uint64_t sub_2289A78E4()
{
  return sub_2289A19A8(&qword_2559D4620, &qword_2559D4628, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A7910(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_i8, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A7944()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B398(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A7974(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC6A0(a1, a2, a3);
}

uint64_t sub_2289A7994()
{
  sub_2289A1890(0, &qword_2559D45D0);
  return sub_2289B2A68();
}

_QWORD *sub_2289A7A0C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_2f();
  *a1 = result;
  return result;
}

uint64_t sub_2289A7A30()
{
  uint64_t *v0;

  return geom_collection_data_2f(*v0);
}

double sub_2289A7A38@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t *v2;
  double result;

  result = *(double *)(geom_collection_data_2f(*v2) + 8 * a1);
  *a2 = result;
  return result;
}

void sub_2289A7A70(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_2f(*v1, a1);
}

void (*sub_2289A7A7C(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_2f(v3);
  return sub_2289A7AB4;
}

void sub_2289A7AB4(uint64_t a1)
{
  geom_collection_resize_2f(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A7AC0(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4630, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
  result = sub_2289A1784(&qword_2559D4640, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A7B34()
{
  return sub_2289A1784(&qword_2559D4648, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
}

unint64_t sub_2289A7B6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4650;
  if (!qword_2559D4650)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4658);
    v2 = sub_2289A1784(&qword_2559D4640, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4650);
  }
  return result;
}

_QWORD *sub_2289A7BF0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_2f, a3);
}

uint64_t sub_2289A7BFC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_2f, a4);
}

uint64_t sub_2289A7C08(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_2f);
}

uint64_t sub_2289A7C14()
{
  return sub_2289A1784(&qword_2559D4660, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
}

unint64_t sub_2289A7C4C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4668;
  if (!qword_2559D4668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4658);
    v2 = sub_2289A1784(&qword_2559D4630, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4668);
  }
  return result;
}

uint64_t sub_2289A7CD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = *a2;
  result = geom_collection_data_2f(*v2);
  *(_QWORD *)(result + 8 * v4) = v3;
  return result;
}

uint64_t (*sub_2289A7D04(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A4518(v4, *a2);
  return sub_228993248;
}

void sub_2289A7D50(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB150);
}

uint64_t (*sub_2289A7D5C(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3C00(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A7DA8@<X0>(uint64_t (*a1)(uint64_t *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289ABB8C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t *sub_2289A7DD0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v4 = *a2;
  if (*result != *a2)
  {
    v5 = *v2;
    v6 = *(_QWORD *)(geom_collection_data_2f(*v2) + 8 * v3);
    v7 = v4;
    v8 = *(_QWORD *)(geom_collection_data_2f(v5) + v7 * 8);
    *(_QWORD *)(geom_collection_data_2f(v5) + 8 * v3) = v8;
    result = (uint64_t *)geom_collection_data_2f(v5);
    result[v7] = v6;
  }
  return result;
}

uint64_t sub_2289A7E44()
{
  sub_2289A1890(0, &qword_2559D4638);
  return sub_2289B2A38();
}

uint64_t sub_2289A7EBC()
{
  sub_2289A1890(0, &qword_2559D4638);
  return sub_2289B2A2C();
}

unint64_t sub_2289A7F38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4670;
  if (!qword_2559D4670)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4658);
    v2 = sub_2289A1784(&qword_2559D4648, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4670);
  }
  return result;
}

_QWORD *sub_2289A7FBC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_2f, a2);
}

uint64_t *sub_2289A7FC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_2f);
}

uint64_t sub_2289A7FD4()
{
  return sub_2289A1784(&qword_2559D4678, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
}

uint64_t sub_2289A8008()
{
  return sub_2289A19A8(&qword_2559D4680, &qword_2559D4658, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A8034@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_2f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A805C(_QWORD *a1, uint64_t *a2))(_QWORD)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *a2;
  *a1 = *(_QWORD *)(geom_collection_data_2f(*v2) + 8 * v3);
  return geom::bvh<float,(unsigned char)2>::invariant_check;
}

uint64_t sub_2289A80A0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_2f, a2);
}

uint64_t sub_2289A80AC@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_2f, a1);
}

uint64_t sub_2289A80B8()
{
  uint64_t *v0;

  return geom_collection_size_2f(*v0);
}

uint64_t sub_2289A80C0()
{
  return sub_2289A19A8(&qword_2559D4688, &qword_2559D4690, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A80EC(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_2f, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A8120()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B084(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A8150(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC438(a1, a2, a3);
}

uint64_t sub_2289A8170()
{
  sub_2289A1890(0, &qword_2559D4638);
  return sub_2289B2A68();
}

_QWORD *sub_2289A81E8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_3f();
  *a1 = result;
  return result;
}

uint64_t sub_2289A820C()
{
  uint64_t *v0;

  return geom_collection_data_3f(*v0);
}

__n128 sub_2289A8214@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t *v2;
  __n128 result;

  result = *(__n128 *)(geom_collection_data_3f(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_2289A824C(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_3f(*v1, a1);
}

void (*sub_2289A8258(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_3f(v3);
  return sub_2289A8290;
}

void sub_2289A8290(uint64_t a1)
{
  geom_collection_resize_3f(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A829C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4698, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
  result = sub_2289A1784(&qword_2559D46A8, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A8310()
{
  return sub_2289A1784(&qword_2559D46B0, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
}

unint64_t sub_2289A8348()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D46B8;
  if (!qword_2559D46B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D46C0);
    v2 = sub_2289A1784(&qword_2559D46A8, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D46B8);
  }
  return result;
}

_QWORD *sub_2289A83CC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_3f, a3);
}

uint64_t sub_2289A83D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_3f, a4);
}

uint64_t sub_2289A83E4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_3f);
}

uint64_t sub_2289A83F0()
{
  return sub_2289A1784(&qword_2559D46C8, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
}

unint64_t sub_2289A8428()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D46D0;
  if (!qword_2559D46D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D46C0);
    v2 = sub_2289A1784(&qword_2559D4698, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D46D0);
  }
  return result;
}

__n128 sub_2289A84AC(__n128 *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v3 = *a2;
  v4 = geom_collection_data_3f(*v2);
  result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_2289A84E8(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A4594(v4, *a2);
  return sub_228993248;
}

void sub_2289A8534(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_3f, (uint64_t)geom_collection_data_3f, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB22C);
}

uint64_t (*sub_2289A8550(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3C9C(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A859C@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289ABCD8(a1, a2, geom_collection_size_3f, geom_collection_data_3f);
  if (!v3)
    *a3 = result;
  return result;
}

double sub_2289A85D4(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)&result = sub_2289A8DA0(a1, a2, a3, a4, geom_collection_data_3f).n128_u64[0];
  return result;
}

uint64_t sub_2289A85E0()
{
  sub_2289A1890(0, &qword_2559D46A0);
  return sub_2289B2A38();
}

uint64_t sub_2289A8658()
{
  sub_2289A1890(0, &qword_2559D46A0);
  return sub_2289B2A2C();
}

unint64_t sub_2289A86D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D46D8;
  if (!qword_2559D46D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D46C0);
    v2 = sub_2289A1784(&qword_2559D46B0, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D46D8);
  }
  return result;
}

_QWORD *sub_2289A8758@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_3f, a2);
}

uint64_t *sub_2289A8764(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_3f);
}

uint64_t sub_2289A8770()
{
  return sub_2289A1784(&qword_2559D46E0, &qword_2559D46A0, (uint64_t)off_24F147A30, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3f);
}

uint64_t sub_2289A87A4()
{
  return sub_2289A19A8(&qword_2559D46E8, &qword_2559D46C0, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A87D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_3f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A87F8(_QWORD *a1, uint64_t *a2))()
{
  uint64_t *v2;
  _OWORD *v5;
  uint64_t v6;

  v5 = malloc(0x10uLL);
  *a1 = v5;
  v6 = *a2;
  *v5 = *(_OWORD *)(geom_collection_data_3f(*v2) + 16 * v6);
  return sub_2289AC828;
}

uint64_t sub_2289A8850@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_3f, a2);
}

uint64_t sub_2289A885C@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_3f, a1);
}

uint64_t sub_2289A8868()
{
  uint64_t *v0;

  return geom_collection_size_3f(*v0);
}

uint64_t sub_2289A8870()
{
  return sub_2289A19A8(&qword_2559D46F0, &qword_2559D46F8, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A889C(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_3f, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A88D0()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B194(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289A8900(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC5D0(a1, a2, a3, geom_collection_size_3f, geom_collection_data_3f);
}

uint64_t sub_2289A8930()
{
  sub_2289A1890(0, &qword_2559D46A0);
  return sub_2289B2A68();
}

_QWORD *sub_2289A89A8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_4f();
  *a1 = result;
  return result;
}

uint64_t sub_2289A89CC()
{
  uint64_t *v0;

  return geom_collection_data_4f(*v0);
}

__n128 sub_2289A89D4@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t *v2;
  __n128 result;

  result = *(__n128 *)(geom_collection_data_4f(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_2289A8A0C(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_4f(*v1, a1);
}

void (*sub_2289A8A18(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_4f(v3);
  return sub_2289A8A50;
}

void sub_2289A8A50(uint64_t a1)
{
  geom_collection_resize_4f(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A8A5C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4700, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
  result = sub_2289A1784(&qword_2559D4710, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A8AD0()
{
  return sub_2289A1784(&qword_2559D4718, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
}

unint64_t sub_2289A8B08()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4720;
  if (!qword_2559D4720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4728);
    v2 = sub_2289A1784(&qword_2559D4710, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4720);
  }
  return result;
}

_QWORD *sub_2289A8B8C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_4f, a3);
}

uint64_t sub_2289A8B98@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_4f, a4);
}

uint64_t sub_2289A8BA4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_4f);
}

uint64_t sub_2289A8BB0()
{
  return sub_2289A1784(&qword_2559D4730, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
}

unint64_t sub_2289A8BE8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4738;
  if (!qword_2559D4738)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4728);
    v2 = sub_2289A1784(&qword_2559D4700, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4738);
  }
  return result;
}

__n128 sub_2289A8C6C(__n128 *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v3 = *a2;
  v4 = geom_collection_data_4f(*v2);
  result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_2289A8CA8(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A45F8(v4, *a2);
  return sub_228993248;
}

void sub_2289A8CF4(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_4f, (uint64_t)geom_collection_data_4f, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB22C);
}

uint64_t (*sub_2289A8D10(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3D48(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A8D5C@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289ABCD8(a1, a2, geom_collection_size_4f, geom_collection_data_4f);
  if (!v3)
    *a3 = result;
  return result;
}

double sub_2289A8D94(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)&result = sub_2289A8DA0(a1, a2, a3, a4, geom_collection_data_4f).n128_u64[0];
  return result;
}

__n128 sub_2289A8DA0(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 result;
  __int128 v13;
  __n128 v14;

  v6 = *a2;
  if (*a1 != *a2)
  {
    v8 = *v5;
    v9 = 16 * *a1;
    v14 = *(__n128 *)(a5(v8) + v9);
    v10 = 16 * v6;
    v13 = *(_OWORD *)(a5(v8) + v10);
    *(_OWORD *)(a5(v8) + v9) = v13;
    v11 = a5(v8);
    result = v14;
    *(__n128 *)(v11 + v10) = v14;
  }
  return result;
}

uint64_t sub_2289A8E28()
{
  sub_2289A1890(0, &qword_2559D4708);
  return sub_2289B2A38();
}

uint64_t sub_2289A8EA0()
{
  sub_2289A1890(0, &qword_2559D4708);
  return sub_2289B2A2C();
}

unint64_t sub_2289A8F1C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4740;
  if (!qword_2559D4740)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4728);
    v2 = sub_2289A1784(&qword_2559D4718, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4740);
  }
  return result;
}

_QWORD *sub_2289A8FA0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_4f, a2);
}

uint64_t *sub_2289A8FAC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_4f);
}

uint64_t sub_2289A8FB8()
{
  return sub_2289A1784(&qword_2559D4748, &qword_2559D4708, (uint64_t)off_24F147A40, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4f);
}

uint64_t sub_2289A8FEC()
{
  return sub_2289A19A8(&qword_2559D4750, &qword_2559D4728, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A9018@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_4f(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289A9040(_QWORD *a1, uint64_t *a2))()
{
  uint64_t *v2;
  _OWORD *v5;
  uint64_t v6;

  v5 = malloc(0x10uLL);
  *a1 = v5;
  v6 = *a2;
  *v5 = *(_OWORD *)(geom_collection_data_4f(*v2) + 16 * v6);
  return sub_2289AC828;
}

uint64_t sub_2289A9098@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_4f, a2);
}

uint64_t sub_2289A90A4@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_4f, a1);
}

uint64_t sub_2289A90B0()
{
  uint64_t *v0;

  return geom_collection_size_4f(*v0);
}

uint64_t sub_2289A90B8()
{
  return sub_2289A19A8(&qword_2559D4758, &qword_2559D4760, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A90E4(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_4f, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A9118()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B2A4(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289A9148(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC5D0(a1, a2, a3, geom_collection_size_4f, geom_collection_data_4f);
}

uint64_t sub_2289A9178()
{
  sub_2289A1890(0, &qword_2559D4708);
  return sub_2289B2A68();
}

_QWORD *sub_2289A91F0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_2d();
  *a1 = result;
  return result;
}

uint64_t sub_2289A9214()
{
  uint64_t *v0;

  return geom_collection_data_2d(*v0);
}

__n128 sub_2289A921C@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t *v2;
  __n128 result;

  result = *(__n128 *)(geom_collection_data_2d(*v2) + 16 * a1);
  *a2 = result;
  return result;
}

void sub_2289A9254(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_2d(*v1, a1);
}

void (*sub_2289A9260(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_2d(v3);
  return sub_2289A9298;
}

void sub_2289A9298(uint64_t a1)
{
  geom_collection_resize_2d(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A92A4(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4768, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
  result = sub_2289A1784(&qword_2559D4778, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A9318()
{
  return sub_2289A1784(&qword_2559D4780, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
}

unint64_t sub_2289A9350()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4788;
  if (!qword_2559D4788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4790);
    v2 = sub_2289A1784(&qword_2559D4778, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4788);
  }
  return result;
}

_QWORD *sub_2289A93D4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_2d, a3);
}

uint64_t sub_2289A93E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_2d, a4);
}

uint64_t sub_2289A93EC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_2d);
}

uint64_t sub_2289A93F8()
{
  return sub_2289A1784(&qword_2559D4798, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
}

unint64_t sub_2289A9430()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D47A0;
  if (!qword_2559D47A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4790);
    v2 = sub_2289A1784(&qword_2559D4768, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D47A0);
  }
  return result;
}

__n128 sub_2289A94B4(__n128 *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v3 = *a2;
  v4 = geom_collection_data_2d(*v2);
  result = v6;
  *(__n128 *)(v4 + 16 * v3) = v6;
  return result;
}

uint64_t (*sub_2289A94F0(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A46A0(v4, *a2);
  return sub_228993248;
}

void sub_2289A953C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A5554(a1, a2, a3, a4, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB31C);
}

uint64_t (*sub_2289A9548(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3DF4(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A9594@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2289ABE44(a1);
  if (!v2)
    *a2 = result;
  return result;
}

__n128 sub_2289A95BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __int128 v9;
  __n128 v10;

  v3 = *a1;
  v4 = *a2;
  if (*a1 != *a2)
  {
    v5 = *v2;
    v10 = *(__n128 *)(geom_collection_data_2d(*v2) + 16 * v3);
    v6 = 16 * v4;
    v9 = *(_OWORD *)(geom_collection_data_2d(v5) + v6);
    *(_OWORD *)(geom_collection_data_2d(v5) + 16 * v3) = v9;
    v7 = geom_collection_data_2d(v5);
    result = v10;
    *(__n128 *)(v7 + v6) = v10;
  }
  return result;
}

uint64_t sub_2289A9640()
{
  sub_2289A1890(0, &qword_2559D4770);
  return sub_2289B2A38();
}

uint64_t sub_2289A96B8()
{
  sub_2289A1890(0, &qword_2559D4770);
  return sub_2289B2A2C();
}

unint64_t sub_2289A9734()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D47A8;
  if (!qword_2559D47A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4790);
    v2 = sub_2289A1784(&qword_2559D4780, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D47A8);
  }
  return result;
}

_QWORD *sub_2289A97B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_2d, a2);
}

uint64_t *sub_2289A97C4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_2d);
}

uint64_t sub_2289A97D0()
{
  return sub_2289A1784(&qword_2559D47B0, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
}

uint64_t sub_2289A9804()
{
  return sub_2289A19A8(&qword_2559D47B8, &qword_2559D4790, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A9830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_2d(*v1);
  *a1 = result;
  return result;
}

void (*sub_2289A9858(_QWORD *a1, uint64_t *a2))(void **a1)
{
  uint64_t *v2;
  _OWORD *v5;
  uint64_t v6;

  v5 = malloc(0x10uLL);
  *a1 = v5;
  v6 = *a2;
  *v5 = *(_OWORD *)(geom_collection_data_2d(*v2) + 16 * v6);
  return sub_2289A98B0;
}

void sub_2289A98B0(void **a1)
{
  free(*a1);
}

uint64_t sub_2289A98B8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_2d, a2);
}

uint64_t sub_2289A98C4@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_2d, a1);
}

uint64_t sub_2289A98D0()
{
  uint64_t *v0;

  return geom_collection_size_2d(*v0);
}

uint64_t sub_2289A98D8()
{
  return sub_2289A19A8(&qword_2559D47C0, &qword_2559D47C8, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289A9904(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_2d, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289A9938()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B068(*v0);
  v3 = v2;

  return v3;
}

uint64_t *sub_2289A9968(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC378(a1, a2, a3);
}

uint64_t sub_2289A9988()
{
  sub_2289A1890(0, &qword_2559D4770);
  return sub_2289B2A68();
}

_QWORD *sub_2289A9A00@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_3d();
  *a1 = result;
  return result;
}

uint64_t sub_2289A9A24()
{
  uint64_t *v0;

  return geom_collection_data_3d(*v0);
}

__n128 sub_2289A9A2C@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  __n128 result;
  __int128 v6;

  v4 = geom_collection_data_3d(*v2) + 32 * a1;
  result = *(__n128 *)v4;
  v6 = *(_OWORD *)(v4 + 16);
  *a2 = *(_OWORD *)v4;
  a2[1] = v6;
  return result;
}

void sub_2289A9A68(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_3d(*v1, a1);
}

void (*sub_2289A9A74(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_3d(v3);
  return sub_2289A9AAC;
}

void sub_2289A9AAC(uint64_t a1)
{
  geom_collection_resize_3d(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289A9AB8(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D47D0, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
  result = sub_2289A1784(&qword_2559D47E0, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289A9B2C()
{
  return sub_2289A1784(&qword_2559D47E8, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
}

unint64_t sub_2289A9B64()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D47F0;
  if (!qword_2559D47F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D47F8);
    v2 = sub_2289A1784(&qword_2559D47E0, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D47F0);
  }
  return result;
}

_QWORD *sub_2289A9BE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_3d, a3);
}

uint64_t sub_2289A9BF4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_3d, a4);
}

uint64_t sub_2289A9C00(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_3d);
}

uint64_t sub_2289A9C0C()
{
  return sub_2289A1784(&qword_2559D4800, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
}

unint64_t sub_2289A9C44()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4808;
  if (!qword_2559D4808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D47F8);
    v2 = sub_2289A1784(&qword_2559D47D0, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4808);
  }
  return result;
}

__n128 sub_2289A9CC8(__n128 *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  __n128 *v4;
  __n128 result;
  __n128 v6;
  __n128 v7;

  v6 = a1[1];
  v7 = *a1;
  v3 = *a2;
  v4 = (__n128 *)(geom_collection_data_3d(*v2) + 32 * v3);
  result = v7;
  *v4 = v7;
  v4[1] = v6;
  return result;
}

uint64_t (*sub_2289A9D10(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A473C(v4, *a2);
  return sub_228993248;
}

void sub_2289A9D5C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_3d, (uint64_t)geom_collection_data_3d, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB400);
}

uint64_t (*sub_2289A9D78(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3E90(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289A9DC4@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289ABF98(a1, a2, geom_collection_size_3d, geom_collection_data_3d);
  if (!v3)
    *a3 = result;
  return result;
}

double sub_2289A9DFC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)&result = sub_2289AA5DC(a1, a2, a3, a4, geom_collection_data_3d).n128_u64[0];
  return result;
}

uint64_t sub_2289A9E08()
{
  sub_2289A1890(0, &qword_2559D47D8);
  return sub_2289B2A38();
}

uint64_t sub_2289A9E80()
{
  sub_2289A1890(0, &qword_2559D47D8);
  return sub_2289B2A2C();
}

unint64_t sub_2289A9EFC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4810;
  if (!qword_2559D4810)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D47F8);
    v2 = sub_2289A1784(&qword_2559D47E8, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4810);
  }
  return result;
}

_QWORD *sub_2289A9F80@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_3d, a2);
}

uint64_t *sub_2289A9F8C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_3d);
}

uint64_t sub_2289A9F98()
{
  return sub_2289A1784(&qword_2559D4818, &qword_2559D47D8, (uint64_t)off_24F147A28, (uint64_t)&protocol conformance descriptor for OS_geom_collection_3d);
}

uint64_t sub_2289A9FCC()
{
  return sub_2289A19A8(&qword_2559D4820, &qword_2559D47F8, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289A9FF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_3d(*v1);
  *a1 = result;
  return result;
}

void (*sub_2289AA020(_QWORD *a1, uint64_t *a2))(void **a1)
{
  uint64_t *v2;
  _OWORD *v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;

  v5 = malloc(0x20uLL);
  *a1 = v5;
  v6 = *a2;
  v7 = (_OWORD *)(geom_collection_data_3d(*v2) + 32 * v6);
  v8 = v7[1];
  *v5 = *v7;
  v5[1] = v8;
  return sub_2289A98B0;
}

uint64_t sub_2289AA07C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_3d, a2);
}

uint64_t sub_2289AA088@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_3d, a1);
}

uint64_t sub_2289AA094()
{
  uint64_t *v0;

  return geom_collection_size_3d(*v0);
}

uint64_t sub_2289AA09C()
{
  return sub_2289A19A8(&qword_2559D4828, &qword_2559D4830, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289AA0C8(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_3d, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289AA0FC()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B178(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289AA12C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC4F8(a1, a2, a3, geom_collection_size_3d, geom_collection_data_3d);
}

uint64_t sub_2289AA15C()
{
  sub_2289A1890(0, &qword_2559D47D8);
  return sub_2289B2A68();
}

_QWORD *sub_2289AA1D4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = geom_create_collection_4d();
  *a1 = result;
  return result;
}

uint64_t sub_2289AA1F8()
{
  uint64_t *v0;

  return geom_collection_data_4d(*v0);
}

__n128 sub_2289AA200@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  __n128 result;
  __int128 v6;

  v4 = geom_collection_data_4d(*v2) + 32 * a1;
  result = *(__n128 *)v4;
  v6 = *(_OWORD *)(v4 + 16);
  *a2 = *(_OWORD *)v4;
  a2[1] = v6;
  return result;
}

void sub_2289AA23C(unint64_t a1)
{
  uint64_t *v1;

  geom_collection_resize_4d(*v1, a1);
}

void (*sub_2289AA248(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[1] = *v1;
  *a1 = geom_collection_size_4d(v3);
  return sub_2289AA280;
}

void sub_2289AA280(uint64_t a1)
{
  geom_collection_resize_4d(*(_QWORD *)(a1 + 8), *(_QWORD *)a1);
}

uint64_t sub_2289AA28C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2289A1784(&qword_2559D4838, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
  result = sub_2289A1784(&qword_2559D4848, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2289AA300()
{
  return sub_2289A1784(&qword_2559D4850, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
}

unint64_t sub_2289AA338()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4858;
  if (!qword_2559D4858)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4860);
    v2 = sub_2289A1784(&qword_2559D4848, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4230], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4858);
  }
  return result;
}

_QWORD *sub_2289AA3BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2289AAA4C(a1, a2, geom_collection_size_4d, a3);
}

uint64_t sub_2289AA3C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2289A4FA8(a1, a2, a3, geom_collection_size_4d, a4);
}

uint64_t sub_2289AA3D4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AAA9C(a1, a2, a3, a4, geom_collection_size_4d);
}

uint64_t sub_2289AA3E0()
{
  return sub_2289A1784(&qword_2559D4868, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
}

unint64_t sub_2289AA418()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4870;
  if (!qword_2559D4870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4860);
    v2 = sub_2289A1784(&qword_2559D4838, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4220], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4870);
  }
  return result;
}

__n128 sub_2289AA49C(__n128 *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  __n128 *v4;
  __n128 result;
  __n128 v6;
  __n128 v7;

  v6 = a1[1];
  v7 = *a1;
  v3 = *a2;
  v4 = (__n128 *)(geom_collection_data_4d(*v2) + 32 * v3);
  result = v7;
  *v4 = v7;
  v4[1] = v6;
  return result;
}

uint64_t (*sub_2289AA4E4(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A47A4(v4, *a2);
  return sub_228993248;
}

void sub_2289AA530(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  sub_2289A6594(a1, a2, a3, a4, (uint64_t)geom_collection_size_4d, (uint64_t)geom_collection_data_4d, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2289AB400);
}

uint64_t (*sub_2289AA54C(_QWORD *a1, uint64_t *a2))()
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2289A3F3C(v4, *a2, a2[1]);
  return sub_228993248;
}

uint64_t sub_2289AA598@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2289ABF98(a1, a2, geom_collection_size_4d, geom_collection_data_4d);
  if (!v3)
    *a3 = result;
  return result;
}

double sub_2289AA5D0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)&result = sub_2289AA5DC(a1, a2, a3, a4, geom_collection_data_4d).n128_u64[0];
  return result;
}

__n128 sub_2289AA5DC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  __n128 *v15;
  __n128 result;
  __int128 v17;
  __int128 v18;
  __n128 v19;
  __n128 v20;

  v6 = *a1;
  v7 = *a2;
  if (*a1 != *a2)
  {
    v9 = *v5;
    v10 = a5(v9);
    v11 = 32 * v6;
    v19 = *(__n128 *)(v10 + v11 + 16);
    v20 = *(__n128 *)(v10 + v11);
    v12 = a5(v9);
    v13 = 32 * v7;
    v17 = *(_OWORD *)(v12 + v13 + 16);
    v18 = *(_OWORD *)(v12 + v13);
    v14 = (_OWORD *)(a5(v9) + v11);
    *v14 = v18;
    v14[1] = v17;
    v15 = (__n128 *)(a5(v9) + v13);
    result = v20;
    *v15 = v20;
    v15[1] = v19;
  }
  return result;
}

uint64_t sub_2289AA684()
{
  sub_2289A1890(0, &qword_2559D4840);
  return sub_2289B2A38();
}

uint64_t sub_2289AA6FC()
{
  sub_2289A1890(0, &qword_2559D4840);
  return sub_2289B2A2C();
}

unint64_t sub_2289AA778()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559D4878;
  if (!qword_2559D4878)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559D4860);
    v2 = sub_2289A1784(&qword_2559D4850, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
    result = MEMORY[0x22E2B7AB8](MEMORY[0x24BEE4218], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559D4878);
  }
  return result;
}

_QWORD *sub_2289AA7FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2289AA808(a1, geom_collection_size_4d, a2);
}

_QWORD *sub_2289AA808@<X0>(_QWORD *result@<X0>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t *a3@<X8>)
{
  _QWORD *v3;
  uint64_t v5;

  v5 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)a2(*v3);
    if ((v5 & 0x8000000000000000) == 0 && v5 < (uint64_t)result)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AA858(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AA864(a1, a2, a3, geom_collection_size_4d);
}

uint64_t *sub_2289AA864(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;

  v5 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else
  {
    v6 = result;
    result = (uint64_t *)a4(*v4);
    if ((v5 & 0x8000000000000000) == 0 && v5 < (uint64_t)result)
    {
      *v6 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2289AA8B4()
{
  return sub_2289A1784(&qword_2559D4880, &qword_2559D4840, (uint64_t)off_24F147A38, (uint64_t)&protocol conformance descriptor for OS_geom_collection_4d);
}

uint64_t sub_2289AA8E8()
{
  return sub_2289A19A8(&qword_2559D4888, &qword_2559D4860, MEMORY[0x24BEE4238]);
}

uint64_t sub_2289AA914@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;

  result = geom_collection_size_4d(*v1);
  *a1 = result;
  return result;
}

uint64_t (*sub_2289AA93C(_QWORD *a1, uint64_t *a2))()
{
  uint64_t *v2;
  _OWORD *v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;

  v5 = malloc(0x20uLL);
  *a1 = v5;
  v6 = *a2;
  v7 = (_OWORD *)(geom_collection_data_4d(*v2) + 32 * v6);
  v8 = v7[1];
  *v5 = *v7;
  v5[1] = v8;
  return sub_2289AC828;
}

uint64_t sub_2289AA998@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289AA9A4(a1, (uint64_t (*)(void))geom_collection_size_4d, a2);
}

uint64_t sub_2289AA9A4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X3>, _QWORD *a3@<X8>)
{
  id *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  id v8;

  v6 = *a1;
  v5 = a1[1];
  v8 = *v3;
  result = a2();
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v6 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= v5)
  {
    *a3 = v6;
    a3[1] = v5;
    a3[2] = v8;
    return (uint64_t)v8;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2289AAA08@<X0>(_QWORD *a1@<X8>)
{
  return sub_2289AAA14(geom_collection_size_4d, a1);
}

uint64_t sub_2289AAA14@<X0>(uint64_t (*a1)(_QWORD)@<X2>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t result;

  result = a1(*v2);
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *a2 = 0;
    a2[1] = result;
  }
  return result;
}

uint64_t sub_2289AAA44()
{
  uint64_t *v0;

  return geom_collection_size_4d(*v0);
}

_QWORD *sub_2289AAA4C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X4>, uint64_t *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v6;

  v6 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = (_QWORD *)a3(*v4);
    if ((v6 & 0x8000000000000000) == 0 && (uint64_t)result >= v6)
    {
      *a4 = v6;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2289AAA9C(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = *a1;
  v8 = *a2;
  v9 = *v5;
  result = a5(v9);
  if (v7 < 0 || result < v7)
  {
    __break(1u);
  }
  else
  {
    result = a5(v9);
    if ((v8 & 0x8000000000000000) == 0 && result >= v8)
      return v8 - v7;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AAB00(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *sub_2289AAB1C(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

_QWORD *sub_2289AAB38(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

uint64_t sub_2289AAB54()
{
  return sub_2289A19A8(&qword_2559D4890, &qword_2559D4898, MEMORY[0x24BEE2C18]);
}

uint64_t sub_2289AAB80(uint64_t a1)
{
  MEMORY[0x22E2B7AB8](&protocol conformance descriptor for OS_geom_collection_4d, a1);
  return sub_2289B2AF8();
}

uint64_t sub_2289AABB4()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  sub_22899B1B0(*v0);
  v3 = v2;

  return v3;
}

_QWORD *sub_2289AABE4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289AC4F8(a1, a2, a3, geom_collection_size_4d, geom_collection_data_4d);
}

uint64_t sub_2289AAC14()
{
  sub_2289A1890(0, &qword_2559D4840);
  return sub_2289B2A68();
}

uint64_t sub_2289AAC8C@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return GeometryCollection.subscript.getter(*a1, *(uint64_t *)((char *)a1 + a2 - 16), *(uint64_t *)((char *)a1 + a2 - 8), a3);
}

uint64_t sub_2289AACC0()
{
  return 16;
}

__n128 sub_2289AACCC(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of GeometryCollection.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GeometryCollection.dataPointer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of GeometryCollection.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of GeometryCollection.count.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of GeometryCollection.count.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_2289AAD00(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  int v14;

  v11 = *a1;
  result = geom_collection_size_f(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_DWORD *)(geom_collection_data_f(a6) + 4 * a4);
      result = geom_collection_data_f(v11);
      *(_DWORD *)(result + 4 * a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AADDC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v11 = *a1;
  result = geom_collection_size_d(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_QWORD *)(geom_collection_data_d(a6) + 8 * a4);
      result = geom_collection_data_d(v11);
      *(_QWORD *)(result + 8 * a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AAEB8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  __int16 v14;

  v11 = *a1;
  result = geom_collection_size_u16(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_WORD *)(geom_collection_data_u16(a6) + 2 * a4);
      result = geom_collection_data_u16(v11);
      *(_WORD *)(result + 2 * a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AAF94(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD), uint64_t (*a8)(uint64_t))
{
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  int v17;

  v14 = *a1;
  result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v16 = a3 - 1;
    while (a4 < a5)
    {
      v17 = *(_DWORD *)(a8(a6) + 4 * a4);
      result = a8(v14);
      *(_DWORD *)(result + 4 * a2) = v17;
      ++a4;
      if (v16 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB074(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char v14;

  v11 = *a1;
  result = geom_collection_size_i8(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_BYTE *)(geom_collection_data_i8(a6) + a4);
      result = geom_collection_data_i8(v11);
      *(_BYTE *)(result + a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB150(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v11 = *a1;
  result = geom_collection_size_2f(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_QWORD *)(geom_collection_data_2f(a6) + 8 * a4);
      result = geom_collection_data_2f(v11);
      *(_QWORD *)(result + 8 * a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB22C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD), uint64_t (*a8)(uint64_t))
{
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  __int128 v17;

  v14 = *a1;
  result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v16 = a3 - 1;
    while (a4 < a5)
    {
      v17 = *(_OWORD *)(a8(a6) + 16 * a4);
      result = a8(v14);
      *(_OWORD *)(result + 16 * a2) = v17;
      ++a4;
      if (v16 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB31C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  __int128 v14;

  v11 = *a1;
  result = geom_collection_size_2d(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v13 = a3 - 1;
    while (a4 < a5)
    {
      v14 = *(_OWORD *)(geom_collection_data_2d(a6) + 16 * a4);
      result = geom_collection_data_2d(v11);
      *(_OWORD *)(result + 16 * a2) = v14;
      ++a4;
      if (v13 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB400(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(_QWORD), uint64_t (*a8)(uint64_t))
{
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  __int128 *v17;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;

  v14 = *a1;
  result = a7(*a1);
  if (result < 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (result < a3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (a2 >= a3)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    v16 = a3 - 1;
    while (a4 < a5)
    {
      v17 = (__int128 *)(a8(a6) + 32 * a4);
      v19 = v17[1];
      v20 = *v17;
      result = a8(v14);
      v18 = (_OWORD *)(result + 32 * a2);
      *v18 = v20;
      v18[1] = v19;
      ++a4;
      if (v16 == a2)
        goto LABEL_5;
      ++a2;
      if (a5 == a4)
      {
        __break(1u);
        break;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_5:
  if (a4 != a5)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2289AB500(uint64_t (*a1)(int *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  int v12;
  int v13;
  int v14;
  int v15;

  v4 = *v1;
  v5 = geom_collection_size_f(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v15 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * i);
    v8 = a1(&v15);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_f(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * v6 - 4);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v12 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * i);
          v13 = *(_DWORD *)(geom_collection_data_f(v4) + 4 * v9);
          *(_DWORD *)(geom_collection_data_f(v4) + 4 * i) = v13;
          *(_DWORD *)(geom_collection_data_f(v4) + 4 * v9) = v12;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289AB64C(uint64_t (*a1)(uint64_t *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *v1;
  v5 = geom_collection_size_d(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v14 = *(_QWORD *)(geom_collection_data_d(v4) + 8 * i);
    v8 = a1(&v14);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_d(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_QWORD *)(geom_collection_data_d(v4) + 8 * v6 - 8);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v12 = *(_QWORD *)(geom_collection_data_d(v4) + 8 * i);
          v13 = *(_QWORD *)(geom_collection_data_d(v4) + 8 * v9);
          *(_QWORD *)(geom_collection_data_d(v4) + 8 * i) = v13;
          *(_QWORD *)(geom_collection_data_d(v4) + 8 * v9) = v12;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289AB798(uint64_t (*a1)(__int16 *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  v4 = *v1;
  v5 = geom_collection_size_u16(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v15 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * i);
    v8 = a1(&v15);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_u16(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * v6 - 2);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v13 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * i);
          v12 = *(_WORD *)(geom_collection_data_u16(v4) + 2 * v9);
          *(_WORD *)(geom_collection_data_u16(v4) + 2 * i) = v12;
          *(_WORD *)(geom_collection_data_u16(v4) + 2 * v9) = v13;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289AB8E4(uint64_t (*a1)(int *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  uint64_t v14;
  uint64_t result;
  char v16;
  int v17;
  int v18;
  int v19;
  int v20;

  v9 = *v4;
  v10 = a3(*v4);
  if (v10 < 1)
    return 0;
  v11 = v10;
  for (i = 0; i < v14; ++i)
  {
    v20 = *(_DWORD *)(a4(v9) + 4 * i);
    v13 = a1(&v20);
    if (v5)
      break;
    if ((v13 & 1) != 0)
    {
      while (1)
      {
        v14 = v11 - 1;
        result = a3(v9);
        if (v11 - 1 < 0 || v14 >= result)
          break;
        if (i >= v14)
          return i;
        v19 = *(_DWORD *)(a4(v9) + 4 * v11 - 4);
        v16 = a1(&v19);
        --v11;
        if ((v16 & 1) == 0)
        {
          v18 = *(_DWORD *)(a4(v9) + 4 * i);
          v17 = *(_DWORD *)(a4(v9) + 4 * v14);
          *(_DWORD *)(a4(v9) + 4 * i) = v17;
          *(_DWORD *)(a4(v9) + 4 * v14) = v18;
          v11 = v14;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v14 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289ABA50(uint64_t (*a1)(char *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;

  v4 = *v1;
  v5 = geom_collection_size_i8(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v15 = *(_BYTE *)(geom_collection_data_i8(v4) + i);
    v8 = a1(&v15);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_i8(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_BYTE *)(geom_collection_data_i8(v4) + v6 - 1);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v12 = *(_BYTE *)(geom_collection_data_i8(v4) + i);
          v13 = *(_BYTE *)(geom_collection_data_i8(v4) + v9);
          *(_BYTE *)(geom_collection_data_i8(v4) + i) = v13;
          *(_BYTE *)(geom_collection_data_i8(v4) + v9) = v12;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289ABB8C(uint64_t (*a1)(uint64_t *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *v1;
  v5 = geom_collection_size_2f(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v14 = *(_QWORD *)(geom_collection_data_2f(v4) + 8 * i);
    v8 = a1(&v14);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_2f(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_QWORD *)(geom_collection_data_2f(v4) + 8 * v6 - 8);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v12 = *(_QWORD *)(geom_collection_data_2f(v4) + 8 * i);
          v13 = *(_QWORD *)(geom_collection_data_2f(v4) + 8 * v9);
          *(_QWORD *)(geom_collection_data_2f(v4) + 8 * i) = v13;
          *(_QWORD *)(geom_collection_data_2f(v4) + 8 * v9) = v12;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289ABCD8(uint64_t (*a1)(__int128 *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  char v13;
  uint64_t v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v9 = *v4;
  v10 = a3(*v4);
  if (v10 < 1)
    return 0;
  v11 = v10;
  for (i = 0; i < v14; ++i)
  {
    v21 = *(_OWORD *)(a4(v9) + 16 * i);
    v13 = a1(&v21);
    if (v5)
      break;
    if ((v13 & 1) != 0)
    {
      while (1)
      {
        v14 = v11 - 1;
        result = a3(v9);
        if (v11 - 1 < 0 || v14 >= result)
          break;
        if (i >= v14)
          return i;
        v21 = *(_OWORD *)(a4(v9) + 16 * v11 - 16);
        v16 = a1(&v21);
        --v11;
        if ((v16 & 1) == 0)
        {
          v17 = a4(v9);
          v22 = 16 * i;
          v20 = *(_OWORD *)(v17 + 16 * i);
          v19 = *(_OWORD *)(a4(v9) + 16 * v14);
          v18 = a4(v9);
          *(_OWORD *)(v18 + v22) = v19;
          *(_OWORD *)(a4(v9) + 16 * v14) = v20;
          v11 = v14;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v14 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289ABE44(uint64_t (*a1)(__int128 *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = *v1;
  v5 = geom_collection_size_2d(*v1);
  if (v5 < 1)
    return 0;
  v6 = v5;
  for (i = 0; i < v9; ++i)
  {
    v14 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i);
    v8 = a1(&v14);
    if (v2)
      break;
    if ((v8 & 1) != 0)
    {
      while (1)
      {
        v9 = v6 - 1;
        result = geom_collection_size_2d(v4);
        if (v6 - 1 < 0 || v9 >= result)
          break;
        if (i >= v9)
          return i;
        v14 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v6 - 16);
        v11 = a1(&v14);
        --v6;
        if ((v11 & 1) == 0)
        {
          v13 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i);
          v12 = *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v9);
          *(_OWORD *)(geom_collection_data_2d(v4) + 16 * i) = v12;
          *(_OWORD *)(geom_collection_data_2d(v4) + 16 * v9) = v13;
          v6 = v9;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v9 = v6;
LABEL_12:
    ;
  }
  return i;
}

uint64_t sub_2289ABF98(uint64_t (*a1)(__int128 *), uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 *v13;
  __int128 v14;
  char v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  __int128 *v22;
  __int128 *v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v9 = *v4;
  v10 = a3(*v4);
  if (v10 < 1)
    return 0;
  v11 = v10;
  for (i = 0; i < v16; ++i)
  {
    v13 = (__int128 *)(a4(v9) + 32 * i);
    v14 = v13[1];
    v31 = *v13;
    v32 = v14;
    v15 = a1(&v31);
    if (v5)
      break;
    if ((v15 & 1) != 0)
    {
      while (1)
      {
        v16 = v11 - 1;
        result = a3(v9);
        if (v11 - 1 < 0 || v16 >= result)
          break;
        if (i >= v16)
          return i;
        v18 = a4(v9) + 32 * v11;
        v19 = *(_OWORD *)(v18 - 16);
        v31 = *(_OWORD *)(v18 - 32);
        v32 = v19;
        v20 = a1(&v31);
        --v11;
        if ((v20 & 1) == 0)
        {
          v21 = a4(v9);
          v33 = 32 * i;
          v22 = (__int128 *)(v21 + 32 * i);
          v29 = v22[1];
          v30 = *v22;
          v23 = (__int128 *)(a4(v9) + 32 * v16);
          v27 = v23[1];
          v28 = *v23;
          v24 = a4(v9);
          v25 = (_OWORD *)(v24 + v33);
          *v25 = v28;
          v25[1] = v27;
          v26 = (_OWORD *)(a4(v9) + 32 * v16);
          *v26 = v30;
          v26[1] = v29;
          v11 = v16;
          goto LABEL_12;
        }
      }
      __break(1u);
      return result;
    }
    v16 = v11;
LABEL_12:
    ;
  }
  return i;
}

uint64_t *sub_2289AC128(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_d(v3))
    {
      v7 = geom_collection_data_d(v3);
      v8 = 0;
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v8) = *(_QWORD *)(v7 + 8 * v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_d(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_d(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AC1E8(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_f(v3))
    {
      v7 = geom_collection_data_f(v3);
      v8 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v8) = *(_DWORD *)(v7 + 4 * v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_f(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_f(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2289AC2A8(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;

  v6 = result;
  if (!a2)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = a3;
  if (!a3)
  {
LABEL_11:
    *v6 = v5;
    v6[1] = v7;
    return (_QWORD *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      v11 = a5(v5);
      v12 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v12) = *(_DWORD *)(v11 + 4 * v12);
        if (v7 - 1 == v12)
          goto LABEL_11;
        if (v12 + 1 == a4(v5))
        {
          v7 = v12 + 1;
          goto LABEL_11;
        }
        v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AC378(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_2d(v3))
    {
      v7 = geom_collection_data_2d(v3);
      v8 = 0;
      while (1)
      {
        *(_OWORD *)(a2 + 16 * v8) = *(_OWORD *)(v7 + 16 * v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_2d(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_2d(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AC438(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_2f(v3))
    {
      v7 = geom_collection_data_2f(v3);
      v8 = 0;
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v8) = *(_QWORD *)(v7 + 8 * v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_2f(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_2f(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2289AC4F8(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;

  v6 = result;
  if (!a2)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = a3;
  if (!a3)
  {
LABEL_11:
    *v6 = v5;
    v6[1] = v7;
    return (_QWORD *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      v11 = a5(v5);
      v12 = 0;
      while (1)
      {
        v13 = (_OWORD *)(a2 + 32 * v12);
        v14 = (_OWORD *)(v11 + 32 * v12);
        v15 = v14[1];
        *v13 = *v14;
        v13[1] = v15;
        if (v7 - 1 == v12)
          goto LABEL_11;
        if (v12 + 1 == a4(v5))
        {
          v7 = v12 + 1;
          goto LABEL_11;
        }
        v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2289AC5D0(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;

  v6 = result;
  if (!a2)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = a3;
  if (!a3)
  {
LABEL_11:
    *v6 = v5;
    v6[1] = v7;
    return (_QWORD *)v7;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a4(v5))
    {
      v11 = a5(v5);
      v12 = 0;
      while (1)
      {
        *(_OWORD *)(a2 + 16 * v12) = *(_OWORD *)(v11 + 16 * v12);
        if (v7 - 1 == v12)
          goto LABEL_11;
        if (v12 + 1 == a4(v5))
        {
          v7 = v12 + 1;
          goto LABEL_11;
        }
        v11 = a5(v5);
        if (++v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AC6A0(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_i8(v3))
    {
      v7 = geom_collection_data_i8(v3);
      v8 = 0;
      while (1)
      {
        *(_BYTE *)(a2 + v8) = *(_BYTE *)(v7 + v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_i8(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_i8(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t *sub_2289AC75C(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = result;
  if (!a2)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_11:
    *v4 = v3;
    v4[1] = v5;
    return (uint64_t *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (geom_collection_size_u16(v3))
    {
      v7 = geom_collection_data_u16(v3);
      v8 = 0;
      while (1)
      {
        *(_WORD *)(a2 + 2 * v8) = *(_WORD *)(v7 + 2 * v8);
        if (v5 - 1 == v8)
          goto LABEL_11;
        if (v8 + 1 == geom_collection_size_u16(v3))
        {
          v5 = v8 + 1;
          goto LABEL_11;
        }
        v7 = geom_collection_data_u16(v3);
        if (++v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t geom_quadratic_bezier_2f.init(powerBasis:)(double a1, double a2, double a3)
{
  return sub_2289AC8C4((uint64_t (*)(_QWORD *))geom_power_basis_convert_to_quadratic_bezier_2f, a1, a2, a3);
}

uint64_t geom_quadratic_bezier_2f.init(interpolatePoints:)(double a1, double a2, double a3)
{
  return sub_2289AC8C4((uint64_t (*)(_QWORD *))geom_quadratic_bezier_interpolate_points_2f, a1, a2, a3);
}

uint64_t sub_2289AC8C4(uint64_t (*a1)(_QWORD *), double a2, double a3, double a4)
{
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return a1(v5);
}

double geom_quadratic_bezier_2f.subdivided(at:)@<D0>(uint64_t a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  double result;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0uLL;
  v13 = 0;
  v10 = 0uLL;
  v11 = 0;
  geom_quadratic_bezier_subdivide_2f((uint64_t)&v12, (uint64_t)&v10, a3, a4, a5, a2);
  result = *(double *)&v12;
  v7 = v13;
  v8 = v10;
  v9 = v11;
  *(_OWORD *)a1 = v12;
  *(_QWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  return result;
}

double geom_quadratic_bezier_2f.powerBasis.getter(float32x2_t a1, float32x2_t a2, float32x2_t a3)
{
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, 24);
  geom_quadratic_bezier_convert_to_power_basis_2f((uint64_t)v4, a1, a2, a3);
  return *(double *)v4;
}

double geom_quadratic_bezier_2f.findRoots(withXValue:)@<D0>(_QWORD *a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  return sub_2289ACAB0((uint64_t (*)(_QWORD *, double, double, double, float))geom_quadratic_bezier_find_roots_at_x_2f, a1, a2, a3, a4, a5);
}

double geom_quadratic_bezier_2f.findRoots(withYValue:)@<D0>(_QWORD *a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  return sub_2289ACAB0((uint64_t (*)(_QWORD *, double, double, double, float))geom_quadratic_bezier_find_roots_at_y_2f, a1, a2, a3, a4, a5);
}

double sub_2289ACAB0@<D0>(uint64_t (*a1)(_QWORD *, double, double, double, float)@<X0>, _QWORD *a2@<X8>, float a3@<S0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  unsigned int v7;
  double result;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v7 = a1(v9, a4, a5, a6, a3);
  result = *(double *)v9;
  *a2 = v9[0];
  a2[1] = v7;
  return result;
}

double geom_quadratic_bezier_2f.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>)
{
  unsigned int monotonic_intervals_2f;
  double result;
  double v7[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v7 = 0uLL;
  monotonic_intervals_2f = geom_quadratic_bezier_find_monotonic_intervals_2f(v7, a2, a3, a4);
  result = v7[0];
  *(_OWORD *)a1 = *(_OWORD *)v7;
  *(_QWORD *)(a1 + 16) = monotonic_intervals_2f;
  return result;
}

void __swiftcall geom_quadratic_bezier_2f.orientedBBoxMatrix()(simd_float3x3 *__return_ptr retstr)
{
  float32x2_t v1;
  float32x2_t v2;
  float32x2_t v3;
  simd_float3 v5;
  simd_float3 v6;
  simd_float3 v7;

  *(double *)v5.i64 = geom_oriented_bounding_box_matrix_of_quadratic_bezier_2f(v1, v2, v3);
  retstr->columns[0] = v5;
  retstr->columns[1] = v6;
  retstr->columns[2] = v7;
}

void sub_2289ACBD0(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2289ACC68(a1, a2, a3, (double (*)(_QWORD *))geom_power_basis_convert_to_quadratic_bezier_2f, a4);
}

void sub_2289ACC1C(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  sub_2289ACC68(a1, a2, a3, (double (*)(_QWORD *))geom_quadratic_bezier_interpolate_points_2f, a4);
}

void sub_2289ACC68(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, double (*a4)(_QWORD *)@<X5>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v10[0] = *a1;
  v10[1] = v6;
  v10[2] = v7;
  *(double *)a5 = a4(v10);
  *(_QWORD *)(a5 + 8) = v8;
  *(_QWORD *)(a5 + 16) = v9;
}

void sub_2289ACCDC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  geom_quadratic_bezier_elevate_from_linear_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
}

void sub_2289ACD08(float32x2_t *a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t v3;
  float32x2_t v4;

  *a2 = geom_quadratic_bezier_from_derivative_of_cubic_bezier_2f(*a1, a1[1]);
  a2[1] = v3;
  a2[2] = v4;
}

double sub_2289ACD38(double *a1, _QWORD *a2, _QWORD *a3)
{
  float32x2_t *v3;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  double result;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v13 = 0.0;
  v14 = 0;
  v15 = 0;
  geom_quadratic_bezier_convert_to_power_basis_2f((uint64_t)&v13, v7, v8, v9);
  result = v13;
  v11 = v14;
  v12 = v15;
  *a1 = v13;
  *a2 = v11;
  *a3 = v12;
  return result;
}

double sub_2289ACDC4(uint64_t a1, uint64_t a2, float *a3)
{
  float32x2_t *v3;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  double result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v16 = 0uLL;
  v17 = 0;
  v14 = 0uLL;
  v15 = 0;
  geom_quadratic_bezier_subdivide_2f((uint64_t)&v16, (uint64_t)&v14, v7, v8, v9, v6);
  result = *(double *)&v16;
  v11 = v17;
  v12 = v14;
  v13 = v15;
  *(_OWORD *)a1 = v16;
  *(_QWORD *)(a1 + 16) = v11;
  *(_OWORD *)a2 = v12;
  *(_QWORD *)(a2 + 16) = v13;
  return result;
}

double sub_2289ACE68@<D0>(float *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289ACF00(a1, (uint64_t (*)(_QWORD *, double, double, double, float))geom_quadratic_bezier_find_roots_at_x_2f, a2);
}

double sub_2289ACEB4@<D0>(float *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289ACF00(a1, (uint64_t (*)(_QWORD *, double, double, double, float))geom_quadratic_bezier_find_roots_at_y_2f, a2);
}

double sub_2289ACF00@<D0>(float *a1@<X0>, uint64_t (*a2)(_QWORD *, double, double, double, float)@<X3>, _QWORD *a3@<X8>)
{
  double *v3;
  float v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  double result;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *v3;
  v7 = v3[1];
  v8 = v3[2];
  v11[0] = 0;
  v9 = a2(v11, v6, v7, v8, v5);
  result = *(double *)v11;
  *a3 = v11[0];
  a3[1] = v9;
  return result;
}

double sub_2289ACF78@<D0>(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  unsigned int monotonic_intervals_2f;
  double result;
  double v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  *(_OWORD *)v8 = 0uLL;
  monotonic_intervals_2f = geom_quadratic_bezier_find_monotonic_intervals_2f(v8, v3, v4, v5);
  result = v8[0];
  *(_OWORD *)a1 = *(_OWORD *)v8;
  *(_QWORD *)(a1 + 16) = monotonic_intervals_2f;
  return result;
}

void sub_2289ACFEC(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t *v2;
  float32x2_t v4;
  float32x2_t v5;

  *a2 = geom_quadratic_bezier_extract_2f(*v2, v2[1], v2[2], *a1);
  a2[1] = v4;
  a2[2] = v5;
}

void sub_2289AD024(float32x2_t *a1@<X8>)
{
  float32x2_t *v1;
  float32x2_t v3;

  *a1 = geom_quadratic_bezier_demote_to_linear_2f(*v1, v1[1], v1[2]);
  a1[1] = v3;
}

void sub_2289AD050(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t *v2;

  *a2 = geom_quadratic_bezier_point_at_2f(*v2, v2[1], v2[2], *a1);
}

void sub_2289AD080(float *a1@<X0>, double *a2@<X8>)
{
  sub_2289AD098(a1, (double (*)(double, double, double, float))geom_quadratic_bezier_tangent_at_2f, a2);
}

void sub_2289AD08C(float *a1@<X0>, double *a2@<X8>)
{
  sub_2289AD098(a1, (double (*)(double, double, double, float))geom_quadratic_bezier_normal_at_2f, a2);
}

void sub_2289AD098(float *a1@<X0>, double (*a2)(double, double, double, float)@<X3>, double *a3@<X8>)
{
  double *v3;

  *a3 = a2(*v3, v3[1], v3[2], *a1);
}

void sub_2289AD0C8(unsigned __int8 a1@<W0>, float *a2@<X1>, float32x2_t *a3@<X8>)
{
  float32x2_t *v3;

  *a3 = geom_quadratic_bezier_derivative_at_2f(a1, *v3, v3[1], v3[2], *a2);
}

void sub_2289AD0FC(float *a1@<X0>, float *a2@<X8>)
{
  float32x2_t *v2;

  *a2 = geom_quadratic_bezier_curvature_at_2f(*v2, v2[1], v2[2], *a1);
}

void sub_2289AD12C(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  float32x2_t *v3;

  *a3 = geom_quadratic_bezier_arc_length_in_range_2f(*v3, v3[1], v3[2], *a1, *a2);
}

void sub_2289AD160(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  uint64_t v3;

  *(double *)a1 = geom_tight_bbox_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *(_QWORD *)(a1 + 8) = v3;
}

void sub_2289AD18C(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(double *)a1 = geom_oriented_bounding_box_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
}

void sub_2289AD1BC(_OWORD *a1@<X8>)
{
  float32x2_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(double *)&v3 = geom_oriented_bounding_box_matrix_of_quadratic_bezier_2f(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

uint64_t geom_quadratic_bezier_2d.init(powerBasis:)(__n128 a1, __n128 a2, __n128 a3)
{
  return sub_2289AD284((uint64_t (*)(_OWORD *))geom_power_basis_convert_to_quadratic_bezier_2d, a1, a2, a3);
}

uint64_t geom_quadratic_bezier_2d.init(interpolatePoints:)(__n128 a1, __n128 a2, __n128 a3)
{
  return sub_2289AD284((uint64_t (*)(_OWORD *))geom_quadratic_bezier_interpolate_points_2d, a1, a2, a3);
}

uint64_t sub_2289AD284(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4)
{
  _OWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  return a1(v5);
}

float64_t geom_quadratic_bezier_2d.subdivided(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  float64_t result;
  __int128 v7;
  __int128 v8;
  float64x2_t v9;
  __int128 v10;
  __int128 v11;
  float64x2_t v12;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  geom_quadratic_bezier_subdivide_2d(&v15, &v12, a3, a4, a5, a2);
  result = v15.f64[0];
  v7 = v16;
  v8 = v17;
  v9 = v12;
  v10 = v13;
  v11 = v14;
  *(float64x2_t *)a1 = v15;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 32) = v8;
  *(float64x2_t *)(a1 + 48) = v9;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v11;
  return result;
}

float64_t geom_quadratic_bezier_2d.powerBasis.getter(float64x2_t a1, float64x2_t a2, float64x2_t a3)
{
  float64x2_t v4[3];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  geom_quadratic_bezier_convert_to_power_basis_2d(v4, a1, a2, a3);
  return v4[0].f64[0];
}

double geom_quadratic_bezier_2d.findRoots(withXValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  return sub_2289AD470((uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_x_2d, a1, a2, a3, a4, a5);
}

double geom_quadratic_bezier_2d.findRoots(withYValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>)
{
  return sub_2289AD470((uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_y_2d, a1, a2, a3, a4, a5);
}

double sub_2289AD470@<D0>(uint64_t (*a1)(double *, __n128, __n128, __n128, double)@<X0>, uint64_t a2@<X8>, double a3@<D0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>)
{
  unsigned int v7;
  double result;
  double v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v9 = 0uLL;
  v7 = a1(v9, a4, a5, a6, a3);
  result = v9[0];
  *(_OWORD *)a2 = *(_OWORD *)v9;
  *(_QWORD *)(a2 + 16) = v7;
  return result;
}

__n128 geom_quadratic_bezier_2d.findMonotonicIntervals()@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>)
{
  unsigned int monotonic_intervals_2d;
  __n128 result;
  __int128 v7;
  __n128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  monotonic_intervals_2d = geom_quadratic_bezier_find_monotonic_intervals_2d(&v7, a2, a3, a4);
  result = v8;
  *(_OWORD *)a1 = v7;
  *(__n128 *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 32) = monotonic_intervals_2d;
  return result;
}

void __swiftcall geom_quadratic_bezier_2d.orientedBBoxMatrix()(simd_double3x3 *__return_ptr retstr)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[6];

  geom_oriented_bounding_box_matrix_of_quadratic_bezier_2d((uint64_t)v10, v1, v2, v3);
  v5 = v10[1];
  v6 = v10[2];
  v7 = v10[3];
  v8 = v10[4];
  v9 = v10[5];
  *(_OWORD *)retstr->columns[0].f64 = v10[0];
  *(_OWORD *)&retstr->columns[0].f64[2] = v5;
  *(_OWORD *)retstr->columns[1].f64 = v6;
  *(_OWORD *)&retstr->columns[1].f64[2] = v7;
  *(_OWORD *)retstr->columns[2].f64 = v8;
  *(_OWORD *)&retstr->columns[2].f64[2] = v9;
}

void sub_2289AD5B0(_OWORD *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, _OWORD *a4@<X8>)
{
  sub_2289AD648(a1, a2, a3, (double (*)(_OWORD *))geom_power_basis_convert_to_quadratic_bezier_2d, a4);
}

void sub_2289AD5FC(_OWORD *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, _OWORD *a4@<X8>)
{
  sub_2289AD648(a1, a2, a3, (double (*)(_OWORD *))geom_quadratic_bezier_interpolate_points_2d, a4);
}

void sub_2289AD648(_OWORD *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, double (*a4)(_OWORD *)@<X5>, _OWORD *a5@<X8>)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v11[0] = *a1;
  v11[1] = v6;
  v11[2] = v7;
  *(double *)&v8 = a4(v11);
  *a5 = v8;
  a5[1] = v9;
  a5[2] = v10;
}

void sub_2289AD6BC(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  geom_quadratic_bezier_elevate_from_linear_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
}

void sub_2289AD6E8(float64x2_t *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(double *)&v3 = geom_quadratic_bezier_from_derivative_of_cubic_bezier_2d(*a1, a1[1]);
  *a2 = v3;
  a2[1] = v4;
  a2[2] = v5;
}

float64_t sub_2289AD718(float64x2_t *a1, _OWORD *a2, _OWORD *a3)
{
  float64x2_t *v3;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64_t result;
  __int128 v11;
  __int128 v12;
  float64x2_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  geom_quadratic_bezier_convert_to_power_basis_2d(&v13, v7, v8, v9);
  result = v13.f64[0];
  v11 = v14;
  v12 = v15;
  *a1 = v13;
  *a2 = v11;
  *a3 = v12;
  return result;
}

float64_t sub_2289AD7A8(uint64_t a1, float64x2_t *a2, double *a3)
{
  float64x2_t *v3;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64_t result;
  __int128 v11;
  __int128 v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  geom_quadratic_bezier_subdivide_2d(&v19, &v16, v7, v8, v9, v6);
  result = v19.f64[0];
  v11 = v20;
  v12 = v21;
  v13 = v16;
  v14 = v17;
  v15 = v18;
  *(float64x2_t *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v12;
  *a2 = v13;
  a2[1] = v14;
  a2[2] = v15;
  return result;
}

double sub_2289AD84C@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AD8E4(a1, (uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_x_2d, a2);
}

double sub_2289AD898@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AD8E4(a1, (uint64_t (*)(double *, __n128, __n128, __n128, double))geom_quadratic_bezier_find_roots_at_y_2d, a2);
}

double sub_2289AD8E4@<D0>(double *a1@<X0>, uint64_t (*a2)(double *, __n128, __n128, __n128, double)@<X3>, uint64_t a3@<X8>)
{
  __n128 *v3;
  double v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  unsigned int v9;
  double result;
  double v11[3];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *v3;
  v7 = v3[1];
  v8 = v3[2];
  *(_OWORD *)v11 = 0uLL;
  v9 = a2(v11, v6, v7, v8, v5);
  result = v11[0];
  *(_OWORD *)a3 = *(_OWORD *)v11;
  *(_QWORD *)(a3 + 16) = v9;
  return result;
}

__n128 sub_2289AD95C@<Q0>(uint64_t a1@<X8>)
{
  float64x2_t *v1;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  unsigned int monotonic_intervals_2d;
  __n128 result;
  __int128 v8;
  __n128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v8 = 0u;
  v9 = 0u;
  monotonic_intervals_2d = geom_quadratic_bezier_find_monotonic_intervals_2d(&v8, v3, v4, v5);
  result = v9;
  *(_OWORD *)a1 = v8;
  *(__n128 *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 32) = monotonic_intervals_2d;
  return result;
}

void sub_2289AD9D4(double *a1@<X0>, _OWORD *a2@<X8>)
{
  float64x2_t *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  *(double *)&v4 = geom_quadratic_bezier_extract_2d(*v2, v2[1], v2[2], *a1);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
}

void sub_2289ADA0C(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;

  *(double *)&v3 = geom_quadratic_bezier_demote_to_linear_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_2289ADA38(double *a1@<X0>, _OWORD *a2@<X8>)
{
  float64x2_t *v2;
  __int128 v4;

  *(double *)&v4 = geom_quadratic_bezier_point_at_2d(*v2, v2[1], v2[2], *a1);
  *a2 = v4;
}

void sub_2289ADA68(double *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_2289ADA80(a1, (double (*)(__n128, __n128, __n128, double))geom_quadratic_bezier_tangent_at_2d, a2);
}

void sub_2289ADA74(double *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_2289ADA80(a1, (double (*)(__n128, __n128, __n128, double))geom_quadratic_bezier_normal_at_2d, a2);
}

void sub_2289ADA80(double *a1@<X0>, double (*a2)(__n128, __n128, __n128, double)@<X3>, _OWORD *a3@<X8>)
{
  __n128 *v3;
  __int128 v5;

  *(double *)&v5 = a2(*v3, v3[1], v3[2], *a1);
  *a3 = v5;
}

void sub_2289ADAB0(unsigned __int8 a1@<W0>, double *a2@<X1>, _OWORD *a3@<X8>)
{
  float64x2_t *v3;
  __int128 v5;

  *(double *)&v5 = geom_quadratic_bezier_derivative_at_2d(a1, *v3, v3[1], v3[2], *a2);
  *a3 = v5;
}

void sub_2289ADAE4(double *a1@<X0>, long double *a2@<X8>)
{
  float64x2_t *v2;

  *a2 = geom_quadratic_bezier_curvature_at_2d(*v2, v2[1], v2[2], *a1);
}

void sub_2289ADB14(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  float64x2_t *v3;

  *a3 = geom_quadratic_bezier_arc_length_in_range_2d(*v3, v3[1], v3[2], *a1, *a2);
}

void sub_2289ADB48(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;

  *(double *)&v3 = geom_tight_bbox_of_quadratic_bezier_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_2289ADB74(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  *(double *)&v3 = geom_oriented_bounding_box_of_quadratic_bezier_2d(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
}

double sub_2289ADBA4@<D0>(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[6];

  geom_oriented_bounding_box_matrix_of_quadratic_bezier_2d((uint64_t)v9, *v1, v1[1], v1[2]);
  result = *(double *)v9;
  v4 = v9[1];
  v5 = v9[2];
  v6 = v9[3];
  v7 = v9[4];
  v8 = v9[5];
  *a1 = v9[0];
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

float32x2_t geom_cubic_bezier_2f.init(interpolatePoints:)(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float32x2_t v5[5];

  v5[4] = *(float32x2_t *)MEMORY[0x24BDAC8D0];
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return geom_cubic_bezier_interpolate_points_2f(v5);
}

double geom_cubic_bezier_2f.init(interpolatePoints:derivatives:)(double a1, double a2)
{
  double v3[3];

  v3[2] = *(double *)MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  return geom_cubic_bezier_interpolate_points_and_derivatives_2f(v3);
}

double geom_cubic_bezier_2f.init(powerBasis:)(double a1, double a2, double a3, double a4)
{
  double v5[5];

  v5[4] = *(double *)MEMORY[0x24BDAC8D0];
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return geom_power_basis_convert_to_cubic_bezier_2f(v5);
}

double geom_cubic_bezier_2f.powerBasis.getter(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  _OWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(v5, 0, sizeof(v5));
  geom_cubic_bezier_convert_to_power_basis_2f((uint64_t)v5, a1, a2, a3, a4);
  return *(double *)v5;
}

double geom_cubic_bezier_2f.subdivided(at:)@<D0>(_OWORD *a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>, float32x2_t a6@<D4>)
{
  double result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  geom_cubic_bezier_subdivide_2f((uint64_t)&v13, (uint64_t)&v11, a3, a4, a5, a6, a2);
  result = *(double *)&v13;
  v8 = v14;
  v9 = v11;
  v10 = v12;
  *a1 = v13;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  return result;
}

float geom_cubic_bezier_2f.findRoots(withXValue:)@<S0>(uint64_t a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  return sub_2289ADE84((uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_x_2f, a1, a2, a3, a4, a5, a6);
}

float geom_cubic_bezier_2f.findRoots(withYValue:)@<S0>(uint64_t a1@<X8>, float a2@<S0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  return sub_2289ADE84((uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_y_2f, a1, a2, a3, a4, a5, a6);
}

float sub_2289ADE84@<S0>(uint64_t (*a1)(uint64_t *, double, double, double, double, float)@<X0>, uint64_t a2@<X8>, float a3@<S0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>)
{
  unsigned int v8;
  float result;
  uint64_t v10;
  float v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  *(_QWORD *)v11 = 0;
  v8 = a1(&v10, a4, a5, a6, a7, a3);
  result = v11[0];
  *(_QWORD *)a2 = v10;
  *(float *)(a2 + 8) = result;
  *(_QWORD *)(a2 + 16) = v8;
  return result;
}

double geom_cubic_bezier_2f.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float32x2_t a2@<D0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>)
{
  unsigned int monotonic_intervals_2f;
  double result;
  __int128 v8;
  double v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  *(_OWORD *)v9 = 0u;
  monotonic_intervals_2f = geom_cubic_bezier_find_monotonic_intervals_2f(&v8, a2, a3, a4, a5);
  *(_OWORD *)a1 = v8;
  result = v9[0];
  *(double *)(a1 + 16) = v9[0];
  *(_QWORD *)(a1 + 24) = monotonic_intervals_2f;
  return result;
}

double geom_cubic_bezier_2f.findCharacteristicPoints()(double *a1)
{
  uint64_t characteristic_points_2f;
  double result;
  double v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v4 = 0.0;
  characteristic_points_2f = geom_cubic_bezier_find_characteristic_points_2f(&v5, &v4);
  result = v4;
  *a1 = v4;
  *((_QWORD *)a1 + 1) = characteristic_points_2f;
  return result;
}

double geom_cubic_bezier_2f.fitWithQuadraticBezierPair(at:)@<D0>(uint64_t a1@<X8>, float a2@<S0>, float32x2_t a3@<D1>, float32x2_t a4@<D2>, float32x2_t a5@<D3>, float32x2_t a6@<D4>)
{
  double result;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0uLL;
  v14 = 0;
  v11 = 0uLL;
  v12 = 0;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2f((uint64_t)&v13, (uint64_t)&v11, a3, a4, a5, a6, a2);
  result = *(double *)&v13;
  v8 = v14;
  v9 = v11;
  v10 = v12;
  *(_OWORD *)a1 = v13;
  *(_QWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  return result;
}

void __swiftcall geom_cubic_bezier_2f.orientedBBoxMatrix()(simd_float3x3 *__return_ptr retstr)
{
  float32x2_t v1;
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  simd_float3 v6;
  simd_float3 v7;
  simd_float3 v8;

  *(double *)v6.i64 = geom_oriented_bounding_box_matrix_of_cubic_bezier_2f(v1, v2, v3, v4);
  retstr->columns[0] = v6;
  retstr->columns[1] = v7;
  retstr->columns[2] = v8;
}

void sub_2289AE0D8(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  geom_cubic_bezier_elevate_from_linear_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_2289AE104(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  geom_cubic_bezier_elevate_from_quadratic_bezier_2f();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_2289AE134(double *a1@<X0>, double *a2@<X1>, double *a3@<X2>, double *a4@<X3>, uint64_t a5@<X8>)
{
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12[5];

  v12[4] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  v12[2] = v7;
  v12[3] = v8;
  *(double *)a5 = geom_power_basis_convert_to_cubic_bezier_2f(v12);
  *(_QWORD *)(a5 + 8) = v9;
  *(_QWORD *)(a5 + 16) = v10;
  *(_QWORD *)(a5 + 24) = v11;
}

void sub_2289AE1AC(float32x2_t *a1@<X0>, float32x2_t *a2@<X1>, float32x2_t *a3@<X2>, float32x2_t *a4@<X3>, float32x2_t *a5@<X8>)
{
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12[5];

  v12[4] = *(float32x2_t *)MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  v12[2] = v7;
  v12[3] = v8;
  *a5 = geom_cubic_bezier_interpolate_points_2f(v12);
  a5[1] = v9;
  a5[2] = v10;
  a5[3] = v11;
}

void sub_2289AE224(double *a1@<X0>, double *a2@<X1>, uint64_t a3@<X8>)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8[3];

  v8[2] = *(double *)MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v8[0] = *a1;
  v8[1] = v4;
  *(double *)a3 = geom_cubic_bezier_interpolate_points_and_derivatives_2f(v8);
  *(_QWORD *)(a3 + 8) = v5;
  *(_QWORD *)(a3 + 16) = v6;
  *(_QWORD *)(a3 + 24) = v7;
}

void sub_2289AE298(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t *v2;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;

  *a2 = geom_cubic_bezier_extract_2f(*v2, v2[1], v2[2], v2[3], *a1);
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
}

void sub_2289AE2D0(float32x2_t *a1@<X8>)
{
  float32x2_t *v1;
  float32x2_t v3;

  *a1 = geom_cubic_bezier_demote_to_linear_2f(*v1, v1[1], v1[2], v1[3]);
  a1[1] = v3;
}

void sub_2289AE2FC(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  uint64_t v3;
  uint64_t v4;

  *(double *)a1 = geom_cubic_bezier_demote_to_quadratic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
}

void sub_2289AE32C(float *a1@<X0>, float32x2_t *a2@<X8>)
{
  float32x2_t *v2;

  *a2 = geom_cubic_bezier_point_at_2f(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_2289AE35C(float *a1@<X0>, double *a2@<X8>)
{
  sub_2289AE374(a1, (double (*)(double, double, double, double, float))geom_cubic_bezier_tangent_at_2f, a2);
}

void sub_2289AE368(float *a1@<X0>, double *a2@<X8>)
{
  sub_2289AE374(a1, (double (*)(double, double, double, double, float))geom_cubic_bezier_normal_at_2f, a2);
}

void sub_2289AE374(float *a1@<X0>, double (*a2)(double, double, double, double, float)@<X3>, double *a3@<X8>)
{
  double *v3;

  *a3 = a2(*v3, v3[1], v3[2], v3[3], *a1);
}

void sub_2289AE3A4(unsigned __int8 a1@<W0>, float *a2@<X1>, float32x2_t *a3@<X8>)
{
  float32x2_t *v3;

  *a3 = geom_cubic_bezier_derivative_at_2f(a1, *v3, v3[1], v3[2], v3[3], *a2);
}

void sub_2289AE3D8(float *a1@<X0>, float *a2@<X8>)
{
  float32x2_t *v2;

  *a2 = geom_cubic_bezier_curvature_at_2f(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_2289AE408(float *a1@<X0>, float *a2@<X1>, float *a3@<X8>)
{
  float32x2_t *v3;

  *a3 = geom_cubic_bezier_arc_length_in_range_2f(*v3, v3[1], v3[2], v3[3], *a1, *a2);
}

unint64_t sub_2289AE43C(uint64_t *a1)
{
  uint64_t v1;

  return geom_cubic_bezier_fit_with_quadratic_beziers_2f(*a1, *(double *)v1, *(float32x2_t *)(v1 + 8), *(float32x2_t *)(v1 + 16), *(float32x2_t *)(v1 + 24));
}

double sub_2289AE44C(_OWORD *a1, _OWORD *a2, float *a3)
{
  float32x2_t *v3;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  double result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v10 = v3[3];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  geom_cubic_bezier_subdivide_2f((uint64_t)&v17, (uint64_t)&v15, v7, v8, v9, v10, v6);
  result = *(double *)&v17;
  v12 = v18;
  v13 = v15;
  v14 = v16;
  *a1 = v17;
  a1[1] = v12;
  *a2 = v13;
  a2[1] = v14;
  return result;
}

double sub_2289AE4EC(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  float32x2_t *v4;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  double result;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v12 = v4[3];
  v16 = 0u;
  v17 = 0u;
  geom_cubic_bezier_convert_to_power_basis_2f((uint64_t)&v16, v9, v10, v11, v12);
  v14 = *((_QWORD *)&v16 + 1);
  result = *(double *)&v16;
  v15 = v17;
  *a1 = v16;
  *a2 = v14;
  *a3 = v15;
  *a4 = *((_QWORD *)&v15 + 1);
  return result;
}

float sub_2289AE588@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AE620(a1, (uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_x_2f, a2);
}

float sub_2289AE5D4@<S0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AE620(a1, (uint64_t (*)(uint64_t *, double, double, double, double, float))geom_cubic_bezier_find_roots_at_y_2f, a2);
}

float sub_2289AE620@<S0>(float *a1@<X0>, uint64_t (*a2)(uint64_t *, double, double, double, double, float)@<X3>, uint64_t a3@<X8>)
{
  double *v3;
  float v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unsigned int v10;
  float result;
  uint64_t v12;
  float v13[4];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *v3;
  v7 = v3[1];
  v8 = v3[2];
  v9 = v3[3];
  v12 = 0;
  *(_QWORD *)v13 = 0;
  v10 = a2(&v12, v6, v7, v8, v9, v5);
  result = v13[0];
  *(_QWORD *)a3 = v12;
  *(float *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = v10;
  return result;
}

double sub_2289AE6A0@<D0>(uint64_t a1@<X8>)
{
  float32x2_t *v1;

  return geom_cubic_bezier_2f.findMonotonicIntervals()(a1, *v1, v1[1], v1[2], v1[3]);
}

double sub_2289AE6AC(double *a1)
{
  uint64_t characteristic_points_2f;
  double result;
  double v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v4 = 0.0;
  characteristic_points_2f = geom_cubic_bezier_find_characteristic_points_2f(&v5, &v4);
  result = v4;
  *a1 = v4;
  *((_QWORD *)a1 + 1) = characteristic_points_2f;
  return result;
}

double sub_2289AE72C(uint64_t a1, uint64_t a2, float *a3)
{
  float32x2_t *v3;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  double result;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v10 = v3[3];
  v17 = 0uLL;
  v18 = 0;
  v15 = 0uLL;
  v16 = 0;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2f((uint64_t)&v17, (uint64_t)&v15, v7, v8, v9, v10, v6);
  result = *(double *)&v17;
  v12 = v18;
  v13 = v15;
  v14 = v16;
  *(_OWORD *)a1 = v17;
  *(_QWORD *)(a1 + 16) = v12;
  *(_OWORD *)a2 = v13;
  *(_QWORD *)(a2 + 16) = v14;
  return result;
}

void sub_2289AE7D0(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  uint64_t v3;

  *(double *)a1 = geom_tight_bbox_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(_QWORD *)(a1 + 8) = v3;
}

void sub_2289AE7FC(uint64_t a1@<X8>)
{
  float32x2_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(double *)a1 = geom_oriented_bounding_box_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
}

void sub_2289AE82C(_OWORD *a1@<X8>)
{
  float32x2_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(double *)&v3 = geom_oriented_bounding_box_matrix_of_cubic_bezier_2f(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

float64_t geom_cubic_bezier_2d.init(interpolatePoints:)(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return geom_cubic_bezier_interpolate_points_2d(v5);
}

double geom_cubic_bezier_2d.init(interpolatePoints:derivatives:)(__n128 a1, __n128 a2)
{
  double result;
  __n128 v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = a1;
  v3[1] = a2;
  *(_QWORD *)&result = geom_cubic_bezier_interpolate_points_and_derivatives_2d(v3).n128_u64[0];
  return result;
}

double geom_cubic_bezier_2d.init(powerBasis:)(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  double result;
  __n128 v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  *(_QWORD *)&result = geom_power_basis_convert_to_cubic_bezier_2d(v5).n128_u64[0];
  return result;
}

float64_t geom_cubic_bezier_2d.powerBasis.getter(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4)
{
  float64x2_t v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(v5, 0, sizeof(v5));
  geom_cubic_bezier_convert_to_power_basis_2d(v5, a1, a2, a3, a4);
  return v5[0].f64[0];
}

float64_t geom_cubic_bezier_2d.subdivided(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  float64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float64x2_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  float64x2_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  geom_cubic_bezier_subdivide_2d(&v19, &v15, a3, a4, a5, a6, a2);
  result = v19.f64[0];
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v15;
  v12 = v16;
  v13 = v17;
  v14 = v18;
  *(float64x2_t *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
  *(_OWORD *)(a1 + 48) = v10;
  *(float64x2_t *)(a1 + 64) = v11;
  *(_OWORD *)(a1 + 80) = v12;
  *(_OWORD *)(a1 + 96) = v13;
  *(_OWORD *)(a1 + 112) = v14;
  return result;
}

double geom_cubic_bezier_2d.findRoots(withXValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>)
{
  return sub_2289AEAFC((uint64_t (*)(__int128 *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_x_2d, a1, a2, a3, a4, a5, a6);
}

double geom_cubic_bezier_2d.findRoots(withYValue:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>, __n128 a4@<Q2>, __n128 a5@<Q3>, __n128 a6@<Q4>)
{
  return sub_2289AEAFC((uint64_t (*)(__int128 *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_y_2d, a1, a2, a3, a4, a5, a6);
}

double sub_2289AEAFC@<D0>(uint64_t (*a1)(__int128 *, __n128, __n128, __n128, __n128, double)@<X0>, uint64_t a2@<X8>, double a3@<D0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>, __n128 a7@<Q4>)
{
  unsigned int v8;
  double result;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v8 = a1(&v11, a4, a5, a6, a7, a3);
  result = *(double *)&v11;
  v10 = v12;
  *(_OWORD *)a2 = v11;
  *(_QWORD *)(a2 + 16) = v10;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

double geom_cubic_bezier_2d.findMonotonicIntervals()@<D0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>)
{
  unsigned int monotonic_intervals_2d;
  __int128 v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  monotonic_intervals_2d = geom_cubic_bezier_find_monotonic_intervals_2d(&v9, a2, a3, a4, a5);
  v7 = v10;
  *(_OWORD *)a1 = v9;
  *(_OWORD *)(a1 + 16) = v7;
  result = *(double *)&v11;
  *(_OWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 48) = monotonic_intervals_2d;
  return result;
}

double geom_cubic_bezier_2d.findCharacteristicPoints()(uint64_t a1)
{
  uint64_t characteristic_points_2d;
  double result;
  double v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  *(_OWORD *)v4 = 0uLL;
  characteristic_points_2d = geom_cubic_bezier_find_characteristic_points_2d(&v5, v4);
  result = v4[0];
  *(_OWORD *)a1 = *(_OWORD *)v4;
  *(_QWORD *)(a1 + 16) = characteristic_points_2d;
  return result;
}

float64_t geom_cubic_bezier_2d.fitWithQuadraticBezierPair(at:)@<D0>(uint64_t a1@<X8>, double a2@<D0>, float64x2_t a3@<Q1>, float64x2_t a4@<Q2>, float64x2_t a5@<Q3>, float64x2_t a6@<Q4>)
{
  float64_t result;
  __int128 v8;
  __int128 v9;
  float64x2_t v10;
  __int128 v11;
  __int128 v12;
  float64x2_t v13;
  __int128 v14;
  __int128 v15;
  float64x2_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2d(&v16, &v13, a3, a4, a5, a6, a2);
  result = v16.f64[0];
  v8 = v17;
  v9 = v18;
  v10 = v13;
  v11 = v14;
  v12 = v15;
  *(float64x2_t *)a1 = v16;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
  *(float64x2_t *)(a1 + 48) = v10;
  *(_OWORD *)(a1 + 64) = v11;
  *(_OWORD *)(a1 + 80) = v12;
  return result;
}

void __swiftcall geom_cubic_bezier_2d.orientedBBoxMatrix()(simd_double3x3 *__return_ptr retstr)
{
  float64x2_t v1;
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];

  geom_oriented_bounding_box_matrix_of_cubic_bezier_2d((uint64_t)v11, v1, v2, v3, v4);
  v6 = v11[1];
  v7 = v11[2];
  v8 = v11[3];
  v9 = v11[4];
  v10 = v11[5];
  *(_OWORD *)retstr->columns[0].f64 = v11[0];
  *(_OWORD *)&retstr->columns[0].f64[2] = v6;
  *(_OWORD *)retstr->columns[1].f64 = v7;
  *(_OWORD *)&retstr->columns[1].f64[2] = v8;
  *(_OWORD *)retstr->columns[2].f64 = v9;
  *(_OWORD *)&retstr->columns[2].f64[2] = v10;
}

uint64_t sub_2289AED70()
{
  return sub_22898C854(&qword_2559D48A0, (uint64_t (*)(uint64_t))type metadata accessor for CubicBezier2f, (uint64_t)&protocol conformance descriptor for geom_cubic_bezier_2f);
}

uint64_t sub_2289AED9C()
{
  return sub_22898C854(&qword_2559D4040, (uint64_t (*)(uint64_t))type metadata accessor for LineSegment2f, (uint64_t)&protocol conformance descriptor for geom_line_segment_2f);
}

uint64_t sub_2289AEDC8()
{
  return sub_22898C854(&qword_2559D48A8, (uint64_t (*)(uint64_t))type metadata accessor for OrientedBBox2f, (uint64_t)&protocol conformance descriptor for geom_oriented_bbox_2f);
}

uint64_t sub_2289AEDF4()
{
  return sub_22898C854(&qword_2559D49B0, (uint64_t (*)(uint64_t))type metadata accessor for CubicBezier2d, (uint64_t)&protocol conformance descriptor for geom_cubic_bezier_2d);
}

uint64_t sub_2289AEE20()
{
  return sub_22898C854(&qword_2559D40C8, (uint64_t (*)(uint64_t))type metadata accessor for LineSegment2d, (uint64_t)&protocol conformance descriptor for geom_line_segment_2d);
}

uint64_t sub_2289AEE4C()
{
  return sub_22898C854(&qword_2559D49B8, (uint64_t (*)(uint64_t))type metadata accessor for OrientedBBox2d, (uint64_t)&protocol conformance descriptor for geom_oriented_bbox_2d);
}

uint64_t sub_2289AEE78()
{
  return sub_2289A1784(&qword_2559D4AC0, &qword_2559D4638, (uint64_t)off_24F147A20, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2f);
}

uint64_t sub_2289AEEAC()
{
  return sub_22898C854(&qword_2559D4AC8, (uint64_t (*)(uint64_t))type metadata accessor for QuadraticBezier2f, (uint64_t)&protocol conformance descriptor for geom_quadratic_bezier_2f);
}

uint64_t sub_2289AEED8()
{
  return sub_2289A1784(&qword_2559D4C10, &qword_2559D4770, (uint64_t)off_24F147A18, (uint64_t)&protocol conformance descriptor for OS_geom_collection_2d);
}

uint64_t sub_2289AEF0C()
{
  return sub_22898C854(&qword_2559D4C18, (uint64_t (*)(uint64_t))type metadata accessor for QuadraticBezier2d, (uint64_t)&protocol conformance descriptor for geom_quadratic_bezier_2d);
}

void sub_2289AEF38(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  geom_cubic_bezier_elevate_from_linear_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_2289AEF64(_OWORD *a1@<X8>)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  geom_cubic_bezier_elevate_from_quadratic_bezier_2d();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

void sub_2289AEF94(__n128 *a1@<X0>, __n128 *a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v8 = *a4;
  v12[0] = *a1;
  v12[1] = v6;
  v12[2] = v7;
  v12[3] = v8;
  *(__n128 *)a5 = geom_power_basis_convert_to_cubic_bezier_2d(v12);
  *(_OWORD *)(a5 + 16) = v9;
  *(_OWORD *)(a5 + 32) = v10;
  *(_OWORD *)(a5 + 48) = v11;
}

void sub_2289AF00C(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X2>, float64x2_t *a4@<X3>, _OWORD *a5@<X8>)
{
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  float64x2_t v13[4];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = *a2;
  v7 = *a3;
  v8 = *a4;
  v13[0] = *a1;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  *(double *)&v9 = geom_cubic_bezier_interpolate_points_2d(v13);
  *a5 = v9;
  a5[1] = v10;
  a5[2] = v11;
  a5[3] = v12;
}

void sub_2289AF084(__n128 *a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  __n128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v8[0] = *a1;
  v8[1] = v4;
  *(__n128 *)a3 = geom_cubic_bezier_interpolate_points_and_derivatives_2d(v8);
  *(_OWORD *)(a3 + 16) = v5;
  *(_OWORD *)(a3 + 32) = v6;
  *(_OWORD *)(a3 + 48) = v7;
}

void sub_2289AF0F8(double *a1@<X0>, _OWORD *a2@<X8>)
{
  float64x2_t *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *(double *)&v4 = geom_cubic_bezier_extract_2d(*v2, v2[1], v2[2], v2[3], *a1);
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
}

void sub_2289AF130(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;

  *(double *)&v3 = geom_cubic_bezier_demote_to_linear_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_2289AF15C(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(double *)&v3 = geom_cubic_bezier_demote_to_quadratic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

void sub_2289AF18C(double *a1@<X0>, _OWORD *a2@<X8>)
{
  float64x2_t *v2;
  __int128 v4;

  *(double *)&v4 = geom_cubic_bezier_point_at_2d(*v2, v2[1], v2[2], v2[3], *a1);
  *a2 = v4;
}

void sub_2289AF1BC(double *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_2289AF1D4(a1, (double (*)(__n128, __n128, __n128, __n128, double))geom_cubic_bezier_tangent_at_2d, a2);
}

void sub_2289AF1C8(double *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_2289AF1D4(a1, (double (*)(__n128, __n128, __n128, __n128, double))geom_cubic_bezier_normal_at_2d, a2);
}

void sub_2289AF1D4(double *a1@<X0>, double (*a2)(__n128, __n128, __n128, __n128, double)@<X3>, _OWORD *a3@<X8>)
{
  __n128 *v3;
  __int128 v5;

  *(double *)&v5 = a2(*v3, v3[1], v3[2], v3[3], *a1);
  *a3 = v5;
}

void sub_2289AF204(unsigned __int8 a1@<W0>, double *a2@<X1>, _OWORD *a3@<X8>)
{
  float64x2_t *v3;
  __int128 v5;

  *(double *)&v5 = geom_cubic_bezier_derivative_at_2d(a1, *v3, v3[1], v3[2], v3[3], *a2);
  *a3 = v5;
}

void sub_2289AF238(double *a1@<X0>, long double *a2@<X8>)
{
  float64x2_t *v2;

  *a2 = geom_cubic_bezier_curvature_at_2d(*v2, v2[1], v2[2], v2[3], *a1);
}

void sub_2289AF268(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  float64x2_t *v3;

  *a3 = geom_cubic_bezier_arc_length_in_range_2d(*v3, v3[1], v3[2], v3[3], *a1, *a2);
}

unint64_t sub_2289AF29C(uint64_t *a1)
{
  float64x2_t *v1;

  return geom_cubic_bezier_fit_with_quadratic_beziers_2d(*a1, *v1, v1[1], v1[2], v1[3]);
}

float64_t sub_2289AF2AC(uint64_t a1, float64x2_t *a2, double *a3)
{
  float64x2_t *v3;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v10 = v3[3];
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  geom_cubic_bezier_subdivide_2d(&v23, &v19, v7, v8, v9, v10, v6);
  result = v23.f64[0];
  v12 = v24;
  v13 = v25;
  v14 = v26;
  v15 = v19;
  v16 = v20;
  v17 = v21;
  v18 = v22;
  *(float64x2_t *)a1 = v23;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *(_OWORD *)(a1 + 48) = v14;
  *a2 = v15;
  a2[1] = v16;
  a2[2] = v17;
  a2[3] = v18;
  return result;
}

float64_t sub_2289AF354(float64x2_t *a1, _OWORD *a2, _OWORD *a3, _OWORD *a4)
{
  float64x2_t *v4;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  float64x2_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v9 = *v4;
  v10 = v4[1];
  v11 = v4[2];
  v12 = v4[3];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  geom_cubic_bezier_convert_to_power_basis_2d(&v17, v9, v10, v11, v12);
  result = v17.f64[0];
  v14 = v18;
  v15 = v19;
  v16 = v20;
  *a1 = v17;
  *a2 = v14;
  *a3 = v15;
  *a4 = v16;
  return result;
}

double sub_2289AF3F4@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AF48C(a1, (uint64_t (*)(__int128 *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_x_2d, a2);
}

double sub_2289AF440@<D0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289AF48C(a1, (uint64_t (*)(__int128 *, __n128, __n128, __n128, __n128, double))geom_cubic_bezier_find_roots_at_y_2d, a2);
}

double sub_2289AF48C@<D0>(double *a1@<X0>, uint64_t (*a2)(__int128 *, __n128, __n128, __n128, __n128, double)@<X3>, uint64_t a3@<X8>)
{
  __n128 *v3;
  double v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  unsigned int v10;
  double result;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v6 = *v3;
  v7 = v3[1];
  v8 = v3[2];
  v9 = v3[3];
  v13 = 0u;
  v14 = 0u;
  v10 = a2(&v13, v6, v7, v8, v9, v5);
  result = *(double *)&v13;
  v12 = v14;
  *(_OWORD *)a3 = v13;
  *(_QWORD *)(a3 + 16) = v12;
  *(_QWORD *)(a3 + 24) = v10;
  return result;
}

double sub_2289AF510@<D0>(uint64_t a1@<X8>)
{
  float64x2_t *v1;

  return geom_cubic_bezier_2d.findMonotonicIntervals()(a1, *v1, v1[1], v1[2], v1[3]);
}

double sub_2289AF51C(uint64_t a1)
{
  uint64_t characteristic_points_2d;
  double result;
  double v4[2];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  *(_OWORD *)v4 = 0uLL;
  characteristic_points_2d = geom_cubic_bezier_find_characteristic_points_2d(&v5, v4);
  result = v4[0];
  *(_OWORD *)a1 = *(_OWORD *)v4;
  *(_QWORD *)(a1 + 16) = characteristic_points_2d;
  return result;
}

float64_t sub_2289AF59C(uint64_t a1, float64x2_t *a2, double *a3)
{
  float64x2_t *v3;
  double v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64_t result;
  __int128 v12;
  __int128 v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  v7 = *v3;
  v8 = v3[1];
  v9 = v3[2];
  v10 = v3[3];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  geom_cubic_bezier_fit_with_quadratic_bezier_pair_2d(&v20, &v17, v7, v8, v9, v10, v6);
  result = v20.f64[0];
  v12 = v21;
  v13 = v22;
  v14 = v17;
  v15 = v18;
  v16 = v19;
  *(float64x2_t *)a1 = v20;
  *(_OWORD *)(a1 + 16) = v12;
  *(_OWORD *)(a1 + 32) = v13;
  *a2 = v14;
  a2[1] = v15;
  a2[2] = v16;
  return result;
}

void sub_2289AF640(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;

  *(double *)&v3 = geom_tight_bbox_of_cubic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
}

void sub_2289AF66C(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  *(double *)&v3 = geom_oriented_bounding_box_of_cubic_bezier_2d(*v1, v1[1], v1[2], v1[3]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
}

double sub_2289AF69C@<D0>(_OWORD *a1@<X8>)
{
  float64x2_t *v1;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[6];

  geom_oriented_bounding_box_matrix_of_cubic_bezier_2d((uint64_t)v9, *v1, v1[1], v1[2], v1[3]);
  result = *(double *)v9;
  v4 = v9[1];
  v5 = v9[2];
  v6 = v9[3];
  v7 = v9[4];
  v8 = v9[5];
  *a1 = v9[0];
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return result;
}

double geom_cubic_bezier_derivative_at_2d(int a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, float64x2_t a5, double a6)
{
  double v6;
  double result;
  float64x2_t v13;
  float64x2_t v15;
  float64x2_t v17;

  v6 = 1.0 - a6;
  switch(a1)
  {
    case 0:
      *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a3, v6 * v6 * 3.0 * a6), a2, v6 * (v6 * v6)), a4, a6 * a6 * (v6 * 3.0)), a5, a6 * a6 * a6);
      break;
    case 1:
      *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vsubq_f64(a4, a3), v6 * 6.0 * a6), vsubq_f64(a3, a2), v6 * (v6 * 3.0)), vsubq_f64(a5, a4), a6 * 3.0 * a6);
      break;
    case 2:
      __asm { FMOV            V6.2D, #-2.0; jumptable 00000002289AF710 case 2 }
      v13 = vmlaq_n_f64(vmulq_n_f64(vaddq_f64(a5, vmlaq_f64(a3, _Q6, a4)), a6), vaddq_f64(a4, vmlaq_f64(a2, _Q6, a3)), v6);
      __asm { FMOV            V0.2D, #6.0 }
      *(_QWORD *)&result = *(_OWORD *)&vmulq_f64(v13, _Q0);
      break;
    case 3:
      v15 = vsubq_f64(a3, a4);
      __asm { FMOV            V2.2D, #3.0 }
      v17 = vmlaq_f64(vsubq_f64(a5, a2), _Q2, v15);
      __asm { FMOV            V1.2D, #6.0 }
      *(_QWORD *)&result = *(_OWORD *)&vmulq_f64(v17, _Q1);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double geom_cubic_bezier_point_at_2d(float64x2_t a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a2, (1.0 - a5) * (1.0 - a5) * 3.0 * a5), a1, (1.0 - a5) * ((1.0 - a5) * (1.0 - a5))), a3, a5 * a5 * ((1.0 - a5) * 3.0)), a4, a5 * a5 * a5);
  return result;
}

float32x2_t geom_cubic_bezier_derivative_at_2f(int a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, float a6)
{
  float v6;
  float32x2_t result;
  float32x2_t v8;
  float32x2_t v14;
  float32x2_t v16;

  v6 = 1.0 - a6;
  switch(a1)
  {
    case 0:
      result = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a3, (float)((float)(v6 * v6) * 3.0) * a6), a2, v6 * (float)(v6 * v6)), a4, (float)(a6 * a6) * (float)(v6 * 3.0)), a5, (float)(a6 * a6) * a6);
      break;
    case 1:
      result = vmla_n_f32(vmla_n_f32(vmul_n_f32(vsub_f32(a4, a3), (float)(v6 * 6.0) * a6), vsub_f32(a3, a2), v6 * (float)(v6 * 3.0)), vsub_f32(a5, a4), (float)(a6 * 3.0) * a6);
      break;
    case 2:
      v8 = vmla_n_f32(vmul_n_f32(vadd_f32(a5, vmla_f32(a3, (float32x2_t)0xC0000000C0000000, a4)), a6), vadd_f32(a4, vmla_f32(a2, (float32x2_t)0xC0000000C0000000, a3)), v6);
      __asm { FMOV            V0.2S, #6.0 }
      result = vmul_f32(v8, _D0);
      break;
    case 3:
      v14 = vsub_f32(a3, a4);
      __asm { FMOV            V2.2S, #3.0 }
      v16 = vmla_f32(vsub_f32(a5, a2), _D2, v14);
      __asm { FMOV            V1.2S, #6.0 }
      result = vmul_f32(v16, _D1);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

float32x2_t geom_cubic_bezier_point_at_2f(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float a5)
{
  return vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a2, (float)((float)((float)(1.0 - a5) * (float)(1.0 - a5)) * 3.0) * a5), a1, (float)(1.0 - a5) * (float)((float)(1.0 - a5) * (float)(1.0 - a5))), a3, (float)(a5 * a5) * (float)((float)(1.0 - a5) * 3.0)), a4, (float)(a5 * a5) * a5);
}

double geom_quadratic_bezier_derivative_at_2d(int a1, float64x2_t a2, float64x2_t a3, float64x2_t a4, double a5)
{
  double v5;
  double v6;
  float64x2_t v7;
  double result;
  float64x2_t v9;
  float64x2_t v15;

  v5 = 1.0 - a5;
  if (a1)
  {
    if (a1 == 2)
    {
      v9 = vaddq_f64(a2, a4);
      __asm { FMOV            V2.2D, #-2.0 }
      v15 = vmlaq_f64(v9, _Q2, a3);
      *(_QWORD *)&v6 = *(_OWORD *)&vaddq_f64(v15, v15);
    }
    else
    {
      v6 = 0.0;
      if (a1 == 1)
      {
        v7 = vmlaq_n_f64(vmulq_n_f64(vsubq_f64(a4, a3), a5), vsubq_f64(a3, a2), v5);
        *(_QWORD *)&v6 = *(_OWORD *)&vaddq_f64(v7, v7);
      }
    }
    return v6;
  }
  else
  {
    *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a3, (v5 + v5) * a5), a2, v5 * v5), a4, a5 * a5);
  }
  return result;
}

double geom_quadratic_bezier_point_at_2d(float64x2_t a1, float64x2_t a2, float64x2_t a3, double a4)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(a2, (1.0 - a4 + 1.0 - a4) * a4), a1, (1.0 - a4) * (1.0 - a4)), a3, a4 * a4);
  return result;
}

float32x2_t geom_quadratic_bezier_derivative_at_2f(int a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float a5)
{
  float v5;
  uint64_t v6;
  float32x2_t v7;
  float32x2_t v9;

  v5 = 1.0 - a5;
  if (a1)
  {
    if (a1 == 2)
    {
      v9 = vmla_f32(vadd_f32(a2, a4), (float32x2_t)0xC0000000C0000000, a3);
      return vadd_f32(v9, v9);
    }
    else
    {
      v6 = 0;
      if (a1 == 1)
      {
        v7 = vmla_n_f32(vmul_n_f32(vsub_f32(a4, a3), a5), vsub_f32(a3, a2), v5);
        return vadd_f32(v7, v7);
      }
    }
    return (float32x2_t)v6;
  }
  else
  {
    return vmla_n_f32(vmla_n_f32(vmul_n_f32(a3, (float)(v5 + v5) * a5), a2, v5 * v5), a4, a5 * a5);
  }
}

float32x2_t geom_quadratic_bezier_point_at_2f(float32x2_t a1, float32x2_t a2, float32x2_t a3, float a4)
{
  return vmla_n_f32(vmla_n_f32(vmul_n_f32(a2, (float)((float)(1.0 - a4) + (float)(1.0 - a4)) * a4), a1, (float)(1.0 - a4) * (float)(1.0 - a4)), a3, a4 * a4);
}

Swift::Void __swiftcall refineTriangleMesh(vertexPositions:triangleVertexIndices:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_collection_3f *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_refine_triangle_mesh_opt_3f_optional options)
{
  sub_2289AFAB8((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, outVertexPositions, outTriangleVertexIndices, (uint64_t)options.value.super.isa, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD, uint64_t))geom_refine_triangle_mesh_with_options_3f, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD))geom_refine_triangle_mesh_with_default_options_3f);
}

Swift::Void __swiftcall refineTriangleMesh(vertexPositions:triangleVertexIndices:outVertexPositions:outTriangleVertexIndices:options:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices, OS_geom_collection_3d *outVertexPositions, OS_geom_collection_u *outTriangleVertexIndices, OS_geom_refine_triangle_mesh_opt_3d_optional options)
{
  sub_2289AFAB8((uint64_t)vertexPositions._rawValue, (uint64_t)triangleVertexIndices._rawValue, outVertexPositions, outTriangleVertexIndices, (uint64_t)options.value.super.isa, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD, uint64_t))geom_refine_triangle_mesh_with_options_3d, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD))geom_refine_triangle_mesh_with_default_options_3d);
}

uint64_t sub_2289AFAB8(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD, uint64_t), uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, _QWORD, _QWORD))
{
  uint64_t v9;
  unint64_t v10;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a2 + 16) / 3uLL;
  if (a5)
    return a6(v9, a1 + 32, v10, a2 + 32, *a3, *a4, a5);
  else
    return a7(v9, a1 + 32, v10, a2 + 32, *a3, *a4);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.getter()
{
  return sub_2289AFD74(geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_2289AFE6C(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

void (*OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  const void *refinement_face_subset_data_3f;
  uint64_t refinement_face_subset_count_3f;
  _QWORD *v6;
  uint64_t v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  refinement_face_subset_data_3f = (const void *)geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f(v1);
  refinement_face_subset_count_3f = geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f(v1);
  v6 = sub_22899B5C8(refinement_face_subset_data_3f, refinement_face_subset_count_3f);
  v7 = (2 * v6[2]) | 1;
  *v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_2289AFBBC;
}

void sub_2289AFBBC(uint64_t **a1, char a2)
{
  sub_2289AFF50(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, (void (*)(uint64_t))geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3f.uvValues.getter()
{
  return sub_2289B0034(geom_refine_triangle_mesh_opt_get_uv_value_data_3f, geom_refine_triangle_mesh_opt_get_uv_value_count_3f);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3f.trianglesWithUVs.getter()
{
  return sub_22899A99C(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3f.triangleUVIndices.getter()
{
  return sub_22899AA08(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3f.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AA80((uint64_t)uvValues._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3f);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3f.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AAC4((uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTrianglesWithUVs.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

_QWORD *sub_2289AFC24(uint64_t a1, uint64_t a2)
{
  return sub_2289B00E4(a1, a2, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f);
}

uint64_t sub_2289AFC38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2289B0154(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

uint64_t (*sub_2289AFC4C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_refine_triangle_mesh_opt_3f.refinementFaceSubset.modify(v2);
  return sub_228993248;
}

_QWORD *sub_2289AFC94(uint64_t a1, uint64_t a2)
{
  return sub_2289B0200(a1, a2, geom_refine_triangle_mesh_opt_get_uv_value_data_3f, geom_refine_triangle_mesh_opt_get_uv_value_count_3f);
}

_QWORD *sub_2289AFCA8(uint64_t a1, uint64_t a2)
{
  return sub_22899AD3C(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3f);
}

uint64_t sub_2289AFCBC(uint64_t a1, uint64_t a2)
{
  return sub_22899ADA8(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3f, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3f);
}

id sub_2289AFCD0()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_uv_value_collection_3f(*v0);
}

id sub_2289AFCEC()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3f(*v0);
}

id sub_2289AFD08()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3f(*v0);
}

uint64_t sub_2289AFD24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AE74(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3f);
}

uint64_t sub_2289AFD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22899AEDC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3f);
}

_QWORD *sub_2289AFD58()
{
  _QWORD **v0;

  return geom_refine_triangle_mesh_opt_clear_uvs_3f(*v0);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.getter()
{
  return sub_2289AFD74(geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d);
}

_QWORD *sub_2289AFD74(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  const void *v4;
  uint64_t v5;

  v4 = (const void *)a1(v2);
  v5 = a2(v2);
  return sub_22899B5C8(v4, v5);
}

_QWORD *sub_2289AFDD0(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t), uint64_t (*a6)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v6 = *a2;
  if (!*result)
    return (_QWORD *)a6(*a2);
  v7 = result[2];
  v8 = result[3] >> 1;
  v9 = v8 - v7;
  if (__OFSUB__(v8, v7))
  {
    __break(1u);
  }
  else
  {
    v11 = result[1] + 4 * v7;
    swift_unknownObjectRetain();
    a5(v6, v9, v11);
    return (_QWORD *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_2289AFE6C(a1, a2, a3, a4, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t sub_2289AFE6C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(uint64_t, unint64_t, uint64_t), uint64_t (*a6)(uint64_t))
{
  uint64_t v6;

  if (!result)
    return a6(v6);
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a5(v6, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  const void *refinement_face_subset_data_3d;
  uint64_t refinement_face_subset_count_3d;
  _QWORD *v6;
  uint64_t v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  refinement_face_subset_data_3d = (const void *)geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d(v1);
  refinement_face_subset_count_3d = geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d(v1);
  v6 = sub_22899B5C8(refinement_face_subset_data_3d, refinement_face_subset_count_3d);
  v7 = (2 * v6[2]) | 1;
  *v3 = v6;
  v3[1] = v6 + 4;
  v3[2] = 0;
  v3[3] = v7;
  return sub_2289AFF3C;
}

void sub_2289AFF3C(uint64_t **a1, char a2)
{
  sub_2289AFF50(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, (void (*)(uint64_t))geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

void sub_2289AFF50(uint64_t **a1, char a2, void (*a3)(uint64_t, uint64_t, uint64_t), void (*a4)(uint64_t))
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v5 = *a1;
  v6 = **a1;
  if ((a2 & 1) != 0)
  {
    if (!v6)
    {
      a4(v5[4]);
      goto LABEL_9;
    }
    v7 = v5[2];
    v8 = (unint64_t)v5[3] >> 1;
    v9 = v8 - v7;
    if (!__OFSUB__(v8, v7))
    {
      v10 = v5[4];
      v11 = v5[1] + 4 * v7;
      swift_unknownObjectRetain();
      a3(v10, v9, v11);
      swift_unknownObjectRelease();
LABEL_9:
      swift_unknownObjectRelease();
LABEL_10:
      free(v5);
      return;
    }
    __break(1u);
  }
  else
  {
    if (!v6)
    {
      a4(v5[4]);
      goto LABEL_10;
    }
    v12 = v5[2];
    v13 = (unint64_t)v5[3] >> 1;
    if (!__OFSUB__(v13, v12))
    {
      a3(v5[4], v13 - v12, v5[1] + 4 * v12);
      goto LABEL_9;
    }
  }
  __break(1u);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3d.uvValues.getter()
{
  return sub_2289B0034(geom_refine_triangle_mesh_opt_get_uv_value_data_3d, geom_refine_triangle_mesh_opt_get_uv_value_count_3d);
}

_QWORD *sub_2289B0034(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  const void *v4;
  uint64_t v5;

  v4 = (const void *)a1(v2);
  v5 = a2(v2);
  return sub_22899B668(v4, v5);
}

_QWORD *OS_geom_refine_triangle_mesh_opt_3d.trianglesWithUVs.getter()
{
  return sub_22899A99C(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

uint64_t OS_geom_refine_triangle_mesh_opt_3d.triangleUVIndices.getter()
{
  return sub_22899AA08(geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3d.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AA80((uint64_t)uvValues._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3d);
}

Swift::Void __swiftcall OS_geom_refine_triangle_mesh_opt_3d.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(Swift::OpaquePointer uvValues, Swift::OpaquePointer trianglesWithUVs, Swift::OpaquePointer triangleUVIndices, OS_geom_collection_2f outUVValues, OS_geom_collection_u outTrianglesWithUVs, OS_geom_collection_u outTriangleUVIndices)
{
  sub_22899AAC4((uint64_t)uvValues._rawValue, (uint64_t)trianglesWithUVs._rawValue, (uint64_t)triangleUVIndices._rawValue, (uint64_t)outUVValues.super.isa, (uint64_t)outTrianglesWithUVs.super.isa, (uint64_t)outTriangleUVIndices.super.isa, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

_QWORD *sub_2289B00D0(uint64_t a1, uint64_t a2)
{
  return sub_2289B00E4(a1, a2, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d);
}

_QWORD *sub_2289B00E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  const void *v7;
  uint64_t v8;

  v6 = *v4;
  v7 = (const void *)a3(v6);
  v8 = a4(v6);
  return sub_22899B5C8(v7, v8);
}

uint64_t sub_2289B0140(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2289B0154(a1, a2, a3, a4, a5, a6, (void (*)(uint64_t, unint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t sub_2289B0154(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, unint64_t, uint64_t), uint64_t (*a8)(uint64_t))
{
  uint64_t *v8;
  uint64_t result;

  result = *v8;
  if (!a1)
    return a8(result);
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
  }
  else
  {
    a7(result, (a4 >> 1) - a3, a2 + 4 * a3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_2289B01A4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = OS_geom_refine_triangle_mesh_opt_3d.refinementFaceSubset.modify(v2);
  return sub_228993248;
}

_QWORD *sub_2289B01EC(uint64_t a1, uint64_t a2)
{
  return sub_2289B0200(a1, a2, geom_refine_triangle_mesh_opt_get_uv_value_data_3d, geom_refine_triangle_mesh_opt_get_uv_value_count_3d);
}

_QWORD *sub_2289B0200(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  const void *v7;
  uint64_t v8;

  v6 = *v4;
  v7 = (const void *)a3(v6);
  v8 = a4(v6);
  return sub_22899B668(v7, v8);
}

_QWORD *sub_2289B025C(uint64_t a1, uint64_t a2)
{
  return sub_22899AD3C(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_data_3d);
}

uint64_t sub_2289B0270(uint64_t a1, uint64_t a2)
{
  return sub_22899ADA8(a1, a2, geom_refine_triangle_mesh_opt_get_triangles_with_uvs_count_3d, geom_refine_triangle_mesh_opt_get_triangle_uv_indices_data_3d);
}

id sub_2289B0284()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_uv_value_collection_3d(*v0);
}

id sub_2289B02A0()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_triangles_with_uvs_collection_3d(*v0);
}

id sub_2289B02BC()
{
  uint64_t *v0;

  return (id)geom_refine_triangle_mesh_opt_get_output_triangle_uv_indices_collection_3d(*v0);
}

uint64_t sub_2289B02D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_22899AE74(a1, a2, a3, a4, a5, a6, (uint64_t (*)(_QWORD, _QWORD, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_3d);
}

uint64_t sub_2289B02E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_22899AEDC(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_uvs_for_face_subset_3d);
}

_QWORD *sub_2289B030C()
{
  _QWORD **v0;

  return geom_refine_triangle_mesh_opt_clear_uvs_3d(*v0);
}

_QWORD *sub_2289B0314@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22899A598(a1, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3f, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3f, a2);
}

_QWORD *sub_2289B0338(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AFDD0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3f, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3f);
}

_QWORD *sub_2289B035C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22899A598(a1, geom_refine_triangle_mesh_opt_get_refinement_face_subset_data_3d, geom_refine_triangle_mesh_opt_get_refinement_face_subset_count_3d, a2);
}

_QWORD *sub_2289B0380(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_2289AFDD0(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, uint64_t))geom_refine_triangle_mesh_opt_set_refinement_face_subset_3d, geom_refine_triangle_mesh_opt_clear_refinement_face_subset_3d);
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.refinementFaceSubset.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.uvValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.trianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.triangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outUVValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outTrianglesWithUVs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.outTriangleUVIndices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.setUVs(uvValues:triangleUVIndices:outUVValues:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.setUVs(uvValues:trianglesWithUVs:triangleUVIndices:outUVValues:outTrianglesWithUVs:outTriangleUVIndices:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 96))();
}

uint64_t dispatch thunk of RefineTriangleMeshOptions3.clearUVs()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t singularValueDecomposition(of3x3Matrix:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[15];
  _OWORD v25[14];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v25[0] = v3;
  v25[1] = v4;
  v25[2] = v5;
  v25[3] = v6;
  v25[4] = v7;
  v25[5] = v8;
  if (geom_compute_svd_3x3_d(v25, &v18, &v10, &v12))
  {
    v24[0] = v18;
    v24[1] = v19;
    v24[2] = v20;
    v24[3] = v21;
    v24[4] = v22;
    v24[5] = v23;
    v24[6] = v12;
    v24[7] = v13;
    v24[8] = v14;
    v24[9] = v15;
    v24[10] = v16;
    v24[11] = v17;
    v24[12] = v10;
    v24[13] = v11;
    sub_2289B057C((uint64_t)v24);
  }
  else
  {
    sub_2289B0508((uint64_t)v24);
  }
  sub_2289B0534((uint64_t)v24, (uint64_t)v25);
  return sub_2289B0534((uint64_t)v25, a2);
}

double sub_2289B0508(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 224) = 1;
  return result;
}

uint64_t sub_2289B0534(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559D4E40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2289B057C(uint64_t result)
{
  *(_BYTE *)(result + 224) = 0;
  return result;
}

void singularValueDecomposition(of3x3Matrix:)(int8x16_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, float *a5@<X6>, uint64_t a6@<X8>)
{
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a1[1];
  v8 = a1[2];
  v9 = *a1;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0uLL;
  geom_compute_svd_3x3_f(&v29, &v25, &v26, v9, v7, v8, a2, a3, a4, a5);
  if (v10)
  {
    v12 = *((_QWORD *)&v29 + 1);
    v11 = v29;
    v14 = *((_QWORD *)&v30 + 1);
    v13 = v30;
    v16 = *((_QWORD *)&v31 + 1);
    v15 = v31;
    v18 = *((_QWORD *)&v26 + 1);
    v17 = v26;
    v20 = *((_QWORD *)&v27 + 1);
    v19 = v27;
    v22 = *((_QWORD *)&v28 + 1);
    v21 = v28;
    v24 = *((_QWORD *)&v25 + 1);
    v23 = v25;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
  }
  *(_QWORD *)a6 = v11;
  *(_QWORD *)(a6 + 8) = v12;
  *(_QWORD *)(a6 + 16) = v13;
  *(_QWORD *)(a6 + 24) = v14;
  *(_QWORD *)(a6 + 32) = v15;
  *(_QWORD *)(a6 + 40) = v16;
  *(_QWORD *)(a6 + 48) = v17;
  *(_QWORD *)(a6 + 56) = v18;
  *(_QWORD *)(a6 + 64) = v19;
  *(_QWORD *)(a6 + 72) = v20;
  *(_QWORD *)(a6 + 80) = v21;
  *(_QWORD *)(a6 + 88) = v22;
  *(_QWORD *)(a6 + 96) = v23;
  *(_QWORD *)(a6 + 104) = v24;
  *(_BYTE *)(a6 + 112) = v10 ^ 1;
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_f.solve(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return sub_2289B06F4((uint64_t)a1._rawValue, (uint64_t *)a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B08B8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_f);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_f.solve(_:)(Swift::OpaquePointer *a1)
{
  return sub_2289B0794((uint64_t *)a1, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B08B8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_f);
}

BOOL sub_2289B06A8(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return OS_geom_sparse_linear_solver_f.solve(_:_:)(a1, a2);
}

uint64_t sub_2289B06CC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289B0840(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B08B8, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_f);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_d.solve(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return sub_2289B06F4((uint64_t)a1._rawValue, (uint64_t *)a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B09B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_d);
}

uint64_t sub_2289B06F4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = *a2;
  v11 = *(_QWORD *)(*a2 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = a3(0, v11, 0, v10);
  *a2 = v10;
  return a4(v4, v9, a1 + 32, v11, v10 + 32);
}

Swift::Bool __swiftcall OS_geom_sparse_linear_solver_d.solve(_:)(Swift::OpaquePointer *a1)
{
  return sub_2289B0794((uint64_t *)a1, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B09B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_d);
}

uint64_t sub_2289B0794(uint64_t *a1, uint64_t (*a2)(_QWORD, uint64_t, _QWORD, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  v7 = *a1;
  v8 = *(_QWORD *)(*a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = a2(0, v8, 0, v7);
  *a1 = v7;
  return a3(v3, v8, v7 + 32);
}

BOOL sub_2289B0808(Swift::OpaquePointer a1, Swift::OpaquePointer *a2)
{
  return OS_geom_sparse_linear_solver_d.solve(_:_:)(a1, a2);
}

uint64_t sub_2289B082C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2289B0840(a1, a2, a3, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))sub_2289B09B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))geom_sparse_linear_solver_solve_inplace_d);
}

uint64_t sub_2289B0840(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, _QWORD, uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = *v5;
  v10 = *a1;
  v11 = *(_QWORD *)(*a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = a4(0, v11, 0, v10);
  *a1 = v10;
  return a5(v9, v11, v10 + 32);
}

char *sub_2289B08B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E58);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2289B09B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t dispatch thunk of SparseLinearSolver.solve(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SparseLinearSolver.solve(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t SIMD.asUnsafeScalarMutableCArray(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD v10[8];

  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a1;
  v10[5] = a2;
  return sub_2289B0B1C(v8, (uint64_t)sub_2289B0FE4, (uint64_t)v10, a3, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], a8);
}

uint64_t sub_2289B0B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, char *);
  uint64_t result;
  uint64_t v18;

  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1, a2);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v16(v12, v12 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64), v14);
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  return result;
}

uint64_t simd_float3x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_QWORD *), double a2, double a3, double a4)
{
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return a1(v5);
}

uint64_t simd_float3x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t simd_double3x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4)
{
  _OWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  return a1(v5);
}

uint64_t simd_double3x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t simd_float4x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_QWORD *), double a2, double a3, double a4, double a5)
{
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return a1(v6);
}

uint64_t simd_float2x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_QWORD *), double a2, double a3)
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  return a1(v4);
}

uint64_t simd_float4x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t simd_double4x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return a1(v6);
}

uint64_t simd_double2x2.asUnsafeVectorCArray(_:)(uint64_t (*a1)(_OWORD *), __n128 a2, __n128 a3)
{
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = a2;
  v4[1] = a3;
  return a1(v4);
}

uint64_t simd_double4x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t SIMD.asUnsafeScalarCArray(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD v10[8];

  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a1;
  v10[5] = a2;
  return sub_2289B0B1C(v8, (uint64_t)sub_2289B100C, (uint64_t)v10, a3, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], a8);
}

uint64_t sub_2289B0F08(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;

  if (a1)
  {
    result = swift_getAssociatedTypeWitness();
    v13 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
    if (v13)
    {
      AssociatedTypeWitness = result;
      if (a2 - a1 != 0x8000000000000000 || v13 != -1)
      {
        v15 = (a2 - a1) / v13;
        goto LABEL_7;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = 0;
LABEL_7:
  result = a8(a1, v15, AssociatedTypeWitness);
  if (result)
    return a3();
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2289B0FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2289B0F08(a1, a2, *(uint64_t (**)(void))(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3, MEMORY[0x24BEE1CB0]);
}

uint64_t sub_2289B100C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2289B0F08(a1, a2, *(uint64_t (**)(void))(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3, MEMORY[0x24BEE0990]);
}

uint64_t simd_float2x2.asUnsafeMutableVectorCArray(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t marchingSquares(implicit:cellCount:bbox:points:accumulatedPolylineDegree:options:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, float32x2_t a7, float32x2_t a8)
{
  unsigned __int16 v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v20)(double *@<X0>, float *@<X8>);
  uint64_t v21;
  uint64_t v22;

  v10 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  if (!a6)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      if (!(a3 >> 16))
      {
        v16 = *a4;
        v17 = *a5;
        v18 = swift_allocObject();
        *(_QWORD *)(v18 + 16) = a1;
        *(_QWORD *)(v18 + 24) = a2;
        v20 = sub_2289B1234;
        v21 = v18;
        geom_marching_squares_with_default_options_2f((uint64_t)sub_2289B11CC, (uint64_t)&v20, v10, v16, v17, a7, a8);
        return swift_release();
      }
LABEL_12:
      __break(1u);
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a3 >> 16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13 = *a4;
  v14 = *a5;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a1;
  *(_QWORD *)(v15 + 24) = a2;
  v20 = sub_2289B1A5C;
  v21 = v15;
  geom_marching_squares_with_options_2f((uint64_t)sub_2289B11CC, (uint64_t)&v20, v10, v13, v14, a7, a8);
  return swift_release();
}

float sub_2289B11CC(void (**a1)(float *__return_ptr, double *), double a2)
{
  void (*v2)(float *__return_ptr, double *);
  float v4;
  double v5;

  if (!a1)
    return NAN;
  v2 = *a1;
  v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_2289B1224()
{
  return swift_deallocObject();
}

void sub_2289B1234(double *a1@<X0>, float *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(float (**)(double))(v2 + 16))(*a1);
}

uint64_t sub_2289B1260()
{
  return swift_deallocObject();
}

uint64_t marchingSquares(implicit:cellCount:bbox:points:accumulatedPolylineDegree:options:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, uint64_t a6, float64x2_t a7, float64x2_t a8)
{
  unsigned __int16 v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v20)(__n128 *@<X0>, double *@<X8>);
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  if (!a6)
  {
    if ((a3 & 0x8000000000000000) == 0)
    {
      if (!(a3 >> 16))
      {
        v14 = *a4;
        v15 = *a5;
        v16 = swift_allocObject();
        *(_QWORD *)(v16 + 16) = a1;
        *(_QWORD *)(v16 + 24) = a2;
        v20 = sub_2289B1430;
        v21 = v16;
        geom_marching_squares_with_default_options_2d((uint64_t)sub_2289B13C8, (uint64_t)&v20, v8, v14, v15, a7, a8);
        return swift_release();
      }
LABEL_12:
      __break(1u);
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (a3 >> 16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v11 = *a4;
  v12 = *a5;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v20 = sub_2289B1A60;
  v21 = v13;
  geom_marching_squares_with_options_2d((uint64_t)sub_2289B13C8, (uint64_t)&v20, v8, v11, v12, a7, a8);
  return swift_release();
}

double sub_2289B13C8(void (**a1)(double *__return_ptr, __n128 *), __n128 a2)
{
  void (*v2)(double *__return_ptr, __n128 *);
  double v4;
  __n128 v5;

  if (!a1)
    return NAN;
  v2 = *a1;
  v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_2289B1420()
{
  return swift_deallocObject();
}

void sub_2289B1430(__n128 *a1@<X0>, double *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(double (**)(__n128))(v2 + 16))(*a1);
}

uint64_t sub_2289B145C()
{
  return swift_deallocObject();
}

uint64_t dualContouringUniform(implicit:cellCount:bbox:points:quadVertexIndices:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, float32x4_t a6, float32_t a7, float32x4_t a8, float32_t a9)
{
  unsigned __int16 v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v16;
  float32x4_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v9 = a3;
  if (a3 >> 16)
    goto LABEL_5;
  a8.f32[2] = a9;
  a6.f32[2] = a7;
  v16 = a6;
  v17 = a8;
  v12 = *a4;
  v13 = *a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  v18[0] = sub_2289B15B4;
  v18[1] = v14;
  geom_dual_contouring_uniform_3f((uint64_t)sub_2289B154C, (uint64_t)v18, v9, v12, v13, v16, v17);
  return swift_release();
}

float sub_2289B154C(void (**a1)(float *__return_ptr, __n128 *), __n128 a2)
{
  void (*v2)(float *__return_ptr, __n128 *);
  float v4;
  __n128 v5;

  if (!a1)
    return NAN;
  v2 = *a1;
  v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t sub_2289B15A4()
{
  return swift_deallocObject();
}

void sub_2289B15B4(__n128 *a1@<X0>, float *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(float (**)(__n128))(v2 + 16))(*a1);
}

uint64_t dualContouringUniform(implicit:cellCount:bbox:points:quadVertexIndices:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t *a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9)
{
  unsigned __int16 v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v20[4];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v9 = a3;
  if (a3 >> 16)
    goto LABEL_5;
  v12 = *a4;
  v13 = *a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  v21[0] = sub_2289B1740;
  v21[1] = v14;
  v20[0] = a6;
  v20[1] = a7;
  v20[2] = a8;
  v20[3] = a9;
  geom_dual_contouring_uniform_3d((uint64_t)sub_2289B16D4, (uint64_t)v21, v9, (uint64_t)v20, v12, v13);
  return swift_release();
}

double sub_2289B16D4(_OWORD *a1, void (**a2)(double *__return_ptr, _OWORD *))
{
  __int128 v2;
  void (*v3)(double *__return_ptr, _OWORD *);
  double v5;
  _OWORD v6[2];

  if (!a2)
    return NAN;
  v2 = a1[1];
  v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  swift_retain();
  v3(&v5, v6);
  swift_release();
  return v5;
}

uint64_t sub_2289B1730()
{
  return swift_deallocObject();
}

uint64_t marchingCubes(implicit:method:cellCount:bbox:points:triangleVertexIndices:)(uint64_t a1, uint64_t a2, int a3, unint64_t a4, uint64_t *a5, uint64_t *a6, float32x4_t a7, float32_t a8, float32x4_t a9, float32_t a10)
{
  unsigned __int16 v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float32x4_t v18;
  float32x4_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v10 = a4;
  if (a4 >> 16)
    goto LABEL_5;
  a9.f32[2] = a10;
  a7.f32[2] = a8;
  v18 = a7;
  v19 = a9;
  v14 = *a5;
  v15 = *a6;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  v20[0] = sub_2289B1A64;
  v20[1] = v16;
  geom_marching_cubes_3f((uint64_t)sub_2289B154C, a3, (uint64_t)v20, v10, v14, v15, v18, v19);
  return swift_release();
}

uint64_t sub_2289B1834()
{
  return swift_deallocObject();
}

uint64_t marchingCubes(implicit:method:cellCount:bbox:points:triangleVertexIndices:)(uint64_t a1, uint64_t a2, int a3, unint64_t a4, uint64_t *a5, uint64_t *a6, float64x2_t a7, float64x2_t a8, float64x2_t a9, float64x2_t a10)
{
  unsigned __int16 v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float64x2_t v22[4];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }
  v10 = a4;
  if (a4 >> 16)
    goto LABEL_5;
  v14 = *a5;
  v15 = *a6;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  v23[0] = sub_2289B1740;
  v23[1] = v16;
  v22[0] = a7;
  v22[1] = a8;
  v22[2] = a9;
  v22[3] = a10;
  geom_marching_cubes_3d((uint64_t)sub_2289B16D4, a3, (uint64_t)v23, v10, v22, v14, v15);
  return swift_release();
}

uint64_t sub_2289B1948()
{
  return swift_deallocObject();
}

void sub_2289B1958(__n128 *a1@<X0>, double *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(double (**)(__n128, __n128))(v2 + 16))(*a1, a1[1]);
}

Swift::Void __swiftcall triangulateByEarClipping(points:triangleVertexIndices:)(Swift::OpaquePointer points, OS_geom_collection_u *triangleVertexIndices)
{
  geom_triangulate_by_ear_clipping_2f(*((_QWORD *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)triangleVertexIndices->super.isa);
}

{
  geom_triangulate_by_ear_clipping_2d(*((_QWORD *)points._rawValue + 2), (uint64_t)points._rawValue + 32, (uint64_t)triangleVertexIndices->super.isa);
}

Swift::Void __swiftcall triangulateByEarClipping(points:accumuluatedOutlineIndexCount:triangleVertexIndices:)(Swift::OpaquePointer points, Swift::OpaquePointer accumuluatedOutlineIndexCount, OS_geom_collection_u *triangleVertexIndices)
{
  sub_2289B19C4((uint64_t)points._rawValue, (uint64_t)accumuluatedOutlineIndexCount._rawValue, triangleVertexIndices, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD))geom_triangulate_by_ear_clipping_with_holes_2f);
}

{
  sub_2289B19C4((uint64_t)points._rawValue, (uint64_t)accumuluatedOutlineIndexCount._rawValue, triangleVertexIndices, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD))geom_triangulate_by_ear_clipping_with_holes_2d);
}

uint64_t sub_2289B19C4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD))
{
  return a4(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32, *a3);
}

OS_geom_inset_evaluator_2f __swiftcall OS_geom_inset_evaluator_2f.init(points:accumulatedOutlineIndexCount:)(Swift::OpaquePointer points, Swift::OpaquePointer accumulatedOutlineIndexCount)
{
  return (OS_geom_inset_evaluator_2f)sub_2289B1A04((uint64_t)points._rawValue, (uint64_t)accumulatedOutlineIndexCount._rawValue, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))geom_create_inset_evaluator_2f);
}

OS_geom_inset_evaluator_2d __swiftcall OS_geom_inset_evaluator_2d.init(points:accumulatedOutlineIndexCount:)(Swift::OpaquePointer points, Swift::OpaquePointer accumulatedOutlineIndexCount)
{
  return (OS_geom_inset_evaluator_2d)sub_2289B1A04((uint64_t)points._rawValue, (uint64_t)accumulatedOutlineIndexCount._rawValue, (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t))geom_create_inset_evaluator_2d);
}

uint64_t sub_2289B1A04(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD, uint64_t))
{
  uint64_t v3;

  v3 = a3(*(_QWORD *)(a1 + 16), a1 + 32, *(_QWORD *)(a2 + 16), a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

double polynomialRoots(coefficients:)@<D0>(_QWORD *a1@<X8>, unsigned int a2@<S0>, unsigned int a3@<S1>, unsigned int a4@<S2>)
{
  __int128 v5;
  unsigned int v6;
  double result;
  __int128 v8;
  _QWORD v9[2];

  *(_QWORD *)&v5 = __PAIR64__(a3, a2);
  v9[1] = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)&v5 + 1) = a4;
  v9[0] = 0;
  v8 = v5;
  v6 = geom_quadratic_roots_f((float *)&v8, (float *)v9);
  result = *(double *)v9;
  *a1 = v9[0];
  a1[1] = v6;
  return result;
}

double polynomialRoots(coefficients:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, unint64_t a4@<D2>)
{
  unsigned int v5;
  double result;
  _OWORD v7[2];
  double v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  a2.n128_f64[1] = a3;
  *(_OWORD *)v8 = 0uLL;
  v7[0] = a2;
  v7[1] = a4;
  v5 = geom_quadratic_roots_d((double *)v7, v8);
  result = v8[0];
  *(_OWORD *)a1 = *(_OWORD *)v8;
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

float polynomialRoots(coefficients:)@<S0>(uint64_t a1@<X8>, __n128 a2@<Q0>, float a3@<S1>, unsigned int a4@<S2>, unsigned int a5@<S3>)
{
  unsigned int v6;
  float result;
  __n128 v8;
  uint64_t v9;
  float v10[4];
  uint64_t v11;

  a2.n128_f32[1] = a3;
  a2.n128_u64[1] = __PAIR64__(a5, a4);
  v11 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  *(_QWORD *)v10 = 0;
  v8 = a2;
  v6 = geom_cubic_roots_f(&v8, &v9);
  result = v10[0];
  *(_QWORD *)a1 = v9;
  *(float *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = v6;
  return result;
}

double polynomialRoots(coefficients:)@<D0>(uint64_t a1@<X8>, __n128 a2@<Q0>, double a3@<D1>, __n128 a4@<Q2>, double a5@<D3>)
{
  unsigned int v6;
  double result;
  uint64_t v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  a2.n128_f64[1] = a3;
  a4.n128_f64[1] = a5;
  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v9[0] = a2;
  v9[1] = a4;
  v6 = geom_cubic_roots_d(v9, &v10);
  result = *(double *)&v10;
  v8 = v11;
  *(_OWORD *)a1 = v10;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t polynomialRoots(coefficients:)(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;

  v1 = result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 == 1)
    goto LABEL_5;
  if (v2)
  {
    v3 = sub_2289B2A74();
    *(_QWORD *)(v3 + 16) = v2 - 1;
    bzero((void *)(v3 + 32), 4 * v2 - 4);
    if (v2 <= 0xFF)
    {
LABEL_6:
      geom_polynomial_roots_f(v2, v1 + 32);
      return sub_2289B1D0C(*(_QWORD *)(v3 + 16) - v4, v3);
    }
    __break(1u);
LABEL_5:
    v3 = MEMORY[0x24BEE4AF8];
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 == 1)
    goto LABEL_5;
  if (v2)
  {
    v3 = sub_2289B2A74();
    *(_QWORD *)(v3 + 16) = v2 - 1;
    bzero((void *)(v3 + 32), 8 * v2 - 8);
    if (v2 <= 0xFF)
    {
LABEL_6:
      v4 = *(_QWORD *)(v3 + 16) - geom_polynomial_roots_d(v2, v1 + 32, v3 + 32);
      return sub_2289B1F18(v4, v3);
    }
    __break(1u);
LABEL_5:
    v3 = MEMORY[0x24BEE4AF8];
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_2289B1D0C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  if (result < 0)
    goto LABEL_30;
  v2 = a2;
  v3 = result;
  if (!result)
    return v2;
  v4 = *(_QWORD *)(a2 + 16);
  if (!v4)
  {
    v9 = MEMORY[0x24BEE4AF8];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v9;
  }
  v5 = 0;
  v6 = 0;
  v17 = a2 + 32;
  v7 = v4 - 1;
  v8 = MEMORY[0x24BEE4AF8];
  v9 = MEMORY[0x24BEE4AF8];
  do
  {
    v12 = *(_DWORD *)(v17 + 4 * v5);
    v13 = *(_QWORD *)(v8 + 16);
    if (v13 < v3)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
        result = (uint64_t)sub_2289B23CC(0, v13 + 1, 1);
      v11 = *(_QWORD *)(v8 + 16);
      v10 = *(_QWORD *)(v8 + 24);
      if (v11 >= v10 >> 1)
        result = (uint64_t)sub_2289B23CC((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v8 + 16) = v11 + 1;
      *(_DWORD *)(v8 + 4 * v11 + 32) = v12;
LABEL_8:
      if (v7 == v5)
        goto LABEL_25;
      goto LABEL_9;
    }
    if (v6 >= v13)
      goto LABEL_28;
    v14 = *(_DWORD *)(v8 + 4 * v6 + 32);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_2289B23CC(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v16 = *(_QWORD *)(v9 + 16);
    v15 = *(_QWORD *)(v9 + 24);
    if (v16 >= v15 >> 1)
      sub_2289B23CC((char *)(v15 > 1), v16 + 1, 1);
    *(_QWORD *)(v9 + 16) = v16 + 1;
    *(_DWORD *)(v9 + 4 * v16 + 32) = v14;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_2289B21B4(v8);
      v8 = result;
    }
    if (v6 >= *(_QWORD *)(v8 + 16))
      goto LABEL_29;
    *(_DWORD *)(v8 + 4 * v6++ + 32) = v12;
    if ((uint64_t)v6 < v3)
      goto LABEL_8;
    if (v7 == v5)
      goto LABEL_25;
    v6 = 0;
LABEL_9:
    ++v5;
  }
  while (v5 < *(_QWORD *)(v2 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2289B1F18(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  if (result < 0)
    goto LABEL_30;
  v2 = a2;
  v3 = result;
  if (!result)
    return v2;
  v4 = *(_QWORD *)(a2 + 16);
  if (!v4)
  {
    v9 = MEMORY[0x24BEE4AF8];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v9;
  }
  v5 = 0;
  v6 = 0;
  v17 = a2 + 32;
  v7 = v4 - 1;
  v8 = MEMORY[0x24BEE4AF8];
  v9 = MEMORY[0x24BEE4AF8];
  do
  {
    v12 = *(_QWORD *)(v17 + 8 * v5);
    v13 = *(_QWORD *)(v8 + 16);
    if (v13 < v3)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
        result = (uint64_t)sub_2289B23E8(0, v13 + 1, 1);
      v11 = *(_QWORD *)(v8 + 16);
      v10 = *(_QWORD *)(v8 + 24);
      if (v11 >= v10 >> 1)
        result = (uint64_t)sub_2289B23E8((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v8 + 16) = v11 + 1;
      *(_QWORD *)(v8 + 8 * v11 + 32) = v12;
LABEL_8:
      if (v7 == v5)
        goto LABEL_25;
      goto LABEL_9;
    }
    if (v6 >= v13)
      goto LABEL_28;
    v14 = *(_QWORD *)(v8 + 8 * v6 + 32);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_2289B23E8(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v16 = *(_QWORD *)(v9 + 16);
    v15 = *(_QWORD *)(v9 + 24);
    if (v16 >= v15 >> 1)
      sub_2289B23E8((char *)(v15 > 1), v16 + 1, 1);
    *(_QWORD *)(v9 + 16) = v16 + 1;
    *(_QWORD *)(v9 + 8 * v16 + 32) = v14;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_2289B21C8(v8);
      v8 = result;
    }
    if (v6 >= *(_QWORD *)(v8 + 16))
      goto LABEL_29;
    *(_QWORD *)(v8 + 8 * v6++ + 32) = v12;
    if ((uint64_t)v6 < v3)
      goto LABEL_8;
    if (v7 == v5)
      goto LABEL_25;
    v6 = 0;
LABEL_9:
    ++v5;
  }
  while (v5 < *(_QWORD *)(v2 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

char *sub_2289B21B4(uint64_t a1)
{
  return sub_2289B21DC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2289B21C8(uint64_t a1)
{
  return sub_2289B22D4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2289B21DC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E58);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_2289B22D4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559D2E50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_2289B23CC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2289B21DC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2289B23E8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2289B22D4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

Swift::Float __swiftcall polyhedronVolume(vertexPositions:faceVertexIndices:faceAccumulatedValence:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer faceVertexIndices, Swift::OpaquePointer faceAccumulatedValence)
{
  return geom_polyhedron_volume_3f(*((_QWORD *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((_QWORD *)faceAccumulatedValence._rawValue + 2), (uint64_t)faceVertexIndices._rawValue + 32, (unsigned int *)faceAccumulatedValence._rawValue + 8);
}

Swift::Double __swiftcall polyhedronVolume(vertexPositions:faceVertexIndices:faceAccumulatedValence:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer faceVertexIndices, Swift::OpaquePointer faceAccumulatedValence)
{
  return geom_polyhedron_volume_3d(*((_QWORD *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((_QWORD *)faceAccumulatedValence._rawValue + 2), (uint64_t)faceVertexIndices._rawValue + 32, (unsigned int *)faceAccumulatedValence._rawValue + 8);
}

Swift::Float __swiftcall triangleMeshVolume(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return geom_triangle_mesh_volume_3f(*((_QWORD *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((_QWORD *)triangleVertexIndices._rawValue + 2) / 3uLL, (uint64_t)triangleVertexIndices._rawValue + 32);
}

Swift::Double __swiftcall triangleMeshVolume(vertexPositions:triangleVertexIndices:)(Swift::OpaquePointer vertexPositions, Swift::OpaquePointer triangleVertexIndices)
{
  return geom_triangle_mesh_volume_3d(*((_QWORD *)vertexPositions._rawValue + 2), (uint64_t)vertexPositions._rawValue + 32, *((_QWORD *)triangleVertexIndices._rawValue + 2) / 3uLL, (uint64_t)triangleVertexIndices._rawValue + 32);
}

Swift::Void __swiftcall applyCatmullClarkSubdivisionStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
  sub_2289B24C8(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_subdivision_stencil_3f);
}

{
  sub_2289B2508(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (_QWORD *(*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_subdivision_stencil_3d);
}

Swift::Void __swiftcall applyCatmullClarkLimitStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
  sub_2289B24C8(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_limit_stencil_3f);
}

{
  sub_2289B2508(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (_QWORD *(*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_limit_stencil_3d);
}

Swift::Void __swiftcall applyCatmullClarkNormalStencil(vertex:vertexPositions:oneRingFaceVertexIndices:oneRingFaceAccumulatedVertexCount:)(Swift::UInt32 vertex, Swift::OpaquePointer vertexPositions, Swift::OpaquePointer oneRingFaceVertexIndices, Swift::OpaquePointer oneRingFaceAccumulatedVertexCount)
{
  sub_2289B24C8(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_normal_stencil_3f);
}

{
  sub_2289B2508(*(uint64_t *)&vertex, (uint64_t)vertexPositions._rawValue, (uint64_t)oneRingFaceVertexIndices._rawValue, (uint64_t)oneRingFaceAccumulatedVertexCount._rawValue, (_QWORD *(*)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))geom_apply_catmull_clark_normal_stencil_3d);
}

uint64_t sub_2289B24C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))
{
  return a5(a1, a2 + 32, a3 + 32, *(_QWORD *)(a4 + 16), a4 + 32);
}

_QWORD *sub_2289B2508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *(*a5)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))
{
  _QWORD v6[4];

  return a5(v6, a1, a2 + 32, a3 + 32, *(_QWORD *)(a4 + 16), a4 + 32);
}

void create_bvh_custom_heuristic<float,(unsigned char)2,true>()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  if (v2)
  {
    v3 = 4;
  }
  else
  {
    if (!v1)
      goto LABEL_6;
    OUTLINED_FUNCTION_6();
  }
  OUTLINED_FUNCTION_1(v0, v3);
LABEL_6:
  OUTLINED_FUNCTION_4();
  if (v2)
  {
    v5 = 4;
    goto LABEL_10;
  }
  if (v4)
  {
    OUTLINED_FUNCTION_5();
LABEL_10:
    OUTLINED_FUNCTION_0(v5);
  }
  OUTLINED_FUNCTION_3();
}

void SparseFactor()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_0(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s.blockSize must be > 0, but is %d.]n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_13(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s.attributes.kind=SparseSymmetric, but %s.rowCount (%d) != %s.columnCount (%d).\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s.columnCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s.rowCount must be > 0, but is %d.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_0();
}

void SparseFactor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_228883000, MEMORY[0x24BDACB70], a3, "Cannot perform symmetric matrix factorization of non-square matrix.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void geom::sparse_linear_solver<float>::solve(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_228883000, MEMORY[0x24BDACB70], a3, "Factored does not hold a completed matrix factorization.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

{
  OUTLINED_FUNCTION_0_0(&dword_228883000, MEMORY[0x24BDACB70], a3, "%s does not hold a completed matrix factorization.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void geom::sparse_linear_solver<float>::solve()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_0(&dword_228883000, MEMORY[0x24BDACB70], v0, "Failed to allocate workspace of size %ld for SparseSolve().\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_12(&dword_228883000, MEMORY[0x24BDACB70], v0, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2289B2A20()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_2289B2A2C()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_2289B2A38()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_2289B2A44()
{
  return MEMORY[0x24BEE0840]();
}

uint64_t sub_2289B2A50()
{
  return MEMORY[0x24BEE0868]();
}

uint64_t sub_2289B2A5C()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_2289B2A68()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2289B2A74()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2289B2A80()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_2289B2A8C()
{
  return MEMORY[0x24BEE1878]();
}

uint64_t sub_2289B2A98()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_2289B2AA4()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_2289B2AB0()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_2289B2ABC()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_2289B2AC8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2289B2AD4()
{
  return MEMORY[0x24BEE18B8]();
}

uint64_t sub_2289B2AE0()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2289B2AEC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2289B2AF8()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_2289B2B04()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2289B2B10()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2289B2B1C()
{
  return MEMORY[0x24BEE2140]();
}

uint64_t sub_2289B2B28()
{
  return MEMORY[0x24BEE21A0]();
}

uint64_t sub_2289B2B34()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_2289B2B40()
{
  return MEMORY[0x24BEE3558]();
}

uint64_t sub_2289B2B4C()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_2289B2B58()
{
  return MEMORY[0x24BEE40F8]();
}

uint64_t sub_2289B2B64()
{
  return MEMORY[0x24BEE41D8]();
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorQR_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x24BDB29C0](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorQR_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x24BDB29C8](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorSymmetric_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x24BDB29D0](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorSymmetric_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x24BDB29D8](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseSymbolicFactorOptions *__cdecl _SparseGetOptionsFromSymbolicFactor(SparseSymbolicFactorOptions *__return_ptr retstr, SparseOpaqueSymbolicFactorization *factor)
{
  return (SparseSymbolicFactorOptions *)MEMORY[0x24BDB29F0](retstr, factor);
}

void _SparseSolveOpaque_Double(const SparseOpaqueFactorization_Double *Factored, const DenseMatrix_Double *RHS, const DenseMatrix_Double *Soln, void *workspace)
{
  MEMORY[0x24BDB2A48](Factored, RHS, Soln, workspace);
}

void _SparseSolveOpaque_Float(const SparseOpaqueFactorization_Float *Factored, const DenseMatrix_Float *RHS, const DenseMatrix_Float *Soln, void *workspace)
{
  MEMORY[0x24BDB2A50](Factored, RHS, Soln, workspace);
}

void _SparseTrap(void)
{
  MEMORY[0x24BDB2A78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x24BEDB3A0]();
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x24BEDB3A8]();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x24BEDB3B8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t operator delete[]()
{
  return off_24F147CB8();
}

void operator delete(void *__p)
{
  off_24F147CC0(__p);
}

uint64_t operator delete()
{
  return off_24F147CC8();
}

uint64_t operator new[]()
{
  return off_24F147CD0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F147CD8(__sz);
}

uint64_t operator new()
{
  return off_24F147CE0();
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

simd_double2x2 __invert_d2(simd_double2x2 a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  simd_double2x2 result;

  MEMORY[0x24BDAC800]((__n128)a1.columns[0], (__n128)a1.columns[1]);
  result.columns[1].f64[1] = v4;
  result.columns[1].f64[0] = v3;
  result.columns[0].f64[1] = v2;
  result.columns[0].f64[0] = v1;
  return result;
}

uint64_t __invert_d3()
{
  return MEMORY[0x24BDAC808]();
}

uint64_t __invert_d4()
{
  return MEMORY[0x24BDAC810]();
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  simd_float2 v1;
  simd_float2 v2;
  simd_float2x2 result;

  MEMORY[0x24BDAC818]((__n128)a1, *(__n128 *)((char *)&a1 + 8));
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

double _simd_orient_pd2(simd_double2 a1, simd_double2 a2, simd_double2 a3)
{
  double result;

  MEMORY[0x24BDACDE0]((__n128)a1, (__n128)a2, (__n128)a3);
  return result;
}

float _simd_orient_pf2(simd_float2 a1, simd_float2 a2, simd_float2 a3)
{
  float result;

  MEMORY[0x24BDACDE8](*(__n128 *)a1.f32, *(__n128 *)a2.f32, *(__n128 *)a3.f32);
  return result;
}

double _simd_orient_vd2(simd_double2 a1, simd_double2 a2)
{
  double result;

  MEMORY[0x24BDACDF0]((__n128)a1, (__n128)a2);
  return result;
}

float _simd_orient_vf2(simd_float2 a1, simd_float2 a2)
{
  float result;

  MEMORY[0x24BDACDF8](*(__n128 *)a1.f32, *(__n128 *)a2.f32);
  return result;
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  double result;

  MEMORY[0x24BDB2AB8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_strsv(const CBLAS_ORDER __Order, const CBLAS_UPLO __Uplo, const CBLAS_TRANSPOSE __TransA, const CBLAS_DIAG __Diag, const int __N, const float *__A, const int __lda, float *__X, const int __incX)
{
  MEMORY[0x24BDB2C48](*(_QWORD *)&__Order, *(_QWORD *)&__Uplo, *(_QWORD *)&__TransA, *(_QWORD *)&__Diag, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

int dgeev_(char *__jobvl, char *__jobvr, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__wr, __CLPK_doublereal *__wi, __CLPK_doublereal *__vl, __CLPK_integer *__ldvl, __CLPK_doublereal *__vr, __CLPK_integer *__ldvr, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2CB8](__jobvl, __jobvr, __n, __a, __lda, __wr, __wi, __vl);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D28](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

int dsyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__w, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2E28](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED68](alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int sgeqrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2F60](__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int sgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2FA0](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sormqr_(char *__side, char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__c__, __CLPK_integer *__ldc, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB3028](__side, __trans, __m, __n, __k, __a, __lda, __tau);
}

int ssyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__w, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB30C8](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

