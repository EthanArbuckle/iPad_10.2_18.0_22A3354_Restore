@implementation GEOPathMatcher

- (void)_clearZilchSnappedPathsForRoute:(id)a3
{
  objc_msgSend(a3, "clearSnappedPathsForObserver:", self);
}

- (id)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  PolylineCoordinate v16;
  PolylineCoordinate v17;

  end = a4.end;
  start = a4.start;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke;
  v13[3] = &unk_1E1C05340;
  v16 = start;
  v17 = end;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "forEachSnappedPath:", v13);
  v10 = v15;
  v11 = v9;

  return v11;
}

void __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  GEOMapFeatureRoad *v35;
  GEOMapFeatureRoad *v36;
  GEOMatchedPathSegment *v37;
  GEOMatchedPathSegment *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, float *, _QWORD *, float *, uint64_t, void *);
  void *v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t (*v61)();
  const char *v62;
  unint64_t v63;
  uint64_t v64;
  float *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  uint64_t (*v68)();
  const char *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  __n128 (*v73)(__n128 *, __n128 *);
  void (*v74)(uint64_t);
  const char *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;

  v3 = a2;
  v4 = objc_msgSend(v3, "mapMatchingSection");
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4) & 1) != 0)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
    v6 = *(_DWORD *)(a1 + 56);
    if (v6 >= v5 && (v6 != (_DWORD)v5 || *(float *)(a1 + 60) >= *((float *)&v5 + 1)))
    {
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
      v8 = *(_DWORD *)(a1 + 48);
      if (v8 <= v7 && (v8 != (_DWORD)v7 || *(float *)(a1 + 52) <= *((float *)&v7 + 1)))
      {
        v79 = 0;
        v80 = &v79;
        v81 = 0x3032000000;
        v82 = __Block_byref_object_copy__12;
        v83 = __Block_byref_object_dispose__12;
        v84 = 0;
        v70 = 0;
        v71 = &v70;
        v72 = 0x4812000000;
        v73 = __Block_byref_object_copy__1;
        v74 = __Block_byref_object_dispose__2;
        v75 = "";
        v76 = 0;
        v77 = 0;
        v78 = 0;
        v64 = 0;
        v65 = (float *)&v64;
        v66 = 0x3812000000;
        v67 = __Block_byref_object_copy__3;
        v68 = __Block_byref_object_dispose__4;
        v69 = "";
        v57 = 0;
        v58 = &v57;
        v59 = 0x3812000000;
        v60 = __Block_byref_object_copy__6;
        v61 = __Block_byref_object_dispose__7;
        v62 = "";
        v63 = 0xBF80000000000000;
        objc_msgSend(v3, "section");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "bounds");
          v11 = *((double *)&v54 + 1);
          v12 = *(double *)&v54;
          v14 = *((double *)&v55 + 1);
          v13 = *(double *)&v56;
        }
        else
        {
          v55 = 0u;
          v56 = 0u;
          v54 = 0u;
          v13 = 0.0;
          v14 = 0.0;
          v11 = 0.0;
          v12 = 0.0;
        }

        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke_9;
        v42 = &unk_1E1C05318;
        v53 = *(_OWORD *)(a1 + 48);
        v49 = v12;
        v50 = v11;
        v51 = v14;
        v52 = v13;
        v45 = &v70;
        v46 = &v79;
        v43 = *(id *)(a1 + 32);
        v44 = *(id *)(a1 + 40);
        v47 = &v64;
        v48 = &v57;
        (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 40))(v4, &v39);
        if (v80[5])
        {
          v15 = GEOCoordinate2DForMapPoint(v12 + v65[12] * v14, v11 + (float)(1.0 - v65[13]) * v13);
          v17 = v15;
          v18 = v16;
          v19 = v71;
          v20 = v58[6];
          v21 = v71[7];
          v22 = v71[8];
          if (v21 >= v22)
          {
            v24 = v71[6];
            v25 = (uint64_t)(v21 - v24) >> 5;
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 59)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v27 = v22 - v24;
            if (v27 >> 4 > v26)
              v26 = v27 >> 4;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0)
              v28 = 0x7FFFFFFFFFFFFFFLL;
            else
              v28 = v26;
            if (v28)
              v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v71 + 8), v28);
            else
              v29 = 0;
            v30 = &v29[32 * v25];
            v31 = &v29[32 * v28];
            *(double *)v30 = v17;
            *((_QWORD *)v30 + 1) = v18;
            *((_QWORD *)v30 + 2) = 0;
            *((_QWORD *)v30 + 3) = v20;
            v23 = v30 + 32;
            v33 = (char *)v19[6];
            v32 = (char *)v19[7];
            if (v32 != v33)
            {
              do
              {
                v34 = *((_OWORD *)v32 - 1);
                *((_OWORD *)v30 - 2) = *((_OWORD *)v32 - 2);
                *((_OWORD *)v30 - 1) = v34;
                v30 -= 32;
                v32 -= 32;
              }
              while (v32 != v33);
              v32 = (char *)v19[6];
            }
            v19[6] = (uint64_t)v30;
            v19[7] = (uint64_t)v23;
            v19[8] = (uint64_t)v31;
            if (v32)
              operator delete(v32);
          }
          else
          {
            *(double *)v21 = v15;
            *(_QWORD *)(v21 + 8) = v16;
            v23 = (_QWORD *)(v21 + 32);
            *(_QWORD *)(v21 + 16) = 0;
            *(_QWORD *)(v21 + 24) = v20;
          }
          v19[7] = (uint64_t)v23;
          v35 = [GEOMapFeatureRoad alloc];
          v36 = -[GEOMapFeatureRoad initWithFeature:](v35, "initWithFeature:", v80[5], v39, v40, v41, v42, v43);
          v37 = [GEOMatchedPathSegment alloc];
          v38 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:](v37, "initWithRoute:road:coordinates:roadRange:", *(_QWORD *)(a1 + 32), v36, v71 + 6, 0xBF80000000000000, 0xBF80000000000000);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v38);

        }
        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v70, 8);
        if (v76)
        {
          v77 = v76;
          operator delete(v76);
        }
        _Block_object_dispose(&v79, 8);

      }
    }
  }

}

uint64_t __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke_9(uint64_t a1, float *a2, _QWORD *a3, float *a4, uint64_t a5, void *a6)
{
  id v12;
  unsigned int v13;
  unsigned int v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  id v36;
  BOOL v37;
  GEOMapFeatureRoad *v38;
  GEOMatchedPathSegment *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  __int128 v55;

  v12 = a6;
  v13 = *(_DWORD *)(a1 + 120);
  if (v13 >= *(_DWORD *)a4 && (v13 != *(_DWORD *)a4 || *(float *)(a1 + 124) >= a4[1]))
  {
    v14 = *(_DWORD *)(a1 + 112);
    if (*(_DWORD *)a5 >= v14 && (*(_DWORD *)a5 != v14 || *(float *)(a5 + 4) >= *(float *)(a1 + 116)))
    {
      v15 = GEOCoordinate2DForMapPoint(*(double *)(a1 + 80) + *a2 * *(double *)(a1 + 96), *(double *)(a1 + 88) + (float)(1.0 - a2[1]) * *(double *)(a1 + 104));
      v17 = v15;
      v18 = v16;
      v19 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
      v20 = *(_QWORD *)a4;
      v21 = v19[7];
      v22 = v19[8];
      if (v21 >= v22)
      {
        v24 = v19[6];
        v25 = (uint64_t)(v21 - v24) >> 5;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 59)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v27 = v22 - v24;
        if (v27 >> 4 > v26)
          v26 = v27 >> 4;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0)
          v28 = 0x7FFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v19 + 8), v28);
        else
          v29 = 0;
        v30 = &v29[32 * v25];
        v31 = &v29[32 * v28];
        *(double *)v30 = v17;
        *((_QWORD *)v30 + 1) = v18;
        *((_QWORD *)v30 + 2) = 0;
        *((_QWORD *)v30 + 3) = v20;
        v23 = v30 + 32;
        v33 = (char *)v19[6];
        v32 = (char *)v19[7];
        if (v32 != v33)
        {
          do
          {
            v34 = *((_OWORD *)v32 - 1);
            *((_OWORD *)v30 - 2) = *((_OWORD *)v32 - 2);
            *((_OWORD *)v30 - 1) = v34;
            v30 -= 32;
            v32 -= 32;
          }
          while (v32 != v33);
          v32 = (char *)v19[6];
        }
        v19[6] = v30;
        v19[7] = v23;
        v19[8] = v31;
        if (v32)
          operator delete(v32);
      }
      else
      {
        *(double *)v21 = v15;
        *(_QWORD *)(v21 + 8) = v16;
        v23 = (_QWORD *)(v21 + 32);
        *(_QWORD *)(v21 + 16) = 0;
        *(_QWORD *)(v21 + 24) = v20;
      }
      v19[7] = v23;
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v36 = *(id *)(v35 + 40);
      if (v36)
        v37 = v36 == v12;
      else
        v37 = 1;
      if (!v37)
      {
        v38 = -[GEOMapFeatureRoad initWithFeature:]([GEOMapFeatureRoad alloc], "initWithFeature:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
        v39 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", *(_QWORD *)(a1 + 32), v38, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, 0xBF80000000000000, 0xBF80000000000000);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v39);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 48);
        v40 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
        v41 = *(_QWORD *)a4;
        v42 = (_QWORD *)v40[7];
        v43 = v40[8];
        if ((unint64_t)v42 >= v43)
        {
          v45 = v40[6];
          v46 = ((uint64_t)v42 - v45) >> 5;
          v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 59)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          v48 = v43 - v45;
          if (v48 >> 4 > v47)
            v47 = v48 >> 4;
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFE0)
            v49 = 0x7FFFFFFFFFFFFFFLL;
          else
            v49 = v47;
          if (v49)
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v40 + 8), v49);
          else
            v50 = 0;
          v51 = &v50[32 * v46];
          v52 = &v50[32 * v49];
          *(double *)v51 = v17;
          *((_QWORD *)v51 + 1) = v18;
          *((_QWORD *)v51 + 2) = 0;
          *((_QWORD *)v51 + 3) = v41;
          v44 = v51 + 32;
          v54 = (char *)v40[6];
          v53 = (char *)v40[7];
          if (v53 != v54)
          {
            do
            {
              v55 = *((_OWORD *)v53 - 1);
              *((_OWORD *)v51 - 2) = *((_OWORD *)v53 - 2);
              *((_OWORD *)v51 - 1) = v55;
              v51 -= 32;
              v53 -= 32;
            }
            while (v53 != v54);
            v53 = (char *)v40[6];
          }
          v40[6] = v51;
          v40[7] = v44;
          v40[8] = v52;
          if (v53)
            operator delete(v53);
        }
        else
        {
          *(double *)v42 = v17;
          v42[1] = v18;
          v44 = v42 + 4;
          v42[2] = 0;
          v42[3] = v41;
        }
        v40[7] = v44;

        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      objc_storeStrong((id *)(v35 + 40), a6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48) = *a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48) = *(_QWORD *)a5;
    }
  }

  return 0;
}

- (void)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  id v30;
  id v31;
  GEOPathMatcher *v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  PolylineCoordinate v38;
  PolylineCoordinate v39;
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  end = a4.end;
  start = a4.start;
  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a5;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v33, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v32 = self;
  if (v10)
  {
    v11 = *(_QWORD *)v45;
    v12 = 0.0;
    v13 = INFINITY;
    v14 = INFINITY;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "startPointIndex");
        v19 = objc_msgSend(v17, "endPointIndex");
        if (v18 <= end.index)
        {
          v20 = start.offset > 0.0 && v19 == start.index;
          v21 = v20;
          v22 = end.offset < 0.0 && v18 == end.index;
          v23 = !v22 && v19 >= start.index;
          if (v23 && !v21)
          {
            if (v17)
            {
              objc_msgSend(v17, "bounds");
              v25 = *((double *)&v41 + 1);
              v24 = *(double *)&v41;
            }
            else
            {
              v43 = 0u;
              v25 = 0.0;
              v24 = 0.0;
              v41 = 0u;
              v42 = 0u;
            }
            v13 = GEOMapRectUnion(v13, v14, v12, v15, v24, v25);
            v14 = v26;
            v12 = v27;
            v15 = v28;
          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
    v13 = INFINITY;
    v14 = INFINITY;
    v15 = 0.0;
  }

  *(double *)v40 = v13;
  *(double *)&v40[1] = v14;
  *(double *)&v40[2] = v12;
  *(double *)&v40[3] = v15;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __82__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range_handler___block_invoke;
  v35[3] = &unk_1E1C05368;
  v29 = v34;
  v37 = v29;
  v35[4] = v32;
  v30 = v33;
  v36 = v30;
  v38 = start;
  v39 = end;
  v31 = (id)objc_msgSend(v30, "getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:", v40, 1, v32, v35, v13, v14, v12, v15);

}

void __82__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range_handler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_zilchMatchedSegmentsForRoute:range:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  return -[GEOPathMatcher initWithRoute:auditToken:loggingIdentifier:](self, "initWithRoute:auditToken:loggingIdentifier:", a3, a4, CFSTR("Default"));
}

- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4 loggingIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEOPathMatcher *v12;
  GEOPathMatcher *v13;
  uint64_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  geo_isolater *matchedSegmentsIsolater;
  uint64_t v18;
  NSString *loggingIdentifier;
  uint64_t v20;
  geo_isolater *internalInfosIsolater;
  GEOPathMatcher *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEOPathMatcher;
  v12 = -[GEOPathMatcher init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    v23 = v12;
    v14 = geo_dispatch_queue_create_with_format();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_route, a3);
    objc_storeStrong((id *)&v13->_auditToken, a4);
    v13->_preloadDistance = 1600.0;
    *(_WORD *)&v13->_shouldDropDivergingSegments = 1;
    v16 = geo_isolater_create();
    matchedSegmentsIsolater = v13->_matchedSegmentsIsolater;
    v13->_matchedSegmentsIsolater = (geo_isolater *)v16;

    v18 = objc_msgSend(v11, "copy", v23);
    loggingIdentifier = v13->_loggingIdentifier;
    v13->_loggingIdentifier = (NSString *)v18;

    v20 = geo_isolater_create();
    internalInfosIsolater = v13->_internalInfosIsolater;
    v13->_internalInfosIsolater = (geo_isolater *)v20;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[GEOComposedRoute usesRoutingPathPoints](self->_route, "usesRoutingPathPoints")
    && -[GEOComposedRoute usesZilch](self->_route, "usesZilch"))
  {
    -[GEOPathMatcher _clearZilchSnappedPathsForRoute:](self, "_clearZilchSnappedPathsForRoute:", self->_route);
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPathMatcher;
  -[GEOPathMatcher dealloc](&v3, sel_dealloc);
}

- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5
{
  -[GEOPathMatcher matchRouteFromStart:toEnd:finishedHandler:callbackQueue:](self, "matchRouteFromStart:toEnd:finishedHandler:callbackQueue:", a3, a4, a5, MEMORY[0x1E0C80D38]);
}

- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5 callbackQueue:(id)a6
{
  id v10;
  NSObject *v11;
  NSObject *queue;
  NSObject *v13;
  double v14;
  NSString *v15;
  void *v16;
  double v17;
  void *v18;
  GEOComposedRoute *route;
  NSObject *v20;
  NSString *loggingIdentifier;
  _QWORD v22[5];
  NSObject *v23;
  id v24;
  PolylineCoordinate v25;
  PolylineCoordinate v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (-[GEOPathMatcher _isRangeValid:](self, "_isRangeValid:", a3, a4))
  {
    if (-[GEOComposedRoute usesRoutingPathPoints](self->_route, "usesRoutingPathPoints"))
    {
      queue = self->_queue;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_21;
      v22[3] = &unk_1E1C10310;
      v22[4] = self;
      v25 = a3;
      v26 = a4;
      v24 = v10;
      v23 = v11;
      dispatch_async(queue, v22);

    }
    else if (-[GEOComposedRoute usesZilch](self->_route, "usesZilch"))
    {
      route = self->_route;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_2;
      v27[3] = &unk_1E1C102E8;
      v29 = v10;
      v28 = v11;
      -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:handler:](self, "_zilchMatchedSegmentsForRoute:range:handler:", route, a3, a4, v27);

    }
    else
    {
      GEOGetGEOPathMatcherLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        loggingIdentifier = self->_loggingIdentifier;
        *(_DWORD *)buf = 138412290;
        v33 = loggingIdentifier;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "(%@) GEOPathMatcher only supports routes using routing path points or zilch points", buf, 0xCu);
      }

      if (v10)
        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }
  else
  {
    GEOGetGEOPathMatcherLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = self->_loggingIdentifier;
      GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateAsString(*(_QWORD *)&a4, 1, 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412803;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2113;
      v37 = v18;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_DEBUG, "(%@) Match requested with invalid range [%@] to [%{private}@], returning 0 segments", buf, 0x20u);

    }
    if (v10)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke;
      block[3] = &unk_1E1C05D48;
      v31 = v10;
      dispatch_async(v11, block);

    }
  }

}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_3;
    v6[3] = &unk_1E1C00290;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchRouteOnQueueForRange:finishedHandler:callbackQueue:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)matchedSegmentsFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4
{
  NSObject *v8;
  double v9;
  NSString *v10;
  void *v11;
  double v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  double v15;
  NSString *loggingIdentifier;
  void *v17;
  double v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  NSObject *queue;
  uint64_t v30;
  _QWORD v31[6];
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[GEOPathMatcher _isRangeValid:](self, "_isRangeValid:"))
  {
    if (!-[GEOComposedRoute usesRoutingPathPoints](self->_route, "usesRoutingPathPoints")
      && -[GEOComposedRoute usesZilch](self->_route, "usesZilch"))
    {
      -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:handler:](self, "_zilchMatchedSegmentsForRoute:range:handler:", self->_route, a3, a4, 0);
      -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:](self, "_zilchMatchedSegmentsForRoute:range:", self->_route, a3, a4);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    GEOGetGEOPathMatcherLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      loggingIdentifier = self->_loggingIdentifier;
      GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateAsString(*(_QWORD *)&a4, 1, 0, v18);
      v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412803;
      *(_QWORD *)&buf[4] = loggingIdentifier;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2113;
      v33 = v19;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "(%@) Requesting match from [%{private}@] to [%{private}@]", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__63;
    v34 = __Block_byref_object_dispose__63;
    -[GEOPathMatcher _cachedSegments]((uint64_t)self);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", a3, a4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "pointCount"))
      {
        v22 = objc_msgSend(v21, "startRouteCoordinate");
        v23 = *((float *)&v22 + 1) == a3.offset || *((float *)&v22 + 1) < a3.offset;
        if ((_DWORD)v22 == a3.index)
          v24 = v23;
        else
          v24 = v22 < a3.index;
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v20, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "pointCount"))
      {
        v26 = objc_msgSend(v25, "endRouteCoordinate");
        v27 = a4.offset == *((float *)&v26 + 1) || a4.offset < *((float *)&v26 + 1);
        if (a4.index == (_DWORD)v26)
          v28 = v27;
        else
          v28 = a4.index < v26;

        if (v24 && v28)
          goto LABEL_31;
      }
      else
      {

      }
    }
    -[GEOPathMatcher matchRouteFromStart:toEnd:finishedHandler:](self, "matchRouteFromStart:toEnd:finishedHandler:", a3, a4, 0);
    if (self->_forceSync)
    {
      queue = self->_queue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __49__GEOPathMatcher_matchedSegmentsFromStart_toEnd___block_invoke;
      v31[3] = &unk_1E1BFFF70;
      v31[4] = self;
      v31[5] = buf;
      dispatch_sync(queue, v31);
      -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", a3, a4, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v30 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v30;
    }
