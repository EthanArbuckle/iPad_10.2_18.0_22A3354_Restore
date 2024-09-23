@implementation CUIPSDLayerEffects

- (CUIPSDLayerEffects)init
{
  CUIPSDLayerEffects *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUIPSDLayerEffects;
  v2 = -[CUIPSDLayerEffects init](&v4, sel_init);
  v2->_effectList = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
  return v2;
}

- (id)dropShadow
{
  return -[NSMutableDictionary objectForKey:](self->_effectList, "objectForKey:", &unk_1E41DD088);
}

- (id)colorOverlay
{
  return -[NSMutableDictionary objectForKey:](self->_effectList, "objectForKey:", &unk_1E41DD0A0);
}

- (void)addLayerEffectComponent:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->_effectList, "setObject:forKey:", a3, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "effectType")));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffects;
  -[CUIPSDLayerEffects dealloc](&v3, sel_dealloc);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (double)effectScale
{
  return self->_effectScale;
}

- (void)setEffectScale:(double)a3
{
  self->_effectScale = a3;
}

- (NSMutableDictionary)effectList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEffectList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
