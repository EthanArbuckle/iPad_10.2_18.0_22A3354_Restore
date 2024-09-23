@implementation GEOComposedEnrouteNotice

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6
{
  id v10;
  id v11;
  GEOComposedEnrouteNotice *v12;
  GEOComposedEnrouteNotice *v13;
  id *p_enrouteNotice;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  GEOComposedGuidanceEvent *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  NSArray *guidanceEvents;
  id v27;
  NSArray *v29;
  uint8_t buf[16];
  objc_super v31;

  v10 = a3;
  v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)GEOComposedEnrouteNotice;
  v12 = -[GEOComposedEnrouteNotice init](&v31, sel_init);
  v13 = v12;
  if (v12)
  {
    v27 = v10;
    p_enrouteNotice = (id *)&v12->_enrouteNotice;
    objc_storeStrong((id *)&v12->_enrouteNotice, a3);
    v29 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[GEOEnrouteNotice guidances](v13->_enrouteNotice, "guidances");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      do
      {
        objc_msgSend(*p_enrouteNotice, "guidances");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "hasStartValidDistanceOffsetCm")
          && objc_msgSend(v19, "hasEndValidDistanceOffsetCm"))
        {
          v20 = [GEOComposedGuidanceEvent alloc];
          objc_msgSend(v11, "coordinates");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[GEOComposedGuidanceEvent initWithGeoGuidanceEvent:step:legIndex:coordinates:](v20, "initWithGeoGuidanceEvent:step:legIndex:coordinates:", v19, 0, a5, v21);

          if (v22)
          {
            -[NSObject setSource:](v22, "setSource:", 3);
            -[NSObject setSourceIndex:](v22, "setSourceIndex:", v17);
            -[NSObject setEnrouteNoticeIndex:](v22, "setEnrouteNoticeIndex:", a4);
            -[NSArray addObject:](v29, "addObject:", v22);
          }
        }
        else
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOComposedEnrouteNotice");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "Directions response error: a guidance event for an enroute notice must set start_valid_distance_offset_cm and end_valid_distance_offset_cm", buf, 2u);
          }
        }

        ++v17;
        objc_msgSend(*p_enrouteNotice, "guidances");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

      }
      while (v17 < v24);
    }
    guidanceEvents = v13->_guidanceEvents;
    v13->_guidanceEvents = v29;

    v10 = v27;
  }

  return v13;
}

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPosition:(id)a7
{
  id v12;
  id v13;
  GEOComposedEnrouteNotice *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  GEORouteMatcher *v19;

  v12 = a7;
  v13 = a6;
  v14 = -[GEOComposedEnrouteNotice initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:](self, "initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:", a3, a4, a5, v13);
  objc_msgSend(v12, "lat");
  v16 = v15;
  objc_msgSend(v12, "lng");
  v18 = v17;

  v19 = -[GEORouteMatcher initWithRoute:auditToken:]([GEORouteMatcher alloc], "initWithRoute:auditToken:", v13, 0);
  v14->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)-[GEORouteMatcher closestRouteCoordinateForLocationCoordinate:](v19, "closestRouteCoordinateForLocationCoordinate:", v16, v18);

  return v14;
}

