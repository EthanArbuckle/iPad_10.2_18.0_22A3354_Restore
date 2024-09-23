@implementation NEProviderXPCListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContextClassName, 0);
}

@end
