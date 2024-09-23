@implementation GEOAltitudeManifest

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t **p_reservedTriggerData;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  id v31;
  unint64_t v32;
  GEOAltitudeManifestReserved *reserved;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, _GEOAltitudeTriggerData>, void *>>> *p_pair1;
  char *v35;
  char *left;
  unsigned int reservedCurrentRegion;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, _GEOAltitudeTriggerData>, void *>>> *v38;
  unsigned int v39;
  BOOL v40;
  void **v41;
  unint64_t v42;
  unint64_t *v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unsigned int v50;
  id v51;
  unint64_t v52;
  uint64_t **v53;
  char *v54;
  unint64_t v55;
  char *v56;
  _DWORD *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  unint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  int v72;
  void **v73;
  unint64_t v74;
  unint64_t *v75;
  _QWORD *v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  _QWORD *v80;
  unint64_t *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  char *v92;
  unint64_t *v93;
  char *v94;
  unint64_t v95;
  unint64_t *v96;
  char *v97;
  unint64_t v98;
  unint64_t *v99;
  char *v100;
  unint64_t v101;
  unint64_t v102;
  char *v103;
  _DWORD *v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  int v113;
  id v114;
  int v115;
  _QWORD v116[2];
  void *v117[2];
  __int128 v118;
  void *__p;
  uint64_t v120;
  uint64_t v121;

  v114 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("trigger")) && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("region"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v15, "valueForKey:", CFSTR("region"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

      p_reservedTriggerData = (uint64_t **)&self->_reserved->_reservedTriggerData;
      v115 = v18;
      v116[0] = 0;
      *(_QWORD *)((char *)v116 + 5) = 0;
      *(_OWORD *)v117 = 0u;
      v118 = 0u;
      v120 = 0;
      v121 = 0;
      __p = 0;
      v20 = std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,_GEOAltitudeTriggerData>>(p_reservedTriggerData, v18, (uint64_t)&v115);
      if (__p)
        operator delete(__p);
      if (v117[1])
        operator delete(v117[1]);

      *((_DWORD *)v20 + 10) = v18;
      objc_msgSend(v15, "valueForKey:", CFSTR("version"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v20 + 11) = objc_msgSend(v21, "intValue");

      objc_msgSend(v15, "objectForKey:", CFSTR("dataversion"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v20[52] = 1;
        objc_msgSend(v15, "valueForKey:", CFSTR("dataversion"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *((_DWORD *)v20 + 12) = objc_msgSend(v23, "intValue");

      }
      objc_msgSend(v15, "valueForKey:", CFSTR("name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "copy");
      v26 = (void *)*((_QWORD *)v20 + 7);
      *((_QWORD *)v20 + 7) = v25;

      objc_msgSend(v15, "objectForKey:", CFSTR("type"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = objc_msgSend(v27, "isEqualToString:", CFSTR("tour"));

      if ((_DWORD)v24)
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("source"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("muid"));

        self->_reserved->_reservedTourServerType = v29;
      }
      self->_reserved->_reservedCurrentRegion = v18;
    }
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("flyovertour")) && objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("tourid"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v15, "valueForKey:", CFSTR("tourid"));
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v32 = strtoull((const char *)objc_msgSend(v31, "UTF8String"), 0, 10);

      reserved = self->_reserved;
      left = (char *)reserved->_reservedTriggerData.__tree_.__pair1_.__value_.__left_;
      p_pair1 = &reserved->_reservedTriggerData.__tree_.__pair1_;
      v35 = left;
      if (left)
      {
        reservedCurrentRegion = self->_reserved->_reservedCurrentRegion;
        v38 = p_pair1;
        do
        {
          v39 = *((_DWORD *)v35 + 8);
          v40 = v39 >= reservedCurrentRegion;
          if (v39 >= reservedCurrentRegion)
            v41 = (void **)v35;
          else
            v41 = (void **)(v35 + 8);
          if (v40)
            v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, _GEOAltitudeTriggerData>, void *>>> *)v35;
          v35 = (char *)*v41;
        }
        while (*v41);
        if (v38 != p_pair1 && reservedCurrentRegion >= LODWORD(v38[4].__value_.__left_))
        {
          v42 = (unint64_t)v38[10].__value_.__left_;
          v43 = (unint64_t *)v38[9].__value_.__left_;
          if ((unint64_t)v43 >= v42)
          {
            v64 = (unint64_t *)v38[8].__value_.__left_;
            v65 = v43 - v64;
            if ((unint64_t)(v65 + 1) >> 61)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v66 = v42 - (_QWORD)v64;
            v67 = (uint64_t)(v42 - (_QWORD)v64) >> 2;
            if (v67 <= v65 + 1)
              v67 = v65 + 1;
            if (v66 >= 0x7FFFFFFFFFFFFFF8)
              v68 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v68 = v67;
            if (v68)
            {
              v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v38[10], v68);
              v64 = (unint64_t *)v38[8].__value_.__left_;
              v43 = (unint64_t *)v38[9].__value_.__left_;
            }
            else
            {
              v69 = 0;
            }
            v99 = (unint64_t *)&v69[8 * v65];
            v100 = &v69[8 * v68];
            *v99 = v32;
            v44 = v99 + 1;
            while (v43 != v64)
            {
              v101 = *--v43;
              *--v99 = v101;
            }
            v38[8].__value_.__left_ = v99;
            v38[9].__value_.__left_ = v44;
            v38[10].__value_.__left_ = v100;
            if (v64)
              operator delete(v64);
          }
          else
          {
            *v43 = v32;
            v44 = v43 + 1;
          }
          v102 = (unint64_t)v38[13].__value_.__left_;
          v38[9].__value_.__left_ = v44;
          v103 = (char *)v38[12].__value_.__left_;
          if ((unint64_t)v103 >= v102)
          {
            v105 = (char *)v38[11].__value_.__left_;
            v106 = (v103 - v105) >> 2;
            if ((unint64_t)(v106 + 1) >> 62)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v107 = v102 - (_QWORD)v105;
            v108 = (uint64_t)(v102 - (_QWORD)v105) >> 1;
            if (v108 <= v106 + 1)
              v108 = v106 + 1;
            if (v107 >= 0x7FFFFFFFFFFFFFFCLL)
              v109 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v109 = v108;
            if (v109)
            {
              v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v38[13], v109);
              v105 = (char *)v38[11].__value_.__left_;
              v103 = (char *)v38[12].__value_.__left_;
            }
            else
            {
              v110 = 0;
            }
            v111 = &v110[4 * v106];
            v112 = &v110[4 * v109];
            *(_DWORD *)v111 = v32;
            v104 = v111 + 4;
            while (v103 != v105)
            {
              v113 = *((_DWORD *)v103 - 1);
              v103 -= 4;
              *((_DWORD *)v111 - 1) = v113;
              v111 -= 4;
            }
            v38[11].__value_.__left_ = v111;
            v38[12].__value_.__left_ = v104;
            v38[13].__value_.__left_ = v112;
            if (v105)
              operator delete(v105);
          }
          else
          {
            *(_DWORD *)v103 = v32;
            v104 = v103 + 4;
          }
          v38[12].__value_.__left_ = v104;
        }
      }
    }
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("tour")))
  {
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("region"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(v15, "objectForKey:", CFSTR("trip_nr"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          objc_msgSend(v15, "valueForKey:", CFSTR("region"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "intValue");

          objc_msgSend(v15, "valueForKey:", CFSTR("trip_nr"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "intValue");

          objc_msgSend(v15, "valueForKey:", CFSTR("muid"));
          v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v52 = strtoull((const char *)objc_msgSend(v51, "UTF8String"), 0, 10);

          v53 = (uint64_t **)&self->_reserved->_reservedTriggerData;
          v115 = v48;
          v116[0] = 0;
          *(_QWORD *)((char *)v116 + 5) = 0;
          *(_OWORD *)v117 = 0u;
          v118 = 0u;
          v120 = 0;
          v121 = 0;
          __p = 0;
          v54 = std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,_GEOAltitudeTriggerData>>(v53, v48, (uint64_t)&v115);
          if (__p)
            operator delete(__p);
          if (v117[1])
            operator delete(v117[1]);

          v55 = *((_QWORD *)v54 + 13);
          v56 = (char *)*((_QWORD *)v54 + 12);
          if ((unint64_t)v56 >= v55)
          {
            v58 = (char *)*((_QWORD *)v54 + 11);
            v59 = (v56 - v58) >> 2;
            if ((unint64_t)(v59 + 1) >> 62)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v60 = v55 - (_QWORD)v58;
            v61 = (uint64_t)(v55 - (_QWORD)v58) >> 1;
            if (v61 <= v59 + 1)
              v61 = v59 + 1;
            if (v60 >= 0x7FFFFFFFFFFFFFFCLL)
              v62 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v62 = v61;
            if (v62)
            {
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(v54 + 104), v62);
              v58 = (char *)*((_QWORD *)v54 + 11);
              v56 = (char *)*((_QWORD *)v54 + 12);
            }
            else
            {
              v63 = 0;
            }
            v70 = &v63[4 * v59];
            v71 = &v63[4 * v62];
            *(_DWORD *)v70 = v50;
            v57 = v70 + 4;
            while (v56 != v58)
            {
              v72 = *((_DWORD *)v56 - 1);
              v56 -= 4;
              *((_DWORD *)v70 - 1) = v72;
              v70 -= 4;
            }
            *((_QWORD *)v54 + 11) = v70;
            *((_QWORD *)v54 + 12) = v57;
            *((_QWORD *)v54 + 13) = v71;
            if (v58)
              operator delete(v58);
          }
          else
          {
            *(_DWORD *)v56 = v50;
            v57 = v56 + 4;
          }
          *((_QWORD *)v54 + 12) = v57;
          v73 = (void **)(v54 + 64);
          if (self->_reserved->_reservedTourServerType == 1)
          {
            v74 = *((_QWORD *)v54 + 10);
            v75 = (unint64_t *)*((_QWORD *)v54 + 9);
            if ((unint64_t)v75 >= v74)
            {
              v81 = (unint64_t *)*v73;
              v82 = ((char *)v75 - (_BYTE *)*v73) >> 3;
              if ((unint64_t)(v82 + 1) >> 61)
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              v83 = v74 - (_QWORD)v81;
              v84 = (uint64_t)(v74 - (_QWORD)v81) >> 2;
              if (v84 <= v82 + 1)
                v84 = v82 + 1;
              if (v83 >= 0x7FFFFFFFFFFFFFF8)
                v85 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v85 = v84;
              if (v85)
              {
                v86 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)(v54 + 80), v85);
                v81 = (unint64_t *)*((_QWORD *)v54 + 8);
                v75 = (unint64_t *)*((_QWORD *)v54 + 9);
              }
              else
              {
                v86 = 0;
              }
              v93 = (unint64_t *)&v86[8 * v82];
              v94 = &v86[8 * v85];
              *v93 = v52;
              v76 = v93 + 1;
              while (v75 != v81)
              {
                v95 = *--v75;
                *--v93 = v95;
              }
              *((_QWORD *)v54 + 8) = v93;
              *((_QWORD *)v54 + 9) = v76;
              *((_QWORD *)v54 + 10) = v94;
              if (v81)
                operator delete(v81);
            }
            else
            {
              *v75 = v52;
              v76 = v75 + 1;
            }
            *((_QWORD *)v54 + 9) = v76;
          }
          else
          {
            v77 = v50 | (unint64_t)(v48 << 32);
            v78 = *((_QWORD *)v54 + 10);
            v79 = (char *)*((_QWORD *)v54 + 9);
            if ((unint64_t)v79 >= v78)
            {
              v87 = (char *)*v73;
              v88 = (v79 - (_BYTE *)*v73) >> 3;
              if ((unint64_t)(v88 + 1) >> 61)
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              v89 = v78 - (_QWORD)v87;
              v90 = (uint64_t)(v78 - (_QWORD)v87) >> 2;
              if (v90 <= v88 + 1)
                v90 = v88 + 1;
              if (v89 >= 0x7FFFFFFFFFFFFFF8)
                v91 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v91 = v90;
              if (v91)
              {
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)(v54 + 80), v91);
                v87 = (char *)*((_QWORD *)v54 + 8);
                v79 = (char *)*((_QWORD *)v54 + 9);
              }
              else
              {
                v92 = 0;
              }
              v96 = (unint64_t *)&v92[8 * v88];
              v97 = &v92[8 * v91];
              *v96 = v77;
              v80 = v96 + 1;
              while (v79 != v87)
              {
                v98 = *((_QWORD *)v79 - 1);
                v79 -= 8;
                *--v96 = v98;
              }
              *((_QWORD *)v54 + 8) = v96;
              *((_QWORD *)v54 + 9) = v80;
              *((_QWORD *)v54 + 10) = v97;
              if (v87)
                operator delete(v87);
            }
            else
            {
              *(_QWORD *)v79 = v77;
              v80 = v79 + 8;
            }
            *((_QWORD *)v54 + 9) = v80;
          }
        }
      }
    }
  }

}

