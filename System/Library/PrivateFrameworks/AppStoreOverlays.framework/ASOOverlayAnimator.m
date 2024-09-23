@implementation ASOOverlayAnimator

+ (void)performAnimations:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, a3, a4, 0.35, 0.0, 0.9, 0.1);
}

@end
