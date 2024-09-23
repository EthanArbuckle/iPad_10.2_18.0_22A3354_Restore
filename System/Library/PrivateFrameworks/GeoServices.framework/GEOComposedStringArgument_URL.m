@implementation GEOComposedStringArgument_URL

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_URL;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v16, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "urlData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayTitle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[4];
    v5[4] = v7;

    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "urlData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v5[5];
    v5[5] = v12;

    v14 = v5;
  }

  return v5;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  NSString *overrideDisplayTitle;

  overrideDisplayTitle = self->_overrideDisplayTitle;
  if (!overrideDisplayTitle)
  {
    if (a3 && *((_BYTE *)a3 + 9))
      return self->_defaultDisplayTitle;
    overrideDisplayTitle = 0;
  }
  return overrideDisplayTitle;
}

- (id)_attributedStringReplacementWithOptions:(id)a3
{
  id v4;
  NSString *overrideDisplayTitle;
  NSString *v6;
  NSURL *overrideURL;
  NSURL *v8;
  NSURL *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int16 v16;
  NSString *linkAttributeName;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  overrideDisplayTitle = self->_overrideDisplayTitle;
  if (!overrideDisplayTitle)
    overrideDisplayTitle = self->_defaultDisplayTitle;
  v6 = overrideDisplayTitle;
  overrideURL = self->_overrideURL;
  if (!overrideURL)
    overrideURL = self->_defaultURL;
  v8 = overrideURL;
  v9 = v8;
  if (v6)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_15;
  if (!self->_linkAttributeName)
  {
    if (qword_1ECDBAC60 != -1)
      dispatch_once(&qword_1ECDBAC60, &__block_literal_global_155);
    v14 = _MergedGlobals_3_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_3_1, OS_LOG_TYPE_ERROR))
    {
      v16 = 0;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  linkAttributeName = self->_linkAttributeName;
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &linkAttributeName, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v6, v12);

LABEL_16:
  return v13;
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
  v16.super_class = (Class)GEOComposedStringArgument_URL;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v16, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_defaultDisplayTitle, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSURL copy](self->_defaultURL, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSString copy](self->_overrideDisplayTitle, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSURL copy](self->_overrideURL, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSString copy](self->_linkAttributeName, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_URL;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultDisplayTitle, CFSTR("_defaultDisplayTitle"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultURL, CFSTR("_defaultURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideDisplayTitle, CFSTR("_overrideDisplayTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideURL, CFSTR("_overrideURL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_linkAttributeName, CFSTR("_linkAttributeName"));

}

- (GEOComposedStringArgument_URL)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_URL *v5;
  uint64_t v6;
  NSString *defaultDisplayTitle;
  uint64_t v8;
  NSURL *defaultURL;
  uint64_t v10;
  NSString *overrideDisplayTitle;
  uint64_t v12;
  NSURL *overrideURL;
  uint64_t v14;
  NSString *linkAttributeName;
  GEOComposedStringArgument_URL *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOComposedStringArgument_URL;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultDisplayTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultDisplayTitle = v5->_defaultDisplayTitle;
    v5->_defaultDisplayTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_defaultURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    defaultURL = v5->_defaultURL;
    v5->_defaultURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideDisplayTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    overrideDisplayTitle = v5->_overrideDisplayTitle;
    v5->_overrideDisplayTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_overrideURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    overrideURL = v5->_overrideURL;
    v5->_overrideURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_linkAttributeName"));
    v14 = objc_claimAutoreleasedReturnValue();
    linkAttributeName = v5->_linkAttributeName;
    v5->_linkAttributeName = (NSString *)v14;

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
  NSString *linkAttributeName;
  uint64_t v27;
  id v28;
  void *v29;
  char v30;
  objc_super v32;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v32.receiver = self;
    v32.super_class = (Class)GEOComposedStringArgument_URL;
    if (!-[GEOComposedStringArgument isEqual:](&v32, sel_isEqual_, v5))
      goto LABEL_14;
    v6 = (void *)v5[4];
    v7 = self->_defaultDisplayTitle;
    v8 = v6;
    if (v7 | v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend((id)v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_14;
    }
    v11 = (void *)v5[5];
    v12 = self->_defaultURL;
    v13 = v11;
    if (v12 | v13)
    {
      v14 = (void *)v13;
      v15 = objc_msgSend((id)v12, "isEqual:", v13);

      if (!v15)
        goto LABEL_14;
    }
    v16 = (void *)v5[6];
    v17 = self->_overrideDisplayTitle;
    v18 = v16;
    if (v17 | v18)
    {
      v19 = (void *)v18;
      v20 = objc_msgSend((id)v17, "isEqual:", v18);

      if (!v20)
        goto LABEL_14;
    }
    v21 = (void *)v5[7];
    v22 = self->_overrideURL;
    v23 = v21;
    if (!(v22 | v23)
      || (v24 = (void *)v23, v25 = objc_msgSend((id)v22, "isEqual:", v23), v24, (id)v22, v25))
    {
      linkAttributeName = self->_linkAttributeName;
      v27 = v5[8];
      v28 = linkAttributeName;
      v29 = v28;
      if ((unint64_t)v28 | v27)
        v30 = objc_msgSend(v28, "isEqual:", v27);
      else
        v30 = 1;

    }
    else
    {
LABEL_14:
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (NSString)overrideDisplayTitle
{
  return self->_overrideDisplayTitle;
}

- (void)setOverrideDisplayTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)linkAttributeName
{
  return self->_linkAttributeName;
}

- (void)setLinkAttributeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkAttributeName, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_overrideDisplayTitle, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_defaultDisplayTitle, 0);
}

@end
