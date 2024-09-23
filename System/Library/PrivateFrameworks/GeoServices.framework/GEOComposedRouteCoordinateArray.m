@implementation GEOComposedRouteCoordinateArray

- (GEOComposedRouteCoordinateArray)init
{
  GEOComposedRouteCoordinateArray *result;

  result = (GEOComposedRouteCoordinateArray *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOComposedRouteCoordinateArray)initWithRawRouteGeometry:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  _GEOCoordinatePath *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t *v21;
  double v22;
  uint64_t *v23;
  double v24;
  double v25;
  char *v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  double *v33;
  double *v34;
  __int128 v35;
  GEOCoordinateArraySupportPoint *v36;
  unint64_t v37;
  void *v38;
  long double v39;
  _QWORD *v40;
  double v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  _QWORD *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  int v61;
  char *v62;
  char *v63;
  NSObject *v64;
  char *v65;
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  id *v70;
  id *v71;
  id v73;
  id obj;
  uint64_t v75;
  id v76;
  uint64_t v77;
  GEOComposedRouteCoordinateArray *v78;
  id v79;
  double *v80;
  id v81;
  unint64_t coordinateCount;
  _QWORD v83[4];
  id *v84;
  __int128 *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  objc_super v90;
  void *v91;
  _QWORD *v92;
  unint64_t v93;
  void *__p;
  char *v95;
  char *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  objc_super v101;
  uint8_t buf[16];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v90.receiver = self;
  v90.super_class = (Class)GEOComposedRouteCoordinateArray;
  v78 = -[GEOComposedRouteCoordinateArray init](&v90, sel_init);
  if (v78)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v73, "paths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v76 = (id)objc_claimAutoreleasedReturnValue();

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v73, "paths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
    v8 = 0;
    if (!v7)
      goto LABEL_107;
    v75 = *(_QWORD *)v87;
    while (1)
    {
      v77 = v7;
      v9 = 0;
      v80 = (double *)v8;
      do
      {
        if (*(_QWORD *)v87 != v75)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v9);
        v11 = [_GEOCoordinatePath alloc];
        coordinateCount = v78->_coordinateCount;
        v79 = v10;
        if (v11)
        {
          v101.receiver = v11;
          v101.super_class = (Class)_GEOCoordinatePath;
          v8 = -[GEOComposedRouteCoordinateArray init](&v101, sel_init);
          if (!v8)
            goto LABEL_91;
          if (v79)
          {
            objc_msgSend(v79, "decompressedPathData");
            v12 = (int)v99;
            if ((_DWORD)v99)
            {
              __p = 0;
              v95 = 0;
              v96 = 0;
              std::vector<GEOLocationCoordinate3D>::reserve(&__p, (int)v99);
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v81 = (id)objc_claimAutoreleasedReturnValue();
              v91 = 0;
              v92 = 0;
              v93 = 0;
              std::vector<double>::reserve(&v91, v12);
              v13 = 0;
              v14 = 0;
              if (v12 <= 1)
                v15 = 1;
              else
                v15 = v12;
              v16 = -180.0;
              v17 = -180.0;
              do
              {
                v18 = v17;
                v19 = v16;
                v20 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (int)v13 + 8);
                v21 = *(uint64_t **)(v20 + 32);
                if (!v21)
                  v21 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
                +[GEOLatLngE7 fromE7Coordinate:](GEOLatLngE7, "fromE7Coordinate:", *((unsigned int *)v21 + 6));
                v17 = v22;
                v23 = *(uint64_t **)(v20 + 32);
                if (!v23)
                  v23 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
                +[GEOLatLngE7 fromE7Coordinate:](GEOLatLngE7, "fromE7Coordinate:", *((unsigned int *)v23 + 7));
                v16 = v24;
                v25 = (float)*(int *)(v20 + 56) * 0.01;
                v26 = v95;
                if (v95 >= v96)
                {
                  v28 = (char *)__p;
                  v29 = 0xAAAAAAAAAAAAAAABLL * ((v95 - (_BYTE *)__p) >> 3);
                  v30 = v29 + 1;
                  if (v29 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * ((v96 - (_BYTE *)__p) >> 3) > v30)
                    v30 = 0x5555555555555556 * ((v96 - (_BYTE *)__p) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * ((v96 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                    v31 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v31 = v30;
                  if (v31)
                  {
                    v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v96, v31);
                    v28 = (char *)__p;
                    v26 = v95;
                  }
                  else
                  {
                    v32 = 0;
                  }
                  v33 = (double *)&v32[24 * v29];
                  *v33 = v17;
                  v33[1] = v16;
                  v33[2] = v25;
                  v34 = v33;
                  if (v26 != v28)
                  {
                    do
                    {
                      v35 = *(_OWORD *)(v26 - 24);
                      *(v34 - 1) = *((double *)v26 - 1);
                      *(_OWORD *)(v34 - 3) = v35;
                      v34 -= 3;
                      v26 -= 24;
                    }
                    while (v26 != v28);
                    v28 = (char *)__p;
                  }
                  v27 = (char *)(v33 + 3);
                  __p = v34;
                  v95 = (char *)(v33 + 3);
                  v96 = &v32[24 * v31];
                  if (v28)
                    operator delete(v28);
                }
                else
                {
                  *(double *)v95 = v17;
                  *((double *)v26 + 1) = v24;
                  v27 = v26 + 24;
                  *((double *)v26 + 2) = v25;
                }
                v95 = v27;
                if (*(_DWORD *)(v20 + 84) == 1)
                {
                  v36 = objc_alloc_init(GEOCoordinateArraySupportPoint);
                  -[GEOCoordinateArraySupportPoint setRouteCoordinate:](v36, "setRouteCoordinate:", (v13 + coordinateCount));
                  -[GEOCoordinateArraySupportPoint setIndex:](v36, "setIndex:", v13);
                  -[GEOCoordinateArraySupportPoint setRoadID:](v36, "setRoadID:", *(_QWORD *)(v20 + 48));
                  LODWORD(v37) = *(_DWORD *)(v20 + 60);
                  -[GEOCoordinateArraySupportPoint setHeading:](v36, "setHeading:", (double)v37);
                  -[GEOCoordinateArraySupportPoint setIsUTurn:](v36, "setIsUTurn:", *(unsigned __int8 *)(v20 + 76));
                  -[GEOCoordinateArraySupportPoint setLegacyRoadClass:](v36, "setLegacyRoadClass:", *(unsigned int *)(v20 + 64));
                  -[GEOCoordinateArraySupportPoint setLegacyFormOfWay:](v36, "setLegacyFormOfWay:", *(unsigned int *)(v20 + 68));
                  if ((*(_BYTE *)(v20 + 16) & 4) != 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3A28], "_geo_uuidForHighBytes:lowBytes:", *(_QWORD *)(*(_QWORD *)(v20 + 40) + 24), *(_QWORD *)(*(_QWORD *)(v20 + 40) + 32));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    -[GEOCoordinateArraySupportPoint setAnchorPointID:](v36, "setAnchorPointID:", v38);

                  }
                  objc_msgSend(v81, "addObject:", v36);

                }
                if (v19 < -180.0 || v19 > 180.0 || v18 < -90.0 || v18 > 90.0)
                {
                  v43 = v92;
                  if ((unint64_t)v92 >= v93)
                  {
                    v45 = v91;
                    v46 = ((char *)v92 - (_BYTE *)v91) >> 3;
                    v47 = v46 + 1;
                    if ((unint64_t)(v46 + 1) >> 61)
                      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                    v48 = v93 - (_QWORD)v91;
                    if ((uint64_t)(v93 - (_QWORD)v91) >> 2 > v47)
                      v47 = v48 >> 2;
                    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
                      v49 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v49 = v47;
                    if (v49)
                    {
                      v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v93, v49);
                      v45 = v91;
                      v43 = v92;
                    }
                    else
                    {
                      v50 = 0;
                    }
                    v57 = &v50[8 * v46];
                    *(_QWORD *)v57 = 0;
                    v44 = v57 + 8;
                    while (v43 != v45)
                    {
                      v58 = *--v43;
                      *((_QWORD *)v57 - 1) = v58;
                      v57 -= 8;
                    }
                    v91 = v57;
                    v92 = v44;
                    v93 = (unint64_t)&v50[8 * v49];
                    if (v45)
                      operator delete(v45);
                  }
                  else
                  {
                    *v92 = 0;
                    v44 = v43 + 1;
                  }
                  v92 = v44;
                }
                else
                {
                  v39 = GEOCalculateDistanceRadius(v18, v19, v17, v16, 6367000.0);
                  v40 = v92;
                  v41 = v39 + *((double *)v92 - 1);
                  if ((unint64_t)v92 >= v93)
                  {
                    v51 = v91;
                    v52 = ((char *)v92 - (_BYTE *)v91) >> 3;
                    v53 = v52 + 1;
                    if ((unint64_t)(v52 + 1) >> 61)
                      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                    v54 = v93 - (_QWORD)v91;
                    if ((uint64_t)(v93 - (_QWORD)v91) >> 2 > v53)
                      v53 = v54 >> 2;
                    if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8)
                      v55 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v55 = v53;
                    if (v55)
                    {
                      v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v93, v55);
                      v51 = v91;
                      v40 = v92;
                    }
                    else
                    {
                      v56 = 0;
                    }
                    v59 = (double *)&v56[8 * v52];
                    *v59 = v41;
                    v42 = v59 + 1;
                    while (v40 != v51)
                    {
                      v60 = *--v40;
                      *((_QWORD *)v59-- - 1) = v60;
                    }
                    v91 = v59;
                    v92 = v42;
                    v93 = (unint64_t)&v56[8 * v55];
                    if (v51)
                      operator delete(v51);
                  }
                  else
                  {
                    *(double *)v92 = v41;
                    v42 = v40 + 1;
                  }
                  v92 = v42;
                  v61 = *(_DWORD *)(v20 + 72);
                  if (v61)
                  {
                    -[_GEOCoordinatePath calibratePointLengths:startIndex:endIndex:rangeLength:]((uint64_t)v8, (uint64_t)v91, v14, v13, (float)(v61- *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * (int)v14 + 8) + 72))* 0.01);
                    v14 = v13;
                  }
                }
                ++v13;
              }
              while (v13 != v15);
              -[_GEOCoordinatePath setBasicCoordinates:](v8, (uint64_t)&__p);
              objc_storeStrong((id *)v8 + 8, v81);
              v62 = v8 + 72;
              if (*((_QWORD *)v8 + 9) == *((_QWORD *)v8 + 10))
              {
                if (v62 != (char *)&v91)
                  std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>(v62, (char *)v91, (uint64_t)v92, ((char *)v92 - (_BYTE *)v91) >> 3);
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _pointLengths.empty()", buf, 2u);
              }
              *((_QWORD *)v8 + 12) = coordinateCount;
              v63 = v8;
              if (v91)
              {
                v92 = v91;
                operator delete(v91);
              }

              if (__p)
              {
                v95 = (char *)__p;
                operator delete(__p);
              }
LABEL_90:
              maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)&v97);

              goto LABEL_91;
            }
          }
          else
          {
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
          }
          GEOGetGEOComposedRouteLog();
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            LOWORD(__p) = 0;
            _os_log_impl(&dword_1885A9000, v64, OS_LOG_TYPE_ERROR, "Routing path has no geometry. This is most likely a server error.", (uint8_t *)&__p, 2u);
          }

          v65 = v8;
          goto LABEL_90;
        }
        v8 = 0;
