@implementation GEOComposedWalkingUncertainArrivalRouteStep

- (GEOComposedWalkingUncertainArrivalRouteStep)initWithComposedRoute:(id)a3 aggregatedGEOSteps:(id)a4 stepIndex:(unint64_t)a5 pointRange:(_NSRange)a6 maneuverPointRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  void *v15;
  GEOComposedWalkingUncertainArrivalRouteStep *v16;
  GEOComposedWalkingUncertainArrivalRouteStep *v17;
  objc_super v19;

  length = a6.length;
  location = a6.location;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  v16 = -[GEOComposedWalkingRouteStep initWithComposedRoute:geoRouteLeg:geoStep:stepIndex:pointRange:maneuverPointRange:](&v19, sel_initWithComposedRoute_geoRouteLeg_geoStep_stepIndex_pointRange_maneuverPointRange_, v14, 0, v15, a5, location, length, a7.location, a7.length);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_aggregatedGEOSteps, a4);
    v17 = v16;
  }

  return v16;
}

- (BOOL)isUncertainArrival
{
  return 1;
}

- (unsigned)duration
{
  unsigned int result;

  result = self->_aggregatedStepsDuration;
  if (!result)
  {
    result = -[GEOComposedWalkingUncertainArrivalRouteStep _calculateAggregatedStepsDuration](self, "_calculateAggregatedStepsDuration");
    self->_aggregatedStepsDuration = result;
  }
  return result;
}

- (unsigned)_calculateAggregatedStepsDuration
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_aggregatedGEOSteps;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "expectedTime", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)distance
{
  double result;

  result = self->_aggregatedStepsDistance;
  if (result == 0.0)
  {
    -[GEOComposedWalkingUncertainArrivalRouteStep _calculateAggregatedStepsDistance](self, "_calculateAggregatedStepsDistance");
    self->_aggregatedStepsDistance = result;
  }
  return result;
}

- (double)_calculateAggregatedStepsDistance
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  float v8;
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
  v2 = self->_aggregatedGEOSteps;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "distanceMeters", (_QWORD)v10);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedWalkingUncertainArrivalRouteStep)initWithCoder:(id)a3
{
  id v4;
  GEOComposedWalkingUncertainArrivalRouteStep *v5;
  uint64_t v6;
  NSArray *aggregatedGEOSteps;
  double v8;
  GEOComposedWalkingUncertainArrivalRouteStep *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  v5 = -[GEOComposedRouteStep initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_aggregatedGEOSteps"));
    v6 = objc_claimAutoreleasedReturnValue();
    aggregatedGEOSteps = v5->_aggregatedGEOSteps;
    v5->_aggregatedGEOSteps = (NSArray *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_aggregatedStepsDistance"));
    v5->_aggregatedStepsDistance = v8;
    v5->_aggregatedStepsDuration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_aggregatedStepsDuration"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedWalkingUncertainArrivalRouteStep;
  v4 = a3;
  -[GEOComposedRouteStep encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_aggregatedGEOSteps, CFSTR("_aggregatedGEOSteps"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_aggregatedStepsDistance"), self->_aggregatedStepsDistance);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_aggregatedStepsDuration, CFSTR("_aggregatedStepsDuration"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedGEOSteps, 0);
}

@end
