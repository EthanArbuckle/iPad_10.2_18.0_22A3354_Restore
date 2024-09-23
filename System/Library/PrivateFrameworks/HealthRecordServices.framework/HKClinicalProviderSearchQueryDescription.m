@implementation HKClinicalProviderSearchQueryDescription

- (HKClinicalProviderSearchQueryDescription)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalProviderSearchQueryDescription)initWithSearchString:(id)a3 latitude:(id)a4 longitude:(id)a5 pageOffset:(int64_t)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  HKClinicalProviderSearchQueryDescription *v15;
  uint64_t v16;
  NSString *searchString;
  uint64_t v18;
  NSNumber *latitude;
  uint64_t v20;
  NSNumber *longitude;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HKClinicalProviderSearchQueryDescription;
  v15 = -[HKClinicalProviderSearchQueryDescription init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    searchString = v15->_searchString;
    v15->_searchString = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    latitude = v15->_latitude;
    v15->_latitude = (NSNumber *)v18;

    v20 = objc_msgSend(v14, "copy");
    longitude = v15->_longitude;
    v15->_longitude = (NSNumber *)v20;

    v15->_pageOffset = a6;
    v15->_options = a7;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKClinicalProviderSearchQueryDescription *v5;
  HKClinicalProviderSearchQueryDescription *v6;
  HKClinicalProviderSearchQueryDescription *v7;
  NSString *searchString;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  BOOL v13;
  NSNumber *latitude;
  NSNumber *v15;
  uint64_t v16;
  void *v17;
  NSNumber *v18;
  uint64_t v19;
  NSNumber *v20;
  void *v21;
  NSNumber *longitude;
  NSNumber *v23;
  void *v24;
  NSNumber *v25;
  int64_t v26;
  unint64_t v27;
  int64_t pageOffset;
  unint64_t options;
  BOOL v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = (HKClinicalProviderSearchQueryDescription *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_39:

      goto LABEL_40;
    }
    searchString = self->_searchString;
    -[HKClinicalProviderSearchQueryDescription searchString](v7, "searchString");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (searchString != v9)
    {
      -[HKClinicalProviderSearchQueryDescription searchString](v7, "searchString");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v13 = 0;
        goto LABEL_38;
      }
      v3 = (void *)v10;
      v11 = self->_searchString;
      -[HKClinicalProviderSearchQueryDescription searchString](v7, "searchString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqual:](v11, "isEqual:", v12))
      {
        v13 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v36 = v12;
    }
    latitude = self->_latitude;
    -[HKClinicalProviderSearchQueryDescription latitude](v7, "latitude");
    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (latitude != v15)
    {
      -[HKClinicalProviderSearchQueryDescription latitude](v7, "latitude");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v13 = 0;
        goto LABEL_27;
      }
      v17 = (void *)v16;
      v18 = self->_latitude;
      -[HKClinicalProviderSearchQueryDescription latitude](v7, "latitude");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = (void *)v19;
      if ((-[NSNumber isEqual:](v20, "isEqual:", v19) & 1) == 0)
      {

        v13 = 0;
        goto LABEL_36;
      }
      v34 = v21;
      v35 = v17;
    }
    longitude = self->_longitude;
    -[HKClinicalProviderSearchQueryDescription longitude](v7, "longitude");
    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (longitude == v23)
    {
      pageOffset = self->_pageOffset;
      if (pageOffset == -[HKClinicalProviderSearchQueryDescription pageOffset](v7, "pageOffset"))
      {
        options = self->_options;
        v30 = options == -[HKClinicalProviderSearchQueryDescription options](v7, "options");
      }
      else
      {
        v30 = 0;
      }

      v13 = v30;
    }
    else
    {
      -[HKClinicalProviderSearchQueryDescription longitude](v7, "longitude");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v33 = v3;
        v25 = self->_longitude;
        -[HKClinicalProviderSearchQueryDescription longitude](v7, "longitude");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSNumber isEqual:](v25, "isEqual:") & 1) == 0)
        {
          v13 = 0;
          goto LABEL_25;
        }
        v26 = self->_pageOffset;
        if (v26 == -[HKClinicalProviderSearchQueryDescription pageOffset](v7, "pageOffset"))
        {
          v27 = self->_options;
          v13 = v27 == -[HKClinicalProviderSearchQueryDescription options](v7, "options");
LABEL_25:
          v3 = v33;

          if (latitude != v15)
          {

LABEL_27:
            v12 = v36;

            if (searchString == v9)
              goto LABEL_38;
            goto LABEL_37;
          }

LABEL_36:
          v12 = v36;
          if (searchString != v9)
            goto LABEL_37;
LABEL_38:

          goto LABEL_39;
        }

        v3 = v33;
      }

      v30 = 0;
      v13 = 0;
    }
    if (latitude != v15)
    {

      v13 = v30;
    }

    goto LABEL_36;
  }
  v13 = 1;
LABEL_40:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_searchString, "hash");
  v4 = -[NSNumber hash](self->_latitude, "hash") ^ v3;
  return v4 ^ -[NSNumber hash](self->_longitude, "hash") ^ self->_pageOffset ^ self->_options;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *searchString;
  id v5;

  searchString = self->_searchString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", searchString, CFSTR("SearchString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latitude, CFSTR("Latitude"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_longitude, CFSTR("Longitude"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pageOffset, CFSTR("PageOffset"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));

}

- (HKClinicalProviderSearchQueryDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKClinicalProviderSearchQueryDescription *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SearchString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("PageOffset"))
    && (objc_msgSend(v4, "containsValueForKey:", CFSTR("Options")) & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Latitude"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Longitude"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKClinicalProviderSearchQueryDescription initWithSearchString:latitude:longitude:pageOffset:options:](self, "initWithSearchString:latitude:longitude:pageOffset:options:", v5, v6, v7, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PageOffset")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Options")));

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
