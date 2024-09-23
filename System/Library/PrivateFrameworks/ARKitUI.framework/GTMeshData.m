@implementation GTMeshData

- (NSDictionary)submeshes
{
  return (NSDictionary *)self->_submeshes;
}

- (unint64_t)vertexCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_vertices.__end_ - self->_vertices.__begin_) >> 4);
}

- (GTVertexData)vertexData
{
  return self->_vertices.__begin_;
}

- (BOOL)parseMaterialFile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  GTMeshData *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfURL:encoding:error:", v21, 4, a4);
  v20 = v6;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v8;
    v10 = 0;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          if (sscanf((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i)), "UTF8String"), " newmtl %256s", buf) == 1)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", buf);
            v15 = objc_opt_new();

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_submeshes, "setObject:forKeyedSubscript:", v15, v14);
            v10 = (void *)v15;
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

  }
  else
  {
    _ARLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a4;
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      v29 = 2048;
      v30 = self;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1DCC73000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to open .mtl file, error: %@.", buf, 0x20u);

    }
  }

  return v20 != 0;
}

- (unsigned)findIndexOrPushVertex:(const GTVertexData *)a3
{
  unordered_map<GTVertexData, unsigned int, std::hash<GTVertexData>, std::equal_to<GTVertexData>, std::allocator<std::pair<const GTVertexData, unsigned int>>> *p_vertexMap;
  float32x4_t *v6;
  vector<GTVertexData, std::allocator<GTVertexData>> *p_vertices;
  int v9;
  float32x4_t v10;
  GTVertexData *end;
  GTVertexData *value;
  float32x4_t v13;
  __int128 v14;
  GTVertexData *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  GTVertexData *v22;
  float32x4_t v23;
  __int128 v24;
  GTVertexData *v25;
  GTVertexData *begin;
  __int128 v27;
  __int128 v28;
  float32x4_t v29[3];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  p_vertexMap = &self->_vertexMap;
  v6 = std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::find<GTVertexData>(&self->_vertexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)a3);
  if (v6)
    return v6[4].u32[0];
  p_vertices = &self->_vertices;
  v9 = -1431655765 * ((unint64_t)(self->_vertices.__end_ - self->_vertices.__begin_) >> 4);
  v10 = *((float32x4_t *)a3 + 1);
  v29[0] = *(float32x4_t *)a3;
  v29[1] = v10;
  v29[2] = *((float32x4_t *)a3 + 2);
  v30 = v9;
  std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__emplace_unique_key_args<GTVertexData,std::pair<GTVertexData,unsigned int>>((uint64_t)p_vertexMap, (uint64_t)v29, v29);
  end = self->_vertices.__end_;
  value = self->_vertices.__end_cap_.__value_;
  if (end >= value)
  {
    v16 = 0xAAAAAAAAAAAAAAABLL * ((end - p_vertices->__begin_) >> 4);
    v17 = v16 + 1;
    if (v16 + 1 > 0x555555555555555)
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    v18 = 0xAAAAAAAAAAAAAAABLL * ((value - p_vertices->__begin_) >> 4);
    if (2 * v18 > v17)
      v17 = 2 * v18;
    if (v18 >= 0x2AAAAAAAAAAAAAALL)
      v19 = 0x555555555555555;
    else
      v19 = v17;
    if (v19)
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<GTVertexData>>((uint64_t)&self->_vertices.__end_cap_, v19);
    else
      v20 = 0;
    v21 = &v20[48 * v16];
    v22 = (GTVertexData *)&v20[48 * v19];
    v23 = *(float32x4_t *)a3;
    v24 = *((_OWORD *)a3 + 2);
    *((_OWORD *)v21 + 1) = *((_OWORD *)a3 + 1);
    *((_OWORD *)v21 + 2) = v24;
    *(float32x4_t *)v21 = v23;
    v15 = (GTVertexData *)(v21 + 48);
    begin = self->_vertices.__begin_;
    v25 = self->_vertices.__end_;
    if (v25 != begin)
    {
      do
      {
        v27 = *((_OWORD *)v25 - 3);
        v28 = *((_OWORD *)v25 - 1);
        *((_OWORD *)v21 - 2) = *((_OWORD *)v25 - 2);
        *((_OWORD *)v21 - 1) = v28;
        *((_OWORD *)v21 - 3) = v27;
        v21 -= 48;
        v25 = (GTVertexData *)((char *)v25 - 48);
      }
      while (v25 != begin);
      v25 = p_vertices->__begin_;
    }
    self->_vertices.__begin_ = (GTVertexData *)v21;
    self->_vertices.__end_ = v15;
    self->_vertices.__end_cap_.__value_ = v22;
    if (v25)
      operator delete(v25);
  }
  else
  {
    v13 = *(float32x4_t *)a3;
    v14 = *((_OWORD *)a3 + 2);
    *((_OWORD *)end + 1) = *((_OWORD *)a3 + 1);
    *((_OWORD *)end + 2) = v14;
    *(float32x4_t *)end = v13;
    v15 = (GTVertexData *)((char *)end + 48);
  }
  self->_vertices.__end_ = v15;
  return -1431655765 * ((unint64_t)(v15 - self->_vertices.__begin_) >> 4) - 1;
}

