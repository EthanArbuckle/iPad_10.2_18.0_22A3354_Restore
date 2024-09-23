@implementation CAChameleonLayer

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  return 0;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAChameleonLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
