@implementation GEOMapFeaturePathFinder

- (GEOMapFeaturePathFinder)init
{
  return -[GEOMapFeaturePathFinder initWithTransportType:callbackQueue:](self, "initWithTransportType:callbackQueue:", 0, 0);
}

- (GEOMapFeaturePathFinder)initWithTransportType:(int)a3 callbackQueue:(id)a4
{
  id v6;
  GEOMapFeaturePathFinder *v7;
  GEOMapFeaturePathFinder *v8;
  uint64_t v9;
  OS_dispatch_queue *workQueue;
  OS_dispatch_queue *v11;
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue *v13;
  id v14;
  GEOMapFeaturePathFinder *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOMapFeaturePathFinder;
  v7 = -[GEOMapFeaturePathFinder init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_transportType = a3;
    v7->_maxDistanceFromRoad = 50.0;
    v9 = geo_dispatch_queue_create();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v9;

    if (v6)
    {
      v11 = (OS_dispatch_queue *)v6;
      callbackQueue = v8->_callbackQueue;
      v8->_callbackQueue = v11;
    }
    else
    {
      v13 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      callbackQueue = v8->_callbackQueue;
      v8->_callbackQueue = v13;
    }

    v15 = v8;
  }

  return v8;
}

- (void)findPathFrom:(id)a3 to:(id)a4 finishedHandler:(id)a5
{
  double var2;
  double var1;
  double var0;
  double v8;
  double v9;
  double v10;
  id v12;
  NSObject *workQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v8 = a3.var2;
  v9 = a3.var1;
  v10 = a3.var0;
  v12 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__GEOMapFeaturePathFinder_findPathFrom_to_finishedHandler___block_invoke;
  v15[3] = &unk_1E1C0DF38;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  v20 = var0;
  v21 = var1;
  v22 = var2;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  dispatch_async(workQueue, v15);

}

