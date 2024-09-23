@implementation _CPUILiveTrackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_CPUILiveTrackView)initWithFrame:(CGRect)a3
{
  _CPUILiveTrackView *v3;
  _CPUILiveTrackView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_CPUILiveTrackView;
  v3 = -[_CPUILiveTrackView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_erasedPercentage = 0.25;
    -[_CPUILiveTrackView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v5, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CPUILiveTrackView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    -[_CPUILiveTrackView _updateGradient](v4, "_updateGradient");
  }
  return v4;
}

- (void)setErasedPercentage:(double)a3
{
  double v3;
  BOOL v4;
  double v5;

  v3 = 1.0;
  if (a3 > 1.0)
  {
    v4 = 1;
  }
  else
  {
    v3 = a3;
    v4 = a3 < 0.0;
  }
  v5 = fmax(v3, 0.0);
  if (v4)
    a3 = v5;
  if (vabdd_f64(a3, self->_erasedPercentage) > 0.00000011920929)
  {
    self->_erasedPercentage = a3;
    -[_CPUILiveTrackView _updateGradient](self, "_updateGradient");
  }
}

- (void)_updateGradient
{
  double v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v2 = self->_erasedPercentage * 0.5;
  -[_CPUILiveTrackView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[2] = objc_msgSend(v6, "CGColor");
  objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13[3] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v8);

  v12[0] = &unk_24DF30488;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.5 - v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2 + 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  v12[3] = &unk_24DF30498;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocations:", v11);

}

- (double)erasedPercentage
{
  return self->_erasedPercentage;
}

@end
