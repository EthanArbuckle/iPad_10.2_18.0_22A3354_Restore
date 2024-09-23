@implementation MTRControllerFactoryParams

- (void)setStartServer:(BOOL)startServer
{
  MEMORY[0x24BEDD108](self, sel_setShouldStartServer_, startServer);
}

@end
