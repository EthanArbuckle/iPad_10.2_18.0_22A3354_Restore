@implementation NSLayoutDimension(HUAdditions)

- (id)hu_constraintsLessThanOrEqualToConstant:()HUAdditions equalityPriority:
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(a1, "constraintEqualToConstant:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  objc_msgSend(v7, "hu_constraintWithPriority:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