LABEL_91:

        v66 = 0.0;
        if (v80)
        {
          v67 = v80[13];
          v68 = *((_QWORD *)v80 + 10);
          if (*((_QWORD *)v80 + 9) != v68)
            v66 = *(double *)(v68 - 8);
          if (v8)
          {
LABEL_95:
            v66 = v67 + v66;
            *((double *)v8 + 13) = v66;
          }
        }
        else
        {
          v67 = 0.0;
          if (v8)
            goto LABEL_95;
        }
        objc_msgSend(v76, "addObject:", v8, v66, v67);
        if (v8)
          v69 = *((_QWORD *)v8 + 7);
        else
          v69 = 0;
        v78->_coordinateCount += v69;

        ++v9;
        v80 = (double *)v8;
      }
      while (v9 != v77);
      v6 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
      if (!v7)
      {
LABEL_107:

        objc_storeStrong((id *)&v78->_paths, v76);
        v78->_usesRoutingPathPoints = 1;
        *(_QWORD *)&v97 = 0;
        *((_QWORD *)&v97 + 1) = &v97;
        *(_QWORD *)&v98 = 0x3032000000;
        *((_QWORD *)&v98 + 1) = __Block_byref_object_copy__58;
        *(_QWORD *)&v99 = __Block_byref_object_dispose__58;
        *((_QWORD *)&v99 + 1) = 0;
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __60__GEOComposedRouteCoordinateArray_initWithRawRouteGeometry___block_invoke;
        v83[3] = &unk_1E1C0E610;
        v70 = v78;
        v84 = v70;
        v85 = &v97;
        objc_msgSend(v73, "pathMatcherNoMatchRangesWithHandler:", v83);
        objc_storeStrong(v70 + 4, *(id *)(*((_QWORD *)&v97 + 1) + 40));
        v71 = v70;

        _Block_object_dispose(&v97, 8);
        break;
      }
    }
  }

  return v78;
}

uint64_t __60__GEOComposedRouteCoordinateArray_initWithRawRouteGeometry___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v7;
  double v8;
  uint64_t v10;
  _QWORD *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  GEOPolylineCoordinateRangeArray *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  float v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint8_t v26[16];

  v7 = *(_QWORD *)(a1 + 32);
  v8 = 0.0;
  if (v7)
  {
    if (objc_msgSend(*(id *)(v7 + 8), "count") <= a2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex < _paths.count", v26, 2u);
      }
    }
    else if (a2)
    {
      v10 = 0;
      do
      {
        objc_msgSend(*(id *)(v7 + 8), "objectAtIndexedSubscript:", v10);
        v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v12 = 0.0;
        if (v11)
        {
          v13 = v11[10];
          if (v11[9] != v13)
            v12 = *(double *)(v13 - 8);
        }
        v8 = v8 + v12;

        ++v10;
      }
      while (a2 != v10);
    }
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistanceAfterStart:", v8 + a3);
  v15 = objc_msgSend(*(id *)(a1 + 32), "routeCoordinateForDistanceAfterStart:", v8 + a4);
  v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v16)
  {
    v17 = objc_alloc_init(GEOPolylineCoordinateRangeArray);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v20 = 0xBF80000000000000;
  v21 = floorf(*((float *)&v14 + 1));
  v22 = vcvtms_u32_f32(*((float *)&v14 + 1)) + v14;
  if (*((float *)&v14 + 1) >= 0.0)
    v20 = (unint64_t)COERCE_UNSIGNED_INT(*((float *)&v14 + 1) - v21) << 32;
  else
    v22 = 0;
  v23 = (vcvtms_u32_f32(*((float *)&v15 + 1)) + v15) | ((unint64_t)COERCE_UNSIGNED_INT(*((float *)&v15 + 1)- floorf(*((float *)&v15 + 1))) << 32);
  if (*((float *)&v15 + 1) >= 0.0)
    v24 = v23;
  else
    v24 = 0xBF80000000000000;
  return objc_msgSend(v16, "addCoordinateRange:", v20 | v22, v24);
}

- (GEOComposedRouteCoordinateArray)initWithPointData:(id)a3 lengthMarkers:(id)a4 usesZilch:(BOOL)a5
{
  _BOOL4 v5;
  GEOComposedRouteCoordinateArray *v8;
  GEOComposedRouteCoordinateArray *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const void *v13;
  uint64_t v14;
  _GEOCoordinatePath *v15;
  _GEOCoordinatePath *v16;
  char *p_zilchPoints;
  ControlPoint *begin;
  uint64_t v19;
  int v20;
  unint64_t v21;
  zilch::ControlPoint *v22;
  zilch::GeoCoordinates *v23;
  zilch::GeoCoordinates *v24;
  unsigned int v25;
  zilch::GeoCoordinates *v26;
  unsigned int v27;
  Longitude v28;
  Latitude v29;
  zilch::GeoCoordinates *v30;
  unint64_t count;
  uint64_t v32;
  NSArray *paths;
  GEOComposedRouteCoordinateArray *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  _GEOCoordinatePath *v55;
  unint64_t v56;
  uint64_t v57;
  NSArray *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t i;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  double v66;
  double v67;
  double v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t j;
  double v82;
  double v83;
  double v84;
  long double v85;
  _QWORD *v86;
  double v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  double *v95;
  uint64_t v96;
  double v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  double v102;
  uint64_t v103;
  NSObject *v104;
  GEOComposedRouteCoordinateArray *v105;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id obj;
  id obja;
  uint64_t v114;
  NSArray *v115;
  NSArray *v116;
  uint64_t v117;
  id v118;
  GEOComposedRouteCoordinateArray *v119;
  objc_super v120;
  GeoCoordinates buf[2];
  void *__p;
  char *v123;
  char *v124;
  uint8_t v125[16];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  void *v129;
  _QWORD *v130;
  _QWORD v131[16];

  v5 = a5;
  v131[14] = *MEMORY[0x1E0C80C00];
  v109 = a3;
  v108 = a4;
  v120.receiver = self;
  v120.super_class = (Class)GEOComposedRouteCoordinateArray;
  v8 = -[GEOComposedRouteCoordinateArray init](&v120, sel_init);
  v9 = v8;
  v119 = v8;
  if (v8)
  {
    v8->_usesZilch = v5;
    if (v5)
    {
      v110 = v109;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v110, "count"));
      v116 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9->_coordinateCount = 0;
      v127 = 0u;
      v128 = 0u;
      *(_OWORD *)v125 = 0u;
      v126 = 0u;
      obj = v110;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v125, &v129, 16);
      if (v10)
      {
        v114 = *(_QWORD *)v126;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v126 != v114)
              objc_enumerationMutation(obj);
            v12 = objc_retainAutorelease(*(id *)(*(_QWORD *)&v125[8] + 8 * v11));
            v13 = (const void *)objc_msgSend(v12, "bytes");
            v14 = objc_msgSend(v12, "length");
            __p = 0;
            v123 = 0;
            v124 = 0;
            std::vector<zilch::ControlPoint>::__init_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>(&__p, v13, (uint64_t)v13 + (v14 & 0xFFFFFFFFFFFFFFE0), v14 >> 5);
            v15 = objc_alloc_init(_GEOCoordinatePath);
            v16 = v15;
            if (v15)
            {
              if (v15->_basicCoordinates.__begin_ == v15->_basicCoordinates.__end_)
              {
                p_zilchPoints = (char *)&v15->_zilchPoints;
                if (&v16->_zilchPoints != (vector<zilch::ControlPoint, std::allocator<zilch::ControlPoint>> *)&__p)
                  std::vector<zilch::ControlPoint>::__assign_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>(p_zilchPoints, (char *)__p, (uint64_t)v123, (v123 - (_BYTE *)__p) >> 5);
                v16->_count = v16->_zilchPoints.__end_ - v16->_zilchPoints.__begin_;
                if (GEOConfigGetBOOL(GeoServicesConfig_HideInvalidRouteElevation, (uint64_t)off_1EDF4DE88))
                {
                  begin = v16->_zilchPoints.__begin_;
                  if (v16->_zilchPoints.__end_ != begin)
                  {
                    v19 = 0;
                    v20 = 0;
                    v21 = 0;
                    do
                    {
                      v22 = (zilch::ControlPoint *)&begin[v19];
                      v23 = (zilch::GeoCoordinates *)zilch::ControlPoint::position((zilch::ControlPoint *)&begin[v19]);
                      if (zilch::GeoCoordinates::z(v23) == 0x7FFFFFFF)
                      {
                        v24 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        v25 = zilch::GeoCoordinates::x(v24);
                        v26 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        v27 = zilch::GeoCoordinates::y(v26);
                        v28.var0 = v25;
                        v29.var0 = v27;
                        zilch::GeoCoordinates::GeoCoordinates((uint64_t)buf, v28, v29, v20);
                        zilch::ControlPoint::setPosition((uint64_t)v22, buf);
                      }
                      else
                      {
                        v30 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        v20 = zilch::GeoCoordinates::z(v30);
                      }
                      ++v21;
                      begin = v16->_zilchPoints.__begin_;
                      ++v19;
                    }
                    while (v21 < v16->_zilchPoints.__end_ - begin);
                  }
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                LOWORD(buf[0].var0.var0) = 0;
                _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _basicCoordinates.empty()", (uint8_t *)buf, 2u);
              }
              v16->_pathStartIndex = v119->_coordinateCount;
            }
            -[NSArray addObject:](v116, "addObject:", v16);
            if (v16)
              count = v16->_count;
            else
              count = 0;
            v119->_coordinateCount += count;

            if (__p)
            {
              v123 = (char *)__p;
              operator delete(__p);
            }
            ++v11;
          }
          while (v11 != v10);
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v125, &v129, 16);
          v10 = v32;
        }
        while (v32);
      }

      paths = v119->_paths;
      v119->_paths = v116;

      v34 = v119;
      if (v119->_coordinateCount)
      {
        v35 = 0;
LABEL_69:
        v118 = v35;
        objc_msgSend(v118, "sortedArrayUsingSelector:", sel_compare_);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectEnumerator");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "nextObject");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; ; ++i)
        {
          if (i >= -[NSArray count](v119->_paths, "count"))
          {

            v34 = v119;
            goto LABEL_142;
          }
          -[NSArray objectAtIndexedSubscript:](v119->_paths, "objectAtIndexedSubscript:", i);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v63;
          v65 = v63 ? *(_QWORD *)(v63 + 56) : 0;
          v129 = 0;
          v130 = 0;
          v131[0] = 0;
          std::vector<double>::reserve(&v129, v65);
          v66 = -[_GEOCoordinatePath coordinateAt:]((_QWORD *)v64, 0);
          v68 = v67;
          v69 = v130;
          if ((unint64_t)v130 >= v131[0])
          {
            v71 = v129;
            v72 = ((char *)v130 - (_BYTE *)v129) >> 3;
            v73 = v72 + 1;
            if ((unint64_t)(v72 + 1) >> 61)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v74 = v131[0] - (_QWORD)v129;
            if ((uint64_t)(v131[0] - (_QWORD)v129) >> 2 > v73)
              v73 = v74 >> 2;
            if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
              v75 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v75 = v73;
            if (v75)
            {
              v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v131, v75);
              v71 = v129;
              v69 = v130;
            }
            else
            {
              v76 = 0;
            }
            v77 = &v76[8 * v72];
            *(_QWORD *)v77 = 0;
            v70 = v77 + 8;
            while (v69 != v71)
            {
              v78 = *--v69;
              *((_QWORD *)v77 - 1) = v78;
              v77 -= 8;
            }
            v129 = v77;
            v130 = v70;
            v131[0] = &v76[8 * v75];
            if (v71)
              operator delete(v71);
          }
          else
          {
            *v130 = 0;
            v70 = v69 + 1;
          }
          v130 = v70;
          do
          {
            if (objc_msgSend(v61, "pathIndex") >= i
              && (objc_msgSend(v61, "pathIndex") != i || objc_msgSend(v61, "pointIndex")))
            {
              break;
            }
            objc_msgSend(v60, "nextObject");
            v79 = objc_claimAutoreleasedReturnValue();

            v61 = (void *)v79;
          }
          while (v79);
          if (v65 >= 2)
          {
            v80 = 0;
            for (j = 1; j != v65; ++j)
            {
              v82 = -[_GEOCoordinatePath coordinateAt:]((_QWORD *)v64, j);
              v84 = v83;
              v85 = GEOCalculateDistanceRadius(v66, v68, v82, v83, 6367000.0);
              v86 = v130;
              v87 = v85 + *((double *)v130 - 1);
              if ((unint64_t)v130 >= v131[0])
              {
                v89 = v129;
                v90 = ((char *)v130 - (_BYTE *)v129) >> 3;
                v91 = v90 + 1;
                if ((unint64_t)(v90 + 1) >> 61)
                  std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                v92 = v131[0] - (_QWORD)v129;
                if ((uint64_t)(v131[0] - (_QWORD)v129) >> 2 > v91)
                  v91 = v92 >> 2;
                if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8)
                  v93 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v93 = v91;
                if (v93)
                {
                  v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v131, v93);
                  v89 = v129;
                  v86 = v130;
                }
                else
                {
                  v94 = 0;
                }
                v95 = (double *)&v94[8 * v90];
                *v95 = v87;
                v88 = v95 + 1;
                while (v86 != v89)
                {
                  v96 = *--v86;
                  *((_QWORD *)v95-- - 1) = v96;
                }
                v129 = v95;
                v130 = v88;
                v131[0] = &v94[8 * v93];
                if (v89)
                  operator delete(v89);
              }
              else
              {
                *(double *)v130 = v87;
                v88 = v86 + 1;
              }
              v130 = v88;
              if (v61 && objc_msgSend(v61, "pathIndex") == i && objc_msgSend(v61, "pointIndex") == j)
              {
                objc_msgSend(v61, "length");
                -[_GEOCoordinatePath calibratePointLengths:startIndex:endIndex:rangeLength:](v64, (uint64_t)v129, v80, j, v97);
                objc_msgSend(v61, "length");
                objc_msgSend(v60, "nextObject");
                v98 = objc_claimAutoreleasedReturnValue();

                v61 = (void *)v98;
                v80 = j;
              }
              v68 = v84;
              v66 = v82;
            }
          }
          if (v64)
            v99 = *(_QWORD *)(v64 + 56);
          else
            v99 = 0;
          if (((char *)v130 - (_BYTE *)v129) >> 3 != v99)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v125 = 0;
              _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: pointLengths.size() == pathCoordinates.count", v125, 2u);
            }
            GEOGetGEOComposedRouteLog();
            v104 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v125 = 0;
              _os_log_impl(&dword_1885A9000, v104, OS_LOG_TYPE_ERROR, "Point lengths array size not equal to number of coordinates in path", v125, 2u);
            }

          }
          if ((void **)(v64 + 72) != &v129)
            std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>((char *)(v64 + 72), (char *)v129, (uint64_t)v130, ((char *)v130 - (_BYTE *)v129) >> 3);
          v100 = 0.0;
          if (!i)
            break;
          -[NSArray objectAtIndexedSubscript:](v119->_paths, "objectAtIndexedSubscript:", i - 1);
          v101 = objc_claimAutoreleasedReturnValue();
          if (!v101)
            goto LABEL_139;
          v102 = *(double *)(v101 + 104);
          v103 = *(_QWORD *)(v101 + 80);
          if (*(_QWORD *)(v101 + 72) != v103)
            v100 = *(double *)(v103 - 8);
          if (v64)
