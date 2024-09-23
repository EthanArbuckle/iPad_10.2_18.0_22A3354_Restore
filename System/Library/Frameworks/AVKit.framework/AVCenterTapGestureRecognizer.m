@implementation AVCenterTapGestureRecognizer

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;
  objc_super v23;

  v4 = a3;
  -[AVCenterTapGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v23.receiver = self,
        v23.super_class = (Class)AVCenterTapGestureRecognizer,
        -[AVCenterTapGestureRecognizer shouldReceiveEvent:](&v23, sel_shouldReceiveEvent_, v4)))
  {
    objc_msgSend(v4, "allTouches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "bounds");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v5, "center");
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "locationInView:", v5);
    if (v11 >= v9)
      v18 = v9;
    else
      v18 = v11;
    v19 = fmin(v18 * 0.1, 100.0);
    if (v19 <= 14.0)
    {
      v21 = 0;
    }
    else
    {
      v20 = vabdd_f64(v13, v16) <= v19;
      v21 = vabdd_f64(v15, v17) <= v19 && v20;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
