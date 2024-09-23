@implementation UICollectionView(SwiftUITesting_Swizzles)

+ (void)_performSwiftUITestingOverrides
{
  objc_class *v0;

  objc_opt_self();
  v0 = (objc_class *)objc_claimAutoreleasedReturnValue();
  _SwizzleMethods(v0, sel__viewAnimationsForCurrentUpdateWithCollectionViewAnimator_, sel__SwiftUITesting__viewAnimationsForCurrentUpdateWithCollectionViewAnimator_);

}

- (uint64_t)_SwiftUITesting__viewAnimationsForCurrentUpdateWithCollectionViewAnimator:()SwiftUITesting_Swizzles
{
  return 0;
}

@end
