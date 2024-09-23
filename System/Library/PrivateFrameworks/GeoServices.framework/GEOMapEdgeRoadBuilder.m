@implementation GEOMapEdgeRoadBuilder

- (GEOMapEdgeRoadBuilder)initWithMap:(id)a3 roadFeature:(id)a4 shouldFlip:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  _BYTE *v22;
  _QWORD v24[4];
  id v25;
  BOOL v26;
  objc_super v27;
  __int128 v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapEdgeRoadBuilder;
  v10 = -[GEOMapEdgeBuilder initWithMap:](&v27, sel_initWithMap_, v8);
  if (v10)
  {
    objc_msgSend(v9, "feature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containingTile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    GEOVectorTileRetain(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v10 + 22);
    *((_QWORD *)v10 + 22) = v13;

    v15 = (void *)*((_QWORD *)v10 + 22);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60__GEOMapEdgeRoadBuilder_initWithMap_roadFeature_shouldFlip___block_invoke;
    v24[3] = &unk_1E1C20440;
    v26 = a5;
    v16 = v10;
    v25 = v16;
    objc_msgSend(v15, "forEachEdgeInRoad:visitTwice:visitor:", v9, 0, v24);
    v16[33] = objc_msgSend(v16, "_shouldFindEdgeAhead");
    v16[34] = objc_msgSend(v16, "_shouldFindEdgeBehind");
    v17 = objc_msgSend(*((id *)v10 + 22), "tileKey");
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)v17 << 32;
    v20 = BYTE4(*(_QWORD *)v17) | ((((*(_QWORD *)v17 >> 40) | (*(unsigned __int16 *)(v17 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v17 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v17 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v17 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v29 + 1) = v19 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v17 >> 8) & 0x3F) << 40);
    LOBYTE(v29[0]) = v18;
    *((_QWORD *)&v21 + 1) = v20;
    *(_QWORD *)&v21 = v19;
    *(_QWORD *)&v28 = v29[0];
    *((_QWORD *)&v28 + 1) = v21 >> 56;
    std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)(v16 + 72), &v28, &v28);
    v22 = v16;

  }
  return (GEOMapEdgeRoadBuilder *)v10;
}

void __60__GEOMapEdgeRoadBuilder_initWithMap_roadFeature_shouldFlip___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = (void *)objc_msgSend(v3, "copy", v3);
    GEORoadEdgeFlip(v4);
    v5 = *(_QWORD *)(a1 + 32) + 128;
    v6 = *(_QWORD *)(v5 + 32);
    if (!v6)
    {
      std::deque<GEORoadEdge * {__strong}>::__add_front_capacity((char **)v5);
      v6 = *(_QWORD *)(v5 + 32);
    }
    v7 = *(_QWORD *)(v5 + 8);
    v8 = (_QWORD *)(v7 + 8 * (v6 >> 9));
    v9 = *v8 + 8 * (v6 & 0x1FF);
    if (*(_QWORD *)(v5 + 16) == v7)
      v10 = 0;
    else
      v10 = v9;
    if (v10 == *v8)
      v10 = *(v8 - 1) + 4096;
    v11 = v4;
    *(_QWORD *)(v10 - 8) = v11;
    *(int64x2_t *)(v5 + 32) = vaddq_s64(*(int64x2_t *)(v5 + 32), (int64x2_t)xmmword_189CC15E0);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v14 = (id)objc_msgSend(v3, "copy", v3);
    std::deque<GEORoadEdge * {__strong}>::push_back((_QWORD *)(v12 + 128), (uint64_t *)&v14);
    v11 = v14;
  }

}

