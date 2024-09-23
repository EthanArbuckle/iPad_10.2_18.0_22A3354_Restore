@implementation _FCCCAnimator

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BEBDB00];
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35___FCCCAnimator_animateTransition___block_invoke;
  v9[3] = &unk_24D20A9C0;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __35___FCCCAnimator_animateTransition___block_invoke_2;
  v7[3] = &unk_24D20AB40;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fcui_animateWithAnimationType:actions:completion:", 0, v9, v7);

}

- (double)transitionDuration:(id)a3
{
  return 0.72;
}

@end