- (double)getvalidFlyOverAnimationIDPool
{
  double result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _QWORD *);
  uint64_t (*v8)(uint64_t);
  _OWORD v9[2];
  uint64_t v10;
  int v11;

  if (a1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x5812000000;
    v7 = __Block_byref_object_copy__157;
    v8 = __Block_byref_object_dispose__158;
    memset(v9, 0, sizeof(v9));
    v10 = 0;
    v11 = 1065353216;
    geo_isolate_sync_data();
    std::unordered_set<unsigned long long>::unordered_set(a2, (uint64_t)(v5 + 6));
    _Block_object_dispose(&v4, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)v9 + 8);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

_QWORD *__63__GEOAltitudeManifest_Internal__getvalidFlyOverAnimationIDPool__block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t *v5;
  unint64_t *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  v1 = *(_QWORD *)(result[4] + 8);
  if (*(_BYTE *)(v1 + 36) == 1)
  {
    v2 = *(_QWORD **)(v1 + 8);
    v3 = (_QWORD *)(v1 + 16);
    if (v2 != (_QWORD *)(v1 + 16))
    {
      v4 = result;
      do
      {
        v5 = (unint64_t *)v2[8];
        v6 = (unint64_t *)v2[9];
        while (v5 != v6)
        {
          result = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(*(_QWORD *)(v4[5] + 8) + 48, v5, v5);
          ++v5;
        }
        v7 = (_QWORD *)v2[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = (_QWORD *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (_QWORD *)v2[2];
            v9 = *v8 == (_QWORD)v2;
            v2 = v8;
          }
          while (!v9);
        }
        v2 = v8;
      }
      while (v8 != v3);
    }
  }
  return result;
}

