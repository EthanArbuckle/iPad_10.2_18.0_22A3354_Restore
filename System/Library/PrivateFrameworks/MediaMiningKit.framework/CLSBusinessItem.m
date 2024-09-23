@implementation CLSBusinessItem

- (id)initFromMapItem:(id)a3 isoCountryCode:(id)a4 categoryOnly:(BOOL)a5
{
  id v8;
  id v9;
  CLSBusinessItem *v10;
  void *v11;
  void *v12;
  void *v13;
  CLCircularRegion *v14;
  void *region;
  CLSBusinessItem *v16;
  double v17;
  double v18;
  double v19;
  CLLocationDegrees v20;
  double v21;
  CLLocationDegrees v22;
  id v23;
  CLLocationCoordinate2D v24;
  void *v25;
  uint64_t v26;
  CLCircularRegion *v27;
  uint64_t v28;
  NSString *geoServiceProvider;
  uint64_t v30;
  NSString *name;
  uint64_t v32;
  NSArray *businessCategories;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "_hasMUID") & 1) != 0)
  {
    v35.receiver = self;
    v35.super_class = (Class)CLSBusinessItem;
    v10 = -[CLSBusinessItem init](&v35, sel_init);
    if (v10)
    {
      objc_msgSend(v8, "spatialMappedCategories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_regionFromMapItem:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
        region = v10->_region;
        v10->_region = v14;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_defaultRadiusForCategories:", v11);
        v18 = v17;
        objc_msgSend(v8, "centerCoordinate");
        v20 = v19;
        v22 = v21;
        v23 = objc_alloc(MEMORY[0x1E0C9E368]);
        v24 = CLLocationCoordinate2DMake(v20, v22);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        region = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(region, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "initWithCenter:radius:identifier:", v25, v24.latitude, v24.longitude, v18);
        v27 = v10->_region;
        v10->_region = (CLCircularRegion *)v26;

      }
      objc_storeStrong((id *)&v10->_isoCountryCode, a4);
      objc_msgSend(MEMORY[0x1E0D71A98], "currentRevGeoProvider");
      v28 = objc_claimAutoreleasedReturnValue();
      geoServiceProvider = v10->_geoServiceProvider;
      v10->_geoServiceProvider = (NSString *)v28;

      v10->_cached = 0;
      objc_storeStrong((id *)&v10->_categories, v11);
      v10->_muid = objc_msgSend(v8, "_muid");
      if (!a5)
      {
        v10->_venueCapacity = objc_msgSend(v8, "venueCapacity");
        objc_msgSend(v8, "name");
        v30 = objc_claimAutoreleasedReturnValue();
        name = v10->_name;
        v10->_name = (NSString *)v30;

        objc_msgSend((id)objc_opt_class(), "_businessCategoriesFromGeoMapItems:", v8);
        v32 = objc_claimAutoreleasedReturnValue();
        businessCategories = v10->_businessCategories;
        v10->_businessCategories = (NSArray *)v32;

      }
    }
    self = v10;
    v16 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v37 = v8;
      _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot create BusinessItem from MapItem %{private}@ with no MUID", buf, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

- (CLSBusinessItem)initWithName:(id)a3 region:(id)a4 categories:(id)a5
{
  id v9;
  id v10;
  id v11;
  CLSBusinessItem *v12;
  CLSBusinessItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CLSBusinessItem;
  v12 = -[CLSBusinessItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_cached = 0;
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_region, a4);
    objc_storeStrong((id *)&v13->_categories, a5);
  }

  return v13;
}

