@implementation JFXOverlayEffectTransforms

+ (id)transformsWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransform:transformAnimation:faceTrackingTransform:", v10, v9, v8);

  return v11;
}

+ (id)transformsWithEffect:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEffect:", v4);

  return v5;
}

- (JFXOverlayEffectTransforms)initWithTransform:(id)a3 transformAnimation:(id)a4 faceTrackingTransform:(id)a5
{
  id v8;
  id v9;
  JFXOverlayEffectTransforms *v10;
  uint64_t v11;
  PVTransformAnimation *transformAnimation;
  uint64_t v13;
  JFXFaceTrackedEffectTransform *faceTrackingTransform;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffectTransforms;
  v10 = -[JFXTextEffectTransforms initWithTransform:](&v16, sel_initWithTransform_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    transformAnimation = v10->_transformAnimation;
    v10->_transformAnimation = (PVTransformAnimation *)v11;

    v13 = objc_msgSend(v9, "copy");
    faceTrackingTransform = v10->_faceTrackingTransform;
    v10->_faceTrackingTransform = (JFXFaceTrackedEffectTransform *)v13;

  }
  return v10;
}

- (JFXOverlayEffectTransforms)initWithEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  JFXOverlayEffectTransforms *v8;

  v4 = a3;
  objc_msgSend(v4, "topLevelTransformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceTrackingTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[JFXOverlayEffectTransforms initWithTransform:transformAnimation:faceTrackingTransform:](self, "initWithTransform:transformAnimation:faceTrackingTransform:", v5, v6, v7);
  return v8;
}

- (void)applyToEffect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffectTransforms;
  v4 = a3;
  -[JFXTextEffectTransforms applyToEffect:](&v7, sel_applyToEffect_, v4);
  -[JFXOverlayEffectTransforms transformAnimation](self, "transformAnimation", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTransformAnimation:", v5);

  -[JFXOverlayEffectTransforms faceTrackingTransform](self, "faceTrackingTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFaceTrackingTransform:", v6);

}

- (PVTransformAnimation)transformAnimation
{
  return self->_transformAnimation;
}

- (void)setTransformAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (JFXFaceTrackedEffectTransform)faceTrackingTransform
{
  return self->_faceTrackingTransform;
}

- (void)setFaceTrackingTransform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTrackingTransform, 0);
  objc_storeStrong((id *)&self->_transformAnimation, 0);
}

@end
