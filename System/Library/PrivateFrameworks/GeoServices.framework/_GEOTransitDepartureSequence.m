@implementation _GEOTransitDepartureSequence

- (_GEOTransitDepartureSequence)initWithSequence:(id)a3 line:(id)a4 pbLine:(id)a5 stopInfo:(id)a6 container:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _GEOTransitDepartureSequence *v18;
  unsigned int v19;
  int64_t v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_GEOTransitDepartureSequence;
  v18 = -[_GEOTransitDepartureSequence init](&v22, sel_init);
  if (v18)
  {
    if (objc_msgSend(v15, "hasPlaceDisplayStyle"))
    {
      v19 = objc_msgSend(v15, "placeDisplayStyle");
      if (v19 > 2)
      {
LABEL_7:
        objc_storeStrong((id *)&v18->_sequence, a3);
        objc_storeStrong((id *)&v18->_line, a4);
        objc_storeStrong((id *)&v18->_stopInfo, a6);
        objc_storeStrong((id *)&v18->_container, a7);
        goto LABEL_8;
      }
      v20 = v19;
    }
    else
    {
      v20 = 0;
    }
    v18->_displayStyle = v20;
    goto LABEL_7;
  }
LABEL_8:

  return v18;
}

- (unint64_t)departureTimeDisplayStyle
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[_GEOTransitDepartureSequence frequencies](self, "frequencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDepartureSequence departures]((id *)&self->_sequence->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    if (!objc_msgSend(v4, "count"))
    {
LABEL_15:
      v11 = 5;
      goto LABEL_16;
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "hasAbsDepartureTime", (_QWORD)v13) & 1) == 0
            && !objc_msgSend(v10, "hasAbsLiveDepartureTime"))
          {

            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  v11 = -[GEOTransitLine departureTimeDisplayStyle](self->_line, "departureTimeDisplayStyle", (_QWORD)v13);
LABEL_16:

  return v11;
}

- (NSArray)departures
{
  return (NSArray *)-[GEOPDDepartureSequence departures]((id *)&self->_sequence->super.super.isa);
}

- (unint64_t)stopId
{
  GEOPDDepartureSequence *sequence;

  sequence = self->_sequence;
  if (sequence)
    return sequence->_stopId;
  else
    return 0;
}

- (NSArray)frequencies
{
  return (NSArray *)-[GEOPDDepartureSequence departureFrequencys]((id *)&self->_sequence->super.super.isa);
}

- (GEOTransitLine)line
{
  return self->_line;
}

- (unint64_t)transitId
{
  GEOPDDepartureSequence *sequence;

  sequence = self->_sequence;
  if (sequence)
    return sequence->_transitId;
  else
    return 0;
}

- (NSString)direction
{
  return -[GEOPDDepartureSequence directionNameString]((id *)&self->_sequence->super.super.isa);
}

- (NSString)headsign
{
  return -[GEOPDDepartureSequence headsignString]((id *)&self->_sequence->super.super.isa);
}

- (NSString)displayName
{
  return -[GEOPDDepartureSequence displayName]((id *)&self->_sequence->super.super.isa);
}

- (NSString)originName
{
  return -[GEOPDDepartureSequence originName]((id *)&self->_sequence->super.super.isa);
}

- (NSString)containerDisplayName
{
  return -[GEOPDDepartureSequenceContainer displayName]((id *)&self->_container->super.super.isa);
}

- (NSArray)containerLabelItems
{
  return (NSArray *)-[GEOPDDepartureSequenceContainer labels]((id *)&self->_container->super.super.isa);
}

