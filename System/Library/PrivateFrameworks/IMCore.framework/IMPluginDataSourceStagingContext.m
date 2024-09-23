@implementation IMPluginDataSourceStagingContext

- (IMPluginDataSourceStagingContext)initWithTransientIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4
{
  id v7;
  IMPluginDataSourceStagingContext *v8;
  IMPluginDataSourceStagingContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMPluginDataSourceStagingContext;
  v8 = -[IMPluginDataSourceStagingContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transientIdentifier, a3);
    v9->_isEmbeddedInTextView = a4;
  }

  return v9;
}

+ (IMPluginDataSourceStagingContext)stagingContextWithIdentifier:(id)a3 isEmbeddedInTextView:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  IMPluginDataSourceStagingContext *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[IMPluginDataSourceStagingContext initWithTransientIdentifier:isEmbeddedInTextView:]([IMPluginDataSourceStagingContext alloc], "initWithTransientIdentifier:isEmbeddedInTextView:", v5, v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IMPluginDataSourceStagingContext *v4;
  void *v5;
  IMPluginDataSourceStagingContext *v6;

  v4 = [IMPluginDataSourceStagingContext alloc];
  -[IMPluginDataSourceStagingContext transientIdentifier](self, "transientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMPluginDataSourceStagingContext initWithTransientIdentifier:isEmbeddedInTextView:](v4, "initWithTransientIdentifier:isEmbeddedInTextView:", v5, -[IMPluginDataSourceStagingContext isEmbeddedInTextView](self, "isEmbeddedInTextView"));

  return v6;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (void)setTransientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transientIdentifier, a3);
}

- (BOOL)isEmbeddedInTextView
{
  return self->_isEmbeddedInTextView;
}

- (void)setIsEmbeddedInTextView:(BOOL)a3
{
  self->_isEmbeddedInTextView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

@end