void __59__GEOMapFeaturePathFinder_findPathFrom_to_finishedHandler___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  GEOMapFeaturePath *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  __int128 v20;
  void *v21;
  double v22;
  double v23;
  GEOMapFeaturePathSegment *v24;
  double v25;
  vector<GEOLocationCoordinate3D, std::allocator<GEOLocationCoordinate3D>> *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  char *v29;
  uint64_t v30;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v31;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int64_t v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  __int128 v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v53;
  char *v54;
  __int128 v55;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v56;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v57;
  int64_t v58;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v59;
  NSArray *segments;
  GEOMapFeaturePath *v61;
  void *v62;
  NSObject *v63;
  id v64;
  id v65;
  GEOMapFeaturePath *v66;
  _OWORD *v67;
  id v68;
  void *v69;
  vector<GEOLocationCoordinate3D, std::allocator<GEOLocationCoordinate3D>> *p_coordinates;
  uint64_t v71;
  __compressed_pair<GEOLocationCoordinate3D *, std::allocator<GEOLocationCoordinate3D>> *p_end_cap;
  NSArray *v73;
  id v74;
  GEOMapFeaturePath *v75;
  void *v76;
  _BYTE *v77;
  _QWORD v78[2];
  void *v79[3];
  void *v80;
  void *v81;
  _OWORD v82[2];
  int v83;
  void *v84;
  void *v85;
  uint64_t v86;
  __int128 *p_p;
  _BYTE v88[16];
  void *v89;
  void *v90;
  _BYTE v91[16];
  void *v92;
  void *v93;
  objc_super v94;
  __int128 __p;
  __int128 v96;
  _BYTE v97[24];
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE buf[12];
  __int16 v104;
  double v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  id v110;
  _QWORD *v111[6];

  v111[3] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v1 = *(double *)(a1 + 48);
  v2 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v3 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80);
  v6 = *(double *)(a1 + 88);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (v7 && v8)
  {
    v69 = v8;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 8));
    GEOGetGEOMapFeaturePathFinderLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      *(double *)&buf[4] = v1;
      v104 = 2048;
      v105 = v2;
      v106 = 2048;
      v107 = v3;
      v108 = 2048;
      v109 = v5;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_DEFAULT, "Finding path from %f, %f to %f, %f", buf, 0x2Au);
    }

    GEOPathMatcherRoadNetwork::GEOPathMatcherRoadNetwork((uint64_t)buf, *(_DWORD *)(v7 + 24), 0, 0);
    v68 = v110;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12 = v11;
    -[GEOMapFeaturePathFinder _snappedSupportPointForCoordinate:heading:roadLookup:]((uint64_t)v91, v7, v68, v1, v2, v4);
    -[GEOMapFeaturePathFinder _snappedSupportPointForCoordinate:heading:roadLookup:]((uint64_t)v88, v7, v68, v3, v5, v6);
    *((_QWORD *)&__p + 1) = 5000;
    *(_OWORD *)&v97[8] = 0u;
    v98 = 20000000;
    v100 = 0u;
    v102 = 0u;
    *(_QWORD *)&__p = 0x4039000000000000;
    v96 = xmmword_189CC0500;
    *(_OWORD *)v97 = xmmword_189CC0510;
    v99 = 0x3FF199999999999ALL;
    *(_QWORD *)&v100 = 0x3E800002710;
    DWORD2(v100) = 10000;
    WORD6(v100) = 10;
    *(_QWORD *)&v102 = 0x3FE6147AE147AE14;
    v78[0] = buf;
    v78[1] = buf;
    v101 = xmmword_189CC0520;
    maps::path_codec::KHeap<unsigned int,2u,std::less<unsigned int>>::KHeap((uint64_t)v79, 100);
    memset(v82, 0, sizeof(v82));
    v83 = 1065353216;
    v84 = 0;
    v85 = 0;
    v86 = 0;
    p_p = &__p;
    v67 = v82;
    maps::path_codec::CostFunction::get_default_cost_function((uint64_t)&__p);
    LODWORD(v94.receiver) = 0x7FFFFFFF;
    maps::path_codec::Dijkstra<GEOPathMatcherRoadKey>::run(v78, (uint64_t)v91, (uint64_t)v88, (uint64_t)&__p, &v94, (uint64_t **)&v76);
    if ((_QWORD)__p)
    {
      *((_QWORD *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
    if (v77 == v76)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("Cannot find a path between these two coordinates."));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v13;
      GEOGetGEOMapFeaturePathFinderLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(__p) = 134217984;
        *(double *)((char *)&__p + 4) = v14 - v12;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_DEBUG, "Path finder successfully completed in %0.2f seconds.", (uint8_t *)&__p, 0xCu);
      }

      v16 = [GEOMapFeaturePath alloc];
      v74 = v68;
      if (v16
        && v77 != v76
        && (v94.receiver = v16,
            v94.super_class = (Class)GEOMapFeaturePath,
            (v16 = (GEOMapFeaturePath *)objc_msgSendSuper2(&v94, sel_init)) != 0))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v77 - (_BYTE *)v76) >> 5);
        v73 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v17 = (char *)v76;
        if (v77 != v76)
        {
          v18 = 0;
          p_coordinates = &v16->_coordinates;
          v71 = v7;
          p_end_cap = &v16->_coordinates.__end_cap_;
          v75 = v16;
          do
          {
            v19 = &v17[32 * v18];
            v20 = *((_OWORD *)v19 + 1);
            __p = *(_OWORD *)v19;
            v96 = v20;
            objc_msgSend(v74, "roadForKey:", &__p, v67);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = 0.0;
            if (!v18)
              v22 = *((double *)v92 + 4);
            v23 = 1.0;
            if (v18 == ((v77 - (_BYTE *)v76) >> 5) - 1)
              v23 = *((double *)v89 + 4);
            v24 = -[GEOMapFeaturePathSegment initWithRoad:startFraction:endFraction:]([GEOMapFeaturePathSegment alloc], "initWithRoad:startFraction:endFraction:", v21, v22, v23);
            -[NSArray addObject:](v73, "addObject:", v24);
            -[GEOMapFeaturePathSegment length](v24, "length");
            v16->_length = v25 + v16->_length;
            v26 = &v24->_coordinates;
            if (!v24)
              v26 = 0;
            begin = v26->__begin_;
            end = v26->__end_;
            v29 = (char *)begin + 24 * (v18 != 0);
            if (end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v29 < 1)
              goto LABEL_56;
            v30 = (end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v29) / 24;
            v31 = v75->_coordinates.__begin_;
            v32 = v75->_coordinates.__end_;
            v33 = (v32 - v31) / 24;
            v34 = (char *)v31 + 24 * v33;
            if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((p_end_cap->__value_ - v32) >> 3)) >= v30)
            {
              if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((v32 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34) >> 3)) >= v30)
              {
                v41 = &v29[24 * v30];
                v43 = (char *)v75->_coordinates.__end_;
                v7 = v71;
              }
              else
              {
                v41 = &v29[8 * ((v32 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34) >> 3)];
                v42 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v41;
                if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v41)
                  memmove(v75->_coordinates.__end_, &v29[8 * ((v32 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34) >> 3)], end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v41);
                v43 = (char *)v32 + v42;
                v75->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v32 + v42);
                v7 = v71;
                if (v32 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34 < 1)
                  goto LABEL_56;
              }
              v44 = &v43[-24 * v30];
              v45 = v43;
              while (v44 < (char *)v32)
              {
                v46 = *(_OWORD *)v44;
                *((_QWORD *)v45 + 2) = *((_QWORD *)v44 + 2);
                *(_OWORD *)v45 = v46;
                v45 += 24;
                v44 += 24;
              }
              v47 = &v34[24 * v30];
              v75->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v45;
              if (v43 != v47)
                memmove(&v34[24 * v30], v34, v43 - v47);
              if (v41 != v29)
                memmove(v34, v29, v41 - v29);
            }
            else
            {
              v35 = v33 + v30;
              if ((unint64_t)(v33 + v30) > 0xAAAAAAAAAAAAAAALL)
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              v36 = 0xAAAAAAAAAAAAAAABLL * ((p_end_cap->__value_ - v31) >> 3);
              if (2 * v36 > v35)
                v35 = 2 * v36;
              if (v36 >= 0x555555555555555)
                v37 = 0xAAAAAAAAAAAAAAALL;
              else
                v37 = v35;
              if (v37)
              {
                v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)p_end_cap, v37);
                v40 = v39;
              }
              else
              {
                v38 = 0;
                v40 = 0;
              }
              v48 = &v38[24 * v33];
              v49 = &v48[24 * v30];
              v50 = 24 * v30;
              v51 = v48;
              do
              {
                v52 = *(_OWORD *)v29;
                *((_QWORD *)v51 + 2) = *((_QWORD *)v29 + 2);
                *(_OWORD *)v51 = v52;
                v51 += 24;
                v29 += 24;
                v50 -= 24;
              }
              while (v50);
              v53 = p_coordinates->__begin_;
              if ((char *)p_coordinates->__begin_ == v34)
              {
                v56 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v48;
              }
              else
              {
                v54 = v34;
                do
                {
                  v55 = *(_OWORD *)(v54 - 24);
                  v56 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v48 - 24);
                  *((_QWORD *)v48 - 1) = *((_QWORD *)v54 - 1);
                  *(_OWORD *)(v48 - 24) = v55;
                  v54 -= 24;
                  v48 -= 24;
                }
                while (v54 != (char *)v53);
              }
              v57 = v75->_coordinates.__end_;
              v58 = v57 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34;
              if (v57 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34)
                memmove(v49, v34, v57 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34);
              v59 = v75->_coordinates.__begin_;
              v75->_coordinates.__begin_ = v56;
              v75->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v49[v58];
              v75->_coordinates.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v38[24 * v40];
              v7 = v71;
              if (v59)
                operator delete(v59);
            }
