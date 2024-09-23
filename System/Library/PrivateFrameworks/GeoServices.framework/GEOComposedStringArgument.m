@implementation GEOComposedStringArgument

- (GEOComposedStringArgument_Artwork)artworkFormat
{
  return 0;
}

- (GEOComposedStringArgument_Countdown)countdownFormat
{
  return 0;
}

- (GEOComposedStringArgument_Distance)distanceFormat
{
  return 0;
}

- (GEOComposedStringArgument_Duration)durationFormat
{
  return 0;
}

- (GEOComposedStringArgument_Frequency)frequencyFormat
{
  return 0;
}

- (GEOComposedStringArgument_Maneuver)maneuverFormat
{
  return 0;
}

- (GEOComposedStringArgument_Percentage)percentageFormat
{
  return 0;
}

- (GEOComposedStringArgument_Power)powerFormat
{
  return 0;
}

- (GEOComposedStringArgument_Price)priceFormat
{
  return 0;
}

- (GEOComposedStringArgument_String)stringFormat
{
  return 0;
}

- (GEOComposedStringArgument_Substitution)substitutionFormat
{
  return 0;
}

- (GEOComposedStringArgument_Timestamp)timestampFormat
{
  return 0;
}

- (GEOComposedStringArgument_TimestampList)timestampListFormat
{
  return 0;
}

- (GEOComposedStringArgument_URL)urlFormat
{
  return 0;
}

+ (id)argumentForGeoFormatArgument:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "format"))
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v5 = objc_msgSend(v4, "format") - 1;
  if (v5 >= 0x12 || ((0x3FFBFu >> v5) & 1) == 0)
  {
    if (qword_1ECDBBB38 != -1)
      dispatch_once(&qword_1ECDBBB38, &__block_literal_global_37);
    v6 = (id)_MergedGlobals_200;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = objc_msgSend(v4, "format");
      if (v7 < 0x13 && ((0x7FF7Fu >> v7) & 1) != 0)
      {
        v8 = off_1E1C05468[(int)v7];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_FAULT, "Unhandled format: %@", buf, 0xCu);

    }
    goto LABEL_15;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*off_1E1C053D8[v5]), "_initWithGeoFormatArgument:", v4);
LABEL_16:

  return v9;
}

