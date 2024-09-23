@implementation GEOMapFeatureRunningTrack

- (GEOMapFeatureRunningTrack)initWithVMP4Track:(const void *)a3 boundingBox:(id)a4
{
  id v7;
  GEOMapFeatureRunningTrack *v8;
  GEOMapFeatureRunningTrack *v9;
  unint64_t v10;
  void *v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  GEOMapRegion *v23;
  GEOMapRegion *orientedBoundingRegion;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  GEOMapFeatureRunningTrackLane *v34;
  uint64_t v35;
  NSArray *lanes;
  objc_super v38;

  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)GEOMapFeatureRunningTrack;
  v8 = -[GEOMapFeatureRunningTrack init](&v38, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_trackId = *(_QWORD *)a3;
    objc_storeStrong((id *)&v8->_boundingBox, a4);
    v10 = *((unsigned int *)a3 + 3);
    v9->_type = *((unsigned __int8 *)a3 + 8);
    v9->_features = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 13) - *((_QWORD *)a3 + 12)) >> 4));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((_BYTE *)a3 + 80);
    objc_msgSend(v7, "eastLng");
    v14 = v13;
    objc_msgSend(v7, "westLng");
    v16 = v15;
    objc_msgSend(v7, "northLat");
    v18 = v17;
    objc_msgSend(v7, "southLat");
    v19 = (double)~(-1 << v12);
    v20 = (v14 - v16) / v19;
    v22 = (v18 - v21) / v19;
    if ((v9->_features & 4) != 0)
    {
      v23 = objc_alloc_init(GEOMapRegion);
      orientedBoundingRegion = v9->_orientedBoundingRegion;
      v9->_orientedBoundingRegion = v23;

      pointsToCoordinates(v9->_boundingBox, (_QWORD *)a3 + 6, v22, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOMapRegion setVertexs:](v9->_orientedBoundingRegion, "setVertexs:", v25);

      -[GEOMapRegion vertexs](v9->_orientedBoundingRegion, "vertexs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 == 4)
      {
        -[GEOMapRegion vertexs](v9->_orientedBoundingRegion, "vertexs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOMapRegion vertexs](v9->_orientedBoundingRegion, "vertexs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v30);

      }
    }
    v31 = *((_QWORD *)a3 + 12);
    for (i = *((_QWORD *)a3 + 13); v31 != i; v31 += 48)
    {
      pointsToCoordinates(v9->_boundingBox, (_QWORD *)(v31 + 8), v22, v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[GEOMapFeatureRunningTrackLane initWithVMP4Lane:coordinates:]([GEOMapFeatureRunningTrackLane alloc], "initWithVMP4Lane:coordinates:", v31, v33);
      objc_msgSend(v11, "addObject:", v34);

    }
    v35 = objc_msgSend(v11, "copy");
    lanes = v9->_lanes;
    v9->_lanes = (NSArray *)v35;

  }
  return v9;
}

- (unsigned)reliabilityScore
{
  return 0;
}

- (id)description
{
  void *v3;
  unint64_t features;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  unint64_t type;
  unint64_t trackId;
  void *v13;
  GEOMapRegion *boundingBox;
  GEOMapRegion *orientedBoundingRegion;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  -[NSArray _geo_map:](self->_lanes, "_geo_map:", &__block_literal_global_119);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  features = self->_features;
  if ((features & 1) != 0)
    v5 = "YES";
  else
    v5 = "NO";
  if ((features & 2) != 0)
    v6 = "YES";
  else
    v6 = "NO";
  if ((features & 4) != 0)
    v7 = "YES";
  else
    v7 = "NO";
  v8 = (void *)MEMORY[0x1E0CB3940];
  v20 = v3;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  trackId = self->_trackId;
  type = self->_type;
  v19 = (void *)v10;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Invalid Track Type (%u)>"), type);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)*((_QWORD *)&off_1E1C10260 + type);
  }
  boundingBox = self->_boundingBox;
  orientedBoundingRegion = self->_orientedBoundingRegion;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ %p: %llu '%@' hasWidth: %s hasFlowLineOffsets: %s bbox: %@ hasOrientedBounds: %s oriented: %@> lanes: [%@]"), v19, self, trackId, v13, v5, v6, boundingBox, v7, orientedBoundingRegion, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __40__GEOMapFeatureRunningTrack_description__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)trackId
{
  return self->_trackId;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)features
{
  return self->_features;
}

- (GEOMapRegion)boundingBox
{
  return self->_boundingBox;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (GEOMapRegion)orientedBoundingRegion
{
  return self->_orientedBoundingRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_orientedBoundingRegion, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
}

@end
