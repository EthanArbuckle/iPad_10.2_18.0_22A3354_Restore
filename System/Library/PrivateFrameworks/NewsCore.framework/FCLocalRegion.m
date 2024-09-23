@implementation FCLocalRegion

- (FCLocalRegion)initWithDictionary:(id)a3
{
  id v4;
  FCLocalRegion *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSArray *autoFavoriteTagIDs;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSArray *localVersionedTagIDs;
  uint64_t v17;
  NSMutableSet *areas;
  CGSize v19;
  _QWORD v21[4];
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCLocalRegion;
  v5 = -[FCLocalRegion init](&v23, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("id"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("name"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("tagIds"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    autoFavoriteTagIDs = v5->_autoFavoriteTagIDs;
    v5->_autoFavoriteTagIDs = (NSArray *)v10;

    +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("localVersionedTags"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __36__FCLocalRegion_initWithDictionary___block_invoke;
    v21[3] = &unk_1E463AF28;
    v22 = v12;
    v14 = v12;
    objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", v21);
    v15 = objc_claimAutoreleasedReturnValue();
    localVersionedTagIDs = v5->_localVersionedTagIDs;
    v5->_localVersionedTagIDs = (NSArray *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    areas = v5->_areas;
    v5->_areas = (NSMutableSet *)v17;

    v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_rect.size = v19;

  }
  return v5;
}

id __36__FCLocalRegion_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FCLocalVersionedTag *v4;
  void *v5;

  v3 = a2;
  v4 = -[FCLocalVersionedTag initWithDictionary:]([FCLocalVersionedTag alloc], "initWithDictionary:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "isNewsVersionAllowedWithMinNewsVersion:maxNewsVersion:", -[FCLocalVersionedTag minVersion](v4, "minVersion"), -[FCLocalVersionedTag maxVersion](v4, "maxVersion")))
  {
    -[FCLocalVersionedTag identifier](v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (FCLocalRegion)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalRegion init]";
    v9 = 2080;
    v10 = "FCLocalRegion.m";
    v11 = 1024;
    v12 = 57;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCLocalRegion init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: id: %@, name: %@, autoFavoriteTagIDs: %@, localVersionTagIDs: %@"), objc_opt_class(), self->_identifier, self->_name, self->_autoFavoriteTagIDs, self->_localVersionedTagIDs);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCLocalRegion identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCLocalRegion identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)addLocalArea:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FCLocalRegion areas](self, "areas");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (CGRect)rectForEntireRegion
{
  void *v3;
  BOOL IsEmpty;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect result;

  v32 = *MEMORY[0x1E0C80C00];
  -[FCLocalRegion areas](self, "areas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[FCLocalRegion rect](self, "rect");
    IsEmpty = CGRectIsEmpty(v33);

    if (IsEmpty)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[FCLocalRegion areas](self, "areas", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v28;
        v9 = 90.0;
        v10 = -90.0;
        v11 = 180.0;
        v12 = -180.0;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v5);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v14, "isBboxValid"))
            {
              objc_msgSend(v14, "minLat");
              if (v15 < v9)
              {
                objc_msgSend(v14, "minLat");
                v9 = v16;
              }
              objc_msgSend(v14, "maxLat");
              if (v17 > v10)
              {
                objc_msgSend(v14, "maxLat");
                v10 = v18;
              }
              objc_msgSend(v14, "minLon");
              if (v19 < v11)
              {
                objc_msgSend(v14, "minLon");
                v11 = v20;
              }
              objc_msgSend(v14, "maxLon");
              if (v21 > v12)
              {
                objc_msgSend(v14, "maxLon");
                v12 = v22;
              }
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v7);
      }
      else
      {
        v9 = 90.0;
        v10 = -90.0;
        v11 = 180.0;
        v12 = -180.0;
      }

      -[FCLocalRegion setRect:](self, "setRect:", v11, v9, v12 - v11, v10 - v9);
    }
  }
  else
  {

  }
  -[FCLocalRegion rect](self, "rect");
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CLLocationCoordinate2D)centerLocationCoordinateForEntireRegion
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidY;
  CGFloat MidX;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v10;
  CLLocationCoordinate2D result;
  CGRect v12;
  CGRect v13;

  -[FCLocalRegion rectForEntireRegion](self, "rectForEntireRegion");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidY = CGRectGetMidY(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidX = CGRectGetMidX(v13);
  v10 = CLLocationCoordinate2DMake(MidY, MidX);
  longitude = v10.longitude;
  latitude = v10.latitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)autoFavoriteTagIDs
{
  return self->_autoFavoriteTagIDs;
}

- (NSArray)localVersionedTagIDs
{
  return self->_localVersionedTagIDs;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSMutableSet)areas
{
  return self->_areas;
}

- (void)setAreas:(id)a3
{
  objc_storeStrong((id *)&self->_areas, a3);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areas, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_localVersionedTagIDs, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