+ (id)sharedManager
{
  if (qword_1ECDBC398 != -1)
    dispatch_once(&qword_1ECDBC398, &__block_literal_global_130);
  return (id)_MergedGlobals_270;
}

void __36__GEOAltitudeManifest_sharedManager__block_invoke()
{
  GEOAltitudeManifest *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAltitudeManifest);
  v1 = (void *)_MergedGlobals_270;
  _MergedGlobals_270 = (uint64_t)v0;

}

- (GEOAltitudeManifest)init
{
  GEOAltitudeManifest *v2;
  GEOAltitudeManifest *v3;
  void *v4;
  GEOAltitudeManifest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAltitudeManifest;
  v2 = -[GEOAltitudeManifest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GEOAltitudeManifest commonInit](v2, "commonInit");
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTileGroupObserver:queue:", v3, MEMORY[0x1E0C80D38]);

    -[GEOAltitudeManifest _reloadManifest](v3, "_reloadManifest");
    v5 = v3;
  }

  return v3;
}

- (void)commonInit
{
  GEOAltitudeManifestReserved *v3;
  GEOAltitudeManifestReserved *reserved;
  uint64_t v5;
  GEOAltitudeManifestReserved *v6;
  geo_isolater *reservedIsolater;

  v3 = objc_alloc_init(GEOAltitudeManifestReserved);
  reserved = self->_reserved;
  self->_reserved = v3;

  v5 = geo_isolater_create();
  v6 = self->_reserved;
  reservedIsolater = v6->_reservedIsolater;
  v6->_reservedIsolater = (geo_isolater *)v5;

}

