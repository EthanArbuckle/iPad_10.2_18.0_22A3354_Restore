@implementation ESUserNotificationInfo

- (void)setHandler:(id)a3
{
  void *v4;
  id handler;

  if (self->_handler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    handler = self->_handler;
    self->_handler = v4;

  }
}

- (id)handler
{
  return (id)MEMORY[0x22E2E5F84](self->_handler, a2);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
