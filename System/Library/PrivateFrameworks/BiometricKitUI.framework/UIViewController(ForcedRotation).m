@implementation UIViewController(ForcedRotation)

- (uint64_t)bkui_uiforDeviceOrientation:()ForcedRotation
{
  if (a3 > 6)
    return 1;
  else
    return qword_1DB2DF7B8[a3];
}

- (void)bkui_rotateView:()ForcedRotation fromOrientation:toOrientation:containerBounds:animatedDuration:alongSide:completion:
{
  id v21;
  void (**v22)(_QWORD, double);
  void (**v23)(id, uint64_t);
  void *v24;
  _QWORD v25[4];
  id v26;
  void (**v27)(_QWORD, double);
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v21 = a8;
  v22 = a11;
  v23 = a12;
  if (a9 == a10)
  {
    if (v22)
      v22[2](v22, 1.0);
    if (v23)
      v23[2](v23, 1);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CEABB0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __136__UIViewController_ForcedRotation__bkui_rotateView_fromOrientation_toOrientation_containerBounds_animatedDuration_alongSide_completion___block_invoke;
    v25[3] = &unk_1EA2806C0;
    v26 = v21;
    v28 = a9;
    v29 = a10;
    v30 = a1;
    v31 = a2;
    v32 = a3;
    v33 = a4;
    v27 = v22;
    objc_msgSend(v24, "animateWithDuration:animations:completion:", v25, v23, a5);

  }
}

- (uint64_t)bkui_deviceOrientationForIterfaceOrientation:()ForcedRotation
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_1DB2DF878[a3 - 1];
}

- (uint64_t)bkui_reverseLeftRight:()ForcedRotation
{
  return objc_msgSend(MEMORY[0x1E0CEABB8], "bkui_reverseLeftRight:");
}

+ (uint64_t)bkui_reverseLeftRight:()ForcedRotation
{
  uint64_t v3;

  v3 = 3;
  if (a3 == 3)
    v3 = 4;
  if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL)
    return v3;
  else
    return a3;
}

@end