- (void)_reloadManifest
{
  void *v3;
  void *v4;
  id v5;

  +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataForResourceWithName:fallbackBundle:", CFSTR("altitude.xml"), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[GEOAltitudeManifest parseManifest:](self, "parseManifest:", v5);
}

- (void)parseManifest:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __37__GEOAltitudeManifest_parseManifest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *__p;
  void *v15;
  uint64_t v16;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD **)(v2 + 8);
  if (v3 != (_QWORD *)(v2 + 16))
  {
    do
    {
      v10 = (id)v3[7];
      v12 = 0;
      v13 = 0;
      v11 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v11, (const void *)v3[8], v3[9], (uint64_t)(v3[9] - v3[8]) >> 3);
      __p = 0;
      v15 = 0;
      v16 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, (const void *)v3[11], v3[12], (uint64_t)(v3[12] - v3[11]) >> 2);
      if (__p)
      {
        v15 = __p;
        operator delete(__p);
      }
      if (v11)
      {
        v12 = v11;
        operator delete(v11);
      }

      v4 = (_QWORD *)v3[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (_QWORD *)v3[2];
          v6 = *v5 == (_QWORD)v3;
          v3 = v5;
        }
        while (!v6);
      }
      v3 = v5;
    }
    while (v5 != (_QWORD *)(v2 + 16));
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  v8 = *(_QWORD **)(v2 + 16);
  v7 = (_QWORD *)(v2 + 16);
  std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::destroy(v8);
  *(v7 - 1) = v7;
  *v7 = 0;
  v7[1] = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "parse");

}

