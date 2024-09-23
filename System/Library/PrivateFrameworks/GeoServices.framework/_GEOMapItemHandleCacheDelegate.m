@implementation _GEOMapItemHandleCacheDelegate

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  GEOMapItemStorage *v8;
  void *v9;
  GEOMapItemStorage *v10;
  NSObject *v11;
  int v12;
  GEOMapItemStorage *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    v7 = v4;
    v8 = [GEOMapItemStorage alloc];
    objc_msgSend(v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOMapItemStorage initWithData:](v8, "initWithData:", v9);

    GEOFindOrCreateLog("com.apple.GeoServices", "GEOMapService");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138477827;
      v13 = v10;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_DEBUG, "Handle cache evicting map item: %{private}@", (uint8_t *)&v12, 0xCu);
    }

  }
}

@end
