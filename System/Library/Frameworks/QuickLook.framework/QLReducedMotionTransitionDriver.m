@implementation QLReducedMotionTransitionDriver

- (void)animateTransition
{
  unsigned int v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v3 = -[QLTransitionDriver presenting](self, "presenting");
  v4 = (double)(v3 ^ 1);
  v5 = (double)v3;
  -[QLTransitionDriver destinationView](self, "destinationView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v4);

  v7 = (void *)MEMORY[0x24BEBDB00];
  -[QLTransitionDriver duration](self, "duration");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__QLReducedMotionTransitionDriver_animateTransition__block_invoke;
  v8[3] = &unk_24C724CD0;
  v8[4] = self;
  *(double *)&v8[5] = v5;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v8, 0);
}

void __52__QLReducedMotionTransitionDriver_animateTransition__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "destinationView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

@end
