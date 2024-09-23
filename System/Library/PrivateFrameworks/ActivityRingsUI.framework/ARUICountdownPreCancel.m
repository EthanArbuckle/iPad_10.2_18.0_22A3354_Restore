@implementation ARUICountdownPreCancel

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.0;
}

- (BOOL)cancelable
{
  return 0;
}

+ (id)identifier
{
  return CFSTR("Pre Cancel");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  float v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v16 = a4;
  v5 = a3;
  objc_msgSend(v5, "ringGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zRotation");
  v8 = ARUIFloatGreater(v7, 0.0);

  objc_msgSend(v5, "ringGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v8)
  {
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setZRotation:", v10);

    objc_msgSend(v5, "ringGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1.0;
    objc_msgSend(v11, "setPercentage:ofRingAtIndex:", 0, v12);
  }
  else
  {
    objc_msgSend(v9, "removeAllAnimations");
  }

  objc_msgSend(v5, "ringGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = 1051931443;
  objc_msgSend(v13, "setEmptyOpacity:", v14);

  v15 = v16;
  if (v16)
  {
    (*((void (**)(id))v16 + 2))(v16);
    v15 = v16;
  }

}

@end
