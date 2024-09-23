@implementation GEOComposedTransitTripRouteSegment

- (GEOComposedTransitTripRouteSegment)initWithComposedRoute:(id)a3 rideSelections:(id)a4 sectionOptions:(id)a5 decoderData:(id)a6 tripIndex:(unint64_t)a7 stepRange:(_NSRange)a8 transitStepRange:(_NSRange)a9 pointRange:(_NSRange)a10 segmentIndex:(unint64_t)a11
{
  id v15;
  id v16;
  GEOComposedTransitTripRouteSegment *v17;
  GEOComposedTransitTripRouteSegment *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  unsigned int v49;
  void *v50;
  _GEOTransitSystem *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  _GEOTransitLine *v57;
  _GEOTransitLine *v58;
  void *v59;
  uint64_t v60;
  NSArray *actionSheetDescriptions;
  uint64_t v62;
  NSArray *routeDetailsOptionsArtwork;
  uint64_t v64;
  NSArray *actionSheetOptionsArtwork;
  uint64_t v66;
  NSArray *transitLineOptions;
  uint64_t v68;
  NSArray *alightNotifications;
  GEOComposedTransitTripRouteSegment *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  objc_super v83;

  v15 = a3;
  v73 = a4;
  v72 = a5;
  v16 = a6;
  v83.receiver = self;
  v83.super_class = (Class)GEOComposedTransitTripRouteSegment;
  v17 = -[GEOComposedTransitBaseRouteSegment initWithComposedRoute:stepRange:transitStepRange:pointRange:segmentIndex:](&v83, sel_initWithComposedRoute_stepRange_transitStepRange_pointRange_segmentIndex_, v15, a8.location, a8.length, a9.location, a9.length, a10.location, a10.length, a11);
  v18 = v17;
  if (v17)
  {
    v17->_boardStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    v17->_alightStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    v17->_blockTransferStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v15, "supportsRideClusters"))
    {
      if (objc_msgSend(v73, "count") <= a7)
      {
        v18->_selectedRideOptionIndex = 0;
      }
      else
      {
        objc_msgSend(v73, "objectAtIndexedSubscript:", a7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18->_selectedRideOptionIndex = objc_msgSend(v19, "unsignedIntegerValue");

      }
      v71 = v18;
      if (objc_msgSend(v72, "count") <= a7)
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v72, "objectAtIndexedSubscript:", a7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = objc_msgSend(v20, "sectionsCount");
      v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
      v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
      v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
      v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v21);
      v76 = v21;
      if (v21)
      {
        v22 = 0;
        v74 = v20;
        v75 = v15;
        while (1)
        {
          v23 = objc_msgSend(v20, "sectionAtIndex:", v22);
          objc_msgSend(v15, "suggestedRoute");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sectionAtIndex:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "boardStepForSection:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "actionSheetName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");

          if (v28)
            break;
          if (objc_msgSend(v26, "vehicleInfosCount"))
          {
            objc_msgSend(v26, "vehicleInfoAtIndex:", 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "lineIndex");

            v29 = 0;
            if (objc_msgSend(v16, "linesCount") > (unint64_t)v33)
            {
              objc_msgSend(v16, "lineAtIndex:", v33);
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v29 = 0;
          }
          -[__CFString nameDisplayString](v29, "nameDisplayString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "length");

          if (!v35)
          {
            v30 = v77;
            v31 = &stru_1E1C241D0;
            goto LABEL_13;
          }
          -[__CFString nameDisplayString](v29, "nameDisplayString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addObject:", v36);

LABEL_20:
          if (objc_msgSend(v25, "routeDetailsArtworkIndexsCount"))
          {
            v37 = objc_msgSend(v25, "routeDetailsArtworkIndexs");
            v38 = objc_msgSend(v25, "routeDetailsArtworkIndexsCount");
          }
          else
          {
            v37 = objc_msgSend(v26, "routeDetailsPrimaryArtworkIndexs");
            v38 = objc_msgSend(v26, "routeDetailsPrimaryArtworkIndexsCount");
          }
          objc_msgSend(v16, "artworkFromIndices:count:", v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v81, "addObject:", v39);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObject:", v40);

          }
          if (objc_msgSend(v25, "actionSheetArtworkIndexsCount"))
          {
            v41 = objc_msgSend(v25, "actionSheetArtworkIndexs");
            v42 = objc_msgSend(v25, "actionSheetArtworkIndexsCount");
          }
          else
          {
            v41 = objc_msgSend(v26, "routeDetailsPrimaryArtworkIndexs");
            v42 = objc_msgSend(v26, "routeDetailsPrimaryArtworkIndexsCount");
          }
          objc_msgSend(v16, "artworkFromIndices:count:", v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend(v79, "addObject:", v43);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "addObject:", v44);

          }
          objc_msgSend(v26, "vehicleInfos");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v46, "hasLineIndex")
            && (v47 = objc_msgSend(v46, "lineIndex"), objc_msgSend(v16, "linesCount") > (unint64_t)v47))
          {
            objc_msgSend(v16, "lineAtIndex:", objc_msgSend(v46, "lineIndex"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v48 = 0;
          }
          if (objc_msgSend(v48, "hasSystemIndex")
            && (v49 = objc_msgSend(v48, "systemIndex"), objc_msgSend(v16, "systemsCount") > (unint64_t)v49))
          {
            objc_msgSend(v16, "systemAtIndex:", objc_msgSend(v48, "systemIndex"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v51 = -[_GEOTransitSystem initWithSystem:]([_GEOTransitSystem alloc], "initWithSystem:", v50);
              if (v48)
                goto LABEL_42;
            }
            else
            {
              v51 = 0;
              if (v48)
              {
LABEL_42:
                v52 = -180.0;
                v53 = -180.0;
                if (v26)
                {
                  objc_msgSend(v26, "location");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "coordinate");
                  v53 = v55;
                  v52 = v56;

                }
                v57 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", v48, v51, v53, v52);
                if (v57)
                  goto LABEL_46;
              }
            }
          }
          else
          {
            v51 = 0;
            v50 = 0;
            if (v48)
              goto LABEL_42;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v57 = (_GEOTransitLine *)objc_claimAutoreleasedReturnValue();
LABEL_46:
          v58 = v57;
          objc_msgSend(v78, "addObject:", v57);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v25, "disableAlightNotifications") ^ 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "addObject:", v59);

          ++v22;
          v15 = v75;
          v20 = v74;
          if (v76 == v22)
            goto LABEL_51;
        }
        objc_msgSend(v25, "actionSheetName");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v30 = v77;
        v31 = v29;
LABEL_13:
        objc_msgSend(v30, "addObject:", v31);
        goto LABEL_20;
      }