- (BOOL)readLine:(id)a3 error:(id *)a4
{
  id v6;
  __int128 v7;
  unint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  id v11;
  __int128 v12;
  unint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  id v22;
  uint64_t i;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  void *v40;
  GTSubmeshData *v41;
  GTSubmeshData *currentSubmesh;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  __int128 v47;
  BOOL v48;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  int v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _BYTE buf[32];
  _DWORD v63[3];
  _BYTE v64[257];
  _BYTE v65[16];
  _BYTE v66[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v59 = 0;
  v58 = 0;
  v6 = objc_retainAutorelease(a3);
  if (sscanf((const char *)objc_msgSend(v6, "UTF8String"), " v %f %f %f", (char *)&v59 + 4, &v59, &v58) == 3)
  {
    v8 = *(_QWORD *)&self->_anon_18[16];
    *(_QWORD *)&v7 = __PAIR64__(v59, HIDWORD(v59));
    DWORD2(v7) = v58;
    v9 = *(_OWORD **)&self->_anon_18[8];
    if ((unint64_t)v9 >= v8)
    {
      v56 = v7;
      v16 = *(_QWORD *)self->_anon_18;
      v17 = ((uint64_t)v9 - v16) >> 4;
      if ((unint64_t)(v17 + 1) >> 60)
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      v18 = v8 - v16;
      v19 = v18 >> 3;
      if (v18 >> 3 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0)
        v20 = 0xFFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
        v21 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_18[16], v20);
      else
        v21 = 0;
      v35 = &v21[16 * v17];
      v36 = &v21[16 * v20];
      *(_OWORD *)v35 = v56;
      v10 = v35 + 16;
      v38 = *(char **)self->_anon_18;
      v37 = *(char **)&self->_anon_18[8];
      if (v37 != v38)
      {
        do
        {
          v39 = *((_OWORD *)v37 - 1);
          v37 -= 16;
          *((_OWORD *)v35 - 1) = v39;
          v35 -= 16;
        }
        while (v37 != v38);
        v37 = *(char **)self->_anon_18;
      }
      *(_QWORD *)self->_anon_18 = v35;
      *(_QWORD *)&self->_anon_18[8] = v10;
      *(_QWORD *)&self->_anon_18[16] = v36;
      if (v37)
        operator delete(v37);
    }
    else
    {
      *v9 = v7;
      v10 = v9 + 1;
    }
    *(_QWORD *)&self->_anon_18[8] = v10;
    goto LABEL_46;
  }
  v11 = objc_retainAutorelease(v6);
  if (sscanf((const char *)objc_msgSend(v11, "UTF8String"), " vn %f %f %f", (char *)&v59 + 4, &v59, &v58) == 3)
  {
    v13 = *(_QWORD *)&self->_anon_30[16];
    *(_QWORD *)&v12 = __PAIR64__(v59, HIDWORD(v59));
    DWORD2(v12) = v58;
    v14 = *(_OWORD **)&self->_anon_30[8];
    if ((unint64_t)v14 >= v13)
    {
      v57 = v12;
      v25 = *(_QWORD *)self->_anon_30;
      v26 = ((uint64_t)v14 - v25) >> 4;
      if ((unint64_t)(v26 + 1) >> 60)
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      v27 = v13 - v25;
      v28 = v27 >> 3;
      if (v27 >> 3 <= (unint64_t)(v26 + 1))
        v28 = v26 + 1;
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
        v29 = 0xFFFFFFFFFFFFFFFLL;
      else
        v29 = v28;
      if (v29)
        v30 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_30[16], v29);
      else
        v30 = 0;
      v43 = &v30[16 * v26];
      v44 = &v30[16 * v29];
      *(_OWORD *)v43 = v57;
      v15 = v43 + 16;
      v46 = *(char **)self->_anon_30;
      v45 = *(char **)&self->_anon_30[8];
      if (v45 != v46)
      {
        do
        {
          v47 = *((_OWORD *)v45 - 1);
          v45 -= 16;
          *((_OWORD *)v43 - 1) = v47;
          v43 -= 16;
        }
        while (v45 != v46);
        v45 = *(char **)self->_anon_30;
      }
      *(_QWORD *)self->_anon_30 = v43;
      *(_QWORD *)&self->_anon_30[8] = v15;
      *(_QWORD *)&self->_anon_30[16] = v44;
      if (v45)
        operator delete(v45);
    }
    else
    {
      *v14 = v12;
      v15 = v14 + 1;
    }
    *(_QWORD *)&self->_anon_30[8] = v15;
    goto LABEL_46;
  }
  v22 = objc_retainAutorelease(v11);
  if (sscanf((const char *)objc_msgSend(v22, "UTF8String"), " f %d//%d %d//%d %d//%d", v66, v65, &v66[4], &v65[4], &v66[8], &v65[8]) == 6)
  {
    for (i = 0; i != 3; ++i)
    {
      v24 = *(_DWORD *)&v65[i * 4];
      *(_OWORD *)buf = *(_OWORD *)(*(_QWORD *)self->_anon_18 + 16 * (*(_DWORD *)&v66[i * 4] - 1));
      *(_OWORD *)&buf[16] = *(_OWORD *)(*(_QWORD *)self->_anon_30 + 16 * (v24 - 1));
      v63[i] = -[GTMeshData findIndexOrPushVertex:](self, "findIndexOrPushVertex:", buf);
    }
    -[GTSubmeshData addIndex:](self->_currentSubmesh, "addIndex:", v63[0]);
    -[GTSubmeshData addIndex:](self->_currentSubmesh, "addIndex:", v63[1]);
    -[GTSubmeshData addIndex:](self->_currentSubmesh, "addIndex:", v63[2]);
    goto LABEL_46;
  }
  v31 = objc_retainAutorelease(v22);
  if (sscanf((const char *)objc_msgSend(v31, "UTF8String"), " mtllib %256s", v64) == 1)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v64);
    -[NSURL URLByDeletingLastPathComponent](self->_objUrl, "URLByDeletingLastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "URLByAppendingPathComponent:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[GTMeshData parseMaterialFile:error:](self, "parseMaterialFile:error:", v34, a4);
LABEL_46:
    v48 = 1;
    goto LABEL_47;
  }
  if (sscanf((const char *)objc_msgSend(objc_retainAutorelease(v31), "UTF8String"), " usemtl %256s", v64) != 1)
    goto LABEL_46;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v64);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_submeshes, "objectForKeyedSubscript:", v40);
  v41 = (GTSubmeshData *)objc_claimAutoreleasedReturnValue();
  currentSubmesh = self->_currentSubmesh;
  self->_currentSubmesh = v41;

  if (self->_currentSubmesh)
  {

    goto LABEL_46;
  }
  _ARLogGeneral();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v40;
    _os_log_impl(&dword_1DCC73000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered usemtl '%{public}@' command before newmtl", buf, 0x20u);

  }
  if (a4)
  {
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0CB2D68];
    v60[0] = *MEMORY[0x1E0CB2D50];
    v60[1] = v54;
    v61[0] = CFSTR("Loading a material file failed.");
    v61[1] = CFSTR("Encountered usemlt command in material file without newmtl.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CF2038], 500, v55);

  }
  v48 = 0;
