@implementation ACActivityPresentationOptions

- (id)_init
{
  ACActivityPresentationOptions *v2;
  ACActivityPresentationOptions *v3;
  NSArray *destinations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACActivityPresentationOptions;
  v2 = -[ACActivityPresentationOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_isUserDismissalAllowedOnLockScreen = 256;
    destinations = v2->_destinations;
    v2->_destinations = (NSArray *)MEMORY[0x24BDBD1A8];

    v3->_authorizationOptionsType = 3;
  }
  return v3;
}

- (ACActivityPresentationOptions)initWithDestinations:(id)a3
{
  id v5;
  ACActivityPresentationOptions *v6;
  ACActivityPresentationOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACActivityPresentationOptions;
  v6 = -[ACActivityPresentationOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinations, a3);
    *(_DWORD *)&v7->_isUserDismissalAllowedOnLockScreen = 256;
    v7->_authorizationOptionsType = 3;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ACActivityPresentationOptions *v4;

  v4 = objc_alloc_init(ACActivityPresentationOptions);
  -[ACActivityPresentationOptions setUserDismissalAllowedOnLockScreen:](v4, "setUserDismissalAllowedOnLockScreen:", self->_isUserDismissalAllowedOnLockScreen);
  -[ACActivityPresentationOptions setShouldSuppressAlertContentOnLockScreen:](v4, "setShouldSuppressAlertContentOnLockScreen:", self->_shouldSuppressAlertContentOnLockScreen);
  -[ACActivityPresentationOptions setShowsAuthorizationOptions:](v4, "setShowsAuthorizationOptions:", self->_showsAuthorizationOptions);
  -[ACActivityPresentationOptions setActionButtonInitiated:](v4, "setActionButtonInitiated:", self->_isActionButtonInitiated);
  -[ACActivityPresentationOptions setDestinations:](v4, "setDestinations:", self->_destinations);
  -[ACActivityPresentationOptions setAuthorizationOptionsType:](v4, "setAuthorizationOptionsType:", self->_authorizationOptionsType);
  return v4;
}

- (BOOL)isUserDismissalAllowedOnLockScreen
{
  return self->_isUserDismissalAllowedOnLockScreen;
}

- (void)setUserDismissalAllowedOnLockScreen:(BOOL)a3
{
  self->_isUserDismissalAllowedOnLockScreen = a3;
}

- (BOOL)shouldSuppressAlertContentOnLockScreen
{
  return self->_shouldSuppressAlertContentOnLockScreen;
}

- (void)setShouldSuppressAlertContentOnLockScreen:(BOOL)a3
{
  self->_shouldSuppressAlertContentOnLockScreen = a3;
}

- (BOOL)showsAuthorizationOptions
{
  return self->_showsAuthorizationOptions;
}

- (void)setShowsAuthorizationOptions:(BOOL)a3
{
  self->_showsAuthorizationOptions = a3;
}

- (BOOL)isActionButtonInitiated
{
  return self->_isActionButtonInitiated;
}

- (void)setActionButtonInitiated:(BOOL)a3
{
  self->_isActionButtonInitiated = a3;
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (int64_t)authorizationOptionsType
{
  return self->_authorizationOptionsType;
}

- (void)setAuthorizationOptionsType:(int64_t)a3
{
  self->_authorizationOptionsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
