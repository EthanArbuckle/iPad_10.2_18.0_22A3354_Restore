@implementation GEOMapFeatureMultiSegmentRoad

- (GEOMapFeatureMultiSegmentRoad)initWithRoadSegments:(id)a3
{
  void *v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *roadSegments;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  unint64_t v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSArray *v37;
  int v39;
  GEOMapFeatureMultiSegmentRoad *v40;
  id v41;
  NSArray *v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v53.receiver = self;
  v53.super_class = (Class)GEOMapFeatureMultiSegmentRoad;
  v40 = -[GEOMapFeatureLine init](&v53, sel_init);
  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v4, "isFlipped");

    if (v39)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v41, "count"));
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v6 = v41;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v50;
        v9 = 0x1E0CB3000uLL;
        v42 = v5;
        v43 = v6;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v50 != v8)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            v12 = objc_msgSend(v11, "roadID") & 0xFFFFFFFFFFFFFFFELL;
            objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedLongLong:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v44, "containsObject:", v13);

            if (v14)
            {
              GEOGetGEOMapFeatureAccessLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                v16 = v9;
                objc_msgSend(v11, "internalRoadName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = *(_QWORD *)objc_msgSend(v11, "coordinates3d");
                v19 = *(_QWORD *)(objc_msgSend(v11, "coordinates3d") + 8);
                v20 = objc_msgSend(v11, "roadID");
                *(_DWORD *)buf = 138413058;
                v56 = v17;
                v57 = 2048;
                v58 = v18;
                v59 = 2048;
                v60 = v19;
                v61 = 2048;
                v62 = v20;
                _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_FAULT, "Multi segment road has duplicate segments. This is likely a loop road and will cause path matching to fail. Road: %@ | %f, %f | %llu", buf, 0x2Au);

                v5 = v42;
                v9 = v16;
                v6 = v43;
              }

            }
            objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedLongLong:", v12);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v21);

            objc_msgSend(v11, "flip");
            -[NSArray insertObject:atIndex:](v5, "insertObject:atIndex:", v11, 0);
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
        }
        while (v7);
      }

      roadSegments = v40->_roadSegments;
      v40->_roadSegments = v5;
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = v41;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            v28 = objc_msgSend(v27, "roadID") & 0xFFFFFFFFFFFFFFFELL;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v44, "containsObject:", v29);

            if (v30)
            {
              GEOGetGEOMapFeatureAccessLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v27, "internalRoadName");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = *(_QWORD *)objc_msgSend(v27, "coordinates3d");
                v34 = *(_QWORD *)(objc_msgSend(v27, "coordinates3d") + 8);
                v35 = objc_msgSend(v27, "roadID");
                *(_DWORD *)buf = 138413058;
                v56 = v32;
                v57 = 2048;
                v58 = v33;
                v59 = 2048;
                v60 = v34;
                v61 = 2048;
                v62 = v35;
                _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_FAULT, "Multi segment road has duplicate segments. This is likely a loop road and will cause path matching to fail. Road: %@ | %f, %f | %llu", buf, 0x2Au);

              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v28);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addObject:", v36);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v24);
      }

      v37 = (NSArray *)v23;
      roadSegments = v40->_roadSegments;
      v40->_roadSegments = v37;
    }

    v40->super.super._isFlipped = v39;
  }

  return v40;
}

