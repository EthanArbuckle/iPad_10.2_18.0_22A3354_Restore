@implementation MKDistanceFormatter

- (MKDistanceFormatter)init
{
  MKDistanceFormatter *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKDistanceFormatter;
  v2 = -[MKDistanceFormatter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKDistanceFormatter setLocale:](v2, "setLocale:", v3);

    +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "count:", 1);

  }
  return v2;
}

- (MKDistanceFormatter)initWithCoder:(id)a3
{
  id v4;
  MKDistanceFormatter *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKDistanceFormatter;
  v5 = -[MKDistanceFormatter initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKDistanceFormatterLocale")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("MKDistanceFormatterLocale"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKDistanceFormatter setLocale:](v5, "setLocale:", v6);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKDistanceFormatterUnits")))
      -[MKDistanceFormatter setUnits:](v5, "setUnits:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MKDistanceFormatterUnits")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKDistanceFormatterUnitStyle")))
      -[MKDistanceFormatter setUnitStyle:](v5, "setUnitStyle:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MKDistanceFormatterUnitStyle")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKDistanceFormatter;
  v4 = a3;
  -[MKDistanceFormatter encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKDistanceFormatter units](self, "units", v6.receiver, v6.super_class), CFSTR("MKDistanceFormatterUnits"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MKDistanceFormatter unitStyle](self, "unitStyle"), CFSTR("MKDistanceFormatterUnitStyle"));
  -[MKDistanceFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MKDistanceFormatterLocale"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[MKDistanceFormatter locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setLocale:", v7);

    objc_msgSend(v5, "setUnits:", -[MKDistanceFormatter units](self, "units"));
    objc_msgSend(v5, "setUnitStyle:", -[MKDistanceFormatter unitStyle](self, "unitStyle"));
  }
  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(NSLocale *)locale
{
  NSLocale *v4;
  NSLocale *v5;
  NSLocale *v6;
  NSLocale *v7;

  v4 = locale;
  if (self->_locale != v4)
  {
    v7 = v4;
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      v5 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    }
    v6 = self->_locale;
    self->_locale = v5;

    v4 = v7;
  }

}

- (id)description
{
  void *v3;
  unint64_t units;
  __CFString *v5;
  unint64_t unitStyle;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[NSLocale description](self->_locale, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  units = self->_units;
  if (units > 3)
    v5 = 0;
  else
    v5 = off_1E20DC648[units];
  unitStyle = self->_unitStyle;
  if (unitStyle > 2)
    v7 = 0;
  else
    v7 = off_1E20DC668[unitStyle];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)MKDistanceFormatter;
  -[MKDistanceFormatter description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ locale:%@ units:%@ unitStyle:%@"), v9, v3, v5, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_useMetric
{
  unint64_t units;

  units = self->_units;
  if (units)
    return units == 1;
  else
    return -[NSLocale _navigation_distanceUsesMetricSystem](self->_locale, "_navigation_distanceUsesMetricSystem");
}

- (NSString)stringFromDistance:(CLLocationDistance)distance
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t unitStyle;
  uint64_t v10;

  v5 = -[MKDistanceFormatter _useMetric](self, "_useMetric");
  if (v5)
  {
    v6 = 1;
    v7 = 2;
  }
  else if (self->_units == 3)
  {
    v6 = 2;
    v7 = 1;
  }
  else
  {
    v8 = -[NSLocale _navigation_useYardsForShortDistances](self->_locale, "_navigation_useYardsForShortDistances");
    v7 = 1;
    if (v8)
      v6 = 2;
    else
      v6 = 1;
  }
  unitStyle = self->_unitStyle;
  if (unitStyle)
    v10 = unitStyle == 1;
  else
    v10 = v5;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", 0, v10, self->_locale, v7, v6, distance);
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    -[MKDistanceFormatter stringFromDistance:](self, "stringFromDistance:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CLLocationDistance)distanceFromString:(NSString *)distance
{
  NSString *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = distance;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v5, "setLenient:", 1);
  v33[0] = 0;
  v33[1] = -[NSString length](v4, "length");
  v31 = 0;
  v32 = 0;
  objc_msgSend(v5, "getObjectValue:forString:range:error:", &v32, v4, v33, &v31);
  v6 = v32;
  v7 = v31;
  if (v6)
  {
    if (-[MKDistanceFormatter _useMetric](self, "_useMetric"))
    {
      MNInstructionsLocalizedMetricUnits();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MNInstructionsLocalizedImperialUnits();
    }
    else
    {
      MNInstructionsLocalizedImperialUnits();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MNInstructionsLocalizedMetricUnits();
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_77);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_77);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    v9 = -1.0;
    if (v14)
    {
      v15 = v14;
      v23 = v12;
      v24 = v11;
      v25 = v7;
      v26 = v6;
      v16 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v18, "objectAtIndexedSubscript:", 0, v23, v24, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "integerValue");

          if (-[NSString rangeOfString:options:](v4, "rangeOfString:options:", v19, 1) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v6 = v26;
            objc_msgSend(v26, "doubleValue");
            MNInstructionsDistanceTypeConvertToMeters();
            v9 = v21;

            goto LABEL_16;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v15)
          continue;
        break;
      }
      v6 = v26;
LABEL_16:
      v11 = v24;
      v7 = v25;
      v12 = v23;
    }

  }
  else
  {
    v9 = -1.0;
  }

  return v9;
}

uint64_t __42__MKDistanceFormatter_distanceFromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "length");
  if (v7 <= objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(v5, "length");
    v8 = v9 < objc_msgSend(v6, "length");
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  double v7;
  double v8;
  void *v9;

  -[MKDistanceFormatter distanceFromString:](self, "distanceFromString:", a4);
  v8 = v7;
  if (v7 < 0.0)
  {
    if (a3)
      *a3 = 0;
    if (a5)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("Couldn't convert to distance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = a5;
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    *a3 = v9;
  }
  return v8 >= 0.0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return a3
      && -[MKDistanceFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", 0, *a3, a7, a6.location, a6.length);
}

- (MKDistanceFormatterUnits)units
{
  return self->_units;
}

- (void)setUnits:(MKDistanceFormatterUnits)units
{
  self->_units = units;
}

- (MKDistanceFormatterUnitStyle)unitStyle
{
  return self->_unitStyle;
}

- (void)setUnitStyle:(MKDistanceFormatterUnitStyle)unitStyle
{
  self->_unitStyle = unitStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
