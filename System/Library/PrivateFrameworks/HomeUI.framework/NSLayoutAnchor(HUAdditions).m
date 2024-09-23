@implementation NSLayoutAnchor(HUAdditions)

- (id)hu_constraintsLessThanOrEqualToAnchor:()HUAdditions equalityPriority:
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(a1, "constraintEqualToAnchor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v9 = a2;
  objc_msgSend(v8, "hu_constraintWithPriority:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