LABEL_31:
    _Block_object_dispose(buf, 8);

    return v20;
  }
  GEOGetGEOPathMatcherLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = self->_loggingIdentifier;
    GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(*(_QWORD *)&a4, 1, 0, v12);
    v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412803;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2113;
    v33 = v13;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "(%@) Match requested with invalid range [%{private}@] to [%{private}@], returning 0 segments", buf, 0x20u);

  }
  return 0;
}

- (id)_cachedSegments
{
  id v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  if (!a1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy__63;
  v7 = __Block_byref_object_dispose__63;
  v8 = 0;
  geo_isolate_sync();
  v1 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v1;
}

void __49__GEOPathMatcher_matchedSegmentsFromStart_toEnd___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[GEOPathMatcher _cachedSegments](*(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (GEOPolylineCoordinateRange)_validateInputRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5
{
  uint64_t end;
  uint64_t start;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  double v14;
  NSString *loggingIdentifier;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  double v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  float v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  unint64_t v38;
  PolylineCoordinate v39;
  PolylineCoordinate v40;
  double v41;
  NSString *v42;
  double v43;
  double v44;
  double v45;
  id v46;
  double v47;
  id v48;
  double v49;
  double v50;
  id v51;
  double v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  NSString *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  double v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  double v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  uint64_t v79;
  GEOPolylineCoordinateRange result;

  end = (uint64_t)a3.end;
  start = (uint64_t)a3.start;
  v79 = *MEMORY[0x1E0C80C00];
  v57 = a4;
  v58 = a5;
  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pathIndexForRouteCoordinate:", start);

  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "pathsCount");

  if (v10 >= v12)
  {
    GEOGetGEOPathMatcherLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      GEOPolylineCoordinateAsString(start, 1, 0, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v60 = loggingIdentifier;
      v61 = 2113;
      v62 = v16;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "(%@) Error finding path index for start coordinate %{private}@. Matching from start of route", buf, 0x16u);

    }
    start = 0;
  }
  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "pathIndexForRouteCoordinate:", end);

  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = v18 < objc_msgSend(v19, "pathsCount");

  if ((v18 & 1) == 0)
  {
    GEOGetGEOPathMatcherLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = self->_loggingIdentifier;
      GEOPolylineCoordinateAsString(end, 1, 0, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v60 = v22;
      v61 = 2113;
      v62 = v23;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "(%@) Error finding path index for end coordinate %{private}@. Matching to end of route", buf, 0x16u);

    }
    end = -[GEOComposedRoute pointCount](self->_route, "pointCount") - 1;
  }
  -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "startRouteCoordinate");
    v28 = objc_msgSend(v26, "endRouteCoordinate");
    v29 = v28;
    if ((_DWORD)v28 == (_DWORD)start)
    {
      if (*((float *)&v28 + 1) < *((float *)&start + 1))
        goto LABEL_19;
    }
    else if (v28 < start)
    {
      goto LABEL_19;
    }
    if ((_DWORD)end == (_DWORD)v27)
    {
      if (*((float *)&end + 1) < *((float *)&v27 + 1))
        goto LABEL_19;
    }
    else if (end < v27)
    {
      goto LABEL_19;
    }
    if ((_DWORD)v27 == (_DWORD)start)
    {
      if (*((float *)&v27 + 1) > *((float *)&start + 1))
      {
LABEL_43:
        if (*((float *)&start + 1) >= *((float *)&v27 + 1))
        {
LABEL_55:
          if (*((float *)&start + 1) >= *((float *)&v27 + 1))
          {
LABEL_56:
            v30 = v28 & 0xFFFFFFFF00000000;
            v31 = end & 0xFFFFFFFF00000000;
            goto LABEL_20;
          }
LABEL_58:
          v30 = start & 0xFFFFFFFF00000000;
          v31 = v27 & 0xFFFFFFFF00000000;
          v29 = start;
          goto LABEL_21;
        }
        goto LABEL_46;
      }
    }
    else if (v27 >= start)
    {
      goto LABEL_45;
    }
    if ((_DWORD)end == (_DWORD)v28)
    {
      if (*((float *)&end + 1) <= *((float *)&v28 + 1))
      {
LABEL_40:
        v29 = 0;
        LODWORD(v27) = 0;
        v30 = 0xBF80000000000000;
        v31 = 0xBF80000000000000;
        goto LABEL_21;
      }
    }
    else if (end < v28)
    {
      goto LABEL_40;
    }
    if ((_DWORD)v27 == (_DWORD)start)
      goto LABEL_43;
LABEL_45:
    if (start >= v27)
      goto LABEL_57;
LABEL_46:
    if ((_DWORD)v28 == (_DWORD)end)
    {
      if (*((float *)&v28 + 1) >= *((float *)&end + 1))
      {
LABEL_54:
        if ((_DWORD)v27 == (_DWORD)start)
          goto LABEL_55;
LABEL_57:
        if (start >= v27)
          goto LABEL_56;
        goto LABEL_58;
      }
    }
    else if (v28 >= end)
    {
      goto LABEL_54;
    }
LABEL_19:
    v30 = start & 0xFFFFFFFF00000000;
    v31 = end & 0xFFFFFFFF00000000;
    v29 = start;
LABEL_20:
    LODWORD(v27) = end;
LABEL_21:

    goto LABEL_22;
  }
  v30 = start & 0xFFFFFFFF00000000;
  v31 = end & 0xFFFFFFFF00000000;
  v29 = start;
  LODWORD(v27) = end;
LABEL_22:

  if (*((float *)&v30 + 1) < 0.0)
    goto LABEL_35;
  v32 = *((float *)&v31 + 1);
  if (*((float *)&v31 + 1) < 0.0)
    goto LABEL_35;
  if (v29 == (_DWORD)v27)
  {
    if (*((float *)&v30 + 1) <= *((float *)&v31 + 1))
      goto LABEL_26;
LABEL_35:
    -[GEOPathMatcher _cachedSegments]((uint64_t)self);
    v37 = objc_claimAutoreleasedReturnValue();
    -[GEOPathMatcher _callbackWithMatchedSegments:range:handler:callbackQueue:](self, "_callbackWithMatchedSegments:range:handler:callbackQueue:", v37, start, end, v57, v58);
    v38 = 0xBF80000000000000;
    v34 = 0xBF80000000000000;
    goto LABEL_36;
  }
  if (v29 >= v27)
    goto LABEL_35;
LABEL_26:
  v33 = v31 & 0xFFFFFFFF00000000 | v27;
  v34 = v33;
  if (self->_preloadDistance <= 0.0)
    goto LABEL_51;
  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "routeCoordinateForDistance:afterRouteCoordinate:", start, self->_preloadDistance);

  if ((_DWORD)v27 != (_DWORD)v36)
  {
    v34 = v33;
    if (v27 >= v36)
      goto LABEL_51;
    goto LABEL_50;
  }
  v34 = v33;
  if (v32 != *((float *)&v36 + 1))
  {
    v34 = v33;
    if (v32 < *((float *)&v36 + 1))
LABEL_50:
      v34 = v36;
  }
LABEL_51:
  v38 = v30 & 0xFFFFFFFF00000000 | v29;
  GEOGetGEOPathMatcherLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v42 = self->_loggingIdentifier;
    GEOPolylineCoordinateAsString(start, 1, 0, v41);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(end, 1, 0, v43);
    v55 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", start, end);
    v45 = v44;
    GEOPolylineCoordinateAsString(v38, 1, 0, v44);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(v33, 1, 0, v47);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v38, v33);
    v50 = v49;
    GEOPolylineCoordinateAsString(v38, 1, 0, v49);
    v51 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(v34, 1, 0, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v38, v34);
    *(_DWORD *)buf = 138414594;
    v60 = v42;
    v61 = 2112;
    v62 = v56;
    v63 = 2112;
    v64 = v55;
    v65 = 2048;
    v66 = v45;
    v67 = 2112;
    v68 = v46;
    v69 = 2112;
    v70 = v48;
    v71 = 2048;
    v72 = v50;
    v73 = 2112;
    v74 = v51;
    v75 = 2112;
    v76 = v53;
    v77 = 2048;
    v78 = v54;
    _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_INFO, "(%@) Requesting path decoder from [%@] to [%@], %0.1f meters\n\tUncached range: [%@] to [%@], %0.1f meters\n\tDecode range: [%@] to [%@], %0.1f meters", buf, 0x66u);

  }
LABEL_36:

  v39 = (PolylineCoordinate)v38;
  v40 = (PolylineCoordinate)v34;
  result.end = v40;
  result.start = v39;
  return result;
}

- (id)_supportPointForRouteCoordinate:(PolylineCoordinate)a3 isRangeStart:(BOOL)a4
{
  _BOOL4 v4;
  GEOCoordinateArraySupportPoint *v7;
  int v8;

  v4 = a4;
  v7 = objc_alloc_init(GEOCoordinateArraySupportPoint);
  -[GEOCoordinateArraySupportPoint setRouteCoordinate:](v7, "setRouteCoordinate:", a3);
  v8 = !v4;
  if (!a3.index)
    v8 = 0;
  -[GEOComposedRoute courseAtRouteCoordinateIndex:](self->_route, "courseAtRouteCoordinateIndex:", a3.index - v8);
  -[GEOCoordinateArraySupportPoint setHeading:](v7, "setHeading:");
  return v7;
}

- (id)_supportPointsForRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  float offset;
  float v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSString *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  __CFString *v30;
  NSString *v31;
  NSString *v32;
  uint64_t v33;
  double v34;
  void *v35;
  __CFString *v36;
  NSString *loggingIdentifier;
  void *v38;
  uint64_t v39;
  double v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  __CFString *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  float v50;
  _BOOL4 v51;
  unsigned int index;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  NSString *v59;
  uint64_t v60;
  double v61;
  void *v62;
  __CFString *v63;
  BOOL v64;
  NSString *v65;
  void *v66;
  uint64_t v67;
  double v68;
  void *v69;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  id v74;
  uint8_t buf[4];
  NSString *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  __CFString *v84;
  __int16 v85;
  __CFString *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  end = a3.end;
  start = a3.start;
  v93 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute coordinates](self->_route, "coordinates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supportPointsWithinRange:", start, end);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "routeCoordinate");
    v11 = v10;
    v12 = HIDWORD(*(unint64_t *)&start);
    offset = start.offset;
    if (start.index == (_DWORD)v10)
    {
      if (start.offset == *((float *)&v10 + 1))
      {

        goto LABEL_19;
      }

      if (start.offset >= *((float *)&v11 + 1))
      {
LABEL_19:
        GEOGetGEOPathMatcherLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          loggingIdentifier = self->_loggingIdentifier;
          objc_msgSend(v6, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "routeCoordinate");
          GEOPolylineCoordinateAsString(v39, 1, 0, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v76 = loggingIdentifier;
          v77 = 2112;
          v78 = v41;
          _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_INFO, "(%@) Using start support point on route: [%@]", buf, 0x16u);

        }
        goto LABEL_28;
      }
    }
    else
    {

      if (start.index >= v11)
        goto LABEL_19;
    }
  }
  else
  {
    v12 = HIDWORD(*(unint64_t *)&start);
    offset = start.offset;
  }
  v14 = floorf(offset);
  if (offset < 0.0)
    v14 = *(float *)&v12;
  -[GEOPathMatcher _supportPointForRouteCoordinate:isRangeStart:](self, "_supportPointForRouteCoordinate:isRangeStart:", start.index | ((unint64_t)LODWORD(v14) << 32), 1);
  v15 = objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", -[NSObject routeCoordinate](v15, "routeCoordinate"));
  v17 = v16;
  v19 = v18;
  -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21
    && objc_msgSend(v21, "isPartialEnd")
    && (v22 = objc_msgSend(v21, "endRouteCoordinate"),
        vabds_f32(offset + (float)start.index, (float)v22 + *((float *)&v22 + 1)) < 0.001))
  {
    objc_msgSend(v21, "road");
    v23 = objc_claimAutoreleasedReturnValue();
    GEOGetGEOPathMatcherLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = self->_loggingIdentifier;
      v72 = v24;
      v26 = objc_msgSend(v21, "range");
      GEOPolylineCoordinateRangeAsString(v26, v27, v28);
      v74 = (id)objc_claimAutoreleasedReturnValue();
      -[NSObject internalRoadName](v23, "internalRoadName");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[NSObject signedMuid](v23, "signedMuid");
      v29 = -[NSObject formOfWay](v23, "formOfWay");
      if (v29 < 0x17 && ((0x7EDDDFu >> v29) & 1) != 0)
      {
        v31 = v25;
        v30 = off_1E1C10330[(int)v29];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v29);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v31 = v25;
      }
      v42 = v30;
      v43 = -[NSObject roadClass](v23, "roadClass");
      if (v43 >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v43);
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = off_1E1C103E8[(int)v43];
      }
      v45 = v44;
      -[NSObject heading](v15, "heading");
      *(_DWORD *)buf = 138414339;
      v76 = v31;
      v77 = 2112;
      v78 = v74;
      v79 = 2112;
      v80 = v73;
      v81 = 2048;
      v24 = v72;
      v82 = v71;
      v83 = 2112;
      v84 = v42;
      v85 = 2112;
      v86 = v45;
      v87 = 2049;
      v88 = v17;
      v89 = 2049;
      v90 = v19;
      v91 = 2048;
      v92 = v46;
      _os_log_impl(&dword_1885A9000, v72, OS_LOG_TYPE_INFO, "(%@) Using synthetic start support point from last cached road [%@]: %@ | %lld | %@ | %@ | %{private}f, %{private}f | %0.1f°", buf, 0x5Cu);

    }
    -[NSObject setRoadID:](v15, "setRoadID:", -[NSObject signedMuid](v23, "signedMuid"));
  }
  else
  {
    GEOGetGEOPathMatcherLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v32 = self->_loggingIdentifier;
      v33 = -[NSObject routeCoordinate](v15, "routeCoordinate");
      GEOPolylineCoordinateAsString(v33, 1, 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject heading](v15, "heading");
      *(_DWORD *)buf = 138413315;
      v76 = v32;
      v77 = 2112;
      v78 = v35;
      v79 = 2049;
      v80 = v17;
      v81 = 2049;
      v82 = v19;
      v83 = 2048;
      v84 = v36;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_INFO, "(%@) Using synthetic start support point with no muid hint: [%@] | %{private}f, %{private}f | %0.1f°", buf, 0x34u);

    }
  }

  objc_msgSend(v6, "insertObject:atIndex:", v15, 0);
LABEL_28:

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "routeCoordinate");
    v49 = HIDWORD(*(unint64_t *)&end);
    v50 = end.offset;
    if ((_DWORD)v48 == end.index)
    {
      if (*((float *)&v48 + 1) == end.offset)
      {

        goto LABEL_43;
      }
      v64 = *((float *)&v48 + 1) < end.offset;

      if (!v64)
      {
LABEL_43:
        GEOGetGEOPathMatcherLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v65 = self->_loggingIdentifier;
          objc_msgSend(v6, "lastObject");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "routeCoordinate");
          GEOPolylineCoordinateAsString(v67, 1, 0, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v76 = v65;
          v77 = 2112;
          v78 = v69;
          _os_log_impl(&dword_1885A9000, v53, OS_LOG_TYPE_INFO, "(%@) Using end support point on route: [%@]", buf, 0x16u);

        }
        goto LABEL_45;
      }
    }
    else
    {
      v51 = v48 < end.index;

      if (!v51)
        goto LABEL_43;
    }
  }
  else
  {
    v49 = HIDWORD(*(unint64_t *)&end);
    v50 = end.offset;
  }
  if (v50 >= 0.0)
  {
    *(_DWORD *)buf = 0;
    if (modff(v50, (float *)buf) <= 0.0)
    {
      index = end.index;
    }
    else
    {
      LODWORD(v49) = *(_DWORD *)buf;
      index = end.index + 1;
    }
  }
  else
  {
    index = end.index;
  }
  -[GEOPathMatcher _supportPointForRouteCoordinate:isRangeStart:](self, "_supportPointForRouteCoordinate:isRangeStart:", index | ((unint64_t)v49 << 32), 0);
  v53 = objc_claimAutoreleasedReturnValue();
  -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", -[NSObject routeCoordinate](v53, "routeCoordinate"));
  v55 = v54;
  v57 = v56;
  GEOGetGEOPathMatcherLog();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    v59 = self->_loggingIdentifier;
    v60 = -[NSObject routeCoordinate](v53, "routeCoordinate");
    GEOPolylineCoordinateAsString(v60, 1, 0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject heading](v53, "heading");
    *(_DWORD *)buf = 138413315;
    v76 = v59;
    v77 = 2112;
    v78 = v62;
    v79 = 2049;
    v80 = v55;
    v81 = 2049;
    v82 = v57;
    v83 = 2048;
    v84 = v63;
    _os_log_impl(&dword_1885A9000, v58, OS_LOG_TYPE_INFO, "(%@) Using synthetic end support point: [%@] | %{private}f, %{private}f | %0.1f°", buf, 0x34u);

  }
  objc_msgSend(v6, "addObject:", v53);
LABEL_45:

  -[GEOPathMatcher _updateSupportPointsForNoMatchRanges:decodeRange:](self, "_updateSupportPointsForNoMatchRanges:decodeRange:", v6, start, end);
  return v6;
}

