@implementation ICDocCamShutterButton

- (ICDocCamShutterButton)initWithCoder:(id)a3
{
  ICDocCamShutterButton *v3;
  ICDocCamShutterButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamShutterButton;
  v3 = -[ICDocCamShutterButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICDocCamShutterButton commonInit](v3, "commonInit");
  return v4;
}

- (ICDocCamShutterButton)initWithFrame:(CGRect)a3
{
  ICDocCamShutterButton *v3;
  ICDocCamShutterButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamShutterButton;
  v3 = -[ICDocCamShutterButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICDocCamShutterButton commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamShutterButton setTintColor:](self, "setTintColor:", v3);

  v4 = objc_alloc(MEMORY[0x24BDF6AE8]);
  -[ICDocCamShutterButton outerRingImage](self, "outerRingImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "initWithImage:", v5);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v6);

  -[ICDocCamShutterButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
  -[ICDocCamShutterButton innerCircle](self, "innerCircle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamShutterButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v7, 0);

}

- (id)outerRingImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ios_doccam_shutter_ring"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)innerCircle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ios_doccam_shutter_center"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPseudoDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  v3 = a3;
  self->_pseudoDisabled = a3;
  -[ICDocCamShutterButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  LODWORD(v5) = 1.0;
  if (v3)
    *(float *)&v5 = 0.5;
  objc_msgSend(v4, "setOpacity:", v5);

}

- (BOOL)isPseudoDisabled
{
  return self->_pseudoDisabled;
}

@end
