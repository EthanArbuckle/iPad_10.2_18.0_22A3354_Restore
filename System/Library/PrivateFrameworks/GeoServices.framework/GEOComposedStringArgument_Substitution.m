@implementation GEOComposedStringArgument_Substitution

- (void)setSubstitutionForWaypointCategory:(int)a3 handler:(id)a4
{
  uint64_t v4;
  NSMapTable *substitutionCandidates;
  void *v7;
  GEOComposedStringSubstitutionCandidate_NoSubstitution *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOComposedStringSubstitutionCandidate *substituteToUse;
  void (**v14)(id, void *, void *);

  v4 = *(_QWORD *)&a3;
  v14 = (void (**)(id, void *, void *))a4;
  substitutionCandidates = self->_substitutionCandidates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](substitutionCandidates, "objectForKey:", v7);
  v8 = (GEOComposedStringSubstitutionCandidate_NoSubstitution *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v14)
    {
      v9 = (void *)-[GEOComposedStringSubstitutionCandidate_NoSubstitution copy](v8, "copy");

      objc_msgSend(v9, "composedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultOptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "arguments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v9, v12);
      v8 = (GEOComposedStringSubstitutionCandidate_NoSubstitution *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_storeStrong((id *)&v8->super._optionsToUse, v11);
      else
        v8 = -[GEOComposedStringSubstitutionCandidate_NoSubstitution initWithCategory:]([GEOComposedStringSubstitutionCandidate_NoSubstitution alloc], "initWithCategory:", v4);

    }
  }
  else
  {
    v8 = -[GEOComposedStringSubstitutionCandidate_NoSubstitution initWithCategory:]([GEOComposedStringSubstitutionCandidate_NoSubstitution alloc], "initWithCategory:", v4);
  }
  substituteToUse = self->_substituteToUse;
  self->_substituteToUse = &v8->super;

}

- (void)setSubstitutionForWaypointCategory:(int)a3
{
  -[GEOComposedStringArgument_Substitution setSubstitutionForWaypointCategory:handler:](self, "setSubstitutionForWaypointCategory:handler:", *(_QWORD *)&a3, 0);
}

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  GEOComposedStringSubstitutionCandidate *v19;
  id v20;
  void *v21;
  void *v22;
  GEOComposedStringArgument_Substitution *v23;
  GEOComposedString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)GEOComposedStringArgument_Substitution;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v37, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "genericCombinations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "substitutes"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v9))
    {
      if (objc_msgSend(v4, "hasWaypointIndex"))
        v10 = (int)objc_msgSend(v4, "waypointIndex");
      else
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      v5[4] = v10;
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v5[5];
      v5[5] = v12;

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = v7;
      objc_msgSend(v7, "substitutes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v34;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
            v19 = [GEOComposedStringSubstitutionCandidate alloc];
            v20 = v18;
            v21 = v20;
            if (v19)
            {
              objc_msgSend(v20, "substitute");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                v38.receiver = v19;
                v38.super_class = (Class)GEOComposedStringSubstitutionCandidate;
                v23 = -[GEOComposedStringArgument_Substitution init](&v38, sel_init);
                if (!v23)
                  goto LABEL_18;
                LODWORD(v23->super._token) = objc_msgSend(v21, "waypointCategory");
                v24 = [GEOComposedString alloc];
                objc_msgSend(v21, "substitute");
                v19 = (GEOComposedStringSubstitutionCandidate *)objc_claimAutoreleasedReturnValue();
                v25 = -[GEOComposedString initWithGeoFormattedString:](v24, "initWithGeoFormattedString:", v19);
                v26 = *(void **)&v23->super._type;
                *(_QWORD *)&v23->super._type = v25;

              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v38.receiver) = 0;
                  _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoSubstituteData.substitute != ((void *)0)", (uint8_t *)&v38, 2u);
                }
                v23 = 0;
              }

            }
            else
            {
              v23 = 0;
            }
LABEL_18:

            v27 = (void *)v5[5];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "waypointCategory"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setObject:forKey:", v23, v28);

            ++v17;
          }
          while (v15 != v17);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          v15 = v29;
        }
        while (v29);
      }

      v11 = v5;
      v7 = v31;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  GEOComposedStringSubstitutionCandidate *substituteToUse;
  NSObject *v5;
  GEOComposedStringSubstitutionCandidate *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  substituteToUse = self->_substituteToUse;
  if (substituteToUse)
  {
    -[GEOComposedStringSubstitutionCandidate composedString](substituteToUse, "composedString", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = self->_substituteToUse;
      if (v6)
        v6 = (GEOComposedStringSubstitutionCandidate *)v6->_optionsToUse;
      v7 = v6;
      -[NSObject stringResultWithOptions:](v5, "stringResultWithOptions:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "success") & 1) != 0)
      {
        objc_msgSend(v8, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        GEOGetGEOComposedStringLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          v13 = -[GEOComposedStringSubstitutionCandidate waypointCategory](self->_substituteToUse, "waypointCategory");
          if (v13 >= 0xE)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = off_1E1C09AA8[(int)v13];
          }
          *(_DWORD *)buf = 138412290;
          v18 = v14;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_FAULT, "Error finding string replacement for category (%@)", buf, 0xCu);

        }
        v9 = 0;
      }

    }
    else
    {
      GEOGetGEOComposedStringLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[GEOComposedStringSubstitutionCandidate waypointCategory](self->_substituteToUse, "waypointCategory");
        if (v10 >= 0xE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E1C09AA8[(int)v10];
        }
        -[GEOComposedStringArgument token](self, "token");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v11;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEFAULT, "Unable to resolve [Generic_Combinations] with category [%@] for token %@", buf, 0x16u);

      }
      v9 = 0;
    }

  }
  else
  {
    GEOGetGEOComposedStringLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "No substitute was specified when evaluating string with substitution type. setCandidateForWaypointCategory:handler: needs to be called first.", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument_Substitution;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 4) = self->_waypointIndex;
  objc_storeStrong((id *)v4 + 5, self->_substitutionCandidates);
  objc_storeStrong((id *)v4 + 6, self->_substituteToUse);
  return v4;
}

- (GEOComposedStringArgument_Substitution)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Substitution *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMapTable *substitutionCandidates;
  uint64_t v12;
  GEOComposedStringSubstitutionCandidate *substituteToUse;
  GEOComposedStringArgument_Substitution *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Substitution;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_waypointIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_waypointIndex"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_substitutionCandidates"));
    v10 = objc_claimAutoreleasedReturnValue();
    substitutionCandidates = v5->_substitutionCandidates;
    v5->_substitutionCandidates = (NSMapTable *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_substituteToUse"));
    v12 = objc_claimAutoreleasedReturnValue();
    substituteToUse = v5->_substituteToUse;
    v5->_substituteToUse = (GEOComposedStringSubstitutionCandidate *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Substitution;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_waypointIndex, CFSTR("_waypointIndex"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_substitutionCandidates, CFSTR("_substitutionCandidates"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_substituteToUse, CFSTR("_substituteToUse"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  GEOComposedStringSubstitutionCandidate *substituteToUse;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Substitution;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && self->_waypointIndex == v5[4]
      && ((v6 = (void *)v5[5], v7 = self->_substitutionCandidates, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      substituteToUse = self->_substituteToUse;
      v12 = v5[6];
      v13 = substituteToUse;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substituteToUse, 0);
  objc_storeStrong((id *)&self->_substitutionCandidates, 0);
}

@end
