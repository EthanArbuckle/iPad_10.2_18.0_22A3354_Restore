@implementation GEOComposedETARouteLeg

- (double)travelDuration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_steps;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "travelDuration", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  unint64_t v4;

  -[NSArray lastObject](self->_steps, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)log10((double)(unint64_t)objc_msgSend(v3, "stepID")) + 1;

  return -[GEOComposedETARouteLeg descriptionWithPrecision:](self, "descriptionWithPrecision:", v4);
}

- (id)descriptionWithPrecision:(unint64_t)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_steps, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_steps;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "descriptionWithPrecision:", a3, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedETARouteLeg)initWithCoder:(id)a3
{
  id v4;
  GEOComposedETARouteLeg *v5;
  double v6;
  uint64_t v7;
  NSArray *steps;
  uint64_t v9;
  GEOComposedRouteEVChargingStationInfo *chargingStationInfo;
  uint64_t v11;
  GEOWaypointInfo *originWaypointInfo;
  uint64_t v13;
  GEOWaypointInfo *destinationWaypointInfo;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedETARouteLeg;
  v5 = -[GEOComposedETARouteLeg init](&v16, sel_init);
  if (v5)
  {
    v5->_originalLegIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_originalLegIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_length"));
    v5->_length = v6;
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_steps"));
    v7 = objc_claimAutoreleasedReturnValue();
    steps = v5->_steps;
    v5->_steps = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chargingStationInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    chargingStationInfo = v5->_chargingStationInfo;
    v5->_chargingStationInfo = (GEOComposedRouteEVChargingStationInfo *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originWaypointInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    originWaypointInfo = v5->_originWaypointInfo;
    v5->_originWaypointInfo = (GEOWaypointInfo *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_destinationWaypointInfo"));
    v13 = objc_claimAutoreleasedReturnValue();
    destinationWaypointInfo = v5->_destinationWaypointInfo;
    v5->_destinationWaypointInfo = (GEOWaypointInfo *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t originalLegIndex;
  id v5;

  originalLegIndex = self->_originalLegIndex;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", originalLegIndex, CFSTR("_originalLegIndex"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_length"), self->_length);
  objc_msgSend(v5, "encodeObject:forKey:", self->_steps, CFSTR("_steps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chargingStationInfo, CFSTR("_chargingStationInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originWaypointInfo, CFSTR("_originWaypointInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationWaypointInfo, CFSTR("_destinationWaypointInfo"));

}

- (unint64_t)originalLegIndex
{
  return self->_originalLegIndex;
}

- (void)setOriginalLegIndex:(unint64_t)a3
{
  self->_originalLegIndex = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (GEOComposedRouteEVChargingStationInfo)chargingStationInfo
{
  return self->_chargingStationInfo;
}

- (void)setChargingStationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_chargingStationInfo, a3);
}

- (GEOWaypointInfo)originWaypointInfo
{
  return self->_originWaypointInfo;
}

- (void)setOriginWaypointInfo:(id)a3
{
  objc_storeStrong((id *)&self->_originWaypointInfo, a3);
}

- (GEOWaypointInfo)destinationWaypointInfo
{
  return self->_destinationWaypointInfo;
}

- (void)setDestinationWaypointInfo:(id)a3
{
  objc_storeStrong((id *)&self->_destinationWaypointInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationWaypointInfo, 0);
  objc_storeStrong((id *)&self->_originWaypointInfo, 0);
  objc_storeStrong((id *)&self->_chargingStationInfo, 0);
  objc_storeStrong((id *)&self->_steps, 0);
}

@end