- (void)_updateSupportPointsForNoMatchRanges:(id)a3 decodeRange:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v7;
  void *v8;
  void *v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  unint64_t j;
  void *v17;
  uint64_t v18;
  PolylineCoordinate v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  GEOPathMatcher *v25;
  uint8_t buf[16];
  uint8_t v27[16];

  end = a4.end;
  start = a4.start;
  v7 = a3;
  if (v7)
  {
    v25 = self;
    -[GEOComposedRoute coordinates](self->_route, "coordinates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noMatchRanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend(v9, "count"))
      {

        goto LABEL_43;
      }
      v11 = objc_msgSend(v9, "coordinateRangeAtIndex:", i);
      v13 = v11;
      v14 = v12;
      v15 = *((float *)&v11 + 1);
      if (end.index == (_DWORD)v11)
      {
        if (end.offset <= *((float *)&v11 + 1))
          continue;
      }
      else if (end.index < v11)
      {
        continue;
      }
      if ((_DWORD)v12 == start.index)
      {
        if (*((float *)&v12 + 1) <= start.offset)
          continue;
      }
      else if (v12 < start.index)
      {
        continue;
      }
      for (j = 0; ; ++j)
      {
        if (j >= objc_msgSend(v7, "count"))
          goto LABEL_25;
        objc_msgSend(v7, "objectAtIndexedSubscript:", j);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "routeCoordinate");
        if (v13 < v18 || (_DWORD)v13 == (_DWORD)v18 && v15 < *((float *)&v18 + 1))
          break;

      }
      if (start.index != (_DWORD)v13)
        break;
      v19 = start;
      if (start.offset != v15)
      {
        v19 = start;
        if (start.offset < v15)
          goto LABEL_23;
      }
LABEL_24:
      -[GEOPathMatcher _supportPointForRouteCoordinate:isRangeStart:](v25, "_supportPointForRouteCoordinate:isRangeStart:", v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMatchType:", 1);
      objc_msgSend(v7, "insertObject:atIndex:", v20, j);

LABEL_25:
      while (j < objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", j);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "routeCoordinate");
        if (v14 < v22
          || (_DWORD)v14 == (_DWORD)v22 && *((float *)&v14 + 1) < *((float *)&v22 + 1))
        {
          -[GEOPathMatcher _supportPointForRouteCoordinate:isRangeStart:](v25, "_supportPointForRouteCoordinate:isRangeStart:", v14, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setMatchType:", 2);
          objc_msgSend(v7, "insertObject:atIndex:", v23, j);

          if (v23)
            goto LABEL_35;
          break;
        }

        ++j;
      }
      if (end.index >= v14 && (end.index != (_DWORD)v14 || end.offset > *((float *)&v14 + 1)))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: decodeRange.end <= noMatchRange.end", v27, 2u);
        }
        GEOGetGEOPathMatcherLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "No-match end support point should have been added in the middle of support points array.", buf, 2u);
        }

      }
      -[GEOPathMatcher _supportPointForRouteCoordinate:isRangeStart:](v25, "_supportPointForRouteCoordinate:isRangeStart:", end, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMatchType:", 2);
      objc_msgSend(v7, "addObject:", v23);
LABEL_35:

    }
    v19 = start;
    if (start.index >= v13)
      goto LABEL_24;
LABEL_23:
    v19 = (PolylineCoordinate)v13;
    goto LABEL_24;
  }
LABEL_43:

}

- (void)_matchRouteOnQueueForRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t **v30;
  uint64_t **v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  double v38;
  NSString *loggingIdentifier;
  id v40;
  double v41;
  void *v42;
  id v43;
  NSObject *v44;
  GEOComposedRoute *route;
  void *v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  uint64_t v51;
  NSObject *v52;
  double v53;
  NSString *v54;
  void *v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  double v61;
  NSString *v62;
  void *v63;
  double v64;
  void *v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  __int128 v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  _OWORD *v81;
  __int128 v82;
  void *v83;
  void *v84;
  NSObject *v85;
  NSString *v86;
  void *v87;
  unint64_t v88;
  _BYTE *v89;
  _BYTE *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  __int128 v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double *v109;
  double *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  void *v122;
  uint64_t v123;
  int64_t v124;
  unint64_t v125;
  int64_t v126;
  unint64_t v127;
  char *v128;
  double v129;
  double v130;
  double v131;
  double *v132;
  void *v133;
  double v134;
  int64_t v135;
  unint64_t v136;
  int64_t v137;
  unint64_t v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  __int128 v144;
  double *v145;
  char *v146;
  char *v147;
  double *v148;
  __int128 v149;
  float v150;
  float v151;
  uint64_t v152;
  float v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  float64x2_t *v158;
  float64x2_t *v159;
  double v160;
  double v161;
  double v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  void *v166;
  double v167;
  float v168;
  float v169;
  float64x2_t v170;
  double v171;
  double *v172;
  int64_t v173;
  unint64_t v174;
  int64_t v175;
  unint64_t v176;
  char *v177;
  int64_t v178;
  unint64_t v179;
  int64_t v180;
  unint64_t v181;
  char *v182;
  double *v183;
  char *v184;
  char *v185;
  double *v186;
  __int128 v187;
  char *v188;
  char *v189;
  char *v190;
  char *v191;
  __int128 v192;
  void *v193;
  unsigned int v194;
  float v195;
  unsigned int v196;
  float v197;
  BOOL v198;
  NSObject *v199;
  NSString *v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  GEOMatchedPathSegment *v206;
  NSObject *v207;
  NSString *v208;
  int v209;
  void *v211;
  id v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t j;
  void *v216;
  id v217;
  NSObject *v218;
  NSString *v219;
  int v220;
  double v221;
  id v222;
  double v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  __CFString *v227;
  GEOPolylineCoordinateRange *value;
  GEOPolylineCoordinateRange *v229;
  GEOPolylineCoordinateRange *v230;
  uint64_t v231;
  unint64_t v232;
  uint64_t v233;
  unint64_t v234;
  char *v235;
  __CFString *v236;
  uint64_t v237;
  __CFString *v238;
  uint64_t *v239;
  GEOPolylineCoordinateRange *v240;
  GEOPolylineCoordinateRange *begin;
  GEOPolylineCoordinateRange *v242;
  NSObject *v243;
  double v244;
  NSString *v245;
  id v246;
  double v247;
  id v248;
  double v249;
  id v250;
  double v251;
  void *v252;
  id v253;
  NSObject *v254;
  NSString *v255;
  NSObject *v256;
  NSString *v257;
  double v258;
  NSObject *v259;
  NSString *v260;
  double v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  vector<GEOPolylineCoordinateRange, std::allocator<GEOPolylineCoordinateRange>> *p_failedRanges;
  id v267;
  id v268;
  char v269;
  NSObject *v270;
  void *v271;
  void *v272;
  id v273;
  id obj;
  void *v275;
  uint64_t v276;
  double v277;
  uint64_t v278;
  uint64_t v279;
  GEOPathMatcherInternalInfo *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  id v284;
  double v285;
  double v286;
  double v287;
  float64x2_t v288;
  uint64_t v289;
  double v290;
  uint64_t v291;
  id v292;
  id v293;
  uint64_t v294;
  id v295;
  GEOPathMatcher *v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  uint64_t *v305;
  uint64_t *v306;
  uint64_t v307;
  void *__p[2];
  _OWORD v309[3];
  _OWORD v310[2];
  double v311;
  _OWORD v312[2];
  id v313;
  id v314;
  _QWORD v315[2];
  _BYTE v316[24];
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  uint64_t v322;
  uint8_t v323[128];
  uint8_t buf[128];
  id v325;
  _QWORD *v326[4];
  uint8_t v327[128];
  _BYTE v328[68];
  _BYTE v329[10];
  uint64_t v330;
  __int16 v331;
  uint64_t v332;
  __int16 v333;
  uint64_t v334;
  uint64_t v335;

  end = a3.end;
  start = a3.start;
  v335 = *MEMORY[0x1E0C80C00];
  v267 = a4;
  v268 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v296 = self;
  if (self->_route)
  {
    v9 = -[GEOPathMatcher _validateInputRange:finishedHandler:callbackQueue:](self, "_validateInputRange:finishedHandler:callbackQueue:", start, end, v267, v268);
    v12 = v9;
    LODWORD(v13) = HIDWORD(v9);
    if (*((float *)&v9 + 1) >= 0.0)
    {
      v14 = v10;
      LODWORD(v11) = HIDWORD(v10);
      if (*((float *)&v10 + 1) >= 0.0)
      {
        if ((_DWORD)v9 == (_DWORD)v10)
        {
          if (*((float *)&v9 + 1) > *((float *)&v10 + 1))
            goto LABEL_285;
LABEL_10:
          -[GEOPathMatcher setInternalInfos:](v296, "setInternalInfos:", 0, v13, v11);
          v264 = (uint64_t)end;
          v265 = (uint64_t)start;
          if (v296->_shouldSaveInternalInfo)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v16 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = 0;
          }
          -[GEOPathMatcher _supportPointsForRange:](v296, "_supportPointsForRange:", v12, v14);
          v307 = 0;
          v306 = 0;
          v305 = (uint64_t *)&v306;
          v301 = 0u;
          v302 = 0u;
          v303 = 0u;
          v304 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v327, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v302;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v302 != v18)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v301 + 1) + 8 * i);
                -[GEOComposedRoute pointAtRouteCoordinate:](v296->_route, "pointAtRouteCoordinate:", objc_msgSend(v20, "routeCoordinate"));
                v22 = v21;
                v24 = v23;
                v26 = v25;
                v27 = objc_msgSend(v20, "roadID");
                v28 = v27;
                v29 = v306;
                v30 = &v306;
                v31 = &v306;
                if (v306)
                {
                  while (1)
                  {
                    while (1)
                    {
                      v31 = (uint64_t **)v29;
                      v32 = v29[4];
                      if (v32 <= v27)
                        break;
                      v29 = *v31;
                      v30 = v31;
                      if (!*v31)
                        goto LABEL_26;
                    }
                    if (v32 >= v27)
                      break;
                    v29 = v31[1];
                    if (!v29)
                    {
                      v30 = v31 + 1;
                      goto LABEL_26;
                    }
                  }
                  v34 = (uint64_t *)v31;
                }
                else
                {
LABEL_26:
                  v34 = (uint64_t *)operator new(0x40uLL);
                  v34[4] = v28;
                  v34[5] = 0;
                  v34[6] = 0;
                  v34[7] = 0;
                  *v34 = 0;
                  v34[1] = 0;
                  v34[2] = (uint64_t)v31;
                  *v30 = v34;
                  v33 = v34;
                  if (*v305)
                  {
                    v305 = (uint64_t *)*v305;
                    v33 = *v30;
                  }
                  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v306, v33);
                  ++v307;
                }
                v34[5] = v22;
                v34[6] = v24;
                v34[7] = v26;
              }
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v301, v327, 16);
            }
            while (v17);
          }
          v270 = v16;

          GEOPathMatcherRoadNetwork::GEOPathMatcherRoadNetwork((uint64_t)buf, -[GEOComposedRoute transportType](v296->_route, "transportType"), v296->_auditToken, (uint64_t *)&v305);
          v299 = 0u;
          v300 = 0u;
          v297 = 0u;
          v298 = 0u;
          v273 = obj;
          v35 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v297, v323, 16);
          if (!v35)
          {
            v284 = 0;
            v275 = 0;
            goto LABEL_283;
          }
          v284 = 0;
          v275 = 0;
          v278 = *(_QWORD *)v298;
          v279 = v35;
          p_failedRanges = &v296->_failedRanges;
          while (1)
          {
            v291 = 0;
            do
            {
              if (*(_QWORD *)v298 != v278)
                objc_enumerationMutation(v273);
              v36 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * v291);
              if (!v284)
              {
                v284 = v36;
                goto LABEL_261;
              }
              if (objc_msgSend(v284, "matchType") != 1 || objc_msgSend(v36, "matchType") == 2)
              {
                v282 = objc_msgSend(v284, "routeCoordinate");
                v294 = objc_msgSend(v36, "routeCoordinate");
                if (!-[GEOPathMatcher _isFailedRange:](v296, "_isFailedRange:", v282, v294))
                {
                  v272 = v36;
                  if (objc_msgSend(v284, "matchType") == 1 && objc_msgSend(v36, "matchType") == 2)
                  {
                    GEOGetGEOPathMatcherLog();
                    v37 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      loggingIdentifier = v296->_loggingIdentifier;
                      GEOPolylineCoordinateAsString(v282, 1, 0, v38);
                      v40 = (id)objc_claimAutoreleasedReturnValue();
                      GEOPolylineCoordinateAsString(v294, 1, 0, v41);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v316 = 138412802;
                      *(_QWORD *)&v316[4] = loggingIdentifier;
                      *(_WORD *)&v316[12] = 2112;
                      *(_QWORD *)&v316[14] = v40;
                      *(_WORD *)&v316[22] = 2112;
                      v317 = v42;
                      _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_DEFAULT, "(%@) Path matcher skipped range: [%@] to [%@]", v316, 0x20u);

                    }
                    v43 = -[GEOMatchedPathSegment initUnmatchedSegmentWithRoute:range:isFailedSegment:]([GEOMatchedPathSegment alloc], "initUnmatchedSegmentWithRoute:range:isFailedSegment:", v296->_route, v282, v294, 0);
                    v313 = v43;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v313, 1);
                    v44 = objc_claimAutoreleasedReturnValue();

                    v280 = 0;
                    goto LABEL_255;
                  }
                  if (v296->_shouldSaveInternalInfo)
                    v280 = objc_alloc_init(GEOPathMatcherInternalInfo);
                  else
                    v280 = 0;
                  route = v296->_route;
                  v315[0] = v284;
                  v315[1] = v36;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v315, 2);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[GEOPathMatcher _decodePathForRoute:supportPoints:roadNetwork:internalInfo:]((uint64_t)v316, (uint64_t)v296, route, v46, (uint64_t)buf, v280);

                  -[GEOComposedRoute coordinates](v296->_route, "coordinates");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = v325;
                  v292 = v47;
                  v293 = v48;
                  if (*(void **)&v316[16] == v317)
                  {
                    v44 = 0;
                    goto LABEL_220;
                  }
                  v49 = *(double *)v316;
                  if (*(double *)v316 < 0.0 || *(double *)v316 > 1.0)
                  {
                    GEOGetGEOPathMatcherLog();
                    v256 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
                    {
                      v257 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412546;
                      *(_QWORD *)&v328[4] = v257;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v49;
                      _os_log_impl(&dword_1885A9000, v256, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.origin_segment_fraction (%f) is outside of the unexpected range [0, 1]. Clamping and attempting to continue...", v328, 0x16u);
                    }

                    v258 = 0.0;
                    if (v49 >= 0.0)
                      v258 = v49;
                    if (v258 <= 1.0)
                      v49 = v258;
                    else
                      v49 = 1.0;
                  }
                  v50 = *(double *)&v316[8];
                  if (*(double *)&v316[8] < 0.0 || *(double *)&v316[8] > 1.0)
                  {
                    GEOGetGEOPathMatcherLog();
                    v259 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
                    {
                      v260 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412546;
                      *(_QWORD *)&v328[4] = v260;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v50;
                      _os_log_impl(&dword_1885A9000, v259, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.destination_segment_fraction (%f) is outside of the unexpected range [0, 1]. Clamping and attempting to continue...", v328, 0x16u);
                    }

                    v261 = 0.0;
                    if (v50 >= 0.0)
                      v261 = v50;
                    if (v261 <= 1.0)
                      v50 = v261;
                    else
                      v50 = 1.0;
                  }
                  v51 = (uint64_t)v317 - *(_QWORD *)&v316[16];
                  if (v49 > v50 && (unint64_t)v51 <= 0x3F)
                  {
                    GEOGetGEOPathMatcherLog();
                    v254 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
                    {
                      v255 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412802;
                      *(_QWORD *)&v328[4] = v255;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v49;
                      *(_WORD *)&v328[22] = 2048;
                      *(double *)&v328[24] = v50;
                      _os_log_impl(&dword_1885A9000, v254, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.origin_segment_fraction (%f) is greater than RoadNetworkPath.destination_segment_fraction (%f) on a single segment result. This is a path-codec library error. Clamping and attempting to continue...", v328, 0x20u);
                    }

                    v51 = (uint64_t)v317 - *(_QWORD *)&v316[16];
                    v50 = v49;
                  }
                  if (fabs(v49 + -1.0) >= 0.01)
                  {
                    v281 = 0;
                  }
                  else
                  {
                    GEOGetGEOPathMatcherLog();
                    v52 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                    {
                      v54 = v296->_loggingIdentifier;
                      GEOPolylineCoordinateAsString(v282, 1, 0, v53);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      GEOPolylineCoordinateAsString(v294, 1, 0, v56);
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v328 = 138413826;
                      *(_QWORD *)&v328[4] = v54;
                      *(_WORD *)&v328[12] = 2112;
                      *(_QWORD *)&v328[14] = v55;
                      *(_WORD *)&v328[22] = 2112;
                      *(_QWORD *)&v328[24] = v57;
                      *(_WORD *)&v328[32] = 1024;
                      *(_DWORD *)&v328[34] = 0;
                      *(_WORD *)&v328[38] = 1024;
                      *(_DWORD *)&v328[40] = (((unint64_t)v317 - *(_QWORD *)&v316[16]) >> 5) - 1;
                      *(_WORD *)&v328[44] = 2048;
                      *(_QWORD *)&v328[46] = *(_QWORD *)v316;
                      *(_WORD *)&v328[54] = 2048;
                      *(_QWORD *)&v328[56] = *(_QWORD *)&v316[8];
                      _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_INFO, "(%@) Ignoring zero length segment returned from path-codec API: [%@] to [%@] | index: %d/%d, path fraction: %0.8f, %0.8f", v328, 0x40u);

                    }
                    v49 = 0.0;
                    v281 = 1;
                  }
                  v58 = v51 >> 5;
                  v59 = v58 - 1;
                  if (fabs(v50) < 0.01)
                  {
                    GEOGetGEOPathMatcherLog();
                    v60 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      v62 = v296->_loggingIdentifier;
                      GEOPolylineCoordinateAsString(v282, 1, 0, v61);
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      GEOPolylineCoordinateAsString(v294, 1, 0, v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v328 = 138413826;
                      *(_QWORD *)&v328[4] = v62;
                      *(_WORD *)&v328[12] = 2112;
                      *(_QWORD *)&v328[14] = v63;
                      *(_WORD *)&v328[22] = 2112;
                      *(_QWORD *)&v328[24] = v65;
                      *(_WORD *)&v328[32] = 1024;
                      *(_DWORD *)&v328[34] = v58 - 1;
                      *(_WORD *)&v328[38] = 1024;
                      *(_DWORD *)&v328[40] = (((unint64_t)v317 - *(_QWORD *)&v316[16]) >> 5) - 1;
                      *(_WORD *)&v328[44] = 2048;
                      *(_QWORD *)&v328[46] = *(_QWORD *)v316;
                      *(_WORD *)&v328[54] = 2048;
                      *(_QWORD *)&v328[56] = *(_QWORD *)&v316[8];
                      _os_log_impl(&dword_1885A9000, v60, OS_LOG_TYPE_INFO, "(%@) Ignoring zero length segment returned from path-codec API: [%@] to [%@] | index: %d/%d, path fraction: %0.8f, %0.8f", v328, 0x40u);

                    }
                    v59 = v58 - 2;
                    v50 = 1.0;
                  }
                  v66 = 0.0;
                  v283 = v59;
                  if (v281 <= v59)
                  {
                    v67 = 0;
                    v68 = 32 * v281;
                    v69 = 0.0;
                    while (1)
                    {
                      v70 = *(_OWORD *)(*(_QWORD *)&v316[16] + v68 + 16);
                      v312[0] = *(_OWORD *)(*(_QWORD *)&v316[16] + v68);
                      v312[1] = v70;
                      objc_msgSend(v293, "roadForKey:", v312);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v71, "length");
                      v73 = v72;
                      if (!v67)
                      {
                        objc_msgSend(v71, "length");
                        v73 = v73 - v74 * v49;
                      }
                      if (v281 - v59 == v67)
                        break;

                      v69 = v69 + v73;
                      --v67;
                      v68 += 32;
                    }
                    objc_msgSend(v71, "length");
                    v76 = v75;

                    v66 = v69 + v73 - v76 * (1.0 - v50);
                  }
                  objc_msgSend(v292, "distanceFromStartToRouteCoordinate:", v282);
                  v290 = v77;
                  objc_msgSend(v292, "distanceFromStartToRouteCoordinate:", v294);
                  v79 = v78;
                  v311 = 0.0;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", ((uint64_t)v317 - *(_QWORD *)&v316[16]) >> 5);
                  v271 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = v281;
                  if (v281 > v59)
                    goto LABEL_218;
                  v269 = 0;
                  v285 = (v79 - v290) / v66;
                  while (2)
                  {
                    v81 = (_OWORD *)(*(_QWORD *)&v316[16] + 32 * v80);
                    v82 = v81[1];
                    v310[0] = *v81;
                    v310[1] = v82;
                    objc_msgSend(v293, "roadForKey:", v310);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    v84 = v83;
                    if (!v83)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)v328 = 0;
                        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: road != nullptr", v328, 2u);
                      }
