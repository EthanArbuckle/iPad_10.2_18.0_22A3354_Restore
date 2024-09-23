@implementation DDUIPhysicalUnit

- (void)setGroup:(id)a3
{
  objc_storeWeak((id *)&self->_group, a3);
}

uint64_t __39__DDUIPhysicalUnit_unitWithIdentifier___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  DDUIPhysicalUnit *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  DDUIPhysicalUnit *v20;
  void *v21;
  void *v22;
  DDUIPhysicalUnitGroup *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  DDUIPhysicalUnitGroup *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id obj;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)unitWithIdentifier___supportedUnits;
  unitWithIdentifier___supportedUnits = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)unitWithIdentifier___supportedGroups;
  unitWithIdentifier___supportedGroups = (uint64_t)v2;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  result = objc_msgSend(&unk_1E426BF00, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  v32 = result;
  if (result)
  {
    v31 = *(_QWORD *)v45;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v45 != v31)
          objc_enumerationMutation(&unk_1E426BF00);
        v6 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v5);
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v33 = v6;
        objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        v34 = v5;
        if (v39)
        {
          v37 = *(_QWORD *)v41;
          do
          {
            v7 = 0;
            do
            {
              if (*(_QWORD *)v41 != v37)
                objc_enumerationMutation(obj);
              v8 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v7);
              v9 = [DDUIPhysicalUnit alloc];
              objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v8, "count");
              v14 = 1;
              if (v13 >= 6)
              {
                objc_msgSend(v8, "objectAtIndexedSubscript:", 5);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v36, "unsignedIntegerValue");
              }
              objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "doubleValue");
              v17 = v16;
              objc_msgSend(v8, "objectAtIndexedSubscript:", 4);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "doubleValue");
              v20 = -[DDUIPhysicalUnit initWithName:abbreviation:restrictionLocales:groupType:a:b:](v9, "initWithName:abbreviation:restrictionLocales:groupType:a:b:", v10, v11, v12, v14, v17, v19);

              if (v13 >= 6)
              objc_msgSend(v38, "addObject:", v20);
              v21 = (void *)unitWithIdentifier___supportedUnits;
              -[DDUIPhysicalUnit identifier](v20, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

              ++v7;
            }
            while (v39 != v7);
            v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v39);
        }

        v23 = [DDUIPhysicalUnitGroup alloc];
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "BOOLValue");
        objc_msgSend(v33, "objectAtIndexedSubscript:", 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[DDUIPhysicalUnitGroup initWithName:units:restricted:symbol:](v23, "initWithName:units:restricted:symbol:", v24, v38, v26, v27);

        v29 = (void *)unitWithIdentifier___supportedGroups;
        -[DDUIPhysicalUnitGroup name](v28, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

        v5 = v34 + 1;
      }
      while (v34 + 1 != v32);
      result = objc_msgSend(&unk_1E426BF00, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      v32 = result;
    }
    while (result);
  }
  return result;
}

- (DDUIPhysicalUnit)initWithName:(id)a3 abbreviation:(id)a4 restrictionLocales:(id)a5 groupType:(unint64_t)a6 a:(double)a7 b:(double)a8
{
  id v15;
  id v16;
  id v17;
  DDUIPhysicalUnit *v18;
  uint64_t v19;
  NSString *identifier;
  void *v21;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DDUIPhysicalUnit;
  v18 = -[DDUIPhysicalUnit init](&v23, sel_init);
  if (v18)
  {
    objc_msgSend(v15, "lowercaseString");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_name, a3);
    v18->_a = a7;
    v18->_b = a8;
    objc_storeStrong((id *)&v18->_restrictionLocales, a5);
    if (v16)
      v21 = v16;
    else
      v21 = v15;
    objc_storeStrong((id *)&v18->_abbreviation, v21);
    v18->_groupType = a6;
  }

  return v18;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)valueFrom:(double)result unit:(id)a4
{
  if (a4 != self)
  {
    objc_msgSend(a4, "unitToBase:", result);
    -[DDUIPhysicalUnit baseToUnit:](self, "baseToUnit:");
  }
  return result;
}

- (double)unitToBase:(double)a3
{
  double v5;
  void *v7;
  void *v8;
  double v9;

  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("Mile per gallon")))
    return 235.214583 / a3;
  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("Percent grade")))
    return atan(a3 / 100.0);
  if (-[DDUIPhysicalUnit isUKMeasurement](self, "isUKMeasurement"))
  {
    objc_msgSend(&unk_1E426C280, "objectForKeyedSubscript:", self->_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "doubleValue");
      v5 = v9 * a3;

      return v5;
    }
  }
  return self->_b + a3 * self->_a;
}

- (NSArray)restrictionLocales
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)keepZeroValue
{
  id WeakRetained;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_group);
  objc_msgSend(WeakRetained, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Angle"));

  return (v5 & 1) != 0 || self->_b != 0.0;
}

- (BOOL)isUKMeasurement
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("U.K."));

  return v4;
}

- (BOOL)inputValueIsValid:(double)a3 fromUnit:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (fabs(a3) != INFINITY)
  {
    objc_msgSend(v6, "unitToBase:", a3);
    v10 = v9;
    v8 = 0;
    if (fabs(v9) != INFINITY)
    {
      if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("percent grade")))
        v8 = v10 <= 0.785398163 && v10 >= 0.0;
      else
        v8 = 1;
    }
  }

  return v8;
}

