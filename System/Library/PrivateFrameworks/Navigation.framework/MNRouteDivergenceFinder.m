@implementation MNRouteDivergenceFinder

- (MNRouteDivergenceFinder)init
{
  MNRouteDivergenceFinder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MNRouteDivergenceFinder;
  result = -[MNRouteDivergenceFinder init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_toleranceMeters = xmmword_1B0BF3380;
    result->_distancePaddingWhenAlternating = 20.0;
  }
  return result;
}

- (id)findFirstDivergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)findFirstConvergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  -[MNRouteDivergenceFinder findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", a3, 0, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)findFirstDivergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  MNRouteDivergenceResult *v14;
  void *v15;
  MNRouteDivergenceResult *v16;
  void *v17;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v19 = 0xBF80000000000000;
    v20 = 0xBF80000000000000;
    -[MNRouteDivergenceFinder _findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](self, "_findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v10, a4, objc_msgSend(v10, "endRouteCoordinate"), v11, a6, objc_msgSend(v11, "endRouteCoordinate"), &v20, &v19);
    v14 = objc_alloc_init(MNRouteDivergenceResult);
    objc_msgSend(v10, "uniqueRouteID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceResult setRouteID:](v14, "setRouteID:", v15);

    -[MNRouteDivergenceResult setRouteCoordinate:](v14, "setRouteCoordinate:", v20);
    objc_msgSend(v10, "pointAtRouteCoordinate:", v20);
    -[MNRouteDivergenceResult setLocationCoordinate:](v14, "setLocationCoordinate:");
    -[MNRouteDivergenceResult setResultType:](v14, "setResultType:", GEOPolylineCoordinateIsValid());
    v16 = objc_alloc_init(MNRouteDivergenceResult);
    objc_msgSend(v12, "uniqueRouteID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceResult setRouteID:](v16, "setRouteID:", v17);

    -[MNRouteDivergenceResult setRouteCoordinate:](v16, "setRouteCoordinate:", v19);
    objc_msgSend(v12, "pointAtRouteCoordinate:", v19);
    -[MNRouteDivergenceResult setLocationCoordinate:](v16, "setLocationCoordinate:");
    -[MNRouteDivergenceResult setResultType:](v16, "setResultType:", GEOPolylineCoordinateIsValid());
    v21[0] = v14;
    v21[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  MNRouteDivergenceResult *v14;
  void *v15;
  uint64_t v16;
  MNRouteDivergenceResult *v17;
  void *v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v21 = 0xBF80000000000000;
    v22 = 0xBF80000000000000;
    -[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:outRouteCoordinate:outRouteCoordinate:](self, "_findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:outRouteCoordinate:outRouteCoordinate:", v10, a4, v11, a6, &v22, &v21);
    v14 = objc_alloc_init(MNRouteDivergenceResult);
    objc_msgSend(v10, "uniqueRouteID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceResult setRouteID:](v14, "setRouteID:", v15);

    -[MNRouteDivergenceResult setRouteCoordinate:](v14, "setRouteCoordinate:", v22);
    objc_msgSend(v10, "pointAtRouteCoordinate:", v22);
    -[MNRouteDivergenceResult setLocationCoordinate:](v14, "setLocationCoordinate:");
    if (GEOPolylineCoordinateIsValid())
      v16 = 2;
    else
      v16 = 0;
    -[MNRouteDivergenceResult setResultType:](v14, "setResultType:", v16);
    v17 = objc_alloc_init(MNRouteDivergenceResult);
    objc_msgSend(v12, "uniqueRouteID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceResult setRouteID:](v17, "setRouteID:", v18);

    -[MNRouteDivergenceResult setRouteCoordinate:](v17, "setRouteCoordinate:", v21);
    objc_msgSend(v12, "pointAtRouteCoordinate:", v21);
    -[MNRouteDivergenceResult setLocationCoordinate:](v17, "setLocationCoordinate:");
    if (GEOPolylineCoordinateIsValid())
      v19 = 2;
    else
      v19 = 0;
    -[MNRouteDivergenceResult setResultType:](v17, "setResultType:", v19);
    v23[0] = v14;
    v23[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)findFirstUniqueRangeBetweenRoute:(id)a3 andRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MNRouteOverlapResult *v10;
  void *v11;
  MNRouteOverlapResult *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = objc_alloc_init(MNRouteOverlapResult);
    objc_msgSend(v6, "uniqueRouteID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteOverlapResult setRouteID:](v10, "setRouteID:", v11);

    -[MNRouteOverlapResult setRouteRange:](v10, "setRouteRange:", 0, objc_msgSend(v6, "endRouteCoordinate"));
    v12 = objc_alloc_init(MNRouteOverlapResult);
    objc_msgSend(v8, "uniqueRouteID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteOverlapResult setRouteID:](v12, "setRouteID:", v13);

    -[MNRouteOverlapResult setRouteRange:](v12, "setRouteRange:", 0, objc_msgSend(v8, "endRouteCoordinate"));
    v29[0] = v10;
    v29[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:andRoute:](self, "findFirstDivergenceBetweenRoute:andRoute:", v6, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "routeCoordinate");

    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "routeCoordinate");

    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0 && (GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      -[MNRouteDivergenceFinder findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, objc_msgSend(v6, "routeCoordinateForDistance:afterRouteCoordinate:", v16, self->_distancePaddingWhenAlternating), v8, objc_msgSend(v8, "routeCoordinateForDistance:afterRouteCoordinate:", v18, self->_distancePaddingWhenAlternating));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "routeCoordinate");

      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v21, "routeCoordinate");

      if ((GEOPolylineCoordinateIsInvalid() & 1) != 0 || GEOPolylineCoordinateIsInvalid())
      {
        v20 = objc_msgSend(v6, "endRouteCoordinate");
        v28 = objc_msgSend(v8, "endRouteCoordinate");
      }
      v22 = objc_alloc_init(MEMORY[0x1E0D27378]);
      -[MNRouteOverlapResult setUniqueRanges:](v10, "setUniqueRanges:", v22);

      -[MNRouteOverlapResult uniqueRanges](v10, "uniqueRanges");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addCoordinateRange:", v16, v20);

      v24 = objc_alloc_init(MEMORY[0x1E0D27378]);
      -[MNRouteOverlapResult setUniqueRanges:](v12, "setUniqueRanges:", v24);

      -[MNRouteOverlapResult uniqueRanges](v12, "uniqueRanges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addCoordinateRange:", v18, v28);

    }
  }

  return v9;
}

- (id)findAllDivergenceConvergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int IsValid;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  char *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char IsInvalid;
  uint64_t v38;
  void *v39;
  BOOL v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  _QWORD *v52;
  _OWORD *v53;
  MNRouteDivergenceResults *v54;
  void *v55;
  MNRouteDivergenceResults *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  unint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  _QWORD v66[2];
  __int128 buf;
  uint64_t v68;
  _QWORD v69[3];

  v69[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0;
  v64 = v7;
  if (v6 && v7)
  {
    MNGetMNRouteDivergenceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_make_with_pointer(v9, self);

    MNGetMNRouteDivergenceLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v61 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v69[0] = v6;
      v69[1] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNRouteDivergenceFinder _routesArrayIdentifierStrings:](self, "_routesArrayIdentifierStrings:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "findAllDivergenceConvergenceBetweenRoute", "%@", (uint8_t *)&buf, 0xCu);

    }
    *((_QWORD *)&buf + 1) = 0;
    v68 = 0;
    *(_QWORD *)&buf = (char *)&buf + 8;
    -[MNRouteDivergenceFinder findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, 0, v64, 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "count") == 2)
    {
      objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "routeCoordinate");
      IsValid = GEOPolylineCoordinateIsValid();

      if (IsValid)
      {
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "routeCoordinate");
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
        *(_QWORD *)&v65 = v19;
        *((_QWORD *)&v65 + 1) = objc_claimAutoreleasedReturnValue();
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v18, v18, &v65, *((float *)&v18 + 1));

      }
    }
    -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, 0, v64, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v62, "count") == 2)
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "routeCoordinate");
      v21 = GEOPolylineCoordinateIsValid();

      if (v21)
      {
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "routeCoordinate");
        objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectAtIndexedSubscript:", 1);
        v25 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v65 = v24;
        *((_QWORD *)&v65 + 1) = v25;
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v23, v23, &v65, *((float *)&v23 + 1));

      }
    }
    if (v68)
    {
      v26 = *((_QWORD *)&buf + 1);
      if (*((_QWORD *)&buf + 1))
      {
        do
        {
          v27 = (char *)v26;
          v26 = *(_QWORD *)(v26 + 8);
        }
        while (v26);
      }
      else
      {
        v30 = (char *)&buf + 8;
        do
        {
          v27 = (char *)*((_QWORD *)v30 + 2);
          v31 = *(_QWORD *)v27 == (_QWORD)v30;
          v30 = v27;
        }
        while (v31);
      }
      while (1)
      {
        v45 = *((id *)v27 + 5);
        v46 = *((id *)v27 + 6);
        v47 = objc_msgSend(v6, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v45, "routeCoordinate"), self->_distancePaddingWhenAlternating);
        v48 = objc_msgSend(v64, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v46, "routeCoordinate"), self->_distancePaddingWhenAlternating);
        v49 = objc_msgSend(v6, "endRouteCoordinate");
        if (v47 > v49
          || (_DWORD)v47 == (_DWORD)v49 && *((float *)&v47 + 1) >= *((float *)&v49 + 1))
        {
          break;
        }
        v32 = objc_msgSend(v64, "endRouteCoordinate");
        if (v48 > v32
          || (_DWORD)v48 == (_DWORD)v32 && *((float *)&v48 + 1) >= *((float *)&v32 + 1))
        {
          break;
        }
        v33 = objc_msgSend(v45, "resultType");
        if (v33 == 1)
          -[MNRouteDivergenceFinder findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, v47, v64, v48);
        else
          -[MNRouteDivergenceFinder findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstDivergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, v47, v64, v48);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "count") != 2)
          goto LABEL_43;
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "routeCoordinate");
        if ((GEOPolylineCoordinateIsInvalid() & 1) != 0)
          goto LABEL_42;
        objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "routeCoordinate");
        IsInvalid = GEOPolylineCoordinateIsInvalid();

        if ((IsInvalid & 1) != 0)
          goto LABEL_43;
        if (v33 == 1)
          v38 = 2;
        else
          v38 = 1;
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "resultType") != v38)
        {
LABEL_42:

LABEL_43:
          break;
        }
        objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "resultType") == v38;

        if (!v40)
          goto LABEL_43;
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "routeCoordinate");
        objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", 1);
        v44 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v65 = v43;
        *((_QWORD *)&v65 + 1) = v44;
        v27 = std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v42, v42, &v65, *((float *)&v42 + 1));

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v68);
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v68);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (_QWORD *)buf;
      if ((__int128 *)buf != (__int128 *)((char *)&buf + 8))
      {
        do
        {
          -[NSObject addObject:](v29, "addObject:", v51[5]);
          objc_msgSend(v50, "addObject:", v51[6]);
          v52 = (_QWORD *)v51[1];
          if (v52)
          {
            do
            {
              v53 = v52;
              v52 = (_QWORD *)*v52;
            }
            while (v52);
          }
          else
          {
            do
            {
              v53 = (_OWORD *)v51[2];
              v31 = *(_QWORD *)v53 == (_QWORD)v51;
              v51 = v53;
            }
            while (!v31);
          }
          v51 = v53;
        }
        while (v53 != (__int128 *)((char *)&buf + 8));
      }
      v54 = objc_alloc_init(MNRouteDivergenceResults);
      objc_msgSend(v6, "uniqueRouteID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNRouteDivergenceResults setRouteID:](v54, "setRouteID:", v55);

      -[MNRouteDivergenceResults setResults:](v54, "setResults:", v29);
      v56 = objc_alloc_init(MNRouteDivergenceResults);
      objc_msgSend(v64, "uniqueRouteID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNRouteDivergenceResults setRouteID:](v56, "setRouteID:", v57);

      -[MNRouteDivergenceResults setResults:](v56, "setResults:", v50);
      MNGetMNRouteDivergenceLog();
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
      {
        LOWORD(v65) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v59, OS_SIGNPOST_INTERVAL_END, v10, "findAllDivergenceConvergenceBetweenRoute", ", (uint8_t *)&v65, 2u);
      }

      v66[0] = v54;
      v66[1] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      MNGetMNRouteDivergenceLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        LOWORD(v65) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v29, OS_SIGNPOST_INTERVAL_END, v10, "findAllDivergenceConvergenceBetweenRoute", "orderedResults empty", (uint8_t *)&v65, 2u);
      }
      v8 = 0;
    }

    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(*((_QWORD **)&buf + 1));
  }

  return v8;
}

- (id)findAllOverlapRangesBetweenRoutes:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  __int128 v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  __n128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  BOOL v27;
  __n128 *v28;
  __n128 *v29;
  __n128 *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  __int128 v36;
  uint64_t *v37;
  void *v38;
  uint64_t v39;
  char *v40;
  _QWORD **v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  BOOL v45;
  _QWORD *v46;
  _QWORD *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  NSObject *v55;
  unint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  id v60;
  id v61;
  unint64_t v62;
  __n128 *v63;
  __n128 *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint8x8_t v68;
  int8x8_t v69;
  unint64_t v70;
  uint8x8_t v71;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *k;
  unint64_t v75;
  __n128 *v76;
  __n128 v77;
  float v78;
  _BOOL8 v79;
  unint64_t v80;
  unint64_t v81;
  size_t v82;
  int8x8_t **v83;
  int8x8_t *v84;
  uint64_t v85;
  unint64_t v86;
  int8x8_t v87;
  __n128 **v88;
  unint64_t v89;
  int8x8_t *v90;
  int8x8_t *v91;
  int8x8_t *v92;
  int8x8_t v93;
  unint64_t v94;
  int8x8_t v95;
  uint64_t v96;
  void *v97;
  MNRouteOverlapResult *v98;
  void *v99;
  NSObject *v100;
  NSObject *v101;
  __int128 v103;
  os_signpost_id_t spid;
  unint64_t v105;
  id v106;
  unint64_t v107;
  void *v109;
  id v110;
  id obj;
  unint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  unint64_t v115;
  char *v116;
  _QWORD *v117;
  _QWORD *v118;
  void *v119;
  void *v120;
  __n128 **v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  char *v130;
  char *v131;
  char *v132;
  int8x8_t buf[5];
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  if (objc_msgSend(v110, "count"))
  {
    MNGetMNRouteDivergenceLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_make_with_pointer(v4, self);

    MNGetMNRouteDivergenceLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    spid = v5;
    v105 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      -[MNRouteDivergenceFinder _routesArrayIdentifierStrings:](self, "_routesArrayIdentifierStrings:", v110);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      buf[0].i32[0] = 138412290;
      *(int8x8_t *)((char *)buf + 4) = (int8x8_t)v8;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "findAllOverlapRangesBetweenRoutes", "%@", (uint8_t *)buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v110, "count"));
    v106 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v110, "count");
    v11 = v9;
    v130 = 0;
    v131 = 0;
    v132 = 0;
    buf[0] = (int8x8_t)&v130;
    buf[1].i8[0] = 0;
    if (v9)
    {
      if (v9 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
      v12 = (char *)operator new(24 * v9);
      v130 = v12;
      v132 = &v12[24 * v11];
      v13 = 24 * ((24 * v11 - 24) / 0x18) + 24;
      bzero(v12, v13);
      v131 = &v12[v13];
    }
    v14 = 0;
    *(_QWORD *)&v10 = 136315906;
    v103 = v10;
    while (v14 < objc_msgSend(v110, "count", v103))
    {
      objc_msgSend(v110, "objectAtIndexedSubscript:", v14);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (uint64_t *)&v130[24 * v14];
      v112 = v14;
      v16 = v14 + 1;
      v121 = (__n128 **)(v15 + 1);
      v118 = v15 + 2;
      v107 = v14 + 1;
      v114 = v15;
      while (v16 < objc_msgSend(v110, "count"))
      {
        objc_msgSend(v110, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v130;
        -[MNRouteDivergenceFinder findAllDivergenceConvergenceBetweenRoute:andRoute:](self, "findAllDivergenceConvergenceBetweenRoute:andRoute:", v109, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count") != 2)
        {
          GEOFindOrCreateLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            buf[0].i32[0] = v103;
            *(int8x8_t *)((char *)buf + 4) = (int8x8_t)"-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]";
            buf[1].i16[2] = 2080;
            *(int8x8_t *)((char *)&buf[1] + 6) = (int8x8_t)"/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRoute"
                                                           "DivergenceFinder.mm";
            buf[2].i16[3] = 1024;
            buf[3].i32[0] = 429;
            buf[3].i16[2] = 2080;
            *(int8x8_t *)((char *)&buf[3] + 6) = (int8x8_t)"divergenceConvergenceResult.count == 2";
            _os_log_impl(&dword_1B0AD7000, v55, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)buf, 0x26u);
          }

        }
        if (objc_msgSend(v19, "count") != 2)
        {

          break;
        }
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "results");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
        v119 = v19;
        v120 = v18;
        v115 = v16;
        if (v22)
        {
          v23 = *(_QWORD *)v127;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v127 != v23)
                objc_enumerationMutation(v21);
              v25 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
              v26 = objc_msgSend(v25, "routeCoordinate");
              v27 = objc_msgSend(v25, "resultType") == 2;
              v28 = *v121;
              if ((unint64_t)*v121 >= *v118)
              {
                v30 = (__n128 *)*v114;
                v3 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v28 - *v114) >> 3);
                v31 = v3 + 1;
                if (v3 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((uint64_t)(*v118 - (_QWORD)v30) >> 3) > v31)
                  v31 = 0x5555555555555556 * ((uint64_t)(*v118 - (_QWORD)v30) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v118 - (_QWORD)v30) >> 3) >= 0x555555555555555)
                  v32 = 0xAAAAAAAAAAAAAAALL;
                else
                  v32 = v31;
                if (v32)
                {
                  if (v32 > 0xAAAAAAAAAAAAAAALL)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v33 = (char *)operator new(24 * v32);
                }
                else
                {
                  v33 = 0;
                }
                v34 = &v33[24 * v3];
                *(_QWORD *)v34 = v26;
                *((_QWORD *)v34 + 1) = v115;
                v34[16] = v27;
                v35 = v34;
                if (v28 == v30)
                {
                  v18 = v120;
                  v37 = v114;
                }
                else
                {
                  v18 = v120;
                  do
                  {
                    v36 = *(__int128 *)((char *)&v28[-2] + 8);
                    *(v35 - 8) = v28[-1].n128_i8[8];
                    *(_OWORD *)(v35 - 24) = v36;
                    v35 -= 24;
                    v28 = (__n128 *)((char *)v28 - 24);
                  }
                  while (v28 != v30);
                  v37 = v114;
                  v28 = (__n128 *)*v114;
                }
                *v37 = (uint64_t)v35;
                v29 = (__n128 *)(v34 + 24);
                *v121 = (__n128 *)(v34 + 24);
                *v118 = &v33[24 * v32];
                if (v28)
                  operator delete(v28);
              }
              else
              {
                v28->n128_u64[0] = v26;
                v28->n128_u64[1] = v115;
                v29 = (__n128 *)((char *)v28 + 24);
                v28[1].n128_u8[0] = v27;
                v18 = v120;
              }
              v19 = v119;
              *v121 = v29;
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
          }
          while (v22);
        }

        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "results");
        obj = (id)objc_claimAutoreleasedReturnValue();

        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
        if (v39)
        {
          v40 = &v116[24 * v115];
          v113 = *(_QWORD *)v123;
          v41 = (_QWORD **)(v40 + 8);
          v117 = v40 + 16;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v123 != v113)
                objc_enumerationMutation(obj);
              v43 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
              v44 = objc_msgSend(v43, "routeCoordinate");
              v45 = objc_msgSend(v43, "resultType") == 2;
              v46 = *v41;
              if ((unint64_t)*v41 >= *v117)
              {
                v3 = *(_QWORD *)v40;
                v48 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v46 - *(_QWORD *)v40) >> 3);
                v49 = v48 + 1;
                if (v48 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((uint64_t)(*v117 - v3) >> 3) > v49)
                  v49 = 0x5555555555555556 * ((uint64_t)(*v117 - v3) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v117 - v3) >> 3) >= 0x555555555555555)
                  v50 = 0xAAAAAAAAAAAAAAALL;
                else
                  v50 = v49;
                if (v50)
                {
                  if (v50 > 0xAAAAAAAAAAAAAAALL)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v51 = (char *)operator new(24 * v50);
                }
                else
                {
                  v51 = 0;
                }
                v52 = &v51[24 * v48];
                *(_QWORD *)v52 = v44;
                *((_QWORD *)v52 + 1) = v112;
                v52[16] = v45;
                v53 = v52;
                if (v46 == (_QWORD *)v3)
                {
                  v19 = v119;
                }
                else
                {
                  v19 = v119;
                  do
                  {
                    v54 = *(_OWORD *)(v46 - 3);
                    *(v53 - 8) = *((_BYTE *)v46 - 8);
                    *(_OWORD *)(v53 - 24) = v54;
                    v53 -= 24;
                    v46 -= 3;
                  }
                  while (v46 != (_QWORD *)v3);
                  v46 = *(_QWORD **)v40;
                }
                *(_QWORD *)v40 = v53;
                v47 = v52 + 24;
                *v41 = v52 + 24;
                *v117 = &v51[24 * v50];
                if (v46)
                  operator delete(v46);
                v18 = v120;
              }
              else
              {
                *v46 = v44;
                v46[1] = v112;
                v47 = v46 + 3;
                *((_BYTE *)v46 + 16) = v45;
                v19 = v119;
                v18 = v120;
              }
              *v41 = v47;
            }
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v134, 16);
          }
          while (v39);
        }

        v15 = v114;
        v16 = v115 + 1;
      }
      v56 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)*v121 - *v15) >> 3));
      if (*v121 == (__n128 *)*v15)
        v57 = 0;
      else
        v57 = v56;
      *(float *)&v58 = std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *,false>(*v15, *v121, v57, 1, v17);
      v59 = objc_msgSend(v110, "count", v58);
      memset(buf, 0, 32);
      buf[4].i32[0] = 1065353216;
      std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)buf, v59 - 1);
      v60 = objc_alloc_init(MEMORY[0x1E0D27378]);
      v61 = objc_alloc_init(MEMORY[0x1E0D27378]);
      v62 = *MEMORY[0x1E0D26A88];
      v63 = (__n128 *)*v15;
      v64 = *v121;
      v65 = *MEMORY[0x1E0D26A88];
