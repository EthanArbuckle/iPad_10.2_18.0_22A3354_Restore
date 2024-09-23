@implementation GEOMapEdgeTransitConnectionFinder

- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4
{
  id v6;
  GeoCodecsConnectivityJunction *junction;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int64x2_t v16;
  __n128 (*v17)(__n128 *, __n128 *);
  GEOVectorTile *tile;
  uint64_t v19;
  GeoCodecsTileKey *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int128 v24;
  id WeakRetained;
  GEOMapTileFinder *v26;
  GEOMapTileFinder *tileFinder;
  id v28;
  uint64_t v29;
  GEOMapTileFinder *v30;
  _QWORD v31[7];
  BOOL v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[6];
  BOOL v37;
  _QWORD v38[6];
  int64x2_t v39;
  __n128 (*v40)(__n128 *, __n128 *);
  _BYTE v41[24];
  __n128 (*v42)(__n128 *, __n128 *);
  uint64_t (*v43)();
  const char *v44;
  double v45;
  uint64_t v46;
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x4812000000;
  v38[3] = __Block_byref_object_copy__57;
  v38[4] = __Block_byref_object_dispose__57;
  v38[5] = "";
  v39 = 0uLL;
  v40 = 0;
  junction = self->super._junction;
  v8 = 2 * junction->var0;
  if ((_DWORD)v8)
  {
    v43 = (uint64_t (*)())&v40;
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<geo::TransitEdgePiece>>(v8);
    v11 = v39.i64[1];
    v12 = v39.i64[0];
    if (v39.i64[1] == v39.i64[0])
    {
      v16 = vdupq_n_s64(v39.u64[1]);
      v13 = v9;
    }
    else
    {
      v13 = v9;
      do
      {
        v14 = *(_QWORD *)(v11 - 32);
        v11 -= 32;
        *(_QWORD *)v11 = 0;
        *((_QWORD *)v13 - 4) = v14;
        v13 -= 32;
        *((_QWORD *)v13 + 1) = *(_QWORD *)(v11 + 8);
        v15 = *(_QWORD *)(v11 + 16);
        *(_QWORD *)(v11 + 16) = 0;
        *((_QWORD *)v13 + 2) = v15;
        LODWORD(v15) = *(_DWORD *)(v11 + 24);
        v13[28] = *(_BYTE *)(v11 + 28);
        *((_DWORD *)v13 + 6) = v15;
      }
      while (v11 != v12);
      v16 = v39;
    }
    v39.i64[0] = (uint64_t)v13;
    v39.i64[1] = (uint64_t)v9;
    *(int64x2_t *)&v41[8] = v16;
    v17 = v40;
    v40 = (__n128 (*)(__n128 *, __n128 *))&v9[32 * v10];
    v42 = v17;
    *(_QWORD *)v41 = v16.i64[0];
    std::__split_buffer<geo::TransitEdgePiece>::~__split_buffer((uint64_t)v41);
    junction = self->super._junction;
  }
  tile = self->super._tile;
  v19 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke;
  v36[3] = &unk_1E1C0E598;
  v37 = a4;
  v36[4] = self;
  v36[5] = v38;
  -[GEOVectorTile forEachTransitLinkOnJunction:visitor:](tile, "forEachTransitLinkOnJunction:visitor:", junction, v36);
  v20 = -[GEOVectorTile tileKey](self->super._tile, "tileKey");
  v21 = *(_QWORD *)v20;
  v22 = *(_QWORD *)v20 << 32;
  v23 = BYTE4(*(_QWORD *)v20) | ((((*(_QWORD *)v20 >> 40) | (*((unsigned __int16 *)v20 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v20 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v20 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v20 + 10) >> 4) << 52);
  *(_QWORD *)&v41[1] = v22 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v20 >> 8) & 0x3F) << 40);
  v41[0] = v21;
  *((_QWORD *)&v24 + 1) = v23;
  *(_QWORD *)&v24 = v22;
  v47[0] = *(_QWORD *)v41;
  v47[1] = v24 >> 56;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._map);
  +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", WeakRetained, self->super._coordinate.latitude, self->super._coordinate.longitude, 5.0);
  v26 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->super._tileFinder;
  self->super._tileFinder = v26;

  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3;
  v33[3] = &unk_1E1C03040;
  v28 = v6;
  v34 = v28;
  v35 = v38;
  -[GEOMapRequest setCompletionHandler:](self->super._tileFinder, "setCompletionHandler:", v33);
  *(_QWORD *)v41 = 0;
  *(_QWORD *)&v41[8] = v41;
  *(_QWORD *)&v41[16] = 0x4012000000;
  v42 = __Block_byref_object_copy__3_0;
  v43 = __Block_byref_object_dispose__4_0;
  v44 = "";
  v45 = GEOTilePointForCoordinate(self->super._coordinate.latitude, self->super._coordinate.longitude, 20.0);
  v46 = v29;
  v30 = self->super._tileFinder;
  v31[0] = v19;
  v31[1] = 3221225472;
  v31[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_6;
  v31[3] = &unk_1E1C0E5C0;
  v32 = a4;
  v31[4] = self;
  v31[5] = v41;
  v31[6] = v38;
  -[GEOMapTileFinder findTiles:excludingKey:](v30, "findTiles:excludingKey:", v31, v47);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v38, 8);
  *(_QWORD *)v41 = &v39;
  std::vector<geo::TransitEdgePiece>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);

}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_5;
  if (objc_msgSend(v3, "fromJunction") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v5 = 1;
    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 48))
    v5 = 0;
  else
LABEL_5:
    v5 = objc_msgSend(v4, "toJunction") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
