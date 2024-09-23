@implementation JFXOverlayEffectAnimationConfiguration

- (JFXOverlayEffectAnimationConfiguration)initWithStartFrame:(id)a3 endFrame:(id)a4
{
  id v7;
  id v8;
  JFXOverlayEffectAnimationConfiguration *v9;
  JFXOverlayEffectAnimationConfiguration *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXOverlayEffectAnimationConfiguration;
  v9 = -[JFXOverlayEffectAnimationConfiguration init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startFrame, a3);
    objc_storeStrong((id *)&v10->_endFrame, a4);
  }

  return v10;
}

- (JFXOverlayEffectFrame)startFrame
{
  return self->_startFrame;
}

- (JFXOverlayEffectFrame)endFrame
{
  return self->_endFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFrame, 0);
  objc_storeStrong((id *)&self->_startFrame, 0);
}

@end
