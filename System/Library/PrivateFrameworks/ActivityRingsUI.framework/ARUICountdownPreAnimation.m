@implementation ARUICountdownPreAnimation

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
  return 1;
}

+ (id)identifier
{
  return CFSTR("Pre Animation");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void (**v18)(void);

  v18 = (void (**)(void))a4;
  v5 = a3;
  objc_msgSend(v5, "ringGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setEmptyOpacity:", v7);
  LODWORD(v8) = 0;
  objc_msgSend(v6, "setPercentage:ofRingAtIndex:", 0, v8);
  LODWORD(v9) = 0;
  objc_msgSend(v6, "setTrackOpacity:", v9);
  LODWORD(v10) = 1.0;
  objc_msgSend(v6, "setOpacity:", v10);
  objc_msgSend(v5, "backingTrackRingGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    LODWORD(v12) = 0;
    objc_msgSend(v6, "setZRotation:", v12);
    objc_msgSend(v6, "groupDiameter");
    v14 = v13 * 0.5 + -3.0;
    *(float *)&v14 = v14;
    objc_msgSend(v11, "setThickness:", v14);
    LODWORD(v15) = 1.0;
    objc_msgSend(v11, "setOpacity:", v15);
    LODWORD(v16) = 1058306785;
    objc_msgSend(v11, "setEmptyOpacity:", v16);
    LODWORD(v17) = 0;
    objc_msgSend(v11, "setTrackOpacity:", v17);
  }
  else
  {
    LODWORD(v12) = 1078530011;
    objc_msgSend(v6, "setZRotation:", v12);
  }
  if (v18)
    v18[2]();

}

@end
