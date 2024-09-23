@implementation MKDirectionsResponse

- (id)_initWithGEORouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MKDirectionsResponse *v18;
  id *p_isa;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  id v59;
  id v60;
  id *v61;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v76.receiver = self;
  v76.super_class = (Class)MKDirectionsResponse;
  v18 = -[MKDirectionsResponse init](&v76, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (!v18)
    goto LABEL_31;
  objc_storeStrong((id *)&v18->_geoResponse, a3);
  objc_msgSend(v16, "geoMapItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = p_isa[2];
  p_isa[2] = (id)v21;

  objc_msgSend(v17, "geoMapItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v23);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = p_isa[3];
  p_isa[3] = (id)v24;

  objc_msgSend(p_isa[2], "name");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26
    || (v27 = (void *)v26,
        objc_msgSend(p_isa[2], "name"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "length"),
        v28,
        v27,
        !v29))
  {
    objc_msgSend(v15, "source");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[2], "setName:", v31);

  }
  objc_msgSend(p_isa[3], "name");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32
    || (v33 = (void *)v32,
        objc_msgSend(p_isa[3], "name"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v34, "length"),
        v34,
        v33,
        !v35))
  {
    objc_msgSend(v15, "destination");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[3], "setName:", v37);

  }
  if (objc_msgSend(v15, "_includeRoutePoints"))
  {
    v38 = objc_alloc(MEMORY[0x1E0D274D8]);
    v64 = v17;
    v65 = v16;
    v79[0] = v16;
    v79[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v14;
    objc_msgSend(v14, "routeAttributes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v38, "initWithWaypoints:routeAttributes:directionsResponse:", v39, v40, v13);

    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v63 = v41;
    objc_msgSend(v41, "allRoutes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v73 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          v50 = objc_msgSend(v49, "routeType");
          v51 = v43;
          if (v50)
          {
            v52 = objc_msgSend(v49, "routeType");
            v51 = v42;
            if (v52 != 1)
              continue;
          }
          objc_msgSend(v51, "addObject:", v49);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
      }
      while (v46);
    }
    v67 = v13;

    objc_msgSend(v43, "addObjectsFromArray:", v42);
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v43, "count"));
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v54 = v43;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v69 != v57)
            objc_enumerationMutation(v54);
          v59 = -[MKRoute _initWithGEOComposedRoute:]([MKRoute alloc], "_initWithGEOComposedRoute:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j));
          if (v59)
            objc_msgSend(v53, "addObject:", v59);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v56);
    }

    v60 = p_isa[4];
    p_isa[4] = v53;

    v14 = v66;
    v13 = v67;
    v17 = v64;
    v16 = v65;
  }
  if (objc_msgSend(p_isa[4], "count"))
    v61 = p_isa;
  else
LABEL_31:
    v61 = 0;

  return v61;
}

+ (id)_responseWithGEODirectionsRouteResponse:(id)a3 routeRequest:(id)a4 request:(id)a5 origin:(id)a6 destination:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v14, "routesCount") || objc_msgSend(v14, "waypointRoutesCount"))
  {
    v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithGEORouteResponse:routeRequest:request:origin:destination:", v14, v15, v16, v17, v18);
    if (!a8)
      goto LABEL_6;
  }
  else
  {
    v19 = 0;
    if (!a8)
      goto LABEL_6;
  }
  if (!v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    *a8 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", MKErrorDomain, 5, 0);
  }
LABEL_6:

  return v19;
}

- (NSString)_incidentDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[GEODirectionsResponse incidentsOnRoutesAtIndex:](self->_geoResponse, "incidentsOnRoutesAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[MKTrafficSupport sharedTrafficSupport](MKTrafficSupport, "sharedTrafficSupport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedTitleForGEOIncidentType:laneType:laneCount:", objc_msgSend(v2, "type"), objc_msgSend(v2, "laneClosureType"), objc_msgSend(v2, "laneClosureCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)_mapsURL
{
  MKMapItem *destination;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  destination = self->_destination;
  v11[0] = self->_source;
  v11[1] = destination;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("MKLaunchOptionsLaunchIntoRoute");
  -[GEODirectionsResponse data](self->_geoResponse, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKMapItem urlForMapItems:options:](MKMapItem, "urlForMapItems:options:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (GEODirectionsResponse)_geoResponse
{
  return self->_geoResponse;
}

- (MKMapItem)source
{
  return self->_source;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (NSArray)routes
{
  return self->_routes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_geoResponse, 0);
}

@end
