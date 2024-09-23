@implementation _LTLanguageStatusObservation

- (_LTLanguageStatusObservation)initWithLocale:(id)a3 progress:(double)a4 status:(int64_t)a5
{
  id v8;
  _LTLanguageStatusObservation *v9;
  uint64_t v10;
  NSLocale *locale;
  double v12;
  _LTLanguageStatusObservation *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTLanguageStatusObservation;
  v9 = -[_LTLanguageStatusObservation init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    locale = v9->_locale;
    v9->_locale = (NSLocale *)v10;

    v9->_isIndeterminateProgress = 0;
    v9->_status = a5;
    v12 = 1.0;
    switch(a5)
    {
      case 0:
      case 3:
        v12 = 0.0;
        goto LABEL_6;
      case 1:
        v12 = fmax(round(a4 * 100.0) / 100.0, 0.01);
        if (v12 > 0.99)
          v12 = 0.99;
        goto LABEL_6;
      case 2:
LABEL_6:
        v9->_progress = v12;
        break;
      default:
        break;
    }
    v13 = v9;
  }

  return v9;
}

- (_LTLanguageStatusObservation)initWithCoder:(id)a3
{
  id v4;
  _LTLanguageStatusObservation *v5;
  uint64_t v6;
  NSLocale *locale;
  double v8;
  _LTLanguageStatusObservation *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LTLanguageStatusObservation;
  v5 = -[_LTLanguageStatusObservation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v6 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v5->_isIndeterminateProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIndeterminateProgress"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progress"));
    v5->_progress = v8;
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *locale;
  id v5;

  locale = self->_locale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIndeterminateProgress, CFSTR("isIndeterminateProgress"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("progress"), self->_progress);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  int v10;
  char v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_LTLanguageStatusObservation status](self, "status");
    if (v6 == objc_msgSend(v5, "status")
      && (-[_LTLanguageStatusObservation progress](self, "progress"), v8 = v7, objc_msgSend(v5, "progress"), v8 == v9)
      && (v10 = -[_LTLanguageStatusObservation isIndeterminateProgress](self, "isIndeterminateProgress"),
          v10 == objc_msgSend(v5, "isIndeterminateProgress")))
    {
      -[_LTLanguageStatusObservation locale](self, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_ltLocaleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_ltLocaleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEqualToString:", v16);

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

- (int64_t)compare:(id)a3
{
  NSLocale *locale;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  locale = self->_locale;
  v4 = a3;
  -[NSLocale _ltLocaleIdentifier](locale, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_ltLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (id)description
{
  int64_t status;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  status = self->_status;
  if (status == 1)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[NSLocale _ltLocaleIdentifier](self->_locale, "_ltLocaleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: Downloading [%f]"), v5, *(_QWORD *)&self->_progress);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    if (status == 2)
    {
      -[NSLocale _ltLocaleIdentifier](self->_locale, "_ltLocaleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: Installed"), v5, v9);
    }
    else
    {
      -[NSLocale _ltLocaleIdentifier](self->_locale, "_ltLocaleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: Not Installed"), v5, v9);
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isIndeterminateProgress
{
  return self->_isIndeterminateProgress;
}

- (double)progress
{
  return self->_progress;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