LABEL_127:
            *(double *)(v64 + 104) = v102 + v100;
LABEL_128:

          if (v129)
          {
            v130 = v129;
            operator delete(v129);
          }

        }
        v101 = 0;
LABEL_139:
        v102 = 0.0;
        if (v64)
          goto LABEL_127;
        goto LABEL_128;
      }
    }
    else
    {
      v107 = v109;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v107, "count"));
      v115 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9->_coordinateCount = 0;
      v127 = 0u;
      v128 = 0u;
      *(_OWORD *)v125 = 0u;
      v126 = 0u;
      v111 = v107;
      v36 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v125, &v129, 16);
      if (v36)
      {
        obja = *(id *)v126;
        do
        {
          v37 = 0;
          v117 = v36;
          do
          {
            if (*(id *)v126 != obja)
              objc_enumerationMutation(v111);
            v38 = *(void **)(*(_QWORD *)&v125[8] + 8 * v37);
            v39 = objc_msgSend(v38, "length");
            v40 = objc_msgSend(objc_retainAutorelease(v38), "bytes");
            v41 = v39 >> 4;
            __p = 0;
            v123 = 0;
            v124 = 0;
            std::vector<GEOLocationCoordinate3D>::reserve(&__p, v39 >> 4);
            if (v39 >= 0x10)
            {
              v42 = 0;
              if (v41 <= 1)
                v41 = 1;
              v43 = v123;
              do
              {
                v44 = (uint64_t *)(v40 + 16 * v42);
                v46 = *v44;
                v45 = v44[1];
                if (v43 >= v124)
                {
                  v47 = (char *)__p;
                  v48 = 0xAAAAAAAAAAAAAAABLL * ((v43 - (_BYTE *)__p) >> 3);
                  v49 = v48 + 1;
                  if (v48 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * ((v124 - (_BYTE *)__p) >> 3) > v49)
                    v49 = 0x5555555555555556 * ((v124 - (_BYTE *)__p) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * ((v124 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                    v50 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v50 = v49;
                  if (v50)
                  {
                    v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v124, v50);
                    v47 = (char *)__p;
                    v43 = v123;
                  }
                  else
                  {
                    v51 = 0;
                  }
                  v52 = &v51[24 * v48];
                  *(_QWORD *)v52 = v46;
                  *((_QWORD *)v52 + 1) = v45;
                  *((_QWORD *)v52 + 2) = 0;
                  v53 = v52;
                  if (v43 != v47)
                  {
                    do
                    {
                      v54 = *(_OWORD *)(v43 - 24);
                      *((_QWORD *)v53 - 1) = *((_QWORD *)v43 - 1);
                      *(_OWORD *)(v53 - 24) = v54;
                      v53 -= 24;
                      v43 -= 24;
                    }
                    while (v43 != v47);
                    v47 = (char *)__p;
                  }
                  v43 = v52 + 24;
                  __p = v53;
                  v123 = v52 + 24;
                  v124 = &v51[24 * v50];
                  if (v47)
                    operator delete(v47);
                }
                else
                {
                  *(_QWORD *)v43 = v46;
                  *((_QWORD *)v43 + 1) = v45;
                  *((_QWORD *)v43 + 2) = 0;
                  v43 += 24;
                }
                v123 = v43;
                ++v42;
              }
              while (v42 != v41);
            }
            v55 = objc_alloc_init(_GEOCoordinatePath);
            -[_GEOCoordinatePath setBasicCoordinates:](v55, (uint64_t)&__p);
            if (v55)
              v55->_pathStartIndex = v119->_coordinateCount;
            -[NSArray addObject:](v115, "addObject:", v55);
            if (v55)
              v56 = v55->_count;
            else
              v56 = 0;
            v119->_coordinateCount += v56;

            if (__p)
            {
              v123 = (char *)__p;
              operator delete(__p);
            }
            ++v37;
          }
          while (v37 != v117);
          v57 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v125, &v129, 16);
          v36 = v57;
        }
        while (v57);
      }

      v58 = v119->_paths;
      v119->_paths = v115;

      v34 = v119;
      v35 = v108;
      if (v119->_coordinateCount)
        goto LABEL_69;
    }
LABEL_142:
    v105 = v34;
  }

  return v119;
}

- (unint64_t)pathsCount
{
  return -[NSArray count](self->_paths, "count");
}

- (unint64_t)coordinateCountForPathAtIndex:(unint64_t)a3
{
  _QWORD *v3;
  unint64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[7];
  else
    v4 = 0;

  return v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnPath:(unint64_t)a3 coordinateIndex:(unint64_t)a4
{
  _QWORD *v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_paths, "count") <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -180.0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v14 = -[NSArray count](self->_paths, "count");
      v20 = 67109376;
      v21 = a3;
      v22 = 1024;
      v23 = v14;
      _os_log_impl(&dword_1885A9000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnPath:coordinateIndex:] - pathIndex (%d) is out of bounds. paths count: %d", (uint8_t *)&v20, 0xEu);
    }
    *(double *)&v13 = 1.79769313e308;
    goto LABEL_13;
  }
  -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v7;
  if (!v7 || v7[7] <= a4)
  {
    GEOGetGEOComposedRouteLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v8)
        v16 = *(_DWORD *)(v8 + 56);
      else
        v16 = 0;
      v20 = 67109632;
      v21 = a4;
      v22 = 1024;
      v23 = a3;
      v24 = 1024;
      v25 = v16;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnPath:coordinateIndex:] - coordinateIndex (%d) is out of bounds. path: %d, coordinates count: %d", (uint8_t *)&v20, 0x14u);
    }

    *(double *)&v13 = 1.79769313e308;
    v9 = -180.0;
LABEL_13:
    *(double *)&v11 = -180.0;
    goto LABEL_14;
  }
  v9 = -[_GEOCoordinatePath coordinateAt:](v7, a4);
  v11 = v10;
  v13 = v12;
LABEL_14:

  v17 = v9;
  v18 = *(double *)&v11;
  v19 = *(double *)&v13;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRouteAt:(unint64_t)a3
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t coordinateCount;
  uint64_t v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  uint64_t v23;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v23 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_paths, "count"))
  {
    GEOGetGEOComposedRouteLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnRouteAt:] - no paths in coordinate array", (uint8_t *)v20, 2u);
    }

    goto LABEL_13;
  }
  if (self->_coordinateCount <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      coordinateCount = self->_coordinateCount;
      v20[0] = 67109376;
      v20[1] = a3;
      v21 = 1024;
      v22 = coordinateCount;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnRouteAt:] - index (%d) is out of bounds. coordinate count: %d", (uint8_t *)v20, 0xEu);
    }

LABEL_13:
    *(double *)&v12 = 1.79769313e308;
    v13 = -180.0;
    *(double *)&v14 = -180.0;
    goto LABEL_15;
  }
  -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", 0);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  if (!v5)
    goto LABEL_6;
  while (1)
  {
    v7 = v5[7];
    if (a3 < v7)
      break;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      a3 -= v7;

      ++v6;
      v5 = (_QWORD *)v8;
      if (v8)
        break;
LABEL_6:
      v7 = 0;
    }
  }
  v13 = -[_GEOCoordinatePath coordinateAt:](v5, a3);
  v14 = v15;
  v12 = v16;