LABEL_51:
      v60 = objc_msgSend(v77, "copy");
      v18 = v71;
      actionSheetDescriptions = v71->_actionSheetDescriptions;
      v71->_actionSheetDescriptions = (NSArray *)v60;

      v62 = objc_msgSend(v81, "copy");
      routeDetailsOptionsArtwork = v71->_routeDetailsOptionsArtwork;
      v71->_routeDetailsOptionsArtwork = (NSArray *)v62;

      v64 = objc_msgSend(v79, "copy");
      actionSheetOptionsArtwork = v71->_actionSheetOptionsArtwork;
      v71->_actionSheetOptionsArtwork = (NSArray *)v64;

      v66 = objc_msgSend(v78, "copy");
      transitLineOptions = v71->_transitLineOptions;
      v71->_transitLineOptions = (NSArray *)v66;

      v68 = objc_msgSend(v82, "copy");
      alightNotifications = v71->_alightNotifications;
      v71->_alightNotifications = (NSArray *)v68;

    }
  }

  return v18;
}

- (int64_t)type
{
  return 6;
}

- (void)_cacheStepData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    self->_numberOfTransitStops = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOComposedRouteSegment steps](self, "steps", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          switch(objc_msgSend(v11, "maneuver"))
          {
            case 3u:
              v12 = (objc_class *)objc_msgSend(v11, "stepIndex");
              v13 = 72;
              goto LABEL_13;
            case 4u:
              objc_msgSend(v11, "transitVehicle");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "pickupDropoffType");

              if (v15 != 100)
                ++self->_numberOfTransitStops;
              continue;
            case 5u:
              v12 = (objc_class *)objc_msgSend(v11, "stepIndex");
              v13 = 80;
              goto LABEL_13;
            case 9u:
              v12 = (objc_class *)objc_msgSend(v11, "stepIndex");
              v13 = 88;
LABEL_13:
              *(Class *)((char *)&self->super.super.super.isa + v13) = v12;
              break;
            default:
              continue;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)_needsStepData
{
  return self->_boardStepIndex == 0x7FFFFFFFFFFFFFFFLL
      && self->_alightStepIndex == 0x7FFFFFFFFFFFFFFFLL
      && self->_blockTransferStepIndex == 0x7FFFFFFFFFFFFFFFLL;
}

