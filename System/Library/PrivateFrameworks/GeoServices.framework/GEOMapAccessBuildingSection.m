@implementation GEOMapAccessBuildingSection

- (GEOMapAccessBuildingSection)initWithFeature:(id)a3 sectionIndex:(unint64_t)a4
{
  id v6;
  GEOMapAccessBuildingSection *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD *v24;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v25;
  unint64_t v26;
  unint64_t v27;
  long double *p_var1;
  float *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  GEOMapAccessBuildingSection *v40;
  double v42;
  double v43;
  unint64_t v44;
  objc_super v45;
  char v46;
  _BYTE v47[15];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEOMapAccessBuildingSection;
  v7 = -[GEOMapAccessBuildingSection init](&v45, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "feature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containingTile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "tileKey");
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)v11 << 32;
    v14 = BYTE4(*(_QWORD *)v11) | ((((*(_QWORD *)v11 >> 40) | (*(unsigned __int16 *)(v11 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v11 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v11 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v11 + 10) >> 4) << 52);
    *(_QWORD *)v47 = v13 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v11 >> 8) & 0x3F) << 40);
    v46 = v12;
    *((_QWORD *)&v15 + 1) = v14;
    *(_QWORD *)&v15 = v13;
    *(_QWORD *)&v47[7] = v15 >> 56;

    v16 = GEOMapRectForGEOTileKey((uint64_t)&v46);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v23 = GEOMetersBetweenMapPoints(v16, v17, v16 + v19, v17);
    v44 = 0;
    v24 = GEOMultiSectionFeaturePoints(v8, a4, &v44);
    v25 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v44, 0x1000040451B5BE8uLL);
    v26 = v44;
    v7->_coordinates = v25;
    v7->_coordinateCount = v26;
    v7->_baseHeight = v23 * GEOBuildingFootprintBaseHeight(v6, a4);
    v7->_height = v23 * GEOBuildingFootprintExtrusionHeight(v6, a4);
    v7->_sectionIndex = a4;
    v27 = v44;
    if (v44)
    {
      p_var1 = &v7->_coordinates->var1;
      v29 = (float *)v24 + 1;
      v30 = 1.79769313e308;
      v31 = -1.79769313e308;
      v32 = -1.79769313e308;
      v33 = 1.79769313e308;
      v42 = v22;
      v43 = v18;
      do
      {
        v34 = v20;
        v35 = v16 + *(v29 - 1) * v20;
        v36 = v16;
        v37 = v43 + (float)(1.0 - *v29) * v42;
        *(p_var1 - 1) = GEOCoordinate2DForMapPoint(v35, v37);
        *(_QWORD *)p_var1 = v38;
        if (v35 < v33)
          v33 = v35;
        if (v37 < v30)
          v30 = v37;
        if (v35 > v32)
          v32 = v35;
        v20 = v34;
        if (v37 > v31)
          v31 = v37;
        v16 = v36;
        p_var1 += 2;
        v29 += 2;
        --v27;
      }
      while (v27);
    }
    else
    {
      v32 = -1.79769313e308;
      v33 = 1.79769313e308;
      v30 = 1.79769313e308;
      v31 = -1.79769313e308;
    }
    v7->_centerCoordinate.latitude = GEOCoordinate2DForMapPoint((v33 + v32) * 0.5, (v30 + v31) * 0.5);
    v7->_centerCoordinate.longitude = v39;
    v7->_radius = GEOMetersBetweenMapPoints(v33, v30, (v33 + v32) * 0.5, (v30 + v31) * 0.5);
    v40 = v7;

  }
  return v7;
}

- (void)dealloc
{
  $F24F406B2B787EFB06265DBA3D28CBD5 *coordinates;
  objc_super v4;

  coordinates = self->_coordinates;
  if (coordinates)
  {
    free(coordinates);
    self->_coordinates = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessBuildingSection;
  -[GEOMapAccessBuildingSection dealloc](&v4, sel_dealloc);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  return self->_coordinates;
}

- (unint64_t)coordinateCount
{
  return self->_coordinateCount;
}

- (double)baseHeight
{
  return self->_baseHeight;
}

- (double)height
{
  return self->_height;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_centerCoordinate.latitude;
  longitude = self->_centerCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

@end
