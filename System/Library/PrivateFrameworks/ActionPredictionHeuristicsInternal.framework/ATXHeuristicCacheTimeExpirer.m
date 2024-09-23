@implementation ATXHeuristicCacheTimeExpirer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)_stop
{
  NSObject *source;

  source = self->_source;
  if (source)
    dispatch_source_cancel(source);
}

void __38__ATXHeuristicCacheTimeExpirer__start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "expire");

}

- (ATXHeuristicCacheTimeExpirer)initWithFireDate:(id)a3
{
  id v5;
  ATXHeuristicCacheTimeExpirer *v6;
  id v7;
  double v8;
  uint64_t v9;
  NSDate *fireDate;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXHeuristicResultCache.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fireDate"));

  }
  v13.receiver = self;
  v13.super_class = (Class)ATXHeuristicCacheTimeExpirer;
  v6 = -[ATXHeuristicCacheExpirer init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v9 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:", floor(v8));
    fireDate = v6->_fireDate;
    v6->_fireDate = (NSDate *)v9;

  }
  return v6;
}

- (void)_start
{
  double v3;
  double v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *source;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (!self->_source)
  {
    -[NSDate timeIntervalSinceNow](self->_fireDate, "timeIntervalSinceNow");
    if (v3 > 0.0)
    {
      v4 = v3;
      objc_initWeak(&location, self);
      dispatch_get_global_queue(9, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
      source = self->_source;
      self->_source = v6;

      v8 = self->_source;
      v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
      v10 = self->_source;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __38__ATXHeuristicCacheTimeExpirer__start__block_invoke;
      v11[3] = &unk_1E82C4900;
      objc_copyWeak(&v12, &location);
      dispatch_source_set_event_handler(v10, v11);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_fireDate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXHeuristicCacheTimeExpirer *v4;
  NSDate *v5;
  NSDate *v6;
  char v7;

  v4 = (ATXHeuristicCacheTimeExpirer *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = self->_fireDate;
      v6 = v5;
      if (v5 == v4->_fireDate)
        v7 = 1;
      else
        v7 = -[NSDate isEqual:](v5, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fireDate, CFSTR("fireDate"));
}

- (ATXHeuristicCacheTimeExpirer)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicCacheTimeExpirer *v5;
  uint64_t v6;
  NSDate *fireDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicCacheTimeExpirer;
  v5 = -[ATXHeuristicCacheExpirer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fireDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<expire at %@ (watching: %i)>"), self->_fireDate, self->_source != 0);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

@end