LABEL_56:

            v16 = v75;
            ++v18;
            v17 = (char *)v76;
          }
          while (v18 < (v77 - (_BYTE *)v76) >> 5);
        }
        segments = v16->_segments;
        v16->_segments = v73;

        v16 = v16;
        v61 = v16;
      }
      else
      {
        v61 = 0;
      }

      v62 = 0;
    }
    v63 = *(NSObject **)(v7 + 16);
    *(_QWORD *)&__p = MEMORY[0x1E0C809B0];
    *((_QWORD *)&__p + 1) = 3221225472;
    *(_QWORD *)&v96 = __60__GEOMapFeaturePathFinder__findPathFrom_to_finishedHandler___block_invoke;
    *((_QWORD *)&v96 + 1) = &unk_1E1C0DF60;
    v64 = v69;
    *(_QWORD *)&v97[8] = v62;
    *(_QWORD *)&v97[16] = v64;
    *(_QWORD *)v97 = v61;
    v65 = v62;
    v66 = v61;
    dispatch_async(v63, &__p);

    if (v76)
    {
      v77 = v76;
      operator delete(v76);
    }
    if (v84)
    {
      v85 = v84;
      operator delete(v84);
    }
    std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)v67);
    if (v80)
    {
      v81 = v80;
      operator delete(v80);
    }
    if (v79[0])
    {
      v79[1] = v79[0];
      operator delete(v79[0]);
    }
    if (v89)
    {
      v90 = v89;
      operator delete(v89);
    }
    if (v92)
    {
      v93 = v92;
      operator delete(v92);
    }

    *(_QWORD *)buf = &off_1E1BF4FD8;
    std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)v111, v111[1]);

    v9 = v69;
  }

}

