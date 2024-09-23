@implementation GEOComposedStringArgument_Countdown

- (id)_initWithGeoFormatArgument:(id)a3
{
  char *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t);
  void *v28;
  id v29;
  id v30;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GEOComposedStringArgument_Countdown;
  v6 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v31, sel__initWithGeoFormatArgument_, v5);
  if (v6)
  {
    objc_msgSend(v5, "countdownData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "timestampValuesCount"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "timestampValuesCount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "timestampValuesCount"))
        {
          v3 = 0;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "timestampValueAtIndex:", v3));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v10);

            ++v3;
          }
          while ((unint64_t)v3 < objc_msgSend(v8, "timestampValuesCount"));
        }
        v11 = (void *)*((_QWORD *)v6 + 4);
        *((_QWORD *)v6 + 4) = v9;

      }
      if (objc_msgSend(v8, "alternateFormatStringsCount"))
      {
        v12 = objc_msgSend(v8, "alternateFormatStringsCount");
        if (v12 == objc_msgSend(v8, "alternateCountdownTypesCount"))
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "alternateFormatStringsCount"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "alternateFormatStrings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = MEMORY[0x1E0C809B0];
          v26 = 3221225472;
          v27 = __66__GEOComposedStringArgument_Countdown__initWithGeoFormatArgument___block_invoke;
          v28 = &unk_1E1C11B20;
          v29 = v8;
          v15 = v13;
          v30 = v15;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v25);

          v3 = (char *)*((_QWORD *)v6 + 5);
          *((_QWORD *)v6 + 5) = v15;
          v16 = v15;

        }
      }
      objc_msgSend(v8, "separator", v25, v26, v27, v28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      v19 = (void *)*((_QWORD *)v6 + 6);
      *((_QWORD *)v6 + 6) = v18;

      objc_msgSend(v8, "timezone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)MEMORY[0x1E0C99E80];
        objc_msgSend(v8, "timezone");
        v3 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeZoneWithName:", v3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      objc_storeStrong((id *)v6 + 7, v22);
      if (v20)
      {

      }
    }
    v23 = v6;

  }
  return v6;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  NSDate *overrideReferenceDate;
  unint64_t v5;
  NSDate *v6;
  NSDate *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  unint64_t v23;
  NSArray *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  NSDate *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *countdownFormatStrings;
  void *v38;
  void *v39;
  NSDate *v40;
  NSString *v41;
  void *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v58;
  GEOComposedStringArgument_Countdown *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  const __CFString *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  overrideReferenceDate = self->_overrideReferenceDate;
  v5 = 0x1E0C99000uLL;
  if (overrideReferenceDate)
  {
    v6 = overrideReferenceDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v59 = self;
  v9 = self->_timestampValues;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v64;
    v14 = 2;
    v60 = *(_QWORD *)v64;
    while (2)
    {
      v15 = 0;
      v61 = v11;
      do
      {
        if (*(_QWORD *)v64 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(v5 + 3432);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v15), "doubleValue");
        objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v7);
        v19 = v18;
        v20 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1EDF4D5C8);
        v21 = v19 < 60.0;
        if (v19 <= v20)
          v21 = 0;
        if (v19 >= 0.0 || v21)
        {
          if (v21)
          {
            v14 -= (v12 & 1) == 0;
            v12 = 1;
          }
          else
          {
            v23 = (uint64_t)v19 < 60 ? 1 : (uint64_t)v19 / 0x3CuLL;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
            v24 = v9;
            v25 = v12;
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringValue");
            v27 = v14;
            v28 = v5;
            v29 = v7;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v30);

            v7 = v29;
            v5 = v28;
            v14 = v27;

            v12 = v25;
            v9 = v24;
            v13 = v60;
            v11 = v61;
          }
          if (objc_msgSend(v8, "count") >= v14)
          {

            goto LABEL_27;
          }
        }

        ++v15;
      }
      while (v11 != v15);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