LABEL_7:
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2;
  v6[3] = &unk_1E1C0E570;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 40);
  geo::TransitEdgePiece::findPiecesForLink(v4, v6);

}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;

  if (*(_BYTE *)(result + 40))
  {
    if (!*(_BYTE *)(a2 + 28))
      return result;
  }
  else if (*(_BYTE *)(a2 + 28))
  {
    return result;
  }
  v2 = *(uint64_t **)(*(_QWORD *)(result + 32) + 8);
  v3 = v2 + 6;
  v4 = v2[7];
  if (v4 >= v2[8])
  {
    result = std::vector<geo::TransitEdgePiece>::__push_back_slow_path<geo::TransitEdgePiece const&>(v3, a2);
  }
  else
  {
    std::vector<geo::TransitEdgePiece>::__construct_one_at_end[abi:ne180100]<geo::TransitEdgePiece const&>((uint64_t)v3, a2);
    result = v4 + 32;
  }
  v2[7] = result;
  return result;
}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[6];
  char v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_msgSend(v2, "tileKey");
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)v3 << 32;
  v6 = BYTE4(*(_QWORD *)v3) | ((((*(_QWORD *)v3 >> 40) | (*(unsigned __int16 *)(v3 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v3 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v3 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v3 + 10) >> 4) << 52);
  *(_QWORD *)((char *)v30 + 1) = v5 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v3 >> 8) & 0x3F) << 40);
  LOBYTE(v30[0]) = v4;
  *((_QWORD *)&v7 + 1) = v6;
  *(_QWORD *)&v7 = v5;
  v29[0] = v30[0];
  v29[1] = v7 >> 56;
  v8 = GEOMapRectForGEOTileKey((uint64_t)v29);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(float *)&v8 = (*(double *)(v9 + 48) - v8) / v10;
  *(float *)&v11 = (v12 - (*(double *)(v9 + 56) - v11)) / v12;
  v30[0] = __PAIR64__(LODWORD(v11), LODWORD(v8));
  v13 = *(uint64_t **)(objc_msgSend(v2, "transitVertices") + 32);
  v14 = *(_QWORD *)(objc_msgSend(v2, "transitVertices") + 8);
  v15 = *v13;
  v16 = objc_msgSend(v2, "transitPointsOnRoad");
  v17 = 0;
  v18 = 0;
  v19 = v14 + 8 * v15;
  while (v18 < objc_msgSend(v2, "junctionsCount"))
  {
    v20 = objc_msgSend(v2, "junctions") + v17;
    v21 = *(unsigned int *)(v20 + 4);
    objc_msgSend(v2, "lines");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", *(unsigned int *)(v16 + 16 * v21 + 4));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "sectionOffset");
    if (*(_QWORD *)(v19
                   + 8
                   * (v13[2 * v24 + 2 * *(unsigned int *)(v16 + 16 * v21 + 8)] + *(unsigned int *)(v16 + 16 * v21 + 12))) == v30[0])
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2_7;
      v27[3] = &unk_1E1C0E598;
      v28 = *(_BYTE *)(a1 + 56);
      v25 = *(_QWORD *)(a1 + 48);
      v27[4] = *(_QWORD *)(a1 + 32);
      v27[5] = v25;
      objc_msgSend(v2, "forEachTransitLinkOnJunction:visitor:", v20, v27);
    }

    ++v18;
    v17 += 32;
  }

}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_5;
  if (objc_msgSend(v3, "fromJunction") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    v5 = 1;
    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 48))
    v5 = 0;
  else
LABEL_5:
    v5 = objc_msgSend(v4, "toJunction") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
LABEL_7:
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3_8;
  v6[3] = &unk_1E1C0E570;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 40);
  geo::TransitEdgePiece::findPiecesForLink(v4, v6);

}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3_8(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;

  if (*(_BYTE *)(result + 40))
  {
    if (!*(_BYTE *)(a2 + 28))
      return result;
  }
  else if (*(_BYTE *)(a2 + 28))
  {
    return result;
  }
  v2 = *(uint64_t **)(*(_QWORD *)(result + 32) + 8);
  v3 = v2 + 6;
  v4 = v2[7];
  if (v4 >= v2[8])
  {
    result = std::vector<geo::TransitEdgePiece>::__push_back_slow_path<geo::TransitEdgePiece const&>(v3, a2);
  }
  else
  {
    std::vector<geo::TransitEdgePiece>::__construct_one_at_end[abi:ne180100]<geo::TransitEdgePiece const&>((uint64_t)v3, a2);
    result = v4 + 32;
  }
  v2[7] = result;
  return result;
}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke;
  v8[3] = &unk_1E1C0E5E8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[GEOMapEdgeTransitConnectionFinder _findConnectedEdges:incoming:](self, "_findConnectedEdges:incoming:", v8, v4);

}

void __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v3 = *a2;
  v4 = a2[1];
  v5 = v4 == *a2;
  v15[3] = (v4 - *a2) >> 5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "complete");
  }
  else
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke_2;
      v10[3] = &unk_1E1C03108;
      v12 = v14;
      v8 = *(id *)(a1 + 40);
      v13 = v15;
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v8;
      objc_msgSend(WeakRetained, "buildMapEdgeTransitFrom:edgeHandler:", v3, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v9);

      v3 += 32;
    }
    while (v3 != v4);
    _Block_object_dispose(v14, 8);
  }
  _Block_object_dispose(v15, 8);
}

void __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (std::__shared_weak_count *)a2[1];
  v10 = *a2;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(v3 + 16))(v3, &v10);
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 24))
    objc_msgSend(*(id *)(a1 + 32), "complete", v10);
}

@end