- (void)_snappedSupportPointForCoordinate:(void *)a3 heading:(double)a4 roadLookup:(double)a5
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  char *v23;
  double v24;
  double v25;
  uint64_t v26;
  double *v27;
  unint64_t v28;
  double *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  unint64_t v43;
  double v44;
  BOOL v45;
  unsigned int v46;
  int v47;
  double *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *i;
  double v71;
  double v72;
  double v73;
  long double v74;
  unsigned int v75;
  _QWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  __int128 v82;
  double v83;
  char *v84;
  __int128 v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id obj;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  double v104;
  double v105;
  double v106;
  double v107;
  _OWORD v108[2];
  void *__p[2];
  __int128 v110;
  _OWORD v111[2];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  void *v117;
  char *v118;
  char *v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v101 = a4;
  v102 = a5;
  objc_msgSend(v9, "findRoadsNearCoordinate:radius:", a4, a5, *(double *)(a2 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    if (v11 > 0x492492492492492)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v12 = std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v119, v11);
    v117 = &v118[(_QWORD)v12];
    v118 = &v118[(_QWORD)v12];
    v119 = (char *)v12 + 56 * v13;
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
  if (v14)
  {
    v98 = *(_QWORD *)v114;
    v97 = v9;
    do
    {
      v15 = 0;
      v99 = v14;
      do
      {
        if (*(_QWORD *)v114 != v98)
          objc_enumerationMutation(obj);
        v16 = *(id *)(*((_QWORD *)&v113 + 1) + 8 * v15);
        v17 = v9;
        v112 = 0uLL;
        v18 = 0.0;
        if (!v16
          || ((v19 = objc_msgSend(v16, "coordinateCount"), v20 = objc_msgSend(v16, "coordinates3d"), v21 = v20, v19 >= 2)
            ? (v22 = v20 == 0)
            : (v22 = 1),
              v22))
        {
          v47 = 0x7FFFFFFF;
          v107 = 0.0;
          v42 = 0xC066800000000000;
          v43 = 0xC066800000000000;
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          *(_QWORD *)&v110 = 0;
          std::vector<unsigned long long>::__vallocate[abi:ne180100](__p, v19);
          v100 = v17;
          v23 = (char *)__p[1];
          bzero(__p[1], 8 * v19);
          v26 = 0;
          __p[1] = &v23[8 * v19];
          v27 = (double *)__p[0];
          v28 = v19 - 1;
          v29 = (double *)(v21 + 24);
          v30 = 0x7FFFFFFFFFFFFFFFLL;
          v31 = 1.79769313e308;
          v32 = 1;
          v33 = -180.0;
          v34 = -180.0;
          do
          {
            v35 = v26 + 1;
            v105 = *(v29 - 2);
            v106 = *(v29 - 3);
            v36 = *v29;
            v104 = v29[1];
            v37 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v106, v105, *(v29 - 1), *v29, v104, v29[2], v24, v25, v101, v102);
            v39 = v38;
            v40 = GEOCalculateDistanceRadius(v101, v102, v37, v38, 6367000.0);
            if (v40 < v31)
            {
              v30 = v26;
              v33 = v37;
              v34 = v39;
              v31 = v40;
            }
            v27[v32] = GEOCalculateDistanceRadius(v106, v105, v36, v104, 6367000.0) + v27[v32 - 1];
            ++v32;
            v29 += 3;
            ++v26;
          }
          while (v28 != v35);
          v41 = v33;
          v107 = v31;
          v9 = v97;
          if (v97)
          {
            v17 = v100;
            objc_msgSend(v100, "keyForRoad:", v16);
            v14 = v99;
            v27 = (double *)__p[0];
            v43 = *((_QWORD *)&v121 + 1);
            v42 = v121;
          }
          else
          {
            v120 = 0u;
            v121 = 0u;
            v43 = 0;
            v42 = 0;
            v14 = v99;
            v17 = v100;
          }
          v112 = v120;
          v44 = v107 * 100.0;
          v45 = v107 * 100.0 >= -2147483650.0 && v44 < 2147483650.0;
          v46 = llround(v44);
          if (v45)
            v47 = v46;
          else
            v47 = 0x7FFFFFFF;
          v48 = (double *)(v21 + 24 * v30);
          v50 = *v48;
          v49 = v48[1];
          v51 = v27[v30];
          objc_msgSend(v16, "length");
          v53 = v52;
          v54 = GEOCalculateDistanceRadius(v50, v49, v41, v34, 6367000.0);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          v18 = (v51 + v54) / v53;
        }

        v55 = v118;
        if (v118 >= v119)
        {
          v57 = (char *)v117;
          v58 = 0x6DB6DB6DB6DB6DB7 * ((v118 - (_BYTE *)v117) >> 3);
          v59 = v58 + 1;
          if ((unint64_t)(v58 + 1) > 0x492492492492492)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          if (0xDB6DB6DB6DB6DB6ELL * ((v119 - (_BYTE *)v117) >> 3) > v59)
            v59 = 0xDB6DB6DB6DB6DB6ELL * ((v119 - (_BYTE *)v117) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v119 - (_BYTE *)v117) >> 3)) >= 0x249249249249249)
            v60 = 0x492492492492492;
          else
            v60 = v59;
          if (v60)
          {
            v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v119, v60);
            v57 = (char *)v117;
            v55 = v118;
          }
          else
          {
            v61 = 0;
          }
          v62 = &v61[56 * v58];
          *(_OWORD *)v62 = v112;
          *((_QWORD *)v62 + 2) = v42;
          *((_QWORD *)v62 + 3) = v43;
          *((double *)v62 + 4) = v18;
          *((double *)v62 + 5) = v107;
          *((_DWORD *)v62 + 12) = v47;
          if (v55 == v57)
          {
            v67 = &v61[56 * v58];
          }
          else
          {
            v63 = &v61[56 * v58];
            do
            {
              v64 = *(_OWORD *)(v55 - 56);
              v65 = *(_OWORD *)(v55 - 40);
              v66 = *(_OWORD *)(v55 - 24);
              v67 = v63 - 56;
              *((_DWORD *)v63 - 2) = *((_DWORD *)v55 - 2);
              *(_OWORD *)(v63 - 24) = v66;
              *(_OWORD *)(v63 - 40) = v65;
              *(_OWORD *)(v63 - 56) = v64;
              v55 -= 56;
              v63 -= 56;
            }
            while (v55 != v57);
          }
          v56 = v62 + 56;
          v117 = v67;
          v118 = v62 + 56;
          v119 = &v61[56 * v60];
          if (v57)
            operator delete(v57);
        }
        else
        {
          *(_OWORD *)v118 = v112;
          *((_QWORD *)v55 + 2) = v42;
          *((_QWORD *)v55 + 3) = v43;
          *((double *)v55 + 4) = v18;
          *((double *)v55 + 5) = v107;
          *((_DWORD *)v55 + 12) = v47;
          v56 = v55 + 56;
        }
        v118 = v56;
        ++v15;
      }
      while (v15 != v14);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
      v14 = v68;
    }
    while (v68);
  }

  v69 = (char *)v117;
  if (v117 != v118)
  {
    for (i = (char *)v117 + 56; i != v118; i += 56)
    {
      if (*((double *)i + 5) < *((double *)v69 + 5))
        v69 = i;
    }
  }
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0x7FFFFFFF;
  *(_WORD *)(a1 + 44) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  v71 = fmax(v101, -85.0511288);
  v72 = v71 * 3.14159265 / 180.0;
  v45 = v71 < 85.0511288;
  v73 = 1.48442223;
  if (v45)
    v73 = v72;
  v74 = sin(v73);
  v75 = ((log((v74 + 1.0) / (1.0 - v74)) / -12.5663706 + 0.5) * 4294967300.0);
  if (v75 >= 0xFFFFFFFE)
    v75 = -2;
  *(_DWORD *)a1 = ((v102 + 180.0) / 360.0 * 4294967300.0);
  *(_DWORD *)(a1 + 4) = v75;
  *(_DWORD *)(a1 + 8) = (int)a6;
  v76 = operator new(0x38uLL);
  v77 = *(_OWORD *)v69;
  v78 = *((_OWORD *)v69 + 1);
  v79 = *((_OWORD *)v69 + 2);
  v76[6] = *((_QWORD *)v69 + 6);
  *((_OWORD *)v76 + 1) = v78;
  *((_OWORD *)v76 + 2) = v79;
  *(_OWORD *)v76 = v77;
  *(_QWORD *)(a1 + 24) = v76 + 7;
  *(_QWORD *)(a1 + 32) = v76 + 7;
  *(_QWORD *)(a1 + 16) = v76;
  v80 = *((_OWORD *)v69 + 1);
  v111[0] = *(_OWORD *)v69;
  v111[1] = v80;
  objc_msgSend(v9, "roadForKey:", v111);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v81, "travelDirection"))
  {
    v112 = *(_OWORD *)(v69 + 40);
    v82 = *((_OWORD *)v69 + 1);
    v108[0] = *(_OWORD *)v69;
    v108[1] = v82;
    if (v9)
    {
      objc_msgSend(v9, "flippedRoad:", v108);
    }
    else
    {
      *(_OWORD *)__p = 0u;
      v110 = 0u;
    }
    v120 = *(_OWORD *)__p;
    v121 = v110;
    v83 = *((double *)v69 + 4);
    v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>(a1 + 32, 2uLL);
    v85 = v120;
    *(_OWORD *)(v84 + 72) = v121;
    v86 = v84 + 56;
    v88 = &v84[56 * v87];
    *(_OWORD *)(v84 + 56) = v85;
    *((double *)v84 + 11) = 1.0 - v83;
    *((_OWORD *)v84 + 6) = v112;
    v89 = v84 + 112;
    v91 = *(char **)(a1 + 16);
    v90 = *(char **)(a1 + 24);
    if (v90 != v91)
    {
      do
      {
        v92 = *(_OWORD *)(v90 - 56);
        v93 = *(_OWORD *)(v90 - 40);
        v94 = *(_OWORD *)(v90 - 24);
        *((_DWORD *)v86 - 2) = *((_DWORD *)v90 - 2);
        *(_OWORD *)(v86 - 24) = v94;
        *(_OWORD *)(v86 - 40) = v93;
        *(_OWORD *)(v86 - 56) = v92;
        v86 -= 56;
        v90 -= 56;
      }
      while (v90 != v91);
      v90 = *(char **)(a1 + 16);
    }
    *(_QWORD *)(a1 + 16) = v86;
    *(_QWORD *)(a1 + 24) = v89;
    *(_QWORD *)(a1 + 32) = v88;
    if (v90)
      operator delete(v90);
    *(_QWORD *)(a1 + 24) = v89;
  }

  if (v117)
  {
    v118 = (char *)v117;
    operator delete(v117);
  }

}

uint64_t __60__GEOMapFeaturePathFinder__findPathFrom_to_finishedHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (double)maxDistanceFromRoad
{
  return self->_maxDistanceFromRoad;
}

- (void)setMaxDistanceFromRoad:(double)a3
{
  self->_maxDistanceFromRoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