- (unint64_t)roadID
{
  _BOOL4 isFlipped;
  NSArray *roadSegments;
  void *v4;
  unint64_t v5;

  isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped)
    -[NSArray lastObject](roadSegments, "lastObject");
  else
    -[NSArray firstObject](roadSegments, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "roadID");

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d
{
  $1AB5FA073B851C12C2339EC22442E995 *coordinates3d;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double *v24;
  double *v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  double *v32;
  __int128 v33;
  _BYTE *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  BOOL v40;
  size_t v41;
  $1AB5FA073B851C12C2339EC22442E995 *v42;
  NSArray *obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *__p;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  coordinates3d = self->super.super._coordinates3d;
  if (!coordinates3d)
  {
    __p = 0;
    v54 = 0;
    v55 = 0;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = self->_roadSegments;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v4)
    {
      v45 = *(_QWORD *)v50;
      do
      {
        v5 = 0;
        v46 = v4;
        do
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v5);
          v56 = 0;
          v57 = 0;
          v56 = objc_msgSend(v6, "tileKey");
          v57 = v7;
          v8 = GEOMapRectForGEOTileKey((uint64_t)&v56);
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v47 = 0;
          v48 = 0;
          objc_msgSend(v6, "feature");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = GEOMultiSectionFeaturePointsWithElevation(v15, 0, &v47, &v48);

          v17 = v48;
          if (v48)
          {
            v18 = 0;
            do
            {
              v20 = GEOCoordinate2DForMapPoint(v8 + *(float *)&v16[v18] * v12, v10 + (float)(1.0 - *((float *)&v16[v18] + 1)) * v14);
              v21 = v19;
              if (v47)
                v22 = *(float *)(v47 + 4 * v18);
              else
                v22 = 0.0;
              v23 = v22;
              v24 = (double *)__p;
              v25 = (double *)v54;
              if (v18
                || __p == v54
                || vabdd_f64(*((double *)v54 - 3), v20) >= 0.00000000999999994
                || vabdd_f64(*((double *)v54 - 2), v19) >= 0.00000000999999994
                || vabdd_f64(*((double *)v54 - 1), v23) >= 0.00000000999999994)
              {
                if (v54 >= v55)
                {
                  v27 = 0xAAAAAAAAAAAAAAABLL * ((v54 - (_BYTE *)__p) >> 3);
                  v28 = v27 + 1;
                  if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  if (0x5555555555555556 * ((v55 - (_BYTE *)__p) >> 3) > v28)
                    v28 = 0x5555555555555556 * ((v55 - (_BYTE *)__p) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * ((v55 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                    v29 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v29 = v28;
                  if (v29)
                  {
                    v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v55, v29);
                    v24 = (double *)__p;
                    v25 = (double *)v54;
                  }
                  else
                  {
                    v30 = 0;
                  }
                  v31 = &v30[24 * v27];
                  *(double *)v31 = v20;
                  *((double *)v31 + 1) = v21;
                  *((double *)v31 + 2) = v23;
                  v32 = (double *)v31;
                  if (v25 != v24)
                  {
                    do
                    {
                      v33 = *(_OWORD *)(v25 - 3);
                      *(v32 - 1) = *(v25 - 1);
                      *(_OWORD *)(v32 - 3) = v33;
                      v32 -= 3;
                      v25 -= 3;
                    }
                    while (v25 != v24);
                    v24 = (double *)__p;
                  }
                  v26 = v31 + 24;
                  __p = v32;
                  v54 = v31 + 24;
                  v55 = &v30[24 * v29];
                  if (v24)
                    operator delete(v24);
                }
                else
                {
                  *(double *)v54 = v20;
                  v25[1] = v19;
                  v26 = (char *)(v25 + 3);
                  v25[2] = v23;
                }
                v54 = v26;
                v17 = v48;
              }
              ++v18;
            }
            while (v18 < v17);
          }
          ++v5;
        }
        while (v5 != v46);
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v4);
    }

    v34 = __p;
    if (self->super.super._isFlipped && __p != v54)
    {
      v35 = v54 - 24;
      if (v54 - 24 > __p)
      {
        v36 = (char *)__p + 24;
        do
        {
          v37 = *((_QWORD *)v36 - 1);
          v38 = *(_OWORD *)(v36 - 24);
          v39 = *((_QWORD *)v35 + 2);
          *(_OWORD *)(v36 - 24) = *(_OWORD *)v35;
          *((_QWORD *)v36 - 1) = v39;
          *(_OWORD *)v35 = v38;
          *((_QWORD *)v35 + 2) = v37;
          v35 -= 24;
          v40 = v36 >= v35;
          v36 += 24;
        }
        while (!v40);
        v34 = __p;
      }
    }
    v41 = v54 - v34;
    self->super.super._coordinateCount = 0xAAAAAAAAAAAAAAABLL * ((v54 - v34) >> 3);
    v42 = ($1AB5FA073B851C12C2339EC22442E995 *)malloc_type_malloc(v41, 0xFD87710uLL);
    self->super.super._coordinates3d = v42;
    memcpy(v42, __p, v41);
    coordinates3d = self->super.super._coordinates3d;
    if (__p)
    {
      v54 = (char *)__p;
      operator delete(__p);
    }
  }
  return coordinates3d;
}

- (uint64_t)tileKey
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 104), "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "tileKey");

  return v2;
}