LABEL_209:
                      if ((v269 & 1) != 0)
                      {
                        *(_OWORD *)__p = 0u;
                        memset(v309, 0, sizeof(v309));
                        v212 = v271;
                        v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", __p, v328, 16);
                        if (v213)
                        {
                          v214 = **(_QWORD **)&v309[0];
                          do
                          {
                            for (j = 0; j != v213; ++j)
                            {
                              if (**(_QWORD **)&v309[0] != v214)
                                objc_enumerationMutation(v212);
                              objc_msgSend(*((id *)__p[1] + j), "setIsDivergentSegment:", 1);
                            }
                            v213 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", __p, v328, 16);
                          }
                          while (v213);
                        }

                      }
LABEL_218:
                      v211 = v271;
                      objc_msgSend(v271, "count");
                      v44 = v271;
LABEL_219:

LABEL_220:
                      if (-[NSObject count](v44, "count"))
                      {
                        -[NSObject firstObject](v44, "firstObject");
                        v216 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v216, "road");
                        v217 = (id)objc_claimAutoreleasedReturnValue();

                        GEOGetGEOPathMatcherLog();
                        v218 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                        {
                          v219 = v296->_loggingIdentifier;
                          v220 = -[NSObject count](v44, "count");
                          GEOPolylineCoordinateAsString(v282, 1, 0, v221);
                          v222 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v294, 1, 0, v223);
                          v295 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v217, "internalRoadName");
                          v224 = (void *)objc_claimAutoreleasedReturnValue();
                          v225 = objc_msgSend(v217, "signedMuid");
                          v226 = objc_msgSend(v217, "formOfWay");
                          if (v226 < 0x17 && ((0x7EDDDFu >> v226) & 1) != 0)
                          {
                            v227 = off_1E1C10330[(int)v226];
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v226);
                            v227 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          v236 = v227;
                          v237 = objc_msgSend(v217, "roadClass");
                          if (v237 >= 0xA)
                          {
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v237);
                            v238 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v238 = off_1E1C103E8[(int)v237];
                          }
                          *(_DWORD *)v328 = 138414082;
                          *(_QWORD *)&v328[4] = v219;
                          *(_WORD *)&v328[12] = 1024;
                          *(_DWORD *)&v328[14] = v220;
                          *(_WORD *)&v328[18] = 2112;
                          *(_QWORD *)&v328[20] = v222;
                          *(_WORD *)&v328[28] = 2112;
                          *(_QWORD *)&v328[30] = v295;
                          *(_WORD *)&v328[38] = 2112;
                          *(_QWORD *)&v328[40] = v224;
                          *(_WORD *)&v328[48] = 2048;
                          *(_QWORD *)&v328[50] = v225;
                          *(_WORD *)&v328[58] = 2112;
                          *(_QWORD *)&v328[60] = v236;
                          *(_WORD *)v329 = 2112;
                          *(_QWORD *)&v329[2] = v238;
                          _os_log_impl(&dword_1885A9000, v218, OS_LOG_TYPE_INFO, "(%@) Path matching completed with %d road segments for range: [%@] to [%@]\nFirst road: %@ | %lld | %@ | %@", v328, 0x4Eu);

                        }
                      }
                      else
                      {
                        v229 = v296->_failedRanges.__end_;
                        value = v296->_failedRanges.__end_cap_.__value_;
                        if (v229 >= value)
                        {
                          v231 = v229 - p_failedRanges->__begin_;
                          v232 = v231 + 1;
                          if ((unint64_t)(v231 + 1) >> 60)
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          v233 = (char *)value - (char *)p_failedRanges->__begin_;
                          if (v233 >> 3 > v232)
                            v232 = v233 >> 3;
                          if ((unint64_t)v233 >= 0x7FFFFFFFFFFFFFF0)
                            v234 = 0xFFFFFFFFFFFFFFFLL;
                          else
                            v234 = v232;
                          if (v234)
                            v235 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v296->_failedRanges.__end_cap_, v234);
                          else
                            v235 = 0;
                          v239 = (uint64_t *)&v235[16 * v231];
                          *v239 = v282;
                          v239[1] = v294;
                          begin = v296->_failedRanges.__begin_;
                          v240 = v296->_failedRanges.__end_;
                          v242 = (GEOPolylineCoordinateRange *)v239;
                          if (v240 != begin)
                          {
                            do
                            {
                              v242[-1] = v240[-1];
                              --v242;
                              --v240;
                            }
                            while (v240 != begin);
                            v240 = p_failedRanges->__begin_;
                          }
                          v230 = (GEOPolylineCoordinateRange *)(v239 + 2);
                          v296->_failedRanges.__begin_ = v242;
                          v296->_failedRanges.__end_ = (GEOPolylineCoordinateRange *)(v239 + 2);
                          v296->_failedRanges.__end_cap_.__value_ = (GEOPolylineCoordinateRange *)&v235[16 * v234];
                          if (v240)
                            operator delete(v240);
                        }
                        else
                        {
                          v229->start = (PolylineCoordinate)v282;
                          v229->end = (PolylineCoordinate)v294;
                          v230 = v229 + 1;
                        }
                        v296->_failedRanges.__end_ = v230;
                        GEOGetGEOPathMatcherLog();
                        v243 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
                        {
                          v245 = v296->_loggingIdentifier;
                          GEOPolylineCoordinateAsString(v282, 1, 0, v244);
                          v246 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v294, 1, 0, v247);
                          v248 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v265, 1, 0, v249);
                          v250 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v264, 1, 0, v251);
                          v252 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)v328 = 138413314;
                          *(_QWORD *)&v328[4] = v245;
                          *(_WORD *)&v328[12] = 2112;
                          *(_QWORD *)&v328[14] = v246;
                          *(_WORD *)&v328[22] = 2112;
                          *(_QWORD *)&v328[24] = v248;
                          *(_WORD *)&v328[32] = 2112;
                          *(_QWORD *)&v328[34] = v250;
                          *(_WORD *)&v328[42] = 2112;
                          *(_QWORD *)&v328[44] = v252;
                          _os_log_impl(&dword_1885A9000, v243, OS_LOG_TYPE_ERROR, "(%@) Path matching failed for range: [%@] to [%@] (Requested range was [%@] to [%@])", v328, 0x34u);

                        }
                        v217 = -[GEOMatchedPathSegment initUnmatchedSegmentWithRoute:range:isFailedSegment:]([GEOMatchedPathSegment alloc], "initUnmatchedSegmentWithRoute:range:isFailedSegment:", v296->_route, v282, v294, 1);
                        v314 = v217;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v314, 1);
                        v218 = v44;
                        v44 = objc_claimAutoreleasedReturnValue();
                      }

                      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>>>::~__hash_table((uint64_t)&v322);
                      if (v320)
                      {
                        v321 = v320;
                        operator delete(v320);
                      }
                      if (v318)
                      {
                        v319 = v318;
                        operator delete(v318);
                      }
                      if (*(_QWORD *)&v316[16])
                      {
                        v317 = *(void **)&v316[16];
                        operator delete(*(void **)&v316[16]);
                      }
LABEL_255:
                      if (!v275 && v44)
                      {
                        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSObject count](v44, "count"));
                        v275 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      objc_msgSend(v275, "addObjectsFromArray:", v44);
                      if (v280)
                      {
                        objc_storeStrong((id *)&v280->_matchedSegments, v44);
                        -[NSObject addObject:](v270, "addObject:", v280);
                      }
                      v253 = v272;

                      v284 = v253;
                      goto LABEL_261;
                    }
                    if ((unint64_t)objc_msgSend(v83, "coordinateCount") <= 1)
                    {
                      GEOGetGEOPathMatcherLog();
                      v85 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        v86 = v296->_loggingIdentifier;
                        objc_msgSend(v84, "debugDescription");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v328 = 138412546;
                        *(_QWORD *)&v328[4] = v86;
                        *(_WORD *)&v328[12] = 2112;
                        *(_QWORD *)&v328[14] = v87;
                        _os_log_impl(&dword_1885A9000, v85, OS_LOG_TYPE_ERROR, "(%@) Road has fewer than 2 coordinates, skipping. %@", v328, 0x16u);

                      }
                      goto LABEL_199;
                    }
                    __p[1] = 0;
                    __p[0] = 0;
                    *(_QWORD *)&v309[0] = 0;
                    v88 = objc_msgSend(v84, "coordinateCount");
                    v89 = __p[0];
                    if (v88 > (uint64_t)(*(_QWORD *)&v309[0] - (unint64_t)__p[0]) >> 5)
                    {
                      if (v88 >> 59)
                        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                      v90 = __p[1];
                      v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v88);
                      v93 = (char *)__p[1];
                      v94 = (char *)__p[0];
                      v95 = &v91[(v90 - v89) & 0xFFFFFFFFFFFFFFE0];
                      if (__p[1] != __p[0])
                      {
                        do
                        {
                          v96 = *((_OWORD *)v93 - 1);
                          *((_OWORD *)v95 - 2) = *((_OWORD *)v93 - 2);
                          *((_OWORD *)v95 - 1) = v96;
                          v95 -= 32;
                          v93 -= 32;
                        }
                        while (v93 != v94);
                        v93 = v94;
                      }
                      __p[0] = v95;
                      __p[1] = &v91[(v90 - v89) & 0xFFFFFFFFFFFFFFE0];
                      *(_QWORD *)&v309[0] = &v91[32 * v92];
                      if (v93)
                        operator delete(v93);
                    }
                    v97 = objc_msgSend(v84, "coordinateCount") - 1;
                    if (v80 == v281 || v80 == v283)
                    {
                      v286 = 0.0;
                      if (v80 == v281)
                      {
                        objc_msgSend(v84, "length");
                        v286 = v49 * v100;
                      }
                      if (v80 == v283)
                      {
                        objc_msgSend(v84, "length");
                        v102 = v50 * v101;
                      }
                      else
                      {
                        v102 = 1.79769313e308;
                      }
                      if (v80 == v281)
                      {
                        v103 = 0;
                        v104 = 0;
                        v105 = 0.0;
                        while (1)
                        {
                          if (v104 + 1 >= (unint64_t)objc_msgSend(v84, "coordinateCount"))
                          {
                            v99 = 0;
                            v276 = 0;
                            v123 = v104 + 1;
                            v118 = 0.0;
                            goto LABEL_140;
                          }
                          v106 = v102;
                          v107 = v50;
                          v108 = v49;
                          v109 = (double *)(objc_msgSend(v84, "coordinates3d") + v103);
                          v110 = (double *)(objc_msgSend(v84, "coordinates3d") + v103);
                          v112 = *v109;
                          v111 = v109[1];
                          v114 = v110[3];
                          v113 = v110[4];
                          v115 = GEOCalculateDistanceRadius(*v109, v111, v114, v113, 6367000.0);
                          if (v105 + v115 > v286)
                            break;
                          ++v104;
                          v103 += 24;
                          v105 = v105 + v115;
                          v49 = v108;
                          v50 = v107;
                          v102 = v106;
                        }
                        v287 = v105 + v115 - v286;
                        v129 = v114 + (v112 - v114) * (v287 / v115);
                        v130 = v113 + (v111 - v113) * (v287 / v115);
                        v277 = v287 / v115;
                        v131 = v110[5] + (v109[2] - v110[5]) * (v287 / v115);
                        v132 = (double *)__p[1];
                        if (__p[1] >= (void *)*(_QWORD *)&v309[0])
                        {
                          v135 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                          v136 = v135 + 1;
                          if ((unint64_t)(v135 + 1) >> 59)
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          v137 = *(_QWORD *)&v309[0] - (unint64_t)__p[0];
                          if ((uint64_t)(*(_QWORD *)&v309[0] - (unint64_t)__p[0]) >> 4 > v136)
                            v136 = v137 >> 4;
                          if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFE0)
                            v138 = 0x7FFFFFFFFFFFFFFLL;
                          else
                            v138 = v136;
                          v102 = v106;
                          if (v138)
                            v139 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v138);
                          else
                            v139 = 0;
                          v145 = (double *)&v139[32 * v135];
                          *v145 = v129;
                          v145[1] = v130;
                          v145[2] = v131;
                          *((_QWORD *)v145 + 3) = v282;
                          v146 = (char *)__p[1];
                          v147 = (char *)__p[0];
                          v148 = v145;
                          v49 = v108;
                          v50 = v107;
                          if (__p[1] != __p[0])
                          {
                            do
                            {
                              v149 = *((_OWORD *)v146 - 1);
                              *((_OWORD *)v148 - 2) = *((_OWORD *)v146 - 2);
                              *((_OWORD *)v148 - 1) = v149;
                              v148 -= 4;
                              v146 -= 32;
                            }
                            while (v146 != v147);
                            v146 = v147;
                          }
                          v118 = v287;
                          v134 = v277;
                          v133 = v145 + 4;
                          __p[0] = v148;
                          __p[1] = v145 + 4;
                          *(_QWORD *)&v309[0] = &v139[32 * v138];
                          if (v146)
                            operator delete(v146);
                        }
                        else
                        {
                          *(double *)__p[1] = v129;
                          v132[1] = v130;
                          v132[2] = v131;
                          v133 = v132 + 4;
                          *((_QWORD *)v132 + 3) = v282;
                          v49 = v108;
                          v50 = v107;
                          v102 = v106;
                          v118 = v287;
                          v134 = v287 / v115;
                        }
                        v123 = v104 + 1;
                        __p[1] = v133;
                        v150 = v134;
                        v151 = 1.0 - v150;
                        v152 = vcvtms_u32_f32(v151) + v104;
                        v153 = v151 - (float)floorf(v151);
                        if (v151 < 1.0)
                          v99 = v104;
                        else
                          v99 = v152;
                        if (v151 >= 1.0)
                          v151 = v153;
                        v276 = LODWORD(v151);
                      }
                      else
                      {
                        v116 = objc_msgSend(v84, "coordinates3d");
                        v117 = objc_msgSend(v84, "coordinates3d");
                        v118 = GEOCalculateDistanceRadius(*(double *)v116, *(double *)(v116 + 8), *(double *)(v117 + 24), *(double *)(v117 + 32), 6367000.0);
                        *(_OWORD *)v328 = *(_OWORD *)v116;
                        *(_QWORD *)&v328[16] = *(_QWORD *)(v116 + 16);
                        v119 = objc_msgSend(v292, "routeCoordinateForDistanceAfterStart:", v290 + v311 * v285);
                        v120 = v119;
                        v121 = __p[1];
                        if (__p[1] >= (void *)*(_QWORD *)&v309[0])
                        {
                          v124 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                          v125 = v124 + 1;
                          if ((unint64_t)(v124 + 1) >> 59)
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          v126 = *(_QWORD *)&v309[0] - (unint64_t)__p[0];
                          if ((uint64_t)(*(_QWORD *)&v309[0] - (unint64_t)__p[0]) >> 4 > v125)
                            v125 = v126 >> 4;
                          if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFE0)
                            v127 = 0x7FFFFFFFFFFFFFFLL;
                          else
                            v127 = v125;
                          if (v127)
                            v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v127);
                          else
                            v128 = 0;
                          v140 = &v128[32 * v124];
                          *(_OWORD *)v140 = *(_OWORD *)v328;
                          *((_QWORD *)v140 + 2) = *(_QWORD *)&v328[16];
                          *((_QWORD *)v140 + 3) = v120;
                          v141 = (char *)__p[1];
                          v142 = (char *)__p[0];
                          v143 = v140;
                          if (__p[1] != __p[0])
                          {
                            do
                            {
                              v144 = *((_OWORD *)v141 - 1);
                              *((_OWORD *)v143 - 2) = *((_OWORD *)v141 - 2);
                              *((_OWORD *)v143 - 1) = v144;
                              v143 -= 32;
                              v141 -= 32;
                            }
                            while (v141 != v142);
                            v141 = v142;
                          }
                          v122 = v140 + 32;
                          __p[0] = v143;
                          __p[1] = v140 + 32;
                          *(_QWORD *)&v309[0] = &v128[32 * v127];
                          if (v141)
                            operator delete(v141);
                        }
                        else
                        {
                          *(_OWORD *)__p[1] = *(_OWORD *)v328;
                          v121[2] = *(_QWORD *)&v328[16];
                          v121[3] = v119;
                          v122 = v121 + 4;
                        }
                        v99 = 0;
                        v276 = 0;
                        __p[1] = v122;
                        v105 = 0.0;
                        v123 = 1;
                      }
