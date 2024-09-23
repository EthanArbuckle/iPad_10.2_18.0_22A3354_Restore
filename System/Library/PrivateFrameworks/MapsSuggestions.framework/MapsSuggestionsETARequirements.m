@implementation MapsSuggestionsETARequirements

- (MapsSuggestionsETARequirements)initWithMaxAge:(double)a3 maxDistance:(double)a4 minAccuracy:(double)a5
{
  MapsSuggestionsETARequirements *v5;
  NSObject *v6;
  MapsSuggestionsETARequirements *v8;
  MapsSuggestionsETARequirements *v12;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v5 = self;
  v22 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      v16 = 1024;
      v17 = 36;
      v18 = 2082;
      v19 = "-[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:]";
      v20 = 2082;
      v21 = "0.0 == maxAge";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires maximum age", buf, 0x26u);
    }
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  if (a4 == 0.0)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsETA.mm";
      v16 = 1024;
      v17 = 37;
      v18 = 2082;
      v19 = "-[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:]";
      v20 = 2082;
      v21 = "0.0 == maxDistance";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires maximum distance", buf, 0x26u);
    }
    goto LABEL_8;
  }
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsETARequirements;
  v12 = -[MapsSuggestionsETARequirements init](&v13, sel_init);
  if (v12)
  {
    v12->_maxAge = a3;
    v12->_maxDistance = a4;
    v12->_minAccuracy = a5;
  }
  v5 = v12;
  v8 = v5;
LABEL_9:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MapsSuggestionsETARequirements initWithMaxAge:maxDistance:minAccuracy:](+[MapsSuggestionsETARequirements allocWithZone:](MapsSuggestionsETARequirements, "allocWithZone:", a3), "initWithMaxAge:maxDistance:minAccuracy:", self->_maxAge, self->_maxDistance, self->_minAccuracy);
}

- (double)maxAge
{
  return self->_maxAge;
}

- (double)maxDistance
{
  return self->_maxDistance;
}

- (double)minAccuracy
{
  return self->_minAccuracy;
}

@end
