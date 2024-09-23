@implementation CFXEffect

- (BOOL)isAnimoji
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", CFXEffectTypeIdentifierAnimoji));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CFXEffect identifier](self, "identifier"));
  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v3;
}

@end