LABEL_140:
                      v98 = 0;
                      v154 = v123;
                      do
                      {
                        if (v154 >= objc_msgSend(v84, "coordinateCount"))
                          break;
                        v155 = objc_msgSend(v84, "coordinates3d");
                        v156 = objc_msgSend(v84, "coordinates3d");
                        v157 = v155 + 24 * v154;
                        v158 = (float64x2_t *)(v157 - 24);
                        v159 = (float64x2_t *)(v156 + 24 * v154);
                        v160 = GEOCalculateDistanceRadius(*(double *)(v157 - 24), *(double *)(v157 - 16), v159->f64[0], v159->f64[1], 6367000.0);
                        v105 = v105 + v160;
                        v161 = v154 == v123 ? v118 : v160;
                        v162 = v161 + v311;
                        v311 = v162;
                        if (v105 > v102)
                        {
                          v167 = (v105 - v102) / v160;
                          v97 = v154 - 1;
                          v168 = v167;
                          v169 = 1.0 - v168;
                          if ((float)(1.0 - v168) >= 1.0)
                          {
                            v97 += vcvtms_u32_f32(v169);
                            v169 = v169 - (float)floorf(v169);
                          }
                          v170 = vmlaq_n_f64(*v159, vsubq_f64(*v158, *v159), v167);
                          v171 = v159[1].f64[0] + (v158[1].f64[0] - v159[1].f64[0]) * v167;
                          v172 = (double *)__p[1];
                          if (__p[1] >= (void *)*(_QWORD *)&v309[0])
                          {
                            v288 = v170;
                            v173 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                            v174 = v173 + 1;
                            if ((unint64_t)(v173 + 1) >> 59)
                              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                            v175 = *(_QWORD *)&v309[0] - (unint64_t)__p[0];
                            if ((uint64_t)(*(_QWORD *)&v309[0] - (unint64_t)__p[0]) >> 4 > v174)
                              v174 = v175 >> 4;
                            if ((unint64_t)v175 >= 0x7FFFFFFFFFFFFFE0)
                              v176 = 0x7FFFFFFFFFFFFFFLL;
                            else
                              v176 = v174;
                            if (v176)
                              v177 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v176);
                            else
                              v177 = 0;
                            v183 = (double *)&v177[32 * v173];
                            *(float64x2_t *)v183 = v288;
                            v183[2] = v171;
                            *((_QWORD *)v183 + 3) = v294;
                            v184 = (char *)__p[1];
                            v185 = (char *)__p[0];
                            v186 = v183;
                            if (__p[1] != __p[0])
                            {
                              do
                              {
                                v187 = *((_OWORD *)v184 - 1);
                                *((_OWORD *)v186 - 2) = *((_OWORD *)v184 - 2);
                                *((_OWORD *)v186 - 1) = v187;
                                v186 -= 4;
                                v184 -= 32;
                              }
                              while (v184 != v185);
                              v184 = v185;
                            }
                            v166 = v183 + 4;
                            __p[0] = v186;
                            __p[1] = v183 + 4;
                            *(_QWORD *)&v309[0] = &v177[32 * v176];
                            if (v184)
                              operator delete(v184);
                          }
                          else
                          {
                            *(float64x2_t *)__p[1] = v170;
                            v172[2] = v171;
                            v166 = v172 + 4;
                            *((_QWORD *)v172 + 3) = v294;
                          }
                          v98 = LODWORD(v169);
                        }
                        else
                        {
                          *(float64x2_t *)v328 = *v159;
                          *(float64_t *)&v328[16] = v159[1].f64[0];
                          v163 = objc_msgSend(v292, "routeCoordinateForDistanceAfterStart:", v290 + v162 * v285);
                          v164 = v163;
                          v165 = __p[1];
                          if (__p[1] >= (void *)*(_QWORD *)&v309[0])
                          {
                            v178 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                            v179 = v178 + 1;
                            if ((unint64_t)(v178 + 1) >> 59)
                              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                            v180 = *(_QWORD *)&v309[0] - (unint64_t)__p[0];
                            if ((uint64_t)(*(_QWORD *)&v309[0] - (unint64_t)__p[0]) >> 4 > v179)
                              v179 = v180 >> 4;
                            if ((unint64_t)v180 >= 0x7FFFFFFFFFFFFFE0)
                              v181 = 0x7FFFFFFFFFFFFFFLL;
                            else
                              v181 = v179;
                            if (v181)
                              v182 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v181);
                            else
                              v182 = 0;
                            v188 = &v182[32 * v178];
                            *(_OWORD *)v188 = *(_OWORD *)v328;
                            *((_QWORD *)v188 + 2) = *(_QWORD *)&v328[16];
                            *((_QWORD *)v188 + 3) = v164;
                            v189 = (char *)__p[1];
                            v190 = (char *)__p[0];
                            v191 = v188;
                            if (__p[1] != __p[0])
                            {
                              do
                              {
                                v192 = *((_OWORD *)v189 - 1);
                                *((_OWORD *)v191 - 2) = *((_OWORD *)v189 - 2);
                                *((_OWORD *)v191 - 1) = v192;
                                v191 -= 32;
                                v189 -= 32;
                              }
                              while (v189 != v190);
                              v189 = v190;
                            }
                            v166 = v188 + 32;
                            __p[0] = v191;
                            __p[1] = v188 + 32;
                            *(_QWORD *)&v309[0] = &v182[32 * v181];
                            if (v189)
                              operator delete(v189);
                          }
                          else
                          {
                            *(_OWORD *)__p[1] = *(_OWORD *)v328;
                            v165[2] = *(_QWORD *)&v328[16];
                            v165[3] = v163;
                            v166 = v165 + 4;
                          }
                        }
                        __p[1] = v166;
                        ++v154;
                      }
                      while (v105 <= v102);
                    }
                    else
                    {
                      -[GEOPathMatcher _addCoordinatesFromRoad:routeCoordinates:offsetFromStartOfPath:errorScale:offsetFromPathToCurrentPoint:outCoordinates:](v296, "_addCoordinatesFromRoad:routeCoordinates:offsetFromStartOfPath:errorScale:offsetFromPathToCurrentPoint:outCoordinates:", v84, v292, &v311, __p, v290, v285);
                      v98 = 0;
                      v99 = 0;
                      v276 = 0;
                    }
                    v193 = __p[0];
                    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x21)
                    {
                      v194 = *((_DWORD *)__p[0] + 6);
                      v195 = *((float *)__p[0] + 7);
                      v196 = *((_DWORD *)__p[1] - 2);
                      v197 = *((float *)__p[1] - 1);
                      if (v194 > v196 || (v194 == v196 ? (v198 = v195 < v197) : (v198 = 1), !v198))
                      {
                        GEOGetGEOPathMatcherLog();
                        v199 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                        {
                          v289 = v99;
                          v200 = v296->_loggingIdentifier;
                          v201 = (unint64_t)v317;
                          v202 = *(_QWORD *)&v316[16];
                          v203 = objc_msgSend(v84, "roadID");
                          v205 = *(_QWORD *)__p[0];
                          v204 = *((_QWORD *)__p[0] + 1);
                          *(_DWORD *)v328 = 138415106;
                          *(_QWORD *)&v328[4] = v200;
                          *(_WORD *)&v328[12] = 1024;
                          *(_DWORD *)&v328[14] = v194;
                          *(_WORD *)&v328[18] = 2048;
                          *(double *)&v328[20] = v195;
                          *(_WORD *)&v328[28] = 1024;
                          *(_DWORD *)&v328[30] = v196;
                          *(_WORD *)&v328[34] = 2048;
                          *(double *)&v328[36] = v197;
                          *(_WORD *)&v328[44] = 1024;
                          *(_DWORD *)&v328[46] = v80;
                          *(_WORD *)&v328[50] = 1024;
                          *(_DWORD *)&v328[52] = ((v201 - v202) >> 5) - 1;
                          *(_WORD *)&v328[56] = 2048;
                          *(_QWORD *)&v328[58] = v203;
                          *(_WORD *)&v328[66] = 2048;
                          *(_QWORD *)v329 = *(_QWORD *)v316;
                          *(_WORD *)&v329[8] = 2048;
                          v330 = *(_QWORD *)&v316[8];
                          v331 = 2048;
                          v332 = v205;
                          v333 = 2048;
                          v334 = v204;
                          _os_log_impl(&dword_1885A9000, v199, OS_LOG_TYPE_DEFAULT, "(%@) Attempting to create a zero length segment. This most likely means that the Routing provided a route that is not close to the road network: [%u, %0.8f] to [%u, %0.8f] | index: %d/%d, roadID: %llu, path fraction: %0.8f, %0.8f | %f, %f", v328, 0x6Au);
                          v99 = v289;
                        }

                      }
                      v206 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", v296->_route, v84, __p, v99 | (v276 << 32), v97 | (unint64_t)(v98 << 32));
                      if (!-[GEOPathMatcher _verifySegmentDistanceFromRoute:segmentIndex:requestedPathRange:](v296, "_verifySegmentDistanceFromRoute:segmentIndex:requestedPathRange:", v206, v80, v282, v294))
                      {
                        if (v296->_shouldDropDivergingSegments)
                        {
                          GEOGetGEOPathMatcherLog();
                          v207 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                          {
                            v208 = v296->_loggingIdentifier;
                            *(_DWORD *)v328 = 138412290;
                            *(_QWORD *)&v328[4] = v208;
                            _os_log_impl(&dword_1885A9000, v207, OS_LOG_TYPE_ERROR, "(%@) Ignoring successful decoding result because matched segments are too far from route.", v328, 0xCu);
                          }

                          v209 = 0;
LABEL_204:

                          v193 = __p[0];
                          if (!__p[0])
                          {
LABEL_198:

                            if (!v209)
                            {
                              v44 = 0;
                              v211 = v271;
                              goto LABEL_219;
                            }
LABEL_199:
                            if (v80++ == v283)
                              goto LABEL_209;
                            continue;
                          }
LABEL_197:
                          __p[1] = v193;
                          operator delete(v193);
                          goto LABEL_198;
                        }
                        v269 = 1;
                      }
                      objc_msgSend(v271, "addObject:", v206);
                      v209 = 1;
                      goto LABEL_204;
                    }
                    break;
                  }
                  v209 = 1;
                  if (!__p[0])
                    goto LABEL_198;
                  goto LABEL_197;
                }
              }
LABEL_261:
              ++v291;
            }
            while (v291 != v279);
            v262 = objc_msgSend(v273, "countByEnumeratingWithState:objects:count:", &v297, v323, 16);
            v279 = v262;
            if (!v262)
            {
LABEL_283:

              -[GEOPathMatcher setInternalInfos:](v296, "setInternalInfos:", v270);
              -[GEOPathMatcher _updateCacheWithNewSegments:range:](v296, "_updateCacheWithNewSegments:range:", v275, v265, v264);
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              -[GEOPathMatcher _callbackWithMatchedSegments:range:handler:callbackQueue:](v296, "_callbackWithMatchedSegments:range:handler:callbackQueue:", v263, v265, v264, v267, v268);

              *(_QWORD *)buf = &off_1E1BF4FD8;
              std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)v326, v326[1]);

              std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v305, v306);
              v15 = v270;
              goto LABEL_284;
            }
          }
        }
        if (v9 < v10)
          goto LABEL_10;
      }
    }
  }
  else
  {
    GEOGetGEOPathMatcherLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "(%@) No route: nothing to match", buf, 0xCu);
    }
LABEL_284:

  }
LABEL_285:

}

- (void)_callbackWithMatchedSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5 callbackQueue:(id)a6
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  end = a4.end;
  start = a4.start;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v12)
  {
    if (!v13)
    {
      v14 = MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
    }
    -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", start, end, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__GEOPathMatcher__callbackWithMatchedSegments_range_handler_callbackQueue___block_invoke;
    v18[3] = &unk_1E1C00290;
    v19 = v16;
    v20 = v12;
    v17 = v16;
    dispatch_async(v14, v18);

  }
}

uint64_t __75__GEOPathMatcher__callbackWithMatchedSegments_range_handler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_updateCacheWithNewSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate start;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  double v19;
  NSString *loggingIdentifier;
  void *v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  GEOComposedRoute *route;
  void *v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  double v40;
  double v41;
  uint64_t v42;
  BOOL v43;
  BOOL v44;
  uint64_t v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSString *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  start = a4.start;
  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
    goto LABEL_12;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_14;
  objc_msgSend(v6, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "startRouteCoordinate");
  objc_msgSend(v6, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "endRouteCoordinate");

  objc_msgSend(v7, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "startRouteCoordinate");
  objc_msgSend(v7, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "endRouteCoordinate");

  if ((_DWORD)v15 != (_DWORD)v11)
  {
    if (v15 >= v11)
      goto LABEL_14;
    goto LABEL_7;
  }
  LODWORD(v8) = HIDWORD(v11);
  LODWORD(v9) = HIDWORD(v15);
  if (*((float *)&v15 + 1) <= *((float *)&v11 + 1))
  {
LABEL_7:
    if ((_DWORD)v13 == (_DWORD)v17)
    {
      LODWORD(v8) = HIDWORD(v17);
      LODWORD(v9) = HIDWORD(v13);
      if (*((float *)&v13 + 1) > *((float *)&v17 + 1))
        goto LABEL_14;
    }
    else if (v13 >= v17)
    {
      goto LABEL_14;
    }
    GEOGetGEOPathMatcherLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      GEOPolylineCoordinateRangeAsString(v15, v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateRangeAsString(v11, v13, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412803;
      v57 = loggingIdentifier;
      v58 = 2113;
      v59 = v21;
      v60 = 2113;
      v61 = v23;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "(%@) Attempting to update cache with a range that has already been cached. Ignoring new segments. Old cache range: %{private}@. New segments range: %{private}@", buf, 0x20u);

    }
LABEL_12:
    v24 = v7;
    goto LABEL_36;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7, v8, v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v25 = objc_msgSend(v48, "endRouteCoordinate");
    v26 = objc_msgSend(v47, "startRouteCoordinate");
    if (vabds_f32((float)v25 + *((float *)&v25 + 1), (float)v26 + *((float *)&v26 + 1)) >= 0.001)
      objc_msgSend(v49, "removeAllObjects");
  }
  if (objc_msgSend(v7, "count"))
  {
    route = self->_route;
    objc_msgSend(v6, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "startRouteCoordinate");
    objc_msgSend(v6, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, objc_msgSend(v30, "endRouteCoordinate"));
    v32 = v31;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v49, "reverseObjectEnumerator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v34)
    {
      v35 = 150.0 - v32;
      v36 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v52 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v38, "road");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "length");
          v41 = v40;

          v42 = objc_msgSend(v38, "endRouteCoordinate");
          v35 = v35 - v41;
          v43 = start.offset < *((float *)&v42 + 1);
          if (start.offset == *((float *)&v42 + 1))
            v43 = 0;
          if (start.index == (_DWORD)v42)
            v44 = v43;
          else
            v44 = start.index < v42;
          if (!v44 && v35 < 0.0)
          {
            v45 = objc_msgSend(v49, "indexOfObject:", v38);

            if (v45 != 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v49, "removeObjectsInRange:", 0, v45 + 1);
            goto LABEL_35;
          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v34)
          continue;
        break;
      }
    }

  }
LABEL_35:
  objc_msgSend(v49, "addObjectsFromArray:", v6);
  v50 = v49;
  geo_isolate_sync();
  v24 = v50;

LABEL_36:
  return v24;
}

void __52__GEOPathMatcher__updateCacheWithNewSegments_range___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

- (id)_matchedSegmentsInRange:(GEOPolylineCoordinateRange)a3 ofMatchedSegments:(id)a4
{
  PolylineCoordinate end;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  float offset;
  uint64_t i;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *loggingIdentifier;
  uint64_t v24;
  uint64_t v25;
  double v26;
  id v27;
  double v28;
  void *v29;
  id v30;
  __int128 v32;
  void *v34;
  id obj;
  void *v36;
  uint64_t start;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  NSString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  end = a3.end;
  start = (uint64_t)a3.start;
  v49 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v5)
  {
    v36 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v39;
    offset = end.offset;
    *(_QWORD *)&v6 = 138412803;
    v32 = v6;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "endRouteCoordinate", v32);
        if ((_DWORD)v12 != (_DWORD)start)
        {
          if (v12 < start)
            continue;
LABEL_10:
          v14 = objc_msgSend(v11, "startRouteCoordinate", v13);
          if (end.index == (_DWORD)v14)
          {
            if (offset <= *((float *)&v14 + 1))
              goto LABEL_34;
          }
          else if (end.index < v14)
          {
            goto LABEL_34;
          }
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v15 = v11;
          v16 = objc_msgSend(v15, "startRouteCoordinate");
          v17 = objc_msgSend(v15, "endRouteCoordinate");
          if (end.index == (_DWORD)v16)
          {
            v18 = v15;
            if (offset <= *((float *)&v16 + 1))
            {
LABEL_22:
              if (v18)
                goto LABEL_23;
LABEL_26:
              GEOGetGEOPathMatcherLog();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                v34 = v7;
                v21 = v5;
                v22 = (uint64_t)end;
                loggingIdentifier = self->_loggingIdentifier;
                v24 = objc_msgSend(v15, "range");
                GEOPolylineCoordinateRangeAsString(v24, v25, v26);
                v27 = (id)objc_claimAutoreleasedReturnValue();
                GEOPolylineCoordinateRangeAsString(start, v22, v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v43 = loggingIdentifier;
                v44 = 2113;
                v45 = v27;
                v46 = 2113;
                v47 = v29;
                _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_FAULT, "(%@) Trimmed segments within range returned nil segment. Segment range: %{private}@. Target range: %{private}@", buf, 0x20u);

                end = (PolylineCoordinate)v22;
                v5 = v21;
                v7 = v34;

              }
              goto LABEL_29;
            }
          }
          else
          {
            v18 = v15;
            if (end.index < v16)
              goto LABEL_22;
          }
          if ((_DWORD)v17 == (_DWORD)start)
          {
            v18 = v15;
            if (*((float *)&v17 + 1) <= *((float *)&start + 1))
              goto LABEL_22;
          }
          else
          {
            v18 = v15;
            if (v17 < start)
              goto LABEL_22;
          }
          objc_msgSend(v15, "trimmedSegmentWithinRange:", start, end);
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
          if (!v19)
            goto LABEL_26;
