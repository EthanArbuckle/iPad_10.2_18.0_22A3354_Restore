@implementation DOCSmartFolderManager_OBJC

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  return (id)sharedManager__sharedManager;
}

- (_TtC26DocumentManagerExecutables21DOCSmartFolderManager)underlyingSmartFolderManager
{
  return self->_underlyingSmartFolderManager;
}

- (void)setUnderlyingSmartFolderManager:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingSmartFolderManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSmartFolderManager, 0);
}

@end
