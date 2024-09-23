@implementation _ANEPerformanceStatsIOSurface

+ (id)objectWithIOSurface:(id)a3 statType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIOSurface:statType:", v6, a4);

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEPerformanceStatsIOSurface)init
{

  return 0;
}

- (_ANEPerformanceStatsIOSurface)initWithIOSurface:(id)a3 statType:(int64_t)a4
{
  id v7;
  _ANEPerformanceStatsIOSurface *v8;
  _ANEPerformanceStatsIOSurface *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_ANEPerformanceStatsIOSurface;
  v8 = -[_ANEPerformanceStatsIOSurface init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stats, a3);
    v9->_statType = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEPerformanceStatsIOSurface stats](self, "stats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {stats=%@ ; statType=%lu }"),
    v5,
    v6,
    -[_ANEPerformanceStatsIOSurface statType](self, "statType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)statType
{
  return self->_statType;
}

- (_ANEIOSurfaceObject)stats
{
  return self->_stats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
}

@end
