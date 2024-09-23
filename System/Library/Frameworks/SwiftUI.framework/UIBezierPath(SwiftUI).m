@implementation UIBezierPath(SwiftUI)

- (uint64_t)initWithArcRoundedRectForSwiftUI:()SwiftUI cornerRadius:
{
  void *v11;
  uint64_t v12;

  v11 = (void *)objc_msgSend(a1, "init");
  objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", a2, a3, a4, a5, a6);
  v12 = objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
