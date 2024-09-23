@implementation MNListInstructionContents

+ (id)contentsWithStep:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    objc_msgSend(v5, "setTransportType:", objc_msgSend(v4, "transportType"));
    objc_msgSend(v5, "_populateFromStep:", v4);
    v6 = v5;
  }

  return v5;
}

- (MNListInstructionContents)init
{
  MNListInstructionContents *v2;
  MNListInstructionContents *v3;
  MNListInstructionContents *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNListInstructionContents;
  v2 = -[MNListInstructionContents init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_maneuverType = 0x400000000;
    v2->_suppressFallback = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_populateFromStep:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *instructionStrings;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "distance");
  -[MNListInstructionContents setDistance:](self, "setDistance:");
  objc_msgSend(v4, "distanceStringForListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNListInstructionContents setDistanceString:](self, "setDistanceString:", v5);

  objc_msgSend(v4, "instructionStringsForListView");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  instructionStrings = self->_instructionStrings;
  self->_instructionStrings = v6;

  objc_msgSend(v4, "geoStep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceForListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNListInstructionContents setDistanceFormat:](self, "setDistanceFormat:", v9);

  objc_msgSend(v4, "geoStep");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "instructionsForListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNListInstructionContents setInstructionFormats:](self, "setInstructionFormats:", v10);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  if (-[NSArray count](self->_instructionStrings, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray firstObject](self->_instructionStrings, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("MNListInstructionContents: \"%@\"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNListInstructionContents instructionFormats](self, "instructionFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v11.receiver = self;
      v11.super_class = (Class)MNListInstructionContents;
      -[MNListInstructionContents description](&v11, sel_description);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[MNListInstructionContents instructionFormats](self, "instructionFormats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_navigation_stringForServerFormattedString:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)context
{
  return 2;
}

- (id)_evaluatedStringsForInstructionStrings:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke;
  v4[3] = &unk_1E61D37F8;
  v4[4] = self;
  objc_msgSend(a3, "_geo_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2;
  v8[3] = &unk_1E61D37D0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v2 = a2;
  objc_msgSend(v2, "optionsWithArgumentHandler:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringResultWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "success"))
  {
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v4, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __68__MNListInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "type") == 1)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_distanceFormatOptions");
    objc_msgSend(v5, "distanceFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFormatOptions:", v3);

  }
}

- (unint64_t)_distanceFormatOptions
{
  if (-[MNListInstructionContents transportType](self, "transportType") == 2)
    return 3;
  else
    return 1;
}

- (id)stringForDistance:(double)a3
{
  double v5;
  double v6;
  int64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a3 < 0.0)
  {
    -[MNListInstructionContents distance](self, "distance");
    v5 = v6;
  }
  v7 = -[MNListInstructionContents context](self, "context");
  v8 = v7 != 0;
  if (self->_distanceString)
  {
    -[MNListInstructionContents distanceString](self, "distanceString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__MNListInstructionContents_stringForDistance___block_invoke;
    v19[3] = &unk_1E61D8270;
    v19[4] = self;
    *(double *)&v19[5] = a3;
    objc_msgSend(v9, "optionsWithArgumentHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOComposedString stringWithOptions:](self->_distanceString, "stringWithOptions:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v7;
    v13 = 2 * (-[MNListInstructionContents transportType](self, "transportType") == 2);
    if (v5 >= 0.0)
    {
      v20 = CFSTR("{distance}");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[MNListInstructionContents distanceFormat](self, "distanceFormat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v17, v8, v13, v12 == 0, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __47__MNListInstructionContents_stringForDistance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "type") == 1)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_distanceFormatOptions");
    objc_msgSend(v10, "distanceFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFormatOptions:", v3);

    if (*(double *)(a1 + 40) >= 0.0)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3758]);
      v6 = *(double *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithDoubleValue:unit:", v7, v6);
      objc_msgSend(v10, "distanceFormat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOverrideValue:", v8);

    }
  }

}

- (id)_instructionsForFormats:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v15 = 0u;
    v16 = 0u;
    v6 = -[MNListInstructionContents transportType](self, "transportType") == 2;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 2 * v6;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), 0, v10, 0, 0, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length") && (objc_msgSend(v13, "_navigation_containsVariables") & 1) == 0)
            objc_msgSend(v5, "addObject:", v13);

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)instructionWithShorterAlternatives
{
  void *v3;
  void *v4;

  if (-[NSArray count](self->_instructionStrings, "count"))
  {
    -[MNListInstructionContents _evaluatedStringsForInstructionStrings:](self, "_evaluatedStringsForInstructionStrings:", self->_instructionStrings);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNListInstructionContents instructionFormats](self, "instructionFormats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNListInstructionContents _instructionsForFormats:](self, "_instructionsForFormats:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)instruction
{
  void *v2;
  void *v3;

  -[MNListInstructionContents instructionWithShorterAlternatives](self, "instructionWithShorterAlternatives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasServerContent
{
  BOOL v3;
  void *v4;

  if (-[NSArray count](self->_instructionStrings, "count"))
    return 1;
  -[MNListInstructionContents instructionFormats](self, "instructionFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (void)setRoadName:(id)a3
{
  objc_storeStrong((id *)&self->_roadName, a3);
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (GEOServerFormattedString)distanceFormat
{
  return self->_distanceFormat;
}

- (void)setDistanceFormat:(id)a3
{
  objc_storeStrong((id *)&self->_distanceFormat, a3);
}

- (NSArray)instructionFormats
{
  return self->_instructionFormats;
}

- (void)setInstructionFormats:(id)a3
{
  objc_storeStrong((id *)&self->_instructionFormats, a3);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
  objc_storeStrong((id *)&self->_destinationName, a3);
}

- (BOOL)suppressNames
{
  return self->_suppressNames;
}

- (void)setSuppressNames:(BOOL)a3
{
  self->_suppressNames = a3;
}

- (BOOL)suppressFallback
{
  return self->_suppressFallback;
}

- (void)setSuppressFallback:(BOOL)a3
{
  self->_suppressFallback = a3;
}

- (GEOComposedString)distanceString
{
  return self->_distanceString;
}

- (void)setDistanceString:(id)a3
{
  objc_storeStrong((id *)&self->_distanceString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceString, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_instructionStrings, 0);
  objc_storeStrong((id *)&self->_towardNames, 0);
  objc_storeStrong((id *)&self->_branchNames, 0);
  objc_storeStrong((id *)&self->_exitNumber, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_intersectionName, 0);
  objc_storeStrong((id *)&self->_instructionFormats, 0);
  objc_storeStrong((id *)&self->_distanceFormat, 0);
}

@end
