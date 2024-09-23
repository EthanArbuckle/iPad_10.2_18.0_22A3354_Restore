@implementation BuddyActivationError

- (BuddyActivationError)initWithConnectionFailure:(BOOL)a3 cellular:(BOOL)a4
{
  BuddyActivationError *v4;
  objc_super v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  id location;

  v9 = a2;
  v8 = a3;
  v7 = a4;
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyActivationError;
  location = -[BuddyActivationError init](&v6, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    *((_BYTE *)location + 8) = v8;
    *((_BYTE *)location + 9) = v7;
  }
  v4 = (BuddyActivationError *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)isConnectionFailure
{
  return self->_connectionFailure;
}

- (void)setConnectionFailure:(BOOL)a3
{
  self->_connectionFailure = a3;
}

- (BOOL)isCellular
{
  return self->_cellular;
}

- (void)setCellular:(BOOL)a3
{
  self->_cellular = a3;
}

@end
