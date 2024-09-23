@implementation GEORawRouteGeometry

- (GEORawRouteGeometry)initWithGeoWaypointRoute:(id)a3
{
  id v4;
  GEORawRouteGeometry *v5;
  void *v6;
  uint64_t v7;
  NSArray *paths;
  GEORawRouteGeometry *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEORawRouteGeometry;
  v5 = -[GEORawRouteGeometry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "routeLegs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_geo_map:", &__block_literal_global_29);
    v7 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

GEORawPathGeometry *__48__GEORawRouteGeometry_initWithGeoWaypointRoute___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEORawPathGeometry *v3;
  void *v4;
  void *v5;
  GEORawPathGeometry *v6;

  v2 = a2;
  v3 = [GEORawPathGeometry alloc];
  objc_msgSend(v2, "pathLeg");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathMapMatcherInstructions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEORawPathGeometry initWithRawData:pathMatcherInstructions:](v3, "initWithRawData:pathMatcherInstructions:", v4, v5);

  return v6;
}

- (GEORawRouteGeometry)initWithRawData:(id)a3
{
  id v4;
  GEORawRouteGeometry *v5;
  uint64_t v6;
  NSArray *paths;
  GEORawRouteGeometry *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORawRouteGeometry;
  v5 = -[GEORawRouteGeometry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_geo_map:", &__block_literal_global_37);
    v6 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

GEORawPathGeometry *__39__GEORawRouteGeometry_initWithRawData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEORawPathGeometry *v3;

  v2 = a2;
  v3 = -[GEORawPathGeometry initWithRawData:pathMatcherInstructions:]([GEORawPathGeometry alloc], "initWithRawData:pathMatcherInstructions:", v2, 0);

  return v3;
}

- (void)pathMatcherNoMatchRangesWithHandler:(id)a3
{
  void (**v3)(id, unint64_t, double, double);
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, unint64_t, double, double))a3;
  if (v3)
  {
    for (i = 0; i < -[NSArray count](self->_paths, "count"); ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pathMatcherInstructions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      objc_msgSend(v6, "noMatchs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v17;
        do
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
            objc_msgSend(v11, "stretch");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "startOffsetCm");
            objc_msgSend(v11, "stretch");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v3[2](v3, i, (float)v13 * 0.01, (float)objc_msgSend(v14, "endOffsetCm") * 0.01);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }

    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_paths, CFSTR("_paths"));
}

- (GEORawRouteGeometry)initWithCoder:(id)a3
{
  id v4;
  GEORawRouteGeometry *v5;
  uint64_t v6;
  NSArray *paths;
  GEORawRouteGeometry *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORawRouteGeometry;
  v5 = -[GEORawRouteGeometry init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_paths"));
    v6 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSArray)paths
{
  return self->_paths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
