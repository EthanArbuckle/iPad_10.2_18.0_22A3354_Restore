@implementation CalRoute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalRoute)initWithCoder:(id)a3
{
  id v4;
  CalRoute *v5;
  void *v6;
  uint64_t v7;
  CalLocation *start;
  void *v9;
  uint64_t v10;
  CalLocation *end;
  void *v12;
  uint64_t v13;
  NSString *route;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CalRoute;
  v5 = -[CalRoute init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("start"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    start = v5->_start;
    v5->_start = (CalLocation *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("end"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    end = v5->_end;
    v5->_end = (CalLocation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    route = v5->_route;
    v5->_route = (NSString *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v15;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalRoute route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\troute: %@"), v7);

  -[CalRoute duration](self, "duration");
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tduration: %f"), v8);
  -[CalRoute start](self, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tstart: %@"), v9);

  -[CalRoute end](self, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\tend: %@"), v10);

  return v6;
}

- (NSString)route
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (double)duration
{
  return self->_duration;
}

- (CalLocation)start
{
  return (CalLocation *)objc_getProperty(self, a2, 8, 1);
}

- (CalLocation)end
{
  return (CalLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CalRoute start](self, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("start"));

  -[CalRoute end](self, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("end"));

  -[CalRoute route](self, "route");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("route"));

  -[CalRoute duration](self, "duration");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("duration"));

}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setRoute:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
