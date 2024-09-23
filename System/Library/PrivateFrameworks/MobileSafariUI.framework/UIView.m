@implementation UIView

+ (void)safari_animate:(char)a3 withDuration:(void *)a4 animations:
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = objc_opt_self();
  +[UIView safari_animate:withDuration:delay:options:animations:completion:](a1, 0.0, v6, a3, 0, v7, 0);

}

+ (void)safari_animate:(uint64_t)a3 withDuration:(char)a4 delay:(uint64_t)a5 options:(void *)a6 animations:(void *)a7 completion:
{
  id v12;
  void *v13;
  void (**v14)(void *, uint64_t);
  void (**v15)(_QWORD);

  v15 = a6;
  v12 = a7;
  v13 = (void *)objc_opt_self();
  v14 = (void (**)(void *, uint64_t))_Block_copy(v12);

  if ((a4 & 1) != 0)
  {
    objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", a5, v15, v14, a1, a2);
  }
  else
  {
    if (v15)
      v15[2](v15);
    if (v12)
      v14[2](v14, 1);
  }

}

- (void)safari_setUntransformedFrame:(double)a3
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (result)
  {
    v9 = result;
    objc_msgSend(result, "bounds");
    objc_msgSend(v9, "setBounds:");
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anchorPoint");
    v12 = v11;
    v14 = v13;

    return (void *)objc_msgSend(v9, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
  }
  return result;
}

@end
