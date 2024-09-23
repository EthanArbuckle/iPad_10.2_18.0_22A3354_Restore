@implementation _CDPExtensionHostContext

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken[0] != -1)
    dispatch_once(_allowedItemPayloadClasses_onceToken, &__block_literal_global_3);
  return (id)_allowedItemPayloadClasses_classes;
}

@end
