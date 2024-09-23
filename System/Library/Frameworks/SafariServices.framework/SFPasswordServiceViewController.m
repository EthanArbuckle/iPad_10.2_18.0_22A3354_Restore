@implementation SFPasswordServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE705F98);
}

- (void)_willAppearInRemoteViewController
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Application identifier was empty", a5, a6, a7, a8, 0);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