- (NSArray)operatingHours
{
  unint64_t v2;
  GEOPDDepartureSequence *sequence;
  unint64_t operatingHoursCount;
  void *v6;
  unint64_t i;
  uint64_t v8;
  unsigned int v9;
  _GEOTimeRange *v10;
  void *v11;

  sequence = self->_sequence;
  if (sequence
    && (-[GEOPDDepartureSequence _readOperatingHours]((uint64_t)self->_sequence),
        (operatingHoursCount = sequence->_operatingHoursCount) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", sequence->_operatingHoursCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != operatingHoursCount; ++i)
    {
      v8 = -[GEOPDDepartureSequence operatingHoursAtIndex:]((uint64_t)self->_sequence, i);
      if ((~(_BYTE)v9 & 3) == 0)
      {
        v2 = v2 & 0xFFFFFFFF00000000 | v9;
        v10 = -[_GEOTimeRange initWithPDTimeRange:]([_GEOTimeRange alloc], "initWithPDTimeRange:", v8, v2);
        objc_msgSend(v6, "addObject:", v10);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (NSArray *)v11;
}

- (BOOL)isLowFrequency
{
  void *v2;
  char v3;

  -[_GEOTransitDepartureSequence line](self, "line");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "departuresAreVehicleSpecific");

  return v3;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (BOOL)areOperatingHours:(id)a3 activeForDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[_GEOTransitDepartureSequence isLowFrequency](self, "isLowFrequency"))
    v8 = 10800.0;
  else
    v8 = 5400.0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "startDate", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dateByAddingTimeInterval:", -v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateByAddingTimeInterval:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "compare:", v7) == -1 && objc_msgSend(v7, "compare:", v17) == -1)
        {

          LOBYTE(v10) = 1;
          goto LABEL_15;
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  return v10;
}

- (BOOL)isValidForDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[_GEOTransitDepartureSequence departureTimeDisplayStyle](self, "departureTimeDisplayStyle") == 3
    && (-[_GEOTransitDepartureSequence operatingHoursForDate:inTimeZone:](self, "operatingHoursForDate:inTimeZone:", v6, v7), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = -[_GEOTransitDepartureSequence areOperatingHours:activeForDate:](self, "areOperatingHours:activeForDate:", v8, v6), v8, v9))
  {
    v10 = 1;
  }
  else
  {
    -[_GEOTransitDepartureSequence firstDepartureValidForDate:](self, "firstDepartureValidForDate:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v10 = 1;
    else
      v10 = -[_GEOTransitDepartureSequence hasFrequencyAtDate:](self, "hasFrequencyAtDate:", v6);

  }
  return v10;
}

- (void)_enumerateDeparturesValidForDate:(id)a3 withBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *);
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *))a4;
  if (-[_GEOTransitDepartureSequence isLowFrequency](self, "isLowFrequency"))
    v8 = 10800.0;
  else
    v8 = 5400.0;
  v26 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[_GEOTransitDepartureSequence departures](self, "departures", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
LABEL_6:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
      objc_msgSend(v14, "departureDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "departureDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", v6);
        v18 = v17;

        v19 = v18 >= 0.0 && v18 < v8;
        if (v19
          || ((v20 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1EDF4D5C8), v18 < 60.0)? (v21 = v18 <= v20): (v21 = 1), !v21))
        {
          v7[2](v7, v14, &v26);
        }
        if (v26)
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v11)
          goto LABEL_6;
        break;
      }
    }
  }

}

- (id)firstDepartureAfterDate:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dateByAddingTimeInterval:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOTransitDepartureSequence firstDepartureOnOrAfterDate:](self, "firstDepartureOnOrAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstDepartureOnOrAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_GEOTransitDepartureSequence departures](self, "departures", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "departureDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "timeIntervalSinceDate:", v4);
          v12 = v11;

          if (v12 >= 0.0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfDeparturesAfterDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_GEOTransitDepartureSequence departures](self, "departures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "departureDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v4);
        v13 = v12;

        if (v13 > 0.0)
          ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstDepartureFrequencyOnOrAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_GEOTransitDepartureSequence frequencies](self, "frequencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "firstTimeInFrequency");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "compare:", v10);

        if (v11 != 1)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstOpenOperatingDateOnOrAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_GEOTransitDepartureSequence operatingHours](self, "operatingHours", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "compare:", v10);

        if (v11 != 1)
        {
          objc_msgSend(v9, "startDate");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstDepartureValidForDate:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__73;
  v12 = __Block_byref_object_dispose__73;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___GEOTransitDepartureSequence_firstDepartureValidForDate___block_invoke;
  v7[3] = &unk_1E1C12438;
  v7[4] = &v8;
  -[_GEOTransitDepartureSequence _enumerateDeparturesValidForDate:withBlock:](self, "_enumerateDeparturesValidForDate:withBlock:", v4, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)departuresValidForDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = [v4 alloc];
  -[_GEOTransitDepartureSequence departures](self, "departures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55___GEOTransitDepartureSequence_departuresValidForDate___block_invoke;
  v11[3] = &unk_1E1C12460;
  v9 = v8;
  v12 = v9;
  -[_GEOTransitDepartureSequence _enumerateDeparturesValidForDate:withBlock:](self, "_enumerateDeparturesValidForDate:withBlock:", v5, v11);

  return v9;
}

- (BOOL)hasFrequencyAtDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_GEOTransitDepartureSequence frequencies](self, "frequencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isValidAtDate:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (double)frequencyForSortingAtDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_GEOTransitDepartureSequence frequencies](self, "frequencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v7 = 0.0;
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isValidAtDate:", v4) & 1) != 0)
        {
          objc_msgSend(v11, "frequencyForSorting");
          v7 = v12;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)frequencyToDescribeAtDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_GEOTransitDepartureSequence frequencies](self, "frequencies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isValidAtDate:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isDepartureDateInactive:(id)a3 withReferenceDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;

  v6 = a4;
  v7 = a3;
  if (-[_GEOTransitDepartureSequence isLowFrequency](self, "isLowFrequency"))
    v8 = 10800.0;
  else
    v8 = 5400.0;
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v10 = v9;

  return v10 > v8;
}

