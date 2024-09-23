@implementation GDHMHomeAccessControlMock

- (GDHMHomeAccessControlMock)initWithIsAdminAnswer:(BOOL)a3
{
  GDHMHomeAccessControlMock *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GDHMHomeAccessControlMock;
  result = -[GDHMHomeAccessControlMock init](&v5, sel_init);
  if (result)
    result->_isAdminAnswer = a3;
  return result;
}

- (BOOL)isAdministrator
{
  return self->_isAdminAnswer;
}

@end
