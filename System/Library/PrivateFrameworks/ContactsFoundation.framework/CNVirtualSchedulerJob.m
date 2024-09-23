@implementation CNVirtualSchedulerJob

+ (id)jobWithTime:(unint64_t)a3 block:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTime:block:", a3, v6);

  return v7;
}

- (CNVirtualSchedulerJob)initWithTime:(unint64_t)a3 block:(id)a4
{
  id v6;
  CNVirtualSchedulerJob *v7;
  CNVirtualSchedulerJob *v8;
  uint64_t v9;
  id block;
  CNVirtualSchedulerJob *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVirtualSchedulerJob;
  v7 = -[CNVirtualSchedulerJob init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_time = a3;
    v9 = objc_msgSend(v6, "copy");
    block = v8->_block;
    v8->_block = (id)v9;

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNVirtualSchedulerJob time](self, "time");
  -[CNVirtualSchedulerJob block](self, "block");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _Block_copy(v7);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p time=%lu block=%p"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)time
{
  return self->_time;
}

- (void)setTime:(unint64_t)a3
{
  self->_time = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
