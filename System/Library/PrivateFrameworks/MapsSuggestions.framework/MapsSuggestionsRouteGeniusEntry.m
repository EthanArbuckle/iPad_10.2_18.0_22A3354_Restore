@implementation MapsSuggestionsRouteGeniusEntry

- (MapsSuggestionsRouteGeniusEntry)initWithEntry:(id)a3 route:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsRouteGeniusEntry *v9;
  MapsSuggestionsRouteGeniusEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRouteGeniusEntry;
  v9 = -[MapsSuggestionsRouteGeniusEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entry, a3);
    objc_storeStrong((id *)&v10->_route, a4);
  }

  return v10;
}

- (id)data
{
  void *v3;
  NSObject *v4;
  int v6;
  MapsSuggestionsRouteGeniusEntry *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_ERROR, "Error archiving entry %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

+ (id)entryWithData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      GEOFindOrCreateLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = (const char *)v5;
        _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Error decoding MapsSuggestionsEntry - %@", buf, 0xCu);
      }

      v8 = 0;
    }
    else
    {
      v8 = v4;
    }

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRouteGenius.m";
      v13 = 1024;
      v14 = 37;
      v15 = 2082;
      v16 = "+[MapsSuggestionsRouteGeniusEntry entryWithData:]";
      v17 = 2082;
      v18 = "nil == (data)";
      _os_log_impl(&dword_1A427D000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  MapsSuggestionsEntry *entry;
  id v5;

  entry = self->_entry;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entry, CFSTR("entry"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_route, CFSTR("route"));

}

- (MapsSuggestionsRouteGeniusEntry)initWithCoder:(id)a3
{
  id v4;
  MapsSuggestionsRouteGeniusEntry *v5;
  uint64_t v6;
  MapsSuggestionsEntry *entry;
  uint64_t v8;
  GEOComposedRoute *route;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsRouteGeniusEntry;
  v5 = -[MapsSuggestionsRouteGeniusEntry init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entry"));
    v6 = objc_claimAutoreleasedReturnValue();
    entry = v5->_entry;
    v5->_entry = (MapsSuggestionsEntry *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route"));
    v8 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (GEOComposedRoute *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)etaInSeconds
{
  void *v3;
  double v4;
  double v5;

  if (!-[MapsSuggestionsEntry containsKey:](self->_entry, "containsKey:", CFSTR("MapsSuggestionsETAKey")))
    return (double)-[GEOComposedRoute expectedTime](self->_route, "expectedTime");
  -[MapsSuggestionsEntry ETAForKey:](self->_entry, "ETAForKey:", CFSTR("MapsSuggestionsETAKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seconds");
  v5 = v4;

  return v5;
}

- (MapsSuggestionsEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
  objc_storeStrong((id *)&self->_entry, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
