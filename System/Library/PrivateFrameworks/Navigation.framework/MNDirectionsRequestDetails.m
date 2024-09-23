@implementation MNDirectionsRequestDetails

- (MNDirectionsRequestDetails)initWithWaypoints:(id)a3 routeAttributes:(id)a4
{
  id v7;
  id v8;
  MNDirectionsRequestDetails *v9;
  MNDirectionsRequestDetails *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[MNDirectionsRequestDetails init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_maxRouteCount = 3;
    objc_storeStrong((id *)&v9->_waypoints, a3);
    objc_storeStrong((id *)&v10->_routeAttributes, a4);
    v10->_isResumingMultipointRoute = 0;
  }

  return v10;
}

- (MNDirectionsRequestDetails)initWithTracePath:(id)a3
{
  id v5;
  MNDirectionsRequestDetails *v6;
  MNDirectionsRequestDetails *v7;

  v5 = a3;
  v6 = -[MNDirectionsRequestDetails init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_maxRouteCount = 3;
    objc_storeStrong((id *)&v6->_tracePath, a3);
    v7->_isResumingMultipointRoute = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[NSArray valueForKey:](self->_waypoints, "valueForKey:", CFSTR("waypoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\twaypoints: %@ |\n\tmaxRouteCount: %d |\n\trouteAttributes: %@"), v4, self->_maxRouteCount, self->_routeAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  MNDirectionsRequestDetails *v7;
  uint64_t v8;
  char v9;
  MNDirectionsRequestDetails *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  int v75;
  void *v76;
  void *v77;

  v7 = (MNDirectionsRequestDetails *)a3;
  if (self == v7)
  {
    v9 = 1;
    goto LABEL_36;
  }
  v8 = objc_opt_class();
  if (v8 != objc_opt_class())
  {
    v9 = 0;
    goto LABEL_36;
  }
  v10 = v7;
  -[MNDirectionsRequestDetails waypoints](self, "waypoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[MNDirectionsRequestDetails waypoints](v10, "waypoints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v12 = 0;
      goto LABEL_11;
    }
  }
  -[MNDirectionsRequestDetails waypoints](self, "waypoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNDirectionsRequestDetails waypoints](v10, "waypoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToArray:", v5) & 1) != 0)
  {
    v12 = 1;
LABEL_11:
    -[MNDirectionsRequestDetails routeAttributes](self, "routeAttributes");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77
      || (-[MNDirectionsRequestDetails routeAttributes](v10, "routeAttributes"),
          (v73 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails routeAttributes](self, "routeAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails routeAttributes](v10, "routeAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v14) & 1) == 0)
      {

        v15 = v77;
        if (!v77)
          v15 = v73;

        v9 = 0;
        if ((v12 & 1) == 0)
          goto LABEL_33;
LABEL_32:

        goto LABEL_33;
      }
      v71 = v14;
      v72 = v13;
      v76 = v3;
      v74 = 1;
      v75 = v12;
    }
    else
    {
      v74 = 0;
      v75 = v12;
      v76 = v3;
      v73 = 0;
    }
    -[MNDirectionsRequestDetails traits](self, "traits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNDirectionsRequestDetails traits](v10, "traits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = v17;
    if (v18 | v19 && (v20 = objc_msgSend((id)v18, "isEqual:", v19), (id)v19, (id)v18, !v20)
      || (v21 = -[MNDirectionsRequestDetails maxRouteCount](self, "maxRouteCount"),
          v21 != -[MNDirectionsRequestDetails maxRouteCount](v10, "maxRouteCount")))
    {

      v9 = 0;
      if ((v74 & 1) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
    -[MNDirectionsRequestDetails currentUserLocation](self, "currentUserLocation");
    v70 = objc_claimAutoreleasedReturnValue();
    if (v70
      || (-[MNDirectionsRequestDetails currentUserLocation](v10, "currentUserLocation"),
          (v63 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails currentUserLocation](self, "currentUserLocation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails currentUserLocation](v10, "currentUserLocation");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v22;
      if (!objc_msgSend(v22, "isEqual:", v68))
      {
        v9 = 0;
        goto LABEL_94;
      }
      v66 = 1;
    }
    else
    {
      v63 = 0;
      v66 = 0;
    }
    -[MNDirectionsRequestDetails currentMapRegion](self, "currentMapRegion");
    v67 = objc_claimAutoreleasedReturnValue();
    if (v67
      || (-[MNDirectionsRequestDetails currentMapRegion](v10, "currentMapRegion"),
          (v58 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails currentMapRegion](self, "currentMapRegion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails currentMapRegion](v10, "currentMapRegion");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v24;
      if (!objc_msgSend(v24, "isEqual:", v64))
      {
        v9 = 0;
        goto LABEL_90;
      }
      v61 = 1;
    }
    else
    {
      v58 = 0;
      v61 = 0;
    }
    -[MNDirectionsRequestDetails directionsRequestFeedback](self, "directionsRequestFeedback");
    v62 = objc_claimAutoreleasedReturnValue();
    if (v62
      || (-[MNDirectionsRequestDetails directionsRequestFeedback](v10, "directionsRequestFeedback"),
          (v55 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails directionsRequestFeedback](self, "directionsRequestFeedback");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails directionsRequestFeedback](v10, "directionsRequestFeedback");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v25;
      if (!objc_msgSend(v25, "isEqual:", v59))
      {
        v9 = 0;
LABEL_86:

        goto LABEL_87;
      }
      v56 = 1;
    }
    else
    {
      v55 = 0;
      v56 = 0;
    }
    -[MNDirectionsRequestDetails commonOptions](self, "commonOptions");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57
      || (-[MNDirectionsRequestDetails commonOptions](v10, "commonOptions"),
          (v52 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails commonOptions](self, "commonOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails commonOptions](v10, "commonOptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v26, "isEqual:", v27) & 1) == 0)
      {

        v28 = (void *)v57;
        if (!v57)
          v28 = v52;

        v9 = 0;
        if ((v56 & 1) != 0)
          goto LABEL_86;
        goto LABEL_87;
      }
      v53 = v27;
      v51 = v26;
      v54 = 1;
    }
    else
    {
      v52 = 0;
      v54 = 0;
    }
    v29 = -[MNDirectionsRequestDetails isResumingMultipointRoute](self, "isResumingMultipointRoute");
    if (v29 != -[MNDirectionsRequestDetails isResumingMultipointRoute](v10, "isResumingMultipointRoute"))
    {
      v9 = 0;
      v30 = v53;
      if ((v54 & 1) == 0)
        goto LABEL_83;
      goto LABEL_82;
    }
    -[MNDirectionsRequestDetails tracePath](self, "tracePath");
    v30 = v53;
    v50 = objc_claimAutoreleasedReturnValue();
    if (v50
      || (-[MNDirectionsRequestDetails tracePath](v10, "tracePath"),
          (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails tracePath](self, "tracePath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails tracePath](v10, "tracePath");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v31;
      if (!objc_msgSend(v31, "isEqual:", v48))
      {
        v9 = 0;
        v30 = v53;
        v32 = v54;
LABEL_78:

LABEL_79:
        v38 = (void *)v50;
        if (!v50)
        {

          v38 = 0;
        }

        if (!v32)
        {
LABEL_83:
          v39 = (void *)v57;
          if (!v57)
          {

            v39 = 0;
          }

          if (v56)
            goto LABEL_86;
LABEL_87:
          v40 = (void *)v62;
          if (!v62)
          {

            v40 = 0;
          }

          if (!v61)
          {
LABEL_91:
            v41 = (void *)v67;
            if (!v67)
            {

              v41 = 0;
            }

            if (!v66)
            {
LABEL_95:
              v42 = (void *)v70;
              if (!v70)
              {

                v42 = 0;
              }

              if (!v74)
              {
LABEL_29:
                v3 = v76;
                if (!v77)

                if (!v75)
                  goto LABEL_33;
                goto LABEL_32;
              }
LABEL_28:

              goto LABEL_29;
            }
LABEL_94:

            goto LABEL_95;
          }
LABEL_90:

          goto LABEL_91;
        }
LABEL_82:

        goto LABEL_83;
      }
      v47 = 1;
      v30 = v53;
    }
    else
    {
      v45 = 0;
      v47 = 0;
    }
    -[MNDirectionsRequestDetails auditToken](self, "auditToken");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33
      || (-[MNDirectionsRequestDetails auditToken](v10, "auditToken"), (v43 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MNDirectionsRequestDetails auditToken](self, "auditToken", v43, v45);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestDetails auditToken](v10, "auditToken");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v33;
      v36 = v34;
      v9 = objc_msgSend(v34, "isEqual:", v35);

      if (v46)
      {

        v30 = v53;
        if ((v47 & 1) == 0)
        {
          v32 = v54;
          goto LABEL_79;
        }
        v32 = v54;
        goto LABEL_78;
      }
      v30 = v53;
      v37 = v44;
    }
    else
    {
      v37 = 0;
      v9 = 1;
    }

    v32 = v54;
    if ((v47 & 1) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }

  v9 = 0;
LABEL_33:
  if (!v11)

LABEL_36:
  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;

  -[MNDirectionsRequestDetails waypoints](self, "waypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MNDirectionsRequestDetails routeAttributes](self, "routeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + 53 * v4 + 2809;

  -[MNDirectionsRequestDetails traits](self, "traits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") + 53 * v6;

  v9 = -[MNDirectionsRequestDetails maxRouteCount](self, "maxRouteCount") + 53 * v8;
  -[MNDirectionsRequestDetails currentUserLocation](self, "currentUserLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") + 53 * v9;

  -[MNDirectionsRequestDetails currentMapRegion](self, "currentMapRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") + 53 * v11;

  -[MNDirectionsRequestDetails directionsRequestFeedback](self, "directionsRequestFeedback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash") + 53 * v13;

  -[MNDirectionsRequestDetails commonOptions](self, "commonOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash") + 53 * v15;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MNDirectionsRequestDetails isResumingMultipointRoute](self, "isResumingMultipointRoute"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash") + 53 * v17;

  -[MNDirectionsRequestDetails tracePath](self, "tracePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash") + 53 * v19;

  -[MNDirectionsRequestDetails auditToken](self, "auditToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash") + 53 * v21;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDirectionsRequestDetails)initWithCoder:(id)a3
{
  id v4;
  MNDirectionsRequestDetails *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *waypoints;
  uint64_t v11;
  GEORouteAttributes *routeAttributes;
  uint64_t v13;
  GEOMapServiceTraits *traits;
  uint64_t v15;
  GEOLocation *currentUserLocation;
  uint64_t v17;
  GEOMapRegion *currentMapRegion;
  uint64_t v19;
  GEODirectionsRequestFeedback *directionsRequestFeedback;
  uint64_t v21;
  GEOCommonOptions *commonOptions;
  uint64_t v23;
  GEOResumeRouteHandle *resumeRouteHandle;
  uint64_t v25;
  NSString *tracePath;
  uint64_t v27;
  GEOApplicationAuditToken *auditToken;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MNDirectionsRequestDetails;
  v5 = -[MNDirectionsRequestDetails init](&v30, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_waypoints"));
    v9 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeAttributes"));
    v11 = objc_claimAutoreleasedReturnValue();
    routeAttributes = v5->_routeAttributes;
    v5->_routeAttributes = (GEORouteAttributes *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traits"));
    v13 = objc_claimAutoreleasedReturnValue();
    traits = v5->_traits;
    v5->_traits = (GEOMapServiceTraits *)v13;

    v5->_maxRouteCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maxRouteCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentUserLocation"));
    v15 = objc_claimAutoreleasedReturnValue();
    currentUserLocation = v5->_currentUserLocation;
    v5->_currentUserLocation = (GEOLocation *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentMapRegion"));
    v17 = objc_claimAutoreleasedReturnValue();
    currentMapRegion = v5->_currentMapRegion;
    v5->_currentMapRegion = (GEOMapRegion *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_directionsRequestFeedback"));
    v19 = objc_claimAutoreleasedReturnValue();
    directionsRequestFeedback = v5->_directionsRequestFeedback;
    v5->_directionsRequestFeedback = (GEODirectionsRequestFeedback *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_commonOptions"));
    v21 = objc_claimAutoreleasedReturnValue();
    commonOptions = v5->_commonOptions;
    v5->_commonOptions = (GEOCommonOptions *)v21;

    v5->_isResumingMultipointRoute = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isResumingMultipointRoute"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resumeRouteHandle"));
    v23 = objc_claimAutoreleasedReturnValue();
    resumeRouteHandle = v5->_resumeRouteHandle;
    v5->_resumeRouteHandle = (GEOResumeRouteHandle *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tracePath"));
    v25 = objc_claimAutoreleasedReturnValue();
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_auditToken"));
    v27 = objc_claimAutoreleasedReturnValue();
    auditToken = v5->_auditToken;
    v5->_auditToken = (GEOApplicationAuditToken *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *waypoints;
  id v5;

  waypoints = self->_waypoints;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", waypoints, CFSTR("_waypoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeAttributes, CFSTR("_routeAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_traits, CFSTR("_traits"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maxRouteCount, CFSTR("_maxRouteCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentUserLocation, CFSTR("_currentUserLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentMapRegion, CFSTR("_currentMapRegion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_directionsRequestFeedback, CFSTR("_directionsRequestFeedback"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commonOptions, CFSTR("_commonOptions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isResumingMultipointRoute, CFSTR("_isResumingMultipointRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resumeRouteHandle, CFSTR("_resumeRouteHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tracePath, CFSTR("_tracePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auditToken, CFSTR("_auditToken"));

}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (unint64_t)maxRouteCount
{
  return self->_maxRouteCount;
}

- (void)setMaxRouteCount:(unint64_t)a3
{
  self->_maxRouteCount = a3;
}

- (GEOLocation)currentUserLocation
{
  return self->_currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (GEOMapRegion)currentMapRegion
{
  return self->_currentMapRegion;
}

- (void)setCurrentMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_currentMapRegion, a3);
}

- (GEODirectionsRequestFeedback)directionsRequestFeedback
{
  return self->_directionsRequestFeedback;
}

- (void)setDirectionsRequestFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_directionsRequestFeedback, a3);
}

- (GEOCommonOptions)commonOptions
{
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
  objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_storeStrong((id *)&self->_tracePath, a3);
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_directionsRequestFeedback, 0);
  objc_storeStrong((id *)&self->_currentMapRegion, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
