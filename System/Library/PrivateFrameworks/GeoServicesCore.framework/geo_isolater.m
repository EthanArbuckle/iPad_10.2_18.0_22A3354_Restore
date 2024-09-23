@implementation geo_isolater

- (void)dealloc
{
  char *name;
  objc_super v4;

  name = self->_name;
  if (name)
    free(name);
  v4.receiver = self;
  v4.super_class = (Class)geo_isolater;
  -[geo_isolater dealloc](&v4, sel_dealloc);
}

- (geo_isolater)initWithName:(const char *)a3
{
  geo_isolater *v4;
  geo_isolater *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)geo_isolater;
  v4 = -[geo_isolater init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_name = strndup(a3, 0x1EuLL);
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %s>"), v5, self, self->_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
