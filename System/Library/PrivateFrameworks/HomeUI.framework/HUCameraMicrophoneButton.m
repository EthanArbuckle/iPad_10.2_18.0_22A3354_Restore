@implementation HUCameraMicrophoneButton

- (HUCameraMicrophoneButton)initWithFrame:(CGRect)a3
{
  HUCameraMicrophoneButton *v3;
  HUCameraMicrophoneButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCameraMicrophoneButton;
  v3 = -[HUCameraMicrophoneButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUCameraMicrophoneButton setOpaque:](v3, "setOpaque:", 0);
    -[HUCameraMicrophoneButton setContentMode:](v4, "setContentMode:", 3);
    -[HUCameraMicrophoneButton _updateImage](v4, "_updateImage");
  }
  return v4;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[HUCameraMicrophoneButton _updateImage](self, "_updateImage");
    -[HUCameraMicrophoneButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraMicrophoneButton;
  -[HUCameraMicrophoneButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[HUCameraMicrophoneButton _updateAlpha](self, "_updateAlpha");
  -[HUCameraMicrophoneButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setHighlighted:(BOOL)a3
{
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUCameraMicrophoneButton;
  -[HUCameraMicrophoneButton setHighlighted:](&v5, sel_setHighlighted_, a3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__HUCameraMicrophoneButton_setHighlighted___block_invoke;
  v4[3] = &unk_1E6F4D988;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.2);
}

uint64_t __43__HUCameraMicrophoneButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAlpha");
}

- (void)_updateAlpha
{
  int v3;
  double v4;

  if (-[HUCameraMicrophoneButton isEnabled](self, "isEnabled"))
  {
    v3 = -[HUCameraMicrophoneButton isHighlighted](self, "isHighlighted");
    v4 = 0.3;
    if (!v3)
      v4 = 1.0;
  }
  else
  {
    v4 = 0.2;
  }
  -[HUCameraMicrophoneButton setAlpha:](self, "setAlpha:", v4);
}

- (void)_updateImage
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  if (-[HUCameraMicrophoneButton isOn](self, "isOn"))
    v3 = CFSTR("microphoneEnabled");
  else
    v3 = CFSTR("microphoneDisabled");
  HUImageNamed(v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[HUCameraMicrophoneButton hu_isHomeAffordancePresent](self, "hu_isHomeAffordancePresent"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  -[HUCameraMicrophoneButton setMicrophoneImage:](self, "setMicrophoneImage:", v6);
  -[HUCameraMicrophoneButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HUCameraMicrophoneButton setNeedsDisplay](self, "setNeedsDisplay");

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[HUCameraMicrophoneButton microphoneImage](self, "microphoneImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v4;
  else
    v7 = v6;
  v8 = v7 + 0.4;
  v9 = v8;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  CGBlendMode v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[HUCameraMicrophoneButton microphoneImage](self, "microphoneImage", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[HUCameraMicrophoneButton hu_isHomeAffordancePresent](self, "hu_isHomeAffordancePresent");
  if (-[HUCameraMicrophoneButton isEnabled](self, "isEnabled"))
  {
    if (-[HUCameraMicrophoneButton isOn](self, "isOn"))
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    objc_msgSend(v14, "_flatImageWithColor:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v7;
  }
  -[HUCameraMicrophoneButton bounds](self, "bounds");
  v9 = HURoundToScreenScale(v8 * 0.2);
  -[HUCameraMicrophoneButton bounds](self, "bounds");
  v16 = CGRectInset(v15, v9, v9);
  objc_msgSend(v14, "drawInRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  if ((v4 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CEA390];
    -[HUCameraMicrophoneButton bounds](self, "bounds");
    objc_msgSend(v10, "bezierPathWithOvalInRect:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addClip");

    -[HUCameraMicrophoneButton _circleColor](self, "_circleColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFill");

    if (-[HUCameraMicrophoneButton isEnabled](self, "isEnabled"))
      v13 = kCGBlendModeDestinationOver;
    else
      v13 = kCGBlendModeSourceOut;
    -[HUCameraMicrophoneButton bounds](self, "bounds");
    UIRectFillUsingBlendMode(v17, v13);
  }

}

- (id)_circleColor
{
  void *v3;

  if ((-[HUCameraMicrophoneButton isEnabled](self, "isEnabled") & 1) != 0)
  {
    if (-[HUCameraMicrophoneButton isOn](self, "isOn"))
      objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.15, 1.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (UIImage)microphoneImage
{
  return self->_microphoneImage;
}

- (void)setMicrophoneImage:(id)a3
{
  objc_storeStrong((id *)&self->_microphoneImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microphoneImage, 0);
}

@end
