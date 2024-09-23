@implementation PFStaticCloudKitContainerProvider

- (PFStaticCloudKitContainerProvider)initWithContainer:(id)a3
{
  PFStaticCloudKitContainerProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFStaticCloudKitContainerProvider;
  v4 = -[PFStaticCloudKitContainerProvider init](&v6, sel_init);
  if (v4)
    v4->_container = (CKContainer *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFStaticCloudKitContainerProvider;
  -[PFStaticCloudKitContainerProvider dealloc](&v3, sel_dealloc);
}

- (id)containerWithIdentifier:(id)a3
{
  if (!-[NSString isEqualToString:](-[CKContainer containerIdentifier](self->_container, "containerIdentifier"), "isEqualToString:", a3))objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid for a container '%@'. This object was configured to only respond to container requests for '%@'"), a3, -[CKContainer containerIdentifier](self->_container, "containerIdentifier")), 0));
  return self->_container;
}

- (CKContainer)container
{
  return self->_container;
}

@end
