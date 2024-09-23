@implementation NSLayoutConstraint(ASNSLayoutConstraintExtras)

+ (uint64_t)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:
{
  return objc_msgSend(a1, "as_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", 0.0, 0.0, 0.0, 0.0);
}

+ (id)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:edgeInsets:
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v14 = a8;
  v15 = a7;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v14, 3, 1.0, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, v14, 4, 1.0, -a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v14, 5, 1.0, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v18;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, v14, 6, 1.0, -a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
