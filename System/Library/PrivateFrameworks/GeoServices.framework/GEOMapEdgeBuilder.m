@implementation GEOMapEdgeBuilder

- (GEOMapEdgeBuilder)initWithMap:(id)a3
{
  GEOMapEdgeBuilder *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOMapEdgeBuilder;
  result = -[GEOMapRequest initWithManager:](&v4, sel_initWithManager_, a3);
  if (result)
    *(_QWORD *)&result->_searchDirection = 0;
  return result;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->_lastTilePoint + 4), "cancel");
  v3 = *(void **)((char *)&self->_lastTilePoint + 4);
  *(Matrix<float, 2, 1> *)((char *)&self->_lastTilePoint + 4) = 0;

  -[GEOMapEdgeBuilder setEdgeHandler:](self, "setEdgeHandler:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GEOMapEdgeBuilder;
  -[GEOMapRequest cancel](&v4, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (BOOL)_findEdgeAhead
{
  float v3;
  float v4;
  BOOL result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!*(&self->super._isFinished + 1))
    return 0;
  if (-[GEOMapEdgeBuilder _shouldFindEdgeAhead](self, "_shouldFindEdgeAhead")
    && ((-[GEOMapEdgeBuilder _firstPoint](self, "_firstPoint"), v3 < 0.001) || v3 > 0.999 || v4 < 0.001 || v4 > 0.999))
  {
    *((float *)&self->super._isFinished + 1) = v3;
    *(float *)&self->_buildAhead = v4;
    -[GEOMapEdgeBuilder _firstTile](self, "_firstTile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "tileKey");
    v8 = *(_QWORD *)v7;
    v9 = *(_QWORD *)v7 << 32;
    v10 = BYTE4(*(_QWORD *)v7) | ((((*(_QWORD *)v7 >> 40) | (*(unsigned __int16 *)(v7 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v7 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v7 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v7 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v13 + 1) = v9 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v7 >> 8) & 0x3F) << 40);
    LOBYTE(v13[0]) = v8;
    *((_QWORD *)&v11 + 1) = v10;
    *(_QWORD *)&v11 = v9;
    v12[0] = v13[0];
    v12[1] = v11 >> 56;
    -[GEOMapEdgeBuilder _findTilesAdjacentToTile:containingPoint:findAhead:](self, "_findTilesAdjacentToTile:containingPoint:findAhead:", v12, &self->super._isFinished + 4, 1);

    return 1;
  }
  else
  {
    result = 0;
    *(&self->super._isFinished + 1) = 0;
  }
  return result;
}

- (BOOL)_findEdgeBehind
{
  float v3;
  float v4;
  BOOL result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!*(&self->super._isFinished + 2))
    return 0;
  if (-[GEOMapEdgeBuilder _shouldFindEdgeBehind](self, "_shouldFindEdgeBehind")
    && ((-[GEOMapEdgeBuilder _lastPoint](self, "_lastPoint"), v3 < 0.001) || v3 > 0.999 || v4 < 0.001 || v4 > 0.999))
  {
    self->_firstTilePoint._e[0] = v3;
    self->_firstTilePoint._e[1] = v4;
    -[GEOMapEdgeBuilder _lastTile](self, "_lastTile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "tileKey");
    v8 = *(_QWORD *)v7;
    v9 = *(_QWORD *)v7 << 32;
    v10 = BYTE4(*(_QWORD *)v7) | ((((*(_QWORD *)v7 >> 40) | (*(unsigned __int16 *)(v7 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v7 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v7 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v7 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v13 + 1) = v9 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v7 >> 8) & 0x3F) << 40);
    LOBYTE(v13[0]) = v8;
    *((_QWORD *)&v11 + 1) = v10;
    *(_QWORD *)&v11 = v9;
    v12[0] = v13[0];
    v12[1] = v11 >> 56;
    -[GEOMapEdgeBuilder _findTilesAdjacentToTile:containingPoint:findAhead:](self, "_findTilesAdjacentToTile:containingPoint:findAhead:", v12, &self->_firstTilePoint, 0);

    return 1;
  }
  else
  {
    result = 0;
    *(&self->super._isFinished + 2) = 0;
  }
  return result;
}

- (BOOL)_findNextEdge
{
  void *next;
  uint64_t v4;

  if (-[GEOMapRequest isFinished](self, "isFinished"))
    return 0;
  next = self->_tileKeysSeen.__table_.__p1_.__value_.__next_;
  if ((unint64_t)next < -[GEOMapEdgeBuilder _maxTileCount](self, "_maxTileCount"))
  {
    v4 = *(_QWORD *)&self->_searchDirection;
    switch(v4)
    {
      case 2:
LABEL_13:
        if (-[GEOMapEdgeBuilder _findEdgeAhead](self, "_findEdgeAhead"))
          return 1;
        break;
      case 1:
LABEL_11:
        if (-[GEOMapEdgeBuilder _findEdgeBehind](self, "_findEdgeBehind"))
          return 1;
        break;
      case 0:
        if (LOBYTE(self->_tileKeysSeen.__table_.__p3_.__value_))
        {
          if (-[GEOMapEdgeBuilder _findEdgeAhead](self, "_findEdgeAhead"))
            return 1;
        }
        else if (-[GEOMapEdgeBuilder _findEdgeBehind](self, "_findEdgeBehind"))
        {
          return 1;
        }
        if (LOBYTE(self->_tileKeysSeen.__table_.__p3_.__value_))
          goto LABEL_11;
        goto LABEL_13;
    }
  }
  -[GEOMapEdgeBuilder _buildCompleteEdge](self, "_buildCompleteEdge");
  return 0;
}

- (void)buildEdge:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOMapEdgeBuilder setEdgeHandler:](self, "setEdgeHandler:");
  -[GEOMapEdgeBuilder _findNextEdge](self, "_findNextEdge");

}

- (void)_findTilesAdjacentToTile:(uint64_t)a3 containingPoint:(uint64_t)a4 findAhead:(char)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  char v15;
  _QWORD v16[5];
  id v17;
  char v18;
  id location;
  _QWORD v20[3];
  char v21;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  objc_msgSend((id)a1, "map");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "_tileFinderForMap:center:radius:", v9, -180.0, -180.0, -1.0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;

  objc_initWeak(&location, (id)a1);
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke;
  v16[3] = &unk_1E1C0D728;
  objc_copyWeak(&v17, &location);
  v16[4] = v20;
  v18 = a5;
  objc_msgSend(*(id *)(a1 + 56), "setCompletionHandler:", v16);
  *(_BYTE *)(a1 + 112) ^= 1u;
  v13 = *(void **)(a1 + 56);
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke_2;
  v14[3] = &unk_1E1C0D750;
  v15 = a5;
  v14[4] = a1;
  v14[5] = v20;
  objc_msgSend(v13, "findTilesAdjacentToTile:containingPoint:tileHandler:", a3, a4, v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v20, 8);
}

void __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;
  int *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((id *)WeakRetained + 7) == v6)
    {
      *((_QWORD *)WeakRetained + 7) = 0;

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v5 = &OBJC_IVAR___GEOMapEdgeBuilder__buildAhead;
        if (!*(_BYTE *)(a1 + 48))
          v5 = &OBJC_IVAR___GEOMapEdgeBuilder__buildBehind;
        v4[*v5] = 0;
        objc_msgSend(v4, "_findNextEdge");
      }
    }
  }

}

