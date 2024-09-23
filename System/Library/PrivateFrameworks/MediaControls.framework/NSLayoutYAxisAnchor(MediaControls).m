@implementation NSLayoutYAxisAnchor(MediaControls)

- (id)mru_constraintEqualToAnchor:()MediaControls priority:
{
  void *v3;
  double v4;

  objc_msgSend(a1, "constraintEqualToAnchor:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a2;
  objc_msgSend(v3, "setPriority:", v4);
  return v3;
}

- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls priority:
{
  void *v3;
  double v4;

  objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a2;
  objc_msgSend(v3, "setPriority:", v4);
  return v3;
}

- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls priority:
{
  void *v3;
  double v4;

  objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a2;
  objc_msgSend(v3, "setPriority:", v4);
  return v3;
}

- (id)mru_constraintEqualToAnchor:()MediaControls constant:priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (id)mru_constraintGreaterThanOrEqualToAnchor:()MediaControls constant:priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

- (id)mru_constraintLessThanOrEqualToAnchor:()MediaControls constant:priority:
{
  void *v4;
  double v5;

  objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPriority:", v5);
  return v4;
}

@end
