@implementation _NSHTTPAlternativeServicesFilter

- (id)copyWithZone:(_NSZone *)a3
{
  _NSHTTPAlternativeServicesFilter *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(_NSHTTPAlternativeServicesFilter);
  -[_NSHTTPAlternativeServicesFilter host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServicesFilter setHost:](v4, "setHost:", v5);

  -[_NSHTTPAlternativeServicesFilter setPort:](v4, "setPort:", -[_NSHTTPAlternativeServicesFilter port](self, "port"));
  -[_NSHTTPAlternativeServicesFilter partition](self, "partition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NSHTTPAlternativeServicesFilter setPartition:](v4, "setPartition:", v6);

  return v4;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void)setPartition:(id)a3
{
  id v4;
  __CFString *v5;
  NSString *partition;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("none");
  partition = self->_partition;
  self->_partition = &v5->isa;

}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (int64_t)port
{
  return self->_port;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSString)host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

+ (id)emptyFilter
{
  return objc_alloc_init(_NSHTTPAlternativeServicesFilter);
}

@end
