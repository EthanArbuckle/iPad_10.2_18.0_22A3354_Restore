@implementation AUExtensionInstanceProxy

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  (*(void (**)(void *, id, id))(*(_QWORD *)a6 + 16))(a6, a4, a3);
}

- (void)auInstance
{
  return self->_auInstance;
}

- (void)setAuInstance:(void *)a3
{
  self->_auInstance = a3;
}

@end