LABEL_27:

  v31 = v8;
  v32 = v31;
  v33 = v31;
  if (v59->_rightToLeft)
  {
    objc_msgSend(v31, "reverseObjectEnumerator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v35 = objc_msgSend(v33, "count");
  if ((v12 & 1) == 0)
  {
    if (!v35)
    {
      -[NSArray lastObject](v59->_timestampValues, "lastObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "doubleValue");
      v47 = v46;
      +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "locale");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      GEOStringForTimestamp(CFSTR("jjmm"), v49, v59->_defaultTimeZone, v47);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_51:
      goto LABEL_52;
    }
    v36 = 3;
LABEL_34:
    countdownFormatStrings = v59->_countdownFormatStrings;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](countdownFormatStrings, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = v7;
      if (-[NSString length](v59->_separator, "length"))
      {
        v41 = v59->_separator;
      }
      else
      {
        +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "separatorForTimestampList");
        v41 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v33, "componentsJoinedByString:", v41);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "minutesFormatForCountdownList");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        v62 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v53, CFSTR("%@"), &v62, v51);
        v54 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = v51;
      }
      v55 = v54;
      -[GEOComposedStringArgument token](v59, "token");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringByReplacingOccurrencesOfString:withString:", v56, v55);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v40;
    }
    else
    {
      if (qword_1ECDBAC88 != -1)
        dispatch_once(&qword_1ECDBAC88, &__block_literal_global_203);
      v42 = (void *)_MergedGlobals_3_3;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_3_3, OS_LOG_TYPE_ERROR))
      {
        v43 = CFSTR("UPCOMING_ONLY");
        if ((v12 & 1) != 0)
          v43 = CFSTR("IMMINENT_AND_UPCOMING");
        *(_DWORD *)buf = 138412290;
        v68 = v43;
        v44 = v42;
        _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_ERROR, "Server did not provide a countdown format string for type: %@", buf, 0xCu);

      }
      v45 = 0;
    }
    goto LABEL_51;
  }
  if (v35)
  {
    v36 = 2;
    goto LABEL_34;
  }
  -[NSDictionary objectForKeyedSubscript:](v59->_countdownFormatStrings, "objectForKeyedSubscript:", &unk_1E1E81E80);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_52:

  return v45;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Countdown;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_timestampValues, 1);
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", self->_countdownFormatStrings, 1);
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSString copy](self->_separator, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSTimeZone copy](self->_defaultTimeZone, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSDate copy](self->_overrideReferenceDate, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  *((_BYTE *)v4 + 72) = self->_rightToLeft;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Countdown;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestampValues, CFSTR("_timestampValues"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_countdownFormatStrings, CFSTR("_countdownFormatStrings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_separator, CFSTR("_separator"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultTimeZone, CFSTR("_defaultTimeZone"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideReferenceDate, CFSTR("_overrideReferenceDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_rightToLeft, CFSTR("_rightToLeft"));

}

- (GEOComposedStringArgument_Countdown)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Countdown *v5;
  uint64_t v6;
  NSArray *timestampValues;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *countdownFormatStrings;
  uint64_t v11;
  NSString *separator;
  uint64_t v13;
  NSTimeZone *defaultTimeZone;
  uint64_t v15;
  NSDate *overrideReferenceDate;
  GEOComposedStringArgument_Countdown *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedStringArgument_Countdown;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_timestampValues"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestampValues = v5->_timestampValues;
    v5->_timestampValues = (NSArray *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("_countdownFormatStrings"));
    v9 = objc_claimAutoreleasedReturnValue();
    countdownFormatStrings = v5->_countdownFormatStrings;
    v5->_countdownFormatStrings = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_separator"));
    v11 = objc_claimAutoreleasedReturnValue();
    separator = v5->_separator;
    v5->_separator = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultTimeZone"));
    v13 = objc_claimAutoreleasedReturnValue();
    defaultTimeZone = v5->_defaultTimeZone;
    v5->_defaultTimeZone = (NSTimeZone *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideReferenceDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    overrideReferenceDate = v5->_overrideReferenceDate;
    v5->_overrideReferenceDate = (NSDate *)v15;

    v5->_rightToLeft = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_rightToLeft"));
    v17 = v5;
  }

  return v5;
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
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  BOOL v31;
  objc_super v33;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v33.receiver = self;
    v33.super_class = (Class)GEOComposedStringArgument_Countdown;
    if (!-[GEOComposedStringArgument isEqual:](&v33, sel_isEqual_, v5))
      goto LABEL_15;
    v6 = (void *)v5[4];
    v7 = self->_timestampValues;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_15;
    }
    v11 = (void *)v5[5];
    v12 = self->_countdownFormatStrings;
    v13 = v11;
    if (v12 | v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend((id)v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_15;
    }
    v16 = (void *)v5[6];
    v17 = self->_separator;
    v18 = v16;
    if (v17 | v18)
    {
      v19 = (void *)v18;
      v20 = objc_msgSend((id)v17, "isEqual:", v18);

      if (!v20)
        goto LABEL_15;
    }
    v21 = (void *)v5[7];
    v22 = self->_defaultTimeZone;
    v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      v25 = objc_msgSend((id)v22, "isEqual:", v23);

      if (!v25)
        goto LABEL_15;
    }
    v26 = (void *)v5[8];
    v27 = self->_overrideReferenceDate;
    v28 = v26;
    if (!(v27 | v28)
      || (v29 = (void *)v28, v30 = objc_msgSend((id)v27, "isEqual:", v28), v29, (id)v27, v30))
    {
      v31 = self->_rightToLeft == *((unsigned __int8 *)v5 + 72);
    }
    else
    {
LABEL_15:
      v31 = 0;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (NSDate)overrideReferenceDate
{
  return self->_overrideReferenceDate;
}

- (void)setOverrideReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_overrideReferenceDate, a3);
}

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->_rightToLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideReferenceDate, 0);
  objc_storeStrong((id *)&self->_defaultTimeZone, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_countdownFormatStrings, 0);
  objc_storeStrong((id *)&self->_timestampValues, 0);
}

@end
