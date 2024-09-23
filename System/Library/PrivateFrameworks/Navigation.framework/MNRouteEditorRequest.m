@implementation MNRouteEditorRequest

- (MNRouteEditorRequest)init
{
  MNRouteEditorRequest *v2;
  MNRouteEditorRequest *v3;
  MNRouteEditorRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNRouteEditorRequest;
  v2 = -[MNRouteEditorRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_action = 0;
    -[MNRouteEditorRequest setTraits:](v2, "setTraits:", 0);
    v4 = v3;
  }

  return v3;
}

- (id)newAnchorPoints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[MNRouteEditorRequest currentRoute](self, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E20];
  -[MNRouteEditorRequest anchorPoints](self, "anchorPoints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "minusSet:", v7);
  return v11;
}

- (void)setTraits:(id)a3
{
  id v4;
  void *v5;
  GEOMapServiceTraits *traits;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultTraits");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "useOnlineToOfflineFailoverRequestModeIfAllowed");
  traits = self->_traits;
  self->_traits = (GEOMapServiceTraits *)v4;

}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (GEOComposedRouteAnchorPointList)anchorPoints
{
  return self->_anchorPoints;
}

- (void)setAnchorPoints:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPoints, a3);
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOMapItemClientAttributes)clientAttributes
{
  return self->_clientAttributes;
}

- (void)setClientAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_clientAttributes, a3);
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (void)setCurrentRoute:(id)a3
{
  objc_storeStrong((id *)&self->_currentRoute, a3);
}

- (GEOComposedGeometryRoutePersistentData)undoRedoRouteData
{
  return self->_undoRedoRouteData;
}

- (void)setUndoRedoRouteData:(id)a3
{
  objc_storeStrong((id *)&self->_undoRedoRouteData, a3);
}

- (GEODirectionsServiceRequest)directionsServiceRequest
{
  return self->_directionsServiceRequest;
}

- (void)setDirectionsServiceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_directionsServiceRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsServiceRequest, 0);
  objc_storeStrong((id *)&self->_undoRedoRouteData, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_anchorPoints, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
}

@end
