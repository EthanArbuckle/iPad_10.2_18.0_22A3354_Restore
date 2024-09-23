@implementation GEOQuickETATransitDeparturesInfo

- (GEOQuickETATransitDeparturesInfo)initWithComposedRoute:(id)a3
{
  id v4;
  GEOQuickETATransitDeparturesInfo *v5;
  GEOQuickETATransitDeparturesInfo *v6;
  void *v7;
  GEOQuickETATransitDeparturesInfo *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOQuickETATransitDeparturesInfo;
  v5 = -[GEOQuickETATransitDeparturesInfo init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEOQuickETATransitDeparturesInfo _chooseMostImportantTransitLegInRoute:](v5, "_chooseMostImportantTransitLegInRoute:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6->_departuresHaveFrequency = 0;

  }
  v8 = v6;
LABEL_6:

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)GEOQuickETATransitDeparturesInfo;
  -[GEOQuickETATransitDeparturesInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  direction : %@\n  headsign : %@\n departuresHaveFrequency : %d\n  departureFrequency : %f\n  departureFrequencyValidUntil : %@"), self->_direction, self->_headsign, self->_departuresHaveFrequency, *(_QWORD *)&self->_departureFrequency, self->_departureFrequencyValidUntil);
  return v5;
}

- (id)_chooseMostImportantTransitLegInRoute:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  objc_msgSend(a3, "segments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "type") == 6)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (NSString)direction
{
  return self->_direction;
}

- (NSString)headsign
{
  return self->_headsign;
}

- (BOOL)departuresHaveFrequency
{
  return self->_departuresHaveFrequency;
}

- (double)departureFrequency
{
  return self->_departureFrequency;
}

- (NSDate)departureFrequencyValidUntil
{
  return self->_departureFrequencyValidUntil;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureFrequencyValidUntil, 0);
  objc_storeStrong((id *)&self->_headsign, 0);
  objc_storeStrong((id *)&self->_direction, 0);
}

@end