- (BOOL)isEnriched
{
  void *v2;
  BOOL v3;

  -[CLSBusinessItem name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (CLSBusinessItem)initWithCoder:(id)a3
{
  id v4;
  CLSBusinessItem *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  CLCircularRegion *region;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *categories;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *businessCategories;

  v4 = a3;
  v5 = -[CLSBusinessItem init](self, "init");
  if (v5)
  {
    v5->_cached = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cached"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v8 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("categories"));
    v13 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v13;

    v5->_muid = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("muid"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("businessCategories"));
    v18 = objc_claimAutoreleasedReturnValue();
    businessCategories = v5->_businessCategories;
    v5->_businessCategories = (NSArray *)v18;

    v5->_venueCapacity = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("venueCapacity"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 cached;
  id v5;

  cached = self->_cached;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", cached, CFSTR("cached"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categories, CFSTR("categories"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_businessCategories, CFSTR("businessCategories"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_muid, CFSTR("muid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_venueCapacity, CFSTR("venueCapacity"));

}

- (unint64_t)hash
{
  return self->_muid;
}

- (id)description
{
  void *v3;
  NSString *name;
  int64_t venueCapacity;
  unint64_t muid;
  void *v7;
  CLCircularRegion *region;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  name = self->_name;
  muid = self->_muid;
  venueCapacity = self->_venueCapacity;
  -[NSArray flattenWithSeparator:](self->_categories, "flattenWithSeparator:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  region = self->_region;
  -[NSArray flattenWithSeparator:](self->_businessCategories, "flattenWithSeparator:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Business Item: name:[%@] muid:[%lu] venueCapacity:[%lu] categories:[%@] region:[%@] businessCategories:[%@]"), name, muid, venueCapacity, v7, region, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int64_t)venueCapacity
{
  return self->_venueCapacity;
}

- (void)setVenueCapacity:(int64_t)a3
{
  self->_venueCapacity = a3;
}

- (NSArray)businessCategories
{
  return self->_businessCategories;
}

- (void)setBusinessCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)geoServiceProvider
{
  return self->_geoServiceProvider;
}

- (void)setGeoServiceProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceProvider, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_businessCategories, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)_regionFromMapItem:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;

  objc_msgSend(a3, "geoFenceMapRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasNorthLat")
    && objc_msgSend(v3, "hasSouthLat")
    && objc_msgSend(v3, "hasEastLng")
    && objc_msgSend(v3, "hasWestLng"))
  {
    objc_msgSend(v3, "northLat");
    v5 = v4;
    objc_msgSend(v3, "southLat");
    v7 = v6;
    objc_msgSend(v3, "westLng");
    v9 = v8;
    objc_msgSend(v3, "eastLng");
    v11 = (v5 + v7) * 0.5;
    if (v9 <= v10)
    {
      v13 = (v9 + v10) * 0.5;
    }
    else
    {
      v12 = (v10 + 360.0 - v9) * 0.5 + v9;
      if (v12 <= 180.0)
        v13 = v12;
      else
        v13 = v12 + -360.0;
    }
    objc_msgSend(v3, "southLat");
    v17 = v16;
    objc_msgSend(v3, "westLng");
    CLSCommonCalculateDistanceRadius(1, v11, v13, v17, v18);
    v20 = v19;
    v21 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%+.8f,%+.8f> radius %.2f"), *(_QWORD *)&v11, *(_QWORD *)&v13, *(_QWORD *)&v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v21, "initWithCenter:radius:identifier:", v22, v11, v13, v20);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (double)_defaultRadiusForCategories:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", &unk_1E8511C20) & 1) != 0)
  {
    v4 = 500.0;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E8511C38))
  {
    v4 = 2000.0;
  }
  else
  {
    v4 = 50.0;
  }

  return v4;
}

+ (id)_businessCategoriesFromGeoMapItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v23 = v3;
  objc_msgSend(v3, "_place");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "business");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v26 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v8, "localizedCategoriesCount"))
        {
          v27 = i;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v8, "localizedCategories");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "reverseObjectEnumerator");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v33 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                v28 = 0u;
                v29 = 0u;
                v30 = 0u;
                v31 = 0u;
                objc_msgSend(v15, "localizedNames");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v29;
                  do
                  {
                    for (k = 0; k != v18; ++k)
                    {
                      if (*(_QWORD *)v29 != v19)
                        objc_enumerationMutation(v16);
                      objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * k), "name");
                      v21 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v21, "length"))
                        objc_msgSend(v4, "addObject:", v21);

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                  }
                  while (v18);
                }

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v12);
          }

          i = v27;
        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v26);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
