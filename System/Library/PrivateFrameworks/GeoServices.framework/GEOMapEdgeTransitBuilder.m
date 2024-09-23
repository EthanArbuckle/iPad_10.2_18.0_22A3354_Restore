@implementation GEOMapEdgeTransitBuilder

- (GEOMapEdgeTransitBuilder)initWithMap:(id)a3 firstPiece:(const TransitEdgePiece *)a4
{
  id v6;
  GEOMapEdgeTransitBuilder *v7;
  GEOMapEdgeTransitBuilder *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  _QWORD *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  void *v30;
  id v31;
  objc_super v32;
  __int128 v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)GEOMapEdgeTransitBuilder;
  v7 = -[GEOMapEdgeBuilder initWithMap:](&v32, sel_initWithMap_, v6);
  v8 = v7;
  if (v7)
  {
    std::deque<geo::TransitEdgePiece>::push_back(&v7->super._buildDirection, (uint64_t)a4);
    v31 = a4->var0;
    objc_msgSend(v31, "containingTile");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v30, "tileKey");
    v10 = *(_QWORD *)v9;
    v11 = *(_QWORD *)v9 << 32;
    v12 = BYTE4(*(_QWORD *)v9) | ((((*(_QWORD *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v9 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v34 + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v9 >> 8) & 0x3F) << 40);
    LOBYTE(v34[0]) = v10;
    *((_QWORD *)&v13 + 1) = v12;
    *(_QWORD *)&v13 = v11;
    *(_QWORD *)&v33 = v34[0];
    *((_QWORD *)&v33 + 1) = v13 >> 56;
    std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey>((uint64_t)&v8->super._edgeHandler, &v33, &v33);
    v14 = geo::codec::transitLinkGetFromNodeID(objc_msgSend(a4->var0, "get"), a4->var1);
    v15 = v30;
    v16 = -1;
    v17 = 40;
    do
    {
      v18 = objc_msgSend(v15, "transitNodeCount");
      if (++v16 >= v18)
        break;
      v19 = *(_QWORD **)(objc_msgSend(v15, "transitNodes") + v17);
      v17 += 344;
    }
    while (v19 != v14);

    v20 = geo::codec::transitLinkGetToNodeID(objc_msgSend(a4->var0, "get"), a4->var1);
    v21 = v15;
    v22 = -1;
    v23 = 40;
    do
    {
      v24 = objc_msgSend(v21, "transitNodeCount");
      if (++v22 >= v24)
        break;
      v25 = *(_QWORD **)(objc_msgSend(v21, "transitNodes") + v23);
      v23 += 344;
    }
    while (v25 != v20);
    v26 = v22 >= v24;

    if (a4->var4)
      v27 = v26;
    else
      v27 = v16 >= v18;
    *(&v8->super.super._isFinished + 1) = v27;
    if (a4->var4)
      v28 = v16 >= v18;
    else
      v28 = v26;
    *(&v8->super.super._isFinished + 2) = v28;

  }
  return v8;
}

- (unint64_t)_maxTileCount
{
  return 10;
}