LABEL_76:
      if (v63 != v64)
      {
        if (v63[1].n128_u8[0])
        {
          if (!*(_QWORD *)&buf[3])
          {
            v62 = v63->n128_u64[0];
            if (GEOPolylineCoordinateRangeIsValid())
              objc_msgSend(v60, "addCoordinateRange:", v65, v62);
          }
          v66 = v63->n128_u64[1];
          v67 = (unint64_t)buf[1];
          if (buf[1])
          {
            v68 = (uint8x8_t)vcnt_s8(buf[1]);
            v68.i16[0] = vaddlv_u8(v68);
            if (v68.u32[0] > 1uLL)
            {
              v3 = v63->n128_u64[1];
              if (v66 >= *(_QWORD *)&buf[1])
                v3 = v66 % *(_QWORD *)&buf[1];
            }
            else
            {
              v3 = (*(_QWORD *)&buf[1] - 1) & v66;
            }
            v73 = *(_QWORD **)(*(_QWORD *)buf + 8 * v3);
            if (v73)
            {
              for (k = (_QWORD *)*v73; k; k = (_QWORD *)*k)
              {
                v75 = k[1];
                if (v75 == v66)
                {
                  if (k[3] == v66)
                    goto LABEL_168;
                }
                else
                {
                  if (v68.u32[0] > 1uLL)
                  {
                    if (v75 >= *(_QWORD *)&buf[1])
                      v75 %= *(_QWORD *)&buf[1];
                  }
                  else
                  {
                    v75 &= *(_QWORD *)&buf[1] - 1;
                  }
                  if (v75 != v3)
                    break;
                }
              }
            }
          }
          v76 = (__n128 *)operator new(0x28uLL);
          v76->n128_u64[0] = 0;
          v76->n128_u64[1] = v66;
          v77 = *v63;
          v76[2].n128_u64[0] = v63[1].n128_u64[0];
          v76[1] = v77;
          v78 = (float)(unint64_t)(*(_QWORD *)&buf[3] + 1);
          if (!v67 || (float)(*(float *)buf[4].i32 * (float)v67) < v78)
          {
            v79 = (v67 & (v67 - 1)) != 0;
            if (v67 < 3)
              v79 = 1;
            v80 = v79 | (2 * v67);
            v81 = vcvtps_u32_f32(v78 / *(float *)buf[4].i32);
            if (v80 <= v81)
              v82 = v81;
            else
              v82 = v80;
            std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)buf, v82);
            v67 = (unint64_t)buf[1];
            if ((*(_QWORD *)&buf[1] & (*(_QWORD *)&buf[1] - 1)) != 0)
            {
              if (v66 >= *(_QWORD *)&buf[1])
                v3 = v66 % *(_QWORD *)&buf[1];
              else
                v3 = v66;
            }
            else
            {
              v3 = (*(_QWORD *)&buf[1] - 1) & v66;
            }
          }
          v87 = buf[0];
          v88 = *(__n128 ***)(*(_QWORD *)buf + 8 * v3);
          if (v88)
          {
            v76->n128_u64[0] = (unint64_t)*v88;
            goto LABEL_135;
          }
          v76->n128_u64[0] = (unint64_t)buf[2];
          buf[2] = (int8x8_t)v76;
          *(_QWORD *)(*(_QWORD *)&v87 + 8 * v3) = &buf[2];
          if (v76->n128_u64[0])
          {
            v89 = *(_QWORD *)(v76->n128_u64[0] + 8);
            if ((v67 & (v67 - 1)) != 0)
            {
              if (v89 >= v67)
                v89 %= v67;
            }
            else
            {
              v89 &= v67 - 1;
            }
            v88 = (__n128 **)(*(_QWORD *)buf + 8 * v89);
LABEL_135:
            *v88 = v76;
          }
          ++*(_QWORD *)&buf[3];
          goto LABEL_168;
        }
        v69 = buf[1];
        if (!*(_QWORD *)&buf[1])
          goto LABEL_165;
        v70 = v63->n128_u64[1];
        v71 = (uint8x8_t)vcnt_s8(buf[1]);
        v71.i16[0] = vaddlv_u8(v71);
        if (v71.u32[0] > 1uLL)
        {
          v72 = v63->n128_u64[1];
          if (v70 >= *(_QWORD *)&buf[1])
            v72 = v70 % *(_QWORD *)&buf[1];
        }
        else
        {
          v72 = (*(_QWORD *)&buf[1] - 1) & v70;
        }
        v83 = *(int8x8_t ***)(*(_QWORD *)buf + 8 * v72);
        if (!v83)
          goto LABEL_165;
        v84 = *v83;
        if (!*v83)
          goto LABEL_165;
        v85 = *(_QWORD *)&buf[1] - 1;
        while (1)
        {
          v86 = (unint64_t)v84[1];
          if (v86 == v70)
          {
            if (*(_QWORD *)&v84[3] == v70)
            {
              if (v71.u32[0] > 1uLL)
              {
                if (v70 >= *(_QWORD *)&buf[1])
                  v70 %= *(_QWORD *)&buf[1];
              }
              else
              {
                v70 &= v85;
              }
              v90 = (int8x8_t *)*v84;
              v91 = *(int8x8_t **)(*(_QWORD *)buf + 8 * v70);
              do
              {
                v92 = v91;
                v91 = (int8x8_t *)*v91;
              }
              while (v91 != v84);
              if (v92 == &buf[2])
                goto LABEL_154;
              v93 = v92[1];
              if (v71.u32[0] > 1uLL)
              {
                if (*(_QWORD *)&v93 >= *(_QWORD *)&buf[1])
                  *(_QWORD *)&v93 %= *(_QWORD *)&buf[1];
              }
              else
              {
                *(_QWORD *)&v93 &= v85;
              }
              if (*(_QWORD *)&v93 == v70)
              {
LABEL_156:
                if (v90)
                {
                  v94 = (unint64_t)v90[1];
                  goto LABEL_158;
                }
              }
              else
              {
LABEL_154:
                if (!v90)
                  goto LABEL_155;
                v94 = (unint64_t)v90[1];
                if (v71.u32[0] > 1uLL)
                {
                  v95 = v90[1];
                  if (v94 >= *(_QWORD *)&buf[1])
                    v95 = (int8x8_t)(v94 % *(_QWORD *)&buf[1]);
                }
                else
                {
                  v95 = (int8x8_t)(v94 & v85);
                }
                if (*(_QWORD *)&v95 != v70)
                {
LABEL_155:
                  *(_QWORD *)(*(_QWORD *)buf + 8 * v70) = 0;
                  v90 = (int8x8_t *)*v84;
                  goto LABEL_156;
                }
LABEL_158:
                if (v71.u32[0] > 1uLL)
                {
                  if (v94 >= *(_QWORD *)&v69)
                    v94 %= *(_QWORD *)&v69;
                }
                else
                {
                  v94 &= v85;
                }
                if (v94 != v70)
                {
                  *(_QWORD *)(*(_QWORD *)buf + 8 * v94) = v92;
                  v90 = (int8x8_t *)*v84;
                }
              }
              *v92 = (int8x8_t)v90;
              *v84 = 0;
              --*(_QWORD *)&buf[3];
              operator delete(v84);
LABEL_165:
              if (!*(_QWORD *)&buf[3])
              {
                v65 = v63->n128_u64[0];
                if (GEOPolylineCoordinateRangeIsValid())
                  objc_msgSend(v61, "addCoordinateRange:", v62, v65);
              }
LABEL_168:
              v63 = (__n128 *)((char *)v63 + 24);
              goto LABEL_76;
            }
          }
          else
          {
            if (v71.u32[0] > 1uLL)
            {
              if (v86 >= *(_QWORD *)&buf[1])
                v86 %= *(_QWORD *)&buf[1];
            }
            else
            {
              v86 &= v85;
            }
            if (v86 != v72)
              goto LABEL_165;
          }
          v84 = (int8x8_t *)*v84;
          if (!v84)
            goto LABEL_165;
        }
      }
      if (buf[3])
      {
        v96 = objc_msgSend(v109, "endRouteCoordinate");
        if (GEOPolylineCoordinateRangeIsValid())
        {
          v97 = v61;
          v65 = v62;
          goto LABEL_174;
        }
      }
      else
      {
        v96 = objc_msgSend(v109, "endRouteCoordinate");
        if ((GEOPolylineCoordinateRangeIsValid() & 1) != 0)
        {
          v97 = v60;
LABEL_174:
          objc_msgSend(v97, "addCoordinateRange:", v65, v96);
        }
      }
      v98 = objc_alloc_init(MNRouteOverlapResult);
      objc_msgSend(v109, "uniqueRouteID");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNRouteOverlapResult setRouteID:](v98, "setRouteID:", v99);

      -[MNRouteOverlapResult setRouteRange:](v98, "setRouteRange:", 0, objc_msgSend(v109, "endRouteCoordinate"));
      -[MNRouteOverlapResult setUniqueRanges:](v98, "setUniqueRanges:", v60);
      -[MNRouteOverlapResult setOverlapRanges:](v98, "setOverlapRanges:", v61);
      objc_msgSend(v106, "addObject:", v98);

      std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)buf);
      v14 = v107;
    }
    MNGetMNRouteDivergenceLog();
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (v105 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v100))
    {
      buf[0].i16[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v101, OS_SIGNPOST_INTERVAL_END, spid, "findAllOverlapRangesBetweenRoutes", ", (uint8_t *)buf, 2u);
    }

    buf[0] = (int8x8_t)&v130;
    std::vector<std::vector<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    v106 = 0;
  }

  return v106;
}

