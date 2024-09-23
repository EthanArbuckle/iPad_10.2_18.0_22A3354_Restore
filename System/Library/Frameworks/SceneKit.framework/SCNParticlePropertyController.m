@implementation SCNParticlePropertyController

- (SCNParticlePropertyController)init
{
  SCNParticlePropertyController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNParticlePropertyController;
  result = -[SCNParticlePropertyController init](&v3, sel_init);
  if (result)
    result->_inputScale = 1.0;
  return result;
}

- (void)setC3dAnimation:(id)a3
{
  id c3dAnimation;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation != a3)
  {

    self->_c3dAnimation = a3;
  }
}

- (id)c3dAnimation
{
  return self->_c3dAnimation;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_inputOrigin, 0);

  v3.receiver = self;
  v3.super_class = (Class)SCNParticlePropertyController;
  -[SCNParticlePropertyController dealloc](&v3, sel_dealloc);
}

+ (SCNParticlePropertyController)particlePropertyControllerWithAnimation:(id)a3
{
  SCNParticlePropertyController *v4;

  v4 = (SCNParticlePropertyController *)objc_alloc_init((Class)a1);
  -[SCNParticlePropertyController setAnimation:](v4, "setAnimation:", a3);
  return v4;
}

+ (SCNParticlePropertyController)controllerWithAnimation:(CAAnimation *)animation
{
  SCNParticlePropertyController *v4;

  v4 = (SCNParticlePropertyController *)objc_alloc_init((Class)a1);
  -[SCNParticlePropertyController setAnimation:](v4, "setAnimation:", animation);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAnimation:", self->_animation);
  objc_msgSend(v4, "setInputMode:", self->_inputMode);
  objc_msgSend(v4, "setInputScale:", self->_inputScale);
  objc_msgSend(v4, "setInputBias:", self->_inputBias);
  objc_msgSend(v4, "setInputOrigin:", -[SCNParticlePropertyController inputOrigin](self, "inputOrigin"));
  objc_msgSend(v4, "setInputProperty:", self->_inputProperty);
  objc_msgSend(v4, "setC3dAnimation:", self->_c3dAnimation);
  return v4;
}

- (id)copy
{
  return -[SCNParticlePropertyController copyWithZone:](self, "copyWithZone:", 0);
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(CAAnimation *)animation
{
  CAAnimation *v3;

  v3 = self->_animation;
  if (v3 != animation)
  {

    self->_animation = animation;
  }
}

- (SCNParticleInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(SCNParticleInputMode)inputMode
{
  self->_inputMode = inputMode;
}

- (CGFloat)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(CGFloat)inputScale
{
  self->_inputScale = inputScale;
}

- (CGFloat)inputBias
{
  return self->_inputBias;
}

- (void)setInputBias:(CGFloat)inputBias
{
  self->_inputBias = inputBias;
}

- (SCNNode)inputOrigin
{
  return (SCNNode *)objc_loadWeak((id *)&self->_inputOrigin);
}

- (void)setInputOrigin:(SCNNode *)inputOrigin
{
  objc_storeWeak((id *)&self->_inputOrigin, inputOrigin);
}

- (SCNParticleProperty)inputProperty
{
  return self->_inputProperty;
}

- (void)setInputProperty:(SCNParticleProperty)inputProperty
{
  NSString *v3;

  v3 = self->_inputProperty;
  if (v3 != inputProperty)
  {

    self->_inputProperty = inputProperty;
  }
}

- (void)_customEncodingOfSCNParticlePropertyController:(id)a3
{
  id c3dAnimation;

  c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation)
    SCNEncodeC3DAnimationForKey(a3, c3dAnimation, (uint64_t)CFSTR("animation"));
}

- (void)_customDecodingOfSCNParticlePropertyController:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = SCNDecodeC3DAnimationForKey(a3, (uint64_t)CFSTR("animation"));
  if (v4)
  {
    v5 = (id)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v5 = C3DAnimationToCAAnimation(v5);
    -[SCNParticlePropertyController setAnimation:](self, "setAnimation:", v5);
  }
}

- (void)encodeWithCoder:(id)a3
{
  SCNNode *v5;
  NSString *inputProperty;

  -[SCNParticlePropertyController _customEncodingOfSCNParticlePropertyController:](self, "_customEncodingOfSCNParticlePropertyController:");
  objc_msgSend(a3, "encodeInteger:forKey:", self->_inputMode, CFSTR("inputMode"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("inputScale"), self->_inputScale);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("inputBias"), self->_inputBias);
  v5 = -[SCNParticlePropertyController inputOrigin](self, "inputOrigin");
  if (v5)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("inputOrigin"));

  inputProperty = self->_inputProperty;
  if (inputProperty)
    objc_msgSend(a3, "encodeObject:forKey:", inputProperty, CFSTR("inputProperty"));
}

- (SCNParticlePropertyController)initWithCoder:(id)a3
{
  SCNParticlePropertyController *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNParticlePropertyController;
  v4 = -[SCNParticlePropertyController init](&v7, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNParticlePropertyController _customDecodingOfSCNParticlePropertyController:](v4, "_customDecodingOfSCNParticlePropertyController:", a3);
    -[SCNParticlePropertyController setInputMode:](v4, "setInputMode:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("inputMode")));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("inputScale"));
    -[SCNParticlePropertyController setInputScale:](v4, "setInputScale:");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("inputBias"));
    -[SCNParticlePropertyController setInputBias:](v4, "setInputBias:");
    -[SCNParticlePropertyController setInputOrigin:](v4, "setInputOrigin:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputOrigin")));
    -[SCNParticlePropertyController setInputProperty:](v4, "setInputProperty:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputProperty")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