- (GEOComposedTransitTripRouteStep)boardStep
{
  void *v3;
  void *v4;

  if (-[GEOComposedTransitTripRouteSegment _needsStepData](self, "_needsStepData"))
    -[GEOComposedTransitTripRouteSegment _cacheStepData](self, "_cacheStepData");
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepAtIndex:", self->_boardStepIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v4;
}

- (GEOComposedTransitTripRouteStep)alightStep
{
  void *v3;
  void *v4;

  if (-[GEOComposedTransitTripRouteSegment _needsStepData](self, "_needsStepData"))
    -[GEOComposedTransitTripRouteSegment _cacheStepData](self, "_cacheStepData");
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepAtIndex:", self->_alightStepIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOComposedTransitTripRouteStep *)v4;
}

- (id)blockTransferStep
{
  void *v3;
  void *v4;

  if (-[GEOComposedTransitTripRouteSegment _needsStepData](self, "_needsStepData"))
    -[GEOComposedTransitTripRouteSegment _cacheStepData](self, "_cacheStepData");
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stepAtIndex:", self->_blockTransferStepIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)rideOptionsCount
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsRideClusters");

  if (!v4)
    return 1;
  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionOptionForTripSegment:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionsCount");

  return v7;
}

- (void)setSelectedRideOptionIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  id v7;

  if (self->_selectedRideOptionIndex != a3)
  {
    self->_selectedRideOptionIndex = a3;
    -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsRideClusters");

    if (v6)
    {
      -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tripSegment:didSelectRide:", self, a3);

    }
  }
}

- (id)routeDetailsPrimaryArtworkForRideOption:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsRideClusters");

  if (v6
    && (-[NSArray objectAtIndexedSubscript:](self->_routeDetailsOptionsArtwork, "objectAtIndexedSubscript:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[NSArray objectAtIndexedSubscript:](self->_routeDetailsOptionsArtwork, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)actionSheetArtworkForRideOption:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[GEOComposedRouteSegment composedRoute](self, "composedRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsRideClusters");

  if (v6
    && (-[NSArray objectAtIndexedSubscript:](self->_actionSheetOptionsArtwork, "objectAtIndexedSubscript:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    -[NSArray objectAtIndexedSubscript:](self->_actionSheetOptionsArtwork, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)actionSheetDescriptionForRideOption:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_actionSheetDescriptions, "objectAtIndexedSubscript:", a3);
}

- (id)transitLineForRideOption:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_transitLineOptions, "objectAtIndexedSubscript:", a3);
}

- (GEOTransitSystem)transitSystem
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment alightStep](self, "alightStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
  }
  objc_msgSend(v4, "transitSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitSystem *)v5;
}

- (GEOTransitLine)transitLine
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment alightStep](self, "alightStep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
  }
  objc_msgSend(v4, "transitLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOTransitLine *)v5;
}

- (NSTimeZone)departureTimeZone
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "departureTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTimeZone *)v7;
}

- (NSDate)departureTime
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "departureTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v7;
}

- (NSArray)departureTimes
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "departureTimes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (double)departureFrequencyMin
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "transitVehicle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "departureFrequencyMin");

  return v8;
}

- (double)departureFrequencyMax
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "transitVehicle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "departureFrequencyMax");

  return v8;
}

- (unint64_t)numberOfTransitStops
{
  if (-[GEOComposedTransitTripRouteSegment _needsStepData](self, "_needsStepData"))
    -[GEOComposedTransitTripRouteSegment _cacheStepData](self, "_cacheStepData");
  return self->_numberOfTransitStops;
}

