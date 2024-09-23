@implementation GEOComposedRouteLengthMarker

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  GEOComposedRouteLengthMarker *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pathIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "pathIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pointIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "pointIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

    if (!v7)
    {
      GEOGetGEOComposedRouteLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412546;
        v16 = self;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Multiple length markers for same position on route:\n%@\n%@", (uint8_t *)&v15, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_length);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "length");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "compare:", v13);

    }
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d:%d - %0.1f meters"), self->_pathIndex, self->_pointIndex, *(_QWORD *)&self->_length);
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (void)setPathIndex:(unint64_t)a3
{
  self->_pathIndex = a3;
}

- (unint64_t)pointIndex
{
  return self->_pointIndex;
}

- (void)setPointIndex:(unint64_t)a3
{
  self->_pointIndex = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end
