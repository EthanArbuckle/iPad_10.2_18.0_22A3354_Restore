@implementation BCSVisibilityItem

- (BCSVisibilityItem)initWithVisibility:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BCSVisibilityItem *v9;

  v4 = a3;
  objc_msgSend(v4, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratio");
  v8 = v7;

  v9 = -[BCSVisibilityItem initWithLanguage:country:ratio:](self, "initWithLanguage:country:ratio:", v5, v6, v8);
  return v9;
}

- (BCSVisibilityItem)initWithLanguage:(id)a3 country:(id)a4 ratio:(double)a5
{
  id v8;
  id v9;
  BCSVisibilityItem *v10;
  uint64_t v11;
  NSString *language;
  uint64_t v13;
  NSString *country;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCSVisibilityItem;
  v10 = -[BCSVisibilityItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    language = v10->_language;
    v10->_language = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    country = v10->_country;
    v10->_country = (NSString *)v13;

    v10->_ratio = a5;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BCSVisibilityItem language](self, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSVisibilityItem country](self, "country");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSVisibilityItem ratio](self, "ratio");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@ - %@) : %f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  id v5;

  language = self->_language;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", language, CFSTR("BCSVisibilityItemLanguageKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_country, CFSTR("BCSVisibilityItemCountryKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("BCSVisibilityItemRatioKey"), self->_ratio);

}

- (BCSVisibilityItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BCSVisibilityItem *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSVisibilityItemLanguageKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSVisibilityItemCountryKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BCSVisibilityItemRatioKey"));
  v8 = v7;

  v9 = -[BCSVisibilityItem initWithLanguage:country:ratio:](self, "initWithLanguage:country:ratio:", v5, v6, v8);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSVisibilityItem language](self, "language");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = (void *)v5[1];
    v5[1] = v7;

    -[BCSVisibilityItem language](self, "language");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = (void *)v5[2];
    v5[2] = v10;

    -[BCSVisibilityItem ratio](self, "ratio");
    v5[3] = v12;
  }
  return v5;
}

- (BOOL)isVisibleForDSID:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int64_t v9;
  double v10;
  double v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = +[BCSHashService SHA256TruncatedHashForInputString:includedBytes:](BCSHashService, "SHA256TruncatedHashForInputString:includedBytes:", v4, 32);
  v6 = objc_msgSend(v4, "length");
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || (v5 & 0x8000000000000000) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "length");
      NSStringFromBOOL();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      v19 = 2114;
      v20 = *(double *)&v15;
      v21 = 2114;
      v22 = v16;
      _os_log_error_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_ERROR, "%s isVisible - DSID length greater than 0:%{public}@ - hashedDSID greater than 0:%{public}@", (uint8_t *)&v17, 0x20u);

    }
    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s isVisible - valid DSID & hashedDSID", (uint8_t *)&v17, 0xCu);
    }

    v9 = v5 % 0xF4240;
    -[BCSVisibilityItem ratio](self, "ratio");
    v11 = v10 * 1000000.0;
    ABSLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[BCSVisibilityItem isVisibleForDSID:]";
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_DEFAULT, "%s isVisible - visibilityConverted:%f", (uint8_t *)&v17, 0x16u);
    }

    v13 = v11 > (double)v9;
  }

  return v13;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)country
{
  return self->_country;
}

- (double)ratio
{
  return self->_ratio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