LABEL_15:
  v17 = v13;
  v18 = *(double *)&v14;
  v19 = *(double *)&v12;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateForRouteCoordinate:(PolylineCoordinate)a3
{
  float v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  void *v20;
  unint64_t coordinateCount;
  double v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3.offset - floorf(a3.offset);
  v6 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0)
    v7 = v6;
  else
    v7 = 0;
  if (a3.offset >= 0.0)
    v8 = v5;
  else
    v8 = -1.0;
  if (a3.index >= self->_coordinateCount)
  {
    GEOGetGEOComposedRouteLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      GEOPolylineCoordinateAsString(*(_QWORD *)&a3, 1, 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      coordinateCount = self->_coordinateCount;
      v25 = 138478083;
      v26 = v20;
      v27 = 1024;
      v28 = coordinateCount;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:] - routeCoordinate (%{private}@) is out of bounds. coordinate count: %d", (uint8_t *)&v25, 0x12u);

    }
    v14 = 1.79769313e308;
    v10 = -180.0;
    v12 = -180.0;
  }
  else
  {
    -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v7, v5, -1.0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (self->_coordinateCount - 1 != v7)
    {
      -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", (v7 + 1));
      v10 = v10 + (v15 - v10) * v8;
      v12 = v12 + (v16 - v12) * v8;
      v14 = v14 + (v17 - v14) * v8;
    }
  }
  v22 = v10;
  v23 = v12;
  v24 = v14;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

- (id)rawRouteGeometry
{
  NSArray *paths;
  void *v3;
  GEORawRouteGeometry *v4;
  _QWORD v6[5];

  paths = self->_paths;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GEOComposedRouteCoordinateArray_rawRouteGeometry__block_invoke;
  v6[3] = &unk_1E1C0E638;
  v6[4] = self;
  -[NSArray _geo_map:](paths, "_geo_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GEORawRouteGeometry initWithRawData:]([GEORawRouteGeometry alloc], "initWithRawData:", v3);

  return v4;
}

id __51__GEOComposedRouteCoordinateArray_rawRouteGeometry__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a2 + 96);
    v3 = *(_QWORD *)(a2 + 96) + *(_DWORD *)(a2 + 56) - 1;
  }
  else
  {
    v2 = 0;
    v3 = 0xFFFFFFFFLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "routingPathDataFromStart:toEnd:supportPointsOnly:", v2, v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_localCoordinateIndexForRouteIndex:(uint64_t)a1
{
  unint64_t v2;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4 <= a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: routeIndex < _coordinateCount", buf, 2u);
      v4 = *(_QWORD *)(a1 + 16);
    }
    if (v4)
      v2 = v4 - 1;
    else
      v2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(a1 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if (v9)
      {
        v9 = *(_QWORD *)(v9 + 56);
        if (v2 < v9)
          break;
      }
      v2 -= v9;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v6)
          goto LABEL_5;
        break;
      }
    }
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteCoordinateArray)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteCoordinateArray *v5;
  uint64_t v6;
  NSArray *paths;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOPolylineCoordinateRangeArray *noMatchRanges;
  GEOComposedRouteCoordinateArray *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOComposedRouteCoordinateArray;
  v5 = -[GEOComposedRouteCoordinateArray init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_paths"));
    v6 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    v5->_coordinateCount = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v5->_paths;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
          if (v12)
            v12 = *(_QWORD *)(v12 + 56);
          v5->_coordinateCount += v12;
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    v5->_usesZilch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesZilch"), (_QWORD)v17);
    v5->_usesRoutingPathPoints = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesRoutingPathPoints"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_noMatchRanges"));
    v13 = objc_claimAutoreleasedReturnValue();
    noMatchRanges = v5->_noMatchRanges;
    v5->_noMatchRanges = (GEOPolylineCoordinateRangeArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_paths, CFSTR("_paths"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesZilch, CFSTR("_usesZilch"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesRoutingPathPoints, CFSTR("_usesRoutingPathPoints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_noMatchRanges, CFSTR("_noMatchRanges"));

}

- (id)description
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  double v20;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  GEOComposedRouteCoordinateArray *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  unint64_t v41;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = 0;
  v39 = ((int)log10((double)self->_coordinateCount) + 1);
  v37 = self;
  while (v3 < -[NSArray count](self->_paths, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = *(_QWORD *)(v5 + 56);
    else
      v7 = 0;
    v8 = "\n";
    if (!v3)
      v8 = "";
    v41 = v3;
    objc_msgSend(v40, "appendFormat:", CFSTR("%sPath %d (%d coordinates):\n"), v8, v3, v7);
    objc_msgSend(*(id *)(v6 + 64), "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v38 = ((int)log10((double)(unint64_t)(*(_QWORD *)(v6 + 56) + v4)) + 1);
    if (v6)
    {
LABEL_8:
      v12 = *(_QWORD *)(v6 + 56);
      goto LABEL_9;
    }
    while (1)
    {
      v12 = 0;
LABEL_9:
      if (v11 >= v12)
        break;
      v13 = -[_GEOCoordinatePath coordinateAt:]((_QWORD *)v6, v11);
      v15 = v14;
      v17 = v16;
      if (v6)
        v18 = *(_QWORD *)(v6 + 56);
      else
        v18 = 0;
      v19 = CFSTR(" | -");
      if (v11 < v18 - 1)
      {
        v21 = -[_GEOCoordinatePath coordinateAt:]((_QWORD *)v6, v11 + 1);
        if (vabdd_f64(v13, v21) >= 0.00000000999999994 || vabdd_f64(v15, v20) >= 0.00000000999999994)
        {
          v22 = GEOBearingFromCoordinateToCoordinate(v13, v15, v21, v20);
          v23 = fmod(v22, 360.0);
          if (v23 < 0.0)
            v23 = v23 + 360.0;
          v24 = 0x1E0CB3000uLL;
          LODWORD(v24) = llround(v23);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" | %d"), v24);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      if (v6 && (v25 = *(_QWORD *)(v6 + 72)) != 0)
      {
        v26 = *(double *)(v25 + 8 * v11);
        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%0.1fm)"), v26 + *(double *)(v6 + 104));
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = &stru_1E1C241D0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" | %0.1fm%@"), *(_QWORD *)&v26, v27);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = &stru_1E1C241D0;
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_33;
      while (objc_msgSend(v10, "index") < v11)
      {
        objc_msgSend(v9, "nextObject");
        v30 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v30;
        if (!v30)
          goto LABEL_33;
      }
      if (objc_msgSend(v10, "index") == v11)
      {
        objc_msgSend(v29, "appendFormat:", CFSTR(" | %lld"), objc_msgSend(v10, "roadID"));
        objc_msgSend(v10, "anchorPointID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v10, "anchorPointID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "UUIDString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "appendFormat:", CFSTR(" | Anchor: %@"), v33);

        }
        v34 = 42;
      }
      else
      {
LABEL_33:
        v34 = 32;
      }
      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%*d)"), v38, v4);
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = &stru_1E1C241D0;
      }
      objc_msgSend(v40, "appendFormat:", CFSTR("%*d%@: %c %0.6f, %0.6f | %0.1fm%@%@%@\n"), v39, v11, v35, v34, *(_QWORD *)&v13, *(_QWORD *)&v15, v17, v19, v28, v29);
      ++v4;

      ++v11;
      if (v6)
        goto LABEL_8;
    }

    v3 = v41 + 1;
    self = v37;
  }
  return v40;
}

- (unint64_t)coordinateCount
{
  return self->_coordinateCount;
}

- (BOOL)usesRoutingPathPoints
{
  return self->_usesRoutingPathPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noMatchRanges, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (double)distanceFromStartToIndex:(unint64_t)a3
{
  unint64_t v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v13;
  double v14;
  NSObject *v15;
  unint64_t coordinateCount;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (self->_coordinateCount <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      coordinateCount = self->_coordinateCount;
      *(_DWORD *)buf = 67109376;
      v23 = v3;
      v24 = 1024;
      v25 = coordinateCount;
      _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToIndex:] coordinateIndex (%d) is out of bounds (Coordinate count: %d). Clamping and attemping to continue.", buf, 0xEu);
    }

    v3 = self->_coordinateCount - 1;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_paths;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        if (v9)
        {
          v10 = *(_QWORD *)(v9 + 56);
          if (v3 < v10)
          {
            v13 = *(double *)(*(_QWORD *)(v9 + 72) + 8 * v3);
            v14 = *(double *)(v9 + 104);

            return v13 + v14;
          }
        }
        else
        {
          v10 = 0;
        }
        v3 -= v10;
        ++v8;
      }
      while (v6 != v8);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v11;
    }
    while (v11);
  }

  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self);
}

- (double)_length
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t i;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 8);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v12;
    v4 = 0.0;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v7 = 0.0;
        if (v6)
        {
          v9 = *(_QWORD *)(v6 + 72);
          v8 = *(_QWORD *)(v6 + 80);
          if (v9 != v8)
            v7 = *(double *)(v8 - 8);
        }
        v4 = v4 + v7;
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v2);
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (double)distanceToEndFromIndex:(unint64_t)a3
{
  double v4;

  -[GEOComposedRouteCoordinateArray distanceFromStartToIndex:](self, "distanceFromStartToIndex:", a3);
  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self) - v4;
}

- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;

  -[GEOComposedRouteCoordinateArray distanceFromStartToIndex:](self, "distanceFromStartToIndex:", a3);
  v7 = v6;
  -[GEOComposedRouteCoordinateArray distanceFromStartToIndex:](self, "distanceFromStartToIndex:", a4);
  return vabdd_f64(v8, v7);
}

- (double)distanceFromStartToRouteCoordinate:(PolylineCoordinate)a3
{
  unint64_t coordinateCount;
  double v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  NSArray *v10;
  uint64_t v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3.offset < 0.0)
  {
    GEOGetGEOComposedRouteLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      GEOPolylineCoordinateAsFullString(*(_QWORD *)&a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v32 = v25;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:] routeCoordinate (%{private}@) is invalid. Returning 0.", buf, 0xCu);

    }
    return 0.0;
  }
  coordinateCount = self->_coordinateCount;
  v6 = 0.0;
  if (coordinateCount < 2)
    return v6;
  if (a3.offset >= 0.0)
    v7 = (vcvtms_u32_f32(a3.offset) + a3.index) | ((unint64_t)COERCE_UNSIGNED_INT(a3.offset - floorf(a3.offset)) << 32);
  else
    v7 = 0xBF80000000000000;
  v8 = coordinateCount - 1;
  if ((_DWORD)v7 != v8)
  {
    if (v7 < v8)
      goto LABEL_8;
LABEL_26:
    v9 = v8;
    GEOGetGEOComposedRouteLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      GEOPolylineCoordinateAsFullString(v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      GEOPolylineCoordinateAsFullString(v9);
      *(_DWORD *)buf = 138478083;
      v32 = v22;
      v33 = 2112;
      v34 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v34;
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:] routeCoordinate (%{private}@) is out of bounds (Last valid coordinate: %@). Clamping and attemping to continue.", buf, 0x16u);

    }
    goto LABEL_9;
  }
  if (*((float *)&v7 + 1) > 0.0)
    goto LABEL_26;
LABEL_8:
  v9 = v7;
LABEL_9:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = self->_paths;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = *((float *)&v9 + 1);
    v9 = v9;
    v13 = *(_QWORD *)v27;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if (v15)
        {
          v16 = *(_QWORD *)(v15 + 56);
          if (v9 < v16)
          {
            v18 = *(_QWORD *)(v15 + 72);
            v19 = *(double *)(v18 + 8 * v9);
            v6 = v19 + *(double *)(v15 + 104);
            if (v9 < v16 - 1)
              v6 = v6 + (*(double *)(v18 + 8 * v9 + 8) - v19) * v12;

            return v6;
          }
        }
        else
        {
          v16 = 0;
        }
        v9 -= v16;
        ++v14;
      }
      while (v11 != v14);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v11 = v17;
      if (v17)
        continue;
      break;
    }
  }

  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self);
}

- (double)distanceToEndFromRouteCoordinate:(PolylineCoordinate)a3
{
  double v4;

  -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", a3);
  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self) - v4;
}

- (double)distanceBetweenRouteCoordinate:(PolylineCoordinate)a3 andRouteCoordinate:(PolylineCoordinate)a4
{
  double v6;
  double v7;
  double v8;

  -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", a3);
  v7 = v6;
  -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", a4);
  return v8 - v7;
}

