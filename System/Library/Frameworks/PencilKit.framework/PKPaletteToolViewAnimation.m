@implementation PKPaletteToolViewAnimation

+ (void)performSelectionAnimations:(void *)a3 completion:
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v5, v4, 0.55, 0.0, 0.65, 0.0);

}

@end
