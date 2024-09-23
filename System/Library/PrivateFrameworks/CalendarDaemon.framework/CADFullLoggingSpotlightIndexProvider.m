@implementation CADFullLoggingSpotlightIndexProvider

- (CADFullLoggingSpotlightIndexProvider)initWithProvider:(id)a3
{
  id v5;
  CADFullLoggingSpotlightIndexProvider *v6;
  CADFullLoggingSpotlightIndexProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADFullLoggingSpotlightIndexProvider;
  v6 = -[CADFullLoggingSpotlightIndexProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedProvider, a3);

  return v7;
}

- (id)newSpotlightIndexForBundleID:(id)a3
{
  void *v3;
  CADFullLoggingSpotlightIndex *v4;

  v3 = (void *)-[CADSpotlightIndexProvider newSpotlightIndexForBundleID:](self->_wrappedProvider, "newSpotlightIndexForBundleID:", a3);
  v4 = -[CADFullLoggingSpotlightIndex initWithIndex:]([CADFullLoggingSpotlightIndex alloc], "initWithIndex:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedProvider, 0);
}

@end