- (void)dealloc
{
  objc_super v3;

  GEOVectorTileRelease((void *)self->_edges.__size_.__value_);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapEdgeRoadBuilder;
  -[GEOMapRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)_maxTileCount
{
  return 4;
}

- (void)_buildCompleteEdge
{
  id **value;
  __begin_ ***first;
  char *v5;
  void **v6;
  unint64_t v7;
  __begin_ ***v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void **v15;
  GEOMapTileFinder *currentTileFinder;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  GEOMapTileFinder *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void **v26;
  std::__shared_weak_count *v27;
  void **v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  std::__shared_weak_count *v34;

  value = self->_edges.__map_.var2.__value_;
  first = self->_edges.__map_.__first_;
  v5 = (char *)&first[(unint64_t)value >> 9];
  if (self->_edges.__map_.var0 == first)
  {
    v6 = 0;
    v9 = 0;
    v8 = &first[((unint64_t)value + self->_edges.__start_) >> 9];
  }
  else
  {
    v6 = (void **)(*(_QWORD *)v5 + 8 * ((uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF));
    v7 = (unint64_t)value + self->_edges.__start_;
    v8 = &first[v7 >> 9];
    v9 = (uint64_t)&(*v8)[v7 & 0x1FF];
  }
  v30 = 0;
  v31 = 0;
  v32 = 0;
  if ((void **)v9 != v6)
  {
    v10 = ((v9 - (uint64_t)*v8) >> 3) + (((char *)v8 - v5) << 6);
    v11 = (uint64_t)v6 - *(_QWORD *)v5;
    v33 = (void **)&v30;
    LOBYTE(v34) = 0;
    if (v10 != v11 >> 3)
    {
      std::vector<unsigned long long>::__vallocate[abi:ne180100](&v30, v10 - (v11 >> 3));
      v12 = 0;
      v13 = v31;
      do
      {
        v14 = *v6++;
        *(_QWORD *)(v13 + v12) = v14;
        if ((void **)((char *)v6 - *(_QWORD *)v5) == (void **)4096)
        {
          v15 = (void **)*((_QWORD *)v5 + 1);
          v5 += 8;
          v6 = v15;
        }
        v12 += 8;
      }
      while (v6 != (void **)v9);
      v31 = v13 + v12;
    }
  }
  std::allocate_shared[abi:ne180100]<geo::MapEdgeRoad,std::allocator<geo::MapEdgeRoad>,std::vector<GEORoadEdge * {__strong}> &,void>(&v30, &v28);
  v33 = v28;
  v34 = v29;
  currentTileFinder = self->super._currentTileFinder;
  if (currentTileFinder)
  {
    v26 = v28;
    v27 = v29;
    if (v29)
    {
      p_shared_owners = (unint64_t *)&v29->__shared_owners_;
      do
        v18 = __ldxr(p_shared_owners);
      while (__stxr(v18 + 1, p_shared_owners));
    }
    ((void (*)(GEOMapTileFinder *, void ***))currentTileFinder->super._completionHandler)(currentTileFinder, &v26);
    v19 = v27;
    if (v27)
    {
      v20 = (unint64_t *)&v27->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = self->super._currentTileFinder;
    self->super._currentTileFinder = 0;

  }
  -[GEOMapRequest complete](self, "complete", v26);
  v23 = v34;
  if (v34)
  {
    v24 = (unint64_t *)&v34->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v33 = (void **)&v30;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v33);
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  id v4;
  __begin_ *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __begin_ *v32;
  id v33;
  _QWORD v35[4];
  __begin_ *v36;
  id v37;
  GEOMapEdgeRoadBuilder *v38;
  __int128 *v39;
  int v40;
  int v41;
  __int128 v42;
  uint64_t v43;
  char v44;
  _QWORD v45[2];
  _QWORD v46[3];

  v46[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_retain((*(__begin_ ***)((char *)self->_edges.__map_.__first_
                                  + (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF]);
  -[__begin_ road](v5, "road");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containingTile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tileKey");
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)v9 << 32;
  v12 = BYTE4(*(_QWORD *)v9) | ((((*(_QWORD *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v42 + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v9 >> 8) & 0x3F) << 40);
  LOBYTE(v42) = v10;
  *((_QWORD *)&v13 + 1) = v12;
  *(_QWORD *)&v13 = v11;
  v46[0] = v42;
  v46[1] = v13 >> 56;

  v14 = GEOMapRectForGEOTileKey((uint64_t)v46);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = *((float *)&self->super.super._isFinished + 1);
  v21 = *(float *)&self->super._buildAhead;
  v23 = objc_msgSend(v4, "tileKey");
  v24 = *(_QWORD *)v23;
  v25 = *(_QWORD *)v23 << 32;
  v26 = BYTE4(*(_QWORD *)v23) | ((((*(_QWORD *)v23 >> 40) | (*(unsigned __int16 *)(v23 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v23 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v23 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v23 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v42 + 1) = v25 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v23 >> 8) & 0x3F) << 40);
  LOBYTE(v42) = v24;
  *((_QWORD *)&v13 + 1) = v26;
  *(_QWORD *)&v13 = v25;
  v45[0] = v42;
  v45[1] = v13 >> 56;
  v27 = GEOMapRectForGEOTileKey((uint64_t)v45);
  v28 = v16 + (float)(1.0 - v21) * v20;
  *(float *)&v16 = (v14 + v22 * v18 - v27) / v29;
  *(float *)&v20 = (v31 - (v28 - v30)) / v31;
  *(_QWORD *)&v42 = 0;
  *((_QWORD *)&v42 + 1) = &v42;
  v43 = 0x2020000000;
  v44 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke;
  v35[3] = &unk_1E1C204B8;
  v39 = &v42;
  v32 = v5;
  v36 = v32;
  v33 = v4;
  v37 = v33;
  v38 = self;
  v40 = LODWORD(v16);
  v41 = LODWORD(v20);
  objc_msgSend(v33, "forEachRoad:", v35);
  LOBYTE(v4) = *(_BYTE *)(*((_QWORD *)&v42 + 1) + 24) != 0;

  _Block_object_dispose(&v42, 8);
  return (char)v4;
}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  geo::codec *v5;
  void *v6;
  const GeoCodecsRoadFeature *v7;
  const GeoCodecsRoadFeature *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];
  _QWORD v17[4];
  __int128 v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[3];
  char v23;
  uint64_t v24;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5 = (geo::codec *)objc_msgSend(v3, "getRoad");
    objc_msgSend(*(id *)(a1 + 32), "road");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const GeoCodecsRoadFeature *)objc_msgSend(v6, "getRoad");
    LODWORD(v5) = geo::codec::multiSectionFeatureIsSameRoad(v5, v7, v8);

    if ((_DWORD)v5)
    {
      v9 = geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v4, "get"), 0, &v24);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v23 = 0;
      v10 = *(void **)(a1 + 40);
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_2;
      v17[3] = &unk_1E1C20468;
      v18 = *(_OWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 64);
      v20 = v9;
      v21 = v12;
      v19 = v22;
      objc_msgSend(v10, "forEachEdgeInRoad:visitTwice:visitor:", v4, 0, v17);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(_QWORD *)(v14 + 168);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_3;
        v16[3] = &unk_1E1C20490;
        v16[4] = v14;
        v16[5] = v22;
        v16[6] = v15;
        objc_msgSend(v13, "forEachEdgeInRoad:visitTwice:visitor:", v4, 0, v16);
      }
      _Block_object_dispose(v22, 8);
    }
  }

}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 64);
    LODWORD(v5) = *(_DWORD *)(a1 + 68);
    v7 = v3;
    v6 = objc_msgSend(*(id *)(a1 + 32), "_connectionTypeForEdge:points:connectingTilePoint:", v3, *(_QWORD *)(a1 + 56), v4, v5);
    v3 = v7;
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 == 1;
    }
  }

}