LABEL_23:
          objc_msgSend(v7, "addObject:", v18);
LABEL_29:
          v30 = v15;

          v36 = v30;
          continue;
        }
        LODWORD(v13) = HIDWORD(v12);
        if (*((float *)&v12 + 1) > *((float *)&start + 1))
          goto LABEL_10;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16, v13);
      if (!v5)
        goto LABEL_34;
    }
  }
  v36 = 0;
  v7 = 0;
LABEL_34:

  return v7;
}

- (BOOL)_isFailedRange:(GEOPolylineCoordinateRange)a3
{
  uint64_t *begin;
  GEOPolylineCoordinateRange *end;
  uint64_t v5;
  uint64_t start;
  BOOL result;

  begin = (uint64_t *)self->_failedRanges.__begin_;
  end = self->_failedRanges.__end_;
  if (begin == (uint64_t *)end)
    return 0;
  v5 = (uint64_t)a3.end;
  start = (uint64_t)a3.start;
  do
  {
    result = GEOPolylineCoordinateRangeEqual(*begin, begin[1], start, v5);
    if (result)
      break;
    begin += 2;
  }
  while (begin != (uint64_t *)end);
  return result;
}

- (BOOL)_isRangeValid:(GEOPolylineCoordinateRange)a3
{
  float offset;
  unsigned int index;
  float v5;
  unsigned int v6;

  offset = a3.start.offset;
  if (a3.start.offset < 0.0)
    return 0;
  index = a3.end.index;
  v5 = a3.end.offset;
  if (a3.end.offset < 0.0)
    return 0;
  v6 = a3.start.index;
  if (a3.start.index == a3.end.index)
  {
    if (a3.start.offset > a3.end.offset)
      return 0;
  }
  else if (a3.start.index >= a3.end.index)
  {
    return 0;
  }
  if (-[GEOComposedRoute pointCount](self->_route, "pointCount") - 1 > a3.start.index)
    return vabds_f32((float)v6 + offset, (float)index + v5) >= 0.001;
  return 0;
}