- (DDUIPhysicalUnitGroup)group
{
  return (DDUIPhysicalUnitGroup *)objc_loadWeakRetained((id *)&self->_group);
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (double)baseToUnit:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  double v8;

  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("Mile per gallon")))
    return 235.214583 / a3;
  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("Percent grade")))
    return fabs(tan(fabs(a3))) * 100.0;
  if (!-[DDUIPhysicalUnit isUKMeasurement](self, "isUKMeasurement"))
    return (a3 - self->_b) / self->_a;
  objc_msgSend(&unk_1E426C280, "objectForKeyedSubscript:", self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    return (a3 - self->_b) / self->_a;
  v7 = v6;
  objc_msgSend(v6, "doubleValue");
  v5 = a3 / v8;

  return v5;
}

+ (id)unitWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (unitWithIdentifier__onceToken != -1)
      dispatch_once(&unitWithIdentifier__onceToken, &__block_literal_global_5);
    v4 = (void *)unitWithIdentifier___supportedUnits;
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)patchedVariantName
{
  void *v3;
  NSString *v4;

  if (-[DDUIPhysicalUnit isUKMeasurement](self, "isUKMeasurement")
    && (objc_msgSend(&unk_1E426C280, "objectForKeyedSubscript:", self->_name),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", CFSTR(" (Imperial)"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_name;
  }
  return v4;
}

- (id)localizedUnitNameWithValue:(double)a3 unit:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[DDUIPhysicalUnit localizedTitleFormat:](self, "localizedTitleFormat:", CFSTR("x"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDUIPhysicalUnit patchedVariantName](self, "patchedVariantName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DDLocalizedStringFromTable(v6, (uint64_t)&stru_1E4259460, v7, CFSTR("Conversion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedConvertedValueFormat:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%f%%@ %@"), self->_identifier);
}

- (id)localizedMenuTitleFormat:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("degree"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Convert Angle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DDUIPhysicalUnit patchedVariantName](self, "patchedVariantName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Convert %@"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)floatFormatString:(id)a3 precision:(int64_t)a4 exp:(BOOL)a5
{
  const __CFString *v5;

  if (a5)
    v5 = CFSTR("%%.%lde");
  else
    v5 = CFSTR("%%.%ldf");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)valueAsString:(double)a3
{
  double v5;
  double v6;
  double v7;
  float64x2_t v8;
  double v9;
  uint64_t v10;
  uint64_t v13;
  float64x2_t v14;
  double v15;
  uint64_t v16;
  void *v19;
  DDUIPhysicalUnit *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v25;

  v5 = fabs(a3);
  if (v5 < 1.0e-15 || v5 >= 0.1)
  {
    v14 = vdivq_f64(vrndaq_f64(vmulq_n_f64((float64x2_t)xmmword_19F0068F0, v5)), (float64x2_t)xmmword_19F0068F0);
    v15 = round(v5);
    v16 = 2;
    if (v14.f64[0] == v14.f64[1])
      v16 = 1;
    if (v15 == v14.f64[1] || v15 > 9999.0 || a3 == 0.0)
      v13 = 0;
    else
      v13 = v16;
  }
  else
  {
    v25 = v5;
    v6 = fabs(floor(log10(a3)));
    v7 = v25 * __exp10(v6);
    v8 = vdivq_f64(vrndaq_f64(vmulq_n_f64((float64x2_t)xmmword_19F0068F0, v7)), (float64x2_t)xmmword_19F0068F0);
    v9 = round(v7);
    v10 = 2;
    if (v8.f64[0] == v8.f64[1])
      v10 = 1;
    if (v9 == v8.f64[1] || v9 > 9999.0 || v7 == 0.0)
      v13 = 0;
    else
      v13 = v10;
    if (v6 > 6.0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = self;
      v21 = 1;
      goto LABEL_29;
    }
    v13 += (uint64_t)v6;
  }
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = self;
  v21 = 0;
LABEL_29:
  -[DDUIPhysicalUnit floatFormatString:precision:exp:](v20, "floatFormatString:precision:exp:", CFSTR("%f"), v13, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringWithFormat:", v22, *(_QWORD *)&a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)localizedConvertedValueFrom:(double)a3 unit:(id)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  -[DDUIPhysicalUnit valueFrom:unit:](self, "valueFrom:unit:", a4, a3);
  v6 = v5;
  v7 = fabs(v5);
  if (v7 < INFINITY || v7 > INFINITY)
  {
    v9 = -[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("Foot"));
    v10 = v6 <= 0.0 || !v9;
    if (v10 || (v18 = floor(v6), v19 = round((v6 - v18) * 1200.0) / 100.0, v19 >= 12.0) || v18 <= 0.0 || v19 == 0.0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[DDUIPhysicalUnit localizedConvertedValueFormat:](self, "localizedConvertedValueFormat:", CFSTR("%f%@"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%2$@ %@"), self->_abbreviation);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      DDLocalizedStringFromTable(v12, (uint64_t)&stru_1E4259460, v13, CFSTR("Conversion"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v6;
      v16 = v15;
      -[DDUIPhysicalUnit valueAsString:](self, "valueAsString:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v14, *(_QWORD *)&v16, v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      DDLocalizedStringFromTable(CFSTR("%@ ft %@ in"), (uint64_t)CFSTR("Feet and inches conversions"), CFSTR("%@ ft %@ in"), CFSTR("Conversion"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDUIPhysicalUnit valueAsString:](self, "valueAsString:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDUIPhysicalUnit valueAsString:](self, "valueAsString:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v21, v22, v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    DDLocalizedStringFromTable(CFSTR("Cannot Convert Value"), (uint64_t)CFSTR("Generic value conversion action menu title"), CFSTR("Cannot Convert Value"), CFSTR("Conversion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)abbreviation
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)a
{
  return self->_a;
}

- (double)b
{
  return self->_b;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_group);
  objc_storeStrong((id *)&self->_restrictionLocales, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
