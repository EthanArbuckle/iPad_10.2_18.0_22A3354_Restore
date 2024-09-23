@implementation _NUImageDataResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUImageDataResult data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> data=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