- (double)distanceFromStartToStartOfPathIndex:(unint64_t)a3
{
  uint64_t v5;
  double v6;
  _QWORD *v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_paths, "count") <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray distanceFromStartToStartOfPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v12, 8u);
    }

    return 0.0;
  }
  if (!a3)
    return 0.0;
  v5 = 0;
  v6 = 0.0;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v5);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
    if (v7)
    {
      v9 = v7[10];
      if (v7[9] != v9)
        v8 = *(double *)(v9 - 8);
    }
    v6 = v6 + v8;

    ++v5;
  }
  while (a3 != v5);
  return v6;
}

- (double)distanceFromStartToEndOfPathIndex:(unint64_t)a3
{
  double v5;
  double v6;
  _QWORD *v7;
  double v8;
  uint64_t v9;
  double v10;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_paths, "count") <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13[0] = 67109120;
      v13[1] = a3;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray distanceFromStartToEndOfPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v13, 8u);
    }

    return 0.0;
  }
  else
  {
    -[GEOComposedRouteCoordinateArray distanceFromStartToStartOfPathIndex:](self, "distanceFromStartToStartOfPathIndex:", a3);
    v6 = v5;
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v8 = 0.0;
    if (v7)
    {
      v9 = v7[10];
      if (v7[9] != v9)
        v8 = *(double *)(v9 - 8);
    }
    v10 = v6 + v8;

  }
  return v10;
}

- (PolylineCoordinate)routeCoordinateForDistanceAfterStart:(double)a3
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, 0, a3);
}

- (unint64_t)_routeCoordinateForOffset:(double)a3 fromRouteCoordinate:
{
  unint64_t v3;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  int v25;
  float v26;
  unint64_t v27;
  int v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v27 = 0;
    LODWORD(v3) = 0;
    return v3 | v27;
  }
  v3 = a2;
  if (a3 != 0.0)
  {
    objc_msgSend(a1, "distanceFromStartToRouteCoordinate:", a2);
    v7 = v6 + a3;
    if (v6 + a3 <= 0.0)
    {
      v3 = 0;
    }
    else
    {
      if (v7 < -[GEOComposedRouteCoordinateArray _length]((uint64_t)a1))
      {
        v8 = objc_msgSend(a1, "pathIndexForRouteIndex:", v3);
        if (v8 < objc_msgSend(a1[1], "count"))
        {
          if (a3 <= 0.0)
          {
            if (a3 < 0.0)
            {
              while (v8 < objc_msgSend(a1[1], "count"))
              {
                objc_msgSend(a1[1], "objectAtIndexedSubscript:", v8);
                v14 = (double *)objc_claimAutoreleasedReturnValue();
                v15 = v14 ? v14[13] : 0.0;

                if (v7 >= v15)
                  break;
                --v8;
              }
            }
          }
          else
          {
            for (; v8 < objc_msgSend(a1[1], "count"); ++v8)
            {
              objc_msgSend(a1[1], "objectAtIndexedSubscript:", v8);
              v9 = objc_claimAutoreleasedReturnValue();
              if (v9)
              {
                v10 = *(_QWORD *)(v9 + 80);
                if (*(_QWORD *)(v9 + 72) == v10)
                  v11 = 0.0;
                else
                  v11 = *(double *)(v10 - 8);
                v12 = v11 + *(double *)(v9 + 104);
              }
              else
              {
                v12 = 0.0;
              }
              v13 = v12 - v7;

              if (v13 > -0.01)
                break;
            }
          }
          if (v8 >= objc_msgSend(a1[1], "count"))
          {
            GEOGetGEOComposedRouteLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              GEOPolylineCoordinateAsFullString(v3);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = 134218499;
              v30 = v8;
              v31 = 2113;
              v32 = v17;
              v33 = 2048;
              v34 = a3;
              _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_FAULT, "The resolved path index: %lu for route coordinate: %{private}@ and distance offset: %lf is out of bounds.", (uint8_t *)&v29, 0x20u);

            }
            --v8;
          }
          objc_msgSend(a1[1], "objectAtIndexedSubscript:", v8);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v18)
          {
            v7 = v7 - *(double *)(v18 + 104);
            v20 = *(_QWORD *)(v18 + 72);
            v21 = *(_QWORD *)(v18 + 56) - 1;
            if (v21 < 2)
            {
              v22 = 0;
              goto LABEL_39;
            }
          }
          else
          {
            v20 = 0;
            v21 = -1;
          }
          v22 = 0;
          do
          {
            if (v7 < *(double *)(v20 + 8 * ((v22 + v21) >> 1)))
              v21 = (v22 + v21) >> 1;
            else
              v22 = (v22 + v21) >> 1;
          }
          while (v22 + 1 < v21);
LABEL_39:
          v23 = *(double *)(v20 + 8 * v22);
          v24 = *(double *)(v20 + 8 * v21);
          v25 = objc_msgSend(a1, "routeIndexForLocalIndex:onPath:", v22, v8);
          if (v22 == v21 || vabdd_f64(v23, v24) < 1.0e-12)
          {
            v26 = 0.0;
          }
          else
          {
            v26 = (v7 - v23) / (v24 - v23);
            if (v26 >= 1.0)
            {
              v25 += vcvtms_u32_f32(v26);
              v26 = v26 - (float)floorf(v26);
            }
            if (v26 < 0.0)
            {
              v3 = 0xBF80000000000000;
              goto LABEL_43;
            }
          }
          v3 = (v25 + vcvtms_u32_f32(v26)) | ((unint64_t)COERCE_UNSIGNED_INT(v26 - floorf(v26)) << 32);
LABEL_43:

          goto LABEL_44;
        }
      }
      v3 = objc_msgSend(a1, "coordinateCount") - 1;
    }
  }
LABEL_44:
  v27 = v3 & 0xFFFFFFFF00000000;
  return v3 | v27;
}

- (PolylineCoordinate)routeCoordinateForDistanceBeforeEnd:(double)a3
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, -[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount")- 1, -a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, *(_QWORD *)&a4, a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, *(_QWORD *)&a4, -a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterStartOfPathIndex:(unint64_t)a4
{
  uint64_t v6;
  unsigned int v7;
  float v8;

  v6 = -[GEOComposedRouteCoordinateArray routeCoordinateRangeForPathIndex:](self, "routeCoordinateRangeForPathIndex:", a4);
  if (*((float *)&v6 + 1) < 0.0 || v8 < 0.0)
    return (PolylineCoordinate)0xBF80000000000000;
  if ((_DWORD)v6 != v7)
  {
    if (v6 < v7)
      return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:afterRouteCoordinate:](self, "routeCoordinateForDistance:afterRouteCoordinate:", a3);
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (*((float *)&v6 + 1) > v8)
    return (PolylineCoordinate)0xBF80000000000000;
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:afterRouteCoordinate:](self, "routeCoordinateForDistance:afterRouteCoordinate:", a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeEndOfPathIndex:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = -[GEOComposedRouteCoordinateArray routeCoordinateRangeForPathIndex:](self, "routeCoordinateRangeForPathIndex:", a4);
  if (*((float *)&v6 + 1) < 0.0 || *((float *)&v7 + 1) < 0.0)
    return (PolylineCoordinate)0xBF80000000000000;
  if ((_DWORD)v6 != (_DWORD)v7)
  {
    if (v6 < v7)
      return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:beforeRouteCoordinate:](self, "routeCoordinateForDistance:beforeRouteCoordinate:", v7, a3);
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (*((float *)&v6 + 1) > *((float *)&v7 + 1))
    return (PolylineCoordinate)0xBF80000000000000;
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:beforeRouteCoordinate:](self, "routeCoordinateForDistance:beforeRouteCoordinate:", v7, a3);
}

- (GEOPolylineCoordinateRange)routeCoordinateRangeForPathIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  PolylineCoordinate v8;
  PolylineCoordinate v9;
  NSObject *v10;
  _DWORD v11[2];
  uint64_t v12;
  GEOPolylineCoordinateRange result;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_paths, "count") <= a3)
  {
    GEOGetGEOComposedRouteLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray routeCoordinateRangeForPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v11, 8u);
    }

    v6 = 0xBF80000000000000;
    v7 = 0xBF80000000000000;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(_QWORD *)(v5 + 96);
      v7 = *(_QWORD *)(v5 + 96) + *(_DWORD *)(v5 + 56) - 1;
    }
    else
    {
      v6 = 0;
      v7 = 0xFFFFFFFFLL;
    }

  }
  v8 = (PolylineCoordinate)v6;
  v9 = (PolylineCoordinate)v7;
  result.end = v9;
  result.start = v8;
  return result;
}

- (unint64_t)routeIndexForLocalIndex:(unint64_t)a3 onPath:(unint64_t)a4
{
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  if (-[NSArray count](self->_paths, "count") <= a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a4);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7[7];

  if (v8 <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v9);
      v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = v11[7];
      else
        v12 = 0;
      v10 += v12;

      ++v9;
    }
    while (a4 != v9);
  }
  else
  {
    v10 = 0;
  }
  return v10 + a3;
}

- (unint64_t)pathIndexForRouteIndex:(unint64_t)a3
{
  unint64_t v3;
  NSArray *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_coordinateCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_paths;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      v9 = v5 + v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (v10)
        {
          v10 = *(_QWORD *)(v10 + 56);
          if (v3 < v10)
          {
            v9 = v6 + v8;
            goto LABEL_15;
          }
        }
        v3 -= v10;
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)pathIndexForRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;

  *(float *)&v3 = a3.offset;
  v4 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0)
    v5 = v4;
  else
    v5 = 0;
  return -[GEOComposedRouteCoordinateArray pathIndexForRouteIndex:](self, "pathIndexForRouteIndex:", v5, v3);
}