void __46__GEOMapEdgeRoadBuilder__findEdgeAheadInTile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int64x2_t *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  v19 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = v3;
    GEORoadEdgeFlip(v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(v4, "copy");
    v7 = v5 + 128;
    v8 = *(_QWORD *)(v7 + 32);
    if (!v8)
    {
      std::deque<GEORoadEdge * {__strong}>::__add_front_capacity((char **)v7);
      v8 = *(_QWORD *)(v7 + 32);
    }
    v9 = *(_QWORD *)(v7 + 8);
    v10 = (_QWORD *)(v9 + 8 * (v8 >> 9));
    v11 = *v10 + 8 * (v8 & 0x1FF);
    if (*(_QWORD *)(v7 + 16) == v9)
      v11 = 0;
    if (v11 == *v10)
      v11 = *(v10 - 1) + 4096;
    *(_QWORD *)(v11 - 8) = v6;
    *(int64x2_t *)(v7 + 32) = vaddq_s64(*(int64x2_t *)(v7 + 32), (int64x2_t)xmmword_189CC15E0);
  }
  else
  {
    v12 = (int64x2_t *)(*(_QWORD *)(a1 + 32) + 128);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v14 = (_QWORD *)(v13 + 8 * (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) >> 9));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) == v13)
      v15 = 0;
    else
      v15 = *v14 + 8 * (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) & 0x1FFLL);
    v16 = (char *)std::__deque_iterator<GEORoadEdge * {__strong},GEORoadEdge * {__strong}*,GEORoadEdge * {__strong}&,GEORoadEdge * {__strong}**,long,512l>::operator+[abi:ne180100](v14, v15, *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) - *(_DWORD *)(a1 + 48));
    v18 = v17;
    v20 = objc_msgSend(v19, "copy");
    std::deque<GEORoadEdge * {__strong}>::insert(v12, v16, v18, (void **)&v20);
    v4 = (id)v20;
  }

}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  id v4;
  unint64_t v5;
  __begin_ *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __begin_ *v33;
  id v34;
  _QWORD v36[4];
  __begin_ *v37;
  id v38;
  GEOMapEdgeRoadBuilder *v39;
  __int128 *v40;
  int v41;
  int v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  v6 = (*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v5 >> 6) & 0x3FFFFFFFFFFFFF8)))[v5 & 0x1FF];
  -[__begin_ road](v6, "road");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containingTile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tileKey");
  v11 = *(_QWORD *)v10;
  v12 = *(_QWORD *)v10 << 32;
  v13 = BYTE4(*(_QWORD *)v10) | ((((*(_QWORD *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v43 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v43) = v11;
  *((_QWORD *)&v14 + 1) = v13;
  *(_QWORD *)&v14 = v12;
  v47[0] = v43;
  v47[1] = v14 >> 56;

  v15 = GEOMapRectForGEOTileKey((uint64_t)v47);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = self->super._firstTilePoint._e[0];
  v22 = self->super._firstTilePoint._e[1];
  v24 = objc_msgSend(v4, "tileKey");
  v25 = *(_QWORD *)v24;
  v26 = *(_QWORD *)v24 << 32;
  v27 = BYTE4(*(_QWORD *)v24) | ((((*(_QWORD *)v24 >> 40) | (*(unsigned __int16 *)(v24 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v24 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v24 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v24 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v43 + 1) = v26 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v24 >> 8) & 0x3F) << 40);
  LOBYTE(v43) = v25;
  *((_QWORD *)&v14 + 1) = v27;
  *(_QWORD *)&v14 = v26;
  v46[0] = v43;
  v46[1] = v14 >> 56;
  v28 = GEOMapRectForGEOTileKey((uint64_t)v46);
  v29 = v17 + (float)(1.0 - v22) * v21;
  *(float *)&v17 = (v15 + v23 * v19 - v28) / v30;
  *(float *)&v21 = (v32 - (v29 - v31)) / v32;
  *(_QWORD *)&v43 = 0;
  *((_QWORD *)&v43 + 1) = &v43;
  v44 = 0x2020000000;
  v45 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke;
  v36[3] = &unk_1E1C204B8;
  v40 = &v43;
  v33 = v6;
  v37 = v33;
  v34 = v4;
  v38 = v34;
  v39 = self;
  v41 = LODWORD(v17);
  v42 = LODWORD(v21);
  objc_msgSend(v34, "forEachRoad:", v36);
  LOBYTE(v4) = *(_BYTE *)(*((_QWORD *)&v43 + 1) + 24) != 0;

  _Block_object_dispose(&v43, 8);
  return (char)v4;
}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  geo::codec *v5;
  void *v6;
  const GeoCodecsRoadFeature *v7;
  const GeoCodecsRoadFeature *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];
  _QWORD v17[4];
  __int128 v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v22[3];
  char v23;
  uint64_t v24;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5 = (geo::codec *)objc_msgSend(v3, "getRoad");
    objc_msgSend(*(id *)(a1 + 32), "road");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const GeoCodecsRoadFeature *)objc_msgSend(v6, "getRoad");
    LODWORD(v5) = geo::codec::multiSectionFeatureIsSameRoad(v5, v7, v8);

    if ((_DWORD)v5)
    {
      v9 = geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v4, "get"), 0, &v24);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x2020000000;
      v23 = 0;
      v10 = *(void **)(a1 + 40);
      v11 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_2;
      v17[3] = &unk_1E1C20468;
      v18 = *(_OWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 64);
      v20 = v9;
      v21 = v12;
      v19 = v22;
      objc_msgSend(v10, "forEachEdgeInRoad:visitTwice:visitor:", v4, 0, v17);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(_QWORD *)(v14 + 168);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_3;
        v16[3] = &unk_1E1C20490;
        v16[4] = v14;
        v16[5] = v22;
        v16[6] = v15;
        objc_msgSend(v13, "forEachEdgeInRoad:visitTwice:visitor:", v4, 0, v16);
      }
      _Block_object_dispose(v22, 8);
    }
  }

}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 64);
    LODWORD(v5) = *(_DWORD *)(a1 + 68);
    v7 = v3;
    v6 = objc_msgSend(*(id *)(a1 + 32), "_connectionTypeForEdge:points:connectingTilePoint:", v3, *(_QWORD *)(a1 + 56), v4, v5);
    v3 = v7;
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6 == 2;
    }
  }

}