- (id)findOverlappingSectionsForRoutes:(id)a3
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  unint64_t v13;
  double toleranceMeters;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  char *v25;
  BOOL v26;
  unint64_t v27;
  unint64_t *v28;
  char *v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  char *v39;
  char *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  char *v50;
  BOOL v51;
  unint64_t v52;
  unint64_t *v53;
  char *v54;
  unint64_t *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  __int128 v63;
  char *v64;
  NSObject *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t **k;
  uint64_t **v72;
  unint64_t v73;
  uint64_t **v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t **v77;
  unint64_t v78;
  uint64_t **v79;
  _QWORD *v80;
  NSObject *v81;
  uint64_t *v82;
  void *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t **v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t **v89;
  int v90;
  uint64_t **v91;
  uint64_t v92;
  int v93;
  void *v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t **v122;
  uint64_t **v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t *v126;
  char *v127;
  uint64_t v128;
  uint64_t *v129;
  unint64_t v130;
  char *v131;
  _QWORD *v132;
  char *v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  char *v137;
  uint64_t *v138;
  char *v139;
  __int128 v140;
  char *v141;
  uint64_t *v142;
  uint64_t **v143;
  void *v144;
  uint64_t *v145;
  void *v146;
  _QWORD *v147;
  _QWORD *v148;
  MNRouteDivergenceOverlappingSectionComponent *v149;
  MNRouteDivergenceOverlappingSection *v150;
  uint64_t *v151;
  uint64_t **v152;
  NSObject *v153;
  NSObject *v154;
  unint64_t v156;
  os_signpost_id_t spid;
  char *v159;
  id v160;
  void *v161;
  id v162;
  id obj;
  uint64_t **v164;
  void *v165;
  unint64_t v166;
  void *v167;
  unint64_t v168;
  uint64_t *v169;
  uint64_t *v170;
  uint64_t v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t **v180;
  uint64_t *v181;
  uint64_t v182;
  double v183;
  char *v184;
  char *v185;
  char *v186;
  _QWORD v187[2];
  char v188;
  _BYTE buf[22];
  __int16 v190;
  __int128 v191;
  uint64_t v192;
  _BYTE v193[128];
  _BYTE v194[128];
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v160 = a3;
  if (objc_msgSend(v160, "count"))
  {
    MNGetMNRouteDivergenceLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);

    MNGetMNRouteDivergenceLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    spid = v4;
    v156 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      -[MNRouteDivergenceFinder _routesArrayIdentifierStrings:](self, "_routesArrayIdentifierStrings:", v160);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "findOverlappingSectionsForRoutes", "%@", buf, 0xCu);

    }
    v8 = objc_msgSend(v160, "count");
    v184 = 0;
    v185 = 0;
    v186 = 0;
    *(_QWORD *)buf = &v184;
    buf[8] = 0;
    if (v8)
    {
      if (v8 > 0xAAAAAAAAAAAAAAALL)
        std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
      v9 = 3 * v8;
      v10 = 24 * v8;
      v11 = (char *)operator new(24 * v8);
      v184 = v11;
      v186 = &v11[8 * v9];
      v12 = v11 + 8;
      do
      {
        *v12 = 0;
        v12[1] = 0;
        *(v12 - 1) = v12;
        v12 += 3;
        v10 -= 24;
      }
      while (v10);
      v185 = &v11[8 * v9];
    }
    v13 = 0;
    toleranceMeters = self->_toleranceMeters;
    v182 = 0;
    v183 = toleranceMeters;
    v180 = &v181;
    v181 = 0;
    while (v13 < objc_msgSend(v160, "count"))
    {
      objc_msgSend(v160, "objectAtIndexedSubscript:", v13);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v164 = (uint64_t **)&v184[24 * v13];
      v166 = v13;
      v168 = v13;
      while (v166 + 1 < objc_msgSend(v160, "count"))
      {
        ++v166;
        objc_msgSend(v160, "objectAtIndexedSubscript:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v159 = v184;
        -[MNRouteDivergenceFinder findAllDivergenceConvergenceBetweenRoute:andRoute:](self, "findAllDivergenceConvergenceBetweenRoute:andRoute:", v161, v15);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v167, "count") != 2)
        {
          GEOFindOrCreateLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
            v190 = 1024;
            LODWORD(v191) = 620;
            WORD2(v191) = 2080;
            *(_QWORD *)((char *)&v191 + 6) = "divergenceConvergenceResult.count == 2";
            _os_log_impl(&dword_1B0AD7000, v65, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }

        }
        if (objc_msgSend(v167, "count") != 2)
        {

          break;
        }
        v179 = 0u;
        v177 = 0u;
        v178 = 0u;
        v176 = 0u;
        objc_msgSend(v167, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "results");
        obj = (id)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v194, 16);
        v165 = v15;
        if (v17)
        {
          v18 = *(_QWORD *)v177;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v177 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * i);
              objc_msgSend(v167, "objectAtIndexedSubscript:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "results");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v20 == v23;

              *(_QWORD *)buf = objc_msgSend(v20, "routeCoordinate");
              v25 = std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>::operator[](v164, (int *)buf);
              v26 = objc_msgSend(v20, "resultType") == 2;
              v28 = (unint64_t *)*((_QWORD *)v25 + 1);
              v27 = *((_QWORD *)v25 + 2);
              if ((unint64_t)v28 >= v27)
              {
                v30 = *(unint64_t **)v25;
                v31 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v28 - *(_QWORD *)v25) >> 3);
                v32 = v31 + 1;
                if (v31 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - (_QWORD)v30) >> 3);
                if (2 * v33 > v32)
                  v32 = 2 * v33;
                if (v33 >= 0x555555555555555)
                  v34 = 0xAAAAAAAAAAAAAAALL;
                else
                  v34 = v32;
                if (v34 > 0xAAAAAAAAAAAAAAALL)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v35 = (char *)operator new(24 * v34);
                v36 = &v35[24 * v31];
                *(_QWORD *)v36 = v168;
                *((_QWORD *)v36 + 1) = v166;
                v36[16] = v26;
                v36[17] = v24;
                if (v28 == v30)
                {
                  v39 = &v35[24 * v31];
                }
                else
                {
                  v37 = &v35[24 * v31];
                  do
                  {
                    v38 = *(_OWORD *)(v28 - 3);
                    v39 = v37 - 24;
                    *((_WORD *)v37 - 4) = *((_WORD *)v28 - 4);
                    *(_OWORD *)(v37 - 24) = v38;
                    v28 -= 3;
                    v37 -= 24;
                  }
                  while (v28 != v30);
                }
                v40 = &v35[24 * v34];
                v29 = v36 + 24;
                *(_QWORD *)v25 = v39;
                *((_QWORD *)v25 + 1) = v36 + 24;
                *((_QWORD *)v25 + 2) = v40;
                v13 = v168;
                v15 = v165;
                if (v30)
                  operator delete(v30);
              }
              else
              {
                v15 = v165;
                *v28 = v168;
                v28[1] = v166;
                *((_BYTE *)v28 + 16) = v26;
                v13 = v168;
                v29 = (char *)(v28 + 3);
                *((_BYTE *)v28 + 17) = v24;
              }
              *((_QWORD *)v25 + 1) = v29;
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v194, 16);
          }
          while (v17);
        }

        v174 = 0u;
        v175 = 0u;
        v172 = 0u;
        v173 = 0u;
        objc_msgSend(v167, "objectAtIndexedSubscript:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "results");
        v162 = (id)objc_claimAutoreleasedReturnValue();

        v42 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v172, v193, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v173;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v173 != v43)
                objc_enumerationMutation(v162);
              v45 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * j);
              objc_msgSend(v167, "objectAtIndexedSubscript:", 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "results");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "firstObject");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v45 == v48;

              *(_QWORD *)buf = objc_msgSend(v45, "routeCoordinate");
              v50 = std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>::operator[]((uint64_t **)&v159[24 * v166], (int *)buf);
              v51 = objc_msgSend(v45, "resultType") == 2;
              v53 = (unint64_t *)*((_QWORD *)v50 + 1);
              v52 = *((_QWORD *)v50 + 2);
              if ((unint64_t)v53 >= v52)
              {
                v55 = *(unint64_t **)v50;
                v56 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v53 - *(_QWORD *)v50) >> 3);
                v57 = v56 + 1;
                if (v56 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - (_QWORD)v55) >> 3);
                if (2 * v58 > v57)
                  v57 = 2 * v58;
                if (v58 >= 0x555555555555555)
                  v59 = 0xAAAAAAAAAAAAAAALL;
                else
                  v59 = v57;
                if (v59 > 0xAAAAAAAAAAAAAAALL)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v60 = (char *)operator new(24 * v59);
                v61 = &v60[24 * v56];
                *(_QWORD *)v61 = v166;
                *((_QWORD *)v61 + 1) = v168;
                v61[16] = v51;
                v61[17] = v49;
                if (v53 == v55)
                {
                  v64 = &v60[24 * v56];
                }
                else
                {
                  v62 = &v60[24 * v56];
                  do
                  {
                    v63 = *(_OWORD *)(v53 - 3);
                    v64 = v62 - 24;
                    *((_WORD *)v62 - 4) = *((_WORD *)v53 - 4);
                    *(_OWORD *)(v62 - 24) = v63;
                    v53 -= 3;
                    v62 -= 24;
                  }
                  while (v53 != v55);
                }
                v54 = v61 + 24;
                *(_QWORD *)v50 = v64;
                *((_QWORD *)v50 + 1) = v61 + 24;
                *((_QWORD *)v50 + 2) = &v60[24 * v59];
                v15 = v165;
                if (v55)
                  operator delete(v55);
                v13 = v168;
              }
              else
              {
                v13 = v168;
                *v53 = v166;
                v53[1] = v168;
                *((_BYTE *)v53 + 16) = v51;
                v54 = (char *)(v53 + 3);
                *((_BYTE *)v53 + 17) = v49;
                v15 = v165;
              }
              *((_QWORD *)v50 + 1) = v54;
            }
            v42 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v172, v193, 16);
          }
          while (v42);
        }

      }
      v170 = 0;
      v171 = 0;
      v169 = (uint64_t *)&v170;
      std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>((uint64_t *)&v169, (uint64_t *)&v170, v13, v13);
      v66 = *v164;
      if (*v164 == (uint64_t *)(v164 + 1))
        goto LABEL_220;
      while (2)
      {
        v67 = v66[5];
        v68 = v66[6];
LABEL_70:
        if (v67 != v68)
        {
          v69 = *(_QWORD *)(v67 + 8);
          v70 = v170;
          if (*(_BYTE *)(v67 + 16))
          {
            for (k = &v170; ; v70 = *k)
            {
              v72 = k;
              if (!v70)
                break;
              while (1)
              {
                k = (uint64_t **)v70;
                v73 = v70[4];
                if (v73 > v69)
                  break;
                if (v73 >= v69)
                  goto LABEL_96;
                v70 = k[1];
                if (!v70)
                {
                  v72 = k + 1;
                  goto LABEL_93;
                }
              }
            }
LABEL_93:
            v82 = (uint64_t *)operator new(0x28uLL);
            v82[4] = v69;
            *v82 = 0;
            v82[1] = 0;
            v82[2] = (uint64_t)k;
            *v72 = v82;
            if (*v169)
            {
              v169 = (uint64_t *)*v169;
              v82 = *v72;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v170, v82);
            ++v171;
            goto LABEL_96;
          }
          if (!v170)
            goto LABEL_246;
          v74 = &v170;
          v75 = v170;
          do
          {
            v76 = v75;
            v77 = v74;
            v78 = v75[4];
            v79 = (uint64_t **)(v75 + 1);
            if (v78 >= v69)
            {
              v79 = (uint64_t **)v76;
              v74 = (uint64_t **)v76;
            }
            v75 = *v79;
          }
          while (v75);
          if (v74 == &v170 || (v78 >= v69 ? (v80 = v76) : (v80 = v77), v80[4] > v69))
          {
LABEL_246:
            if (!*(_BYTE *)(v67 + 17))
            {
              GEOFindOrCreateLog();
              v81 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
                v190 = 1024;
                LODWORD(v191) = 652;
                WORD2(v191) = 2080;
                *(_QWORD *)((char *)&v191 + 6) = "erasedElements == 1 || routeSectionEndpoint.isFirstEndpoint";
                _os_log_impl(&dword_1B0AD7000, v81, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
              }

            }
            goto LABEL_96;
          }
          if (v78 >= v69)
            v83 = v76;
          else
            v83 = v77;
          v84 = (uint64_t *)*((_QWORD *)v83 + 1);
          v85 = v84;
          v86 = v74;
          if (v84)
          {
            do
            {
              v87 = v85;
              v85 = (uint64_t *)*v85;
            }
            while (v85);
          }
          else
          {
            do
            {
              v87 = v86[2];
              v107 = *v87 == (_QWORD)v86;
              v86 = (uint64_t **)v87;
            }
            while (!v107);
          }
          if (v169 == (uint64_t *)v74)
            v169 = v87;
          --v171;
          v88 = *v74;
          v89 = v74;
          if (*v74)
          {
            if (v84)
            {
              do
              {
                v89 = (uint64_t **)v84;
                v84 = (uint64_t *)*v84;
              }
              while (v84);
              goto LABEL_110;
            }
            v89 = v74;
LABEL_113:
            v90 = 0;
            v88[2] = (uint64_t)v89[2];
          }
          else
          {
LABEL_110:
            v88 = v89[1];
            if (v88)
              goto LABEL_113;
            v90 = 1;
          }
          v91 = (uint64_t **)v89[2];
          v92 = (uint64_t)*v91;
          if (*v91 == (uint64_t *)v89)
          {
            *v91 = v88;
            if (v89 == (uint64_t **)v70)
            {
              v92 = 0;
              v70 = v88;
            }
            else
            {
              v92 = (uint64_t)v91[1];
            }
          }
          else
          {
            v91[1] = v88;
          }
          v93 = *((unsigned __int8 *)v89 + 24);
          if (v89 != v74)
          {
            if (v78 >= v69)
              v94 = v76;
            else
              v94 = v77;
            v95 = (uint64_t *)*((_QWORD *)v94 + 2);
            v89[2] = v95;
            v95[**((_QWORD **)v94 + 2) != (_QWORD)v74] = (uint64_t)v89;
            v96 = *v74;
            *v89 = *v74;
            v96[2] = (uint64_t)v89;
            v97 = (uint64_t *)*((_QWORD *)v83 + 1);
            v89[1] = v97;
            if (v97)
              v97[2] = (uint64_t)v89;
            if (v78 < v69)
              v76 = (uint64_t *)v77;
            *((_BYTE *)v89 + 24) = *((_BYTE *)v76 + 24);
            if (v70 == (uint64_t *)v74)
              v70 = (uint64_t *)v89;
          }
          if (!v93 || !v70)
            goto LABEL_183;
          if (!v90)
          {
            *((_BYTE *)v88 + 24) = 1;
            goto LABEL_183;
          }
          while (1)
          {
            v98 = *(_QWORD *)(v92 + 16);
            if (*(_QWORD *)v98 == v92)
            {
              if (!*(_BYTE *)(v92 + 24))
              {
                *(_BYTE *)(v92 + 24) = 1;
                *(_BYTE *)(v98 + 24) = 0;
                v104 = *(_QWORD *)(v92 + 8);
                *(_QWORD *)v98 = v104;
                if (v104)
                  *(_QWORD *)(v104 + 16) = v98;
                *(_QWORD *)(v92 + 16) = *(_QWORD *)(v98 + 16);
                *(_QWORD *)(*(_QWORD *)(v98 + 16) + 8 * (**(_QWORD **)(v98 + 16) != v98)) = v92;
                *(_QWORD *)(v92 + 8) = v98;
                *(_QWORD *)(v98 + 16) = v92;
                if (v70 == (uint64_t *)v98)
                  v70 = (uint64_t *)v92;
                v92 = *(_QWORD *)v98;
              }
              v105 = *(_QWORD *)v92;
              if (*(_QWORD *)v92 && !*(_BYTE *)(v105 + 24))
                goto LABEL_178;
              v106 = *(_QWORD *)(v92 + 8);
              if (v106 && !*(_BYTE *)(v106 + 24))
              {
                if (v105 && !*(_BYTE *)(v105 + 24))
                {
LABEL_178:
                  v106 = v92;
                }
                else
                {
                  *(_BYTE *)(v106 + 24) = 1;
                  *(_BYTE *)(v92 + 24) = 0;
                  v112 = *(_QWORD *)v106;
                  *(_QWORD *)(v92 + 8) = *(_QWORD *)v106;
                  if (v112)
                    *(_QWORD *)(v112 + 16) = v92;
                  *(_QWORD *)(v106 + 16) = *(_QWORD *)(v92 + 16);
                  *(_QWORD *)(*(_QWORD *)(v92 + 16) + 8 * (**(_QWORD **)(v92 + 16) != v92)) = v106;
                  *(_QWORD *)v106 = v92;
                  *(_QWORD *)(v92 + 16) = v106;
                  v105 = v92;
                }
                v109 = *(_QWORD *)(v106 + 16);
                *(_BYTE *)(v106 + 24) = *(_BYTE *)(v109 + 24);
                *(_BYTE *)(v109 + 24) = 1;
                *(_BYTE *)(v105 + 24) = 1;
                v110 = *(uint64_t **)v109;
                v113 = *(_QWORD *)(*(_QWORD *)v109 + 8);
                *(_QWORD *)v109 = v113;
                if (v113)
                  *(_QWORD *)(v113 + 16) = v109;
                v110[2] = *(_QWORD *)(v109 + 16);
                *(_QWORD *)(*(_QWORD *)(v109 + 16) + 8 * (**(_QWORD **)(v109 + 16) != v109)) = v110;
                v110[1] = v109;
                goto LABEL_182;
              }
              *(_BYTE *)(v92 + 24) = 0;
              v103 = *(uint64_t **)(v92 + 16);
              if (*((_BYTE *)v103 + 24))
                v107 = v103 == v70;
              else
                v107 = 1;
              if (v107)
                goto LABEL_163;
            }
            else
            {
              if (!*(_BYTE *)(v92 + 24))
              {
                *(_BYTE *)(v92 + 24) = 1;
                *(_BYTE *)(v98 + 24) = 0;
                v99 = *(uint64_t **)(v98 + 8);
                v100 = *v99;
                *(_QWORD *)(v98 + 8) = *v99;
                if (v100)
                  *(_QWORD *)(v100 + 16) = v98;
                v99[2] = *(_QWORD *)(v98 + 16);
                *(_QWORD *)(*(_QWORD *)(v98 + 16) + 8 * (**(_QWORD **)(v98 + 16) != v98)) = v99;
                *v99 = v98;
                *(_QWORD *)(v98 + 16) = v99;
                if (v70 == *(uint64_t **)v92)
                  v70 = (uint64_t *)v92;
                v92 = *(_QWORD *)(*(_QWORD *)v92 + 8);
              }
              v101 = *(_QWORD *)v92;
              if (*(_QWORD *)v92 && !*(_BYTE *)(v101 + 24))
              {
                v102 = *(_QWORD *)(v92 + 8);
                if (v102 && !*(_BYTE *)(v102 + 24))
                {
LABEL_169:
                  v101 = v92;
                }
                else
                {
                  *(_BYTE *)(v101 + 24) = 1;
                  *(_BYTE *)(v92 + 24) = 0;
                  v108 = *(_QWORD *)(v101 + 8);
                  *(_QWORD *)v92 = v108;
                  if (v108)
                    *(_QWORD *)(v108 + 16) = v92;
                  *(_QWORD *)(v101 + 16) = *(_QWORD *)(v92 + 16);
                  *(_QWORD *)(*(_QWORD *)(v92 + 16) + 8 * (**(_QWORD **)(v92 + 16) != v92)) = v101;
                  *(_QWORD *)(v101 + 8) = v92;
                  *(_QWORD *)(v92 + 16) = v101;
                  v102 = v92;
                }
                v109 = *(_QWORD *)(v101 + 16);
                *(_BYTE *)(v101 + 24) = *(_BYTE *)(v109 + 24);
                *(_BYTE *)(v109 + 24) = 1;
                *(_BYTE *)(v102 + 24) = 1;
                v110 = *(uint64_t **)(v109 + 8);
                v111 = *v110;
                *(_QWORD *)(v109 + 8) = *v110;
                if (v111)
                  *(_QWORD *)(v111 + 16) = v109;
                v110[2] = *(_QWORD *)(v109 + 16);
                *(_QWORD *)(*(_QWORD *)(v109 + 16) + 8 * (**(_QWORD **)(v109 + 16) != v109)) = v110;
                *v110 = v109;
LABEL_182:
                *(_QWORD *)(v109 + 16) = v110;
LABEL_183:
                operator delete(v74);
LABEL_96:
                v67 += 24;
                goto LABEL_70;
              }
              v102 = *(_QWORD *)(v92 + 8);
              if (v102 && !*(_BYTE *)(v102 + 24))
                goto LABEL_169;
              *(_BYTE *)(v92 + 24) = 0;
              v103 = *(uint64_t **)(v92 + 16);
              if (v103 == v70)
              {
                v103 = v70;
LABEL_163:
                *((_BYTE *)v103 + 24) = 1;
                goto LABEL_183;
              }
              if (!*((_BYTE *)v103 + 24))
                goto LABEL_163;
            }
            v92 = *(_QWORD *)(v103[2] + 8 * (*(_QWORD *)v103[2] == (_QWORD)v103));
          }
        }
        v114 = v66[4];
        v115 = *MEMORY[0x1E0D26A38];
        objc_msgSend(v161, "pointAtRouteCoordinate:", v114);
        v117 = v116;
        v119 = v118;
        v121 = v120;
        std::set<unsigned long>::set[abi:ne180100]((uint64_t *)buf, &v169);
        *(_QWORD *)&v191 = v117;
        *((_QWORD *)&v191 + 1) = v119;
        v192 = v121;
        v122 = &v181;
        v123 = &v181;
        v124 = v181;
        if (!v181)
          goto LABEL_193;
        v123 = &v181;
        while (1)
        {
          while (1)
          {
            v122 = (uint64_t **)v124;
            v125 = (uint64_t)(v124 + 4);
            if (!-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare::operator()(&v183, (uint64_t)buf, (uint64_t)(v124 + 4)))break;
            v124 = *v122;
            v123 = v122;
            if (!*v122)
              goto LABEL_193;
          }
          if (!-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare::operator()(&v183, v125, (uint64_t)buf))break;
          v123 = v122 + 1;
          v124 = v122[1];
          if (!v124)
            goto LABEL_193;
        }
        v126 = *v123;
        if (!*v123)
        {
LABEL_193:
          v127 = (char *)operator new(0x68uLL);
          v187[0] = v127;
          v187[1] = &v181;
          v188 = 0;
          std::set<unsigned long>::set[abi:ne180100]((uint64_t *)v127 + 4, buf);
          *(_OWORD *)(v127 + 56) = v191;
          v128 = v192;
          *((_QWORD *)v127 + 11) = 0;
          *((_QWORD *)v127 + 12) = 0;
          *((_QWORD *)v127 + 9) = v128;
          *((_QWORD *)v127 + 10) = 0;
          v188 = 1;
          v129 = (uint64_t *)v187[0];
          *(_QWORD *)v187[0] = 0;
          v129[1] = 0;
          v129[2] = (uint64_t)v122;
          *v123 = v129;
          if (*v180)
          {
            v180 = (uint64_t **)*v180;
            v129 = *v123;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v181, v129);
          ++v182;
          v126 = (uint64_t *)v187[0];
          v187[0] = 0;
          std::unique_ptr<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t)v187);
        }
        v131 = (char *)v126[11];
        v130 = v126[12];
        if ((unint64_t)v131 >= v130)
        {
          v133 = (char *)v126[10];
          v134 = 0xAAAAAAAAAAAAAAABLL * ((v131 - v133) >> 3) + 1;
          if (v134 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
          v135 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v130 - (_QWORD)v133) >> 3);
          if (2 * v135 > v134)
            v134 = 2 * v135;
          if (v135 >= 0x555555555555555)
            v136 = 0xAAAAAAAAAAAAAAALL;
          else
            v136 = v134;
          if (v136 > 0xAAAAAAAAAAAAAAALL)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v137 = (char *)operator new(24 * v136);
          v138 = (uint64_t *)&v137[8 * ((v131 - v133) >> 3)];
          *v138 = v114;
          v138[1] = v115;
          v138[2] = v13;
          if (v131 == v133)
          {
            v141 = &v137[8 * ((v131 - v133) >> 3)];
          }
          else
          {
            v139 = &v137[8 * ((v131 - v133) >> 3)];
            do
            {
              v140 = *(_OWORD *)(v131 - 24);
              v141 = v139 - 24;
              *((_QWORD *)v139 - 1) = *((_QWORD *)v131 - 1);
              *(_OWORD *)(v139 - 24) = v140;
              v131 -= 24;
              v139 -= 24;
            }
            while (v131 != v133);
          }
          v132 = v138 + 3;
          v126[10] = (uint64_t)v141;
          v126[11] = (uint64_t)(v138 + 3);
          v126[12] = (uint64_t)&v137[24 * v136];
          if (v133)
            operator delete(v133);
        }
        else
        {
          *(_QWORD *)v131 = v114;
          *((_QWORD *)v131 + 1) = v115;
          v132 = v131 + 24;
          *((_QWORD *)v131 + 2) = v13;
        }
        v126[11] = (uint64_t)v132;
        v142 = (uint64_t *)v66[1];
        if (v142)
        {
          do
          {
            v143 = (uint64_t **)v142;
            v142 = (uint64_t *)*v142;
          }
          while (v142);
        }
        else
        {
          do
          {
            v143 = (uint64_t **)v66[2];
            v107 = *v143 == v66;
            v66 = (uint64_t *)v143;
          }
          while (!v107);
        }
        if (v143 != v164 + 1)
        {
          *(v132 - 2) = v143[4];
          std::__tree<unsigned long>::destroy(*(_QWORD **)&buf[8]);
          v66 = (uint64_t *)v143;
          continue;
        }
        break;
      }
      *(v132 - 2) = objc_msgSend(v161, "endRouteCoordinate");
      std::__tree<unsigned long>::destroy(*(_QWORD **)&buf[8]);
LABEL_220:
      std::__tree<unsigned long>::destroy(v170);

      ++v13;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v182);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = (uint64_t *)v180;
    if (v180 != &v181)
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((v145[11] - v145[10]) >> 3));
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = (_QWORD *)v145[10];
        v148 = (_QWORD *)v145[11];
        while (v147 != v148)
        {
          v149 = objc_alloc_init(MNRouteDivergenceOverlappingSectionComponent);
          -[MNRouteDivergenceOverlappingSectionComponent setRouteIndex:](v149, "setRouteIndex:", v147[2]);
          -[MNRouteDivergenceOverlappingSectionComponent setRange:](v149, "setRange:", *v147, v147[1]);
          objc_msgSend(v146, "addObject:", v149);

          v147 += 3;
        }
        v150 = objc_alloc_init(MNRouteDivergenceOverlappingSection);
        -[MNRouteDivergenceOverlappingSection setComponents:](v150, "setComponents:", v146);
        objc_msgSend(v144, "addObject:", v150);

        v151 = (uint64_t *)v145[1];
        if (v151)
        {
          do
          {
            v152 = (uint64_t **)v151;
            v151 = (uint64_t *)*v151;
          }
          while (v151);
        }
        else
        {
          do
          {
            v152 = (uint64_t **)v145[2];
            v107 = *v152 == v145;
            v145 = (uint64_t *)v152;
          }
          while (!v107);
        }
        v145 = (uint64_t *)v152;
      }
      while (v152 != &v181);
    }
    MNGetMNRouteDivergenceLog();
    v153 = objc_claimAutoreleasedReturnValue();
    v154 = v153;
    if (v156 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v153))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v154, OS_SIGNPOST_INTERVAL_END, spid, "findOverlappingSectionsForRoutes", ", buf, 2u);
    }

    std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(v181);
    *(_QWORD *)buf = &v184;
    std::vector<std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    v144 = 0;
  }

  return v144;
}

- (char)findOverlappingSectionsForRoutes:(uint64_t *)a1
{
  char *v4;
  uint64_t **v5;
  unsigned int v6;
  float v7;
  char *v8;
  unsigned int v9;
  float v10;
  char *v11;
  uint64_t *v12;
  uint64_t *v13;

  v5 = a1 + 1;
  v4 = (char *)a1[1];
  if (!v4)
  {
    v8 = (char *)(a1 + 1);
    goto LABEL_14;
  }
  v6 = *a2;
  v7 = *((float *)a2 + 1);
  do
  {
    while (1)
    {
      v8 = v4;
      v9 = *((_DWORD *)v4 + 8);
      if (v6 >= v9)
        break;
LABEL_6:
      v4 = *(char **)v8;
      v5 = (uint64_t **)v8;
      if (!*(_QWORD *)v8)
        goto LABEL_14;
    }
    if (v6 == v9)
    {
      v10 = *((float *)v8 + 9);
      if (v7 < v10)
        goto LABEL_6;
      if (v10 >= v7)
        return v8 + 40;
    }
    else if (v9 >= v6)
    {
      return v8 + 40;
    }
    v4 = (char *)*((_QWORD *)v8 + 1);
  }
  while (v4);
  v5 = (uint64_t **)(v8 + 8);
LABEL_14:
  v11 = v8;
  v8 = (char *)operator new(0x40uLL);
  *((_QWORD *)v8 + 4) = *(_QWORD *)a2;
  *((_QWORD *)v8 + 5) = 0;
  *((_QWORD *)v8 + 6) = 0;
  *((_QWORD *)v8 + 7) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = v11;
  *v5 = (uint64_t *)v8;
  v12 = (uint64_t *)**a1;
  v13 = (uint64_t *)v8;
  if (v12)
  {
    *a1 = v12;
    v13 = *v5;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v13);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v8 + 40;
}

- (void)_findFirstDivergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  PolylineCoordinate end;
  PolylineCoordinate v10;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  PolylineCoordinate *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int IsInvalid;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  char v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  NSObject *v74;
  os_signpost_id_t spid;
  unint64_t v76;
  char v77;
  uint64_t start;
  uint64_t v79;
  id v80;
  id v81;
  MNRouteDivergenceFinder *v82;
  _QWORD v83[2];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  uint64_t v90;

  end = a6.end;
  start = (uint64_t)a6.start;
  v79 = (uint64_t)a4.start;
  v10 = a4.end;
  v90 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v81 = a5;
  MNGetMNRouteDivergenceLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v82 = self;
  v13 = os_signpost_id_make_with_pointer(v12, self);

  MNGetMNRouteDivergenceLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  spid = v13;
  v76 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v83[0] = v80;
    v83[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceFinder _routesArrayIdentifierStrings:](v82, "_routesArrayIdentifierStrings:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateRangeAsString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateRangeAsString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v85 = v17;
    v86 = 2112;
    v87 = v18;
    v88 = 2112;
    v89 = v19;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "_findFirstDivergenceBetweenRoute", "%@ [%@] [%@]", buf, 0x20u);

  }
  v20 = (PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a8 = *v20;
  objc_msgSend(v80, "pointAtRouteCoordinate:", v79);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v81, "pointAtRouteCoordinate:", start);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  GEOCalculateDistance();
  if (v33 <= v82->_toleranceMeters)
  {
    v36 = 1;
  }
  else
  {
    v34 = -[MNRouteDivergenceFinder _firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:](v82, "_firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:", v80, v79, v10, v28, v30, v32);
    v35 = -[MNRouteDivergenceFinder _firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:](v82, "_firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:", v81, start, end, v22, v24, v26);
    if (GEOPolylineCoordinateIsInvalid() && (GEOPolylineCoordinateIsInvalid() & 1) != 0)
    {
      *a7 = (PolylineCoordinate)v79;
      *a8 = (PolylineCoordinate)start;
      goto LABEL_68;
    }
    IsInvalid = GEOPolylineCoordinateIsInvalid();
    if ((IsInvalid & 1) != 0)
    {
      start = v35;
    }
    else
    {
      v38 = GEOPolylineCoordinateIsInvalid();
      v39 = v79;
      if (v38)
        v39 = v34;
      v79 = v39;
    }
    v36 = IsInvalid ^ 1;
  }
  objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", v79, v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", start, end);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  v42 = 0;
  v43 = 0.0;
  while (objc_msgSend(v40, "isCurrentValid") && objc_msgSend(v41, "isCurrentValid"))
  {
    if ((v36 & 1) != 0)
      v44 = v80;
    else
      v44 = v81;
    if ((v36 & 1) != 0)
      v45 = v81;
    else
      v45 = v80;
    if ((v36 & 1) != 0)
      v46 = v40;
    else
      v46 = v41;
    if ((v36 & 1) != 0)
      v47 = v41;
    else
      v47 = v40;
    v48 = v44;
    v49 = v45;
    v50 = v46;
    v51 = v47;
    objc_msgSend(v51, "previous");
    if (GEOPolylineCoordinateIsValid())
      v52 = objc_msgSend(v51, "previous");
    else
      v52 = objc_msgSend(v51, "current");
    v53 = v52;
    v54 = objc_msgSend(v51, "current");
    objc_msgSend(v49, "pointAtRouteCoordinate:", v53);
    objc_msgSend(v49, "pointAtRouteCoordinate:", v54);
    v56 = v55;
    v58 = v57;
    v60 = v59;
    objc_msgSend(v48, "pointAtRouteCoordinate:", objc_msgSend(v50, "current"));
    -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](v82, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", v56, v58, v60);
    if (v61 >= v82->_toleranceMeters)
    {
      if (v43 <= 0.0)
      {
        if ((v42 & 1) != 0)
        {
          v62 = 0;
          v77 = 1;
          v42 = 1;
        }
        else
        {
          v36 ^= 1u;
          v42 = 1;
          v62 = 1;
        }
        goto LABEL_43;
      }
      objc_msgSend(v51, "advance");
    }
    else
    {
      if (v61 <= 0.01)
        goto LABEL_41;
      if (v43 <= 0.0)
      {
        v42 = 0;
        v36 ^= 1u;
        v62 = 1;
        v43 = v61;
        goto LABEL_43;
      }
      if (v61 <= v43)
      {
LABEL_41:
        objc_msgSend(v50, "advance");
        v42 = 0;
        goto LABEL_42;
      }
      objc_msgSend(v51, "advance");
      v42 = 0;
    }
    v36 ^= 1u;
LABEL_42:
    v62 = 1;
    v43 = 0.0;
LABEL_43:

    if ((v62 & 1) == 0)
      break;
  }
  if ((v77 & 1) != 0)
  {
    objc_msgSend(v40, "previous");
    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      objc_msgSend(v41, "previous");
      if (GEOPolylineCoordinateIsValid())
        v63 = objc_msgSend(v41, "previous");
      else
        v63 = objc_msgSend(v41, "current");
      objc_msgSend(v81, "pointAtRouteCoordinate:", v63);
      v79 = -[MNRouteDivergenceFinder _closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:](v82, "_closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:", v80, objc_msgSend(v40, "previous"), objc_msgSend(v40, "current"), v67, v68, v69);
    }
    *a7 = (PolylineCoordinate)v79;
    objc_msgSend(v41, "previous");
    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      objc_msgSend(v40, "previous");
      if (GEOPolylineCoordinateIsValid())
        v70 = objc_msgSend(v40, "previous");
      else
        v70 = objc_msgSend(v40, "current");
      objc_msgSend(v80, "pointAtRouteCoordinate:", v70);
      start = -[MNRouteDivergenceFinder _closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:](v82, "_closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:", v81, objc_msgSend(v41, "previous"), objc_msgSend(v41, "current"), v71, v72, v73);
    }
    *a8 = (PolylineCoordinate)start;
    MNGetMNRouteDivergenceLog();
    v74 = objc_claimAutoreleasedReturnValue();
    v65 = v74;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      *(_WORD *)buf = 0;
      v66 = "Divergence found";
