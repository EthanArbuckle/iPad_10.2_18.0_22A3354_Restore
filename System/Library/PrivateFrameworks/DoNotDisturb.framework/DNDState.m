@implementation DNDState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  DNDStringFromInterruptionSuppressionState(-[DNDState suppressionState](self, "suppressionState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDState startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromModeAssertionLifetimeType(-[DNDState userVisibleTransitionLifetimeType](self, "userVisibleTransitionLifetimeType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDState activeModeIdentifier](self, "activeModeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; suppressionState: %@; startDate: %@; userVisibleTransitionDate: %@; userVisibleTransitionLifetimeType: %@; activeModeConfiguration: %@; activeModeIdentifier: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)userVisibleTransitionLifetimeType
{
  return self->_userVisibleTransitionLifetimeType;
}

- (NSDate)userVisibleTransitionDate
{
  return self->_userVisibleTransitionDate;
}

- (unint64_t)suppressionState
{
  return self->_suppressionState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)activeModeIdentifier
{
  NSString *overrideModeIdentifier;
  NSString *v3;
  void *v4;
  void *v5;

  overrideModeIdentifier = self->_overrideModeIdentifier;
  if (overrideModeIdentifier)
  {
    v3 = overrideModeIdentifier;
  }
  else
  {
    -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modeIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (DNDModeConfiguration)activeModeConfiguration
{
  return self->_activeModeConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDState suppressionState](self, "suppressionState"), CFSTR("suppressionState"));
  -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("activeModeAssertionMetadata"));

  -[DNDState startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("userVisibleTransitionDate"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DNDState userVisibleTransitionLifetimeType](self, "userVisibleTransitionLifetimeType"), CFSTR("userVisibleTransitionLifetimeType"));
  -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("activeModeConfiguration"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_overrideModeIdentifier, CFSTR("overrideModeIdentifier"));
}

- (NSArray)activeModeAssertionMetadata
{
  return (NSArray *)(id)-[NSArray copy](self->_activeModeAssertionMetadata, "copy");
}

- (DNDState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  DNDState *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suppressionState"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("activeModeAssertionMetadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVisibleTransitionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userVisibleTransitionLifetimeType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeModeConfiguration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("overrideModeIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[DNDState initWithSuppressionState:activeModeAssertionMetadata:startDate:userVisibleTransitionDate:userVisibleTransitionLifetimeType:activeModeConfiguration:](self, "initWithSuppressionState:activeModeAssertionMetadata:startDate:userVisibleTransitionDate:userVisibleTransitionLifetimeType:activeModeConfiguration:", v5, v9, v10, v11, v12, v13);
  -[DNDState setOverrideModeIdentifier:](v15, "setOverrideModeIdentifier:", v14);

  return v15;
}

- (void)setOverrideModeIdentifier:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString **p_overrideModeIdentifier;
  NSString *overrideModeIdentifier;
  char v9;
  NSString *v10;

  v5 = (NSString *)a3;
  overrideModeIdentifier = self->_overrideModeIdentifier;
  p_overrideModeIdentifier = &self->_overrideModeIdentifier;
  v6 = overrideModeIdentifier;
  if (overrideModeIdentifier != v5)
  {
    v10 = v5;
    if (!v5 || !v6 || (v9 = -[NSString isEqual:](v6, "isEqual:", v5), v5 = v10, (v9 & 1) == 0))
    {
      objc_storeStrong((id *)p_overrideModeIdentifier, a3);
      v5 = v10;
    }
  }

}

- (DNDState)initWithSuppressionState:(unint64_t)a3 activeModeAssertionMetadata:(id)a4 startDate:(id)a5 userVisibleTransitionDate:(id)a6 userVisibleTransitionLifetimeType:(unint64_t)a7 activeModeConfiguration:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  DNDState *v18;
  DNDState *v19;
  uint64_t v20;
  NSArray *activeModeAssertionMetadata;
  uint64_t v22;
  NSDate *startDate;
  uint64_t v24;
  NSDate *userVisibleTransitionDate;
  NSString *overrideModeIdentifier;
  objc_super v28;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)DNDState;
  v18 = -[DNDState init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_suppressionState = a3;
    v20 = objc_msgSend(v14, "copy");
    activeModeAssertionMetadata = v19->_activeModeAssertionMetadata;
    v19->_activeModeAssertionMetadata = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    startDate = v19->_startDate;
    v19->_startDate = (NSDate *)v22;

    v24 = objc_msgSend(v16, "copy");
    userVisibleTransitionDate = v19->_userVisibleTransitionDate;
    v19->_userVisibleTransitionDate = (NSDate *)v24;

    v19->_userVisibleTransitionLifetimeType = a7;
    objc_storeStrong((id *)&v19->_activeModeConfiguration, a8);
    overrideModeIdentifier = v19->_overrideModeIdentifier;
    v19->_overrideModeIdentifier = 0;

  }
  return v19;
}

