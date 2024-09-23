@implementation GEOSnappedRoutePath

- (GEOSnappedRoutePath)initWithRoute:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6
{
  id v10;
  id v11;
  GEOSnappedRoutePath *v12;
  GEOSnappedRoutePath *v13;
  uint64_t v14;
  uint64_t v15;
  RouteMapMatchingSection *value;
  CFSetCallBacks v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GEOSnappedRoutePath;
  v12 = -[GEOSnappedRoutePath init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v18 = *(CFSetCallBacks *)byte_1E1C20610;
    objc_storeWeak((id *)&v12->_route, v10);
    objc_storeWeak((id *)&v13->_section, v11);
    v13->_routeStartIndex = a5;
    v13->_routeEndIndex = a6;
    v13->_unsnappedPointCount = a6 - a5 + 1;
    v14 = objc_msgSend(v11, "points", *(_OWORD *)&v18.version, *(_OWORD *)&v18.release, *(_OWORD *)&v18.equal);
    v13->_unsnappedPoints = (GeoCodecsVectorTilePoint3D *)(v14
                                                         + 12
                                                         * (a5 - objc_msgSend(v11, "startPointIndex")));
    v13->_observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v18);
    v15 = operator new();
    *(_QWORD *)v15 = &off_1E1BF6820;
    objc_initWeak((id *)(v15 + 8), v13);
    value = v13->_mapMatchingSection.__ptr_.__value_;
    v13->_mapMatchingSection.__ptr_.__value_ = (RouteMapMatchingSection *)v15;
    if (value)
      (*((void (**)(RouteMapMatchingSection *))value->var0 + 1))(value);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_observers);
  -[GEOMapRequest cancel](self->_edgeSearchRequest, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)GEOSnappedRoutePath;
  -[GEOSnappedRoutePath dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u - %u"), self->_routeStartIndex, self->_routeEndIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_edges)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" Matched Edges:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_edges;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        v10 = v5;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" %@"), v11);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v5;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    if (-[GEOSnappedRoutePath isMapMatching](self, "isMapMatching"))
    {
      objc_msgSend(v4, "stringByAppendingString:", CFSTR(" Matching.."));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[GEOSnappedRoutePath hasCompletedMapMatching](self, "hasCompletedMapMatching"))
        objc_msgSend(v4, "stringByAppendingString:", CFSTR(" Matched, no edges"));
      else
        objc_msgSend(v4, "stringByAppendingString:", CFSTR(" Not matched"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v12;

  }
  return v5;
}

- (void)_debugPrintEdge:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float *v13;
  double v14;
  float v15;
  long double v16;
  long double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  NSLog(CFSTR("%@"), v4);
  v5 = objc_msgSend(v4, "pointCount");
  v6 = objc_msgSend(v4, "points");
  WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bounds");
    v10 = v19;
    v9 = v18;
    v11 = v20;
    v12 = v21;
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
    v10 = 0.0;
    v9 = 0.0;
  }

  if (v5)
  {
    v13 = (float *)(v6 + 4);
    do
    {
      v14 = v9 + *(v13 - 1) * v11;
      v15 = *v13;
      v13 += 2;
      v16 = exp(((v10 + (float)(1.0 - v15) * v12) * 0.0078125 + -1048576.0) / 333772.107);
      v17 = atan(v16);
      printf("%f,%f\n", (double)((v17 * -2.0 + 1.57079633) * 57.2957795), v14 * 0.0078125 * 0.000171661377 + -180.0);
      --v5;
    }
    while (v5);
  }

}

- (BOOL)hasCompletedMapMatching
{
  return self->_hasCompletedMapMatching;
}

