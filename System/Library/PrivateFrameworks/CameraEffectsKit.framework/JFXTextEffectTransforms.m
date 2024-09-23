@implementation JFXTextEffectTransforms

+ (id)transformsWithTransform:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransform:", v4);

  return v5;
}

+ (id)transformsWithEffect:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEffect:", v4);

  return v5;
}

- (JFXTextEffectTransforms)initWithTransform:(id)a3
{
  id v4;
  JFXTextEffectTransforms *v5;
  uint64_t v6;
  PVMatrix44Double *transform;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXTextEffectTransforms;
  v5 = -[JFXTextEffectTransforms init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    transform = v5->_transform;
    v5->_transform = (PVMatrix44Double *)v6;

  }
  return v5;
}

- (JFXTextEffectTransforms)initWithEffect:(id)a3
{
  void *v4;
  JFXTextEffectTransforms *v5;

  objc_msgSend(a3, "topLevelTransformObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[JFXTextEffectTransforms initWithTransform:](self, "initWithTransform:", v4);

  return v5;
}

- (void)applyToEffect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JFXTextEffectTransforms transform](self, "transform");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTopLevelTransformObject:", v5);

}

- (PVMatrix44Double)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
