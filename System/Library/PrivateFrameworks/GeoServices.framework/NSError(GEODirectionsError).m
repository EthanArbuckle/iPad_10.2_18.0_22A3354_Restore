@implementation NSError(GEODirectionsError)

+ (id)_geo_errorWithDirectionsError:()GEODirectionsError
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GEODirectionsError key](GEODirectionsError, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:userInfo:", -10, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_geo_directionsErrorInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEODirectionsError key](GEODirectionsError, "key");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
