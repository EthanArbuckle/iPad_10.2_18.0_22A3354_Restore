@implementation DYIABPatcher

- (DYIABPatcher)initWithPatchingMode:(int)a3
{
  DYIABPatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DYIABPatcher;
  result = -[DYIABPatcher init](&v5, sel_init);
  if (result)
    result->_patchingMode = a3;
  return result;
}

- (BOOL)readPatchingTable:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  NSDictionary *v18;
  uint64_t v19;
  NSDictionary *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  void **v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  char *v45;
  int64x2_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  int v58;
  char v59;
  uint64_t v60;
  int64x2_t v61;
  uint64_t v62;
  _QWORD *k;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *m;
  _QWORD *n;
  unint64_t *v69;
  unint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  BOOL v75;
  void *v76;
  id v78;
  void *v79;
  void *v80;
  DYIABPatcher *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  uint64_t i;
  id v88;
  _QWORD *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 *v106;
  _BYTE v107[128];
  uint64_t *v108;
  int64x2_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v81 = self;
  v82 = v4;
  if (self->_patchingMode == 2)
  {
    v99 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 0, &v99);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v99;
    v7 = v6;
    v79 = (void *)v5;
    if (v5)
    {
      v98 = v6;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, &v98);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v98;

      if (v80)
      {
        std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::clear((uint64_t)&v81->_perfectPatchingTable);
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        obj = v80;
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
        if (v85)
        {
          v84 = *(_QWORD *)v95;
          do
          {
            for (i = 0; i != v85; ++i)
            {
              if (*(_QWORD *)v95 != v84)
                objc_enumerationMutation(obj);
              v8 = *(NSString **)(*((_QWORD *)&v94 + 1) + 8 * i);
              v92 = 0;
              v93 = 0;
              v92 = CommandBufferUIDFromString(v8);
              v93 = v9;
              v108 = &v92;
              v89 = std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v81->_optimizedPatchingMap, (unint64_t *)&v92, (uint64_t)&std::piecewise_construct, &v108);
              objc_msgSend(obj, "objectForKeyedSubscript:", v8);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v93;
              v83 = v10;
              v11 = operator new();
              *(_OWORD *)v11 = 0u;
              *(_OWORD *)(v11 + 16) = 0u;
              *(_DWORD *)(v11 + 32) = 1065353216;
              v91 = v11;
              v102 = 0u;
              v103 = 0u;
              v104 = 0u;
              v105 = 0u;
              v88 = v83;
              v12 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v102, &v108, 16);
              v13 = v89;
              if (v12)
              {
                v14 = *(_QWORD *)v103;
                do
                {
                  for (j = 0; j != v12; ++j)
                  {
                    if (*(_QWORD *)v103 != v14)
                      objc_enumerationMutation(v88);
                    v16 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
                    v100 = 0u;
                    v101 = 0u;
                    v17 = v16;
                    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pointer"));
                    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      *(_QWORD *)&v100 = BufferAndOffsetFromDictionary(v18);
                      *((_QWORD *)&v100 + 1) = v19;
                      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("pointee"));
                      v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        *(_QWORD *)&v101 = BufferAndOffsetFromDictionary(v20);
                        *((_QWORD *)&v101 + 1) = v21;
                      }
                      else
                      {
                        NSLog(CFSTR("Error: 'pointee' key not found."));
                      }

                    }
                    else
                    {
                      NSLog(CFSTR("Error: 'pointer' key not found."));
                    }

                    v106 = &v100;
                    v22 = std::__hash_table<std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v91, (unint64_t *)&v100, (uint64_t)&std::piecewise_construct, (_QWORD **)&v106);
                    if (!v22[4])
                      v22[4] = v100;
                    v106 = &v100;
                    v23 = std::__hash_table<std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PerBufferPatchingRequest>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v91, (unint64_t *)&v100, (uint64_t)&std::piecewise_construct, (_QWORD **)&v106);
                    v106 = &v101;
                    v24 = std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)(v23 + 5), (unint64_t *)&v101, (uint64_t)&std::piecewise_construct, (uint64_t **)&v106);
                    v25 = v24;
                    v26 = *((_QWORD *)&v100 + 1);
                    v27 = *((_QWORD *)&v101 + 1);
                    v28 = (char *)v24[4];
                    v29 = (uint64_t)(v24 + 5);
                    v30 = v24[5];
                    if ((unint64_t)v28 >= v30)
                    {
                      v32 = (void **)(v24 + 3);
                      v33 = (char *)v24[3];
                      v34 = (v28 - v33) >> 4;
                      v35 = v34 + 1;
                      if ((unint64_t)(v34 + 1) >> 60)
                        std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                      v36 = v30 - (_QWORD)v33;
                      if (v36 >> 3 > v35)
                        v35 = v36 >> 3;
                      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
                        v37 = 0xFFFFFFFFFFFFFFFLL;
                      else
                        v37 = v35;
                      if (v37)
                      {
                        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>(v29, v37);
                        v33 = (char *)v25[3];
                        v28 = (char *)v25[4];
                      }
                      else
                      {
                        v38 = 0;
                      }
                      v39 = &v38[16 * v34];
                      *(_QWORD *)v39 = v26;
                      *((_QWORD *)v39 + 1) = v27;
                      v40 = v39;
                      if (v28 != v33)
                      {
                        do
                        {
                          *((_OWORD *)v40 - 1) = *((_OWORD *)v28 - 1);
                          v40 -= 16;
                          v28 -= 16;
                        }
                        while (v28 != v33);
                        v33 = (char *)*v32;
                      }
                      v31 = v39 + 16;
                      v25[3] = v40;
                      v25[4] = v39 + 16;
                      v25[5] = &v38[16 * v37];
                      if (v33)
                        operator delete(v33);
                    }
                    else
                    {
                      *(_QWORD *)v28 = *((_QWORD *)&v100 + 1);
                      *((_QWORD *)v28 + 1) = v27;
                      v31 = v28 + 16;
                    }
                    v25[4] = v31;
                    v13 = v89;
                  }
                  v12 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v102, &v108, 16);
                }
                while (v12);
              }

              v41 = (uint64_t)(v13 + 5);
              v42 = v13[5];
              v43 = v13[4];
              if (v43 >= v42)
              {
                v46 = (int64x2_t *)(v13 + 3);
                v47 = v13[3];
                v48 = (uint64_t)(v43 - v47) >> 4;
                v49 = v48 + 1;
                if ((unint64_t)(v48 + 1) >> 60)
                  std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                v50 = v42 - v47;
                if (v50 >> 3 > v49)
                  v49 = v50 >> 3;
                if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
                  v51 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v51 = v49;
                v111 = v41;
                v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>>(v41, v51);
                v54 = &v52[16 * v48];
                v54[4] = 0;
                *(_DWORD *)v54 = v90;
                *((_QWORD *)v54 + 1) = v91;
                v56 = v89[3];
                v55 = v89[4];
                if (v55 == v56)
                {
                  v61 = vdupq_n_s64(v55);
                  v57 = &v52[16 * v48];
                }
                else
                {
                  v57 = &v52[16 * v48];
                  do
                  {
                    v58 = *(_DWORD *)(v55 - 16);
                    v55 -= 16;
                    v59 = *(_BYTE *)(v55 + 4);
                    *((_DWORD *)v57 - 4) = v58;
                    v57 -= 16;
                    v57[4] = v59;
                    v60 = *(_QWORD *)(v55 + 8);
                    *(_QWORD *)(v55 + 8) = 0;
                    *((_QWORD *)v57 + 1) = v60;
                  }
                  while (v55 != v56);
                  v61 = *v46;
                }
                v45 = v54 + 16;
                v44 = v89;
                v89[3] = v57;
                v89[4] = v54 + 16;
                v109 = v61;
                v62 = v89[5];
                v89[5] = &v52[16 * v53];
                v110 = v62;
                v108 = (uint64_t *)v61.i64[0];
                std::__split_buffer<PatchingRequest>::~__split_buffer((uint64_t)&v108);
              }
              else
              {
                *(_BYTE *)(v43 + 4) = 0;
                *(_DWORD *)v43 = v90;
                *(_QWORD *)(v43 + 8) = v91;
                v44 = v13;
                v45 = (char *)(v43 + 16);
              }
              v44[4] = v45;

            }
            v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
          }
          while (v85);
        }

        for (k = v81->_optimizedPatchingMap.__table_.__p1_.__value_.__next_; k; k = (_QWORD *)*k)
        {
          v64 = k[3];
          v65 = k[4];
          v66 = v64;
          if (v64 != v65)
          {
            do
            {
              for (m = *(_QWORD **)(*(_QWORD *)(v64 + 8) + 16); m; m = (_QWORD *)*m)
              {
                for (n = (_QWORD *)m[7]; n; n = (_QWORD *)*n)
                {
                  v69 = (unint64_t *)n[3];
                  v70 = (unint64_t *)n[4];
                  v71 = 126 - 2 * __clz(((char *)v70 - (char *)v69) >> 4);
                  if (v70 == v69)
                    v72 = 0;
                  else
                    v72 = v71;
                  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,OffsetPair *,false>(v69, v70, (uint64_t)&v108, v72, 1);
                }
              }
              v64 += 16;
            }
            while (v64 != v65);
            v66 = k[3];
            v64 = k[4];
          }
          v73 = 126 - 2 * __clz((v64 - v66) >> 4);
          if (v64 == v66)
            v74 = 0;
          else
            v74 = v73;
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,PatchingRequest *,false>(v66, (int *)v64, (uint64_t)&v108, v74, 1);
        }
        v75 = 1;
        v80 = obj;
      }
      else
      {
        objc_msgSend(v78, "localizedDescription");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Error when parsing patching table at %@. %@"), v82, v76);

        v75 = 0;
      }
      v7 = v78;
    }
    else
    {
      objc_msgSend(v6, "localizedDescription");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Error when reading patching table at %@. %@"), v82, v80);
      v75 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("Reading patching tables is supported only in PerfectPatching mode"));
    v75 = 0;
  }

  return v75;
}