- (void)_buildCompleteEdge
{
  GEOMapTileFinder *currentTileFinder;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;

  std::allocate_shared[abi:ne180100]<geo::MapEdgeTransit,std::allocator<geo::MapEdgeTransit>,std::deque<geo::TransitEdgePiece> &,void>(&self->super._buildDirection, &v14);
  v16 = v14;
  v17 = v15;
  currentTileFinder = self->super._currentTileFinder;
  if (currentTileFinder)
  {
    v12 = v14;
    v13 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    ((void (*)(GEOMapTileFinder *, uint64_t *))currentTileFinder->super._completionHandler)(currentTileFinder, &v12);
    v6 = v13;
    if (v13)
    {
      v7 = (unint64_t *)&v13->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  -[GEOMapRequest complete](self, "complete");
  v9 = v17;
  if (v17)
  {
    v10 = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  id v4;
  unint64_t *p_buildDirection;
  TransitEdgePiece **value;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  void *v41;
  uint64_t v42;
  unint64_t i;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  int v53;
  id v54;
  id v55;
  int v56;
  id v57;
  id v58;
  int64x2_t *v60;
  id *v61;
  float *v62;
  id v63;
  unint64_t v64;
  id v65;
  int v66;
  char v67;
  double v68[2];
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62 = (float *)self;
  p_buildDirection = &self->super._buildDirection;
  value = self->_pieces.__map_.__end_cap_.__value_;
  v7 = *(uint64_t *)((char *)self->_pieces.__map_.__first_ + (((unint64_t)value >> 4) & 0xFFFFFFFFFFFFFF8));
  v8 = value & 0x7F;
  v74 = 0;
  v75 = 0;
  objc_msgSend(*(id *)(v7 + 32 * v8), "containingTile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tileKey");
  v11 = *(_QWORD *)v10;
  v12 = *(_QWORD *)v10 << 32;
  v13 = BYTE4(*(_QWORD *)v10) | ((((*(_QWORD *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v69 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v11;
  *((_QWORD *)&v14 + 1) = v13;
  *(_QWORD *)&v14 = v12;
  v74 = v69;
  v75 = v14 >> 56;

  v15 = GEOMapRectForGEOTileKey((uint64_t)&v74);
  v19 = v17 + (float)(1.0 - v62[10]) * v18;
  v68[0] = v15 + v62[9] * v16;
  v68[1] = v19;
  v72 = 0;
  v73 = 0;
  v20 = objc_msgSend(v4, "tileKey");
  v60 = (int64x2_t *)p_buildDirection;
  v21 = *(_QWORD *)v20;
  v22 = *(_QWORD *)v20 << 32;
  v23 = BYTE4(*(_QWORD *)v20) | ((((*(_QWORD *)v20 >> 40) | (*(unsigned __int16 *)(v20 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v20 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v20 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v20 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v69 + 1) = v22 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v20 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v21;
  *((_QWORD *)&v14 + 1) = v23;
  *(_QWORD *)&v14 = v22;
  v72 = v69;
  v73 = v14 >> 56;
  v24 = 0;
  *(_QWORD *)&v69 = GEOMapRectForGEOTileKey((uint64_t)&v72);
  *((_QWORD *)&v69 + 1) = v25;
  v70 = v26;
  v71 = v27;
  v61 = (id *)(v7 + 32 * v8 + 16);
  while (1)
  {
    v28 = objc_msgSend(v4, "transitLinkCount");
    if (v24 >= v28)
      break;
    objc_msgSend(v4, "transitLinks");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v30;
    v32 = v31;
    if (v31)
    {
      v33 = v31;
      if (objc_msgSend(v31, "sectionCount"))
      {
        objc_msgSend(v32, "containingTile");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "transitVertices");
        v36 = *(_QWORD *)(v35 + 32);
        v37 = *(_QWORD *)(v36 + 16 * objc_msgSend(v32, "sectionOffset"));
        v38 = *(_QWORD *)(v35 + 32);
        LODWORD(v35) = objc_msgSend(v32, "sectionOffset");
        v39 = (_QWORD *)(v38 + 16 * (v35 + objc_msgSend(v32, "sectionCount") - 1));
        LOBYTE(v35) = v37 < *v39 + v39[1] - 1;

        if ((v35 & 1) == 0)
          goto LABEL_20;
        v40 = v32;
        if (*v61)
        {
          objc_msgSend(*v61, "feature");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "featureID");

        }
        else
        {
          v42 = 0;
        }
        for (i = 0; ; ++i)
        {
          if (i >= *(_QWORD *)(objc_msgSend(v40, "transitIndexRange") + 8))
          {
            i = 0;
            v47 = 0;
            goto LABEL_16;
          }
          GEOVectorTransitLineAlongLink(v40, i);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "feature");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v42 == objc_msgSend(v45, "featureID");

          if (v46)
            break;

        }
        v47 = objc_retainAutorelease(v44);

LABEL_16:
        v33 = v47;
        if (v33)
        {
          v48 = v40;
          v63 = 0;
          v49 = GEOTransitLinkPoints(v48, 0, &v63);

          if (objc_msgSend(v62, "_pointConnects:rect:to:", v49, &v69, v68))
          {
            v53 = geo::codec::transitTravelTimeForLineAlongLink((_QWORD *)objc_msgSend(v48, "get"), i);
            v54 = v48;
            v55 = v33;
            v63 = v54;
            v64 = i;
            v65 = v55;
            v66 = v53;
            v67 = 1;
            std::deque<geo::TransitEdgePiece>::push_front(v60, (uint64_t)&v63);

LABEL_23:
            break;
          }
          v50 = v48;
          v63 = 0;
          v51 = GEOTransitLinkPoints(v50, objc_msgSend(v50, "sectionCount") - 1, &v63);
          v52 = v63;

          if (objc_msgSend(v62, "_pointConnects:rect:to:", v51 + 8 * (_QWORD)v52 - 8, &v69, v68))
          {
            v56 = geo::codec::transitTravelTimeForLineAlongLink((_QWORD *)objc_msgSend(v50, "get"), i);
            v57 = v50;
            v58 = v33;
            v63 = v57;
            v64 = i;
            v65 = v58;
            v66 = v56;
            v67 = 0;
            std::deque<geo::TransitEdgePiece>::push_front(v60, (uint64_t)&v63);

            goto LABEL_23;
          }
        }
      }
    }
    else
    {
      v33 = 0;
    }

LABEL_20:
    ++v24;
  }

  return v24 < v28;
}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  id v4;
  unint64_t *p_buildDirection;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  void *v41;
  uint64_t v42;
  unint64_t i;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  int v53;
  id v54;
  id v55;
  int v56;
  id v57;
  id v58;
  unint64_t *v60;
  id *v61;
  GEOMapEdgeTransitBuilder *v62;
  id v63;
  unint64_t v64;
  id v65;
  int v66;
  char v67;
  double v68[2];
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v62 = self;
  p_buildDirection = &self->super._buildDirection;
  v6 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  v7 = *(uint64_t *)((char *)self->_pieces.__map_.__first_ + ((v6 >> 4) & 0xFFFFFFFFFFFFFF8));
  v8 = v6 & 0x7F;
  v74 = 0;
  v75 = 0;
  objc_msgSend(*(id *)(v7 + 32 * v8), "containingTile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tileKey");
  v11 = *(_QWORD *)v10;
  v12 = *(_QWORD *)v10 << 32;
  v13 = BYTE4(*(_QWORD *)v10) | ((((*(_QWORD *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v69 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v11;
  *((_QWORD *)&v14 + 1) = v13;
  *(_QWORD *)&v14 = v12;
  v74 = v69;
  v75 = v14 >> 56;

  v15 = GEOMapRectForGEOTileKey((uint64_t)&v74);
  v19 = v17 + (float)(1.0 - v62->super._firstTilePoint._e[1]) * v18;
  v68[0] = v15 + v62->super._firstTilePoint._e[0] * v16;
  v68[1] = v19;
  v72 = 0;
  v73 = 0;
  v20 = objc_msgSend(v4, "tileKey");
  v60 = p_buildDirection;
  v21 = *(_QWORD *)v20;
  v22 = *(_QWORD *)v20 << 32;
  v23 = BYTE4(*(_QWORD *)v20) | ((((*(_QWORD *)v20 >> 40) | (*(unsigned __int16 *)(v20 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v20 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v20 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v20 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v69 + 1) = v22 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v20 >> 8) & 0x3F) << 40);
  LOBYTE(v69) = v21;
  *((_QWORD *)&v14 + 1) = v23;
  *(_QWORD *)&v14 = v22;
  v72 = v69;
  v73 = v14 >> 56;
  v24 = 0;
  *(_QWORD *)&v69 = GEOMapRectForGEOTileKey((uint64_t)&v72);
  *((_QWORD *)&v69 + 1) = v25;
  v70 = v26;
  v71 = v27;
  v61 = (id *)(v7 + 32 * v8 + 16);
  while (1)
  {
    v28 = objc_msgSend(v4, "transitLinkCount");
    if (v24 >= v28)
      break;
    objc_msgSend(v4, "transitLinks");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v30;
    v32 = v31;
    if (v31)
    {
      v33 = v31;
      if (objc_msgSend(v31, "sectionCount"))
      {
        objc_msgSend(v32, "containingTile");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "transitVertices");
        v36 = *(_QWORD *)(v35 + 32);
        v37 = *(_QWORD *)(v36 + 16 * objc_msgSend(v32, "sectionOffset"));
        v38 = *(_QWORD *)(v35 + 32);
        LODWORD(v35) = objc_msgSend(v32, "sectionOffset");
        v39 = (_QWORD *)(v38 + 16 * (v35 + objc_msgSend(v32, "sectionCount") - 1));
        LOBYTE(v35) = v37 < *v39 + v39[1] - 1;

        if ((v35 & 1) == 0)
          goto LABEL_20;
        v40 = v32;
        if (*v61)
        {
          objc_msgSend(*v61, "feature");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "featureID");

        }
        else
        {
          v42 = 0;
        }
        for (i = 0; ; ++i)
        {
          if (i >= *(_QWORD *)(objc_msgSend(v40, "transitIndexRange") + 8))
          {
            i = 0;
            v47 = 0;
            goto LABEL_16;
          }
          GEOVectorTransitLineAlongLink(v40, i);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "feature");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v42 == objc_msgSend(v45, "featureID");

          if (v46)
            break;

        }
        v47 = objc_retainAutorelease(v44);

LABEL_16:
        v33 = v47;
        if (v33)
        {
          v48 = v40;
          v63 = 0;
          v49 = GEOTransitLinkPoints(v48, 0, &v63);

          if (-[GEOMapEdgeBuilder _pointConnects:rect:to:](v62, "_pointConnects:rect:to:", v49, &v69, v68))
          {
            v53 = geo::codec::transitTravelTimeForLineAlongLink((_QWORD *)objc_msgSend(v48, "get"), i);
            v54 = v48;
            v55 = v33;
            v63 = v54;
            v64 = i;
            v65 = v55;
            v66 = v53;
            v67 = 0;
            std::deque<geo::TransitEdgePiece>::push_back(v60, (uint64_t)&v63);

LABEL_23:
            break;
          }
          v50 = v48;
          v63 = 0;
          v51 = GEOTransitLinkPoints(v50, objc_msgSend(v50, "sectionCount") - 1, &v63);
          v52 = v63;

          if (-[GEOMapEdgeBuilder _pointConnects:rect:to:](v62, "_pointConnects:rect:to:", v51 + 8 * (_QWORD)v52 - 8, &v69, v68))
          {
            v56 = geo::codec::transitTravelTimeForLineAlongLink((_QWORD *)objc_msgSend(v50, "get"), i);
            v57 = v50;
            v58 = v33;
            v63 = v57;
            v64 = i;
            v65 = v58;
            v66 = v56;
            v67 = 1;
            std::deque<geo::TransitEdgePiece>::push_back(v60, (uint64_t)&v63);

            goto LABEL_23;
          }
        }
      }
    }
    else
    {
      v33 = 0;
    }

LABEL_20:
    ++v24;
  }

  return v24 < v28;
}

- (BOOL)_shouldFindEdgeAhead
{
  TransitEdgePiece *v2;
  _BOOL4 var4;
  uint64_t v4;
  uint64_t var1;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v2 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_
                              + (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F];
  var4 = v2->var4;
  v4 = objc_msgSend(v2->var0, "get");
  var1 = v2->var1;
  if (var4)
    v6 = geo::codec::transitLinkGetToNodeID(v4, var1);
  else
    v6 = geo::codec::transitLinkGetFromNodeID(v4, var1);
  v7 = v6;
  objc_msgSend(v2->var0, "containingTile");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -1;
  v10 = 40;
  do
  {
    v11 = objc_msgSend(v8, "transitNodeCount");
    if (++v9 >= v11)
      break;
    v12 = *(_QWORD **)(objc_msgSend(v8, "transitNodes") + v10);
    v10 += 344;
  }
  while (v12 != v7);

  return v9 >= v11;
}

- (BOOL)_shouldFindEdgeBehind
{
  unint64_t v2;
  TransitEdgePiece *v3;
  _BOOL4 var4;
  uint64_t v5;
  uint64_t var1;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  v3 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F];
  var4 = v3->var4;
  v5 = objc_msgSend(v3->var0, "get");
  var1 = v3->var1;
  if (var4)
    v7 = geo::codec::transitLinkGetFromNodeID(v5, var1);
  else
    v7 = geo::codec::transitLinkGetToNodeID(v5, var1);
  v8 = v7;
  objc_msgSend(v3->var0, "containingTile");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -1;
  v11 = 40;
  do
  {
    v12 = objc_msgSend(v9, "transitNodeCount");
    if (++v10 >= v12)
      break;
    v13 = *(_QWORD **)(objc_msgSend(v9, "transitNodes") + v11);
    v11 += 344;
  }
  while (v13 != v8);

  return v10 >= v12;
}

- (Matrix<float,)_firstPoint
{
  TransitEdgePiece *v2;
  id var0;
  id v4;
  uint64_t v5;
  float *v6;
  float v7;
  float v8;
  uint64_t v9;
  Matrix<float, 2, 1> result;

  v2 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_
                              + (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F];
  var0 = v2->var0;
  if (v2->var4)
  {
    v4 = var0;
    v9 = 0;
    v5 = GEOTransitLinkPoints(v4, objc_msgSend(v4, "sectionCount") - 1, &v9);
    v6 = (float *)(v5 + 8 * v9 - 8);

  }
  else
  {
    v9 = 0;
    v6 = (float *)GEOTransitLinkPoints(var0, 0, &v9);
  }
  v7 = *v6;
  v8 = v6[1];
  result._e[1] = v8;
  result._e[0] = v7;
  return result;
}

- (Matrix<float,)_lastPoint
{
  unint64_t v2;
  TransitEdgePiece *v3;
  id var0;
  float *v5;
  id v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t v10;
  Matrix<float, 2, 1> result;

  v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  v3 = &(*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F];
  var0 = v3->var0;
  if (v3->var4)
  {
    v10 = 0;
    v5 = (float *)GEOTransitLinkPoints(var0, 0, &v10);
  }
  else
  {
    v6 = var0;
    v10 = 0;
    v7 = GEOTransitLinkPoints(v6, objc_msgSend(v6, "sectionCount") - 1, &v10);
    v5 = (float *)(v7 + 8 * v10 - 8);

  }
  v8 = *v5;
  v9 = v5[1];
  result._e[1] = v9;
  result._e[0] = v8;
  return result;
}

- (id)_firstTile
{
  return (id)objc_msgSend((*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_+ (((unint64_t)self->_pieces.__map_.__end_cap_.__value_ >> 4) & 0xFFFFFFFFFFFFFF8)))[(uint64_t)self->_pieces.__map_.__end_cap_.__value_ & 0x7F].var0, "containingTile");
}

- (id)_lastTile
{
  unint64_t v2;

  v2 = (unint64_t)self->_pieces.__map_.__end_cap_.__value_ + self->_pieces.__start_ - 1;
  return (id)objc_msgSend((*(TransitEdgePiece **)((char *)self->_pieces.__map_.__first_ + ((v2 >> 4) & 0xFFFFFFFFFFFFFF8)))[v2 & 0x7F].var0, "containingTile");
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", a3, a4.var0, a4.var1, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  std::deque<geo::TransitEdgePiece>::~deque[abi:ne180100](&self->super._buildDirection);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  return self;
}

@end
