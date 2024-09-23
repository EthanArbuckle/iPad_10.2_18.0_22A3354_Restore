@implementation GEOTrailHead

- (GEOTrailHead)initWithTrailHead:(id)a3
{
  id *v4;
  GEOTrailHead *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *trails;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTrailHead;
  v5 = -[GEOTrailHead init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    -[GEOPDTrailHead trails](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailsFromProtos:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    trails = v5->_trails;
    v5->_trails = (NSArray *)v8;

    v10 = (void *)objc_opt_class();
    v5->_displayType = objc_msgSend(v10, "_convertedDisplayType:", -[GEOPDTrailHead hikingDisplayType]((uint64_t)v4));
    if (v4)
      v11 = *((unsigned int *)v4 + 14);
    else
      v11 = 0;
    v5->_numberOfInlineItems = v11;
  }

  return v5;
}

+ (int)_convertedDisplayType:(int)a3
{
  return a3 != 1;
}

+ (id)trailsFromProtos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOTrail *v11;
  GEOTrail *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [GEOTrail alloc];
        v12 = -[GEOTrail initWithTrail:](v11, "initWithTrail:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)trails
{
  return self->_trails;
}

- (int)displayType
{
  return self->_displayType;
}

- (unint64_t)numberOfInlineItems
{
  return self->_numberOfInlineItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trails, 0);
}

@end