- (id)supportPointAtRouteCoordinate:(PolylineCoordinate)a3
{
  float v3;
  float v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  GEOCoordinateArraySupportPoint *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;

  if (a3.offset < 0.0
    || (v3 = floorf(a3.offset), vabds_f32(a3.offset, v3) >= 0.001)
    || (v5 = a3.offset - v3,
        v6 = vcvtms_u32_f32(a3.offset) + a3.index,
        v7 = -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", v6 | ((unint64_t)COERCE_UNSIGNED_INT(a3.offset - v3) << 32)), v7 >= -[NSArray count](self->_paths, "count")))
  {
    v16 = 0;
  }
  else
  {
    -[GEOComposedRouteCoordinateArray supportPointsForPathAtIndex:](self, "supportPointsForPathAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(GEOCoordinateArraySupportPoint);
    v10 = vcvtas_u32_f32(v5 + (float)v6);
    if (v5 >= 0.0)
      v11 = v10;
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = *(_QWORD *)(v12 + 96);
    else
      v14 = 0;
    -[GEOCoordinateArraySupportPoint setIndex:](v9, "setIndex:", v11 - v14);

    v15 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v8, "count"), 256, &__block_literal_global_109);
    if (v15 >= objc_msgSend(v8, "count"))
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v16;
}

uint64_t __79__GEOComposedRouteCoordinateArray_PathMatching__supportPointAtRouteCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

- (id)supportPointsForPathAtIndex:(unint64_t)a3
{
  id *v5;
  id v6;

  if (-[NSArray count](self->_paths, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = v5[8];

  }
  return v6;
}

- (id)supportPointsEncompassingRange:(GEOPolylineCoordinateRange)a3
{
  return -[GEOComposedRouteCoordinateArray _supportPointsForRange:shouldEncompassRange:](self, *(_QWORD *)&a3.start, *(_QWORD *)&a3.end, 1u);
}

- (id)_supportPointsForRange:(uint64_t)a3 shouldEncompassRange:(unsigned int)a4
{
  id v4;
  uint64_t v7;
  NSObject *v8;
  double v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v4 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = objc_msgSend(a1, "pathIndexForRouteCoordinate:", a2);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      GEOGetGEOComposedRouteLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        GEOPolylineCoordinateRangeAsString(a2, a3, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v26 = v10;
        v27 = 1024;
        v28 = objc_msgSend(v4, "coordinateCount");
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Could not get support points for %{private}@ because startIndex out of range. Coordinate count: %d", buf, 0x12u);

      }
LABEL_9:

      return 0;
    }
    v11 = v7;
    v12 = objc_msgSend(v4, "pathIndexForRouteCoordinate:", a3);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      GEOGetGEOComposedRouteLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        GEOPolylineCoordinateRangeAsString(a2, a3, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v26 = v14;
        v27 = 1024;
        v28 = objc_msgSend(v4, "coordinateCount");
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Could not get support points for %{private}@ because endIndex is out of range. Coordinate count: %d", buf, 0x12u);

      }
      goto LABEL_9;
    }
    v16 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 <= v16)
    {
      v17 = 0;
      do
      {
        objc_msgSend(v4, "supportPointsForPathAtIndex:", v11 + v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          v19 = v17 ? 0 : objc_msgSend(v4, "nearestSupportPointIndexForRouteCoordinate:beforeCoordinate:", a2, a4);
          v20 = v11 - v16 + v17
              ? objc_msgSend(v18, "count") - 1
              : objc_msgSend(v4, "nearestSupportPointIndexForRouteCoordinate:beforeCoordinate:", a3, a4 ^ 1);
          if (v19 < objc_msgSend(v18, "count") && v20 < objc_msgSend(v18, "count") && v20 >= v19)
          {
            objc_msgSend(v18, "subarrayWithRange:", v19, v20 - v19 + 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObjectsFromArray:", v21);

          }
        }

        ++v17;
      }
      while (v11 + v17 <= v16);
    }
    if (objc_msgSend(v23, "count"))
      v22 = v23;
    else
      v22 = 0;
    v4 = v22;

  }
  return v4;
}

- (id)supportPointsWithinRange:(GEOPolylineCoordinateRange)a3
{
  return -[GEOComposedRouteCoordinateArray _supportPointsForRange:shouldEncompassRange:](self, *(_QWORD *)&a3.start, *(_QWORD *)&a3.end, 0);
}

- (unint64_t)nearestSupportPointIndexForRouteCoordinate:(PolylineCoordinate)a3 beforeCoordinate:(BOOL)a4
{
  float v6;
  unint64_t v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  double v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  GEOCoordinateArraySupportPoint *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  int v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3.offset - floorf(a3.offset);
  v7 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0)
    v8 = v6;
  else
    v8 = -1.0;
  if (a3.offset >= 0.0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9 | ((unint64_t)LODWORD(v8) << 32);
  if (-[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount") - 1 < v9)
  {
    GEOGetGEOComposedRouteLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      GEOPolylineCoordinateAsString(v10, 1, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138478083;
      v28 = v13;
      v29 = 1024;
      v30 = -[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount");
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "nearestSupportPointIndexForRouteCoordinate: routeCoordinate %{private}@ is out of range. Coordinates count: %d", (uint8_t *)&v27, 0x12u);

    }
LABEL_27:
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_30;
  }
  v14 = -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", v10);
  -[GEOComposedRouteCoordinateArray supportPointsForPathAtIndex:](self, "supportPointsForPathAtIndex:", v14);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject count](v11, "count"))
  {
    GEOGetGEOComposedRouteLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = 67109120;
      LODWORD(v28) = v14;
      _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_ERROR, "nearestSupportPointIndexForRouteCoordinate: found no support points for path index: %d", (uint8_t *)&v27, 8u);
    }

    goto LABEL_27;
  }
  v15 = -[GEOComposedRouteCoordinateArray routeIndexForLocalIndex:onPath:](self, "routeIndexForLocalIndex:onPath:", 0, v14);
  v16 = objc_alloc_init(GEOCoordinateArraySupportPoint);
  v17 = v9 - v15;
  v18 = v17;
  if (!a4)
  {
    v19 = -[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount", v17);
    v18 = v17 + vcvtps_u32_f32(v8);
    if (v18 >= v19)
      v18 = -[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount");
  }
  -[GEOCoordinateArraySupportPoint setIndex:](v16, "setIndex:", v18);
  v20 = -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v11, "indexOfObject:inSortedRange:options:usingComparator:", v16, 0, -[NSObject count](v11, "count"), 1024, &__block_literal_global_150);
  if (v20 >= -[NSObject count](v11, "count"))
  {
    v20 = -[NSObject count](v11, "count") - 1;
  }
  else
  {
    -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 != objc_msgSend(v21, "index") && a4)
    {
      v22 = objc_msgSend(v21, "index");
      if (v20 <= 1)
        v23 = 1;
      else
        v23 = v20;
      v24 = v23 - 1;
      if (v22 > v17)
        v20 = v24;
      else
        v20 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
LABEL_30:

  return v20;
}

uint64_t __109__GEOComposedRouteCoordinateArray_PathMatching__nearestSupportPointIndexForRouteCoordinate_beforeCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

- (PolylineCoordinate)nearestSupportPointBeforeRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;

  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _nearestSupportPointRouteCoordinateForRouteCoordinate:beforeCoordinate:]((id *)&self->super.isa, *(_QWORD *)&a3, 1, v3);
}

- (unint64_t)_nearestSupportPointRouteCoordinateForRouteCoordinate:(uint64_t)a3 beforeCoordinate:(double)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!a1)
    return 0;
  LODWORD(a4) = HIDWORD(a2);
  if (*((float *)&a2 + 1) >= 0.0)
    v5 = (vcvtms_u32_f32(*((float *)&a2 + 1)) + a2) | ((unint64_t)COERCE_UNSIGNED_INT(*((float *)&a2 + 1)- floorf(*((float *)&a2 + 1))) << 32);
  else
    v5 = 0xBF80000000000000;
  v6 = objc_msgSend(a1, "nearestSupportPointIndexForRouteCoordinate:beforeCoordinate:", v5, a3, a4);
  v7 = objc_msgSend(a1, "pathIndexForRouteCoordinate:", v5);
  if (v7 >= objc_msgSend(a1[1], "count"))
    return 0xBF80000000000000;
  objc_msgSend(a1, "supportPointsForPathAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v8, "count"))
  {
    v10 = 0xBF80000000000000;
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "routeCoordinate");

  }
  return v10;
}

- (PolylineCoordinate)nearestSupportPointAfterRouteCoordinate:(PolylineCoordinate)a3
{
  double v3;

  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _nearestSupportPointRouteCoordinateForRouteCoordinate:beforeCoordinate:]((id *)&self->super.isa, *(_QWORD *)&a3, 0, v3);
}

- (GEOPolylineCoordinateRangeArray)noMatchRanges
{
  return self->_noMatchRanges;
}

- (BOOL)usesZilch
{
  return self->_usesZilch;
}

