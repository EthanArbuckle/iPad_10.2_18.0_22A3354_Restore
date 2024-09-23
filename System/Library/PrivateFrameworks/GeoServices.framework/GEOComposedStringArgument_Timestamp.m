@implementation GEOComposedStringArgument_Timestamp

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_Timestamp;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v10, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "timestampDatas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v5, "_updateWithGeoTimestampData:", v7);
    v8 = v5;

  }
  return v5;
}

- (id)_initWithGeoTimestampData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Timestamp;
  v5 = -[GEOComposedStringArgument _init](&v8, sel__init);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_updateWithGeoTimestampData:", v4);

  return v6;
}

- (void)_updateWithGeoTimestampData:(id)a3
{
  int *v4;
  void *v5;
  NSString *v6;
  NSString *defaultFormatPattern;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[GEOComposedStringArgument setHasDefaultValue:](self, "setHasDefaultValue:", 1);
  v4 = &OBJC_IVAR___GEOComposedStringArgument_Timestamp__defaultValue;
  self->_defaultValue = (double)objc_msgSend(v11, "timestampVal");
  objc_msgSend(v11, "formatPattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  defaultFormatPattern = self->_defaultFormatPattern;
  self->_defaultFormatPattern = v6;

  objc_msgSend(v11, "timezone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v11, "timezone");
    v4 = (int *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZoneWithName:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong((id *)&self->_defaultTimeZone, v10);
  if (v8)
  {

  }
}

- (void)setOverrideValue:(double)a3
{
  -[GEOComposedStringArgument setHasOverrideValue:](self, "setHasOverrideValue:", 1);
  self->_overrideValue = a3;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  _BYTE *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSString *overrideFormatPattern;
  double v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSTimeZone *overrideTimeZone;
  void *v14;

  v4 = a3;
  if (-[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue")
    || v4 && v4[9] && -[GEOComposedStringArgument hasDefaultValue](self, "hasDefaultValue"))
  {
    v5 = -[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue");
    v6 = 3;
    if (!v5)
      v6 = 0;
    v7 = OBJC_IVAR___GEOComposedStringArgument_Timestamp__defaultValue[v6];
    overrideFormatPattern = self->_overrideFormatPattern;
    if (!overrideFormatPattern)
      overrideFormatPattern = self->_defaultFormatPattern;
    v9 = *(double *)((char *)&self->super.super.isa + v7);
    v10 = overrideFormatPattern;
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    overrideTimeZone = self->_overrideTimeZone;
    if (!overrideTimeZone)
      overrideTimeZone = self->_defaultTimeZone;
    GEOStringForTimestamp(v10, v12, overrideTimeZone, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_Timestamp;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v14, sel_copyWithZone_, a3);
  v4[4] = *(_QWORD *)&self->_defaultValue;
  v5 = -[NSString copy](self->_defaultFormatPattern, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = -[NSTimeZone copy](self->_defaultTimeZone, "copy");
  v8 = (void *)v4[6];
  v4[6] = v7;

  v4[7] = *(_QWORD *)&self->_overrideValue;
  v9 = -[NSString copy](self->_overrideFormatPattern, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSTimeZone copy](self->_overrideTimeZone, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Timestamp;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_defaultValue"), self->_defaultValue, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultFormatPattern, CFSTR("_defaultFormatPattern"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultTimeZone, CFSTR("_defaultTimeZone"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_overrideValue"), self->_overrideValue);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideFormatPattern, CFSTR("_overrideFormatPattern"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideTimeZone, CFSTR("_overrideTimeZone"));

}

- (GEOComposedStringArgument_Timestamp)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Timestamp *v5;
  double v6;
  uint64_t v7;
  NSString *defaultFormatPattern;
  uint64_t v9;
  NSTimeZone *defaultTimeZone;
  double v11;
  uint64_t v12;
  NSString *overrideFormatPattern;
  uint64_t v14;
  NSTimeZone *overrideTimeZone;
  GEOComposedStringArgument_Timestamp *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_Timestamp;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_defaultValue"));
    v5->_defaultValue = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultFormatPattern"));
    v7 = objc_claimAutoreleasedReturnValue();
    defaultFormatPattern = v5->_defaultFormatPattern;
    v5->_defaultFormatPattern = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultTimeZone"));
    v9 = objc_claimAutoreleasedReturnValue();
    defaultTimeZone = v5->_defaultTimeZone;
    v5->_defaultTimeZone = (NSTimeZone *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_overrideValue"));
    v5->_overrideValue = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideFormatPattern"));
    v12 = objc_claimAutoreleasedReturnValue();
    overrideFormatPattern = v5->_overrideFormatPattern;
    v5->_overrideFormatPattern = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideTimeZone"));
    v14 = objc_claimAutoreleasedReturnValue();
    overrideTimeZone = v5->_overrideTimeZone;
    v5->_overrideTimeZone = (NSTimeZone *)v14;

    v16 = v5;
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
  double *v5;
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
  NSTimeZone *overrideTimeZone;
  uint64_t v22;
  id v23;
  void *v24;
  char v25;
  objc_super v27;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (double *)v4;
    v27.receiver = self;
    v27.super_class = (Class)GEOComposedStringArgument_Timestamp;
    if (!-[GEOComposedStringArgument isEqual:](&v27, sel_isEqual_, v5))
      goto LABEL_14;
    if (self->_defaultValue != v5[4])
      goto LABEL_14;
    v6 = (void *)*((_QWORD *)v5 + 5);
    v7 = self->_defaultFormatPattern;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_14;
    }
    v11 = (void *)*((_QWORD *)v5 + 6);
    v12 = self->_defaultTimeZone;
    v13 = v11;
    if (v12 | v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend((id)v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_14;
    }
    if (self->_overrideValue == v5[7]
      && ((v16 = (void *)*((_QWORD *)v5 + 8),
           v17 = self->_overrideFormatPattern,
           v18 = v16,
           !(v17 | v18))
       || (v19 = (void *)v18, v20 = objc_msgSend((id)v17, "isEqual:", v18),
                              v19,
                              (id)v17,
                              v20)))
    {
      overrideTimeZone = self->_overrideTimeZone;
      v22 = *((_QWORD *)v5 + 9);
      v23 = overrideTimeZone;
      v24 = v23;
      if ((unint64_t)v23 | v22)
        v25 = objc_msgSend(v23, "isEqual:", v22);
      else
        v25 = 1;

    }
    else
    {
LABEL_14:
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (double)overrideValue
{
  return self->_overrideValue;
}

- (NSString)overrideFormatPattern
{
  return self->_overrideFormatPattern;
}

- (void)setOverrideFormatPattern:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSTimeZone)overrideTimeZone
{
  return self->_overrideTimeZone;
}

- (void)setOverrideTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimeZone, 0);
  objc_storeStrong((id *)&self->_overrideFormatPattern, 0);
  objc_storeStrong((id *)&self->_defaultTimeZone, 0);
  objc_storeStrong((id *)&self->_defaultFormatPattern, 0);
}

@end