void __47__GEOMapEdgeRoadBuilder__findEdgeBehindInTile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int64x2_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;

  v3 = a2;
  v15 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = v3;
    GEORoadEdgeFlip(v4);
    v5 = (int64x2_t *)(*(_QWORD *)(a1 + 32) + 128);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) + v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v9 = (_QWORD *)(v8 + 8 * (v7 >> 9));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) == v8)
      v10 = 0;
    else
      v10 = *v9 + 8 * (v7 & 0x1FF);
    v12 = (char *)std::__deque_iterator<GEORoadEdge * {__strong},GEORoadEdge * {__strong}*,GEORoadEdge * {__strong}&,GEORoadEdge * {__strong}**,long,512l>::operator-[abi:ne180100](v9, v10, (int)v6 - *(_DWORD *)(a1 + 48));
    v14 = v13;
    v16 = (void *)objc_msgSend(v4, "copy");
    std::deque<GEORoadEdge * {__strong}>::insert(v5, v12, v14, &v16);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v17 = (void *)objc_msgSend(v3, "copy");
    std::deque<GEORoadEdge * {__strong}>::push_back((_QWORD *)(v11 + 128), (uint64_t *)&v17);
    v4 = v17;
  }

}

- (BOOL)_shouldFindEdgeAhead
{
  return -[__begin_ junctionA]((*(__begin_ ***)((char *)self->_edges.__map_.__first_+ (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF], "junctionA") == 0;
}

- (BOOL)_shouldFindEdgeBehind
{
  unint64_t v2;

  v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  return -[__begin_ junctionB]((*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF], "junctionB") == 0;
}

- (unint64_t)_connectionTypeForEdge:(id)a3 points:(GeoCodecsVectorTilePoint *)a4 connectingTilePoint:()Matrix<float
{
  id v7;
  GeoCodecsVectorTilePoint *v8;
  GeoCodecsVectorTilePoint *v9;
  unint64_t v10;
  Matrix<float, 2, 1> v12;

  v12 = a5;
  v7 = a3;
  v8 = &a4[objc_msgSend(v7, "vertexIndexA")];
  v9 = &a4[objc_msgSend(v7, "vertexIndexB")];
  if (objc_msgSend(v7, "junctionA")
    || !-[GEOMapEdgeBuilder _edgeStart:end:connectsTo:](self, "_edgeStart:end:connectsTo:", v8, v9, &v12))
  {
    if (objc_msgSend(v7, "junctionB")
      || !-[GEOMapEdgeBuilder _edgeStart:end:connectsTo:](self, "_edgeStart:end:connectsTo:", v9, v8, &v12))
    {
      v10 = 0;
    }
    else
    {
      v10 = 2;
    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (Matrix<float,)_firstPoint
{
  __begin_ *v2;
  void *v3;
  _QWORD *v4;
  float *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  Matrix<float, 2, 1> result;

  v2 = objc_retain((*(__begin_ ***)((char *)self->_edges.__map_.__first_
                                  + (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF]);
  -[__begin_ road](v2, "road");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v3, "get"), 0, &v10);

  v5 = (float *)&v4[-[__begin_ vertexIndexA](v2, "vertexIndexA")];
  v6 = *v5;
  v7 = v5[1];

  v8 = v6;
  v9 = v7;
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (Matrix<float,)_lastPoint
{
  unint64_t v2;
  __begin_ *v3;
  void *v4;
  _QWORD *v5;
  float *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  Matrix<float, 2, 1> result;

  v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  v3 = (*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF];
  -[__begin_ road](v3, "road");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v4, "get"), 0, &v11);

  v6 = (float *)&v5[-[__begin_ vertexIndexB](v3, "vertexIndexB")];
  v7 = *v6;
  v8 = v6[1];

  v9 = v7;
  v10 = v8;
  result._e[1] = v10;
  result._e[0] = v9;
  return result;
}

- (id)_firstTile
{
  void *v2;
  void *v3;
  void *v4;

  -[__begin_ road]((*(__begin_ ***)((char *)self->_edges.__map_.__first_+ (((unint64_t)self->_edges.__map_.var2.__value_ >> 6) & 0x3FFFFFFFFFFFFF8)))[(uint64_t)self->_edges.__map_.var2.__value_ & 0x1FF], "road");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingTile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_lastTile
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (unint64_t)self->_edges.__map_.var2.__value_ + self->_edges.__start_ - 1;
  -[__begin_ road]((*(__begin_ ***)((char *)self->_edges.__map_.__first_ + ((v2 >> 6) & 0x3FFFFFFFFFFFFF8)))[v2 & 0x1FF], "road");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containingTile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", a3, a4.var0, a4.var1, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  unint64_t *p_buildDirection;
  void **v4;
  void **v5;
  _QWORD *v6;
  unint64_t v7;
  void **v8;
  void **v9;
  uint64_t v10;
  void *v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;

  objc_storeStrong((id *)&self->_edges.__size_, 0);
  p_buildDirection = &self->super._buildDirection;
  v4 = (void **)p_buildDirection[1];
  v5 = (void **)p_buildDirection[2];
  if (v5 == v4)
  {
    v6 = p_buildDirection + 5;
    v5 = (void **)p_buildDirection[1];
  }
  else
  {
    v6 = p_buildDirection + 5;
    v7 = p_buildDirection[4];
    v8 = &v4[v7 >> 9];
    v9 = (void **)((char *)*v8 + 8 * (v7 & 0x1FF));
    v10 = *(uint64_t *)((char *)v4 + (((p_buildDirection[5] + v7) >> 6) & 0x3FFFFFFFFFFFFF8))
        + 8 * ((p_buildDirection[5] + v7) & 0x1FF);
    if (v9 != (void **)v10)
    {
      do
      {
        v11 = *v9++;

        if ((char *)v9 - (_BYTE *)*v8 == 4096)
        {
          v12 = (void **)v8[1];
          ++v8;
          v9 = v12;
        }
      }
      while (v9 != (void **)v10);
      v4 = (void **)p_buildDirection[1];
      v5 = (void **)p_buildDirection[2];
    }
  }
  *v6 = 0;
  v13 = (char *)v5 - (char *)v4;
  if ((unint64_t)((char *)v5 - (char *)v4) >= 0x11)
  {
    do
    {
      operator delete(*v4);
      v5 = (void **)p_buildDirection[2];
      v4 = (void **)(p_buildDirection[1] + 8);
      p_buildDirection[1] = (unint64_t)v4;
      v13 = (char *)v5 - (char *)v4;
    }
    while ((unint64_t)((char *)v5 - (char *)v4) > 0x10);
  }
  v14 = v13 >> 3;
  if (v14 == 1)
  {
    v15 = 256;
    goto LABEL_14;
  }
  if (v14 == 2)
  {
    v15 = 512;
LABEL_14:
    p_buildDirection[4] = v15;
  }
  if (v4 != v5)
  {
    do
    {
      v16 = *v4++;
      operator delete(v16);
    }
    while (v4 != v5);
    v18 = p_buildDirection[1];
    v17 = p_buildDirection[2];
    if (v17 != v18)
      p_buildDirection[2] = v17 + ((v18 - v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*p_buildDirection)
    operator delete((void *)*p_buildDirection);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

@end
