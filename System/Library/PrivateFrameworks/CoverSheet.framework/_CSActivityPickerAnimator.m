@implementation _CSActivityPickerAnimator

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CEABB0];
  -[_CSActivityPickerAnimator transitionDuration:](self, "transitionDuration:", v4);
  v7 = v6;
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke;
  v12[3] = &unk_1E8E2DB38;
  v13 = v4;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke_3;
  v10[3] = &unk_1E8E2DDE0;
  v11 = v13;
  v9 = v13;
  objc_msgSend(v5, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v12, v10, v7, 0.0, 2.0, 300.0, 38.0, 0.0);

}

- (double)transitionDuration:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_duration");
    v4 = v5;
  }

  return v4;
}

@end