- (id)operatingHoursForDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (qword_1ECDBC5D8 != -1)
    dispatch_once(&qword_1ECDBC5D8, &__block_literal_global_147);
  v21 = v7;
  objc_msgSend((id)_MergedGlobals_285, "setTimeZone:", v7);
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[_GEOTransitDepartureSequence operatingHours](self, "operatingHours");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_GEOTransitDepartureSequence operatingHours](self, "operatingHours");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = _MergedGlobals_285;
        objc_msgSend(v16, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v17) = objc_msgSend((id)v17, "isDate:equalToDate:toUnitGranularity:", v18, v6, 16);

        if ((v17 & 1) != 0 || objc_msgSend(v16, "contains:", v6))
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)serviceResumesAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  -[_GEOTransitDepartureSequence firstDepartureOnOrAfterDate:](self, "firstDepartureOnOrAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "departureDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_GEOTransitDepartureSequence firstDepartureFrequencyOnOrAfterDate:](self, "firstDepartureFrequencyOnOrAfterDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "firstTimeInFrequency");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v6)
    {
      objc_msgSend(v6, "earlierDate:", v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v11;
    }
    else
    {
      v6 = (id)v9;
    }
  }
  -[_GEOTransitDepartureSequence firstOpenOperatingDateOnOrAfterDate:](self, "firstOpenOperatingDateOnOrAfterDate:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if (v6)
    {
      objc_msgSend(v6, "earlierDate:", v12);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v14;
    }
    else
    {
      v6 = v12;
    }
  }

  return v6;
}

- (NSSet)nextStopIDs
{
  NSSet *nextStopIDs;
  id v4;
  unint64_t i;
  GEOPDDepartureSequence *sequence;
  unint64_t count;
  void *v8;
  NSSet *v9;
  NSSet *v10;

  nextStopIDs = self->_nextStopIDs;
  if (!nextStopIDs)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    for (i = 0; ; ++i)
    {
      sequence = self->_sequence;
      if (sequence)
      {
        -[GEOPDDepartureSequence _readNextStopIds]((uint64_t)self->_sequence);
        count = sequence->_nextStopIds.count;
      }
      else
      {
        count = 0;
      }
      if (i >= count)
        break;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOPDDepartureSequence nextStopIdAtIndex:]((uint64_t)self->_sequence, i));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v4);
    v10 = self->_nextStopIDs;
    self->_nextStopIDs = v9;

    nextStopIDs = self->_nextStopIDs;
  }
  return nextStopIDs;
}

- (BOOL)hasWalkingETA
{
  GEOPDStopInfo *stopInfo;
  _BOOL4 v3;

  stopInfo = self->_stopInfo;
  if (stopInfo)
    return (*(_BYTE *)&stopInfo->_flags >> 1) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (unint64_t)walkingETA
{
  GEOPDStopInfo *stopInfo;

  stopInfo = self->_stopInfo;
  if (stopInfo)
    return stopInfo->_walkingTime;
  else
    return 0;
}

- (NSTimeZone)timeZone
{
  id *v2;
  void *v3;
  void *v4;

  -[GEOPDStopInfo timezone]((id *)&self->_stopInfo->super.super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOTimezone identifier](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v3);
  return (NSTimeZone *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_stopInfo, 0);
  objc_storeStrong((id *)&self->_nextStopIDs, 0);
  objc_storeStrong((id *)&self->_line, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