- (BOOL)isMapMatched
{
  void *v2;
  BOOL v3;

  -[GEOSnappedRoutePath edges](self, "edges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isMapMatching
{
  return self->_edgeSearchRequest != 0;
}

- (float)_calculateEdgeLengthFrom:(const void *)a3 to:(const void *)a4 startCoord:(const PolylineCoordinate *)a5 endCoord:(const PolylineCoordinate *)a6
{
  float v6;
  float v7;
  unsigned int routeStartIndex;
  unsigned int v9;
  unsigned int v10;
  float var0;
  float var1;
  float v13;
  GeoCodecsVectorTilePoint3D *v14;

  v7 = *(float *)a3;
  v6 = *((float *)a3 + 1);
  routeStartIndex = self->_routeStartIndex;
  v9 = a5->index - routeStartIndex + 1;
  v10 = a6->index - routeStartIndex;
  if (v9 <= v10)
  {
    v13 = 0.0;
    do
    {
      v14 = &self->_unsnappedPoints[v9];
      var0 = v14->var0;
      var1 = v14->var1;
      v13 = v13
          + sqrtf((float)((float)((float)(v7 - v14->var0) * (float)(v7 - v14->var0)) + 0.0)+ (float)((float)(v6 - var1) * (float)(v6 - var1)));
      ++v9;
      v6 = var1;
      v7 = v14->var0;
    }
    while (v9 <= v10);
  }
  else
  {
    var0 = *(float *)a3;
    var1 = *((float *)a3 + 1);
    v13 = 0.0;
  }
  return v13
       + sqrtf((float)((float)((float)(var0 - *(float *)a4) * (float)(var0 - *(float *)a4)) + 0.0)+ (float)((float)(var1 - *((float *)a4 + 1)) * (float)(var1 - *((float *)a4 + 1))));
}

- (void)matchWithDecoder:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8);
  id WeakRetained;
  void *v9;
  char v10;
  _BOOL8 v11;
  NSArray *edges;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  id v15;
  void *v16;
  unint64_t routeEndIndex;
  uint64_t routeStartIndex;
  unint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  void (**v24)(id, _BOOL8);
  void *v25;
  void *v26;
  unint64_t v27;
  GEOMapRequest *v28;
  GEOMapRequest *edgeSearchRequest;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  std::__shared_weak_count *v37;
  _QWORD v38[5];
  void (**v39)(id, _BOOL8);
  _QWORD v40[5];
  void (**v41)(id, _BOOL8);
  void ***v42[2];
  _OWORD v43[2];
  void ***v44[3];
  std::__shared_weak_count *v45;

  v6 = a3;
  v7 = (void (**)(id, _BOOL8))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(WeakRetained, "coordinates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "usesZilch");

  if ((v10 & 1) == 0)
    goto LABEL_5;
  if (self->_hasCompletedMapMatching)
  {
    v11 = -[GEOSnappedRoutePath isMapMatched](self, "isMapMatched");
LABEL_6:
    v7[2](v7, v11);
    goto LABEL_7;
  }
  if (self->_edgeSearchRequest)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  edges = self->_edges;
  self->_edges = 0;

  v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB560;
  zilch::Message::Message((zilch::Message *)&v13[1]);
  v44[2] = (void ***)&v13[1];
  v45 = v13;
  v15 = objc_loadWeakRetained((id *)&self->_route);
  objc_msgSend(v15, "coordinates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  routeStartIndex = self->_routeStartIndex;
  routeEndIndex = self->_routeEndIndex;
  if (routeStartIndex < routeEndIndex
    && objc_msgSend(v16, "coordinateCount") > routeEndIndex)
  {
    v44[0] = (void ***)&v13[1];
    v44[1] = (void ***)v13;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
    _addFullControlPoint(v44, routeStartIndex, v16);
    std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)v44);
    v20 = routeStartIndex + 1;
    if ((int)routeStartIndex + 1 < routeEndIndex)
    {
      v21 = ~(_DWORD)routeStartIndex + routeEndIndex;
      do
      {
        if (v16)
          objc_msgSend(v16, "zilchControlPointAt:", v20);
        else
          memset(v43, 0, sizeof(v43));
        zilch::Message::addPoint((void ***)&v13[1], (const zilch::ControlPoint *)v43);
        ++v20;
        --v21;
      }
      while (v21);
    }
    v42[0] = (void ***)&v13[1];
    v42[1] = (void ***)v13;
    do
      v22 = __ldxr(p_shared_owners);
    while (__stxr(v22 + 1, p_shared_owners));
    _addFullControlPoint(v42, routeEndIndex, v16);
    std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)v42);
  }
  v23 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke;
  v40[3] = &unk_1E1C0E5E8;
  v40[4] = self;
  v24 = v7;
  v41 = v24;
  v25 = (void *)MEMORY[0x18D765024](v40);
  v38[0] = v23;
  v38[1] = 3221225472;
  v38[2] = __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke_2;
  v38[3] = &unk_1E1C20648;
  v38[4] = self;
  v39 = v24;
  v26 = (void *)MEMORY[0x18D765024](v38);
  v36 = v13 + 1;
  v37 = v13;
  do
    v27 = __ldxr(p_shared_owners);
  while (__stxr(v27 + 1, p_shared_owners));
  objc_msgSend(v6, "decodeZilchMessage:pathHandler:errorHandler:", &v36, v25, v26);
  v28 = (GEOMapRequest *)objc_claimAutoreleasedReturnValue();
  edgeSearchRequest = self->_edgeSearchRequest;
  self->_edgeSearchRequest = v28;

  v30 = v37;
  if (v37)
  {
    v31 = (unint64_t *)&v37->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  v33 = v45;
  if (v45)
  {
    v34 = (unint64_t *)&v45->__shared_owners_;
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35 - 1, v34));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
LABEL_7:

}