- (id)feature
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_roadSegments, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)startFeature
{
  _BOOL4 isFlipped;
  NSArray *roadSegments;
  void *v4;
  void *v5;

  isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped)
    -[NSArray lastObject](roadSegments, "lastObject");
  else
    -[NSArray firstObject](roadSegments, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endFeature
{
  _BOOL4 isFlipped;
  NSArray *roadSegments;
  void *v4;
  void *v5;

  isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped)
    -[NSArray firstObject](roadSegments, "firstObject");
  else
    -[NSArray lastObject](roadSegments, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_junctionA
{
  void *v3;
  void *v4;
  GEOMapFeatureJunction *v5;
  GEOMapFeatureJunction *junctionA;

  if (!self->super._checkedJunctionA)
  {
    -[NSArray firstObject](self->_roadSegments, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapFeatureJunction junctionForRoadFeature:startJunction:](GEOMapFeatureJunction, "junctionForRoadFeature:startJunction:", v4, 1);
    v5 = (GEOMapFeatureJunction *)objc_claimAutoreleasedReturnValue();
    junctionA = self->super._junctionA;
    self->super._junctionA = v5;

    self->super._checkedJunctionA = 1;
  }
  return self->super._junctionA;
}

- (id)_junctionB
{
  void *v3;
  void *v4;
  GEOMapFeatureJunction *v5;
  GEOMapFeatureJunction *junctionB;

  if (!self->super._checkedJunctionB)
  {
    -[NSArray lastObject](self->_roadSegments, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOMapFeatureJunction junctionForRoadFeature:startJunction:](GEOMapFeatureJunction, "junctionForRoadFeature:startJunction:", v4, 0);
    v5 = (GEOMapFeatureJunction *)objc_claimAutoreleasedReturnValue();
    junctionB = self->super._junctionB;
    self->super._junctionB = v5;

    self->super._checkedJunctionB = 1;
  }
  return self->super._junctionB;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapFeatureMultiSegmentRoad;
  v4 = -[GEOMapFeatureRoad copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 13, self->_roadSegments);
  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *roadSegments;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureRoad description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v3);

  v4 = -[GEOMapFeatureRoad formOfWay](self, "formOfWay");
  if (v4 < 0x17 && ((0x7EDDDFu >> v4) & 1) != 0)
  {
    v5 = off_1E1C13E08[(int)v4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v6);

  v7 = -[GEOMapFeatureRoad walkableSide](self, "walkableSide");
  if (v7 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C13EC0[(int)v7];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v9);

  v10 = -[GEOMapFeatureRoad bikeableSide](self, "bikeableSide");
  if (v10 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E1C13EE0[(int)v10];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v12);

  v13 = -[GEOMapFeatureRoad bikeLaneSide](self, "bikeLaneSide");
  if (v13 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E1C13F00[(int)v13];
  }
  -[GEOMapFeatureLine _formattedProtobufEnum:](self, "_formattedProtobufEnum:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v29, "componentsJoinedByString:", CFSTR(" | "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "appendString:", CFSTR("\n\tAll tiles:"));
  roadSegments = self->_roadSegments;
  if (self->super.super._isFlipped)
    -[NSArray reverseObjectEnumerator](roadSegments, "reverseObjectEnumerator");
  else
    -[NSArray objectEnumerator](roadSegments, "objectEnumerator");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v20);
        *(_QWORD *)&v34 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "tileKey");
        *((_QWORD *)&v34 + 1) = v24;
        v25 = v34 & 0x7F;
        if ((_DWORD)v25 == 12)
        {
          *((_QWORD *)&v26 + 1) = *(unsigned __int16 *)((char *)&v34 + 9) | ((unint64_t)BYTE11(v34) << 16);
          *(_QWORD *)&v26 = *(_QWORD *)((char *)&v34 + 1);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu_%d_type_%d"), (unint64_t)(v26 >> 6), BYTE1(v34) & 0x3F, ((*(unsigned __int16 *)((char *)&v34 + 9) | (BYTE11(v34) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d_provider_%d_type_%d"), ((*(_QWORD *)((char *)&v34 + 1) >> 46) | (*(_DWORD *)((char *)&v34 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v34 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v34 + 13) | (HIBYTE(v34) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(_QWORD *)((char *)&v34 + 1) >> 40) & 0x3FLL, v25, *(unsigned __int16 *)((char *)&v34 + 13) >> 2);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendFormat:", CFSTR("\n\t\t%@"), v27);

      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v21);
  }

  return v18;
}

- (id)coordinatesDescription
{
  void *v3;
  NSArray *roadSegments;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  unint64_t j;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  roadSegments = self->_roadSegments;
  if (self->super.super._isFlipped)
    -[NSArray reverseObjectEnumerator](roadSegments, "reverseObjectEnumerator");
  else
    -[NSArray objectEnumerator](roadSegments, "objectEnumerator");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Coordinates: %d"), objc_msgSend(v7, "coordinateCount"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        for (j = 0; j < objc_msgSend(v7, "coordinateCount"); ++j)
        {
          v10 = j;
          if (self->super.super._isFlipped)
            v10 = objc_msgSend(v7, "coordinateCount") + ~j;
          v11 = objc_msgSend(v7, "coordinates3d");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%2d] %0.6f, %0.6f | %0.2fm"), j, *(_QWORD *)(v11 + 24 * v10), *(_QWORD *)(v11 + 24 * v10 + 8), *(_QWORD *)(v11 + 24 * v10 + 16));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = -[GEOMapFeatureLine coordinateCount](self, "coordinateCount");
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Total coordinates: %d\n%@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSArray)roadSegments
{
  return self->_roadSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadSegments, 0);
}

@end