LABEL_66:
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v65, OS_SIGNPOST_INTERVAL_END, spid, "_findFirstDivergenceBetweenRoute", v66, buf, 2u);
    }
  }
  else
  {
    MNGetMNRouteDivergenceLog();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_WORD *)buf = 0;
      v66 = "No divergence found";
      goto LABEL_66;
    }
  }

LABEL_68:
}

- (BOOL)_pathsDivergeBetweenRoute:(id)a3 from:(PolylineCoordinate)a4 andRoute:(id)a5 from:(PolylineCoordinate)a6 withinDistance:(double)a7
{
  id v12;
  id v13;
  char IsValid;
  unint64_t v16;
  unint64_t v17;

  v12 = a3;
  v13 = a5;
  v16 = 0xBF80000000000000;
  v17 = 0xBF80000000000000;
  -[MNRouteDivergenceFinder _findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](self, "_findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v12, a4, objc_msgSend(v12, "routeCoordinateForDistance:afterRouteCoordinate:", a4, a7), v13, a6, objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", a6, a7), &v17, &v16);
  if ((GEOPolylineCoordinateIsValid() & 1) != 0)
    IsValid = 1;
  else
    IsValid = GEOPolylineCoordinateIsValid();

  return IsValid;
}

- (void)_findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  PolylineCoordinate *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  float v28;
  double v29;
  double v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  unsigned int v38;
  float v39;
  double v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  PolylineCoordinate v45;
  PolylineCoordinate v46;
  uint64_t v47;
  uint64_t v48;
  PolylineCoordinate v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  PolylineCoordinate *v55;
  PolylineCoordinate *v56;
  uint64_t v57;
  os_signpost_id_t spid;
  uint64_t v59;
  NSObject *v60;
  unint64_t v61;
  MNRouteDivergenceFinder *v62;
  id v63;
  id v64;
  uint8_t v66[8];
  unint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _QWORD v78[2];
  _BYTE buf[12];
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v63 = a5;
  MNGetMNRouteDivergenceLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v62 = self;
  v14 = os_signpost_id_make_with_pointer(v13, self);

  MNGetMNRouteDivergenceLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v61 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v78[0] = v64;
    v78[1] = v63;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNRouteDivergenceFinder _routesArrayIdentifierStrings:](v62, "_routesArrayIdentifierStrings:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsShortString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsShortString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v18;
    v80 = 2112;
    v81 = v19;
    v82 = 2112;
    v83 = v20;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "_findFirstConvergenceBetweenRoute", "%@ [%@] [%@]", buf, 0x20u);

  }
  v21 = (PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a8 = *v21;
  if (objc_msgSend(v64, "pointCount") && objc_msgSend(v63, "pointCount"))
  {
    objc_msgSend(v64, "_navigation_allLeafBoundingSections");
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v60 = v22;
    v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v73;
      spid = v14;
      v55 = a7;
      v56 = a8;
      v54 = *(_QWORD *)v73;
      do
      {
        v25 = 0;
        v57 = v23;
        do
        {
          if (*(_QWORD *)v73 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v25);
          objc_msgSend(v26, "range");
          if (v27 >= a4.index)
          {
            *(float *)&v29 = v28;
            if (v27 != a4.index || v28 >= a4.offset)
            {
              objc_msgSend(v64, "pointAt:", objc_msgSend(v26, "range", v29));
              GEOMapPointsPerMeterAtLatitude();
              v59 = v25;
              objc_msgSend(v63, "_navigation_leafBoundingSectionsIntersectingSection:paddingMapPoints:", v26, v31 * v62->_toleranceMeters);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v33 = v32;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
              if (v34)
              {
                v35 = *(_QWORD *)v69;
                while (2)
                {
                  for (i = 0; i != v34; ++i)
                  {
                    if (*(_QWORD *)v69 != v35)
                      objc_enumerationMutation(v33);
                    v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                    objc_msgSend(v37, "range");
                    if (v38 >= a6.index)
                    {
                      *(float *)&v40 = v39;
                      if (v38 != a6.index || v39 >= a6.offset)
                      {
                        v42 = objc_msgSend(v26, "range", v40);
                        v44 = v43;
                        v45 = a4;
                        if (!GEOPolylineCoordinateIsABeforeB())
                          v45 = (PolylineCoordinate)v42;
                        v46 = (PolylineCoordinate)objc_msgSend(v37, "range");
                        v48 = v47;
                        v49 = GEOPolylineCoordinateIsABeforeB() ? a6 : v46;
                        *(_QWORD *)buf = 0xBF80000000000000;
                        v67 = 0xBF80000000000000;
                        -[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](v62, "_findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v64, v45, v44, v63, v49, v48, buf, &v67);
                        if (GEOPolylineCoordinateIsValid())
                        {
                          if (GEOPolylineCoordinateIsValid())
                          {
                            *v55 = *(PolylineCoordinate *)buf;
                            *v56 = (PolylineCoordinate)v67;
                            MNGetMNRouteDivergenceLog();
                            v52 = objc_claimAutoreleasedReturnValue();
                            v53 = v52;
                            if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
                            {
                              *(_WORD *)v66 = 0;
                              _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v53, OS_SIGNPOST_INTERVAL_END, spid, "_findFirstConvergenceBetweenRoute", "Convergence found", v66, 2u);
                            }

                            v22 = v60;
                            v51 = v60;
                            goto LABEL_45;
                          }
                        }
                      }
                    }
                  }
                  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
                  if (v34)
                    continue;
                  break;
                }
              }

              v14 = spid;
              v22 = v60;

              v23 = v57;
              v24 = v54;
              v25 = v59;
            }
          }
          ++v25;
        }
        while (v25 != v23);
        v23 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      }
      while (v23);
    }

    MNGetMNRouteDivergenceLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v61 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v50))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v51, OS_SIGNPOST_INTERVAL_END, v14, "_findFirstConvergenceBetweenRoute", "Convergence not found", buf, 2u);
    }
LABEL_45:

  }
}

- (void)_findFirstConvergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  PolylineCoordinate v11;
  PolylineCoordinate v12;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  PolylineCoordinate v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  __int128 *v28;
  float v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint8x8_t v33;
  unint64_t v34;
  uint8x8_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 *v46;
  float v47;
  int *v48;
  float v49;
  _BOOL8 v50;
  unint64_t v51;
  unint64_t v52;
  size_t v53;
  __int128 **v54;
  __int128 *v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  __int128 *v59;
  __int128 *v60;
  unint64_t v61;
  __int128 *v62;
  _QWORD *v63;
  double v64;
  int8x8_t v66;
  unint64_t v67;
  uint8x8_t v68;
  __int128 *v69;
  __int128 *v70;
  __int128 *v71;
  __int128 *v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  __int128 *v76;
  PolylineCoordinate *v77;
  PolylineCoordinate v78;
  NSObject *v79;
  PolylineCoordinate v80;
  PolylineCoordinate v81;
  void *v82;
  void *v83;
  unint64_t v84;
  PolylineCoordinate v85;
  unint64_t v86;
  unint64_t v87;
  _QWORD *v88;
  uint64_t *v89;
  int v90;
  double v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  int v95;
  __int128 v96;
  __int128 v97;
  int v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE buf[12];
  __int16 v103;
  const char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  const char *v108;
  uint64_t v109;

  end = a6.end;
  start = a6.start;
  v11 = a4.end;
  v12 = a4.start;
  v109 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v100 = 0u;
  v101 = 0u;
  v99 = 0u;
  -[MNRouteDivergenceFinder _populateConvergencePoints:route:range:isRouteA:](self, "_populateConvergencePoints:route:range:isRouteA:", &v99, v14, v12, v11, 1);
  -[MNRouteDivergenceFinder _populateConvergencePoints:route:range:isRouteA:](self, "_populateConvergencePoints:route:range:isRouteA:", &v99, v15, start, end, 0);
  v16 = (uint64_t *)(*((_QWORD *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A));
  if ((_QWORD)v100 == *((_QWORD *)&v99 + 1))
  {
    v17 = 0;
    v19 = 0;
    v18 = (uint64_t *)(*((_QWORD *)&v99 + 1)
                    + (((unint64_t)((((*((_QWORD *)&v101 + 1) + (_QWORD)v101) >> 1)
                                          * (unsigned __int128)0xC30C30C30C30C30DLL) >> 64) >> 1) & 0x3FFFFFFFFFFFFFF8));
  }
  else
  {
    v17 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A))
        + 96 * ((unint64_t)v101 % 0x2A);
    v18 = (uint64_t *)(*((_QWORD *)&v99 + 1) + 8 * ((*((_QWORD *)&v101 + 1) + (_QWORD)v101) / 0x2AuLL));
    v19 = *v18 + 96 * ((*((_QWORD *)&v101 + 1) + (_QWORD)v101) % 0x2AuLL);
  }
  v80 = start;
  v81 = end;
  if (v19 == v17
    || (v20 = 42 * (v18 - v16)
            - 0x5555555555555555 * ((uint64_t)(v19 - *v18) >> 5)
            + 0x5555555555555555 * ((v17 - *v16) >> 5)) == 0)
  {
    v21 = 0;
  }
  else
  {
    v21 = 63 - __clz(v20);
  }
  std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>,false>(v16, v17, v18, v19, 2 * v21, 1);
  v23 = *MEMORY[0x1E0D26A38];
  v22 = *(unsigned int *)(MEMORY[0x1E0D26A38] + 4);
  v24 = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
  v96 = 0u;
  v97 = 0u;
  v98 = 1065353216;
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)&v96, 0xAuLL);
  v82 = v15;
  v83 = v14;
  v93 = 0u;
  v94 = 0u;
  v95 = 1065353216;
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)&v93, 0xAuLL);
  if ((_QWORD)v100 == *((_QWORD *)&v99 + 1))
    goto LABEL_134;
  v25 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A)) + 96 * ((unint64_t)v101 % 0x2A);
  v84 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * ((*((_QWORD *)&v101 + 1) + (_QWORD)v101) / 0x2AuLL))
      + 96 * ((*((_QWORD *)&v101 + 1) + (_QWORD)v101) % 0x2AuLL);
  if (v25 == v84)
    goto LABEL_134;
  v26 = 1.79769313e308;
  v27 = *((_QWORD *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A);
  do
  {
    v88 = (_QWORD *)v27;
    v90 = *(unsigned __int8 *)(v25 + 89);
    if (*(_BYTE *)(v25 + 89))
      v28 = &v96;
    else
      v28 = &v93;
    v29 = *(float *)(v25 + 76) + (float)*(unsigned int *)(v25 + 72);
    if (v29 == 0.0)
      v30 = 0;
    else
      v30 = LODWORD(v29);
    v89 = (uint64_t *)v28;
    v31 = *((_QWORD *)v28 + 1);
    if (*(_BYTE *)(v25 + 88))
    {
      v85 = v24;
      v86 = v22;
      v32 = (uint64_t *)v28;
      if (v31)
      {
        v33 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
        v33.i16[0] = vaddlv_u8(v33);
        v34 = v33.u32[0];
        if (v33.u32[0] > 1uLL)
        {
          v22 = v30;
          if (v30 >= v31)
            v22 = v30 % v31;
        }
        else
        {
          v22 = v30 & (v31 + 0xFFFFFFFF);
        }
        v38 = *(_QWORD **)(*(_QWORD *)v28 + 8 * v22);
        if (v38)
        {
          v39 = (_QWORD *)*v38;
          if (*v38)
          {
            while (1)
            {
              v40 = v39[1];
              if (v40 == v30)
              {
                if ((GEOPolylineCoordinateEqual() & 1) != 0)
                  goto LABEL_83;
              }
              else
              {
                if (v34 > 1)
                {
                  if (v40 >= v31)
                    v40 %= v31;
                }
                else
                {
                  v40 &= v31 - 1;
                }
                if (v40 != v22)
                {
LABEL_37:
                  v32 = v89;
                  break;
                }
              }
              v39 = (_QWORD *)*v39;
              if (!v39)
                goto LABEL_37;
            }
          }
        }
      }
      v41 = operator new(0x70uLL);
      *v41 = 0;
      v41[1] = v30;
      v42 = *(_OWORD *)(v25 + 16);
      *((_OWORD *)v41 + 1) = *(_OWORD *)v25;
      *((_OWORD *)v41 + 2) = v42;
      v43 = *(_OWORD *)(v25 + 32);
      v44 = *(_OWORD *)(v25 + 48);
      v45 = *(_OWORD *)(v25 + 80);
      *((_OWORD *)v41 + 5) = *(_OWORD *)(v25 + 64);
      *((_OWORD *)v41 + 6) = v45;
      *((_OWORD *)v41 + 3) = v43;
      *((_OWORD *)v41 + 4) = v44;
      if (v90)
        v46 = &v96;
      else
        v46 = &v93;
      v47 = (float)(unint64_t)(*((_QWORD *)v46 + 3) + 1);
      v48 = &v95;
      if (v90)
        v48 = &v98;
      v49 = *(float *)v48;
      if (!v31 || (float)(v49 * (float)v31) < v47)
      {
        v50 = (v31 & (v31 - 1)) != 0;
        if (v31 < 3)
          v50 = 1;
        v51 = v50 | (2 * v31);
        v52 = vcvtps_u32_f32(v47 / v49);
        if (v51 <= v52)
          v53 = v52;
        else
          v53 = v51;
        std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)v32, v53);
        v31 = v32[1];
        if ((v31 & (v31 - 1)) != 0)
        {
          if (v30 >= v31)
            v22 = v30 % v31;
          else
            v22 = v30;
        }
        else
        {
          v22 = ((_DWORD)v31 - 1) & v30;
        }
      }
      v57 = *v32;
      v58 = *(_QWORD **)(*v32 + 8 * v22);
      if (v58)
      {
        *v41 = *v58;
      }
      else
      {
        v59 = &v93;
        if (v90)
          v59 = &v96;
        v60 = &v94;
        if (v90)
          v60 = &v97;
        *v41 = *((_QWORD *)v59 + 2);
        *((_QWORD *)v59 + 2) = v41;
        *(_QWORD *)(v57 + 8 * v22) = v60;
        if (!*v41)
          goto LABEL_82;
        v61 = *(_QWORD *)(*v41 + 8);
        if ((v31 & (v31 - 1)) != 0)
        {
          if (v61 >= v31)
            v61 %= v31;
        }
        else
        {
          v61 &= v31 - 1;
        }
        v58 = (_QWORD *)(*v32 + 8 * v61);
      }
      *v58 = v41;
LABEL_82:
      ++*((_QWORD *)v46 + 3);
LABEL_83:
      v62 = &v97;
      if (v90)
        v62 = &v94;
      v63 = *(_QWORD **)v62;
      v24 = v85;
      v22 = v86;
      if (!*(_QWORD *)v62)
        goto LABEL_98;
      while (1)
      {
        *(_QWORD *)buf = 0xBF80000000000000;
        v91 = 0.0;
        v92 = 0xBF80000000000000;
        if (-[MNRouteDivergenceFinder _pointMeetsConvergenceThreshold:withOtherPoint:outRouteCoordinateA:outRouteCoordinateB:outDistance:](self, "_pointMeetsConvergenceThreshold:withOtherPoint:outRouteCoordinateA:outRouteCoordinateB:outDistance:", v25, v63 + 2, buf, &v92, &v91, v80, v81))
        {
          v64 = self->_toleranceMeters * 0.5;
          if (v91 < v64 && v26 < v64)
          {
            if (*(_DWORD *)buf >= v23 && (*(_DWORD *)buf != v23 || *(float *)&buf[4] >= *(float *)&v22))
              goto LABEL_97;
          }
          else if (v91 >= v26)
          {
            goto LABEL_97;
          }
          v23 = *(_DWORD *)buf;
          v22 = *(unsigned int *)&buf[4];
          v26 = v91;
          v24 = (PolylineCoordinate)v92;
        }
LABEL_97:
        v63 = (_QWORD *)*v63;
        if (!v63)
          goto LABEL_98;
      }
    }
    if (!v31)
      goto LABEL_98;
    v87 = v22;
    v35 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
    v35.i16[0] = vaddlv_u8(v35);
    v36 = v35.u32[0];
    if (v35.u32[0] > 1uLL)
    {
      v37 = v30;
      if (v30 >= v31)
        v37 = v30 % v31;
    }
    else
    {
      v37 = v30 & (v31 + 0xFFFFFFFF);
    }
    v54 = *(__int128 ***)(*(_QWORD *)v28 + 8 * v37);
    if (!v54 || (v55 = *v54) == 0)
    {
LABEL_67:
      v22 = v87;
      goto LABEL_98;
    }
    while (1)
    {
      v56 = *((_QWORD *)v55 + 1);
      if (v56 == v30)
        break;
      if (v36 > 1)
      {
        if (v56 >= v31)
          v56 %= v31;
      }
      else
      {
        v56 &= v31 - 1;
      }
      if (v56 != v37)
        goto LABEL_67;
LABEL_66:
      v55 = *(__int128 **)v55;
      if (!v55)
        goto LABEL_67;
    }
    if ((GEOPolylineCoordinateEqual() & 1) == 0)
      goto LABEL_66;
    v66 = (int8x8_t)v89[1];
    v67 = *((_QWORD *)v55 + 1);
    v68 = (uint8x8_t)vcnt_s8(v66);
    v68.i16[0] = vaddlv_u8(v68);
    if (v68.u32[0] > 1uLL)
    {
      if (v67 >= *(_QWORD *)&v66)
        v67 %= *(_QWORD *)&v66;
    }
    else
    {
      v67 &= *(_QWORD *)&v66 - 1;
    }
    v69 = *(__int128 **)v55;
    v70 = *(__int128 **)(*v89 + 8 * v67);
    do
    {
      v71 = v70;
      v70 = *(__int128 **)v70;
    }
    while (v70 != v55);
    v72 = &v94;
    if (v90)
      v72 = &v97;
    v22 = v87;
    if (v71 == v72)
      goto LABEL_121;
    v73 = *((_QWORD *)v71 + 1);
    if (v68.u32[0] > 1uLL)
    {
      if (v73 >= *(_QWORD *)&v66)
        v73 %= *(_QWORD *)&v66;
    }
    else
    {
      v73 &= *(_QWORD *)&v66 - 1;
    }
    if (v73 == v67)
    {
LABEL_123:
      if (v69)
      {
        v74 = *((_QWORD *)v69 + 1);
        goto LABEL_125;
      }
    }
    else
    {
LABEL_121:
      if (!v69)
        goto LABEL_122;
      v74 = *((_QWORD *)v69 + 1);
      if (v68.u32[0] > 1uLL)
      {
        v75 = *((_QWORD *)v69 + 1);
        if (v74 >= *(_QWORD *)&v66)
          v75 = v74 % *(_QWORD *)&v66;
      }
      else
      {
        v75 = v74 & (*(_QWORD *)&v66 - 1);
      }
      if (v75 != v67)
      {
LABEL_122:
        *(_QWORD *)(*v89 + 8 * v67) = 0;
        v69 = *(__int128 **)v55;
        goto LABEL_123;
      }
LABEL_125:
      if (v68.u32[0] > 1uLL)
      {
        if (v74 >= *(_QWORD *)&v66)
          v74 %= *(_QWORD *)&v66;
      }
      else
      {
        v74 &= *(_QWORD *)&v66 - 1;
      }
      if (v74 != v67)
      {
        *(_QWORD *)(*v89 + 8 * v74) = v71;
        v69 = *(__int128 **)v55;
      }
    }
    *(_QWORD *)v71 = v69;
    *(_QWORD *)v55 = 0;
    v76 = &v93;
    if (v90)
      v76 = &v96;
    --*((_QWORD *)v76 + 3);
    operator delete(v55);
