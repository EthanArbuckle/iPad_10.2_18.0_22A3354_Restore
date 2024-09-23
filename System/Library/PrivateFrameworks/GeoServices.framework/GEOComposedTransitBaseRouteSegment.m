@implementation GEOComposedTransitBaseRouteSegment

- (GEOComposedTransitBaseRouteSegment)initWithComposedRoute:(id)a3 stepRange:(_NSRange)a4 transitStepRange:(_NSRange)a5 pointRange:(_NSRange)a6 segmentIndex:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  GEOComposedTransitBaseRouteSegment *v9;
  GEOComposedTransitBaseRouteSegment *v10;
  GEOComposedTransitBaseRouteSegment *v11;
  objc_super v13;

  length = a5.length;
  location = a5.location;
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  v9 = -[GEOComposedRouteSegment initWithComposedRoute:stepRange:pointRange:segmentIndex:](&v13, sel_initWithComposedRoute_stepRange_pointRange_segmentIndex_, a3, a4.location, a4.length, a6.location, a6.length, a7);
  v10 = v9;
  if (v9)
  {
    v9->_transitStepRange.location = location;
    v9->_transitStepRange.length = length;
    v11 = v9;
  }

  return v10;
}

- (id)startingTransitStop
{
  _NSRange *p_transitStepRange;
  NSUInteger location;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;

  p_transitStepRange = &self->_transitStepRange;
  location = self->_transitStepRange.location;
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestedRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stepsCount");

  if (location < v7)
  {
    -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestedRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stepsAtIndex:", location);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "maneuverType") == 7)
    {
      v11 = location + 1;
      if (v11 < p_transitStepRange->location || v11 - p_transitStepRange->location >= p_transitStepRange->length)
        goto LABEL_15;
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestedRoute");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "stepsCount");

      if (v11 >= v15)
        goto LABEL_15;
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "suggestedRoute");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stepsAtIndex:", v11);
      v18 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v18;
    }
    if (objc_msgSend(v10, "hasStartingStopIndex"))
      v19 = objc_msgSend(v10, "startingStopIndex");
    else
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stops");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v19 < v23)
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stops");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      return v20;
    }
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v20 = 0;
  return v20;
}

- (id)endingTransitStop
{
  _NSRange *p_transitStepRange;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v5;
  unint64_t v6;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;

  p_transitStepRange = &self->_transitStepRange;
  location = self->_transitStepRange.location;
  length = self->_transitStepRange.length;
  v5 = length + location;
  v6 = length + location - 1;
  if (v6 >= location && length - 1 < length)
  {
    -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestedRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "stepsCount");

    if (v6 < v11)
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "suggestedRoute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stepsAtIndex:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "maneuverType") == 8)
      {
        if (v5 - 2 < p_transitStepRange->location
          || v5 - 2 - p_transitStepRange->location >= p_transitStepRange->length)
        {
          goto LABEL_19;
        }
        -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "suggestedRoute");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "stepsCount");

        if (v5 - 2 >= v18)
          goto LABEL_19;
        -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "suggestedRoute");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stepsAtIndex:", v5 - 2);
        v21 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v21;
      }
      if (objc_msgSend(v14, "hasEndingStopIndex"))
        v22 = objc_msgSend(v14, "endingStopIndex");
      else
        v22 = 0x7FFFFFFFFFFFFFFFLL;
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stops");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v22 < v26)
      {
        -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stops");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        return v23;
      }
LABEL_19:
      v23 = 0;
      goto LABEL_20;
    }
  }
  v23 = 0;
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitBaseRouteSegment)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitBaseRouteSegment *v5;
  void *v6;
  NSUInteger v7;
  GEOComposedTransitBaseRouteSegment *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  v5 = -[GEOComposedRouteSegment initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_transitStepRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transitStepRange.location = objc_msgSend(v6, "rangeValue");
    v5->_transitStepRange.length = v7;
    v8 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedTransitBaseRouteSegment;
  v4 = a3;
  -[GEOComposedRouteSegment encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_transitStepRange.location, self->_transitStepRange.length, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_transitStepRange"));

}

- (_NSRange)transitStepRange
{
  _NSRange *p_transitStepRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_transitStepRange = &self->_transitStepRange;
  location = self->_transitStepRange.location;
  length = p_transitStepRange->length;
  result.length = length;
  result.location = location;
  return result;
}

@end