- (id)_init
{
  GEOComposedStringArgument *v2;
  GEOComposedStringArgument *v3;
  GEOComposedStringArgument *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument;
  v2 = -[GEOComposedStringArgument init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  GEOComposedStringArgument *v5;
  void *v6;
  uint64_t v7;
  NSString *token;
  GEOComposedStringArgument *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedStringArgument;
  v5 = -[GEOComposedStringArgument init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "token");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    token = v5->_token;
    v5->_token = (NSString *)v7;

    v5->_type = objc_msgSend(v4, "format");
    v9 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v4 = 138412290;
    v5 = objc_opt_class();
  }
  return 0;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && *((_BYTE *)v4 + 8))
  {
    -[GEOComposedStringArgument _stringReplacementWithOptions:](self, "_stringReplacementWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, self->_stringAttributes);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)replaceTokenWithOptions:(id)a3
{
  _BYTE *v4;
  GEOComposedStringTokenReplacementResult *v5;
  GEOComposedStringTokenReplacementResult *v6;
  void *v7;
  SEL v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(GEOComposedStringTokenReplacementResult);
  v6 = v5;
  if (v5)
  {
    v5->type = self->_type;
    -[GEOComposedStringArgument _stringReplacementWithOptions:](self, "_stringReplacementWithOptions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v6, v8, v7, 16);
  }
  else
  {
    -[GEOComposedStringArgument _stringReplacementWithOptions:](self, "_stringReplacementWithOptions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v4 && v4[8])
  {
    -[GEOComposedStringArgument _attributedStringReplacementWithOptions:](self, "_attributedStringReplacementWithOptions:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  v11 = 0;
  v10 = 0;
  if (v6)
LABEL_6:
    objc_setProperty_nonatomic_copy(v6, v9, v10, 24);
LABEL_7:
  if (v11)

  if (!v4 || !v4[8])
  {
    -[GEOComposedStringTokenReplacementResult string](v6, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_12;
LABEL_17:

    goto LABEL_13;
  }
  -[GEOComposedStringTokenReplacementResult attributedString](v6, "attributedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_17;
LABEL_12:
  v6->success = v12 != 0;

  v6->range = (_NSRange)xmmword_189CC0550;
LABEL_13:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_token, "copy");
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  *(_DWORD *)(v4 + 16) = self->_type;
  *(_BYTE *)(v4 + 20) = self->_hasDefaultValue;
  *(_BYTE *)(v4 + 21) = self->_hasOverrideValue;
  v7 = -[NSDictionary copy](self->_stringAttributes, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringArgument)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument *v5;
  uint64_t v6;
  NSString *token;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *stringAttributes;
  GEOComposedStringArgument *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument;
  v5 = -[GEOComposedStringArgument init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_hasDefaultValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasDefaultValue"));
    v5->_hasOverrideValue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasOverrideValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringAttributesData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, 0);
    objc_msgSend(v9, "setRequiresSecureCoding:", 0);
    objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
    v10 = objc_claimAutoreleasedReturnValue();
    stringAttributes = v5->_stringAttributes;
    v5->_stringAttributes = (NSDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *token;
  id v5;
  id v6;

  token = self->_token;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", token, CFSTR("_token"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasDefaultValue, CFSTR("_hasDefaultValue"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasOverrideValue, CFSTR("_hasOverrideValue"));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_stringAttributes, 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("stringAttributesData"));

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
  NSDictionary *stringAttributes;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)v5[1];
    v7 = self->_token;
    v8 = v6;
    if ((!(v7 | v8)
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10))
      && self->_type == *((_DWORD *)v5 + 4)
      && self->_hasDefaultValue == *((unsigned __int8 *)v5 + 20)
      && self->_hasOverrideValue == *((unsigned __int8 *)v5 + 21))
    {
      stringAttributes = self->_stringAttributes;
      v12 = v5[3];
      v13 = stringAttributes;
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

- (id)description
{
  void *v3;
  NSString *token;
  uint64_t type;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  token = self->_token;
  type = self->_type;
  if (type < 0x13 && ((0x7FF7Fu >> type) & 1) != 0)
  {
    v6 = off_1E1C05468[type];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), type);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString capitalizedString](v6, "capitalizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), token, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_new();
  v10 = (void *)v9;
  if (v9)
    *(_BYTE *)(v9 + 9) = 1;
  -[GEOComposedStringArgument _stringReplacementWithOptions:](self, "_stringReplacementWithOptions:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    objc_msgSend(v8, "appendFormat:", CFSTR(" \"%@\"), v11);

  return v8;
}

- (NSString)token
{
  return self->_token;
}

- (int)type
{
  return self->_type;
}

- (BOOL)hasDefaultValue
{
  return self->_hasDefaultValue;
}

- (void)setHasDefaultValue:(BOOL)a3
{
  self->_hasDefaultValue = a3;
}

- (BOOL)hasOverrideValue
{
  return self->_hasOverrideValue;
}

- (void)setHasOverrideValue:(BOOL)a3
{
  self->_hasOverrideValue = a3;
}

- (NSDictionary)stringAttributes
{
  return self->_stringAttributes;
}

- (void)setStringAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringAttributes, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

id __70__GEOComposedStringArgument_TimestampList__initWithGeoFormatArgument___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  v3 = -[GEOComposedStringArgument_Timestamp _initWithGeoTimestampData:]([GEOComposedStringArgument_Timestamp alloc], "_initWithGeoTimestampData:", v2);

  return v3;
}

void __66__GEOComposedStringArgument_Countdown__initWithGeoFormatArgument___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = *(unsigned int *)(objc_msgSend(v5, "alternateCountdownTypes") + 4 * a3);
  v10 = (id)objc_msgSend(v6, "copy");

  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

@end