LABEL_98:
    v25 += 96;
    v27 = (unint64_t)v88;
    if (v25 - *v88 == 4032)
    {
      v27 = (unint64_t)(v88 + 1);
      v25 = v88[1];
    }
  }
  while (v25 != v84);
LABEL_134:
  v77 = (PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E0D26A38];
  *a8 = *v77;
  v78 = (PolylineCoordinate)(v23 | (v22 << 32));
  if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
  {
    if (!GEOPolylineCoordinateInRange() || (GEOPolylineCoordinateInRange() & 1) == 0)
    {
      GEOFindOrCreateLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCo"
                             "ordinate:outRouteCoordinate:]";
        v103 = 2080;
        v104 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
        v105 = 1024;
        v106 = 1071;
        v107 = 2080;
        v108 = "GEOPolylineCoordinateInRange(convergenceCoordinateA, rangeA) && GEOPolylineCoordinateInRange(convergenceC"
               "oordinateB, rangeB)";
        _os_log_impl(&dword_1B0AD7000, v79, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }

    }
    if (self->_minLengthMetersForConvergence <= 0.0
      || !-[MNRouteDivergenceFinder _pathsDivergeBetweenRoute:from:andRoute:from:withinDistance:](self, "_pathsDivergeBetweenRoute:from:andRoute:from:withinDistance:", v83, v78, v82, v24))
    {
      *a7 = v78;
      *a8 = v24;
    }
  }
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&v93);
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&v96);
  std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100]((uint64_t)&v99);

}

- (void)_populateConvergencePoints:(void *)a3 route:(id)a4 range:(GEOPolylineCoordinateRange)a5 isRouteA:(BOOL)a6
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  unint64_t v10;
  PolylineCoordinate v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  __int128 *v37;
  double v38;
  PolylineCoordinate v39;
  unint64_t v40;
  id v41;
  id v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  double v47;
  __int128 v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  BOOL v53;
  _QWORD v54[3];
  __int128 v55;
  double v56;
  __int128 v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  BOOL v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  double v66;
  __int128 v67;
  double v68;

  end = a5.end;
  start = a5.start;
  v43 = a4;
  v41 = objc_alloc_init(MEMORY[0x1E0D27378]);
  v10 = objc_msgSend(v43, "legIndexForRouteCoordinate:", start);
  v39 = end;
  v11 = start;
  while (1)
  {
    objc_msgSend(v43, "legs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v10 >= v13)
      break;
    objc_msgSend(v43, "legs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "startRouteCoordinate");
    v17 = objc_msgSend(v15, "endRouteCoordinate");
    if ((GEOPolylineCoordinateRangeIntersectsRange() & 1) == 0)
      goto LABEL_13;
    if (GEOPolylineCoordinateIsABeforeB())
      v18 = v16;
    else
      v18 = (uint64_t)v11;
    if (GEOPolylineCoordinateRangeEncompassesRange())
    {
      objc_msgSend(v41, "addCoordinateRange:", v18, end);
LABEL_13:

      break;
    }
    if (GEOPolylineCoordinateIsABeforeB())
      end = v39;
    else
      end = (PolylineCoordinate)v17;
    objc_msgSend(v41, "addCoordinateRange:", v18, end);

    ++v10;
  }
  v19 = 0;
  if (self->_toleranceMeters <= 0.0)
    v20 = 0.0;
  else
    v20 = INFINITY;
  while (v19 < objc_msgSend(v41, "count"))
  {
    v40 = v19;
    v21 = objc_msgSend(v41, "coordinateRangeAtIndex:", v19);
    objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "advance");
    while (objc_msgSend(v23, "isCurrentValid"))
    {
      objc_msgSend(v43, "pointAtRouteCoordinate:", objc_msgSend(v23, "previous"));
      v25 = v24;
      v27 = v26;
      v29 = v28;
      *(double *)&v67 = v24;
      *((double *)&v67 + 1) = v26;
      v68 = v28;
      objc_msgSend(v43, "pointAtRouteCoordinate:", objc_msgSend(v23, "current"));
      *(double *)&v65 = v30;
      *((double *)&v65 + 1) = v31;
      v66 = v32;
      if (vabdd_f64(v25, v30) >= 0.00000000999999994
        || vabdd_f64(v27, v31) >= 0.00000000999999994
        || vabdd_f64(v29, v32) >= 0.00000000999999994)
      {
        v33 = v31 < v27;
        if (v31 >= v27)
          v34 = v25;
        else
          v34 = v30;
        if (v31 >= v27)
          v35 = v27;
        else
          v35 = v31;
        if (v31 >= v27)
          v36 = v29;
        else
          v36 = v32;
        v37 = &v65;
        if (v33)
          v37 = &v67;
        v63 = *v37;
        v64 = *((_QWORD *)v37 + 2);
        if (fabs(v20) == INFINITY)
        {
          GEOCalculateDistance();
          v20 = -1.0 / v38 * self->_toleranceMeters;
        }
        *(double *)v54 = v34;
        *(double *)&v54[1] = v35 + v20;
        *(double *)&v54[2] = v36;
        v55 = v67;
        v56 = v68;
        v57 = v65;
        v58 = v66;
        v59 = objc_msgSend(v23, "previous");
        v60 = objc_msgSend(v23, "current");
        v61 = 1;
        v62 = a6;
        std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(a3, (uint64_t)v54);
        v44 = v63;
        v45 = v64;
        v46 = v67;
        v47 = v68;
        v48 = v65;
        v49 = v66;
        v50 = objc_msgSend(v23, "previous");
        v51 = objc_msgSend(v23, "current");
        v52 = 0;
        v53 = a6;
        objc_msgSend(v23, "advance", std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(a3, (uint64_t)&v44).n128_f64[0]);
      }
      else
      {
        objc_msgSend(v23, "advance");
      }
    }

    v19 = v40 + 1;
  }

}

- (BOOL)_pointMeetsConvergenceThreshold:(const _MNRouteConvergencePoint *)a3 withOtherPoint:(const _MNRouteConvergencePoint *)a4 outRouteCoordinateA:(PolylineCoordinate *)a5 outRouteCoordinateB:(PolylineCoordinate *)a6 outDistance:(double *)a7
{
  const _MNRouteConvergencePoint *v11;
  const _MNRouteConvergencePoint *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double toleranceMeters;
  _BOOL4 v18;
  double v19;
  float v20;
  float offset;
  float v22;
  PolylineCoordinate v23;
  int IsInvalid;
  uint64_t v25;
  unsigned int v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  PolylineCoordinate v32;
  unsigned int v33;
  float v34;
  double v35;

  if (a3->var6)
    v11 = a3;
  else
    v11 = a4;
  if (a3->var6)
    v12 = a4;
  else
    v12 = a3;
  -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", v11->var1.var0, v11->var1.var1, v11->var1.var2, v12->var1.var0, v12->var1.var1, v12->var1.var2, *(_QWORD *)&v12->var2.var0, *(_QWORD *)&v12->var2.var1, *(_QWORD *)&v12->var2.var2);
  v14 = v13;
  -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", v12->var1.var0, v12->var1.var1, v12->var1.var2, v11->var1.var0, v11->var1.var1, v11->var1.var2, *(_QWORD *)&v11->var2.var0, *(_QWORD *)&v11->var2.var1, *(_QWORD *)&v11->var2.var2);
  v16 = v15;
  toleranceMeters = self->_toleranceMeters;
  v18 = v16 <= toleranceMeters || v14 <= toleranceMeters;
  if (v18)
  {
    a5->index = v11->var3.index;
    -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", v12->var1.var0, v12->var1.var1, v12->var1.var2, v11->var1.var0, v11->var1.var1, v11->var1.var2, *(_QWORD *)&v11->var2.var0, *(_QWORD *)&v11->var2.var1, *(_QWORD *)&v11->var2.var2);
    v20 = v19;
    a5->offset = v20;
    offset = v11->var3.offset;
    v22 = v11->var4.offset;
    if (offset > 0.0 || v22 > 0.0)
    {
      if (v22 <= 0.0)
        v22 = 1.0;
      a5->offset = offset + (float)((float)(v22 - offset) * v20);
    }
    v23 = *a5;
    IsInvalid = GEOPolylineCoordinateIsInvalid();
    v25 = MEMORY[0x1E0D26A38];
    if (IsInvalid)
    {
      v26 = *MEMORY[0x1E0D26A38];
      v27 = *(float *)(MEMORY[0x1E0D26A38] + 4);
    }
    else
    {
      v27 = v23.offset - floorf(v23.offset);
      v26 = vcvtms_u32_f32(v23.offset) + v23.index;
    }
    *a5 = (PolylineCoordinate)(v26 | ((unint64_t)LODWORD(v27) << 32));
    a6->index = v12->var3.index;
    -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", v11->var1.var0, v11->var1.var1, v11->var1.var2, v12->var1.var0, v12->var1.var1, v12->var1.var2, *(_QWORD *)&v12->var2.var0, *(_QWORD *)&v12->var2.var1, *(_QWORD *)&v12->var2.var2);
    v29 = v28;
    a6->offset = v29;
    v30 = v12->var3.offset;
    v31 = v12->var4.offset;
    if (v30 > 0.0 || v31 > 0.0)
    {
      if (v31 <= 0.0)
        v31 = 1.0;
      a6->offset = v30 + (float)((float)(v31 - v30) * v29);
    }
    v32 = *a6;
    if (GEOPolylineCoordinateIsInvalid())
    {
      v33 = *(_DWORD *)v25;
      v34 = *(float *)(v25 + 4);
    }
    else
    {
      v34 = v32.offset - floorf(v32.offset);
      v33 = vcvtms_u32_f32(v32.offset) + v32.index;
    }
    *a6 = (PolylineCoordinate)(v33 | ((unint64_t)LODWORD(v34) << 32));
    if (v14 >= v16)
      v35 = v16;
    else
      v35 = v14;
    *a7 = v35;
  }
  return v18;
}

- (PolylineCoordinate)_firstRouteCoordinateWithinToleranceOnRoute:(id)a3 nearCoordinate:(id)a4 range:(GEOPolylineCoordinateRange)a5
{
  double v5;
  double v6;
  double v7;
  PolylineCoordinate end;
  double var1;
  double var0;
  PolylineCoordinate start;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  NSObject *v39;
  PolylineCoordinate v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  double v46;
  os_signpost_id_t spid;
  double var2;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  end = a5.end;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  start = a5.start;
  v58 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  MNGetMNRouteDivergenceLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, self);

  MNGetMNRouteDivergenceLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  spid = v15;
  v18 = v15 - 1;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v13, "uniqueRouteID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateRangeAsString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v51 = v20;
    v52 = 2048;
    v53 = var0;
    v54 = 2048;
    v55 = var1;
    v56 = 2112;
    v57 = v21;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "_firstRouteCoordinate", "Route: %@ | %f, %f | [%@]", buf, 0x2Au);

  }
  objc_msgSend(v13, "_navigation_leafBoundingSectionContainingCoordinate:", var0, var1, var2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "range");
    if (GEOPolylineCoordinateWithinRange())
    {
      objc_msgSend(v23, "range");
      MNGetMNRouteDivergenceLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        GEOPolylineCoordinateRangeAsString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v26;
        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v25, OS_SIGNPOST_EVENT, spid, "_firstRouteCoordinate", "Optimizing search range start using bounding section. New search range is: [%@]", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", start, end);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "advance");
    if (objc_msgSend(v27, "isCurrentValid"))
    {
      objc_msgSend(v13, "pointAtRouteCoordinate:", objc_msgSend(v27, "previous"));
      v6 = v28;
      v7 = v29;
      v5 = v30;
    }
    while (objc_msgSend(v27, "isCurrentValid"))
    {
      objc_msgSend(v13, "pointAtRouteCoordinate:", objc_msgSend(v27, "current"));
      v32 = v31;
      v34 = v33;
      v36 = v35;
      -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", var0, var1, var2, v6, v7, v5, *(_QWORD *)&v31, *(_QWORD *)&v33, *(_QWORD *)&v35);
      if (v37 < self->_toleranceMeters)
      {
        v40 = -[MNRouteDivergenceFinder _routeCoordinateForLocationCoordinate:route:startIndex:](self, "_routeCoordinateForLocationCoordinate:route:startIndex:", v13, objc_msgSend(v27, "previous"), var0, var1, var2);
        MNGetMNRouteDivergenceLog();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          GEOPolylineCoordinateAsShortString();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          GEOPolylineCoordinateRangeAsString();
          v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v51 = v45;
          v52 = 2112;
          v53 = v46;
          _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v44, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Found result at: [%@], range: [%@]", buf, 0x16u);

        }
        goto LABEL_27;
      }
      objc_msgSend(v27, "advance");
      v6 = v32;
      v7 = v34;
      v5 = v36;
    }
    MNGetMNRouteDivergenceLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v42, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Searched entire range and found no valid point on route near coordinate", buf, 2u);
    }

    v40 = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
LABEL_27:

  }
  else
  {
    MNGetMNRouteDivergenceLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v39, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Checked route bounds and found no valid point on route near coordinate", buf, 2u);
    }

    v40 = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
  }

  return v40;
}

- (double)_distanceFromCoordinate:(id)a3 toSegmentStart:(id)a4 segmentEnd:(id)a5
{
  double result;

  GEOClosestCoordinateOnLineSegmentFromCoordinate3D();
  GEOCalculateDistance();
  return result;
}

- (PolylineCoordinate)_closestRouteCoordinateOnRoute:(id)a3 toLocationCoordinate:(id)a4 inRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end;
  PolylineCoordinate start;
  double var2;
  double var1;
  double var0;
  id v11;
  void *v12;
  unsigned int index;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  PolylineCoordinate v24;
  int IsABeforeB;
  unint64_t v26;
  PolylineCoordinate v27;
  double v29;
  double v30;
  double v31;

  end = a5.end;
  start = a5.start;
  var2 = a4.var2;
  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0D27370], "iteratorWithRange:", start, end);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "advance");
  index = 0;
  v14 = 3212836864;
  v15 = 1.79769313e308;
  while (objc_msgSend(v12, "isCurrentValid"))
  {
    objc_msgSend(v11, "pointAtRouteCoordinate:", objc_msgSend(v12, "previous"));
    objc_msgSend(v11, "pointAtRouteCoordinate:", objc_msgSend(v12, "current"));
    v30 = var1;
    v31 = var2;
    v29 = var0;
    GEOClosestCoordinateOnLineSegmentFromCoordinate3D();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    GEOCalculateDistance();
    v23 = v22;
    if (v22 < v15)
    {
      v24 = -[MNRouteDivergenceFinder _routeCoordinateForLocationCoordinate:route:startIndex:](self, "_routeCoordinateForLocationCoordinate:route:startIndex:", v11, objc_msgSend(v12, "previous", *(_QWORD *)&var0, *(_QWORD *)&var1, *(_QWORD *)&var2), v17, v19, v21);
      index = v24.index;
      v14 = HIDWORD(*(unint64_t *)&v24);
      v15 = v23;
    }
    objc_msgSend(v12, "advance", *(_QWORD *)&v29, *(_QWORD *)&v30, *(_QWORD *)&v31);
  }
  IsABeforeB = GEOPolylineCoordinateIsABeforeB();
  v26 = index | (unint64_t)(v14 << 32);
  if (IsABeforeB)
    v27 = start;
  else
    v27 = end;
  if (!IsABeforeB)
    end = start;
  if (GEOPolylineCoordinateIsABeforeB())
    end = (PolylineCoordinate)v26;
  if (!GEOPolylineCoordinateIsABeforeB())
    end = v27;

  return end;
}

- (PolylineCoordinate)_routeCoordinateForLocationCoordinate:(id)a3 route:(id)a4 startIndex:(unint64_t)a5
{
  double var2;
  double var1;
  double var0;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  float v22;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a4;
  objc_msgSend(v10, "pointAt:", a5);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v10, "pointAt:", a5 + 1);
  -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", var0, var1, var2, v12, v14, v16, v17, v18, v19);
  v21 = fmin(v20, 1.0);
  if (v21 < 0.0)
    v21 = 0.0;
  v22 = v21;
  if (v22 >= 1.0)
  {
    LODWORD(a5) = vcvtms_u32_f32(v22) + a5;
    v22 = v22 - (float)floorf(v22);
  }

  return (PolylineCoordinate)(a5 | ((unint64_t)LODWORD(v22) << 32));
}

- (double)_offsetForCoordinate:(id)a3 alongSegmentStart:(id)a4 segmentEnd:(id)a5
{
  double v5;
  double v6;
  double v7;
  double result;

  if (vabdd_f64(a4.var0, a5.var0) <= 0.0000005)
  {
    v7 = 0.0;
    if (vabdd_f64(a4.var1, a5.var1) <= 0.0000005)
      goto LABEL_6;
    v5 = a3.var1 - a4.var1;
    v6 = a5.var1 - a4.var1;
  }
  else
  {
    v5 = a3.var0 - a4.var0;
    v6 = a5.var0 - a4.var0;
  }
  v7 = v5 / v6;
LABEL_6:
  result = fmin(v7, 1.0);
  if (result < 0.0)
    return 0.0;
  return result;
}

- (id)_stringForCoordinate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.6f, %0.6f"), a3.var0, a3.var1, a3.var2, *(_QWORD *)&a3.var0, *(_QWORD *)&a3.var1);
}

- (id)_routesArrayIdentifierStrings:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_geo_map:", &__block_literal_global_31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__MNRouteDivergenceFinder__routesArrayIdentifierStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uniqueRouteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)toleranceMeters
{
  return self->_toleranceMeters;
}

- (void)setToleranceMeters:(double)a3
{
  self->_toleranceMeters = a3;
}

- (double)minLengthMetersForConvergence
{
  return self->_minLengthMetersForConvergence;
}

- (void)setMinLengthMetersForConvergence:(double)a3
{
  self->_minLengthMetersForConvergence = a3;
}

