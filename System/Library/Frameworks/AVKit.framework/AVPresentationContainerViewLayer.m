@implementation AVPresentationContainerViewLayer

- (void)setCornerCurve:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerCurve:", v4);

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actualView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerCurve:", v4);

}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actualView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", a3);

}

- (void)setMaskedCorners:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actualView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaskedCorners:", a3);

}

- (AVPresentationContainerViewAppearanceProxy)appearanceProxy
{
  AVPresentationContainerViewAppearanceProxy *appearanceProxy;
  AVPresentationContainerViewAppearanceProxy *v4;
  AVPresentationContainerViewAppearanceProxy *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  appearanceProxy = self->_appearanceProxy;
  if (!appearanceProxy)
  {
    v4 = objc_alloc_init(AVPresentationContainerViewAppearanceProxy);
    v5 = self->_appearanceProxy;
    self->_appearanceProxy = v4;

    v16.receiver = self;
    v16.super_class = (Class)AVPresentationContainerViewLayer;
    -[AVPresentationContainerViewLayer cornerCurve](&v16, sel_cornerCurve);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    v15.receiver = self;
    v15.super_class = (Class)AVPresentationContainerViewLayer;
    v8 = -[AVPresentationContainerViewLayer maskedCorners](&v15, sel_maskedCorners);
    -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaskedCorners:", v8);

    v14.receiver = self;
    v14.super_class = (Class)AVPresentationContainerViewLayer;
    -[AVPresentationContainerViewLayer cornerRadius](&v14, sel_cornerRadius);
    v11 = v10;
    -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v11);

    appearanceProxy = self->_appearanceProxy;
  }
  return appearanceProxy;
}

- (void)setMasksToBounds:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClipsToBounds:", v3);

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actualView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", v3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setWantsAppearanceConfigValues:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;

  if (self->_wantsAppearanceConfigValues != a3)
  {
    v3 = a3;
    self->_wantsAppearanceConfigValues = a3;
    -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerCurve");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v14.receiver = self;
      v14.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setCornerCurve:](&v14, sel_setCornerCurve_, v6);

      -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13.receiver = self;
      v13.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setMaskedCorners:](&v13, sel_setMaskedCorners_, objc_msgSend(v7, "maskedCorners"));

      -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cornerRadius");
      v12.receiver = self;
      v12.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setCornerRadius:](&v12, sel_setCornerRadius_);

    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setCornerCurve:](&v11, sel_setCornerCurve_, v6);

      v10.receiver = self;
      v10.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setMaskedCorners:](&v10, sel_setMaskedCorners_, 0);
      v9.receiver = self;
      v9.super_class = (Class)AVPresentationContainerViewLayer;
      -[AVPresentationContainerViewLayer setCornerRadius:](&v9, sel_setCornerRadius_, 0.0);
    }
  }
}

- (unint64_t)maskedCorners
{
  void *v2;
  unint64_t v3;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maskedCorners");

  return v3;
}

- (BOOL)masksToBounds
{
  void *v2;
  char v3;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "clipsToBounds");

  return v3;
}

- (id)cornerCurve
{
  void *v2;
  void *v3;

  -[AVPresentationContainerViewLayer appearanceProxy](self, "appearanceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerCurve");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsAppearanceConfigValues
{
  return self->_wantsAppearanceConfigValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
}

@end
