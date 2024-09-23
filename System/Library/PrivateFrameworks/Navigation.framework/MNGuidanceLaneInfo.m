@implementation MNGuidanceLaneInfo

- (MNGuidanceLaneInfo)initWithID:(id)a3 isForManeuver:(BOOL)a4 lanes:(id)a5 titles:(id)a6 instructions:(id)a7 variableOverrides:(id)a8 distanceDetailLevel:(int64_t)a9 composedGuidanceEventIndex:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  MNGuidanceLaneInfo *v20;
  MNGuidanceLaneInfo *v21;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v24 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MNGuidanceLaneInfo;
  v20 = -[MNGuidanceLaneInfo init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uniqueID, a3);
    v21->_isForManeuver = a4;
    objc_storeStrong((id *)&v21->_lanes, a5);
    objc_storeStrong((id *)&v21->_titles, a6);
    objc_storeStrong((id *)&v21->_instructions, a7);
    objc_storeStrong((id *)&v21->_variableOverrides, a8);
    v21->_distanceDetailLevel = a9;
    v21->_composedGuidanceEventIndex = a10;
  }

  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  descriptionForLaneInfos();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);
  -[NSArray firstObject](self->_titles, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v5, 0, 0, 0, self->_variableOverrides);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "addObject:", v6);

  }
  -[NSArray firstObject](self->_instructions, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "formatTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "type");
    v12 = (void *)MEMORY[0x1E0CB3940];
    if (v11 == 11)
    {
      objc_msgSend(v10, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("{%@}"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", v8, 0, 0, 0, self->_variableOverrides);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v3, "addObject:", v14);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceLaneInfo)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceLaneInfo *v5;
  uint64_t v6;
  NSUUID *uniqueID;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *lanes;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *titles;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *instructions;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *primaryStrings;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *secondaryStrings;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  NSDictionary *variableOverrides;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MNGuidanceLaneInfo;
  v5 = -[MNGuidanceLaneInfo init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UniqueID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSUUID *)v6;

    v5->_isForManeuver = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsForManeuver"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Lanes"));
    v11 = objc_claimAutoreleasedReturnValue();
    lanes = v5->_lanes;
    v5->_lanes = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("Titles"));
    v16 = objc_claimAutoreleasedReturnValue();
    titles = v5->_titles;
    v5->_titles = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("Instructions"));
    v21 = objc_claimAutoreleasedReturnValue();
    instructions = v5->_instructions;
    v5->_instructions = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("_primaryStrings"));
    v26 = objc_claimAutoreleasedReturnValue();
    primaryStrings = v5->_primaryStrings;
    v5->_primaryStrings = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("_secondaryStrings"));
    v31 = objc_claimAutoreleasedReturnValue();
    secondaryStrings = v5->_secondaryStrings;
    v5->_secondaryStrings = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    v35 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("VariableOverrides"));
    v37 = objc_claimAutoreleasedReturnValue();
    variableOverrides = v5->_variableOverrides;
    v5->_variableOverrides = (NSDictionary *)v37;

    v5->_distanceDetailLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DistanceDetailLevel"));
    v5->_composedGuidanceEventIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ComposedGuidanceEventIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[MNGuidanceLaneInfo uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MNGuidanceLaneInfo uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v5, CFSTR("UniqueID"));

  }
  objc_msgSend(v14, "encodeBool:forKey:", -[MNGuidanceLaneInfo isForManeuver](self, "isForManeuver"), CFSTR("IsForManeuver"));
  -[MNGuidanceLaneInfo lanes](self, "lanes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MNGuidanceLaneInfo lanes](self, "lanes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v7, CFSTR("Lanes"));

  }
  -[MNGuidanceLaneInfo titles](self, "titles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MNGuidanceLaneInfo titles](self, "titles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v9, CFSTR("Titles"));

  }
  -[MNGuidanceLaneInfo instructions](self, "instructions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MNGuidanceLaneInfo instructions](self, "instructions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("Instructions"));

  }
  objc_msgSend(v14, "encodeObject:forKey:", self->_primaryStrings, CFSTR("_primaryStrings"));
  objc_msgSend(v14, "encodeObject:forKey:", self->_secondaryStrings, CFSTR("_secondaryStrings"));
  -[MNGuidanceLaneInfo variableOverrides](self, "variableOverrides");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MNGuidanceLaneInfo variableOverrides](self, "variableOverrides");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("VariableOverrides"));

  }
  objc_msgSend(v14, "encodeInteger:forKey:", -[MNGuidanceLaneInfo distanceDetailLevel](self, "distanceDetailLevel"), CFSTR("DistanceDetailLevel"));
  objc_msgSend(v14, "encodeInt32:forKey:", -[MNGuidanceLaneInfo composedGuidanceEventIndex](self, "composedGuidanceEventIndex"), CFSTR("ComposedGuidanceEventIndex"));

}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)isForManeuver
{
  return self->_isForManeuver;
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (NSDictionary)variableOverrides
{
  return self->_variableOverrides;
}

- (int64_t)distanceDetailLevel
{
  return self->_distanceDetailLevel;
}

- (int)composedGuidanceEventIndex
{
  return self->_composedGuidanceEventIndex;
}

- (NSArray)titles
{
  return self->_titles;
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (NSArray)primaryStrings
{
  return self->_primaryStrings;
}

- (void)setPrimaryStrings:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStrings, a3);
}

- (NSArray)secondaryStrings
{
  return self->_secondaryStrings;
}

- (void)setSecondaryStrings:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryStrings, 0);
  objc_storeStrong((id *)&self->_primaryStrings, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_variableOverrides, 0);
  objc_storeStrong((id *)&self->_lanes, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