- (void)_decodePathForRoute:(void *)a3 supportPoints:(void *)a4 roadNetwork:(uint64_t)a5 internalInfo:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t Integer;
  char v21;
  uint64_t *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int32x2_t v37;
  double v38;
  char v39;
  uint64_t v40;
  BOOL v41;
  int v42;
  uint64_t *v43;
  int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  uint64_t v48;
  int v49;
  double v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t *v65;
  double v66;
  uint64_t *v67;
  double *v68;
  __n128 v69;
  double *v70;
  _QWORD *v71;
  _QWORD *v72;
  __n128 *v73;
  BOOL v74;
  char v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  double v79;
  double v80;
  double v81;
  char *v82;
  unsigned int *v83;
  double v85;
  double v86;
  double v87;
  double v88;
  char *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  char *v95;
  int v96;
  unint64_t v97;
  unsigned int v98;
  unsigned int v99;
  int v100;
  unint64_t v101;
  unsigned int v102;
  double v103;
  double v104;
  double v105;
  __int16 v106;
  int v107;
  int v108;
  int v109;
  unsigned int v110;
  uint64_t v111;
  int v112;
  double v113;
  _BOOL4 v114;
  int32x2_t v115;
  int8x8_t v116;
  int32x2_t v117;
  int32x2_t v118;
  __n128 v119;
  __n128 v120;
  _BOOL4 v121;
  int v122;
  char v123;
  double v124;
  double v125;
  unsigned int v126;
  double name_diff_score;
  int v128;
  unsigned int v129;
  double v130;
  long double v131;
  double v132;
  double *v133;
  void *v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  unint64_t v146;
  uint64_t v147;
  double *v148;
  uint64_t *v149;
  _QWORD *v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  double *v155;
  _QWORD *v156;
  uint64_t v157;
  double *v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  void *v162;
  char *v163;
  int64_t v164;
  double v165;
  unint64_t v166;
  __int16 v167;
  char v168;
  int v169;
  int v170;
  unsigned int v171;
  double *v172;
  _QWORD *v173;
  _QWORD *v174;
  uint64_t *v175;
  double v176;
  uint64_t *v177;
  _QWORD *v178;
  _QWORD *v179;
  _QWORD *v180;
  double v181;
  _QWORD *v182;
  uint64_t v183;
  unint64_t v184;
  unint64_t v185;
  char *v186;
  uint64_t v187;
  char *v188;
  __n128 v189;
  char *v190;
  char *v191;
  char *v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  id v196;
  char *v197;
  uint64_t v198;
  char *v199;
  void *v200;
  _QWORD *v201;
  void *v202;
  char *v203;
  char *v204;
  _QWORD *v205;
  __n128 *v206;
  __n128 v207;
  uint64_t *v208;
  uint64_t v209;
  __n128 *v210;
  double v211;
  _BOOL4 v212;
  char *v213;
  _OWORD *v214;
  _OWORD *v215;
  __int128 v216;
  _BYTE *v217;
  char *v218;
  uint64_t v219;
  char *v220;
  char *v221;
  char *v222;
  __int128 *v223;
  double v224;
  double v225;
  __int128 v226;
  unint64_t v227;
  unint64_t v228;
  char *v229;
  uint64_t v230;
  char *v231;
  __int128 v232;
  char *v233;
  char *v234;
  __int128 v235;
  __int128 v236;
  uint64_t *v237;
  int v238;
  char v239;
  _QWORD *v240;
  _QWORD *v241;
  _QWORD *v242;
  _QWORD *v243;
  void *v244;
  unint64_t v245;
  id v246;
  _QWORD *v247;
  void **v249;
  void **v250;
  uint64_t v251;
  char v252;
  __int128 v253;
  uint64_t v254;
  id v255;
  uint64_t v256;
  __n128 *v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  void (**v261)(GEOPathCodecLogger *__hidden);
  uint64_t v262;
  double v263;
  uint64_t v264;
  __int128 __y;
  __int128 v266;
  double v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  __int128 v272;
  uint64_t v273;
  __int16 v274;
  int v275;
  __int16 v276;
  _BYTE v277[32];
  __int128 v278;
  __int128 v279;
  char *v280;
  char *v281;
  char *v282;
  void *v283;
  char v284;
  void *v285;
  __n128 *v286;
  uint64_t v287;
  __n128 v288;
  __n128 v289;
  char v290;
  void *v291;
  void *v292;
  void *__dst;
  void *__src;
  unint64_t v295;
  void *v296;
  char v297;
  __int128 v298;
  __n128 v299;
  __n128 v300;
  unsigned __int8 v301;
  void *v302;
  char v303;
  void *v304;
  int v305;
  unint64_t v306;
  void **v307;
  void *v308;
  char *v309;
  unsigned __int8 v310;
  void *__p;
  char v312;
  void *v313;
  char v314;
  _BYTE v315[168];

  v10 = a3;
  v246 = a4;
  v247 = a6;
  if (!a2)
  {
    *(_QWORD *)(a1 + 128) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    goto LABEL_278;
  }
  objc_msgSend(v10, "coordinates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "routingPathDataWithinSupportPoints:supportPointsOnly:", v246, 0);
  }
  else
  {
    v278 = 0u;
    v279 = 0u;
    memset(v277, 0, sizeof(v277));
  }

  v255 = v10;
  if (v247)
  {
    objc_msgSend(v246, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "routeCoordinate");
    objc_msgSend(v246, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "routeCoordinate");
    v247[3] = v14;
    v247[4] = v16;

    +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v277);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v247[1];
    v247[1] = v18;

  }
  v276 = 0;
  v275 = 0;
  v262 = a5;
  v263 = 25.0;
  v264 = 5000;
  __y = xmmword_189CC0500;
  v266 = xmmword_189CC0510;
  v267 = 0.0;
  v268 = 20000000;
  v269 = 0x3FF199999999999ALL;
  v270 = 0x3E800002710;
  v271 = 0xA00002710;
  v272 = xmmword_189CC0520;
  v273 = 0x3FE6147AE147AE14;
  v274 = 0;
  v261 = &off_1E1BF4F68;
  Integer = GEOConfigGetInteger(GeoServicesConfig_PathCodecLogLevel, (uint64_t)off_1EDF4D648);
  v21 = Integer;
  if ((Integer & 0x8000000000000000) == 0)
  {
    std::mutex::lock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
    maps::path_codec::Logger::m_logger = (uint64_t)&v261;
    maps::path_codec::Logger::m_log_level = v21;
    std::mutex::unlock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  }
  std::chrono::steady_clock::now();
  if (*((_QWORD *)&v278 + 1))
    v22 = (uint64_t *)(*((_QWORD *)&v278 + 1) + 8);
  else
    v22 = 0;
  v23 = v278;
  if (!(_DWORD)v278)
  {
    v280 = 0;
    v281 = 0;
    v282 = 0;
    v33 = a1;
    goto LABEL_268;
  }
  v24 = 0;
  v260 = v262;
  v25 = 8 * (int)v278;
  do
  {
    v26 = v24;
    v27 = *v22++;
    v28 = *(_DWORD *)(v27 + 84);
    if (v28 == 1)
      ++v24;
    v25 -= 8;
  }
  while (v25);
  v280 = 0;
  v281 = 0;
  v282 = 0;
  v307 = (void **)&v280;
  LOBYTE(v308) = 0;
  if (v24)
  {
    if (v24 >= 0x38E38E38E38E38FLL)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v29 = (char *)operator new(72 * v24);
    v30 = 0;
    v31 = &v29[72 * v24];
    v280 = v29;
    v282 = v31;
    do
    {
      v32 = &v29[v30];
      *(_OWORD *)(v32 + 8) = 0uLL;
      *(_OWORD *)(v32 + 24) = 0uLL;
      *(_OWORD *)(v32 + 40) = 0uLL;
      *(_QWORD *)v32 = -1;
      *((_DWORD *)v32 + 2) = 0x7FFFFFFF;
      *((_QWORD *)v32 + 2) = 0;
      *((_QWORD *)v32 + 3) = 0;
      *((_QWORD *)v32 + 4) = 0;
      *((_DWORD *)v32 + 10) = 0x7FFFFFFF;
      v30 += 72;
      *((_QWORD *)v32 + 7) = 0;
      *((_QWORD *)v32 + 8) = 0;
    }
    while (72 * v26 + 72 * (v28 == 1) != v30);
    v281 = &v29[72 * v24];
  }
  else
  {
    v29 = 0;
    v31 = 0;
  }
  if (v23 < 1)
    goto LABEL_267;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v245 = v24 - 1;
  v249 = *(void ***)(MEMORY[0x1E0DE4F60] + 24);
  v250 = (void **)*MEMORY[0x1E0DE4F60];
  v244 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
  v37 = vdup_n_s32(0x168u);
  v38 = 1.0;
  v39 = 1;
  while (1)
  {
    v40 = *(_QWORD *)(*((_QWORD *)&v278 + 1) + 8 * v34 + 8);
    if (*(_DWORD *)(v40 + 84) == 1)
      break;
LABEL_263:
    if (++v34 >= v23)
      goto LABEL_266;
  }
  if ((v39 & 1) != 0 || (*(_QWORD *)(v40 + 48) != v35 ? (v41 = v36 == v245) : (v41 = 1), v41))
    v42 = 1;
  else
    v42 = (*(unsigned __int8 *)(v40 + 16) >> 2) & 1;
  __src = 0;
  v295 = 0;
  __dst = 0;
  LODWORD(v296) = 0x7FFFFFFF;
  v297 = 0;
  v298 = 0uLL;
  v43 = *(uint64_t **)(v40 + 32);
  if (!v43)
    v43 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
  v291 = (void *)maps::path_codec::Coordinate::from_lat_lon((maps::path_codec::Coordinate *)v29, (double)*((int *)v43 + 6) / 10000000.0, (double)*((int *)v43 + 7) / 10000000.0);
  LODWORD(v292) = v44;
  v45 = *(_DWORD *)(v40 + 16);
  if ((v45 & 0x10) != 0)
    LODWORD(v292) = *(_DWORD *)(v40 + 56);
  if ((v45 & 0x100) != 0)
  {
    v46 = *(_DWORD *)(v40 + 72);
    if (v46 >= 0x7FFFFFFF)
      v46 = 0x7FFFFFFF;
    LODWORD(v296) = v46;
  }
  BYTE4(v296) = *(_BYTE *)(v40 + 76);
  if ((v45 & 0x400) != 0)
  {
    v47 = *(_DWORD *)(v40 + 80);
    if (v47 >= 4)
      LOBYTE(v47) = 0;
  }
  else
  {
    LOBYTE(v47) = 0;
  }
  BYTE5(v296) = v47;
  if ((v45 & 4) != 0)
  {
    v48 = *(_QWORD *)(v40 + 40);
    v297 = 1;
    v298 = *(_OWORD *)(v48 + 24);
  }
  v254 = v34;
  v252 = v39;
  v259 = v40;
  if ((v36 || !(_BYTE)v274)
    && ((**(void (***)(__n128 *__return_ptr, uint64_t, _QWORD))v260)(&v288, v260, *(_QWORD *)(v40 + 48)), v290))
  {
    (*(void (**)(void ***__return_ptr, uint64_t, __n128 *, _QWORD))(*(_QWORD *)v260 + 32))(&v307, v260, &v288, 0);
    v49 = v310;
    if (v312 < 0)
      operator delete(__p);
    if (v308)
    {
      v309 = (char *)v308;
      operator delete(v308);
    }
    if (v49)
    {
      v50 = 0.5;
      if (v42)
      {
        (*(void (**)(__n128 *__return_ptr, uint64_t, __n128 *, uint64_t))(*(_QWORD *)v260 + 32))(&v299, v260, &v288, 1);
        maps::path_codec::snap_point(&v299.n128_i64[1], &v291, (uint64_t)&v304, v51, v52, v53);
        v54 = v299.n128_i64[1];
        v55 = 0.0;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v300.n128_u64[0] - v299.n128_u64[1]) >> 2) >= 2
          && v299.n128_u64[1] + 12 != v300.n128_u64[0])
        {
          v56 = 0.0;
          v57 = 1.79769313e308;
          v58 = 0.0;
          do
          {
            maps::path_codec::great_circle_distance_in_m(v54, (unsigned int *)(v54 + 12), v55);
            v60 = v59;
            maps::path_codec::great_circle_distance_in_m(v54, (unsigned int *)&v304, v59);
            v62 = v61;
            maps::path_codec::great_circle_distance_in_m((uint64_t)&v304, (unsigned int *)(v54 + 12), v61);
            v55 = fmax(v62 + v63 - v60, 0.0);
            if (v55 < v57)
            {
              v57 = v55;
              v58 = v56 + v62;
            }
            v56 = v56 + v60;
            v64 = v54 + 24;
            v54 += 12;
          }
          while (v64 != v300.n128_u64[0]);
          v55 = 0.0;
          if (v56 != 0.0)
          {
            v55 = v58 / v56;
            v38 = 1.0;
            if (v58 / v56 > 1.0)
              v55 = 1.0;
          }
        }
        v50 = fmax(v55, 0.0);
        if (maps::path_codec::Logger::m_log_level <= 1u)
        {
          std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
          v65 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Support point start/end of path (", 33);
          v67 = maps::path_codec::operator<<(v65, (uint64_t)&v291, v66);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v67, (uint64_t)") fraction: ", 12);
          std::ostream::operator<<();
          std::string::basic_string[abi:ne180100]<0>(&v285, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
          std::stringbuf::str();
          maps::path_codec::Logger::log_debug((uint64_t)&v285, 236, (uint64_t)&v283);
          if (v284 < 0)
            operator delete(v283);
          if (SHIBYTE(v287) < 0)
            operator delete(v285);
          v307 = v250;
          *(void ***)((char *)&v307 + (_QWORD)*(v250 - 3)) = v249;
          v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
          if (v314 < 0)
            operator delete(v313);
          std::streambuf::~streambuf();
          std::ostream::~ostream();
          MEMORY[0x18D764310](v315);
        }
        if (v303 < 0)
          operator delete(v302);
        if (v299.n128_u64[1])
        {
          v300.n128_u64[0] = v299.n128_u64[1];
          operator delete((void *)v299.n128_u64[1]);
        }
      }
      v68 = (double *)__src;
      if ((unint64_t)__src >= v295)
      {
        v183 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)__src - (_BYTE *)__dst) >> 3);
        v184 = v183 + 1;
        if ((unint64_t)(v183 + 1) > 0x492492492492492)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (_QWORD)__dst) >> 3) > v184)
          v184 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (_QWORD)__dst) >> 3);
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v295 - (_QWORD)__dst) >> 3)) >= 0x249249249249249)
          v185 = 0x492492492492492;
        else
          v185 = v184;
        v186 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v295, v185);
        v188 = &v186[56 * v183];
        v189 = v289;
        *(__n128 *)v188 = v288;
        *((__n128 *)v188 + 1) = v189;
        *((double *)v188 + 4) = v50;
        *((_QWORD *)v188 + 5) = 0;
        *((_DWORD *)v188 + 12) = 0;
        v190 = (char *)__src;
        v191 = (char *)__dst;
        v192 = v188;
        if (__src != __dst)
        {
          do
          {
            v193 = *(_OWORD *)(v190 - 56);
            v194 = *(_OWORD *)(v190 - 40);
            v195 = *(_OWORD *)(v190 - 24);
            *((_DWORD *)v192 - 2) = *((_DWORD *)v190 - 2);
            *(_OWORD *)(v192 - 24) = v195;
            *(_OWORD *)(v192 - 40) = v194;
            *(_OWORD *)(v192 - 56) = v193;
            v192 -= 56;
            v190 -= 56;
          }
          while (v190 != v191);
          v190 = (char *)__dst;
        }
        v70 = (double *)(v188 + 56);
        __dst = v192;
        __src = v188 + 56;
        v295 = (unint64_t)&v186[56 * v187];
        if (v190)
          operator delete(v190);
      }
      else
      {
        v69 = v289;
        *(__n128 *)__src = v288;
        *((__n128 *)v68 + 1) = v69;
        v68[4] = v50;
        v68[5] = 0.0;
        *((_DWORD *)v68 + 12) = 0;
        v70 = v68 + 7;
      }
      v251 = (uint64_t)v291;
      v169 = (int)v292;
      v258 = __dst;
      v166 = v295;
      __dst = 0;
      __src = 0;
      v295 = 0;
      v170 = (int)v296;
      v167 = WORD2(v296);
      v168 = v297;
      v253 = v298;
    }
    else
    {
      v253 = 0u;
      if (maps::path_codec::Logger::m_log_level <= 1u)
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Road ID ", 8);
        v182 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v182, (uint64_t)" is no longer navigable.", 24);
        std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
        std::stringbuf::str();
        maps::path_codec::Logger::log_debug((uint64_t)&v299, 220, (uint64_t)&v304);
        if (SHIBYTE(v306) < 0)
          operator delete(v304);
        if (v300.n128_i8[7] < 0)
          operator delete((void *)v299.n128_u64[0]);
        v307 = v250;
        *(void ***)((char *)&v307 + (_QWORD)*(v250 - 3)) = v249;
        v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
        if (v314 < 0)
          operator delete(v313);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18D764310](v315);
      }
      v258 = 0;
      v70 = 0;
      v166 = 0;
      v167 = 0;
      v168 = 0;
      v251 = -1;
      v169 = 0x7FFFFFFF;
      v170 = 0x7FFFFFFF;
    }
  }
  else
  {
    if (maps::path_codec::Logger::m_log_level <= 1u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Road ID ", 8);
      v71 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)" not found or origin segment, fallback to map-matching.", 55);
      std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
      std::stringbuf::str();
      maps::path_codec::Logger::log_debug((uint64_t)&v299, 246, (uint64_t)&v288);
      if (v289.n128_i8[7] < 0)
        operator delete((void *)v288.n128_u64[0]);
      if (v300.n128_i8[7] < 0)
        operator delete((void *)v299.n128_u64[0]);
      v307 = v250;
      *(void ***)((char *)&v307 + (_QWORD)*(v250 - 3)) = v249;
      v308 = v244;
      if (v314 < 0)
        operator delete(v313);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18D764310](v315);
    }
    v285 = 0;
    v286 = 0;
    v287 = 0;
    (*(void (**)(uint64_t, void **, _QWORD, void **))(*(_QWORD *)v260 + 24))(v260, &v291, v264, &v285);
    if (maps::path_codec::Logger::m_log_level <= 1u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Found ", 6);
      v72 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v72, (uint64_t)" nearest candidates", 19);
      std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
      std::stringbuf::str();
      maps::path_codec::Logger::log_debug((uint64_t)&v299, 249, (uint64_t)&v288);
      if (v289.n128_i8[7] < 0)
        operator delete((void *)v288.n128_u64[0]);
      if (v300.n128_i8[7] < 0)
        operator delete((void *)v299.n128_u64[0]);
      v307 = v250;
      *(void ***)((char *)&v307 + (_QWORD)*(v250 - 3)) = v249;
      v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
      if (v314 < 0)
        operator delete(v313);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18D764310](v315);
    }
    v73 = (__n128 *)v285;
    v253 = 0u;
    v257 = v286;
    if (v285 == v286)
      goto LABEL_217;
    v256 = v36;
    do
    {
      if (v36)
        v74 = 1;
      else
        v74 = *(_QWORD *)(v40 + 48) == 0;
      v75 = !v74;
      (*(void (**)(void ***__return_ptr, uint64_t, __n128 *, uint64_t))(*(_QWORD *)v260 + 32))(&v307, v260, v73, 1);
      maps::path_codec::snap_point((uint64_t *)&v308, &v291, (uint64_t)&v304, v76, v77, v78);
      v82 = v309;
      v83 = (unsigned int *)v308;
      if (0xAAAAAAAAAAAAAAABLL * ((v309 - (_BYTE *)v308) >> 2) < 2 || (char *)v308 + 12 == v309)
      {
        v85 = 0.0;
      }
      else
      {
        v86 = 0.0;
        v87 = 1.79769313e308;
        v88 = 0.0;
        do
        {
          v89 = (char *)(v83 + 3);
          maps::path_codec::great_circle_distance_in_m((uint64_t)v83, v83 + 3, v79);
          v91 = v90;
          maps::path_codec::great_circle_distance_in_m((uint64_t)v83, (unsigned int *)&v304, v90);
          v93 = v92;
          maps::path_codec::great_circle_distance_in_m((uint64_t)&v304, v83 + 3, v92);
          v79 = fmax(v93 + v94 - v91, 0.0);
          if (v79 < v87)
          {
            v87 = v79;
            v88 = v86 + v93;
          }
          v86 = v86 + v91;
          v95 = (char *)(v83 + 6);
          v83 += 3;
        }
        while (v95 != v309);
        v82 = v89 + 12;
        v79 = v88 / v86;
        v80 = 1.0;
        v38 = 1.0;
        if (v88 / v86 > 1.0)
          v79 = 1.0;
        if (v86 == 0.0)
          v85 = 0.0;
        else
          v85 = v79;
      }
      v96 = v305;
      v97 = v306;
      v98 = *(__int16 *)(v40 + 60)
          - 360 * (((11651 * *(__int16 *)(v40 + 60)) >> 22) + ((11651 * *(__int16 *)(v40 + 60)) >> 31));
      v99 = *(_DWORD *)(v40 + 64);
      v100 = *(_DWORD *)(v40 + 68);
      v101 = -2 - 0x5555555555555555 * ((v82 - (_BYTE *)v308) >> 2);
      if (v101 >= v306)
        v101 = v306;
      v102 = maps::path_codec::compute_bearing((_DWORD *)v308 + 3 * v101, (_DWORD *)v308 + 3 * v101 + 3, v79, v80, v81);
      v106 = v102 - v98;
      v107 = (__int16)(v102 - v98);
      v108 = v102 - v98 - 360;
      if (v107 > 180)
        v106 = v102 - v98 - 360;
      if (v106 < -179)
        v106 += 360;
      if (v106 >= 0)
        LOWORD(v109) = v106;
      else
        v109 = -v106;
      v110 = v102;
      if ((unsigned __int16)v109 >= 0x5Au)
        v110 = (unsigned __int16)(v102 + 180) % 0x168u;
      if (v97)
      {
        v111 = v97 - 1;
        if (-2 - 0x5555555555555555 * ((v309 - (_BYTE *)v308) >> 2) < v97 - 1)
          v111 = -2 - 0x5555555555555555 * ((v309 - (_BYTE *)v308) >> 2);
        v102 = maps::path_codec::compute_bearing((_DWORD *)v308 + 3 * v111, (_DWORD *)v308 + 3 * v111 + 3, v103, v104, v105);
        v107 = v102 - v98;
        v108 = v102 - v98 - 360;
      }
      v10 = v255;
      if ((__int16)v107 <= 180)
        LOWORD(v112) = v107;
      else
        LOWORD(v112) = v108;
      if ((__int16)v112 < -179)
        LOWORD(v112) = v112 + 360;
      if ((v112 & 0x8000u) != 0)
        v112 = -(__int16)v112;
      if ((unsigned __int16)v112 >= 0x5Au)
      {
        v102 = (unsigned __int16)(v102 + 180) % 0x168u;
        v107 = v102 - v98;
        v108 = v102 - v98 - 360;
      }
      v113 = fmax(v85, 0.0);
      v114 = (unsigned __int16)v112 > 0x59u;
      v115.i32[0] = v107;
      v115.i32[1] = v110 - v98;
      v116.i32[0] = v108;
      v116.i32[1] = v110 - v98 - 360;
      v117 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_s32(vshr_n_s32(vshl_n_s32(v115, 0x10uLL), 0x10uLL), (int32x2_t)0xB4000000B4), v116, (int8x8_t)v115);
      v118 = vabs_s32(vshr_n_s32(vshl_n_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xB2000000B2, vshr_n_s32(vshl_n_s32(v117, 0x10uLL), 0x10uLL)), (int8x8_t)vadd_s32(v117, v37), (int8x8_t)v117), 0x10uLL), 0x10uLL));
      if ((vcgt_u32((uint32x2_t)vand_s8((int8x8_t)vdup_lane_s32(v118, 1), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)vand_s8((int8x8_t)v118, (int8x8_t)0xFFFF0000FFFFLL)).u8[0] & 1) != 0)LOWORD(v110) = v102;
      v119 = *v73;
      v120 = v73[1];
      if ((unsigned __int16)v110 == (unsigned __int16)v102)
        v121 = v114;
      else
        v121 = (unsigned __int16)v109 > 0x59u;
      v288 = *v73;
      v289 = v120;
      if (v121)
      {
        (*(void (**)(__n128 *__return_ptr, uint64_t, __n128 *, __n128))(*(_QWORD *)v260 + 8))(&v299, v260, v73, v119);
        v113 = v38 - v113;
        v288 = v299;
        v289 = v300;
      }
      (*(void (**)(__n128 *__return_ptr, uint64_t, __n128 *, _QWORD))(*(_QWORD *)v260 + 32))(&v299, v260, &v288, 0);
      v122 = v301;
      if (v303 < 0)
        operator delete(v302);
      if (v299.n128_u64[1])
      {
        v300.n128_u64[0] = v299.n128_u64[1];
        operator delete((void *)v299.n128_u64[1]);
      }
      if (v122)
      {
        if (v99 | v100)
          v123 = v75;
        else
          v123 = 1;
        v124 = 0.0;
        v125 = 0.0;
        if ((v123 & 1) == 0)
        {
          v126 = v99 - (unsigned __int16)v307;
          if (v99 <= (unsigned __int16)v307)
            v126 = (unsigned __int16)v307 - v99;
          if (v100 == WORD1(v307))
            v125 = 0.0;
          else
            v125 = v38;
          v124 = (double)v126;
        }
        v40 = v259;
        name_diff_score = maps::path_codec::get_name_diff_score((char *)(*(_QWORD *)(v259 + 24) & 0xFFFFFFFFFFFFFFFELL), (char *)&__p);
        LOWORD(v128) = v110 - v98;
        if ((__int16)(v110 - v98) > 180)
          LOWORD(v128) = v110 - v98 - 360;
        if ((__int16)v128 < -179)
          LOWORD(v128) = v128 + 360;
        if ((v128 & 0x8000u) != 0)
          v128 = -(__int16)v128;
        v129 = (unsigned __int16)v128;
        v130 = pow((double)v96 / 100.0, *(long double *)&__y);
        v131 = pow((double)v129, *((long double *)&__y + 1));
        v132 = v130 + v131 + v124 * *(double *)&v266 + v125 * *((double *)&v266 + 1) + name_diff_score * v267;
      }
      else
      {
        v132 = 1.79769313e308;
        v40 = v259;
      }
      v299 = v288;
      v300 = v289;
      v36 = v256;
      if (v312 < 0)
        operator delete(__p);
      if (v308)
      {
        v309 = (char *)v308;
        operator delete(v308);
      }
      v133 = (double *)__src;
      if ((unint64_t)__src >= v295)
      {
        v135 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)__src - (_BYTE *)__dst) >> 3);
        v136 = v135 + 1;
        if ((unint64_t)(v135 + 1) > 0x492492492492492)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (_QWORD)__dst) >> 3) > v136)
          v136 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (_QWORD)__dst) >> 3);
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v295 - (_QWORD)__dst) >> 3)) >= 0x249249249249249)
          v137 = 0x492492492492492;
        else
          v137 = v136;
        if (v137)
          v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v295, v137);
        else
          v138 = 0;
        v139 = &v138[56 * v135];
        *((__n128 *)v139 + 1) = v300;
        *(__n128 *)v139 = v299;
        *((double *)v139 + 4) = v113;
        *((double *)v139 + 5) = v132;
        *((_DWORD *)v139 + 12) = v96;
        v140 = (char *)__src;
        v141 = (char *)__dst;
        v142 = v139;
        if (__src != __dst)
        {
          do
          {
            v143 = *(_OWORD *)(v140 - 56);
            v144 = *(_OWORD *)(v140 - 40);
            v145 = *(_OWORD *)(v140 - 24);
            *((_DWORD *)v142 - 2) = *((_DWORD *)v140 - 2);
            *(_OWORD *)(v142 - 24) = v145;
            *(_OWORD *)(v142 - 40) = v144;
            *(_OWORD *)(v142 - 56) = v143;
            v142 -= 56;
            v140 -= 56;
          }
          while (v140 != v141);
          v140 = (char *)__dst;
        }
        v134 = v139 + 56;
        __dst = v142;
        __src = v139 + 56;
        v295 = (unint64_t)&v138[56 * v137];
        if (v140)
          operator delete(v140);
      }
      else
      {
        *(__n128 *)__src = v299;
        *((__n128 *)v133 + 1) = v300;
        v133[4] = v113;
        v133[5] = v132;
        *((_DWORD *)v133 + 12) = v96;
        v134 = v133 + 7;
      }
      __src = v134;
      v73 += 2;
    }
    while (v73 != v257);
    v146 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)v134 - (_BYTE *)__dst) >> 3));
    v147 = v134 == __dst ? 0 : v146;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey> *,false>((uint64_t)__dst, (unint64_t)v134, v147, 1);
    v148 = (double *)__dst;
    v70 = (double *)__src;
    if (__dst == __src)
    {
      v70 = (double *)__dst;
    }
    else
    {
      v149 = (uint64_t *)__dst;
      while (1)
      {
        v150 = v149 + 7;
        if (v149 + 7 == __src)
          break;
        v152 = *v149;
        v153 = v149[1];
        v151 = v149 + 8;
        if (v152)
          v151 = v150;
        else
          v152 = v153;
        v154 = *v151;
        v149 = v150;
        if (v152 == v154)
        {
          v155 = (double *)(v150 + 7);
          v156 = v150 - 7;
          while (v155 != v70)
          {
            v157 = *v156;
            if (*v156)
            {
              v158 = v155;
            }
            else
            {
              v157 = v156[1];
              v158 = v155 + 1;
            }
            if (v157 != *(_QWORD *)v158)
            {
              v159 = *(_OWORD *)v155;
              v160 = *((_OWORD *)v155 + 1);
              v161 = *((_OWORD *)v155 + 2);
              *((_DWORD *)v156 + 26) = *((_DWORD *)v155 + 12);
              *(_OWORD *)(v156 + 11) = v161;
              *(_OWORD *)(v156 + 9) = v160;
              *(_OWORD *)(v156 + 7) = v159;
              v156 += 7;
            }
            v155 += 7;
          }
          v162 = v156 + 7;
          v163 = (char *)((char *)v70 - (char *)(v156 + 7));
          if (v163)
          {
            v164 = (char *)v70 - &v163[(_QWORD)v162];
            if (v70 != (double *)&v163[(_QWORD)v162])
            {
              memmove(v162, &v163[(_QWORD)v162], v164 - 4);
              v148 = (double *)__dst;
            }
            v70 = (double *)((char *)v162 + v164);
            __src = (char *)v162 + v164;
          }
          break;
        }
      }
    }
    v165 = v148[5];
    if (v165 == 1.79769313e308)
    {
LABEL_217:
      v258 = 0;
      v70 = 0;
      v166 = 0;
      v167 = 0;
      v168 = 0;
      v251 = -1;
      v169 = 0x7FFFFFFF;
      v170 = 0x7FFFFFFF;
    }
    else
    {
      if (v148 != v70)
      {
        if (v165 > v165 + v263)
        {
LABEL_232:
          v70 = v148;
        }
        else
        {
          v171 = maps::path_codec::Logger::m_log_level;
          v172 = v148 + 7;
          while (1)
          {
            if (v171 <= 1)
            {
              std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Candidate segment for geoid ", 28);
              v173 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v173, (uint64_t)"(index=", 7);
              v174 = (_QWORD *)std::ostream::operator<<();
              v175 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v174, (uint64_t)") (", 3);
              v177 = maps::path_codec::operator<<(v175, (uint64_t)&v291, v176);
              v178 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v177, (uint64_t)"): ", 3);
              v179 = operator<<(v178, (_QWORD *)v172 - 7);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v179, (uint64_t)", fraction: ", 12);
              v180 = (_QWORD *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v180, (uint64_t)", score: ", 9);
              std::ostream::operator<<();
              std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
              std::stringbuf::str();
              maps::path_codec::Logger::log_debug((uint64_t)&v299, 289, (uint64_t)&v288);
              if (v289.n128_i8[7] < 0)
                operator delete((void *)v288.n128_u64[0]);
              if (v300.n128_i8[7] < 0)
                operator delete((void *)v299.n128_u64[0]);
              v307 = v250;
              *(void ***)((char *)&v307 + (_QWORD)*(v250 - 3)) = v249;
              v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
              if (v314 < 0)
                operator delete(v313);
              std::streambuf::~streambuf();
              std::ostream::~ostream();
              MEMORY[0x18D764310](v315);
              v171 = maps::path_codec::Logger::m_log_level;
              v70 = (double *)__src;
            }
            if (v172 == v70)
              break;
            v181 = v172[5];
            v172 += 7;
            if (v181 > v165 + v263)
            {
              v148 = v172 - 7;
              goto LABEL_232;
            }
          }
        }
      }
      v251 = (uint64_t)v291;
      v169 = (int)v292;
      v258 = __dst;
      v166 = v295;
      __dst = 0;
      __src = 0;
      v295 = 0;
      v170 = (int)v296;
      v167 = WORD2(v296);
      v168 = v297;
      v253 = v298;
    }
    if (v285)
    {
      v286 = (__n128 *)v285;
      operator delete(v285);
    }
  }
  v196 = v10;
  if (__dst)
  {
    __src = __dst;
    operator delete(__dst);
  }
  v197 = v280;
  v198 = v36;
  v199 = &v280[72 * v36];
  *(_QWORD *)v199 = v251;
  *((_DWORD *)v199 + 2) = v169;
  v202 = (void *)*((_QWORD *)v199 + 2);
  v201 = v199 + 16;
  v200 = v202;
  if (v202)
  {
    *(_QWORD *)&v197[72 * v198 + 24] = v200;
    operator delete(v200);
    *v201 = 0;
    v201[1] = 0;
    v201[2] = 0;
  }
  *v201 = v258;
  v203 = &v197[72 * v198];
  *((_QWORD *)v203 + 3) = v70;
  *((_QWORD *)v203 + 4) = v166;
  *((_DWORD *)v203 + 10) = v170;
  *((_WORD *)v203 + 22) = v167;
  v203[48] = v168;
  *(_OWORD *)(v203 + 56) = v253;
  v29 = v280;
  if (*(_QWORD *)&v280[72 * v198 + 16] != *(_QWORD *)&v280[72 * v198 + 24])
  {
    v36 = v198 + 1;
    v35 = *(_QWORD *)(v259 + 48);
    v39 = v252 & (v35 == 0);
    v23 = v278;
    v34 = v254;
    v10 = v196;
    goto LABEL_263;
  }
  v10 = v196;