- (id)compressedZilchDataToEndOfPathFromIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  zilch::ControlPoint *v10;
  unint64_t v11;
  void *v12;

  if (self->_coordinateCount)
  {
    v5 = -[GEOComposedRouteCoordinateArray pathIndexForRouteIndex:](self, "pathIndexForRouteIndex:");
    v6 = -[GEOComposedRouteCoordinateArray _localCoordinateIndexForRouteIndex:]((uint64_t)self, a3);
    -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v5);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7[4];
    else
      v8 = 0;

    v9 = v6 + 1;
    v10 = (zilch::ControlPoint *)(v8 + 32 * v6);
    do
    {
      v11 = v9 - 1;
      if (!zilch::ControlPoint::dummy(v10))
        break;
      v10 = (zilch::ControlPoint *)((char *)v10 - 32);
      --v9;
    }
    while (v9);
    +[GEOPointUtility compressedZilchDataFromPoints:fromPointIndex:pointCount:](GEOPointUtility, "compressedZilchDataFromPoints:fromPointIndex:pointCount:", v8, v11, -[GEOComposedRouteCoordinateArray coordinateCountForPathAtIndex:](self, "coordinateCountForPathAtIndex:", v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (ControlPoint)zilchControlPointAt:(SEL)a3
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  ControlPoint *result;

  v7 = -[GEOComposedRouteCoordinateArray pathIndexForRouteIndex:](self, "pathIndexForRouteIndex:");
  v8 = -[GEOComposedRouteCoordinateArray _localCoordinateIndexForRouteIndex:]((uint64_t)self, a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return (ControlPoint *)zilch::ControlPoint::null((zilch::ControlPoint *)retstr);
  v9 = v8;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return (ControlPoint *)zilch::ControlPoint::null((zilch::ControlPoint *)retstr);
  -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", v7);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v10[4];
  else
    v11 = 0;
  v12 = (_OWORD *)(v11 + 32 * v9);
  v13 = v12[1];
  *(_OWORD *)&retstr->var0 = *v12;
  *(_OWORD *)&retstr->var2.var0 = v13;

  return result;
}

- (RoutingPathLeg)routingPathFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 convertEndpointsToSupportPoints:(BOOL)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  RoutingPathLeg *result;
  RoutingPathLeg *v14;
  unint64_t v15;

  v7 = a7;
  v8 = a6;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  result = -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", a4);
  v14 = result;
  if (result != (RoutingPathLeg *)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -[GEOComposedRouteCoordinateArray coordinateCountForPathAtIndex:](self, "coordinateCountForPathAtIndex:", result);
    if (v14 != (RoutingPathLeg *)-[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", a5))a5 = (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeIndexForLocalIndex:onPath:](self, "routeIndexForLocalIndex:onPath:", v15 - 1, v14);
    if (!v7)
    {
      a4.index = -[GEOComposedRouteCoordinateArray nearestSupportPointBeforeRouteCoordinate:](self, "nearestSupportPointBeforeRouteCoordinate:", a4);
      a5.index = -[GEOComposedRouteCoordinateArray nearestSupportPointAfterRouteCoordinate:](self, "nearestSupportPointAfterRouteCoordinate:", a5);
    }
    return (RoutingPathLeg *)-[GEOComposedRouteCoordinateArray _populateRoutingPathWithCoordinate:pathIndex:startIndex:endIndex:distanceFromStartOffset:supportPointsOnly:convertEndpointsToSupportPoints:](self, "_populateRoutingPathWithCoordinate:pathIndex:startIndex:endIndex:distanceFromStartOffset:supportPointsOnly:convertEndpointsToSupportPoints:", retstr, v14, a4.index, a5.index, v8, v7, 0.0);
  }
  return result;
}

- (RoutingPathLeg)routingPathWithSupportPointFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 startPathSegment:(BOOL)a6
{
  uint64_t v7;
  float v12;
  unsigned int v13;
  uint64_t v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  PolylineCoordinate v19;
  unint64_t v20;
  PolylineCoordinate v21;
  double v22;
  NSObject *v23;
  double v24;
  void *v25;
  PolylineCoordinate v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t index;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  long double v40;
  double v41;
  double v42;
  Rep *var3;
  int var1;
  int v45;
  uint64_t v46;
  Rep *v47;
  uint64_t v48;
  int v49;
  _DWORD *v50;
  uint64_t v51;
  google::protobuf::internal::ArenaImpl *v52;
  int v53;
  int v54;
  int v55;
  PolylineCoordinate v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int v61;
  int v62;
  Rep *v63;
  int v64;
  int var2;
  uint64_t v66;
  Rep *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _DWORD *v75;
  uint64_t v76;
  google::protobuf::internal::ArenaImpl *v77;
  int v78;
  int v79;
  NSObject *v80;
  double v81;
  id v82;
  void *v83;
  int v84;
  RoutingPathLeg *result;
  unsigned int v86;
  unint64_t v87;
  unsigned int v88;
  unint64_t v89;
  id v90;
  google::protobuf::internal::ArenaImpl **p_var4;
  uint8_t buf[4];
  _BYTE v93[10];
  __int16 v94;
  unsigned int v95;
  __int16 v96;
  id v97;
  __int16 v98;
  int v99;
  uint64_t v100;

  v7 = a6;
  v100 = *MEMORY[0x1E0C80C00];
  v90 = a7;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  v12 = a4.offset - floorf(a4.offset);
  v13 = vcvtms_u32_f32(a4.offset) + a4.index;
  if (a4.offset >= 0.0)
    v14 = v13;
  else
    v14 = 0;
  if (a4.offset >= 0.0)
    v15 = v12;
  else
    v15 = -1.0;
  v16 = -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", v14 | ((unint64_t)LODWORD(v15) << 32));
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 != -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", a5))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "start and end coordinate span a path boundary. Caller should make sure start and end coordinate are within the same path. Trimming and attempting to continue.", buf, 2u);
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex == [self pathIndexForRouteCoordinate:end]", buf, 2u);
      }
    }
    v17 = -[GEOComposedRouteCoordinateArray pathIndexForRouteCoordinate:](self, "pathIndexForRouteCoordinate:", a5);
    v18 = v16;
    v19 = a5;
    v89 = v18;
    if (v18 != v17)
      v19 = (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeIndexForLocalIndex:onPath:](self, "routeIndexForLocalIndex:onPath:", -[GEOComposedRouteCoordinateArray coordinateCountForPathAtIndex:](self, "coordinateCountForPathAtIndex:", v18)- 1, v18);
    v20 = (v14 + 1);
    v21 = -[GEOComposedRouteCoordinateArray nearestSupportPointAfterRouteCoordinate:](self, "nearestSupportPointAfterRouteCoordinate:", v20);
    *(float *)&v22 = v21.offset;
    if (v21.offset < 0.0)
    {
      GEOGetGEOComposedRouteLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        GEOPolylineCoordinateAsString(v14 | ((unint64_t)LODWORD(v15) << 32), 1, 0, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)v93 = v25;
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "start coordinate [%{private}@] is at the end of the route. Returning empty path.", buf, 0xCu);

      }
      goto LABEL_66;
    }
    v26 = v21;
    v88 = -[GEOComposedRouteCoordinateArray nearestSupportPointAfterRouteCoordinate:](self, "nearestSupportPointAfterRouteCoordinate:", v19, v22);
    v87 = v14 | ((unint64_t)LODWORD(v15) << 32);
    -[GEOComposedRouteCoordinateArray supportPointAtRouteCoordinate:](self, "supportPointAtRouteCoordinate:", v87);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = vcvtas_u32_f32(v15 + (float)v14);
    if (v15 >= 0.0)
      index = v29;
    else
      index = 0x7FFFFFFFFFFFFFFFLL;
    if (v27)
    {
      v31 = 0.0;
LABEL_61:
      -[GEOComposedRouteCoordinateArray _populateRoutingPathWithCoordinate:pathIndex:startIndex:endIndex:distanceFromStartOffset:supportPointsOnly:convertEndpointsToSupportPoints:](self, "_populateRoutingPathWithCoordinate:pathIndex:startIndex:endIndex:distanceFromStartOffset:supportPointsOnly:convertEndpointsToSupportPoints:", retstr, v89, index, v88, v7, 0, v31);
      if (retstr->var4.var1 <= 1)
      {
        GEOGetGEOComposedRouteLog();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          GEOPolylineCoordinateRangeAsString(*(_QWORD *)&a4, *(_QWORD *)&a5, v81);
          v82 = (id)objc_claimAutoreleasedReturnValue();
          -[GEOComposedRouteCoordinateArray supportPointsForPathAtIndex:](self, "supportPointsForPathAtIndex:", v89);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "count");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v93 = v89;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = index;
          v94 = 1024;
          v95 = v88;
          v96 = 2112;
          v97 = v82;
          v98 = 1024;
          v99 = v84;
          _os_log_impl(&dword_1885A9000, v80, OS_LOG_TYPE_FAULT, "Routing path leg with fewer than 2 points. pathIndex:%d startIndex:%d endIndex:%d originalRange:[%@] supportPoints:%d", buf, 0x24u);

        }
      }

      goto LABEL_66;
    }
    -[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:](self, "coordinateForRouteCoordinate:", v87);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:](self, "coordinateForRouteCoordinate:", (v14 + 1));
    v40 = GEOBearingFromCoordinateToCoordinate(v33, v35, v38, v39);
    v41 = fmod(v40, 360.0);
    if (v41 >= 0.0)
      v42 = v41;
    else
      v42 = v41 + 360.0;
    p_var4 = (google::protobuf::internal::ArenaImpl **)&retstr->var4;
    var3 = retstr->var4.var3;
    v86 = v7;
    if (var3)
    {
      var1 = retstr->var4.var1;
      v45 = *(_DWORD *)var3;
      if (var1 < *(_DWORD *)var3)
      {
        retstr->var4.var1 = var1 + 1;
        v46 = *((_QWORD *)var3 + var1 + 1);
        goto LABEL_32;
      }
      if (v45 != retstr->var4.var2)
      {
LABEL_31:
        *(_DWORD *)var3 = v45 + 1;
        v46 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*p_var4);
        v47 = retstr->var4.var3;
        v48 = retstr->var4.var1;
        retstr->var4.var1 = v48 + 1;
        *((_QWORD *)v47 + v48 + 1) = v46;
LABEL_32:
        v49 = *(_DWORD *)(v46 + 16);
        *(_DWORD *)(v46 + 84) = 1;
        *(_DWORD *)(v46 + 16) = v49 | 0x802;
        v50 = *(_DWORD **)(v46 + 32);
        if (!v50)
        {
          v51 = *(_QWORD *)(v46 + 8);
          v52 = (google::protobuf::internal::ArenaImpl *)(v51 & 0xFFFFFFFFFFFFFFFELL);
          if ((v51 & 1) != 0)
            v52 = *(google::protobuf::internal::ArenaImpl **)v52;
          v50 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v52);
          *(_QWORD *)(v46 + 32) = v50;
        }
        v53 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v33);
        v50[4] |= 1u;
        v50[6] = v53;
        v54 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v35);
        v50[4] |= 2u;
        v50[7] = v54;
        v55 = *(_DWORD *)(v46 + 16);
        *(_DWORD *)(v46 + 56) = (int)(v37 * 100.0);
        *(_DWORD *)(v46 + 60) = vcvtad_u64_f64(v42);
        *(_DWORD *)(v46 + 16) = v55 | 0x130;
        *(_DWORD *)(v46 + 72) = 0;
        v56 = v26;
        if (v90)
        {
          v57 = objc_msgSend(v90, "startRouteCoordinate");
          if (v14 > v57 || (_DWORD)v14 == (_DWORD)v57 && v15 >= *((float *)&v57 + 1))
          {
            v58 = objc_msgSend(v90, "endRouteCoordinate");
            if (v14 < v58 || (_DWORD)v14 == (_DWORD)v58 && v15 <= *((float *)&v58 + 1))
            {
              objc_msgSend(v90, "road");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "signedMuid");
              *(_DWORD *)(v46 + 16) |= 8u;
              *(_QWORD *)(v46 + 48) = v60;
              v61 = objc_msgSend(v59, "formOfWay");
              *(_DWORD *)(v46 + 16) |= 0x80u;
              *(_DWORD *)(v46 + 68) = v61;
              v62 = objc_msgSend(v59, "roadClass");
              *(_DWORD *)(v46 + 16) |= 0x40u;
              *(_DWORD *)(v46 + 64) = v62;

            }
          }
        }
        index = v26.index;
        if ((v86 & 1) != 0 || v26.index <= v20)
        {
LABEL_60:
          -[GEOComposedRouteCoordinateArray distanceBetweenRouteCoordinate:andRouteCoordinate:](self, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v87, v56);
          v28 = 0;
          v7 = v86;
          goto LABEL_61;
        }
        while (1)
        {
          v63 = retstr->var4.var3;
          if (!v63)
            break;
          v64 = retstr->var4.var1;
          var2 = *(_DWORD *)v63;
          if (v64 >= *(_DWORD *)v63)
          {
            if (var2 == retstr->var4.var2)
            {
LABEL_51:
              if (v64 <= var2)
              {
                google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)p_var4, var2 - v64 + 1);
                v63 = retstr->var4.var3;
              }
              var2 = *(_DWORD *)v63;
            }
            *(_DWORD *)v63 = var2 + 1;
            v66 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*p_var4);
            v67 = retstr->var4.var3;
            v68 = retstr->var4.var1;
            retstr->var4.var1 = v68 + 1;
            *((_QWORD *)v67 + v68 + 1) = v66;
            goto LABEL_55;
          }
          retstr->var4.var1 = v64 + 1;
          v66 = *((_QWORD *)v63 + v64 + 1);
LABEL_55:
          *(_DWORD *)(v66 + 16) |= 0x800u;
          *(_DWORD *)(v66 + 84) = 2;
          -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v20);
          v70 = v69;
          v72 = v71;
          v74 = v73;
          *(_DWORD *)(v66 + 16) |= 2u;
          v75 = *(_DWORD **)(v66 + 32);
          if (!v75)
          {
            v76 = *(_QWORD *)(v66 + 8);
            v77 = (google::protobuf::internal::ArenaImpl *)(v76 & 0xFFFFFFFFFFFFFFFELL);
            if ((v76 & 1) != 0)
              v77 = *(google::protobuf::internal::ArenaImpl **)v77;
            v75 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v77);
            *(_QWORD *)(v66 + 32) = v75;
          }
          v78 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v70);
          v75[4] |= 1u;
          v75[6] = v78;
          v79 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", v72);
          v75[4] |= 2u;
          v75[7] = v79;
          *(_DWORD *)(v66 + 16) |= 0x10u;
          *(_DWORD *)(v66 + 56) = (int)(v74 * 100.0);
          ++v20;
          v56 = v26;
          if (v26.index == v20)
            goto LABEL_60;
        }
        v64 = retstr->var4.var1;
        var2 = retstr->var4.var2;
        goto LABEL_51;
      }
    }
    else
    {
      var1 = retstr->var4.var1;
      v45 = retstr->var4.var2;
    }
    if (var1 <= v45)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)p_var4, v45 - var1 + 1);
      var3 = retstr->var4.var3;
    }
    v45 = *(_DWORD *)var3;
    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "start coordinate is not within range of route", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex != NSNotFound", buf, 2u);
  }
LABEL_66:

  return result;
}

