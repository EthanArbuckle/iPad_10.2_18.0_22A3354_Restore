@implementation UIView(CKLayoutAdditions)

- (id)__ck_addEqualityConstraintWithItem:()CKLayoutAdditions toItem:usingAttribute:
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a5, 0, a4, a5, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v6);
  return v6;
}

@end
