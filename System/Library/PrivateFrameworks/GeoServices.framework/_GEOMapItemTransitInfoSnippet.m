@implementation _GEOMapItemTransitInfoSnippet

- (_GEOMapItemTransitInfoSnippet)initWithTransitInfoSnippet:(id)a3
{
  id v5;
  _GEOMapItemTransitInfoSnippet *v6;
  _GEOMapItemTransitInfoSnippet *v7;
  id **p_transitInfoSnippet;
  GEOPDTransitInfoSnippet *transitInfoSnippet;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  NSArray *labelItems;
  id v14;
  id *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _GEOMapItemTransitInfoSnippetLabelItem *v22;
  id *v23;
  id v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  _GEOMapItemTransitInfoSnippetLabelItem *v32;
  _GEOMapItemTransitInfoSnippetLabelItem *v33;
  uint64_t v34;
  NSArray *v35;
  id *v36;
  void *v37;
  uint64_t v38;
  NSString *displayName;
  _GEOMapItemTransitInfoSnippet *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_GEOMapItemTransitInfoSnippet;
  v6 = -[_GEOMapItemTransitInfoSnippet init](&v50, sel_init);
  v7 = v6;
  if (v6)
  {
    p_transitInfoSnippet = (id **)&v6->_transitInfoSnippet;
    objc_storeStrong((id *)&v6->_transitInfoSnippet, a3);
    transitInfoSnippet = v7->_transitInfoSnippet;
    if (transitInfoSnippet)
    {
      -[GEOPDTransitInfoSnippet _readLabels]((uint64_t)v7->_transitInfoSnippet);
      v10 = -[NSMutableArray count](transitInfoSnippet->_labels, "count");
      v11 = *p_transitInfoSnippet;
      if (v10)
      {
        -[GEOPDTransitInfoSnippet labels](*p_transitInfoSnippet);
        v12 = objc_claimAutoreleasedReturnValue();
        labelItems = v7->_labelItems;
        v7->_labelItems = (NSArray *)v12;
LABEL_33:

        goto LABEL_34;
      }
      if (v11)
      {
        -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)*p_transitInfoSnippet);
        if (objc_msgSend(v11[3], "count"))
        {
          v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v15 = *p_transitInfoSnippet;
          if (*p_transitInfoSnippet)
          {
            -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)*p_transitInfoSnippet);
            v16 = objc_msgSend(v15[3], "count");
          }
          else
          {
            v16 = 0;
          }
          labelItems = (NSArray *)objc_msgSend(v14, "initWithCapacity:", v16);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          -[GEOPDTransitInfoSnippet artworks](*p_transitInfoSnippet);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v47 != v20)
                  objc_enumerationMutation(v17);
                v22 = -[_GEOMapItemTransitInfoSnippetLabelItem initWithType:labelString:labelArtwork:]([_GEOMapItemTransitInfoSnippetLabelItem alloc], "initWithType:labelString:labelArtwork:", 1, 0, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
                if (v22)
                  -[NSArray addObject:](labelItems, "addObject:", v22);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
            }
            while (v19);
          }
LABEL_32:

          v34 = -[NSArray copy](labelItems, "copy");
          v35 = v7->_labelItems;
          v7->_labelItems = (NSArray *)v34;

          goto LABEL_33;
        }
        v23 = *p_transitInfoSnippet;
        if (*p_transitInfoSnippet)
        {
          -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)*p_transitInfoSnippet);
          if (!objc_msgSend(v23[8], "count"))
          {
LABEL_34:
            v36 = *p_transitInfoSnippet;
            if (v36)
            {
              -[GEOPDTransitInfoSnippet _readSearchDisplayName]((uint64_t)v36);
              if (v36[5])
              {
                -[GEOPDTransitInfoSnippet searchDisplayName]((id *)&v7->_transitInfoSnippet->super.super.isa);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "copy");
                displayName = v7->_displayName;
                v7->_displayName = (NSString *)v38;

              }
            }
            goto LABEL_37;
          }
          v24 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v25 = *p_transitInfoSnippet;
          if (*p_transitInfoSnippet)
          {
            -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)*p_transitInfoSnippet);
            v26 = objc_msgSend(v25[8], "count");
          }
          else
          {
            v26 = 0;
          }
          labelItems = (NSArray *)objc_msgSend(v24, "initWithCapacity:", v26);
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          -[GEOPDTransitInfoSnippet systemNames](*p_transitInfoSnippet);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v43;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v43 != v29)
                  objc_enumerationMutation(v17);
                v31 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
                v32 = [_GEOMapItemTransitInfoSnippetLabelItem alloc];
                v33 = -[_GEOMapItemTransitInfoSnippetLabelItem initWithType:labelString:labelArtwork:](v32, "initWithType:labelString:labelArtwork:", 2, v31, 0, (_QWORD)v42);
                if (v33)
                  -[NSArray addObject:](labelItems, "addObject:", v33);

              }
              v28 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            }
            while (v28);
          }
          goto LABEL_32;
        }
      }
    }
LABEL_37:
    v40 = v7;
  }

  return v7;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)labelItems
{
  return self->_labelItems;
}

- (NSArray)connections
{
  return 0;
}

- (NSArray)systems
{
  return 0;
}

- (unint64_t)systemsCount
{
  return 0;
}

- (NSArray)lines
{
  return 0;
}

- (unint64_t)linesCount
{
  return 0;
}

- (id)linesForSystem:(id)a3
{
  return 0;
}

- (NSArray)incidents
{
  return 0;
}

- (BOOL)hasTransitIncidentComponent
{
  return 0;
}

- (BOOL)isTransitIncidentsTTLExpired
{
  return 0;
}

- (NSArray)departureSequences
{
  return 0;
}

- (double)timeToLive
{
  return 0.0;
}

- (NSDate)lastFullScheduleValidDate
{
  return 0;
}

- (unint64_t)numAdditionalDeparturesForSequence:(id)a3
{
  return 0;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 direction:(id)a5 validForDateFromBlock:(id)a6
{
  return 0;
}

- (id)departureSequencesForSystem:(id)a3 excludingIncidentEntities:(id)a4 container:(id)a5 validForDateFromBlock:(id)a6
{
  return 0;
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5 hasSequencesWithNoDirection:(BOOL *)a6
{
  return 0;
}

- (id)directionsForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  return 0;
}

- (id)departureSequenceContainersForSystem:(id)a3 excludingIncidentEntities:(id)a4 validForDateFromBlock:(id)a5
{
  return 0;
}

- (id)allSequencesForSystem:(id)a3 direction:(id)a4
{
  return 0;
}

- (id)allSequencesForSystem:(id)a3 container:(id)a4
{
  return 0;
}

- (id)serviceResumesResultForLine:(id)a3 excludingIncidentEntities:(id)a4 afterDate:(id)a5 usingContainers:(BOOL)a6
{
  return 0;
}

- (id)inactiveLinesForSystem:(id)a3 relativeToDateFromBlock:(id)a4 excludingIncidentEntities:(id)a5 usingContainers:(BOOL)a6
{
  return 0;
}

- (id)headSignsForLine:(id)a3
{
  return 0;
}

- (NSArray)transitTripStops
{
  return 0;
}

- (NSString)title
{
  return 0;
}

- (NSString)subtitle
{
  return 0;
}

- (GEOComposedRoute)composedRoute
{
  return 0;
}

- (GEOTransitNearbySchedule)nearbySchedule
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_labelItems, 0);
  objc_storeStrong((id *)&self->_transitInfoSnippet, 0);
}

@end