- (RoutingPathLeg)routingPathDataWithinSupportPoints:(SEL)a3 supportPointsOnly:(id)a4
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSObject *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  RoutingPathLeg *result;
  _DWORD v38[2];
  __int16 v39;
  void *v40;
  uint64_t v41;

  v5 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    goto LABEL_16;
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", objc_msgSend(v9, "routeCoordinate"));
  v11 = v10;

  objc_msgSend(v8, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "routeCoordinate");
  objc_msgSend(v8, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", v15, objc_msgSend(v16, "routeCoordinate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  while (1)
  {

    if (!objc_msgSend(v17, "isCurrentValid"))
      break;
    v18 = objc_msgSend(v17, "current");
    -[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:](self, "coordinateForRouteCoordinate:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(v17, "current");
    v26 = objc_msgSend(v13, "routeCoordinate");
    if (vabds_f32((float)v25 + *((float *)&v25 + 1), (float)v26 + *((float *)&v26 + 1)) >= 0.001)
    {
      v14 = 0;
      if (v5)
      {
LABEL_8:
        if (!v14)
          goto LABEL_10;
      }
    }
    else
    {
      v14 = v13;
      objc_msgSend(v12, "nextObject");
      v27 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v27;
      if (v5)
        goto LABEL_8;
    }
    -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", v18);
    -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", retstr, v14, v20, v22, v24, v28 - v11);
LABEL_10:
    objc_msgSend(v17, "advance");
  }
  if (retstr->var4.var1 <= 1)
  {
    GEOGetGEOComposedRouteLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      v30 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "routeCoordinate");
      objc_msgSend(v8, "lastObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "routeCoordinate");
      GEOPolylineCoordinateRangeAsString(v32, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = 67109378;
      v38[1] = v30;
      v39 = 2112;
      v40 = v36;
      _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_FAULT, "Routing path leg with fewer than 2 points. Support points: %d, range: %@", (uint8_t *)v38, 0x12u);

    }
  }

LABEL_16:
  return result;
}

- (id)compressedDataForRoutingPath:(const void *)a3
{
  void *v3;
  _BYTE v5[64];

  +[PathCodec compress:]((const maps::path_codec::geo3::RoutingPathLeg *)a3, (maps::path_codec::geo3::RoutingPathLeg *)v5);
  +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v5);
  return v3;
}

- (id)routingPathDataFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5
{
  void *v6;
  _BYTE v8[64];

  -[GEOComposedRouteCoordinateArray routingPathFromStart:toEnd:supportPointsOnly:convertEndpointsToSupportPoints:](self, "routingPathFromStart:toEnd:supportPointsOnly:convertEndpointsToSupportPoints:", a3, a4, a5, 0);
  -[GEOComposedRouteCoordinateArray compressedDataForRoutingPath:](self, "compressedDataForRoutingPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v8);
  return v6;
}

- (id)routingPathDataWithSupportPointFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5 startPathSegment:(id)a6
{
  void *v7;
  _BYTE v9[64];

  -[GEOComposedRouteCoordinateArray routingPathWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:](self, "routingPathWithSupportPointFromStart:toEnd:supportPointsOnly:startPathSegment:", a3, a4, a5, a6);
  -[GEOComposedRouteCoordinateArray compressedDataForRoutingPath:](self, "compressedDataForRoutingPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v9);
  return v7;
}

- (void)_populateRoutingPathWithCoordinate:(void *)a3 pathIndex:(unint64_t)a4 startIndex:(unint64_t)a5 endIndex:(unint64_t)a6 distanceFromStartOffset:(double)a7 supportPointsOnly:(BOOL)a8 convertEndpointsToSupportPoints:(BOOL)a9
{
  _BOOL4 v9;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  GEOCoordinateArraySupportPoint *v29;
  double v30;
  double v31;
  long double v32;
  double v33;
  double v34;
  double v35;
  long double v36;
  unint64_t v37;
  id v38;

  v9 = a9;
  -[GEOComposedRouteCoordinateArray supportPointsForPathAtIndex:](self, "supportPointsForPathAtIndex:", a4);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "count"))
  {
    objc_msgSend(v38, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nextObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 <= a6)
    {
      v37 = a5 + 1;
      v18 = a5;
      while (v17)
      {
        while (v18 > objc_msgSend(v17, "routeCoordinate", v37))
        {
          objc_msgSend(v16, "nextObject");
          v19 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v19;
          if (!v19)
            goto LABEL_11;
        }
        if (v18 != objc_msgSend(v17, "routeCoordinate"))
          break;
        -[GEOComposedRouteCoordinateArray distanceBetweenIndex:andIndex:](self, "distanceBetweenIndex:andIndex:", a5, v18);
        -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v18);
        -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, v17);
        if (a8)
        {
          objc_msgSend(v16, "nextObject");
          v20 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v20;
LABEL_26:
          if (!v17)
            goto LABEL_30;
          v18 = objc_msgSend(v17, "routeCoordinate");
          goto LABEL_29;
        }
LABEL_28:
        ++v18;
LABEL_29:
        if (v18 > a6)
          goto LABEL_30;
      }
LABEL_11:
      if (!v9 || v18 != a5 && v18 != a6)
      {
        if (a8)
          goto LABEL_26;
        -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v18);
        -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, 0);
        goto LABEL_28;
      }
      -[GEOComposedRouteCoordinateArray distanceBetweenIndex:andIndex:](self, "distanceBetweenIndex:andIndex:", a5, v18, v37);
      v22 = v21;
      -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v18);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v29 = objc_alloc_init(GEOCoordinateArraySupportPoint);
      if (v18 == a5)
      {
        if (-[GEOComposedRouteCoordinateArray coordinateCount](self, "coordinateCount") - 1 <= a5)
          goto LABEL_25;
        -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v37);
        v32 = GEOBearingFromCoordinateToCoordinate(v24, v26, v30, v31);
        v33 = fmod(v32, 360.0);
        if (v33 < 0.0)
          v33 = v33 + 360.0;
      }
      else
      {
        if (!v18)
          goto LABEL_25;
        -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v18 - 1);
        v36 = GEOBearingFromCoordinateToCoordinate(v34, v35, v24, v26);
        v33 = fmod(v36, 360.0);
        if (v33 < 0.0)
          v33 = v33 + 360.0;
      }
      -[GEOCoordinateArraySupportPoint setHeading:](v29, "setHeading:", v33);
LABEL_25:
      -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, v29, v24, v26, v28, v22 + a7);

      if (a8)
        goto LABEL_26;
      goto LABEL_28;
    }
LABEL_30:

  }
}

- (void)_addPointToRoutingPath:(void *)a3 coordinate:(id)a4 supportPoint:(id)a5 distanceFromStart:(double)a6
{
  double var2;
  double var1;
  double var0;
  id v11;
  int *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  google::protobuf::internal::ArenaImpl *v20;
  int v21;
  int v22;
  int v23;
  double v24;
  char v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  Arena *v32;
  uint64_t OwnedMessageInternal;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  google::protobuf::internal *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;

  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a5;
  v12 = (int *)*((_QWORD *)a3 + 5);
  if (!v12)
  {
    v13 = *((_DWORD *)a3 + 8);
    v14 = *((_DWORD *)a3 + 9);
LABEL_6:
    if (v13 <= v14)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 24), v14 - v13 + 1);
      v12 = (int *)*((_QWORD *)a3 + 5);
    }
    v14 = *v12;
    goto LABEL_9;
  }
  v13 = *((_DWORD *)a3 + 8);
  v14 = *v12;
  if (v13 < *v12)
  {
    *((_DWORD *)a3 + 8) = v13 + 1;
    v15 = *(_QWORD *)&v12[2 * v13 + 2];
    goto LABEL_10;
  }
  if (v14 == *((_DWORD *)a3 + 9))
    goto LABEL_6;
LABEL_9:
  *v12 = v14 + 1;
  v15 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*((google::protobuf::internal::ArenaImpl **)a3
                                                                                              + 3));
  v16 = *((_QWORD *)a3 + 5);
  v17 = *((int *)a3 + 8);
  *((_DWORD *)a3 + 8) = v17 + 1;
  *(_QWORD *)(v16 + 8 * v17 + 8) = v15;
LABEL_10:
  *(_DWORD *)(v15 + 16) |= 2u;
  v18 = *(_DWORD **)(v15 + 32);
  if (!v18)
  {
    v19 = *(_QWORD *)(v15 + 8);
    v20 = (google::protobuf::internal::ArenaImpl *)(v19 & 0xFFFFFFFFFFFFFFFELL);
    if ((v19 & 1) != 0)
      v20 = *(google::protobuf::internal::ArenaImpl **)v20;
    v18 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v20);
    *(_QWORD *)(v15 + 32) = v18;
  }
  v21 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", var0);
  v18[4] |= 1u;
  v18[6] = v21;
  v22 = +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", var1);
  v18[4] |= 2u;
  v18[7] = v22;
  v23 = *(_DWORD *)(v15 + 16);
  *(_DWORD *)(v15 + 56) = (int)(var2 * 100.0);
  *(_DWORD *)(v15 + 16) = v23 | 0x810;
  if (v11)
  {
    *(_DWORD *)(v15 + 84) = 1;
    objc_msgSend(v11, "heading");
    *(_DWORD *)(v15 + 16) |= 0x20u;
    *(_DWORD *)(v15 + 60) = v24;
    v25 = objc_msgSend(v11, "isUTurn");
    v26 = *(_DWORD *)(v15 + 16);
    *(_BYTE *)(v15 + 76) = v25;
    *(_DWORD *)(v15 + 16) = v26 | 0x300;
    *(_DWORD *)(v15 + 72) = (a6 * 100.0);
    if (objc_msgSend(v11, "roadID"))
    {
      v27 = objc_msgSend(v11, "roadID");
      *(_DWORD *)(v15 + 16) |= 8u;
      *(_QWORD *)(v15 + 48) = v27;
    }
    if (objc_msgSend(v11, "legacyRoadClass") != 9)
    {
      v28 = objc_msgSend(v11, "legacyRoadClass");
      *(_DWORD *)(v15 + 16) |= 0x40u;
      *(_DWORD *)(v15 + 64) = v28;
    }
    if (objc_msgSend(v11, "legacyFormOfWay"))
    {
      v29 = objc_msgSend(v11, "legacyFormOfWay");
      *(_DWORD *)(v15 + 16) |= 0x80u;
      *(_DWORD *)(v15 + 68) = v29;
    }
    objc_msgSend(v11, "anchorPointID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v40 = 0;
      v41 = 0;
      objc_msgSend(v11, "anchorPointID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_geo_getHighBytes:lowBytes:", &v41, &v40);

      OwnedMessageInternal = operator new();
      *(_QWORD *)OwnedMessageInternal = &off_1E1BF6EB8;
      *(_QWORD *)(OwnedMessageInternal + 8) = 0;
      v35 = v40;
      v34 = v41;
      *(_QWORD *)(OwnedMessageInternal + 16) = 3;
      *(_QWORD *)(OwnedMessageInternal + 24) = v34;
      *(_QWORD *)(OwnedMessageInternal + 32) = v35;
      v36 = *(_QWORD *)(v15 + 8);
      v37 = (google::protobuf::internal *)(v36 & 0xFFFFFFFFFFFFFFFELL);
      if ((v36 & 1) != 0)
      {
        v37 = *(google::protobuf::internal **)v37;
        if (v37)
          goto LABEL_24;
      }
      else if (v37)
      {
LABEL_24:
        OwnedMessageInternal = (uint64_t)google::protobuf::internal::GetOwnedMessageInternal(v37, (Arena *)OwnedMessageInternal, 0, v32);
LABEL_29:
        *(_DWORD *)(v15 + 16) |= 4u;
        *(_QWORD *)(v15 + 40) = OwnedMessageInternal;
        goto LABEL_30;
      }
      v38 = *(_QWORD *)(v15 + 40);
      if (v38)
      {
        google::protobuf::internal::InternalMetadata::Delete<google::protobuf::UnknownFieldSet>((uint64_t *)(v38 + 8));
        MEMORY[0x18D76437C](v38, 0x1081C40825B58B5);
      }
      goto LABEL_29;
    }
  }
  else
  {
    *(_DWORD *)(v15 + 84) = 2;
  }
LABEL_30:

  return (void *)v15;
}

@end
