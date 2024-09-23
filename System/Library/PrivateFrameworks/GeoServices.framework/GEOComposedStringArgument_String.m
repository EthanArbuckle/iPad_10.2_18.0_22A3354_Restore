@implementation GEOComposedStringArgument_String

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedStringArgument_String;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v14, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "stringSubstituteData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "tokenSubstitute");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v5[4];
      v5[4] = v8;

      *((_DWORD *)v5 + 12) = objc_msgSend(v7, "stringSubstituteType");
      *((_DWORD *)v5 + 13) = objc_msgSend(v7, "privacyFilterType");
    }
    if (objc_msgSend(v4, "hasValString"))
    {
      objc_msgSend(v4, "valString");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v5[4];
      v5[4] = v10;

      *((_DWORD *)v5 + 12) = 0;
      *((_DWORD *)v5 + 13) = 0;
    }
    v12 = v5;

  }
  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSString *overrideValue;
  NSString *v7;

  v4 = a3;
  v5 = v4;
  overrideValue = self->_overrideValue;
  if (overrideValue || v4 && *((_BYTE *)v4 + 9) && (overrideValue = self->_defaultValue) != 0)
    v7 = overrideValue;
  else
    v7 = 0;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_String;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_defaultValue, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_overrideValue, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  *((_DWORD *)v4 + 12) = self->_stringSubstituteType;
  *((_DWORD *)v4 + 13) = self->_privacyFilterType;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_String;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultValue, CFSTR("_defaultValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideValue, CFSTR("_overrideValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stringSubstituteType, CFSTR("_stringSubstituteType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_privacyFilterType, CFSTR("_privacyFilterType"));

}

- (GEOComposedStringArgument_String)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_String *v5;
  uint64_t v6;
  NSString *defaultValue;
  uint64_t v8;
  NSString *overrideValue;
  GEOComposedStringArgument_String *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_String;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultValue = v5->_defaultValue;
    v5->_defaultValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    overrideValue = v5->_overrideValue;
    v5->_overrideValue = (NSString *)v8;

    v5->_stringSubstituteType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stringSubstituteType"));
    v5->_privacyFilterType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_privacyFilterType"));
    v10 = v5;
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
  BOOL v16;
  objc_super v18;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)GEOComposedStringArgument_String;
    if (!-[GEOComposedStringArgument isEqual:](&v18, sel_isEqual_, v5))
      goto LABEL_10;
    v6 = (void *)v5[4];
    v7 = self->_defaultValue;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_10;
    }
    if (((v11 = (void *)v5[5], v12 = self->_overrideValue, v13 = v11, !(v12 | v13))
       || (v14 = (void *)v13, v15 = objc_msgSend((id)v12, "isEqual:", v13),
                              v14,
                              (id)v12,
                              v15))
      && self->_stringSubstituteType == *((_DWORD *)v5 + 12))
    {
      v16 = self->_privacyFilterType == *((_DWORD *)v5 + 13);
    }
    else
    {
LABEL_10:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)overrideValue
{
  return self->_overrideValue;
}

- (void)setOverrideValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)stringSubstituteType
{
  return self->_stringSubstituteType;
}

- (int)privacyFilterType
{
  return self->_privacyFilterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
