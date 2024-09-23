@implementation ULBGSystemTaskRequest

- (ULBGSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v4;
  ULBGSystemTaskRequest *v5;
  ULBGSystemTaskRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBGSystemTaskRequest;
  v5 = -[ULBGSystemTaskRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ULBGSystemTaskRequest setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (id)createRequestFromSelf
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)requiresProtectionClass
{
  return self->_requiresProtectionClass;
}

- (void)setRequiresProtectionClass:(int64_t)a3
{
  self->_requiresProtectionClass = a3;
}

- (BOOL)resourceIntensive
{
  return self->_resourceIntensive;
}

- (void)setResourceIntensive:(BOOL)a3
{
  self->_resourceIntensive = a3;
}

- (int64_t)resources
{
  return self->_resources;
}

- (void)setResources:(int64_t)a3
{
  self->_resources = a3;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (void)setRequiresUserInactivity:(BOOL)a3
{
  self->_requiresUserInactivity = a3;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
