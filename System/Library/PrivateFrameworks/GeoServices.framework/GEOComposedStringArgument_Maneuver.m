@implementation GEOComposedStringArgument_Maneuver

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _DWORD *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedStringArgument_Maneuver;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v15, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "maneuverData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[8] = objc_msgSend(v6, "maneuverType");

    objc_msgSend(v4, "maneuverData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "junctionInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v8;

    objc_msgSend(v4, "valString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    v12 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v11;

    v13 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  if (a3 && *((_BYTE *)a3 + 9))
    return self->_fallbackStringValue;
  else
    return 0;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  id v4;
  void (**attributedStringHandler)(id, _QWORD, GEOJunctionInfo *);
  void *v6;
  NSObject *v7;
  NSString *fallbackStringValue;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  attributedStringHandler = (void (**)(id, _QWORD, GEOJunctionInfo *))self->_attributedStringHandler;
  if (attributedStringHandler)
  {
    attributedStringHandler[2](attributedStringHandler, self->_maneuverType, self->_junctionInfo);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_1ECDBAC50 != -1)
      dispatch_once(&qword_1ECDBAC50, &__block_literal_global_89);
    v7 = _MergedGlobals_3_0;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_3_0, OS_LOG_TYPE_ERROR))
    {
      fallbackStringValue = self->_fallbackStringValue;
      v10 = 138412290;
      v11 = fallbackStringValue;
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Maneuver string \"%@\" was built without attributedStringHandler set.", (uint8_t *)&v10, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringArgument_Maneuver;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v8, sel_copyWithZone_, a3);
  *((_DWORD *)v4 + 8) = self->_maneuverType;
  objc_storeStrong((id *)v4 + 5, self->_junctionInfo);
  v5 = -[NSString copy](self->_fallbackStringValue, "copy");
  v6 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v5;

  return v4;
}

- (GEOComposedStringArgument_Maneuver)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_Maneuver *v5;
  uint64_t v6;
  GEOJunctionInfo *junctionInfo;
  uint64_t v8;
  NSString *fallbackStringValue;
  GEOComposedStringArgument_Maneuver *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_Maneuver;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_maneuverType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maneuverType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_junctionInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    junctionInfo = v5->_junctionInfo;
    v5->_junctionInfo = (GEOJunctionInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fallbackStringValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    fallbackStringValue = v5->_fallbackStringValue;
    v5->_fallbackStringValue = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Maneuver;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maneuverType, CFSTR("_maneuverType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_junctionInfo, CFSTR("_junctionInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbackStringValue, CFSTR("_fallbackStringValue"));

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
  _BOOL4 v10;
  NSString *fallbackStringValue;
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
    v17.super_class = (Class)GEOComposedStringArgument_Maneuver;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && self->_maneuverType == *((_DWORD *)v5 + 8)
      && ((v6 = (void *)v5[5], v7 = self->_junctionInfo, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      fallbackStringValue = self->_fallbackStringValue;
      v12 = v5[6];
      v13 = fallbackStringValue;
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

- (id)attributedStringHandler
{
  return self->_attributedStringHandler;
}

- (void)setAttributedStringHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attributedStringHandler, 0);
  objc_storeStrong((id *)&self->_fallbackStringValue, 0);
  objc_storeStrong((id *)&self->_junctionInfo, 0);
}

@end
