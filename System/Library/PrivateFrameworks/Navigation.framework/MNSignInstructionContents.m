@implementation MNSignInstructionContents

+ (id)contentsWithStep:(id)a3 destination:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    objc_msgSend(v8, "setTransportType:", objc_msgSend(v6, "transportType"));
    objc_msgSend(v8, "setDestination:", v7);
    objc_msgSend(v7, "navDisplayAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDestinationName:", v9);

    objc_msgSend(v8, "_populateFromStep:", v6);
    v10 = v8;
  }

  return v8;
}

- (void)_populateFromStep:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *normalInstructionStrings;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MNSignInstructionContents;
  v4 = a3;
  -[MNListInstructionContents _populateFromStep:](&v12, sel__populateFromStep_, v4);
  objc_msgSend(v4, "distanceStringForSignView", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNListInstructionContents setDistanceString:](self, "setDistanceString:", v5);

  objc_msgSend(v4, "normalInstructionStringsForSignView");
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  normalInstructionStrings = self->_normalInstructionStrings;
  self->_normalInstructionStrings = v6;

  objc_msgSend(v4, "geoStep");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceForSignView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNListInstructionContents setDistanceFormat:](self, "setDistanceFormat:", v9);

  objc_msgSend(v4, "geoStep");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "normalInstructionsForSignView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNSignInstructionContents setManeuverFormats:](self, "setManeuverFormats:", v11);

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

  if (-[NSArray count](self->_normalInstructionStrings, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[NSArray firstObject](self->_normalInstructionStrings, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("MNSignInstructionContents: \"%@\"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNSignInstructionContents maneuverFormats](self, "maneuverFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v11.receiver = self;
      v11.super_class = (Class)MNSignInstructionContents;
      -[MNListInstructionContents description](&v11, sel_description);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[MNSignInstructionContents maneuverFormats](self, "maneuverFormats");
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
  return 1;
}

- (id)_evaluatedStringsForInstructionStrings:(id)a3
{
  NSArray *normalInstructionStrings;
  _QWORD v5[5];

  normalInstructionStrings = self->_normalInstructionStrings;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke;
  v5[3] = &unk_1E61D37F8;
  v5[4] = self;
  -[NSArray _geo_compactMap:](normalInstructionStrings, "_geo_compactMap:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2;
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

void __68__MNSignInstructionContents__evaluatedStringsForInstructionStrings___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "type");
  if (v3 == 10)
  {
    objc_msgSend(v13, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("{Name}"));

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "destination");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navDisplayName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "token");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("{Address}"));

      if (!v10)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "destination");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navDisplayAddress");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;
    objc_msgSend(v13, "stringFormat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOverrideValue:", v11);

    goto LABEL_9;
  }
  if (v3 == 1)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_distanceFormatOptions");
    objc_msgSend(v13, "distanceFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormatOptions:", v4);
LABEL_9:

  }
LABEL_10:

}

- (unint64_t)_distanceFormatOptions
{
  if (-[MNListInstructionContents transportType](self, "transportType") == 2)
    return 3;
  else
    return 1;
}

- (id)_instructionsForFormats:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = -[MNListInstructionContents transportType](self, "transportType") == 2;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MNListInstructionContents destination](self, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navDisplayAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("{Address}"));
    -[MNListInstructionContents destination](self, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navDisplayNameWithSpecialContacts:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("{Name}"));
    -[MNListInstructionContents roadName](self, "roadName", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      -[MNListInstructionContents roadName](self, "roadName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("{Road}"));

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 2 * v6;
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), 0, v18, 0, v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "length") && (objc_msgSend(v21, "_navigation_containsVariables") & 1) == 0)
            objc_msgSend(v5, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
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
  void *v5;

  if (-[NSArray count](self->_normalInstructionStrings, "count"))
  {
    -[MNSignInstructionContents _evaluatedStringsForInstructionStrings:](self, "_evaluatedStringsForInstructionStrings:", self->_normalInstructionStrings);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MNSignInstructionContents maneuverFormats](self, "maneuverFormats");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNSignInstructionContents _instructionsForFormats:](self, "_instructionsForFormats:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_selectInstructionWithServerStringArray:isSpoken:clientBlock:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasServerContent
{
  BOOL v3;
  void *v4;

  if (-[NSArray count](self->_normalInstructionStrings, "count"))
    return 1;
  -[MNSignInstructionContents maneuverFormats](self, "maneuverFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (NSArray)maneuverFormats
{
  return self->_maneuverFormats;
}

- (void)setManeuverFormats:(id)a3
{
  objc_storeStrong((id *)&self->_maneuverFormats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maneuverFormats, 0);
  objc_storeStrong((id *)&self->_normalInstructionStrings, 0);
}

@end
