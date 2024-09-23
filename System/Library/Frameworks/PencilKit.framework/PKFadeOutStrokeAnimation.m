@implementation PKFadeOutStrokeAnimation

- (PKFadeOutStrokeAnimation)initWithStroke:(id)a3 startTime:(double)a4 duration:(double)a5
{
  id v9;
  PKFadeOutStrokeAnimation *v10;
  PKFadeOutStrokeAnimation *v11;
  void *v12;
  uint64_t v13;
  UIColor *startColor;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKFadeOutStrokeAnimation;
  v10 = -[PKFadeOutStrokeAnimation init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stroke, a3);
    v11->_startTime = a4;
    objc_msgSend(v9, "ink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = objc_claimAutoreleasedReturnValue();
    startColor = v11->_startColor;
    v11->_startColor = (UIColor *)v13;

    v11->_duration = a5;
  }

  return v11;
}

- (id)newStrokeAtTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[PKFadeOutStrokeAnimation stroke](self, "stroke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PKFadeOutStrokeAnimation startTime](self, "startTime");
  v8 = a3 - v7;
  -[PKFadeOutStrokeAnimation duration](self, "duration");
  v10 = v8 / v9;
  -[UIColor alphaComponent](self->_startColor, "alphaComponent");
  v12 = 0.0;
  if (v10 <= 1.0)
    v12 = 1.0 - v10;
  -[UIColor colorWithAlphaComponent:](self->_startColor, "colorWithAlphaComponent:", v11 * v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFadeOutStrokeAnimation stroke](self, "stroke");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ink");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFadeOutStrokeAnimation stroke](self, "stroke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ink");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "weight");
  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", v16, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInk:", v19);

  return v6;
}

- (BOOL)isDoneAtTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[PKFadeOutStrokeAnimation startTime](self, "startTime");
  v6 = v5;
  -[PKFadeOutStrokeAnimation duration](self, "duration");
  return v6 + v7 <= a3;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
  objc_storeStrong((id *)&self->_startColor, 0);
}

@end