- (void)findAllOverlapRangesBetweenRoutes:
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (char *)v1[1];
      do
      {
        v8 = (void *)*((_QWORD *)v6 - 3);
        v6 -= 24;
        v7 = v8;
        if (v8)
        {
          *((_QWORD *)v4 - 2) = v7;
          operator delete(v7);
        }
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

- (float)findAllOverlapRangesBetweenRoutes:(uint64_t)a3
{
  unsigned __int32 *v9;
  unint64_t i;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __n128 *v14;
  __n128 v15;
  uint64_t v16;
  __n128 *v17;
  __n128 v18;
  __n128 *v19;
  __n128 v20;
  unsigned __int8 v21;
  unsigned __int32 v22;
  unsigned __int32 v23;
  uint64_t v24;
  unsigned __int32 v25;
  unint64_t v26;
  unsigned __int32 v27;
  __n128 *k;
  unsigned __int32 v29;
  unsigned __int32 v30;
  unsigned __int32 v31;
  unint64_t v32;
  __n128 v33;
  unsigned __int32 v34;
  BOOL v35;
  unsigned __int32 v36;
  unsigned __int32 v37;
  __int128 v38;
  BOOL v39;
  __n128 v40;
  unsigned __int32 v41;
  unsigned __int32 v42;
  unsigned __int32 v43;
  __n128 *j;
  unsigned __int32 v45;
  __n128 v46;
  unsigned __int32 v47;
  unsigned __int32 v48;
  unsigned __int32 v49;
  BOOL v50;
  __int128 v51;
  __n128 *v52;
  unsigned __int32 v53;
  __n128 *v54;
  __n128 *v55;
  __n128 *v56;
  __n128 *v57;
  unsigned __int32 v58;
  unsigned __int32 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  __n128 *v65;
  BOOL v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned int v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  uint64_t v79;
  unint64_t v80;
  unsigned int v81;
  unint64_t v82;
  unsigned int v83;
  float v84;
  __int128 v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  __int128 v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  int64_t v96;
  unsigned int v97;
  __int128 v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unsigned int v103;
  __int128 v104;
  unint64_t v105;
  unint64_t v106;
  __int128 v107;
  uint64_t v109;
  unsigned int v110;
  uint64_t v111;
  unsigned int v112;
  BOOL v113;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __n128 v118;
  __n128 v119;
  __n128 v120;
  __n128 v121;
  __n128 v122;
  __int128 v123;
  __int128 v124;
  __n128 v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

- (void)findAllOverlapRangesBetweenRoutes:(uint64_t)a1
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

- (uint64_t)findAllOverlapRangesBetweenRoutes:(uint64_t)a1
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

- (void)findOverlappingSectionsForRoutes:
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 24;
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>>::destroy(*((_QWORD **)v4 - 2));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

- (void)findOverlappingSectionsForRoutes:(_QWORD *)a1
{
  if (a1)
  {
    std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(*a1);
    std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(a1[1]);
    std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>>>::destroy[abi:ne180100]<std::pair<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey const,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void,void>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

- (void)findOverlappingSectionsForRoutes:(uint64_t)a1
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
  std::__tree<unsigned long>::destroy(*(_QWORD **)(a1 + 8));
}

- (uint64_t)findOverlappingSectionsForRoutes:(uint64_t)a1
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>>>::destroy[abi:ne180100]<std::pair<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey const,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void,void>((uint64_t)v2 + 32);
    operator delete(v2);
  }
  return a1;
}

- (uint64_t)findOverlappingSectionsForRoutes:
{
  unint64_t v3;
  unint64_t v4;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  BOOL v15;
  _QWORD *v16;
  _QWORD *v17;
  double v18;
  double v19;
  double v20;
  uint64_t result;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a3 + 16);
  if (v3 != v4)
    return v3 < v4;
  v8 = (_QWORD *)(a2 + 8);
  v9 = *(_QWORD **)a2;
  if (*(_QWORD *)a2 == a2 + 8)
  {
LABEL_16:
    GEOCalculateDistance();
    if (v18 >= *a1)
    {
      v19 = *(double *)(a2 + 24);
      v20 = *(double *)(a3 + 24);
      if (vabdd_f64(v19, v20) < 0.0001)
      {
        v19 = *(double *)(a2 + 32);
        v20 = *(double *)(a3 + 32);
      }
      return v19 < v20;
    }
    return 0;
  }
  v10 = *(_QWORD **)a3;
  v11 = *(_QWORD **)a3;
  v12 = *(_QWORD **)a2;
  while (v12[4] == v11[4])
  {
    v13 = (_QWORD *)v12[1];
    v14 = v12;
    if (v13)
    {
      do
      {
        v12 = v13;
        v13 = (_QWORD *)*v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        v12 = (_QWORD *)v14[2];
        v15 = *v12 == (_QWORD)v14;
        v14 = v12;
      }
      while (!v15);
    }
    v16 = (_QWORD *)v11[1];
    if (v16)
    {
      do
      {
        v17 = v16;
        v16 = (_QWORD *)*v16;
      }
      while (v16);
    }
    else
    {
      do
      {
        v17 = (_QWORD *)v11[2];
        v15 = *v17 == (_QWORD)v11;
        v11 = v17;
      }
      while (!v15);
    }
    v11 = v17;
    if (v12 == v8)
      goto LABEL_16;
  }
  if (v10 == (_QWORD *)(a3 + 8))
    return 0;
  while (v9 != v8)
  {
    v22 = v9[4];
    v23 = v10[4];
    if (v22 < v23)
      break;
    if (v23 < v22)
      return 0;
    v24 = (_QWORD *)v9[1];
    v25 = v9;
    if (v24)
    {
      do
      {
        v9 = v24;
        v24 = (_QWORD *)*v24;
      }
      while (v24);
    }
    else
    {
      do
      {
        v9 = (_QWORD *)v25[2];
        v15 = *v9 == (_QWORD)v25;
        v25 = v9;
      }
      while (!v15);
    }
    v26 = (_QWORD *)v10[1];
    if (v26)
    {
      do
      {
        v27 = v26;
        v26 = (_QWORD *)*v26;
      }
      while (v26);
    }
    else
    {
      do
      {
        v27 = (_QWORD *)v10[2];
        v15 = *v27 == (_QWORD)v10;
        v10 = v27;
      }
      while (!v15);
    }
    result = 0;
    v10 = v27;
    if (v27 == (_QWORD *)(a3 + 8))
      return result;
  }
  return 1;
}

- (void)_findFirstConvergenceBetweenRoute:(uint64_t *)a1 range:(uint64_t)a2 andRoute:(uint64_t *)a3 range:(unint64_t)a4 outRouteCoordinate:(uint64_t)a5 outRouteCoordinate:(char)a6
{
  unint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  _OWORD *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  double v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  double v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  int v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  unint64_t v82;
  unint64_t v83;
  double v84;
  unint64_t v86;
  unint64_t v87;
  uint64_t *v88;
  double *v89;
  double *v90;
  double *v91;
  double *v92;
  double v93;
  double *v94;
  uint64_t v95;
  double v96;
  _BOOL4 v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  unint64_t v111;
  double v112;
  double *v114;
  double *v115;
  double *v116;
  double v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t *v129;
  uint64_t v130;
  int v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  int v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  BOOL v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  double *v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  char v156;
  double v157;
  uint64_t v158;
  unint64_t v159;
  double v160;
  unint64_t v161;
  double v162;
  uint64_t *v163;
  double *v164;
  double *v165;
  double *v166;
  double v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  unint64_t v180;
  double v181;
  double *v182;
  double *v183;
  double *v184;
  double v185;
  int v186;
  uint64_t v187;
  unint64_t v188;
  unint64_t v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  double v195;
  double v196;
  _OWORD *v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  unint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  unint64_t v213;
  uint64_t *v214;
  uint64_t v215;
  unint64_t v216;
  uint64_t *v217;
  unint64_t v218;
  uint64_t *v219;
  uint64_t v220;
  unint64_t v221;
  uint64_t i;
  uint64_t v223;
  uint64_t *v224;
  uint64_t v225;
  double v226;
  double v227;
  int v228;
  double *v229;
  uint64_t v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  char v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  double *v239;
  double *v240;
  uint64_t v241;
  double v242;
  double *v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  uint64_t v249;
  __int128 v250;
  __int128 v251;
  unint64_t v252;
  unint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t v260;
  unint64_t v261;
  double v262;
  double v263;
  double v264;
  double v265;
  int v266;
  BOOL v267;
  double v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  uint64_t v274;
  uint64_t v275;
  __int128 v276;
  __int128 v277;
  uint64_t v278;
  uint64_t v279;
  unint64_t v280;
  unint64_t v281;
  double v282;
  double v283;
  double v284;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  _OWORD *v298;
  _OWORD *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  unint64_t v303;
  unint64_t v304;
  double v305;
  double v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  _QWORD *v311;
  uint64_t v312;
  _OWORD *v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  uint64_t v318;
  uint64_t v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  uint64_t v324;
  BOOL v325;
  unint64_t v326;
  uint64_t v327;
  _OWORD *v328;
  double v329;
  double v330;
  unint64_t v331;
  _OWORD *v332;
  uint64_t v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  _OWORD *v341;
  unint64_t v342;
  double v343;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  uint64_t v349;
  __int128 v350;
  __int128 v351;
  uint64_t v352;
  uint64_t v353;
  unint64_t v354;
  uint64_t *v355;
  uint64_t v356;
  unint64_t v357;
  uint64_t *v358;
  uint64_t v359;
  unint64_t v360;
  uint64_t *v361;
  uint64_t v362;
  double v363;
  double v364;
  _OWORD *v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  double v374;
  double v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  double v384;
  double v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  double v398;
  double v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  unint64_t v412;
  unint64_t v413;
  uint64_t *v414;
  unint64_t v415;
  unint64_t v416;
  BOOL v417;
  unint64_t v418;
  unint64_t v419;
  uint64_t v420;
  unint64_t v421;
  unint64_t v422;
  unint64_t v423;
  unint64_t v424;
  unint64_t v425;
  unint64_t v426;
  uint64_t *v427;
  uint64_t v428;
  unint64_t v429;
  unint64_t v430;
  double v431;
  double v432;
  int v433;
  uint64_t v434;
  __int128 v435;
  __int128 v436;
  char v437;
  _OWORD *v438;
  uint64_t v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  uint64_t v444;
  uint64_t v445;
  double v446;
  uint64_t v447;
  __int128 v448;
  __int128 v449;
  unint64_t v450;
  char v451;
  unint64_t v452;
  char v453;
  uint64_t v454;
  uint64_t *v455;
  uint64_t *v456;
  unint64_t v457;
  uint64_t v458;
  int64_t v460;
  int v461;
  uint64_t *v462;
  uint64_t v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  uint64_t v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  _BYTE v473[32];
  uint64_t v474;

  v474 = *MEMORY[0x1E0C80C00];
  if (a4 == a2)
    return;
  v6 = a4;
  v8 = a2;
  while (2)
  {
    v10 = 42 * (a3 - a1);
    v11 = *a3;
    v12 = *a1;
    v13 = v8 - *a1;
    v14 = v13 >> 5;
    v15 = v10 - 0x5555555555555555 * ((uint64_t)(v6 - *a3) >> 5) + 0x5555555555555555 * (v13 >> 5);
    switch(v15)
    {
      case 0:
      case 1:
        return;
      case 2:
        if (v6 == v11)
          v6 = *(a3 - 1) + 4032;
        v195 = *(double *)(v6 - 88);
        v196 = *(double *)(v8 + 8);
        if (v195 < v196 || v195 <= v196 && *(_BYTE *)(v6 - 8) && !*(_BYTE *)(v8 + 88))
        {
          v197 = (_OWORD *)(v6 - 96);
          v198 = *(_OWORD *)(v8 + 16);
          v469 = *(_OWORD *)v8;
          v470 = v198;
          v199 = *(_OWORD *)(v8 + 32);
          v200 = *(_OWORD *)(v8 + 48);
          v201 = *(_OWORD *)(v8 + 80);
          *(_OWORD *)v473 = *(_OWORD *)(v8 + 64);
          *(_OWORD *)&v473[16] = v201;
          v471 = v199;
          v472 = v200;
          v203 = *(_OWORD *)(v6 - 48);
          v202 = *(_OWORD *)(v6 - 32);
          v204 = *(_OWORD *)(v6 - 64);
          *(_OWORD *)(v8 + 74) = *(_OWORD *)(v6 - 22);
          *(_OWORD *)(v8 + 48) = v203;
          *(_OWORD *)(v8 + 64) = v202;
          *(_OWORD *)(v8 + 32) = v204;
          v205 = *(_OWORD *)(v6 - 80);
          *(_OWORD *)v8 = *(_OWORD *)(v6 - 96);
          *(_OWORD *)(v8 + 16) = v205;
          v206 = v470;
          *v197 = v469;
          v197[1] = v206;
          v207 = v471;
          v208 = v472;
          v209 = *(_OWORD *)v473;
          *(_OWORD *)((char *)v197 + 74) = *(_OWORD *)&v473[10];
          v197[3] = v208;
          v197[4] = v209;
          v197[2] = v207;
        }
        return;
      case 3:
        v210 = 0xAAAAAAAAAAAAAAABLL * v14;
        if (v13 < -95)
        {
          v211 = &a1[-((40 - v210) / 0x2A)];
          v212 = *v211 + 96 * (42 * ((40 - v210) / 0x2A) - (40 - v210)) + 3936;
        }
        else
        {
          v211 = &a1[(v210 + 1) / 0x2A];
          v212 = *v211 + 96 * ((v210 + 1) % 0x2A);
        }
        if (v6 == v11)
        {
          v353 = *--a3;
          v6 = v353 + 4032;
        }
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v8, (uint64_t)v211, v212, (uint64_t)a3, v6 - 96);
        return;
      case 4:
        v213 = 0xAAAAAAAAAAAAAAABLL * v14;
        if (v13 >= -95)
        {
          v214 = &a1[(v213 + 1) / 0x2A];
          v215 = *v214 + 96 * ((v213 + 1) % 0x2A);
          v216 = v213 + 2;
LABEL_327:
          v355 = &a1[v216 / 0x2A];
          v356 = *v355 + 96 * (v216 % 0x2A);
          goto LABEL_355;
        }
        v354 = (40 - v213) / 0x2A;
        v214 = &a1[-v354];
        v215 = *v214 + 96 * (v213 - 40 + 42 * v354) + 3936;
        if ((unint64_t)v13 >= 0xFFFFFFFFFFFFFF41)
        {
          v216 = 1;
          goto LABEL_327;
        }
        v418 = 39 - v213;
        v419 = (39 - v213) / 0x2A;
        v355 = &a1[-v419];
        v356 = *v355 + 96 * (42 * v419 - v418) + 3936;
LABEL_355:
        if (v6 == v11)
        {
          v420 = *--a3;
          v6 = v420 + 4032;
        }
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v8, (uint64_t)v214, v215, (uint64_t)v355, v356, (uint64_t)a3, v6 - 96);
        return;
      case 5:
        v217 = a3;
        v218 = 0xAAAAAAAAAAAAAAABLL * v14;
        if (v13 >= -95)
        {
          v219 = &a1[(v218 + 1) / 0x2A];
          v220 = *v219 + 96 * ((v218 + 1) % 0x2A);
          v221 = v218 + 2;
LABEL_330:
          v358 = &a1[v221 / 0x2A];
          v359 = *v358 + 96 * (v221 % 0x2A);
          v360 = v218 + 3;
LABEL_331:
          v361 = &a1[v360 / 0x2A];
          v362 = *v361 + 96 * (v360 % 0x2A);
          goto LABEL_332;
        }
        v357 = (40 - v218) / 0x2A;
        v219 = &a1[-v357];
        v220 = *v219 + 96 * (v218 - 40 + 42 * v357) + 3936;
        if ((unint64_t)v13 >= 0xFFFFFFFFFFFFFF41)
        {
          v221 = 1;
          goto LABEL_330;
        }
        v421 = (39 - v218) / 0x2A;
        v358 = &a1[-v421];
        v359 = *v358 + 96 * (v218 - 39 + 42 * v421) + 3936;
        if ((unint64_t)v13 >= 0xFFFFFFFFFFFFFEE1)
        {
          v360 = 1;
          goto LABEL_331;
        }
        v361 = &a1[-((38 - v218) / 0x2A)];
        v362 = *v361 + 96 * (42 * ((38 - v218) / 0x2A) - (38 - v218)) + 3936;
LABEL_332:
        if (v6 == v11)
          v6 = *(v217 - 1) + 4032;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v8, (uint64_t)v219, v220, (uint64_t)v358, v359, (uint64_t)v361, v362);
        v363 = *(double *)(v6 - 88);
        v364 = *(double *)(v362 + 8);
        if (v363 < v364 || v363 <= v364 && *(_BYTE *)(v6 - 8) && !*(_BYTE *)(v362 + 88))
        {
          v365 = (_OWORD *)(v6 - 96);
          v471 = *(_OWORD *)(v362 + 32);
          v472 = *(_OWORD *)(v362 + 48);
          *(_OWORD *)v473 = *(_OWORD *)(v362 + 64);
          *(_OWORD *)&v473[16] = *(_OWORD *)(v362 + 80);
          v469 = *(_OWORD *)v362;
          v470 = *(_OWORD *)(v362 + 16);
          v366 = *(_OWORD *)(v6 - 80);
          *(_OWORD *)v362 = *(_OWORD *)(v6 - 96);
          *(_OWORD *)(v362 + 16) = v366;
          v368 = *(_OWORD *)(v6 - 48);
          v367 = *(_OWORD *)(v6 - 32);
          v369 = *(_OWORD *)(v6 - 64);
          *(_OWORD *)(v362 + 74) = *(_OWORD *)(v6 - 22);
          *(_OWORD *)(v362 + 48) = v368;
          *(_OWORD *)(v362 + 64) = v367;
          *(_OWORD *)(v362 + 32) = v369;
          v370 = v470;
          *v365 = v469;
          v365[1] = v370;
          v371 = v471;
          v372 = v472;
          v373 = *(_OWORD *)v473;
          *(_OWORD *)((char *)v365 + 74) = *(_OWORD *)&v473[10];
          v365[3] = v372;
          v365[4] = v373;
          v365[2] = v371;
          v374 = *(double *)(v362 + 8);
          v375 = *(double *)(v359 + 8);
          if (v374 < v375
            || v374 <= v375 && (*(_BYTE *)(v362 + 88) ? (v417 = *(_BYTE *)(v359 + 88) == 0) : (v417 = 0), v417))
          {
            v376 = *(_OWORD *)(v359 + 16);
            v469 = *(_OWORD *)v359;
            v470 = v376;
            v377 = *(_OWORD *)(v359 + 32);
            v378 = *(_OWORD *)(v359 + 48);
            v379 = *(_OWORD *)(v359 + 80);
            *(_OWORD *)v473 = *(_OWORD *)(v359 + 64);
            *(_OWORD *)&v473[16] = v379;
            v471 = v377;
            v472 = v378;
            v381 = *(_OWORD *)(v362 + 48);
            v380 = *(_OWORD *)(v362 + 64);
            v382 = *(_OWORD *)(v362 + 32);
            *(_OWORD *)(v359 + 74) = *(_OWORD *)(v362 + 74);
            *(_OWORD *)(v359 + 48) = v381;
            *(_OWORD *)(v359 + 64) = v380;
            *(_OWORD *)(v359 + 32) = v382;
            v383 = *(_OWORD *)(v362 + 16);
            *(_OWORD *)v359 = *(_OWORD *)v362;
            *(_OWORD *)(v359 + 16) = v383;
            *(_OWORD *)(v362 + 48) = v472;
            *(_OWORD *)(v362 + 32) = v471;
            *(_OWORD *)(v362 + 64) = *(_OWORD *)v473;
            *(_OWORD *)(v362 + 74) = *(_OWORD *)&v473[10];
            *(_OWORD *)v362 = v469;
            *(_OWORD *)(v362 + 16) = v470;
            v384 = *(double *)(v359 + 8);
            v385 = *(double *)(v220 + 8);
            if (v384 < v385 || v384 <= v385 && *(_BYTE *)(v359 + 88) && !*(_BYTE *)(v220 + 88))
            {
              v386 = *(_OWORD *)(v220 + 16);
              v469 = *(_OWORD *)v220;
              v470 = v386;
              v387 = *(_OWORD *)(v220 + 32);
              v388 = *(_OWORD *)(v220 + 48);
              v389 = *(_OWORD *)(v220 + 80);
              *(_OWORD *)v473 = *(_OWORD *)(v220 + 64);
              *(_OWORD *)&v473[16] = v389;
              v471 = v387;
              v472 = v388;
              v391 = *(_OWORD *)(v359 + 48);
              v390 = *(_OWORD *)(v359 + 64);
              v392 = *(_OWORD *)(v359 + 32);
              *(_OWORD *)(v220 + 74) = *(_OWORD *)(v359 + 74);
              *(_OWORD *)(v220 + 48) = v391;
              *(_OWORD *)(v220 + 64) = v390;
              *(_OWORD *)(v220 + 32) = v392;
              v393 = *(_OWORD *)(v359 + 16);
              *(_OWORD *)v220 = *(_OWORD *)v359;
              *(_OWORD *)(v220 + 16) = v393;
              v394 = v470;
              *(_OWORD *)v359 = v469;
              *(_OWORD *)(v359 + 16) = v394;
              v395 = v471;
              v396 = v472;
              v397 = *(_OWORD *)v473;
              *(_OWORD *)(v359 + 74) = *(_OWORD *)&v473[10];
              *(_OWORD *)(v359 + 48) = v396;
              *(_OWORD *)(v359 + 64) = v397;
              *(_OWORD *)(v359 + 32) = v395;
              v398 = *(double *)(v220 + 8);
              v399 = *(double *)(v8 + 8);
              if (v398 < v399 || v398 <= v399 && *(_BYTE *)(v220 + 88) && !*(_BYTE *)(v8 + 88))
              {
                v400 = *(_OWORD *)(v8 + 16);
                v469 = *(_OWORD *)v8;
                v470 = v400;
                v401 = *(_OWORD *)(v8 + 32);
                v402 = *(_OWORD *)(v8 + 48);
                v403 = *(_OWORD *)(v8 + 80);
                *(_OWORD *)v473 = *(_OWORD *)(v8 + 64);
                *(_OWORD *)&v473[16] = v403;
                v471 = v401;
                v472 = v402;
                v405 = *(_OWORD *)(v220 + 48);
                v404 = *(_OWORD *)(v220 + 64);
                v406 = *(_OWORD *)(v220 + 32);
                *(_OWORD *)(v8 + 74) = *(_OWORD *)(v220 + 74);
                *(_OWORD *)(v8 + 48) = v405;
                *(_OWORD *)(v8 + 64) = v404;
                *(_OWORD *)(v8 + 32) = v406;
                v407 = *(_OWORD *)(v220 + 16);
                *(_OWORD *)v8 = *(_OWORD *)v220;
                *(_OWORD *)(v8 + 16) = v407;
                v408 = v470;
                *(_OWORD *)v220 = v469;
                *(_OWORD *)(v220 + 16) = v408;
                v409 = v471;
                v410 = v472;
                v411 = *(_OWORD *)v473;
                *(_OWORD *)(v220 + 74) = *(_OWORD *)&v473[10];
                *(_OWORD *)(v220 + 48) = v410;
                *(_OWORD *)(v220 + 64) = v411;
                *(_OWORD *)(v220 + 32) = v409;
              }
            }
          }
        }
        return;
      default:
        if (v15 <= 23)
        {
          if ((a6 & 1) != 0)
          {
            for (i = v8 + 96; ; i += 96)
            {
              if (i - v12 == 4032)
              {
                v223 = a1[1];
                ++a1;
                v12 = v223;
                i = v223;
              }
              if (i == v6)
                return;
              v224 = a1;
              v225 = i;
              if (i == v12)
              {
                v224 = a1 - 1;
                v225 = *(a1 - 1) + 4032;
              }
              v226 = *(double *)(i + 8);
              v227 = *(double *)(v225 - 88);
              if (v226 >= v227)
              {
                if (v226 > v227 || !*(_BYTE *)(i + 88) || *(_BYTE *)(v225 - 8))
                  continue;
                v228 = 1;
              }
              else
              {
                v228 = *(unsigned __int8 *)(i + 88);
              }
              v229 = (double *)(v225 - 96);
              v230 = *(_QWORD *)i;
              v231 = *(_OWORD *)(i + 32);
              v232 = *(_OWORD *)(i + 48);
              v233 = *(_OWORD *)(i + 64);
              *(_QWORD *)v473 = *(_QWORD *)(i + 80);
              v471 = v232;
              v472 = v233;
              v470 = v231;
              v469 = *(_OWORD *)(i + 16);
              v234 = *(_BYTE *)(i + 89);
              v235 = *(_OWORD *)((char *)v229 + 74);
              v237 = *((_OWORD *)v229 + 3);
              v236 = *((_OWORD *)v229 + 4);
              *(_OWORD *)(i + 32) = *((_OWORD *)v229 + 2);
              *(_OWORD *)(i + 48) = v237;
              *(_OWORD *)(i + 64) = v236;
              *(_OWORD *)(i + 74) = v235;
              v238 = *((_OWORD *)v229 + 1);
              *(_OWORD *)i = *(_OWORD *)v229;
              *(_OWORD *)(i + 16) = v238;
              v239 = (double *)v8;
              if (v229 != (double *)v8)
              {
                while (1)
                {
                  if (v229 == (double *)*v224)
                  {
                    v241 = *--v224;
                    v240 = (double *)(v241 + 4032);
                  }
                  else
                  {
                    v240 = v229;
                  }
                  v242 = *(v240 - 11);
                  if (v226 >= v242 && (v226 > v242 || !v228 || *((_BYTE *)v240 - 8)))
                    break;
                  v244 = *((_OWORD *)v240 - 6);
                  v245 = *((_OWORD *)v240 - 5);
                  v243 = v240 - 12;
                  *(_OWORD *)v229 = v244;
                  *((_OWORD *)v229 + 1) = v245;
                  v246 = *((_OWORD *)v243 + 2);
                  v247 = *((_OWORD *)v243 + 3);
                  v248 = *((_OWORD *)v243 + 4);
                  *(_OWORD *)((char *)v229 + 74) = *(_OWORD *)((char *)v243 + 74);
                  *((_OWORD *)v229 + 3) = v247;
                  *((_OWORD *)v229 + 4) = v248;
                  *((_OWORD *)v229 + 2) = v246;
                  v229 = v243;
                  if (v243 == (double *)v8)
                  {
                    v239 = (double *)v8;
                    goto LABEL_218;
                  }
                }
                v239 = v229;
              }
LABEL_218:
              *(_QWORD *)v239 = v230;
              v239[1] = v226;
              v249 = *(_QWORD *)v473;
              v250 = v472;
              *((_OWORD *)v239 + 3) = v471;
              *((_OWORD *)v239 + 4) = v250;
              *((_QWORD *)v239 + 10) = v249;
              v251 = v470;
              *((_OWORD *)v239 + 1) = v469;
              *((_OWORD *)v239 + 2) = v251;
              *((_BYTE *)v239 + 88) = v228;
              *((_BYTE *)v239 + 89) = v234;
              v12 = *a1;
            }
          }
          v412 = 0xAAAAAAAAAAAAAAABLL * v14;
          if (v13 < -95)
          {
            v422 = 40 - v412;
            v423 = 40 - v412;
            v414 = &a1[-((40 - v412) / 0x2A)];
            v415 = *v414;
            v416 = *v414 + 96 * (42 * (v423 / 0x2A) - v422) + 3936;
          }
          else
          {
            v413 = v412 + 1;
            v414 = &a1[(v412 + 1) / 0x2A];
            v415 = *v414;
            v416 = *v414 + 96 * (v413 % 0x2A);
          }
          if (v416 == v6)
            return;
          while (1)
          {
            v424 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v416 - v415) >> 5);
            if ((uint64_t)(v416 - v415) < 97)
            {
              v429 = 42 - v424;
              v430 = (42 - v424) / 0x2A;
              v427 = &v414[-v430];
              v428 = *v427 + 96 * (42 * v430 - v429) + 3936;
            }
            else
            {
              v425 = v424 - 1;
              v426 = (v424 - 1) / 0x2A;
              v427 = &v414[v426];
              v428 = *v427 + 96 * (v425 - 42 * v426);
            }
            v431 = *(double *)(v416 + 8);
            v432 = *(double *)(v428 + 8);
            if (v431 < v432)
              break;
            if (v431 <= v432 && *(_BYTE *)(v416 + 88) && !*(_BYTE *)(v428 + 88))
            {
              v433 = 1;
LABEL_368:
              v434 = *(_QWORD *)v416;
              v435 = *(_OWORD *)(v416 + 32);
              v436 = *(_OWORD *)(v416 + 64);
              v471 = *(_OWORD *)(v416 + 48);
              v472 = v436;
              *(_QWORD *)v473 = *(_QWORD *)(v416 + 80);
              v470 = v435;
              v469 = *(_OWORD *)(v416 + 16);
              v437 = *(_BYTE *)(v416 + 89);
              v438 = (_OWORD *)v416;
              while (1)
              {
                v439 = v428;
                v440 = *(_OWORD *)(v428 + 16);
                *v438 = *(_OWORD *)v428;
                v438[1] = v440;
                v441 = *(_OWORD *)(v428 + 32);
                v442 = *(_OWORD *)(v428 + 48);
                v443 = *(_OWORD *)(v428 + 64);
                *(_OWORD *)((char *)v438 + 74) = *(_OWORD *)(v428 + 74);
                v438[3] = v442;
                v438[4] = v443;
                v438[2] = v441;
                if (v428 == *v427)
                {
                  v445 = *--v427;
                  v444 = v445 + 4032;
                }
                else
                {
                  v444 = v428;
                }
                v428 = v444 - 96;
                v446 = *(double *)(v444 - 88);
                v438 = (_OWORD *)v439;
                if (v431 >= v446)
                {
                  if (v431 > v446)
                    break;
                  if (!v433)
                    break;
                  v438 = (_OWORD *)v439;
                  if (*(_BYTE *)(v444 - 8))
                    break;
                }
              }
              *(_QWORD *)v439 = v434;
              *(double *)(v439 + 8) = v431;
              v447 = *(_QWORD *)v473;
              v448 = v472;
              *(_OWORD *)(v439 + 48) = v471;
              *(_OWORD *)(v439 + 64) = v448;
              *(_QWORD *)(v439 + 80) = v447;
              v449 = v470;
              *(_OWORD *)(v439 + 16) = v469;
              *(_OWORD *)(v439 + 32) = v449;
              *(_BYTE *)(v439 + 88) = v433;
              *(_BYTE *)(v439 + 89) = v437;
              v415 = *v414;
            }
            v416 += 96;
            if (v416 - v415 == 4032)
            {
              v450 = v414[1];
              ++v414;
              v415 = v450;
              v416 = v450;
            }
            if (v416 == v6)
              return;
          }
          v433 = *(unsigned __int8 *)(v416 + 88);
          goto LABEL_368;
        }
        if (!a5)
        {
          v455 = a3;
          v457 = v6;
          v252 = (unint64_t)(v15 - 2) >> 1;
          v460 = v252;
          while (1)
          {
            v253 = v252;
            *(_QWORD *)&v469 = a1;
            *((_QWORD *)&v469 + 1) = v8;
            std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v252);
            v254 = (uint64_t *)*((_QWORD *)&v469 + 1);
            if (v8 == *((_QWORD *)&v469 + 1))
            {
              v255 = 0;
            }
            else
            {
              v255 = 42 * ((uint64_t)(v469 - (_QWORD)a1) >> 3)
                   - 0x5555555555555555 * ((uint64_t)(*((_QWORD *)&v469 + 1) - *(_QWORD *)v469) >> 5)
                   + 0x5555555555555555 * ((v8 - *a1) >> 5);
              if (v460 < v255)
                goto LABEL_244;
            }
            v256 = 2 * v255;
            v257 = (2 * v255) | 1;
            *(_QWORD *)&v469 = a1;
            *((_QWORD *)&v469 + 1) = v8;
            std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v257);
            v258 = *((_QWORD *)&v469 + 1);
            if (v256 + 2 < v15)
            {
              v259 = *((_QWORD *)&v469 + 1) - *(_QWORD *)v469;
              v260 = 0xAAAAAAAAAAAAAAABLL * (v259 >> 5);
              v261 = v259 < -95
                   ? *(_QWORD *)(v469 - 8 * ((40 - v260) / 0x2A))
                   + 96 * (42 * ((40 - v260) / 0x2A) - (40 - v260))
                   + 3936
                   : *(_QWORD *)(v469 + 8 * ((v260 + 1) / 0x2A)) + 96 * ((v260 + 1) % 0x2A);
              v262 = *(double *)(*((_QWORD *)&v469 + 1) + 8);
              v263 = *(double *)(v261 + 8);
              if (v262 < v263 || v262 <= v263 && *(_BYTE *)(*((_QWORD *)&v469 + 1) + 88) && !*(_BYTE *)(v261 + 88))
              {
                v258 = *((_QWORD *)&v469 + 1) + 96;
                if (*((_QWORD *)&v469 + 1) + 96 - *(_QWORD *)v469 == 4032)
                  v258 = *(_QWORD *)(v469 + 8);
                v257 = v256 + 2;
              }
            }
            v264 = *(double *)(v258 + 8);
            v265 = *((double *)v254 + 1);
            if (v264 >= v265)
            {
              if (v264 > v265)
              {
                v266 = *((unsigned __int8 *)v254 + 88);
LABEL_241:
                v268 = *(double *)v254;
                v269 = *((_OWORD *)v254 + 3);
                v470 = *((_OWORD *)v254 + 2);
                v471 = v269;
                v472 = *((_OWORD *)v254 + 4);
                *(_QWORD *)v473 = v254[10];
                v469 = *((_OWORD *)v254 + 1);
                v451 = *((_BYTE *)v254 + 89);
                v270 = *(_OWORD *)v258;
                *((_OWORD *)v254 + 1) = *(_OWORD *)(v258 + 16);
                v272 = *(_OWORD *)(v258 + 48);
                v271 = *(_OWORD *)(v258 + 64);
                v273 = *(_OWORD *)(v258 + 74);
                *((_OWORD *)v254 + 2) = *(_OWORD *)(v258 + 32);
                *((_OWORD *)v254 + 3) = v272;
                *(_OWORD *)((char *)v254 + 74) = v273;
                *((_OWORD *)v254 + 4) = v271;
                *(_OWORD *)v254 = v270;
                if (v460 >= v257)
                {
                  while (1)
                  {
                    v278 = 2 * v257;
                    v257 = (2 * v257) | 1;
                    *(_QWORD *)&v464 = a1;
                    *((_QWORD *)&v464 + 1) = v8;
                    std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v464, v257);
                    v274 = *((_QWORD *)&v464 + 1);
                    if (v278 + 2 < v15)
                    {
                      v279 = *((_QWORD *)&v464 + 1) - *(_QWORD *)v464;
                      v280 = 0xAAAAAAAAAAAAAAABLL * (v279 >> 5);
                      v281 = v279 < -95
                           ? *(_QWORD *)(v464 - 8 * ((40 - v280) / 0x2A))
                           + 96 * (42 * ((40 - v280) / 0x2A) - (40 - v280))
                           + 3936
                           : *(_QWORD *)(v464 + 8 * ((v280 + 1) / 0x2A)) + 96 * ((v280 + 1) % 0x2A);
                      v282 = *(double *)(*((_QWORD *)&v464 + 1) + 8);
                      v283 = *(double *)(v281 + 8);
                      if (v282 < v283
                        || v282 <= v283 && *(_BYTE *)(*((_QWORD *)&v464 + 1) + 88) && !*(_BYTE *)(v281 + 88))
                      {
                        v274 = *((_QWORD *)&v464 + 1) + 96;
                        if (*((_QWORD *)&v464 + 1) + 96 - *(_QWORD *)v464 == 4032)
                          v274 = *(_QWORD *)(v464 + 8);
                        v257 = v278 + 2;
                      }
                    }
                    v284 = *(double *)(v274 + 8);
                    if (v284 < v265)
                      break;
                    if (v284 <= v265 && *(_BYTE *)(v274 + 88) && v266 == 0)
                      break;
                    v286 = *(_OWORD *)(v274 + 16);
                    *(_OWORD *)v258 = *(_OWORD *)v274;
                    *(_OWORD *)(v258 + 16) = v286;
                    v287 = *(_OWORD *)(v274 + 32);
                    v288 = *(_OWORD *)(v274 + 48);
                    v289 = *(_OWORD *)(v274 + 64);
                    *(_OWORD *)(v258 + 74) = *(_OWORD *)(v274 + 74);
                    *(_OWORD *)(v258 + 48) = v288;
                    *(_OWORD *)(v258 + 64) = v289;
                    *(_OWORD *)(v258 + 32) = v287;
                    v258 = v274;
                    if (v460 < v257)
                      goto LABEL_243;
                  }
                }
                v274 = v258;
LABEL_243:
                *(double *)v274 = v268;
                *(double *)(v274 + 8) = v265;
                v275 = *(_QWORD *)v473;
                v276 = v472;
                *(_OWORD *)(v274 + 48) = v471;
                *(_OWORD *)(v274 + 64) = v276;
                *(_QWORD *)(v274 + 80) = v275;
                v277 = v470;
                *(_OWORD *)(v274 + 16) = v469;
                *(_OWORD *)(v274 + 32) = v277;
                *(_BYTE *)(v274 + 88) = v266;
                *(_BYTE *)(v274 + 89) = v451;
                goto LABEL_244;
              }
              v266 = *((unsigned __int8 *)v254 + 88);
              if (*(_BYTE *)(v258 + 88))
                v267 = v266 == 0;
              else
                v267 = 0;
              if (!v267)
                goto LABEL_241;
            }
