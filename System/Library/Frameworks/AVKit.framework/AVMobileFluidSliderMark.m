@implementation AVMobileFluidSliderMark

- (AVMobileFluidSliderMark)initWithStartValue:(float)a3 endValue:(float)a4 filledColor:(id)a5 unfilledColor:(id)a6 markWithType:(unint64_t)a7
{
  id v13;
  id v14;
  AVMobileFluidSliderMark *v15;
  AVMobileFluidSliderMark *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AVMobileFluidSliderMark;
  v15 = -[AVMobileFluidSliderMark init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_startValue = a3;
    v15->_endValue = a4;
    objc_storeStrong((id *)&v15->_filledColor, a5);
    objc_storeStrong((id *)&v16->_unfilledColor, a6);
    v16->_markType = a7;
  }

  return v16;
}

- (float)startValue
{
  return self->_startValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (UIColor)filledColor
{
  return self->_filledColor;
}

- (UIColor)unfilledColor
{
  return self->_unfilledColor;
}

- (unint64_t)markType
{
  return self->_markType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfilledColor, 0);
  objc_storeStrong((id *)&self->_filledColor, 0);
}

+ (id)interstitialMarkAtValue:(float)a3
{
  AVMobileFluidSliderMark *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  AVMobileFluidSliderMark *v9;

  v4 = [AVMobileFluidSliderMark alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  *(float *)&v8 = a3;
  v9 = -[AVMobileFluidSliderMark initWithStartValue:endValue:filledColor:unfilledColor:markWithType:](v4, "initWithStartValue:endValue:filledColor:unfilledColor:markWithType:", v5, v6, 0, v7, v8);

  return v9;
}

+ (id)liveEdgeMarkAtValue:(float)a3
{
  AVMobileFluidSliderMark *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  AVMobileFluidSliderMark *v9;

  v4 = [AVMobileFluidSliderMark alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "avkit_liveContentAccessoryViewColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "avkit_liveContentAccessoryViewColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  *(float *)&v8 = a3;
  v9 = -[AVMobileFluidSliderMark initWithStartValue:endValue:filledColor:unfilledColor:markWithType:](v4, "initWithStartValue:endValue:filledColor:unfilledColor:markWithType:", v5, v6, 1, v7, v8);

  return v9;
}

@end
