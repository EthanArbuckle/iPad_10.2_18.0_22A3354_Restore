@implementation MNRouteDivergenceResults

- (id)description
{
  NSArray **p_results;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  NSUUID *routeID;
  void *v20;
  void *v21;
  NSArray *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_results = &self->_results;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_results, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *p_results;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "routeCoordinate");
        GEOPolylineCoordinateAsString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "locationCoordinate");
        v11 = v10;
        objc_msgSend(v7, "locationCoordinate");
        v13 = v12;
        v14 = objc_msgSend(v7, "resultType");
        v15 = CFSTR("None");
        if (v14 == 1)
          v15 = CFSTR("Divergence");
        if (v14 == 2)
          v15 = CFSTR("Convergence");
        v16 = v15;
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%f, %f) - %@"), v9, v11, v13, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v17);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  v18 = (void *)MEMORY[0x1E0CB3940];
  routeID = self->_routeID;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n    "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Route ID: %@\n    %@"), routeID, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
  objc_storeStrong((id *)&self->_routeID, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