- (GEOComposedEnrouteNotice)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 onRoute:(id)a6 withPolylineCoordinate:(id)a7
{
  GEOComposedEnrouteNotice *result;

  result = -[GEOComposedEnrouteNotice initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:](self, "initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:", a3, a4, a5, a6);
  result->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a7;
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[GEOEnrouteNotice hasType](self->_enrouteNotice, "hasType"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = -[GEOEnrouteNotice type](self->_enrouteNotice, "type");
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03150[(int)v5];
    }
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[GEOEnrouteNotice hasObjectIdentifier](self->_enrouteNotice, "hasObjectIdentifier"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[GEOEnrouteNotice objectIdentifier](self->_enrouteNotice, "objectIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[GEOComposedEnrouteNotice guidanceEvents](self, "guidanceEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[GEOComposedEnrouteNotice guidanceEvents](self, "guidanceEvents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Guidance Events: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int)noticeType
{
  return -[GEOEnrouteNotice type](self->_enrouteNotice, "type");
}

- (NSString)identifier
{
  return -[GEOEnrouteNotice objectIdentifier](self->_enrouteNotice, "objectIdentifier");
}

- (GEOComposedTrafficCamera)trafficCamera
{
  GEOComposedEnrouteNotice *v3;

  if (-[GEOEnrouteNotice type](self->_enrouteNotice, "type") == 1)
    v3 = self;
  else
    v3 = 0;
  return (GEOComposedTrafficCamera *)v3;
}

- (GEOComposedTrafficSignal)trafficSignal
{
  GEOComposedEnrouteNotice *v3;

  if (-[GEOEnrouteNotice type](self->_enrouteNotice, "type") == 2)
    v3 = self;
  else
    v3 = 0;
  return (GEOComposedTrafficSignal *)v3;
}

- (GEOComposedRouteAnnotation)routeAnnotation
{
  GEOComposedEnrouteNotice *v3;

  if (-[GEOEnrouteNotice type](self->_enrouteNotice, "type") == 3)
    v3 = self;
  else
    v3 = 0;
  return (GEOComposedRouteAnnotation *)v3;
}

- (BOOL)hasHighlightDistance
{
  return -[GEOEnrouteNotice hasHighlightDistance](self->_enrouteNotice, "hasHighlightDistance");
}

- (unsigned)highlightDistance
{
  return -[GEOEnrouteNotice highlightDistance](self->_enrouteNotice, "highlightDistance");
}

- (BOOL)hasGroupIdentifier
{
  return -[GEOEnrouteNotice hasObjectGroupId](self->_enrouteNotice, "hasObjectGroupId");
}

- (unsigned)groupIdentifier
{
  return -[GEOEnrouteNotice objectGroupId](self->_enrouteNotice, "objectGroupId");
}

- (BOOL)hasGroupItemHorizontalDisplayOrder
{
  return -[GEOEnrouteNotice hasGroupItemHorizontalDisplayOrder](self->_enrouteNotice, "hasGroupItemHorizontalDisplayOrder");
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return -[GEOEnrouteNotice groupItemHorizontalDisplayOrder](self->_enrouteNotice, "groupItemHorizontalDisplayOrder");
}

- (BOOL)hasGroupItemVerticalDisplayOrder
{
  return -[GEOEnrouteNotice hasGroupItemVerticalDisplayOrder](self->_enrouteNotice, "hasGroupItemVerticalDisplayOrder");
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return -[GEOEnrouteNotice groupItemVerticalDisplayOrder](self->_enrouteNotice, "groupItemVerticalDisplayOrder");
}

- (BOOL)hasPriority
{
  return -[GEOEnrouteNotice hasPriority](self->_enrouteNotice, "hasPriority");
}

- (unsigned)priority
{
  return -[GEOEnrouteNotice priority](self->_enrouteNotice, "priority");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedEnrouteNotice)initWithCoder:(id)a3
{
  id v4;
  GEOComposedEnrouteNotice *v5;
  uint64_t v6;
  GEOEnrouteNotice *enrouteNotice;
  uint64_t v8;
  NSArray *guidanceEvents;
  const void *v10;
  size_t v11;
  GEOComposedEnrouteNotice *v12;
  unint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedEnrouteNotice;
  v5 = -[GEOComposedEnrouteNotice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_enrouteNotice"));
    v6 = objc_claimAutoreleasedReturnValue();
    enrouteNotice = v5->_enrouteNotice;
    v5->_enrouteNotice = (GEOEnrouteNotice *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_guidanceEvents"));
    v8 = objc_claimAutoreleasedReturnValue();
    guidanceEvents = v5->_guidanceEvents;
    v5->_guidanceEvents = (NSArray *)v8;

    v14 = 0;
    v10 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v14);
    if (v14 && v10)
    {
      if (v14 >= 8)
        v11 = 8;
      else
        v11 = v14;
      memcpy(&v5->_routeCoordinate, v10, v11);
    }
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOEnrouteNotice *enrouteNotice;
  id v5;

  enrouteNotice = self->_enrouteNotice;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", enrouteNotice, CFSTR("_enrouteNotice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_guidanceEvents, CFSTR("_guidanceEvents"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));

}

- (NSArray)guidanceEvents
{
  return self->_guidanceEvents;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceEvents, 0);
  objc_storeStrong((id *)&self->_enrouteNotice, 0);
}

@end
