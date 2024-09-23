@implementation UIView(FIUIUtilities)

+ (uint64_t)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:
{
  return objc_msgSend(a1, "fiui_animateIfNeededWithDuration:animations:completion:", a3, 0);
}

+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities animations:completion:
{
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  _QWORD v11[4];
  void (**v12)(_QWORD);

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (a2 >= 2.22044605e-16)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __80__UIView_FIUIUtilities__fiui_animateIfNeededWithDuration_animations_completion___block_invoke;
      v11[3] = &unk_24CF30438;
      v12 = v9;
      objc_msgSend(a1, "animateWithDuration:animations:completion:", v8, v11, a2);

    }
    else
    {
      v8[2](v8);
      if (v10)
        v10[2](v10);
    }
  }

}

+ (void)fiui_animateIfNeededWithDuration:()FIUIUtilities delay:options:animations:completion:
{
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  _QWORD v15[4];
  void (**v16)(_QWORD);

  v12 = a6;
  v13 = a7;
  v14 = v13;
  if (v12)
  {
    if (a2 >= 2.22044605e-16)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __94__UIView_FIUIUtilities__fiui_animateIfNeededWithDuration_delay_options_animations_completion___block_invoke;
      v15[3] = &unk_24CF30438;
      v16 = v13;
      objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:", a5, v12, v15, a2, a3);

    }
    else
    {
      v12[2](v12);
      if (v14)
        v14[2](v14);
    }
  }

}

@end