- (NSDate)lastStepArrivalDate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[GEOComposedRouteSegment remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:](self, "remainingTimeAlongSegmentFromStepIndex:currentStepRemainingDistance:", objc_msgSend(v3, "stepIndex"), 0.0);
    v5 = v4;
    objc_msgSend(v3, "departureTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSDate *)v7;
}

- (NSArray)routeLineArtwork
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOComposedTransitTripRouteSegment boardStep](self, "boardStep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[GEOComposedTransitTripRouteSegment blockTransferStep](self, "blockTransferStep");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[GEOComposedTransitTripRouteSegment alightStep](self, "alightStep");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v10;
      goto LABEL_9;
    }
  }
  objc_msgSend(v3, "getNextStep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v10 = v3;
LABEL_9:
    objc_msgSend(v10, "routeLineArtwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "getNextStep");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeLineArtwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "routeLineArtwork");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return (NSArray *)v9;
}

- (BOOL)notifyBeforeAlightStep
{
  void *v2;
  char v3;

  -[NSArray objectAtIndex:](self->_alightNotifications, "objectAtIndex:", self->_selectedRideOptionIndex);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTransitTripRouteSegment)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTransitTripRouteSegment *v5;
  uint64_t v6;
  NSArray *actionSheetDescriptions;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *routeDetailsOptionsArtwork;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *actionSheetOptionsArtwork;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *transitLineOptions;
  uint64_t v24;
  NSArray *alightNotifications;
  GEOComposedTransitTripRouteSegment *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOComposedTransitTripRouteSegment;
  v5 = -[GEOComposedTransitBaseRouteSegment initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_boardStepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_boardStepIndex"));
    v5->_alightStepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_alightStepIndex"));
    v5->_blockTransferStepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_blockTransferStepIndex"));
    v5->_numberOfTransitStops = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_numberOfTransitStops"));
    v5->_selectedRideOptionIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_selectedRideOptionIndex"));
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_actionSheetDescriptions"));
    v6 = objc_claimAutoreleasedReturnValue();
    actionSheetDescriptions = v5->_actionSheetDescriptions;
    v5->_actionSheetDescriptions = (NSArray *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_routeDetailsOptionsArtwork"));
    v11 = objc_claimAutoreleasedReturnValue();
    routeDetailsOptionsArtwork = v5->_routeDetailsOptionsArtwork;
    v5->_routeDetailsOptionsArtwork = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_actionSheetOptionsArtwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    actionSheetOptionsArtwork = v5->_actionSheetOptionsArtwork;
    v5->_actionSheetOptionsArtwork = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_transitLineOptions"));
    v22 = objc_claimAutoreleasedReturnValue();
    transitLineOptions = v5->_transitLineOptions;
    v5->_transitLineOptions = (NSArray *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_alightNotifications"));
    v24 = objc_claimAutoreleasedReturnValue();
    alightNotifications = v5->_alightNotifications;
    v5->_alightNotifications = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTransitTripRouteSegment;
  v4 = a3;
  -[GEOComposedTransitBaseRouteSegment encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_boardStepIndex, CFSTR("_boardStepIndex"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_alightStepIndex, CFSTR("_alightStepIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_blockTransferStepIndex, CFSTR("_blockTransferStepIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numberOfTransitStops, CFSTR("_numberOfTransitStops"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectedRideOptionIndex, CFSTR("_selectedRideOptionIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionSheetDescriptions, CFSTR("_actionSheetDescriptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeDetailsOptionsArtwork, CFSTR("_routeDetailsOptionsArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionSheetOptionsArtwork, CFSTR("_actionSheetOptionsArtwork"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transitLineOptions, CFSTR("_transitLineOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alightNotifications, CFSTR("_alightNotifications"));

}

- (unint64_t)selectedRideOptionIndex
{
  return self->_selectedRideOptionIndex;
}

- (NSArray)transitLineOptions
{
  return self->_transitLineOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alightNotifications, 0);
  objc_storeStrong((id *)&self->_transitLineOptions, 0);
  objc_storeStrong((id *)&self->_actionSheetOptionsArtwork, 0);
  objc_storeStrong((id *)&self->_routeDetailsOptionsArtwork, 0);
  objc_storeStrong((id *)&self->_actionSheetDescriptions, 0);
}

@end
