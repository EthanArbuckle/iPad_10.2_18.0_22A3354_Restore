@implementation GEOComposedRoute(MNRouteDivergenceFinder)

- (id)_navigation_rootBoundingSection
{
  void *v4;
  uint64_t v6;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = 0;
    objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", 0, objc_msgSend(a1, "endRouteCoordinate"), &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (MNRouteDivergenceFinderBoundingSection)_navigation_boundingSectionForRange:()MNRouteDivergenceFinder leafIndex:
{
  MNRouteDivergenceFinderBoundingSection *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((GEOPolylineCoordinateRangeIsInvalid() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "distanceBetweenRouteCoordinate:andRouteCoordinate:", a3, a4);
    v11 = v10;
    v9 = objc_alloc_init(MNRouteDivergenceFinderBoundingSection);
    -[MNRouteDivergenceFinderBoundingSection setRange:](v9, "setRange:", a3, a4);
    -[MNRouteDivergenceFinderBoundingSection setLength:](v9, "setLength:", v11);
    objc_msgSend(a1, "distance");
    v13 = v12 / 1000.0;
    v14 = 1609.0;
    if (v13 >= 1609.0)
    {
      objc_msgSend(a1, "distance");
      v14 = v15 / 1000.0;
    }
    v16 = v11 <= v14 || (int)a3 + 1 >= a4;
    if (v16
      || (objc_msgSend(a1, "routeCoordinateForDistance:afterRouteCoordinate:", a3, v11 * 0.5),
          v17 = GEOPolylineCoordinateNearestIndex(),
          (GEOPolylineCoordinateEqual() & 1) != 0)
      || (GEOPolylineCoordinateEqual() & 1) != 0)
    {
      a3 = a3;
      if (a3 <= (unint64_t)a4)
      {
        v18 = a4 + 1;
        v19 = -180.0;
        v20 = 180.0;
        v21 = 180.0;
        v22 = -180.0;
        do
        {
          objc_msgSend(a1, "pointAt:", a3);
          v20 = fmin(v20, v23);
          v21 = fmin(v21, v24);
          v19 = fmax(v19, v23);
          v22 = fmax(v22, v24);
          ++a3;
        }
        while (v18 != a3);
      }
      GEOMapRectForCoordinateRegion();
      -[MNRouteDivergenceFinderBoundingSection setBoundingRect:](v9, "setBoundingRect:");
      ++*a5;
      -[MNRouteDivergenceFinderBoundingSection setLeafIndex:](v9, "setLeafIndex:");
    }
    else
    {
      objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", a3, v17, a5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_navigation_boundingSectionForRange:leafIndex:", v17, a4, a5);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (!v26 || !v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating child bounding sections"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = 136315394;
          v34 = "left != nil && right != nil";
          v35 = 2112;
          v36 = v31;
          _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "Assertion failed: (%s) '%@'", (uint8_t *)&v33, 0x16u);
        }

      }
      -[MNRouteDivergenceFinderBoundingSection setLeft:](v9, "setLeft:", v26);
      -[MNRouteDivergenceFinderBoundingSection setRight:](v9, "setRight:", v28);
      -[MNRouteDivergenceFinderBoundingSection left](v9, "left");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "boundingRect");
      -[MNRouteDivergenceFinderBoundingSection right](v9, "right");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "boundingRect");
      GEOMapRectUnion();
      -[MNRouteDivergenceFinderBoundingSection setBoundingRect:](v9, "setBoundingRect:");

      -[MNRouteDivergenceFinderBoundingSection setLeafIndex:](v9, "setLeafIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  return v9;
}

- (id)_navigation_leafBoundingSectionForRouteCoordinate:()MNRouteDivergenceFinder
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "_navigation_rootBoundingSection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "range");
  if (GEOPolylineCoordinateInRange())
  {
    if (v1)
    {
      while ((objc_msgSend(v1, "isLeaf") & 1) == 0)
      {
        objc_msgSend(v1, "left");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if (v2
          && (objc_msgSend(v1, "left"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "range"),
              v4 = GEOPolylineCoordinateInRange(),
              v3,
              v2,
              v4))
        {
          objc_msgSend(v1, "left");
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v1, "right");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v6
            || (objc_msgSend(v1, "right"),
                v7 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v7, "range"),
                v8 = GEOPolylineCoordinateInRange(),
                v7,
                v6,
                !v8))
          {

            v1 = 0;
            break;
          }
          objc_msgSend(v1, "right");
          v5 = objc_claimAutoreleasedReturnValue();
        }
        v9 = (void *)v5;

        v1 = v9;
        if (!v9)
          break;
      }
    }
    v1 = v1;
    v10 = v1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_navigation_leafBoundingSectionContainingCoordinate:()MNRouteDivergenceFinder
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_msgSend(a1, "_navigation_rootBoundingSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__10;
    v16 = __Block_byref_object_dispose__10;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__GEOComposedRoute_MNRouteDivergenceFinder___navigation_leafBoundingSectionContainingCoordinate___block_invoke;
    v11[3] = &unk_1E61D71E0;
    v11[4] = &v12;
    *(double *)&v11[5] = a2;
    *(double *)&v11[6] = a3;
    *(double *)&v11[7] = a4;
    objc_msgSend(v7, "traverseWithHandler:", v11);
    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_navigation_rootBoundingSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafSectionsIntersectingSection:paddingMapPoints:", v4, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_navigation_leafBoundingSectionsIntersectingSection:()MNRouteDivergenceFinder paddingMapPoints:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "_navigation_rootBoundingSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leafSectionsIntersectingSection:paddingMapPoints:", v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_navigation_allLeafBoundingSections
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a1, "_navigation_rootBoundingSection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__GEOComposedRoute_MNRouteDivergenceFinder___navigation_allLeafBoundingSections__block_invoke;
    v7[3] = &unk_1E61D7208;
    v3 = v2;
    v8 = v3;
    objc_msgSend(v1, "traverseWithHandler:", v7);
    if (objc_msgSend(v3, "count"))
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
