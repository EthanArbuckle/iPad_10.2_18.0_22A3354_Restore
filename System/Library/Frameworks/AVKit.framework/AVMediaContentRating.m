@implementation AVMediaContentRating

- (AVMediaContentRating)initWithRating:(id)a3 rank:(int64_t)a4 countryCode:(id)a5 domain:(int64_t)a6
{
  id v10;
  id v11;
  AVMediaContentRating *v12;
  uint64_t v13;
  NSString *displayName;
  uint64_t v15;
  NSString *countryCode;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVMediaContentRating;
  v12 = -[AVMediaContentRating init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    displayName = v12->_displayName;
    v12->_displayName = (NSString *)v13;

    v12->_rank = a4;
    v15 = objc_msgSend(v11, "copy");
    countryCode = v12->_countryCode;
    v12->_countryCode = (NSString *)v15;

    v12->_domain = a6;
    -[AVMediaContentRating _setRestricted:](v12, "_setRestricted:", -[AVMediaContentRating _isCurrentlyRestricted](v12, "_isCurrentlyRestricted"));
  }

  return v12;
}

- (AVMediaContentRating)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("init unavailable"));

  return 0;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[AVMediaContentRating displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVMediaContentRatings imageForRating:](AVMediaContentRatings, "imageForRating:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (BOOL)isImageMask
{
  void *v2;
  BOOL v3;

  -[AVMediaContentRating displayName](self, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[AVMediaContentRatings isRatingImageMask:](AVMediaContentRatings, "isRatingImageMask:", v2);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[AVMediaContentRating displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[AVMediaContentRating rank](self, "rank") ^ v4;

  return v5;
}

- (BOOL)isEqualToMediaContentRating:(id)a3
{
  AVMediaContentRating *v4;
  AVMediaContentRating *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (AVMediaContentRating *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4
         && (v6 = -[AVMediaContentRating domain](v4, "domain"), v6 == -[AVMediaContentRating domain](self, "domain")))
  {
    -[AVMediaContentRating countryCode](v5, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMediaContentRating countryCode](self, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[AVMediaContentRating displayName](v5, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMediaContentRating displayName](self, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

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

- (BOOL)isEqual:(id)a3
{
  AVMediaContentRating *v4;
  BOOL v5;

  v4 = (AVMediaContentRating *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[AVMediaContentRating isEqualToMediaContentRating:](self, "isEqualToMediaContentRating:", v4);
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  __CFString *v14;
  __CFString *v15;
  _BOOL4 v16;
  const __CFString *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMediaContentRating countryCode](self, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForCountryCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[AVMediaContentRating countryCode](self, "countryCode");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[AVMediaContentRating displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[AVMediaContentRating rank](self, "rank");
  -[AVMediaContentRating countryCode](self, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVMediaContentRating domain](self, "domain");
  v14 = CFSTR("Unknown");
  if (v13 == 1)
    v14 = CFSTR("Movies");
  if (v13 == 2)
    v14 = CFSTR("TVShows");
  v15 = v14;
  v16 = -[AVMediaContentRating isRestricted](self, "isRestricted");
  v17 = CFSTR("not restricted");
  if (v16)
    v17 = CFSTR("restricted");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<AVMediaContentRating: \"%@\" %d \"%@\" %@ (%@) - %@>"), v10, v11, v12, v8, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)_isCurrentlyRestricted
{
  return 0;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)rank
{
  return self->_rank;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (int64_t)domain
{
  return self->_domain;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (void)_setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)contentRestrictionsCountryCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
