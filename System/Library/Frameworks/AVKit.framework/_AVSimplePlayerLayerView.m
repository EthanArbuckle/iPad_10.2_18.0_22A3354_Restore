@implementation _AVSimplePlayerLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)keyPathsForValuesAffectingPlayerLayer
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("layer"), 0);
}

@end
