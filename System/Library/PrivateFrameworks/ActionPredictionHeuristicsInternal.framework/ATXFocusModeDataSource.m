@implementation ATXFocusModeDataSource

- (ATXFocusModeDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXFocusModeDataSource *v6;
  ATXFocusModeDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFocusModeDataSource;
  v6 = -[ATXFocusModeDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)isFocusModeActive:(id)a3
{
  void (**v3)(id, uint64_t, id);
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = (void (**)(id, uint64_t, id))a3;
  +[ATXHeuristicResultCache sharedInstance](ATXHeuristicResultCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v5 = objc_msgSend(v4, "isFocusModeActiveWithError:", &v7);
  v6 = v7;

  v3[2](v3, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