void __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  id WeakRetained;
  void *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  GEOSnappedRouteEdge *v13;
  unint64_t v14;
  int *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  GEOSnappedRouteEdge *v22;
  unsigned int v23;
  GEOSnappedRouteEdge *v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  float v28;
  float v29;
  float *v30;
  float v31;
  float v32;
  float *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  id v43;
  double v44;
  GEOSnappedRouteEdge *v45;
  BOOL v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  id v52;
  double v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  _QWORD v63[4];
  _OWORD v64[3];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bounds");
    v6 = v62;
    v7 = *(_OWORD *)&v63[1];
  }
  else
  {
    v6 = 0uLL;
    memset(v63, 0, sizeof(v63));
    v62 = 0u;
    v7 = 0uLL;
  }
  v64[0] = v6;
  v64[1] = v7;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(a2[10] - a2[9]) >> 4);
  v9 = a2[9];
  v10 = a2[10];
  v57 = a1;
  v11 = *(_QWORD *)(a1 + 32);
  v61 = *(unsigned int *)(v11 + 60);
  v60 = **(_QWORD **)(v11 + 72);
  if (v10 == v9)
  {
    v13 = 0;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v14 = 1;
    v56 = v8;
    do
    {
      v15 = (int *)(v9 + v12);
      v16 = *v15;
      v17 = *((_QWORD *)v15 + 1);
      v18 = a2[3] + 72 * v17;
      v19 = a2[6] + 48 * v17;
      if (v16)
        v20 = v19;
      else
        v20 = v18;
      v21 = zilch::PathElement::type((zilch::PathElement *)v20);
      if (!v21 && zilch::GeoPolyline::size((zilch::GeoPolyline *)(v20 + 40)) > 1)
      {
        v22 = -[GEOSnappedRouteEdge initWithRoadPath:sectionRect:]([GEOSnappedRouteEdge alloc], "initWithRoadPath:sectionRect:", v20, v64);
        if (v13)
        {
          v23 = zilch::PathElement::controlPointIndex((zilch::PathElement *)v20);
          v24 = v13;
          v25 = *(_QWORD *)(v57 + 32);
          v59 = *(_DWORD *)(v25 + 60) + v23;
          v26 = *(_QWORD *)(v25 + 72);
          v27 = (float *)(v26 + 12 * v23);
          v28 = *v27;
          v29 = v27[1];
          v30 = (float *)(v26 + 12 * (v23 + 1));
          v31 = *v30;
          v32 = v30[1];
          v33 = -[GEOSnappedRouteEdge points](v22, "points");
          v34 = v31 - v28;
          v35 = v32 - v29;
          v36 = 0.0;
          v37 = (float)((float)(v34 * v34) + 0.0) + (float)(v35 * v35);
          if (v37 > 1.0e-15)
          {
            v38 = (float)((float)((float)((float)(*v33 - v28) * v34) + 0.0) + (float)((float)(v33[1] - v29) * v35))
                / v37;
            if (v38 < 0.0)
              v38 = 0.0;
            if (v38 <= 1.0)
              v36 = v38;
            else
              v36 = 1.0;
          }
          *((float *)&v59 + 1) = v36;
          *(float *)&v58 = v28 + (float)(v34 * v36);
          *((float *)&v58 + 1) = v29 + (float)(v35 * v36);
          v39 = v61;
          v40 = v59;
          objc_msgSend(*(id *)(v57 + 32), "_calculateEdgeLengthFrom:to:startCoord:endCoord:", &v60, &v58, &v61, &v59, v56);
          v42 = v41;
          v43 = objc_loadWeakRetained((id *)(*(_QWORD *)(v57 + 32) + 8));
          LODWORD(v44) = v42;
          -[GEOSnappedRouteEdge calculateRouteOffsetsBetweenA:andB:overLength:onRoute:](v24, "calculateRouteOffsetsBetweenA:andB:overLength:onRoute:", v39, v40, v43, v44);

          v61 = v59;
          v60 = v58;
          v8 = v56;
          v13 = v24;
        }
        v45 = v22;

        objc_msgSend(v8, "addObject:", v45);
        v13 = v45;
      }
      v9 = a2[9];
      if (v21)
        v46 = 1;
      else
        v46 = v14 >= (a2[10] - v9) >> 4;
      ++v14;
      v12 += 16;
    }
    while (!v46);
    v11 = *(_QWORD *)(v57 + 32);
    if (v21)
      v47 = 1;
    else
      v47 = v13 == 0;
    if (!v47)
    {
      v48 = v61;
      v49 = *(unsigned int *)(v11 + 64);
      v59 = *(_QWORD *)(*(_QWORD *)(v11 + 72) + 12 * (*(_DWORD *)(v11 + 68) - 1));
      v58 = v49;
      objc_msgSend((id)v11, "_calculateEdgeLengthFrom:to:startCoord:endCoord:", &v60, &v59, &v61, &v58);
      v51 = v50;
      v52 = objc_loadWeakRetained((id *)(*(_QWORD *)(v57 + 32) + 8));
      LODWORD(v53) = v51;
      -[GEOSnappedRouteEdge calculateRouteOffsetsBetweenA:andB:overLength:onRoute:](v13, "calculateRouteOffsetsBetweenA:andB:overLength:onRoute:", v48, v49, v52, v53);

      objc_storeStrong((id *)(*(_QWORD *)(v57 + 32) + 24), v8);
      v11 = *(_QWORD *)(v57 + 32);
    }
  }
  *(_BYTE *)(v11 + 56) = 1;
  v54 = *(_QWORD *)(v57 + 32);
  v55 = *(void **)(v54 + 32);
  *(_QWORD *)(v54 + 32) = 0;

  (*(void (**)(void))(*(_QWORD *)(v57 + 40) + 16))();
}

