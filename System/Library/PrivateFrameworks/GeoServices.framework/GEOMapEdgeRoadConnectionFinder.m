@implementation GEOMapEdgeRoadConnectionFinder

- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4
{
  id v6;
  GEOVectorTile *tile;
  GeoCodecsConnectivityJunction *junction;
  uint64_t v9;
  GeoCodecsTileKey *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  id WeakRetained;
  GEOMapTileFinder *v16;
  GEOMapTileFinder *tileFinder;
  id v18;
  double v19;
  GEOMapTileFinder *v20;
  uint64_t v21;
  _QWORD v22[6];
  BOOL v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  BOOL v28;
  _QWORD v29[6];
  _QWORD v30[3];
  __int128 v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  uint64_t (*v34)();
  const char *v35;
  double v36;
  uint64_t v37;
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x4812000000;
  v29[3] = __Block_byref_object_copy__9;
  v29[4] = __Block_byref_object_dispose__9;
  v29[5] = "";
  memset(v30, 0, sizeof(v30));
  tile = self->super._tile;
  junction = self->super._junction;
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke;
  v27[3] = &unk_1E1C03018;
  v28 = a4;
  v27[4] = v29;
  -[GEOVectorTile forEachEdgeOnJunction:visitor:](tile, "forEachEdgeOnJunction:visitor:", junction, v27);
  v10 = -[GEOVectorTile tileKey](self->super._tile, "tileKey");
  v11 = *(_QWORD *)v10;
  v12 = *(_QWORD *)v10 << 32;
  v13 = BYTE4(*(_QWORD *)v10) | ((((*(_QWORD *)v10 >> 40) | (*((unsigned __int16 *)v10 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v10 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((_BYTE *)v10 + 10) >> 4) << 52);
  *(_QWORD *)((char *)&v31 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v10 >> 8) & 0x3F) << 40);
  LOBYTE(v31) = v11;
  *((_QWORD *)&v14 + 1) = v13;
  *(_QWORD *)&v14 = v12;
  v38[0] = v31;
  v38[1] = v14 >> 56;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._map);
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", WeakRetained, self->super._coordinate.latitude, self->super._coordinate.longitude, 5.0);
  v16 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->super._tileFinder;
  self->super._tileFinder = v16;

  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2;
  v24[3] = &unk_1E1C03040;
  v18 = v6;
  v25 = v18;
  v26 = v29;
  -[GEOMapRequest setCompletionHandler:](self->super._tileFinder, "setCompletionHandler:", v24);
  *(_QWORD *)&v31 = 0;
  *((_QWORD *)&v31 + 1) = &v31;
  v32 = 0x4012000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__3;
  v35 = "";
  v19 = GEOTilePointForCoordinate(self->super._coordinate.latitude, self->super._coordinate.longitude, 20.0);
  v20 = self->super._tileFinder;
  v36 = v19;
  v37 = v21;
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_5;
  v22[3] = &unk_1E1C030B8;
  v23 = a4;
  v22[4] = &v31;
  v22[5] = v29;
  -[GEOMapTileFinder findTiles:excludingKey:](v20, "findTiles:excludingKey:", v22, v38);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(v29, 8);
  *(_QWORD *)&v31 = v30;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);

}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int64x2_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  int64x2_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  char *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  int64x2_t v33;
  uint64_t v34;
  uint64_t *v35;
  char *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  int64x2_t v40;
  uint64_t v41;
  uint64_t v42;
  int64x2_t v43;
  char *v44;
  int64x2_t *v45;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = v3;
    GEORoadEdgeFlip(v5);
    v6 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = objc_msgSend(v5, "copy");
    v8 = v6[4].u64[0];
    v9 = (uint64_t *)v6[3].i64[1];
    if ((unint64_t)v9 >= v8)
    {
      v16 = v6[3].i64[0];
      v17 = ((uint64_t)v9 - v16) >> 3;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v18 = v8 - v16;
      v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      v45 = v6 + 4;
      if (v20)
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v6[4].i64, v20);
      else
        v21 = 0;
      v28 = (uint64_t *)&v21[8 * v17];
      v29 = &v21[8 * v20];
      v44 = v29;
      *v28 = v7;
      v10 = v28 + 1;
      v43.i64[1] = (uint64_t)(v28 + 1);
      v31 = (_QWORD *)v6[3].i64[0];
      v30 = (_QWORD *)v6[3].i64[1];
      if (v30 == v31)
      {
        v33 = vdupq_n_s64((unint64_t)v30);
      }
      else
      {
        do
        {
          v32 = *--v30;
          *v30 = 0;
          *--v28 = v32;
        }
        while (v30 != v31);
        v33 = v6[3];
        v10 = (_QWORD *)v43.i64[1];
        v29 = v44;
      }
      v6[3].i64[0] = (uint64_t)v28;
      v6[3].i64[1] = (uint64_t)v10;
      v43 = v33;
      v34 = v6[4].i64[0];
      v6[4].i64[0] = (uint64_t)v29;
      v44 = (char *)v34;
      v42 = v33.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v42);
    }
    else
    {
      *v9 = v7;
      v10 = v9 + 1;
    }
    v6[3].i64[1] = (uint64_t)v10;

  }
  else
  {
    v11 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
    v12 = objc_msgSend(v3, "copy");
    v13 = v11[4].u64[0];
    v14 = (uint64_t *)v11[3].i64[1];
    if ((unint64_t)v14 >= v13)
    {
      v22 = v11[3].i64[0];
      v23 = ((uint64_t)v14 - v22) >> 3;
      if ((unint64_t)(v23 + 1) >> 61)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v24 = v13 - v22;
      v25 = v24 >> 2;
      if (v24 >> 2 <= (unint64_t)(v23 + 1))
        v25 = v23 + 1;
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
        v26 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v26 = v25;
      v45 = v11 + 4;
      if (v26)
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v11[4].i64, v26);
      else
        v27 = 0;
      v35 = (uint64_t *)&v27[8 * v23];
      v36 = &v27[8 * v26];
      v44 = v36;
      *v35 = v12;
      v15 = v35 + 1;
      v43.i64[1] = (uint64_t)(v35 + 1);
      v38 = (_QWORD *)v11[3].i64[0];
      v37 = (_QWORD *)v11[3].i64[1];
      if (v37 == v38)
      {
        v40 = vdupq_n_s64((unint64_t)v37);
      }
      else
      {
        do
        {
          v39 = *--v37;
          *v37 = 0;
          *--v35 = v39;
        }
        while (v37 != v38);
        v40 = v11[3];
        v15 = (_QWORD *)v43.i64[1];
        v36 = v44;
      }
      v11[3].i64[0] = (uint64_t)v35;
      v11[3].i64[1] = (uint64_t)v15;
      v43 = v40;
      v41 = v11[4].i64[0];
      v11[4].i64[0] = (uint64_t)v36;
      v44 = (char *)v41;
      v42 = v40.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v42);
    }
    else
    {
      *v14 = v12;
      v15 = v14 + 1;
    }
    v11[3].i64[1] = (uint64_t)v15;
  }

}