- (GEOAltitudeManifest)initWithoutObserver
{
  GEOAltitudeManifest *v2;
  GEOAltitudeManifest *v3;
  GEOAltitudeManifest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAltitudeManifest;
  v2 = -[GEOAltitudeManifest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GEOAltitudeManifest commonInit](v2, "commonInit");
    -[GEOAltitudeManifest _reloadManifest](v3, "_reloadManifest");
    v4 = v3;
  }

  return v3;
}

- (BOOL)parseXml:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[GEOAltitudeManifest parseManifest:](self, "parseManifest:", v4);

  return v4 != 0;
}

- (BOOL)isValidTourId:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  geo_isolate_sync_data();
  v3 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

_QWORD *__37__GEOAltitudeManifest_isValidTourId___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  BOOL v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD *i;

  v1 = *(_QWORD *)(result[4] + 8);
  if (*(_BYTE *)(v1 + 36) == 1)
  {
    v2 = *(_QWORD **)(v1 + 8);
    if (v2 != (_QWORD *)(v1 + 16))
    {
      do
      {
        v3 = (_QWORD *)v2[8];
        v4 = (_QWORD *)v2[9];
        if (v3 != v4)
        {
          v5 = result[6];
          do
          {
            if (*v3 == v5)
              *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
            ++v3;
          }
          while (v3 != v4);
        }
        v6 = (_QWORD *)v2[1];
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = (_QWORD *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (_QWORD *)v2[2];
            v8 = *v7 == (_QWORD)v2;
            v2 = v7;
          }
          while (!v8);
        }
        v2 = v7;
      }
      while (v7 != (_QWORD *)(v1 + 16));
    }
  }
  else
  {
    v11 = *(_QWORD *)(v1 + 16);
    v9 = v1 + 16;
    v10 = v11;
    if (v11)
    {
      v12 = result[6];
      v13 = v9;
      do
      {
        v14 = *(_DWORD *)(v10 + 32);
        v15 = v14 >= HIDWORD(v12);
        if (v14 >= HIDWORD(v12))
          v16 = (uint64_t *)v10;
        else
          v16 = (uint64_t *)(v10 + 8);
        if (v15)
          v13 = v10;
        v10 = *v16;
      }
      while (*v16);
      if (v13 != v9 && *(_DWORD *)(v13 + 32) <= HIDWORD(v12))
      {
        v17 = *(_QWORD **)(v13 + 64);
        for (i = *(_QWORD **)(v13 + 72); v17 != i; ++v17)
        {
          if (*v17 == v12)
            *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)GEOAltitudeManifest;
  -[GEOAltitudeManifest dealloc](&v5, sel_dealloc);
}

- (unsigned)versionForRegion:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  geo_isolate_sync_data();
  v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __40__GEOAltitudeManifest_versionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v2 = v1 + 16;
  v3 = v4;
  if (v4)
  {
    v5 = *(unsigned int *)(a1 + 48);
    v6 = v2;
    do
    {
      v7 = *(_DWORD *)(v3 + 32);
      v8 = v7 >= v5;
      if (v7 >= v5)
        v9 = (uint64_t *)v3;
      else
        v9 = (uint64_t *)(v3 + 8);
      if (v8)
        v6 = v3;
      v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v6 + 44);
      return;
    }
  }
  else
  {
    v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v5);
}

- (BOOL)hasDataVersionForRegion:(unsigned int)a3
{
  char v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  geo_isolate_sync_data();
  v3 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __47__GEOAltitudeManifest_hasDataVersionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v2 = v1 + 16;
  v3 = v4;
  if (v4)
  {
    v5 = *(unsigned int *)(a1 + 48);
    v6 = v2;
    do
    {
      v7 = *(_DWORD *)(v3 + 32);
      v8 = v7 >= v5;
      if (v7 >= v5)
        v9 = (uint64_t *)v3;
      else
        v9 = (uint64_t *)(v3 + 8);
      if (v8)
        v6 = v3;
      v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(v6 + 52);
      return;
    }
  }
  else
  {
    v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v5);
}

