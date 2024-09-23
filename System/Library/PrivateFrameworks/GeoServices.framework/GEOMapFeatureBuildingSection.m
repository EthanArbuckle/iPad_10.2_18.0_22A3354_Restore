@implementation GEOMapFeatureBuildingSection

- (GEOMapFeatureBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4
{
  id v7;
  GEOMapFeatureBuildingSection *v8;
  GEOMapFeatureBuildingSection *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  GEOVectorTile *tile;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOMapFeatureBuildingSection;
  v8 = -[GEOMapFeatureBuildingSection init](&v27, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_coordinateCount = 0x7FFFFFFFFFFFFFFFLL;
    v8->_sectionIndex = a4;
    objc_storeStrong((id *)&v8->_feature, a3);
    objc_msgSend(v7, "feature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "feature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containingTile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "tileKey");
    v14 = *(_QWORD *)v13;
    v15 = *(_QWORD *)v13 << 32;
    v16 = BYTE4(*(_QWORD *)v13) | ((((*(_QWORD *)v13 >> 40) | (*(unsigned __int16 *)(v13 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v13 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v13 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v13 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v29 + 1) = v15 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v13 >> 8) & 0x3F) << 40);
    LOBYTE(v29[0]) = v14;
    *((_QWORD *)&v17 + 1) = v16;
    *(_QWORD *)&v17 = v15;
    v28[0] = v29[0];
    v28[1] = v17 >> 56;

    v18 = GEOMapRectForGEOTileKey((uint64_t)v28);
    v21 = GEOMetersBetweenMapPoints(v18, v20, v18 + v19, v20);
    v9->_baseHeight = v21 * GEOBuildingFootprintBaseHeight(v7, a4);
    v9->_height = v21 * GEOBuildingFootprintExtrusionHeight(v7, a4);
    objc_msgSend(v7, "feature");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "feature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "containingTile");
    v24 = objc_claimAutoreleasedReturnValue();
    tile = v9->_tile;
    v9->_tile = (GEOVectorTile *)v24;

  }
  return v9;
}

- (GEOMapFeatureBuildingSection)initWithDaVinciTile:(id)a3 buildingIndex:(unint64_t)a4 sectionIndex:(unint64_t)a5
{
  id v9;
  GEOMapFeatureBuildingSection *v10;
  GEOMapFeatureBuildingSection *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  double v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  unsigned __int16 *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double *v37;
  unint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t coordinateCount;
  double v53;
  double v54;
  double v55;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v56;
  unint64_t v57;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v58;
  $F24F406B2B787EFB06265DBA3D28CBD5 v59;
  double v61;
  objc_super v62;
  __int128 __p;
  double *v64;
  _QWORD v65[4];

  v65[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v62.receiver = self;
  v62.super_class = (Class)GEOMapFeatureBuildingSection;
  v10 = -[GEOMapFeatureBuildingSection init](&v62, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_coordinateCount = 0;
    v10->_sectionIndex = a5;
    objc_storeStrong((id *)&v10->_tile, a3);
    *(_OWORD *)&v11->_terrainElevation = xmmword_189CD2CC0;
    *(_OWORD *)&v11->_minBaseHeight = xmmword_189CD2CB0;
    if (objc_msgSend(v9, "daVinciBuildingSectionCount") > a5)
    {
      v12 = objc_msgSend(v9, "daVinciBuildingSections");
      v13 = *(unsigned __int16 *)(objc_msgSend(v9, "daVinciBuildings") + 40 * a4 + 32);
      -[GEOVectorTile metersToTileSize](v11->_tile, "metersToTileSize");
      v14 = v12 + 20 * v13;
      v61 = 1.0 / v15;
      v16 = (int8x16_t)vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)(v14 + 20 * a5 + 4)), 1.0 / v15);
      *(int8x16_t *)&v11->_terrainElevation = vextq_s8(v16, v16, 8uLL);
      v17 = objc_msgSend(v9, "daVinciLineLoops");
      v18 = *(unsigned int *)(v14 + 20 * a5 + 12);
      v19 = objc_msgSend(v9, "daVinciBuildingVertices");
      v20 = *(_DWORD *)(v17 + 8 * v18);
      v21 = objc_msgSend(v9, "tileKey");
      v22 = *(_QWORD *)v21;
      v23 = *(_QWORD *)v21 << 32;
      v24 = BYTE4(*(_QWORD *)v21) | ((((*(_QWORD *)v21 >> 40) | (*(unsigned __int16 *)(v21 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v21 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v21 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v21 + 10) >> 4) << 52);
      *(_QWORD *)((char *)&__p + 1) = v23 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v21 >> 8) & 0x3F) << 40);
      LOBYTE(__p) = v22;
      *((_QWORD *)&v25 + 1) = v24;
      *(_QWORD *)&v25 = v23;
      v65[0] = __p;
      v65[1] = v25 >> 56;
      v26 = GEOMapRectForGEOTileKey((uint64_t)v65);
      __p = 0uLL;
      v64 = 0;
      v30 = v17 + 8 * v18;
      v32 = *(unsigned __int16 *)(v30 + 4);
      v31 = (unsigned __int16 *)(v30 + 4);
      if (v32)
      {
        v33 = v26;
        v34 = v27;
        v35 = v28;
        v36 = v29;
        v37 = 0;
        v38 = 0;
        v39 = v19 + 12 * v20;
        do
        {
          v40 = GEOCoordinate2DForMapPoint(v33 + *(float *)(v39 + 12 * v38) * v35, v34 + (float)(1.0 - *(float *)(v39 + 12 * v38 + 4)) * v36);
          v42 = v40;
          v43 = v41;
          if (v37 >= v64)
          {
            v44 = (double *)__p;
            v45 = (uint64_t)((uint64_t)v37 - __p) >> 4;
            v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 60)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v47 = (uint64_t)v64 - __p;
            if ((uint64_t)((uint64_t)v64 - __p) >> 3 > v46)
              v46 = v47 >> 3;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0)
              v48 = 0xFFFFFFFFFFFFFFFLL;
            else
              v48 = v46;
            if (v48)
            {
              v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v64, v48);
              v37 = (double *)*((_QWORD *)&__p + 1);
              v44 = (double *)__p;
            }
            else
            {
              v49 = 0;
            }
            v50 = &v49[16 * v45];
            *(double *)v50 = v42;
            *((_QWORD *)v50 + 1) = v43;
            v51 = v50;
            if (v37 != v44)
            {
              do
              {
                *((_OWORD *)v51 - 1) = *((_OWORD *)v37 - 1);
                v51 -= 16;
                v37 -= 2;
              }
              while (v37 != v44);
              v44 = (double *)__p;
            }
            v37 = (double *)(v50 + 16);
            *(_QWORD *)&__p = v51;
            *((_QWORD *)&__p + 1) = v50 + 16;
            v64 = (double *)&v49[16 * v48];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v37 = v40;
            *((_QWORD *)v37 + 1) = v41;
            v37 += 2;
          }
          *((_QWORD *)&__p + 1) = v37;
          coordinateCount = v11->_coordinateCount + 1;
          v11->_coordinateCount = coordinateCount;
          v53 = v61 * *(float *)(v39 + 12 * v38 + 8);
          v54 = fmin(v11->_minBaseHeight, v53);
          v55 = fmax(v11->_maxBaseHeight, v53);
          v11->_minBaseHeight = v54;
          v11->_maxBaseHeight = v55;
          ++v38;
        }
        while (v38 < *v31);
      }
      else
      {
        coordinateCount = v11->_coordinateCount;
      }
      v56 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * coordinateCount, 0x1000040451B5BE8uLL);
      v11->_coordinates = v56;
      v57 = v11->_coordinateCount;
      if (v57)
      {
        v58 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)__p;
        do
        {
          v59 = *v58++;
          *v56++ = v59;
          --v57;
        }
        while (v57);
      }
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
    }
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_coordinates);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureBuildingSection;
  -[GEOMapFeatureBuildingSection dealloc](&v3, sel_dealloc);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *coordinates;
  void *v4;
  _QWORD *v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v6;
  unint64_t v7;
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
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double *p_var1;
  float *v25;
  uint64_t v26;
  unint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  coordinates = self->_coordinates;
  if (!coordinates)
  {
    -[GEOBuildingFootprintFeature feature](self->_feature, "feature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v5 = GEOMultiSectionFeaturePoints(v4, self->_sectionIndex, &v28);
    v6 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v28, 0x1000040451B5BE8uLL);
    v7 = v28;
    self->_coordinates = v6;
    self->_coordinateCount = v7;
    objc_msgSend(v4, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containingTile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "tileKey");
    v11 = *(_QWORD *)v10;
    v12 = *(_QWORD *)v10 << 32;
    v13 = BYTE4(*(_QWORD *)v10) | ((((*(_QWORD *)v10 >> 40) | (*(unsigned __int16 *)(v10 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v10 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v10 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v30 + 1) = v12 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v10 >> 8) & 0x3F) << 40);
    LOBYTE(v30[0]) = v11;
    *((_QWORD *)&v14 + 1) = v13;
    *(_QWORD *)&v14 = v12;
    v29[0] = v30[0];
    v29[1] = v14 >> 56;

    v15 = GEOMapRectForGEOTileKey((uint64_t)v29);
    v19 = v28;
    coordinates = self->_coordinates;
    if (v28)
    {
      v20 = v15;
      v21 = v16;
      v22 = v17;
      v23 = v18;
      p_var1 = &coordinates->var1;
      v25 = (float *)v5 + 1;
      do
      {
        *(p_var1 - 1) = GEOCoordinate2DForMapPoint(v20 + *(v25 - 1) * v22, v21 + (float)(1.0 - *v25) * v23);
        *(_QWORD *)p_var1 = v26;
        p_var1 += 2;
        v25 += 2;
        --v19;
      }
      while (v19);
    }

  }
  return coordinates;
}

- (unint64_t)coordinateCount
{
  unint64_t result;

  result = self->_coordinateCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[GEOMapFeatureBuildingSection coordinates](self, "coordinates");
    return self->_coordinateCount;
  }
  return result;
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (double)height
{
  return self->_height;
}

- (double)terrainElevation
{
  return self->_terrainElevation;
}

- (double)topHeight
{
  return self->_topHeight;
}

- (double)minBaseHeight
{
  return self->_minBaseHeight;
}

- (double)maxBaseHeight
{
  return self->_maxBaseHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_tile, 0);
}

@end