uint64_t __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  double v9;
  uint64_t v10;
  double v11;
  float v12;
  double v13;
  double v14;
  float v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  float v21;
  float v22;
  char v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)v4 << 32;
  v7 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) >> 4) << 52);
  *(_QWORD *)((char *)v25 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v25[0]) = v5;
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = v6;
  v24[0] = v25[0];
  v24[1] = v8 >> 56;
  v9 = GEOMapRectForGEOTileKey((uint64_t)v24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = (*(double *)(v10 + 48) - v9) / v11;
  v15 = (v14 - (*(double *)(v10 + 56) - v13)) / v14;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2_6;
  v18[3] = &unk_1E1C03090;
  v16 = v3;
  v23 = *(_BYTE *)(a1 + 48);
  v21 = v12;
  v22 = v15;
  v17 = *(_QWORD *)(a1 + 40);
  v19 = v16;
  v20 = v17;
  objc_msgSend(v16, "forEachRoad:", v18);

}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2_6(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[7];
  char v9;
  uint64_t v10;

  v3 = a2;
  v4 = geo::codec::multiSectionFeaturePoints((_QWORD *)objc_msgSend(v3, "get"), 0, &v10);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_3;
  v8[3] = &unk_1E1C03068;
  v9 = *(_BYTE *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v8[5] = v4;
  v8[6] = v5;
  v7 = *(void **)(a1 + 32);
  v8[4] = v6;
  objc_msgSend(v7, "forEachEdgeInRoad:visitTwice:visitor:", v3, 0, v8);

}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  float v13;
  int64x2_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  float v22;
  id v23;
  int64x2_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t *v41;
  char *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  int64x2_t v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  int64x2_t v53;
  uint64_t v54;
  uint64_t v55;
  int64x2_t v56;
  char *v57;
  int64x2_t *v58;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
    v5 = objc_msgSend(v3, "vertexIndexB");
  else
    v5 = objc_msgSend(v3, "vertexIndexA");
  v6 = v5;
  if (*(_BYTE *)(a1 + 56))
    v7 = objc_msgSend(v4, "vertexIndexA");
  else
    v7 = objc_msgSend(v4, "vertexIndexB");
  v9 = 0;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a1 + 48;
  v12 = 1;
  LODWORD(v8) = 897988541;
  do
  {
    v13 = vabds_f32(*(float *)(v11 + 4 * v9), *(float *)(v10 + 8 * v6 + 4 * v9));
    if ((v12 & 1) == 0)
      break;
    v12 = 0;
    v9 = 1;
  }
  while (v13 < 0.000001);
  if (v13 >= 0.000001)
  {
    v19 = 0;
    v20 = v10 + 8 * v7;
    v21 = 1;
    do
    {
      v22 = vabds_f32(*(float *)(v11 + 4 * v19), *(float *)(v20 + 4 * v19));
      if ((v21 & 1) == 0)
        break;
      v21 = 0;
      v19 = 1;
    }
    while (v22 < 0.000001);
    if (v22 < 0.000001)
    {
      v23 = v4;
      GEORoadEdgeFlip(v23);
      v24 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
      v25 = objc_msgSend(v23, "copy");
      v26 = v24[4].u64[0];
      v27 = (uint64_t *)v24[3].i64[1];
      if ((unint64_t)v27 >= v26)
      {
        v35 = v24[3].i64[0];
        v36 = ((uint64_t)v27 - v35) >> 3;
        if ((unint64_t)(v36 + 1) >> 61)
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        v37 = v26 - v35;
        v38 = v37 >> 2;
        if (v37 >> 2 <= (unint64_t)(v36 + 1))
          v38 = v36 + 1;
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
          v39 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v39 = v38;
        v58 = v24 + 4;
        if (v39)
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v24[4].i64, v39);
        else
          v40 = 0;
        v48 = (uint64_t *)&v40[8 * v36];
        v49 = &v40[8 * v39];
        v57 = v49;
        *v48 = v25;
        v28 = v48 + 1;
        v56.i64[1] = (uint64_t)(v48 + 1);
        v51 = (_QWORD *)v24[3].i64[0];
        v50 = (_QWORD *)v24[3].i64[1];
        if (v50 == v51)
        {
          v53 = vdupq_n_s64((unint64_t)v50);
        }
        else
        {
          do
          {
            v52 = *--v50;
            *v50 = 0;
            *--v48 = v52;
          }
          while (v50 != v51);
          v53 = v24[3];
          v28 = (_QWORD *)v56.i64[1];
          v49 = v57;
        }
        v24[3].i64[0] = (uint64_t)v48;
        v24[3].i64[1] = (uint64_t)v28;
        v56 = v53;
        v54 = v24[4].i64[0];
        v24[4].i64[0] = (uint64_t)v49;
        v57 = (char *)v54;
        v55 = v53.i64[0];
        std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v55);
      }
      else
      {
        *v27 = v25;
        v28 = v27 + 1;
      }
      v24[3].i64[1] = (uint64_t)v28;

    }
  }
  else
  {
    v14 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
    v15 = objc_msgSend(v4, "copy", v8);
    v16 = v14[4].u64[0];
    v17 = (uint64_t *)v14[3].i64[1];
    if ((unint64_t)v17 >= v16)
    {
      v29 = v14[3].i64[0];
      v30 = ((uint64_t)v17 - v29) >> 3;
      if ((unint64_t)(v30 + 1) >> 61)
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      v31 = v16 - v29;
      v32 = v31 >> 2;
      if (v31 >> 2 <= (unint64_t)(v30 + 1))
        v32 = v30 + 1;
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
        v33 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v33 = v32;
      v58 = v14 + 4;
      if (v33)
        v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v14[4].i64, v33);
      else
        v34 = 0;
      v41 = (uint64_t *)&v34[8 * v30];
      v42 = &v34[8 * v33];
      v57 = v42;
      *v41 = v15;
      v18 = v41 + 1;
      v56.i64[1] = (uint64_t)(v41 + 1);
      v44 = (_QWORD *)v14[3].i64[0];
      v43 = (_QWORD *)v14[3].i64[1];
      if (v43 == v44)
      {
        v46 = vdupq_n_s64((unint64_t)v43);
      }
      else
      {
        do
        {
          v45 = *--v43;
          *v43 = 0;
          *--v41 = v45;
        }
        while (v43 != v44);
        v46 = v14[3];
        v18 = (_QWORD *)v56.i64[1];
        v42 = v57;
      }
      v14[3].i64[0] = (uint64_t)v41;
      v14[3].i64[1] = (uint64_t)v18;
      v56 = v46;
      v47 = v14[4].i64[0];
      v14[4].i64[0] = (uint64_t)v42;
      v57 = (char *)v47;
      v55 = v46.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v55);
    }
    else
    {
      *v17 = v15;
      v18 = v17 + 1;
    }
    v14[3].i64[1] = (uint64_t)v18;
  }

}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke;
  v8[3] = &unk_1E1C03130;
  v10 = v4;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[GEOMapEdgeRoadConnectionFinder _findConnectedEdges:incoming:](self, "_findConnectedEdges:incoming:", v8, v4);

}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke(uint64_t a1, id **a2)
{
  id *v3;
  id *v4;
  BOOL v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  GEOMapEdgeRoadBuilder *v12;
  id WeakRetained;
  GEOMapEdgeRoadBuilder *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v4 = *a2;
  v3 = a2[1];
  v5 = v3 == *a2;
  v29[3] = v3 - *a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "complete");
  }
  else
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = *v4;
      objc_msgSend(v7, "road");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "feature");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "containingTile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_2;
      v21[3] = &unk_1E1C030E0;
      v21[4] = *(_QWORD *)(a1 + 32);
      v11 = v7;
      v22 = v11;
      v23 = &v24;
      objc_msgSend(v10, "forEachEdgeInRoad:visitTwice:visitor:", v8, 0, v21);
      v12 = [GEOMapEdgeRoadBuilder alloc];
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      v14 = -[GEOMapEdgeRoadBuilder initWithMap:roadFeature:shouldFlip:](v12, "initWithMap:roadFeature:shouldFlip:", WeakRetained, v8, *((unsigned __int8 *)v25 + 24));

      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
      {
        if (*(_BYTE *)(a1 + 48))
          v15 = 2;
        else
          v15 = 1;
        -[GEOMapEdgeBuilder setBuildDirection:](v14, "setBuildDirection:", v15);
      }
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_3;
      v17[3] = &unk_1E1C03108;
      v19 = v28;
      v16 = *(id *)(a1 + 40);
      v20 = v29;
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v16;
      -[GEOMapEdgeBuilder buildEdge:](v14, "buildEdge:", v17);
      if (v14 && !-[GEOMapRequest isFinished](v14, "isFinished"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v14);

      _Block_object_dispose(&v24, 8);
      ++v4;
    }
    while (v4 != v3);
    _Block_object_dispose(v28, 8);
  }
  _Block_object_dispose(v29, 8);
}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  GEORoadEdgeFlip(v3);
  if (objc_msgSend(*(id *)(a1 + 32), "_isRoadEdgeEqual:other:", *(_QWORD *)(a1 + 40), v3))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_3(uint64_t a1, uint64_t *a2)
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

