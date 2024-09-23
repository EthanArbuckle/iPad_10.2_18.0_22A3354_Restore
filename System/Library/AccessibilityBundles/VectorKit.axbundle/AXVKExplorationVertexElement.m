@implementation AXVKExplorationVertexElement

- (AXVKExplorationVertexElement)initWithCoordinates:(id)a3 betweenRoads:(id)a4
{
  double var1;
  double var0;
  id v7;
  AXVKExplorationVertexElement *v8;
  uint64_t v9;
  NSMutableArray *edges;
  uint64_t v11;
  NSMutableArray *neighbors;
  uint64_t v13;
  NSMutableArray *roads;
  void *v15;
  void *v16;
  AXVKExplorationVertexElement *v17;
  objc_super v19;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AXVKExplorationVertexElement;
  v8 = -[AXVKExplorationVertexElement init](&v19, sel_init);
  if (v8 && objc_msgSend(v7, "count"))
  {
    v9 = objc_opt_new();
    edges = v8->_edges;
    v8->_edges = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    neighbors = v8->_neighbors;
    v8->_neighbors = (NSMutableArray *)v11;

    v13 = objc_msgSend(v7, "mutableCopy");
    roads = v8->_roads;
    v8->_roads = (NSMutableArray *)v13;

    v8->_coordinates.latitude = var0;
    v8->_coordinates.longitude = var1;
    objc_msgSend(v7, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_mapView, v16);

    v8->_isDeadEnd = objc_msgSend(v7, "count") == 1;
    v17 = v8;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setIsComputed:(BOOL)a3
{
  void *v5;
  void *v6;

  if (!a3)
  {
    -[AXVKExplorationVertexElement neighbors](self, "neighbors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[AXVKExplorationVertexElement edges](self, "edges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

  }
  self->_isComputed = a3;
}

- (void)setRoads:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *roads;

  v4 = (NSMutableArray *)a3;
  if (!-[NSMutableArray count](v4, "count"))
    _AXAssert();
  roads = self->_roads;
  self->_roads = v4;

}

- (id)connectingRoadWith:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[AXVKExplorationVertexElement edges](self, "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v9, "vertices", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v10);
              if (*(id *)(*((_QWORD *)&v16 + 1) + 8 * j) == v4)
              {
                objc_msgSend(v9, "road");
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v6);
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (CGPoint)getScreenPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[AXVKExplorationVertexElement mapView](self, "mapView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVKExplorationVertexElement coordinates](self, "coordinates");
  objc_msgSend(v3, "accessibilityConvertCoordinateToWindow:");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXVKExplorationVertexElement roads](self, "roads", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "trueLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (v10)
          AXVectorKitLocString(CFSTR("UNNAMED_ROAD"));
        else
          objc_msgSend(v8, "trueLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  AXFormatAndListWithElements();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%p: "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXVKExplorationVertexElement roads](self, "roads");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "trueLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (!v12)
        {
          objc_msgSend(v10, "trueLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" - "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v14);

  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinates.latitude;
  longitude = self->_coordinates.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinates:(id)a3
{
  self->_coordinates = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (VKMapView)mapView
{
  return (VKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (BOOL)isComputed
{
  return self->_isComputed;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (BOOL)isDeadEnd
{
  return self->_isDeadEnd;
}

- (void)setIsDeadEnd:(BOOL)a3
{
  self->_isDeadEnd = a3;
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
  objc_storeStrong((id *)&self->_neighbors, a3);
}

- (NSMutableArray)roads
{
  return self->_roads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roads, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_destroyWeak((id *)&self->_mapView);
}

@end