void __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOSnappedRoutePath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(_DWORD *)(v5 + 60);
    v6 = *(_DWORD *)(v5 + 64);
    v10[0] = 67109632;
    v10[1] = v7;
    v11 = 1024;
    v12 = v6;
    v13 = 2048;
    v14 = objc_msgSend(v3, "code");
    _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "Snapping failed (%u - %u): %ld!", (uint8_t *)v10, 0x18u);
  }

  if (objc_msgSend(v3, "code") != 1)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (const)mapMatchingSection
{
  return self->_mapMatchingSection.__ptr_.__value_;
}

- (BOOL)unregisterObserver:(id)a3
{
  id v4;

  v4 = a3;
  CFSetRemoveValue(self->_observers, v4);
  LOBYTE(self) = CFSetGetCount(self->_observers) > 0;

  return (char)self;
}

- (void)registerObserver:(id)a3
{
  CFSetAddValue(self->_observers, a3);
}

- (BOOL)hasObserver:(id)a3
{
  return CFSetGetCountOfValue(self->_observers, a3) > 0;
}

- (NSArray)edges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (GEOComposedRouteSection)section
{
  return (GEOComposedRouteSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (unsigned)routeStartIndex
{
  return self->_routeStartIndex;
}

- (unsigned)routeEndIndex
{
  return self->_routeEndIndex;
}

- (void).cxx_destruct
{
  RouteMapMatchingSection *value;

  value = self->_mapMatchingSection.__ptr_.__value_;
  self->_mapMatchingSection.__ptr_.__value_ = 0;
  if (value)
    (*((void (**)(RouteMapMatchingSection *, SEL))value->var0 + 1))(value, a2);
  objc_storeStrong((id *)&self->_edgeSearchRequest, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_destroyWeak((id *)&self->_route);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
