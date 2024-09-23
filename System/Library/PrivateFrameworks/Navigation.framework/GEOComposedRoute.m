@implementation GEOComposedRoute

uint64_t __122__GEOComposedRoute_MNExtras___pointsConverge_pointCount_otherPoints_pointCount_tolerance_outCoordinatesA_outCoordinatesB___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "point");
  v7 = v6;
  objc_msgSend(v5, "point");
  if (v7 < v8)
    goto LABEL_2;
  if (v7 > v8)
  {
LABEL_4:
    v9 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "isStartOfSegment") || (objc_msgSend(v5, "isStartOfSegment") & 1) != 0)
  {
    if ((objc_msgSend(v4, "isStartOfSegment") & 1) != 0 || (objc_msgSend(v5, "isStartOfSegment") & 1) == 0)
    {
      v9 = 0;
      goto LABEL_10;
    }
    goto LABEL_4;
  }
LABEL_2:
  v9 = -1;
LABEL_10:

  return v9;
}

uint64_t __122__GEOComposedRoute_MNExtras___pointsConverge_pointCount_otherPoints_pointCount_tolerance_outCoordinatesA_outCoordinatesB___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "routeCoordinate");
  objc_msgSend(v5, "routeCoordinate");
  v6 = GEOPolylineCoordinateCompare();

  return v6;
}

void __52__GEOComposedRoute_MNExtras__userRequestedWaypoints__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isServerProvidedWaypoint") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __97__GEOComposedRoute_MNRouteDivergenceFinder___navigation_leafBoundingSectionContainingCoordinate___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;

  v6 = a2;
  v7 = v6;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v10 = v6;
    v8 = objc_msgSend(v6, "isLeaf");
    v7 = v10;
    if (v8)
    {
      v9 = objc_msgSend(v10, "containsCoordinate:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
      v7 = v10;
      if (v9)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
        v7 = v10;
      }
    }
  }
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == 0;

}

void __80__GEOComposedRoute_MNRouteDivergenceFinder___navigation_allLeafBoundingSections__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isLeaf"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