LABEL_244:
            v252 = v253 - 1;
            if (!v253)
            {
              v291 = v455;
              v290 = v457;
              v292 = v10
                   - 0x5555555555555555 * ((uint64_t)(v457 - *v455) >> 5)
                   + 0x5555555555555555 * ((v8 - *a1) >> 5);
              if (v292 < 2)
                return;
              while (2)
              {
                v456 = v291;
                v458 = v290;
                v293 = 0;
                v294 = *(_OWORD *)(v8 + 16);
                v469 = *(_OWORD *)v8;
                v470 = v294;
                v295 = *(_OWORD *)(v8 + 32);
                v296 = *(_OWORD *)(v8 + 48);
                v297 = *(_OWORD *)(v8 + 80);
                *(_OWORD *)v473 = *(_OWORD *)(v8 + 64);
                *(_OWORD *)&v473[16] = v297;
                v471 = v295;
                v472 = v296;
                *(_QWORD *)&v464 = a1;
                *((_QWORD *)&v464 + 1) = v8;
                v298 = (_OWORD *)v8;
                do
                {
                  v299 = v298;
                  std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v464, v293 + 1);
                  v300 = 2 * v293;
                  v293 = (2 * v293) | 1;
                  v301 = v300 + 2;
                  v298 = (_OWORD *)*((_QWORD *)&v464 + 1);
                  if (v301 < v292)
                  {
                    v302 = *((_QWORD *)&v464 + 1) - *(_QWORD *)v464;
                    v303 = 0xAAAAAAAAAAAAAAABLL * (v302 >> 5);
                    v304 = v302 < -95
                         ? *(_QWORD *)(v464 - 8 * ((40 - v303) / 0x2A))
                         + 96 * (42 * ((40 - v303) / 0x2A) - (40 - v303))
                         + 3936
                         : *(_QWORD *)(v464 + 8 * ((v303 + 1) / 0x2A)) + 96 * ((v303 + 1) % 0x2A);
                    v305 = *(double *)(*((_QWORD *)&v464 + 1) + 8);
                    v306 = *(double *)(v304 + 8);
                    if (v305 < v306
                      || v305 <= v306 && *(_BYTE *)(*((_QWORD *)&v464 + 1) + 88) && !*(_BYTE *)(v304 + 88))
                    {
                      v298 = (_OWORD *)(*((_QWORD *)&v464 + 1) + 96);
                      *((_QWORD *)&v464 + 1) = v298;
                      if ((_OWORD *)((char *)v298 - *(_QWORD *)v464) == (_OWORD *)4032)
                      {
                        v298 = *(_OWORD **)(v464 + 8);
                        *(_QWORD *)&v464 = v464 + 8;
                        *((_QWORD *)&v464 + 1) = v298;
                      }
                      v293 = v301;
                    }
                  }
                  v307 = v298[1];
                  *v299 = *v298;
                  v299[1] = v307;
                  v308 = v298[2];
                  v309 = v298[3];
                  v310 = v298[4];
                  *(_OWORD *)((char *)v299 + 74) = *(_OWORD *)((char *)v298 + 74);
                  v299[3] = v309;
                  v299[4] = v310;
                  v299[2] = v308;
                }
                while (v293 <= (uint64_t)((unint64_t)(v292 - 2) >> 1));
                v311 = (_QWORD *)v464;
                v312 = v458;
                if (*v456 == v458)
                  v312 = *(v456 - 1) + 4032;
                v313 = (_OWORD *)(v312 - 96);
                if (v298 == v313)
                {
                  v298[2] = v471;
                  v298[3] = v472;
                  v298[4] = *(_OWORD *)v473;
                  *(_OWORD *)((char *)v298 + 74) = *(_OWORD *)&v473[10];
                  *v298 = v469;
                  v298[1] = v470;
                }
                else
                {
                  v314 = v313[1];
                  *v298 = *v313;
                  v298[1] = v314;
                  v315 = v313[2];
                  v316 = v313[3];
                  v317 = v313[4];
                  *(_OWORD *)((char *)v298 + 74) = *(_OWORD *)((char *)v313 + 74);
                  v298[3] = v316;
                  v298[4] = v317;
                  v298[2] = v315;
                  v318 = (uint64_t)(v298 + 6);
                  if ((_OWORD *)((char *)v298 - *v311 + 96) == (_OWORD *)4032)
                  {
                    v319 = v311[1];
                    ++v311;
                    v318 = v319;
                  }
                  v320 = v470;
                  *v313 = v469;
                  v313[1] = v320;
                  v321 = v471;
                  v322 = v472;
                  v323 = *(_OWORD *)v473;
                  *(_OWORD *)((char *)v313 + 74) = *(_OWORD *)&v473[10];
                  v313[3] = v322;
                  v313[4] = v323;
                  v313[2] = v321;
                  if (v318 != v8)
                  {
                    v324 = 42 * (v311 - a1)
                         - 0x5555555555555555 * ((v318 - *v311) >> 5)
                         + 0x5555555555555555 * ((v8 - *a1) >> 5);
                    v325 = v324 < 2;
                    v326 = v324 - 2;
                    if (!v325)
                    {
                      v452 = v326;
                      v327 = v326 >> 1;
                      *(_QWORD *)&v464 = a1;
                      *((_QWORD *)&v464 + 1) = v8;
                      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v464, v326 >> 1);
                      if (*v311 == v318)
                        v318 = *(v311 - 1) + 4032;
                      v328 = (_OWORD *)*((_QWORD *)&v464 + 1);
                      v329 = *(double *)(*((_QWORD *)&v464 + 1) + 8);
                      v330 = *(double *)(v318 - 88);
                      if (v329 < v330)
                      {
                        v461 = *(unsigned __int8 *)(v318 - 8);
                        v331 = v452;
                        goto LABEL_294;
                      }
                      v331 = v452;
                      if (v329 <= v330 && *(_BYTE *)(*((_QWORD *)&v464 + 1) + 88) && !*(_BYTE *)(v318 - 8))
                      {
                        v461 = 0;
LABEL_294:
                        v332 = (_OWORD *)(v318 - 96);
                        v333 = *(_QWORD *)(v318 - 96);
                        v464 = *(_OWORD *)(v318 - 80);
                        v334 = *(_OWORD *)(v318 - 64);
                        v335 = *(_OWORD *)(v318 - 48);
                        v336 = *(_OWORD *)(v318 - 32);
                        v468 = *(_QWORD *)(v318 - 16);
                        v466 = v335;
                        v467 = v336;
                        v465 = v334;
                        v453 = *(_BYTE *)(v318 - 7);
                        v337 = *(_OWORD *)((char *)v328 + 74);
                        v339 = v328[2];
                        v338 = v328[3];
                        v332[4] = v328[4];
                        v340 = v328[1];
                        *v332 = *v328;
                        v332[1] = v340;
                        v332[2] = v339;
                        v332[3] = v338;
                        *(_OWORD *)((char *)v332 + 74) = v337;
                        if (v331 >= 2)
                        {
                          v341 = v328;
                          while (1)
                          {
                            v342 = v327 - 1;
                            v327 = (unint64_t)(v327 - 1) >> 1;
                            v462 = a1;
                            v463 = v8;
                            std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v462, v327);
                            v328 = (_OWORD *)v463;
                            v343 = *(double *)(v463 + 8);
                            if (v343 >= v330)
                            {
                              if (v343 > v330)
                                break;
                              if (!*(_BYTE *)(v463 + 88) || v461 != 0)
                                break;
                            }
                            v345 = *(_OWORD *)(v463 + 16);
                            *v341 = *(_OWORD *)v463;
                            v341[1] = v345;
                            v346 = v328[2];
                            v347 = v328[3];
                            v348 = v328[4];
                            *(_OWORD *)((char *)v341 + 74) = *(_OWORD *)((char *)v328 + 74);
                            v341[3] = v347;
                            v341[4] = v348;
                            v341[2] = v346;
                            v341 = v328;
                            if (v342 <= 1)
                              goto LABEL_311;
                          }
                          v328 = v341;
                        }
LABEL_311:
                        *(_QWORD *)v328 = v333;
                        *((double *)v328 + 1) = v330;
                        v349 = v468;
                        v350 = v467;
                        v328[3] = v466;
                        v328[4] = v350;
                        *((_QWORD *)v328 + 10) = v349;
                        v351 = v465;
                        v328[1] = v464;
                        v328[2] = v351;
                        *((_BYTE *)v328 + 88) = v461;
                        *((_BYTE *)v328 + 89) = v453;
                      }
                    }
                  }
                }
                v291 = v456;
                v352 = v458;
                if (v458 == *v456)
                {
                  v291 = v456 - 1;
                  v352 = *(v456 - 1) + 4032;
                }
                v290 = v352 - 96;
                v325 = v292-- <= 2;
                if (v325)
                  return;
                continue;
              }
            }
          }
        }
        v16 = v6;
        v17 = a3;
        v18 = a5;
        v19 = (unint64_t)v15 >> 1;
        if ((unint64_t)v15 < 0x81)
        {
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, (unint64_t)v15 >> 1);
          v25 = v16 - *v17;
          v26 = 0xAAAAAAAAAAAAAAABLL * (v25 >> 5);
          if (v25 < 97)
          {
            v36 = 42 - v26;
            v28 = &v17[-(v36 / 0x2A)];
            v29 = *v28 + 96 * (42 * (v36 / 0x2A) - v36) + 3936;
          }
          else
          {
            v27 = v26 - 1;
            v28 = &v17[v27 / 0x2A];
            v29 = *v28 + 96 * (v27 % 0x2A);
          }
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v469, *((uint64_t *)&v469 + 1), (uint64_t)a1, v8, (uint64_t)v28, v29);
          v37 = v18;
          a3 = v17;
          v6 = v16;
        }
        else
        {
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, (unint64_t)v15 >> 1);
          v20 = v16 - *v17;
          v21 = 0xAAAAAAAAAAAAAAABLL * (v20 >> 5);
          if (v20 < 97)
          {
            v30 = 42 - v21;
            v23 = &v17[-(v30 / 0x2A)];
            v24 = *v23 + 96 * (42 * (v30 / 0x2A) - v30) + 3936;
          }
          else
          {
            v22 = v21 - 1;
            v23 = &v17[v22 / 0x2A];
            v24 = *v23 + 96 * (v22 % 0x2A);
          }
          v454 = v18;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v8, v469, *((uint64_t *)&v469 + 1), (uint64_t)v23, v24);
          v31 = v8 - *a1;
          v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 5);
          if (v31 < -95)
          {
            v38 = 40 - v32;
            v34 = &a1[-(v38 / 0x2A)];
            v35 = *v34 + 96 * (42 * (v38 / 0x2A) - v38) + 3936;
          }
          else
          {
            v33 = v32 + 1;
            v34 = &a1[v33 / 0x2A];
            v35 = *v34 + 96 * (v33 % 0x2A);
          }
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19 - 1);
          v39 = v16 - *v17;
          v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 5);
          if (v39 < 193)
          {
            v44 = 43 - v40;
            v42 = &v17[-(v44 / 0x2A)];
            v43 = *v42 + 96 * (42 * (v44 / 0x2A) - v44) + 3936;
          }
          else
          {
            v41 = v40 - 2;
            v42 = &v17[v41 / 0x2A];
            v43 = *v42 + 96 * (v41 % 0x2A);
          }
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)v34, v35, v469, *((uint64_t *)&v469 + 1), (uint64_t)v42, v43);
          v45 = v8 - *a1;
          v46 = 0xAAAAAAAAAAAAAAABLL * (v45 >> 5);
          if (v45 < -191)
          {
            v50 = 39 - v46;
            v48 = &a1[-(v50 / 0x2A)];
            v49 = *v48 + 96 * (42 * (v50 / 0x2A) - v50) + 3936;
          }
          else
          {
            v47 = v46 + 2;
            v48 = &a1[v47 / 0x2A];
            v49 = *v48 + 96 * (v47 % 0x2A);
          }
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19 + 1);
          v51 = v16 - *v17;
          v52 = 0xAAAAAAAAAAAAAAABLL * (v51 >> 5);
          if (v51 < 289)
          {
            v56 = 44 - v52;
            v54 = &v17[-(v56 / 0x2A)];
            v55 = *v54 + 96 * (42 * (v56 / 0x2A) - v56) + 3936;
          }
          else
          {
            v53 = v52 - 3;
            v54 = &v17[v53 / 0x2A];
            v55 = *v54 + 96 * (v53 % 0x2A);
          }
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)v48, v49, v469, *((uint64_t *)&v469 + 1), (uint64_t)v54, v55);
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19 - 1);
          v57 = v469;
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19);
          v58 = v469;
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19 + 1);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v57, *((uint64_t *)&v57 + 1), v58, *((uint64_t *)&v58 + 1), v469, *((uint64_t *)&v469 + 1));
          *(_QWORD *)&v469 = a1;
          *((_QWORD *)&v469 + 1) = v8;
          std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v469, v19);
          v59 = (_OWORD *)*((_QWORD *)&v469 + 1);
          v60 = *(_OWORD *)(v8 + 16);
          v469 = *(_OWORD *)v8;
          v470 = v60;
          v61 = *(_OWORD *)(v8 + 32);
          v62 = *(_OWORD *)(v8 + 48);
          v63 = *(_OWORD *)(v8 + 80);
          *(_OWORD *)v473 = *(_OWORD *)(v8 + 64);
          *(_OWORD *)&v473[16] = v63;
          v471 = v61;
          v472 = v62;
          v65 = v59[3];
          v64 = v59[4];
          v66 = v59[2];
          *(_OWORD *)(v8 + 74) = *(_OWORD *)((char *)v59 + 74);
          *(_OWORD *)(v8 + 48) = v65;
          *(_OWORD *)(v8 + 64) = v64;
          *(_OWORD *)(v8 + 32) = v66;
          v67 = v59[1];
          *(_OWORD *)v8 = *v59;
          *(_OWORD *)(v8 + 16) = v67;
          v59[3] = v472;
          v59[2] = v471;
          v59[4] = *(_OWORD *)v473;
          *(_OWORD *)((char *)v59 + 74) = *(_OWORD *)&v473[10];
          *v59 = v469;
          v59[1] = v470;
          a3 = v17;
          v37 = v454;
          v6 = v16;
        }
        a5 = v37 - 1;
        if ((a6 & 1) != 0)
        {
          v68 = *(double *)(v8 + 8);
          goto LABEL_33;
        }
        v69 = v8 - *a1;
        v70 = 0xAAAAAAAAAAAAAAABLL * (v69 >> 5);
        if (v69 < 97)
          v71 = a1[-((42 - v70) / 0x2A)] + 96 * (42 * ((42 - v70) / 0x2A) - (42 - v70)) + 3936;
        else
          v71 = a1[(v70 - 1) / 0x2A] + 96 * ((v70 - 1) % 0x2A);
        v72 = *(double *)(v71 + 8);
        v68 = *(double *)(v8 + 8);
        if (v72 >= v68)
        {
          if (v72 <= v68)
          {
            v145 = *(unsigned __int8 *)(v71 + 88);
            v137 = *(unsigned __int8 *)(v8 + 88);
            if (v145)
              v146 = v137 == 0;
            else
              v146 = 0;
            if (v146)
              goto LABEL_33;
          }
          else
          {
            v137 = *(unsigned __int8 *)(v8 + 88);
          }
          v147 = *(_QWORD *)v8;
          v148 = *(_OWORD *)(v8 + 32);
          v149 = *(_OWORD *)(v8 + 48);
          v150 = *(_OWORD *)(v8 + 64);
          v468 = *(_QWORD *)(v8 + 80);
          v467 = v150;
          v151 = *(_OWORD *)(v8 + 16);
          v465 = v148;
          v466 = v149;
          v464 = v151;
          v152 = (double *)*a3;
          v153 = v6 - *a3;
          v154 = 0xAAAAAAAAAAAAAAABLL * (v153 >> 5);
          if (v153 < 97)
            v155 = a3[-((42 - v154) / 0x2A)] + 96 * (42 * ((42 - v154) / 0x2A) - (42 - v154)) + 3936;
          else
            v155 = a3[(v154 - 1) / 0x2A] + 96 * ((v154 - 1) % 0x2A);
          v156 = *(_BYTE *)(v8 + 89);
          v157 = *(double *)(v155 + 8);
          if (v68 < v157 || v68 <= v157 && v137 && !*(_BYTE *)(v155 + 88))
          {
            v158 = *a1;
            v139 = v8;
            do
            {
              v139 += 96;
              if (v139 - v158 == 4032)
              {
                v159 = a1[1];
                ++a1;
                v158 = v159;
                v139 = v159;
              }
              v160 = *(double *)(v139 + 8);
            }
            while (v68 >= v160 && (v68 > v160 || !v137 || *(_BYTE *)(v139 + 88)));
          }
          else
          {
            v158 = *a1;
            v139 = v8;
            do
            {
              v139 += 96;
              if (v139 - v158 == 4032)
              {
                v161 = a1[1];
                ++a1;
                v158 = v161;
                v139 = v161;
              }
              if (a1 >= a3 && (a1 != a3 || v139 >= v6))
                break;
              v162 = *(double *)(v139 + 8);
              if (v68 < v162)
                break;
            }
            while (v68 > v162 || !v137 || *(_BYTE *)(v139 + 88));
          }
          if (a1 < a3 || (v163 = a3, v164 = (double *)v6, a1 == a3) && (v163 = a3, v164 = (double *)v6, v139 < v6))
          {
            v163 = a3;
            v164 = (double *)v6;
            do
            {
              if (v164 == v152)
              {
                v166 = (double *)*--v163;
                v152 = v166;
                v165 = v166 + 504;
              }
              else
              {
                v165 = v164;
              }
              v164 = v165 - 12;
              v167 = *(v165 - 11);
            }
            while (v68 < v167 || v68 <= v167 && v137 && !*((_BYTE *)v165 - 8));
          }
          while (a1 < v163 || a1 == v163 && v139 < (unint64_t)v164)
          {
            v168 = *(_OWORD *)(v139 + 16);
            v469 = *(_OWORD *)v139;
            v470 = v168;
            v169 = *(_OWORD *)(v139 + 32);
            v170 = *(_OWORD *)(v139 + 48);
            v171 = *(_OWORD *)(v139 + 80);
            *(_OWORD *)v473 = *(_OWORD *)(v139 + 64);
            *(_OWORD *)&v473[16] = v171;
            v471 = v169;
            v472 = v170;
            v173 = *((_OWORD *)v164 + 3);
            v172 = *((_OWORD *)v164 + 4);
            v174 = *((_OWORD *)v164 + 2);
            *(_OWORD *)(v139 + 74) = *(_OWORD *)((char *)v164 + 74);
            *(_OWORD *)(v139 + 48) = v173;
            *(_OWORD *)(v139 + 64) = v172;
            *(_OWORD *)(v139 + 32) = v174;
            v175 = *((_OWORD *)v164 + 1);
            *(_OWORD *)v139 = *(_OWORD *)v164;
            *(_OWORD *)(v139 + 16) = v175;
            v176 = v470;
            *(_OWORD *)v164 = v469;
            *((_OWORD *)v164 + 1) = v176;
            v177 = v471;
            v178 = v472;
            v179 = *(_OWORD *)v473;
            *(_OWORD *)((char *)v164 + 74) = *(_OWORD *)&v473[10];
            *((_OWORD *)v164 + 3) = v178;
            *((_OWORD *)v164 + 4) = v179;
            *((_OWORD *)v164 + 2) = v177;
            v158 = *a1;
            do
            {
              v139 += 96;
              if (v139 - v158 == 4032)
              {
                v180 = a1[1];
                ++a1;
                v158 = v180;
                v139 = v180;
              }
              v181 = *(double *)(v139 + 8);
            }
            while (v68 >= v181 && (v68 > v181 || !v137 || *(_BYTE *)(v139 + 88)));
            v182 = (double *)*v163;
            while (1)
            {
              if (v164 == v182)
              {
                v184 = (double *)*--v163;
                v182 = v184;
                v183 = v184 + 504;
              }
              else
              {
                v183 = v164;
              }
              v164 = v183 - 12;
              v185 = *(v183 - 11);
              if (v68 >= v185)
              {
                if (v68 > v185)
                  break;
                v186 = *((unsigned __int8 *)v183 - 8);
                if (!v137 || v186)
                  break;
              }
            }
          }
          v187 = v139 - v158;
          v188 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v139 - v158) >> 5);
          if (v187 < 97)
            v189 = a1[-((42 - v188) / 0x2A)] + 96 * (42 * ((42 - v188) / 0x2A) - (42 - v188)) + 3936;
          else
            v189 = a1[(v188 - 1) / 0x2A] + 96 * ((v188 - 1) % 0x2A);
          if (v189 != v8)
          {
            v190 = *(_OWORD *)(v189 + 16);
            *(_OWORD *)v8 = *(_OWORD *)v189;
            *(_OWORD *)(v8 + 16) = v190;
            v191 = *(_OWORD *)(v189 + 32);
            v192 = *(_OWORD *)(v189 + 48);
            v193 = *(_OWORD *)(v189 + 64);
            *(_OWORD *)(v8 + 74) = *(_OWORD *)(v189 + 74);
            *(_OWORD *)(v8 + 48) = v192;
            *(_OWORD *)(v8 + 64) = v193;
            *(_OWORD *)(v8 + 32) = v191;
          }
          a6 = 0;
          *(_QWORD *)v189 = v147;
          *(double *)(v189 + 8) = v68;
          v194 = v464;
          *(_OWORD *)(v189 + 32) = v465;
          *(_OWORD *)(v189 + 48) = v466;
          *(_OWORD *)(v189 + 64) = v467;
          *(_QWORD *)(v189 + 80) = v468;
          *(_OWORD *)(v189 + 16) = v194;
          *(_BYTE *)(v189 + 88) = v137;
          *(_BYTE *)(v189 + 89) = v156;
          goto LABEL_178;
        }