void __72__GEOMapEdgeBuilder__findTilesAdjacentToTile_containingPoint_findAhead___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = objc_msgSend(v3, "tileKey");
    v6 = *(_QWORD *)v5;
    v7 = *(_QWORD *)v5 << 32;
    v8 = BYTE4(*(_QWORD *)v5) | ((((*(_QWORD *)v5 >> 40) | (*(unsigned __int16 *)(v5 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v5 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v5 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v5 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v15 + 1) = v7 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v5 >> 8) & 0x3F) << 40);
    LOBYTE(v15[0]) = v6;
    *((_QWORD *)&v9 + 1) = v8;
    *(_QWORD *)&v9 = v7;
    *(_QWORD *)&v14 = v15[0];
    *((_QWORD *)&v14 + 1) = v9 >> 56;
    v10 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v11 = objc_msgSend(v10, "_findEdgeAheadInTile:", v4);
    else
      v11 = objc_msgSend(v10, "_findEdgeBehindInTile:", v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 56);
      *(_QWORD *)(v12 + 56) = 0;

      std::__hash_table<_GEOTileKey,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,std::allocator<_GEOTileKey>>::__emplace_unique_key_args<_GEOTileKey,_GEOTileKey const&>(*(_QWORD *)(a1 + 32) + 72, &v14, &v14);
      objc_msgSend(*(id *)(a1 + 32), "_findNextEdge");
    }
  }

}

- (BOOL)_pointConnects:(const void *)a3 rect:(id *)a4 to:(id *)a5
{
  float v5;
  float v6;

  v5 = *(float *)a3;
  v6 = *((float *)a3 + 1);
  return (*(float *)a3 < 0.001 || v5 > 0.999 || v6 < 0.001 || v6 > 0.999)
      && GEOMetersBetweenMapPoints(a5->var0, a5->var1, a4->var0.var0 + v5 * a4->var1.var0, a4->var0.var1 + (float)(1.0 - v6) * a4->var1.var1) <= 5.0;
}

- (BOOL)_edgeStart:(const void *)a3 end:(const void *)a4 connectsTo:(const void *)a5
{
  float v5;
  uint64_t v6;
  char v7;
  float v8;

  if (*(float *)a3 >= 0.001 && *(float *)a3 <= 0.999)
  {
    v5 = *((float *)a3 + 1);
    if (v5 >= 0.001 && v5 <= 0.999)
      return 0;
  }
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = vabds_f32(*((float *)a5 + v6), *((float *)a3 + v6));
    if ((v7 & 1) == 0)
      break;
    v7 = 0;
    v6 = 1;
  }
  while (v8 < 0.000001);
  return v8 < 0.000001;
}

- (unint64_t)_maxTileCount
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_buildCompleteEdge
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)_findEdgeAheadInTile:(id)a3
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_findEdgeBehindInTile:(id)a3
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_shouldFindEdgeAhead
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_shouldFindEdgeBehind
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (Matrix<float,)_firstPoint
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (Matrix<float,)_lastPoint
{
  float v2;
  float v3;
  Matrix<float, 2, 1> result;

  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (id)_firstTile
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_lastTile
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)_tileFinderForMap:(id)a3 center:(id)a4 radius:(double)a5
{
  -[GEOMapEdgeBuilder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.var0, a4.var1, a5);
  return 0;
}

- (id)edgeHandler
{
  return self->_currentTileFinder;
}

- (void)setEdgeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)buildDirection
{
  return *(_QWORD *)&self->_searchDirection;
}

- (void)setBuildDirection:(unint64_t)a3
{
  *(_QWORD *)&self->_searchDirection = a3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)&self->_edgeHandler);
  objc_storeStrong((id *)&self->_currentTileFinder, 0);
  objc_storeStrong((id *)((char *)&self->_lastTilePoint + 4), 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end
