@implementation SRApplication

+ (id)sharedApplication
{
  return +[UIApplication sharedApplication](UIApplication, "sharedApplication");
}

- (CGRect)applicationFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRApplication dataSource](self, "dataSource"));
  objc_msgSend(v3, "frameForApplication:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)launchOrientation
{
  return self->_frontMostAppOrientation;
}

- (int64_t)_frontMostAppOrientation
{
  return self->_frontMostAppOrientation;
}

- (void)setFrontMostAppOrientation:(int64_t)a3
{
  self->_frontMostAppOrientation = a3;
}

- (SRApplicationDataSource)dataSource
{
  return (SRApplicationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