LABEL_33:
        v73 = *(_QWORD *)v8;
        v74 = *(_OWORD *)(v8 + 32);
        v75 = *(_OWORD *)(v8 + 48);
        v76 = *(_OWORD *)(v8 + 64);
        v468 = *(_QWORD *)(v8 + 80);
        v467 = v76;
        v77 = *(_OWORD *)(v8 + 16);
        v465 = v74;
        v466 = v75;
        v464 = v77;
        v78 = *(unsigned __int8 *)(v8 + 88);
        v79 = *(_BYTE *)(v8 + 89);
        v80 = *a1;
        v81 = a1;
        v82 = v8;
        while (1)
        {
          v82 += 96;
          if (v82 - v80 == 4032)
          {
            v83 = v81[1];
            ++v81;
            v80 = v83;
            v82 = v83;
          }
          v84 = *(double *)(v82 + 8);
          if (v84 >= v68)
          {
            if (v84 > v68)
              break;
            if (!*(_BYTE *)(v82 + 88) || v78 != 0)
              break;
          }
        }
        v86 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v82 - v80) >> 5);
        if ((uint64_t)(v82 - v80) < 97)
          v87 = v81[-((42 - v86) / 0x2A)] + 96 * (42 * ((42 - v86) / 0x2A) - (42 - v86)) + 3936;
        else
          v87 = v81[(v86 - 1) / 0x2A] + 96 * ((v86 - 1) % 0x2A);
        v88 = a3;
        v89 = (double *)v6;
        if (v87 == v8)
        {
          do
          {
            if (v81 >= v88 && (v81 != v88 || v82 >= (unint64_t)v89))
              break;
            if (v89 == (double *)*v88)
            {
              v95 = *--v88;
              v94 = (double *)(v95 + 4032);
            }
            else
            {
              v94 = v89;
            }
            v89 = v94 - 12;
            v96 = *(v94 - 11);
            if (v96 < v68)
              break;
          }
          while (v96 > v68 || !*((_BYTE *)v94 - 8) || *(_BYTE *)(v8 + 88));
        }
        else
        {
          v90 = (double *)*a3;
          v88 = a3;
          v89 = (double *)v6;
          do
          {
            if (v89 == v90)
            {
              v92 = (double *)*--v88;
              v90 = v92;
              v91 = v92 + 504;
            }
            else
            {
              v91 = v89;
            }
            v89 = v91 - 12;
            v93 = *(v91 - 11);
          }
          while (v93 >= v68 && (v93 > v68 || !*((_BYTE *)v91 - 8) || *(_BYTE *)(v8 + 88)));
        }
        v97 = v81 >= v88 && (v81 != v88 || v82 >= (unint64_t)v89);
        while (v81 < v88 || v81 == v88 && v82 < (unint64_t)v89)
        {
          v99 = *(_OWORD *)(v82 + 16);
          v469 = *(_OWORD *)v82;
          v470 = v99;
          v100 = *(_OWORD *)(v82 + 32);
          v101 = *(_OWORD *)(v82 + 48);
          v102 = *(_OWORD *)(v82 + 80);
          *(_OWORD *)v473 = *(_OWORD *)(v82 + 64);
          *(_OWORD *)&v473[16] = v102;
          v471 = v100;
          v472 = v101;
          v104 = *((_OWORD *)v89 + 3);
          v103 = *((_OWORD *)v89 + 4);
          v105 = *((_OWORD *)v89 + 2);
          *(_OWORD *)(v82 + 74) = *(_OWORD *)((char *)v89 + 74);
          *(_OWORD *)(v82 + 48) = v104;
          *(_OWORD *)(v82 + 64) = v103;
          *(_OWORD *)(v82 + 32) = v105;
          v106 = *((_OWORD *)v89 + 1);
          *(_OWORD *)v82 = *(_OWORD *)v89;
          *(_OWORD *)(v82 + 16) = v106;
          v107 = v470;
          *(_OWORD *)v89 = v469;
          *((_OWORD *)v89 + 1) = v107;
          v108 = v471;
          v109 = v472;
          v110 = *(_OWORD *)v473;
          *(_OWORD *)((char *)v89 + 74) = *(_OWORD *)&v473[10];
          *((_OWORD *)v89 + 3) = v109;
          *((_OWORD *)v89 + 4) = v110;
          *((_OWORD *)v89 + 2) = v108;
          v80 = *v81;
          while (1)
          {
            v82 += 96;
            if (v82 - v80 == 4032)
            {
              v111 = v81[1];
              ++v81;
              v80 = v111;
              v82 = v111;
            }
            v112 = *(double *)(v82 + 8);
            if (v112 >= v68)
            {
              if (v112 > v68)
                break;
              if (!*(_BYTE *)(v82 + 88) || v78 != 0)
                break;
            }
          }
          v114 = (double *)*v88;
          do
          {
            if (v89 == v114)
            {
              v116 = (double *)*--v88;
              v114 = v116;
              v115 = v116 + 504;
            }
            else
            {
              v115 = v89;
            }
            v89 = v115 - 12;
            v117 = *(v115 - 11);
          }
          while (v117 >= v68 && (v117 > v68 || !*((_BYTE *)v115 - 8) || v78));
        }
        v118 = v82 - v80;
        v119 = 0xAAAAAAAAAAAAAAABLL * (v118 >> 5);
        if (v118 < 97)
        {
          v123 = 42 - v119;
          v121 = &v81[-(v123 / 0x2A)];
          v122 = *v121 + 96 * (42 * (v123 / 0x2A) - v123) + 3936;
        }
        else
        {
          v120 = v119 - 1;
          v121 = &v81[v120 / 0x2A];
          v122 = *v121 + 96 * (v120 % 0x2A);
        }
        if (v122 != v8)
        {
          v124 = *(_OWORD *)(v122 + 16);
          *(_OWORD *)v8 = *(_OWORD *)v122;
          *(_OWORD *)(v8 + 16) = v124;
          v125 = *(_OWORD *)(v122 + 32);
          v126 = *(_OWORD *)(v122 + 48);
          v127 = *(_OWORD *)(v122 + 64);
          *(_OWORD *)(v8 + 74) = *(_OWORD *)(v122 + 74);
          *(_OWORD *)(v8 + 48) = v126;
          *(_OWORD *)(v8 + 64) = v127;
          *(_OWORD *)(v8 + 32) = v125;
        }
        *(_QWORD *)v122 = v73;
        *(double *)(v122 + 8) = v68;
        v128 = v464;
        *(_OWORD *)(v122 + 32) = v465;
        *(_OWORD *)(v122 + 48) = v466;
        *(_OWORD *)(v122 + 64) = v467;
        *(_QWORD *)(v122 + 80) = v468;
        *(_OWORD *)(v122 + 16) = v128;
        *(_BYTE *)(v122 + 88) = v78;
        *(_BYTE *)(v122 + 89) = v79;
        if (!v97)
          goto LABEL_112;
        v129 = a3;
        v130 = a5;
        v131 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(a1, v8, v121, v122);
        v132 = v122 - *v121;
        v133 = 0xAAAAAAAAAAAAAAABLL * (v132 >> 5);
        if (v132 < -95)
        {
          v138 = 40 - v133;
          v135 = &v121[-(v138 / 0x2A)];
          v136 = *v135 + 96 * (42 * (v138 / 0x2A) - v138) + 3936;
        }
        else
        {
          v134 = v133 + 1;
          v135 = &v121[v134 / 0x2A];
          v136 = *v135 + 96 * (v134 % 0x2A);
        }
        if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v135, v136, v129, v6))
        {
          v139 = v8;
          v6 = v122;
          a3 = v121;
          a5 = v130;
          if ((v131 & 1) != 0)
            return;
          goto LABEL_178;
        }
        a5 = v130;
        a3 = v129;
        if (v131)
        {
          v139 = v122 + 96;
          if (v122 + 96 - *v121 == 4032)
          {
            v140 = v121[1];
            ++v121;
            v139 = v140;
          }
          a1 = v121;
        }
        else
        {
LABEL_112:
          v141 = a3;
          v142 = v8;
          v143 = a5;
          std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>,false>(a1, v142, v121, v122);
          v139 = v122 + 96;
          a6 = 0;
          if (v122 + 96 - *v121 == 4032)
          {
            v144 = v121[1];
            ++v121;
            v139 = v144;
          }
          a1 = v121;
          a5 = v143;
          a3 = v141;
        }
LABEL_178:
        v8 = v139;
        if (v6 != v139)
          continue;
        return;
    }
  }
}

@end