- (BOOL)writePatchingTableAsJson:(id)a3
{
  _QWORD *i;
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  for (i = self->_perfectPatchingTable.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (_QWORD *)i[4];
    if (v6 != i + 5)
    {
      do
      {
        v25[0] = CFSTR("pointer");
        DictionaryFromBufferAndOffset(v6 + 4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = CFSTR("pointee");
        v26[0] = v7;
        DictionaryFromBufferAndOffset(v6 + 6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v9);
        v10 = (_QWORD *)v6[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (_QWORD *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (_QWORD *)v6[2];
            v12 = *v11 == (_QWORD)v6;
            v6 = v11;
          }
          while (!v12);
        }
        v6 = v11;
      }
      while (v11 != i + 5);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu-%u"), i[2], *((unsigned int *)i + 6));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v5, v13);

  }
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v23, 3, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  v16 = v15;
  if (!v14)
  {
    objc_msgSend(v15, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Failed to generate perfect patching json data. Error: %@"), v20);

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "writeToURL:atomically:", v17, 1);

  if ((v18 & 1) == 0)
  {
    NSLog(CFSTR("Failed to write perfect patching table to path %@"), v22);
    goto LABEL_15;
  }
  v19 = 1;
LABEL_16:

  return v19;
}

- (void)insertPatchingOp:(DYIABPatchingOp *)a3 commandBufferUid:(DYCommandBufferUID)a4
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 var1;
  uint64_t **v5;
  _OWORD v6[2];
  DYCommandBufferUID v7;
  DYCommandBufferUID *v8;

  v7 = a4;
  var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  v8 = &v7;
  v5 = (uint64_t **)std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::__emplace_unique_key_args<DYCommandBufferUID,std::piecewise_construct_t const&,std::tuple<DYCommandBufferUID const&>,std::tuple<>>((uint64_t)&self->_perfectPatchingTable, (uint64_t)&v7, (uint64_t)&std::piecewise_construct, (_OWORD **)&v8);
  std::__tree<BufferEntry>::__emplace_unique_key_args<BufferEntry,BufferEntry const&>(v5 + 4, (unint64_t *)v6, v6);
}

- (void)findPatchingRequest:(DYCommandBufferUID)a3
{
  void *result;
  unsigned int *v4;
  unsigned int *v5;
  int v6;
  unsigned int *v7;
  DYCommandBufferUID v8;

  v8 = a3;
  result = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_optimizedPatchingMap.__table_.__bucket_list_.__ptr_.__value_, &v8.objectId);
  if (result)
  {
    v4 = (unsigned int *)*((_QWORD *)result + 3);
    v5 = (unsigned int *)*((_QWORD *)result + 4);
    if (v4 == v5)
    {
      return 0;
    }
    else
    {
      v6 = 0;
      v7 = (unsigned int *)*((_QWORD *)result + 3);
      while (*v7 <= v8.functionIndex)
      {
        v7 += 4;
        --v6;
        if (v7 == v5)
          return &v4[4 * (-v6 - 1)];
      }
      if (!v6)
        return 0;
      return &v4[4 * (-v6 - 1)];
    }
  }
  return result;
}

- (BOOL)patchBuffers:(DYCommandBufferUID)a3 objectMap:(const void *)a4 commandQueue:(id)a5
{
  uint64_t v6;
  unint64_t objectId;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  _BYTE v21[8];
  id v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a3.functionIndex;
  objectId = a3.objectId;
  v9 = a5;
  if (self->_patchingMode != 2)
  {
    NSLog(CFSTR("Patching is only supported in PerfectPatching mode."));
    goto LABEL_7;
  }
  self->_lastProcessedCommandBufferUid.objectId = objectId;
  *(_QWORD *)&self->_lastProcessedCommandBufferUid.functionIndex = v6;
  v10 = -[DYIABPatcher findPatchingRequest:](self, "findPatchingRequest:", objectId, v6);
  v11 = v10;
  if (!v10)
  {
    NSLog(CFSTR("Unable to find a matching patching request for command buffer %llu at index %u"), objectId, v6);
    goto LABEL_7;
  }
  if (!*((_BYTE *)v10 + 4))
  {
    v14 = v10[1];
    if (!v14)
    {
      v12 = 1;
      goto LABEL_8;
    }
    v15 = v9;
    v16 = *(_QWORD **)(v14 + 16);
    if (!v16)
    {
LABEL_21:

      v12 = 1;
      *((_BYTE *)v11 + 4) = 1;
      goto LABEL_8;
    }
    while (1)
    {
      GetMTLBufferFromObjectMap(a4, v16[2]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        break;
      NSLog(CFSTR("Pointer buffer %llu not found"), v16[2]);
LABEL_20:

      v16 = (_QWORD *)*v16;
      if (!v16)
        goto LABEL_21;
    }
    CPUAccessibleMTLBufferData::CPUAccessibleMTLBufferData((uint64_t)v21, v17, v15);
    if (v22)
    {
      v18 = objc_msgSend(v22, "storageMode");
      v19 = &v22;
      if (!v18)
      {
LABEL_16:
        v20 = objc_msgSend(*v19, "contents");
LABEL_19:
        ProcessPerBufferPatchingRequest((uint64_t)(v16 + 3), v20, objc_msgSend(v22, "length"), a4);
        CPUAccessibleMTLBufferData::~CPUAccessibleMTLBufferData((CPUAccessibleMTLBufferData *)v21);
        goto LABEL_20;
      }
      if (v18 == 2)
      {
        v19 = (id *)&v23;
        goto LABEL_16;
      }
    }
    v20 = 0;
    goto LABEL_19;
  }
  NSLog(CFSTR("Patching request already processed, skipping..."));
LABEL_7:
  v12 = 0;
LABEL_8:

  return v12;
}

- (BOOL)patchBuffer:(unint64_t)a3 bufferData:(void *)a4 bufferLength:(unint64_t)a5 objectMap:(const void *)a6
{
  unint64_t objectId;
  _QWORD *v10;
  unint64_t v12;

  v12 = a3;
  if (self->_patchingMode != 2)
  {
    NSLog(CFSTR("Patching is only supported in PerfectPatching mode."), a2, a3, a4, a5, a6);
    goto LABEL_7;
  }
  objectId = self->_lastProcessedCommandBufferUid.objectId;
  if (!objectId)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v10 = -[DYIABPatcher findPatchingRequest:](self, "findPatchingRequest:", objectId, *(_QWORD *)&self->_lastProcessedCommandBufferUid.functionIndex);
  if (v10)
  {
    v10 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((_QWORD *)v10[1], &v12);
    if (v10)
    {
      ProcessPerBufferPatchingRequest((uint64_t)(v10 + 3), (uint64_t)a4, a5, a6);
      LOBYTE(v10) = 1;
    }
  }
  return (char)v10;
}

- (int)patchingMode
{
  return self->_patchingMode;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<PatchingRequest>>>>::~__hash_table((uint64_t)&self->_optimizedPatchingMap);
  std::__hash_table<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::__unordered_map_hasher<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,DYCommandBufferUIDHash,std::equal_to<DYCommandBufferUID>,true>,std::__unordered_map_equal<DYCommandBufferUID,std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>,std::equal_to<DYCommandBufferUID>,DYCommandBufferUIDHash,true>,std::allocator<std::__hash_value_type<DYCommandBufferUID,std::set<BufferEntry>>>>::~__hash_table((uint64_t)&self->_perfectPatchingTable);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end
