@implementation MTRContentLauncherClusterDimensionStruct

- (MTRContentLauncherClusterDimensionStruct)init
{
  MTRContentLauncherClusterDimensionStruct *v2;
  MTRContentLauncherClusterDimensionStruct *v3;
  NSNumber *width;
  NSNumber *height;
  NSNumber *metric;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterDimensionStruct;
  v2 = -[MTRContentLauncherClusterDimensionStruct init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    width = v2->_width;
    v2->_width = (NSNumber *)&unk_250591B18;

    height = v3->_height;
    v3->_height = (NSNumber *)&unk_250591B18;

    metric = v3->_metric;
    v3->_metric = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRContentLauncherClusterDimensionStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTRContentLauncherClusterDimensionStruct);
  objc_msgSend_width(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWidth_(v4, v8, (uint64_t)v7);

  objc_msgSend_height(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHeight_(v4, v12, (uint64_t)v11);

  objc_msgSend_metric(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMetric_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: width:%@; height:%@; metric:%@; >"),
    v5,
    self->_width,
    self->_height,
    self->_metric);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)width
{
  return self->_width;
}

- (void)setWidth:(NSNumber *)width
{
  objc_setProperty_nonatomic_copy(self, a2, width, 8);
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(NSNumber *)height
{
  objc_setProperty_nonatomic_copy(self, a2, height, 16);
}

- (NSNumber)metric
{
  return self->_metric;
}

- (void)setMetric:(NSNumber *)metric
{
  objc_setProperty_nonatomic_copy(self, a2, metric, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

@end
