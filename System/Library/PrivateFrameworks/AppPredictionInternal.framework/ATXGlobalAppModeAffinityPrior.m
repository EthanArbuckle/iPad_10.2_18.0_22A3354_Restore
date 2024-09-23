@implementation ATXGlobalAppModeAffinityPrior

- (ATXGlobalAppModeAffinityPrior)initWithMode:(unint64_t)a3 prior:(double)a4 bundleId:(id)a5
{
  id v8;
  ATXGlobalAppModeAffinityPrior *v9;
  ATXGlobalAppModeAffinityPrior *v10;
  uint64_t v11;
  NSString *bundleId;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXGlobalAppModeAffinityPrior;
  v9 = -[ATXGlobalAppModeAffinityPrior init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_mode = a3;
    v9->_prior = a4;
    v11 = objc_msgSend(v8, "copy");
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

  }
  return v10;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (double)prior
{
  return self->_prior;
}

- (void)setPrior:(double)a3
{
  self->_prior = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
