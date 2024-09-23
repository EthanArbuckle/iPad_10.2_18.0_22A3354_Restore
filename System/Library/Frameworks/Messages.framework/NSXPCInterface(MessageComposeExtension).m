@implementation NSXPCInterface(MessageComposeExtension)

+ (id)__mf_messageComposerHostInterface
{
  if (__mf_messageComposerHostInterface_onceToken != -1)
    dispatch_once(&__mf_messageComposerHostInterface_onceToken, &__block_literal_global_10);
  return (id)__mf_messageComposerHostInterface_interface;
}

+ (id)__mf_messageComposerExtensionInterface
{
  if (__mf_messageComposerExtensionInterface_onceToken != -1)
    dispatch_once(&__mf_messageComposerExtensionInterface_onceToken, &__block_literal_global_129);
  return (id)__mf_messageComposerExtensionInterface_interface;
}

@end
