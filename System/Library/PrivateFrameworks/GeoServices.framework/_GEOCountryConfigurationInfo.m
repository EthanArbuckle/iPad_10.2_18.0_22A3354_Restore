@implementation _GEOCountryConfigurationInfo

+ (_GEOCountryConfigurationInfo)get
{
  void *v0;
  _GEOCountryConfigurationInfo *v1;

  objc_opt_self();
  _getValue(GeoServicesConfig_DeviceCountryCodeSourced, (uint64_t)off_1EDF4CC58, 1, 0, 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v1 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v1 = -[_GEOCountryConfigurationInfo initWithDictionary:]([_GEOCountryConfigurationInfo alloc], "initWithDictionary:", v0);

  return v1;
}

- (_GEOCountryConfigurationInfo)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _GEOCountryConfigurationInfo *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  NSString *countryCode;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "length"))
    {
      v8 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "unsignedIntValue");
    else
      v7 = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    v14.receiver = self;
    v14.super_class = (Class)_GEOCountryConfigurationInfo;
    self = -[_GEOCountryConfigurationInfo init](&v14, sel_init);
    if (self)
    {
      v11 = (NSString *)objc_msgSend(v5, "copy");
      countryCode = self->_countryCode;
      self->_countryCode = v11;

      if (!-[NSString length](self->_countryCode, "length"))
      {
        v8 = 0;
        goto LABEL_16;
      }
      self->_source = v7;
      objc_storeStrong((id *)&self->_dateOfLastUpdate, v9);
    }
    v8 = self;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastUpdate, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[NSString isEqual:](self->_countryCode, "isEqual:", *((_QWORD *)v5 + 2)))
      v6 = self->_source == v5[2];
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (_GEOCountryConfigurationInfo)countryCode:(unsigned int)a3 source:
{
  id v4;
  _GEOCountryConfigurationInfo *v5;
  id v6;
  uint64_t v7;
  NSString *countryCode;
  uint64_t v9;
  NSDate *dateOfLastUpdate;
  _GEOCountryConfigurationInfo *v11;
  objc_super v13;

  v4 = a2;
  objc_opt_self();
  v5 = [_GEOCountryConfigurationInfo alloc];
  v6 = v4;
  if (!v5)
    goto LABEL_6;
  v13.receiver = v5;
  v13.super_class = (Class)_GEOCountryConfigurationInfo;
  v5 = (_GEOCountryConfigurationInfo *)objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    v7 = objc_msgSend(v6, "copy");
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v7;

    if (-[NSString length](v5->_countryCode, "length"))
    {
      v5->_source = a3;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = objc_claimAutoreleasedReturnValue();
      dateOfLastUpdate = v5->_dateOfLastUpdate;
      v5->_dateOfLastUpdate = (NSDate *)v9;

      goto LABEL_5;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v5 = v5;
  v11 = v5;
LABEL_7:

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<\"%@\" source {raw 0x%0X device %x source %x} updated %@>"), self->_countryCode, self->_source, self->_source & 0xFF00, self->_source, self->_dateOfLastUpdate);
}

@end
