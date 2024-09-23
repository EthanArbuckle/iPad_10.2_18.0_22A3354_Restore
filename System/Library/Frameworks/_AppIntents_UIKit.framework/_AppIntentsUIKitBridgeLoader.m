@implementation _AppIntentsUIKitBridgeLoader

- (_AppIntentsUIKitBridgeLoader)init
{
  return (_AppIntentsUIKitBridgeLoader *)UIKitBridgeLoader.init()();
}

+ (void)loadBridge
{
  static UIKitBridgeLoader.loadBridge()();
}

@end