LABEL_47:

  return v48;
}

- (BOOL)parseOBJFileWith:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  GTMeshData *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfURL:encoding:error:", self->_objUrl, 4, a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          -[GTMeshData readLine:error:](self, "readLine:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), a3, (_QWORD)v17);
          if (*a3)
          {

            return 0;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }

    *(_QWORD *)&self->_anon_18[8] = *(_QWORD *)self->_anon_18;
    *(_QWORD *)&self->_anon_30[8] = *(_QWORD *)self->_anon_30;
    std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::clear(&self->_vertexMap.__table_.__bucket_list_.__ptr_.__value_);
    return 1;
  }
  else
  {
    _ARLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2048;
      v25 = self;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_1DCC73000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to open .obj file, error: %@.", buf, 0x20u);

    }
    return 0;
  }
}

- (GTMeshData)initWithURL:(id)a3 error:(id *)a4
{
  id v7;
  GTMeshData *v8;
  GTMeshData *v9;
  uint64_t v10;
  NSMutableDictionary *submeshes;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMeshData;
  v8 = -[GTMeshData init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_objUrl, a3);
    v10 = objc_opt_new();
    submeshes = v9->_submeshes;
    v9->_submeshes = (NSMutableDictionary *)v10;

    -[GTMeshData parseOBJFileWith:](v9, "parseOBJFileWith:", a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  GTVertexData *begin;
  void *v4;
  void *v5;

  objc_storeStrong((id *)&self->_objUrl, 0);
  std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::~__hash_table((uint64_t)&self->_vertexMap);
  begin = self->_vertices.__begin_;
  if (begin)
  {
    self->_vertices.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_30;
  if (v4)
  {
    *(_QWORD *)&self->_anon_30[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_18;
  if (v5)
  {
    *(_QWORD *)&self->_anon_18[8] = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_currentSubmesh, 0);
  objc_storeStrong((id *)&self->_submeshes, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end