LABEL_266:
  v31 = v281;
LABEL_267:
  v33 = a1;
  if (0x8E38E38E38E38E39 * ((v31 - v29) >> 3) < 2)
  {
LABEL_268:
    if (maps::path_codec::Logger::m_log_level <= 4u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Got less than 2 support points or not all necessary support points could be snapped.", 84);
      std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
      std::stringbuf::str();
      maps::path_codec::Logger::log_error((uint64_t)&v291, 48, (uint64_t)&v299);
      if (v300.n128_i8[7] < 0)
        operator delete((void *)v299.n128_u64[0]);
      if (SHIBYTE(__dst) < 0)
        operator delete(v291);
      v307 = (void **)*MEMORY[0x1E0DE4F60];
      *(void ***)((char *)&v307 + (_QWORD)*(v307 - 3)) = *(void ***)(MEMORY[0x1E0DE4F60] + 24);
      v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
      if (v314 < 0)
        operator delete(v313);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18D764310](v315);
      v33 = a1;
    }
    *(_QWORD *)(v33 + 112) = 0;
    *(_OWORD *)(v33 + 80) = 0u;
    *(_OWORD *)(v33 + 96) = 0u;
    *(_OWORD *)(v33 + 48) = 0u;
    *(_OWORD *)(v33 + 64) = 0u;
    *(_OWORD *)(v33 + 16) = 0u;
    *(_OWORD *)(v33 + 32) = 0u;
    *(_OWORD *)v33 = 0u;
    *(_DWORD *)(v33 + 120) = 1065353216;
    *(_BYTE *)(v33 + 128) = 0;
    goto LABEL_277;
  }
  if (v29 != v31)
  {
    v204 = v29;
    while (*((_QWORD *)v204 + 2) != *((_QWORD *)v204 + 3))
    {
      v204 += 72;
      if (v204 == v31)
        goto LABEL_283;
    }
    goto LABEL_268;
  }
LABEL_283:
  if (maps::path_codec::Logger::m_log_level <= 1u)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Decoding path with ", 19);
    v205 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v205, (uint64_t)" support points.", 16);
    std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
    std::stringbuf::str();
    maps::path_codec::Logger::log_debug((uint64_t)&v291, 53, (uint64_t)&v299);
    if (v300.n128_i8[7] < 0)
      operator delete((void *)v299.n128_u64[0]);
    if (SHIBYTE(__dst) < 0)
      operator delete(v291);
    v307 = (void **)*MEMORY[0x1E0DE4F60];
    *(void ***)((char *)&v307 + (_QWORD)*(v307 - 3)) = *(void ***)(MEMORY[0x1E0DE4F60] + 24);
    v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
    if (v314 < 0)
      operator delete(v313);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x18D764310](v315);
    v29 = v280;
    v31 = v281;
  }
  v206 = (__n128 *)*((_QWORD *)v29 + 2);
  v207 = v206[1];
  v299 = *v206;
  v300 = v207;
  if (v29 == v31)
  {
LABEL_297:
    (*(void (**)(void **__return_ptr, uint64_t, __n128 *, _QWORD))(*(_QWORD *)v262 + 32))(&v291, v262, &v299, 0);
    if (BYTE4(v295))
    {
      if (!maps::path_codec::Logger::m_log_level)
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Computing origin/destination fractions.", 39);
        std::string::basic_string[abi:ne180100]<0>(&v288, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
        std::stringbuf::str();
        maps::path_codec::Logger::log_trace((uint64_t)&v288, 110, (uint64_t)&v304);
        if (SHIBYTE(v306) < 0)
          operator delete(v304);
        if (v289.n128_i8[7] < 0)
          operator delete((void *)v288.n128_u64[0]);
        v307 = (void **)*MEMORY[0x1E0DE4F60];
        *(void ***)((char *)&v307 + (_QWORD)*(v307 - 3)) = *(void ***)(MEMORY[0x1E0DE4F60] + 24);
        v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
        if (v314 < 0)
          operator delete(v313);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18D764310](v315);
      }
      v211 = maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)&v299, v280);
      v212 = v211 <= maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)&v299, (_DWORD *)v281 - 18);
    }
    else
    {
      v212 = 0;
    }
    if (SBYTE7(v298) < 0)
      operator delete(v296);
    if (v292)
    {
      __dst = v292;
      operator delete(v292);
    }
    if (!v212)
      goto LABEL_336;
    *(_QWORD *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_DWORD *)(a1 + 120) = 1065353216;
    *(_BYTE *)(a1 + 128) = 0;
    v213 = v280;
    v214 = (_OWORD *)*((_QWORD *)v280 + 2);
    v215 = operator new(0x20uLL);
    v216 = v214[1];
    *v215 = *v214;
    v215[1] = v216;
    *(_QWORD *)(a1 + 24) = v215 + 2;
    *(_QWORD *)(a1 + 32) = v215 + 2;
    *(_QWORD *)(a1 + 16) = v215;
    v217 = operator new(1uLL);
    *v217 = v213[45];
    *(_QWORD *)(a1 + 48) = v217 + 1;
    *(_QWORD *)(a1 + 56) = v217 + 1;
    *(_QWORD *)(a1 + 40) = v217;
    v218 = v281;
    v219 = a1;
    if (v213 != v281)
    {
      v220 = 0;
      v221 = 0;
      v222 = 0;
      do
      {
        v223 = (__int128 *)(v213 + 48);
        if (v213[48])
        {
          v224 = maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)v215, v213);
          v225 = v224;
          if (v222 >= v221)
          {
            v227 = 0xAAAAAAAAAAAAAAABLL * ((v222 - v220) >> 4) + 1;
            if (v227 > 0x555555555555555)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v221 - v220) >> 4) > v227)
              v227 = 0x5555555555555556 * ((v221 - v220) >> 4);
            if (0xAAAAAAAAAAAAAAABLL * ((v221 - v220) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v228 = 0x555555555555555;
            else
              v228 = v227;
            v229 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(v228);
            v231 = &v229[16 * ((v222 - v220) >> 4)];
            *(_QWORD *)v231 = 0;
            *((double *)v231 + 1) = v225;
            v232 = *v223;
            *((_QWORD *)v231 + 4) = *((_QWORD *)v213 + 8);
            *((_OWORD *)v231 + 1) = v232;
            v231[40] = 0;
            if (v222 == v220)
            {
              v234 = &v229[16 * ((v222 - v220) >> 4)];
            }
            else
            {
              v233 = &v229[16 * ((v222 - v220) >> 4)];
              do
              {
                v234 = v233 - 48;
                v235 = *((_OWORD *)v222 - 3);
                v236 = *((_OWORD *)v222 - 1);
                *((_OWORD *)v233 - 2) = *((_OWORD *)v222 - 2);
                *((_OWORD *)v233 - 1) = v236;
                *((_OWORD *)v233 - 3) = v235;
                v222 -= 48;
                v233 -= 48;
              }
              while (v222 != v220);
            }
            v221 = &v229[48 * v230];
            v222 = v231 + 48;
            *(_QWORD *)(a1 + 64) = v234;
            *(_QWORD *)(a1 + 72) = v231 + 48;
            *(_QWORD *)(a1 + 80) = v221;
            if (v220)
              operator delete(v220);
            v220 = v234;
          }
          else
          {
            *(_QWORD *)v222 = 0;
            *((double *)v222 + 1) = v224;
            v226 = *v223;
            *((_QWORD *)v222 + 4) = *((_QWORD *)v213 + 8);
            *((_OWORD *)v222 + 1) = v226;
            v222[40] = 0;
            v222 += 48;
          }
          v219 = a1;
          *(_QWORD *)(a1 + 72) = v222;
        }
        else
        {
          v219 = a1;
        }
        v213 += 72;
      }
      while (v213 != v218);
    }
    v10 = v255;
    maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_terminal_fractions(&v262, v219, (uint64_t)&v280);
  }
  else
  {
    while (1)
    {
      v208 = (uint64_t *)*((_QWORD *)v29 + 2);
      v209 = *v208;
      if (*v208)
      {
        v210 = &v299;
      }
      else
      {
        v209 = v208[1];
        v210 = (__n128 *)&v299.n128_i8[8];
      }
      if (v209 != v210->n128_u64[0])
        break;
      v29 += 72;
      if (v29 == v31)
        goto LABEL_297;
    }
LABEL_336:
    v219 = a1;
    maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::decode_multi_segment_path(a1, (uint64_t)&v262, (uint64_t *)&v280);
  }
  v237 = (uint64_t *)*((_QWORD *)&v279 + 1);
  if (!*((_QWORD *)&v279 + 1))
    v237 = &maps::path_codec::geo3::_RoutingPathLeg_MetaData_default_instance_;
  v238 = *((_DWORD *)v237 + 6);
  if (v238 == 2)
    v239 = 2;
  else
    v239 = v238 == 1;
  *(_BYTE *)(v219 + 128) = v239;
  std::chrono::steady_clock::now();
  if (maps::path_codec::Logger::m_log_level <= 1u)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Decoded path with ", 18);
    v240 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v240, (uint64_t)" segments (origin_fraction: ", 28);
    v241 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v241, (uint64_t)", destination_fraction: ", 24);
    v242 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v242, (uint64_t)") in ", 5);
    v243 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v243, (uint64_t)" ms.", 4);
    std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
    std::stringbuf::str();
    maps::path_codec::Logger::log_debug((uint64_t)&v291, 67, (uint64_t)&v299);
    if (v300.n128_i8[7] < 0)
      operator delete((void *)v299.n128_u64[0]);
    if (SHIBYTE(__dst) < 0)
      operator delete(v291);
    v307 = (void **)*MEMORY[0x1E0DE4F60];
    *(void ***)((char *)&v307 + (_QWORD)*(v307 - 3)) = *(void ***)(MEMORY[0x1E0DE4F60] + 24);
    v308 = (void *)(MEMORY[0x1E0DE4FB8] + 16);
    if (v314 < 0)
      operator delete(v313);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x18D764310](v315);
  }
LABEL_277:
  v307 = (void **)&v280;
  std::vector<maps::path_codec::SnappedSupportPoint<GEOPathMatcherRoadKey>>::__destroy_vector::operator()[abi:ne180100](&v307);
  std::mutex::lock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  maps::path_codec::Logger::m_logger = 0;
  std::mutex::unlock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v277);
LABEL_278:

}

void __33__GEOPathMatcher__cachedSegments__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_addCoordinatesFromRoad:(id)a3 routeCoordinates:(id)a4 offsetFromStartOfPath:(double)a5 errorScale:(double)a6 offsetFromPathToCurrentPoint:(double *)a7 outCoordinates:(void *)a8
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  unint64_t i;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  __int128 v50;
  id v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;

  v51 = a3;
  v13 = a4;
  v14 = objc_msgSend(v51, "coordinates3d");
  v54 = *(_OWORD *)v14;
  v55 = *(_QWORD *)(v14 + 16);
  v15 = objc_msgSend(v13, "routeCoordinateForDistanceAfterStart:", a5 + *a7 * a6);
  v16 = v15;
  v17 = *((_QWORD *)a8 + 2);
  v18 = *((_QWORD *)a8 + 1);
  if (v18 >= v17)
  {
    v20 = (uint64_t)(v18 - *(_QWORD *)a8) >> 5;
    v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) >> 59)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v22 = v17 - *(_QWORD *)a8;
    if (v22 >> 4 > v21)
      v21 = v22 >> 4;
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0)
      v23 = 0x7FFFFFFFFFFFFFFLL;
    else
      v23 = v21;
    if (v23)
      v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)a8 + 16, v23);
    else
      v24 = 0;
    v25 = &v24[32 * v20];
    v26 = &v24[32 * v23];
    *(_OWORD *)v25 = v54;
    *((_QWORD *)v25 + 2) = v55;
    *((_QWORD *)v25 + 3) = v16;
    v19 = v25 + 32;
    v28 = *(char **)a8;
    v27 = (char *)*((_QWORD *)a8 + 1);
    if (v27 != *(char **)a8)
    {
      do
      {
        v29 = *((_OWORD *)v27 - 1);
        *((_OWORD *)v25 - 2) = *((_OWORD *)v27 - 2);
        *((_OWORD *)v25 - 1) = v29;
        v25 -= 32;
        v27 -= 32;
      }
      while (v27 != v28);
      v27 = *(char **)a8;
    }
    *(_QWORD *)a8 = v25;
    *((_QWORD *)a8 + 1) = v19;
    *((_QWORD *)a8 + 2) = v26;
    if (v27)
      operator delete(v27);
  }
  else
  {
    *(_OWORD *)v18 = v54;
    *(_QWORD *)(v18 + 16) = v55;
    *(_QWORD *)(v18 + 24) = v15;
    v19 = (char *)(v18 + 32);
  }
  *((_QWORD *)a8 + 1) = v19;
  for (i = 1; i < objc_msgSend(v51, "coordinateCount"); ++i)
  {
    v31 = objc_msgSend(v51, "coordinates3d");
    v32 = objc_msgSend(v51, "coordinates3d");
    v33 = v31 + 24 * i;
    v34 = v32 + 24 * i;
    v35 = GEOCalculateDistanceRadius(*(double *)(v33 - 24), *(double *)(v33 - 16), *(double *)v34, *(double *)(v34 + 8), 6367000.0)+ *a7;
    *a7 = v35;
    v52 = *(_OWORD *)v34;
    v53 = *(_QWORD *)(v34 + 16);
    v36 = objc_msgSend(v13, "routeCoordinateForDistanceAfterStart:", a5 + v35 * a6);
    v37 = v36;
    v38 = *((_QWORD *)a8 + 1);
    v39 = *((_QWORD *)a8 + 2);
    if (v38 >= v39)
    {
      v41 = (uint64_t)(v38 - *(_QWORD *)a8) >> 5;
      v42 = v41 + 1;
      if ((unint64_t)(v41 + 1) >> 59)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v43 = v39 - *(_QWORD *)a8;
      if (v43 >> 4 > v42)
        v42 = v43 >> 4;
      if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFE0)
        v44 = 0x7FFFFFFFFFFFFFFLL;
      else
        v44 = v42;
      if (v44)
        v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)a8 + 16, v44);
      else
        v45 = 0;
      v46 = &v45[32 * v41];
      *(_OWORD *)v46 = v52;
      *((_QWORD *)v46 + 2) = v53;
      *((_QWORD *)v46 + 3) = v37;
      v48 = *(char **)a8;
      v47 = (char *)*((_QWORD *)a8 + 1);
      v49 = v46;
      if (v47 != *(char **)a8)
      {
        do
        {
          v50 = *((_OWORD *)v47 - 1);
          *((_OWORD *)v49 - 2) = *((_OWORD *)v47 - 2);
          *((_OWORD *)v49 - 1) = v50;
          v49 -= 32;
          v47 -= 32;
        }
        while (v47 != v48);
        v47 = *(char **)a8;
      }
      v40 = v46 + 32;
      *(_QWORD *)a8 = v49;
      *((_QWORD *)a8 + 1) = v46 + 32;
      *((_QWORD *)a8 + 2) = &v45[32 * v44];
      if (v47)
        operator delete(v47);
    }
    else
    {
      *(_OWORD *)v38 = v52;
      *(_QWORD *)(v38 + 16) = v53;
      *(_QWORD *)(v38 + 24) = v36;
      v40 = (char *)(v38 + 32);
    }
    *((_QWORD *)a8 + 1) = v40;
  }

}

- (BOOL)_verifySegmentDistanceFromRoute:(id)a3 segmentIndex:(int64_t)a4 requestedPathRange:(GEOPolylineCoordinateRange)a5
{
  uint64_t end;
  uint64_t start;
  int v7;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  NSObject *v18;
  double v19;
  NSString *loggingIdentifier;
  void *v21;
  int v23;
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  end = (uint64_t)a5.end;
  start = (uint64_t)a5.start;
  v7 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "pointCount") >= 2
    && (objc_msgSend(v9, "startLocationCoordinate"),
        v11 = v10,
        v13 = v12,
        -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", objc_msgSend(v9, "startRouteCoordinate")), v16 = GEOCalculateDistanceRadius(v11, v13, v14, v15, 6367000.0), v16 > 25.0))
  {
    GEOGetGEOPathMatcherLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      GEOPolylineCoordinateRangeAsString(start, end, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = loggingIdentifier;
      v25 = 1024;
      v26 = v7;
      v27 = 2048;
      v28 = v16;
      v29 = 2112;
      v30 = v21;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "(%@) Matched segment (%d) is a significant distance (%0.1f meters) from the route. This likely means the path matcher snapped to the wrong road. Path range: [%@]", (uint8_t *)&v23, 0x26u);

    }
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)shouldSaveInternalInfo
{
  return self->_shouldSaveInternalInfo;
}

- (void)setShouldSaveInternalInfo:(BOOL)a3
{
  self->_shouldSaveInternalInfo = a3;
}

- (id)internalInfos
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
  v7 = __Block_byref_object_copy__63;
  v8 = __Block_byref_object_dispose__63;
  v9 = 0;
  geo_isolate_sync();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __31__GEOPathMatcher_internalInfos__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)setInternalInfos:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync();

}

void __35__GEOPathMatcher_setInternalInfos___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (double)preloadDistance
{
  return self->_preloadDistance;
}

- (void)setPreloadDistance:(double)a3
{
  self->_preloadDistance = a3;
}

- (BOOL)shouldDropDivergingSegments
{
  return self->_shouldDropDivergingSegments;
}

- (void)setShouldDropDivergingSegments:(BOOL)a3
{
  self->_shouldDropDivergingSegments = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  GEOPolylineCoordinateRange *begin;

  objc_storeStrong((id *)&self->_internalInfosIsolater, 0);
  objc_storeStrong((id *)&self->_internalInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  begin = self->_failedRanges.__begin_;
  if (begin)
  {
    self->_failedRanges.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_matchedSegmentsIsolater, 0);
  objc_storeStrong((id *)&self->_matchedSegments, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