- (unsigned)dataVersionForRegion:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  geo_isolate_sync_data();
  v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __44__GEOAltitudeManifest_dataVersionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v2 = v1 + 16;
  v3 = v4;
  if (v4)
  {
    v5 = *(unsigned int *)(a1 + 48);
    v6 = v2;
    do
    {
      v7 = *(_DWORD *)(v3 + 32);
      v8 = v7 >= v5;
      if (v7 >= v5)
        v9 = (uint64_t *)v3;
      else
        v9 = (uint64_t *)(v3 + 8);
      if (v8)
        v6 = v3;
      v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v6 + 48);
      return;
    }
  }
  else
  {
    v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v5);
}

- (id)nameForRegion:(unsigned int)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__67;
  v9 = __Block_byref_object_dispose__67;
  v10 = 0;
  geo_isolate_sync_data();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __37__GEOAltitudeManifest_nameForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v2 = v1 + 16;
  v3 = v4;
  if (v4)
  {
    v5 = *(unsigned int *)(a1 + 48);
    v6 = v2;
    do
    {
      v7 = *(_DWORD *)(v3 + 32);
      v8 = v7 >= v5;
      if (v7 >= v5)
        v9 = (uint64_t *)v3;
      else
        v9 = (uint64_t *)(v3 + 8);
      if (v8)
        v6 = v3;
      v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v6 + 56));
      return;
    }
  }
  else
  {
    v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v5);
}

- (id)tourIdsForRegion:(unsigned int)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__67;
  v9 = __Block_byref_object_dispose__67;
  v10 = 0;
  geo_isolate_sync_data();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __40__GEOAltitudeManifest_tourIdsForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *i;
  void *v16;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v3 = v2 + 16;
  v4 = v5;
  if (!v5)
  {
    v6 = *(unsigned int *)(a1 + 48);
LABEL_16:
    NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v6);
    return;
  }
  v6 = *(unsigned int *)(a1 + 48);
  v7 = v3;
  do
  {
    v8 = *(_DWORD *)(v4 + 32);
    v9 = v8 >= v6;
    if (v8 >= v6)
      v10 = (uint64_t *)v4;
    else
      v10 = (uint64_t *)(v4 + 8);
    if (v9)
      v7 = v4;
    v4 = *v10;
  }
  while (*v10);
  if (v7 == v3 || v6 < *(_DWORD *)(v7 + 32))
    goto LABEL_16;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*(_QWORD *)(v7 + 72) - *(_QWORD *)(v7 + 64)) >> 3);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD **)(v7 + 64);
  for (i = *(_QWORD **)(v7 + 72); v14 != i; ++v14)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", *v14);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);

  }
}

- (id)tripIdsForRegion:(unsigned int)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__67;
  v9 = __Block_byref_object_dispose__67;
  v10 = 0;
  geo_isolate_sync_data();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __40__GEOAltitudeManifest_tripIdsForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int *v14;
  unsigned int *i;
  void *v16;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v3 = v2 + 16;
  v4 = v5;
  if (!v5)
  {
    v6 = *(unsigned int *)(a1 + 48);
LABEL_16:
    NSLog(CFSTR("[GEOAltitudeManifest] Failed to find region %d in manifest"), v6);
    return;
  }
  v6 = *(unsigned int *)(a1 + 48);
  v7 = v3;
  do
  {
    v8 = *(_DWORD *)(v4 + 32);
    v9 = v8 >= v6;
    if (v8 >= v6)
      v10 = (uint64_t *)v4;
    else
      v10 = (uint64_t *)(v4 + 8);
    if (v9)
      v7 = v4;
    v4 = *v10;
  }
  while (*v10);
  if (v7 == v3 || v6 < *(_DWORD *)(v7 + 32))
    goto LABEL_16;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(*(_QWORD *)(v7 + 96) - *(_QWORD *)(v7 + 88)) >> 2);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(unsigned int **)(v7 + 88);
  for (i = *(unsigned int **)(v7 + 96); v14 != i; ++v14)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *v14);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);

  }
}

- (id)availableRegions
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__67;
  v8 = __Block_byref_object_dispose__67;
  v9 = 0;
  geo_isolate_sync_data();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__GEOAltitudeManifest_availableRegions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(_QWORD **)(v5 + 8);
  if (v6 != (_QWORD *)(v5 + 16))
  {
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v6 + 8));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

      v8 = (_QWORD *)v6[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v6[2];
          v10 = *v9 == (_QWORD)v6;
          v6 = v9;
        }
        while (!v10);
      }
      v6 = v9;
    }
    while (v9 != (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reserved, 0);
}

@end