- (BOOL)_isRoadEdgeEqual:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v23;
  _BYTE v25[11];
  _BYTE v26[11];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "road");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containingTile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "tileKey");
  *(_QWORD *)v26 = *(_QWORD *)v10;
  *(_DWORD *)&v26[7] = *(_DWORD *)(v10 + 7);

  objc_msgSend(v6, "road");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "feature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containingTile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "tileKey");
  *(_QWORD *)v25 = *(_QWORD *)v14;
  *(_DWORD *)&v25[7] = *(_DWORD *)(v14 + 7);

  v15 = objc_msgSend(v5, "junctionIndexA");
  if (v15 == objc_msgSend(v6, "junctionIndexA")
    && (v16 = objc_msgSend(v5, "junctionIndexB"), v16 == objc_msgSend(v6, "junctionIndexB"))
    && (v17 = objc_msgSend(v5, "vertexIndexA"), v17 == objc_msgSend(v6, "vertexIndexA"))
    && (v18 = objc_msgSend(v5, "vertexIndexB"), v18 == objc_msgSend(v6, "vertexIndexB")))
  {
    objc_msgSend(v5, "road");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "sectionOffset");
    objc_msgSend(v6, "road");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20 == objc_msgSend(v21, "sectionOffset")
       && *(_QWORD *)v26 == *(_QWORD *)v25
       && *(_QWORD *)&v26[3] == *(_QWORD *)&v25[3];

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end