- (BOOL)isActive
{
  return -[DNDState suppressionState](self, "suppressionState") != 0;
}

- (NSArray)activeModeIdentifiers
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "modeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSUUID)activeModeUUID
{
  void *v2;
  void *v3;
  void *v4;

  -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;

  v3 = -[DNDState suppressionState](self, "suppressionState");
  -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[DNDState userVisibleTransitionLifetimeType](self, "userVisibleTransitionLifetimeType");
  -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  v11 = v10 ^ -[NSString hash](self->_overrideModeIdentifier, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  DNDState *v5;
  DNDState *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSString *overrideModeIdentifier;
  NSString *v32;
  BOOL v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v5 = (DNDState *)a3;
  if (self == v5)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[DNDState suppressionState](self, "suppressionState");
      if (v7 != -[DNDState suppressionState](v6, "suppressionState"))
      {
        v15 = 0;
LABEL_52:

        goto LABEL_53;
      }
      -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDState activeModeAssertionMetadata](v6, "activeModeAssertionMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v15 = 0;
          goto LABEL_51;
        }
        v3 = (void *)v10;
        -[DNDState activeModeAssertionMetadata](v6, "activeModeAssertionMetadata");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v15 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v12 = (void *)v11;
        -[DNDState activeModeAssertionMetadata](self, "activeModeAssertionMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDState activeModeAssertionMetadata](v6, "activeModeAssertionMetadata");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:", v14))
        {
          v15 = 0;
LABEL_49:

          goto LABEL_50;
        }
        v43 = v3;
        v44 = v14;
        v45 = v13;
        v46 = v12;
      }
      -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDState userVisibleTransitionDate](v6, "userVisibleTransitionDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != v17)
      {
        -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v42 = (void *)v18;
          -[DNDState userVisibleTransitionDate](v6, "userVisibleTransitionDate");
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)v19;
            -[DNDState userVisibleTransitionDate](self, "userVisibleTransitionDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDState userVisibleTransitionDate](v6, "userVisibleTransitionDate");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v21, "isEqual:", v3) & 1) != 0)
            {
              v38 = v3;
              v39 = v21;
              v40 = v20;
              goto LABEL_18;
            }

          }
        }

        v15 = 0;
        goto LABEL_48;
      }
LABEL_18:
      v22 = -[DNDState userVisibleTransitionLifetimeType](self, "userVisibleTransitionLifetimeType");
      if (v22 == -[DNDState userVisibleTransitionLifetimeType](v6, "userVisibleTransitionLifetimeType"))
      {
        -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDState activeModeConfiguration](v6, "activeModeConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 == v24)
        {
LABEL_29:
          overrideModeIdentifier = self->_overrideModeIdentifier;
          v32 = v6->_overrideModeIdentifier;
          v15 = overrideModeIdentifier == v32;
          if (overrideModeIdentifier != v32 && overrideModeIdentifier && v32)
          {
            v15 = -[NSString isEqual:](overrideModeIdentifier, "isEqual:");
            v41 = v23;
            v33 = v23 == v24;
            v26 = v35;
            if (v33)
              goto LABEL_44;
            goto LABEL_41;
          }
          if (v23 == v24)
          {
            v41 = v23;
            goto LABEL_44;
          }

LABEL_45:
          if (v16 != v17)
          {

          }
LABEL_48:
          v13 = v45;
          v12 = v46;
          v3 = v43;
          v14 = v44;
          if (v8 != v9)
            goto LABEL_49;
LABEL_51:

          goto LABEL_52;
        }
        v41 = v23;
        -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          -[DNDState activeModeConfiguration](v6, "activeModeConfiguration");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            v15 = 0;
LABEL_42:

LABEL_44:
            goto LABEL_45;
          }
          v37 = (void *)v27;
          -[DNDState activeModeConfiguration](self, "activeModeConfiguration");
          v28 = objc_claimAutoreleasedReturnValue();
          -[DNDState activeModeConfiguration](v6, "activeModeConfiguration");
          v29 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v28;
          v30 = (void *)v28;
          v3 = (void *)v29;
          if (!objc_msgSend(v30, "isEqual:", v29))
          {
            v15 = 0;
LABEL_41:

            goto LABEL_42;
          }
          v35 = v26;
          v23 = v41;
          goto LABEL_29;
        }

      }
      v15 = 0;
      goto LABEL_45;
    }
    v15 = 0;
  }
LABEL_53:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeModeConfiguration, 0);
  objc_storeStrong((id *)&self->_userVisibleTransitionDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_overrideModeIdentifier, 0);
  objc_storeStrong((id *)&self->_activeModeAssertionMetadata, 0);
}

- (BOOL)willSuppressInterruptions
{
  return 0;
}

@end
