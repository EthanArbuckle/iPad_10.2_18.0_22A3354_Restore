@implementation NSLayoutConstraint(AXConstraintExtensions)

- (id)ax_copyWithPriority:()AXConstraintExtensions
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  v4 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(a1, "firstItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "firstAttribute");
  v7 = objc_msgSend(a1, "relation");
  objc_msgSend(a1, "secondItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "secondAttribute");
  objc_msgSend(a1, "multiplier");
  v11 = v10;
  objc_msgSend(a1, "constant");
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, v6, v7, v8, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v14 = a2;
  objc_msgSend(v13, "setPriority:", v14);
  return v13;
}

@end
