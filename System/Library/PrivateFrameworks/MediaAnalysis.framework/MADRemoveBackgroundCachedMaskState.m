@implementation MADRemoveBackgroundCachedMaskState

- (MADRemoveBackgroundCachedMaskState)initWithImageAsset:(id)a3 instanceMaskObservation:(id)a4 regionOfInterest:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  MADRemoveBackgroundCachedMaskState *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MADRemoveBackgroundCachedMaskState;
  v13 = -[MADRemoveBackgroundCachedMaskState init](&v17, sel_init);
  if (v13)
  {
    objc_msgSend(v11, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_instanceMaskObservation, a4);
    v13->_regionOfInterest.origin.x = x;
    v13->_regionOfInterest.origin.y = y;
    v13->_regionOfInterest.size.width = width;
    v13->_regionOfInterest.size.height = height;
  }

  return v13;
}

- (BOOL)matchesImageAsset:(id)a3
{
  NSString *identifier;
  void *v4;

  identifier = self->_identifier;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v4);

  return (char)identifier;
}

- (VNInstanceMaskObservation)instanceMaskObservation
{
  return self->_instanceMaskObservation;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceMaskObservation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
