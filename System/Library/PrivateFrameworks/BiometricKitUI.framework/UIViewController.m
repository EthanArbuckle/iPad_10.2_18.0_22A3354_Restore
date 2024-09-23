@implementation UIViewController

uint64_t __136__UIViewController_ForcedRotation__bkui_rotateView_fromOrientation_toOrientation_containerBounds_animatedDuration_alongSide_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  float v4;
  double v5;
  CGFloat v6;
  uint64_t v7;
  unint64_t v8;
  double *v9;
  float b;
  float a;
  double v12;
  void *v13;
  void *v14;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t result;
  CGAffineTransform v30;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("transform.rotation.z"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  v6 = 0.0;
  v7 = *(_QWORD *)(a1 + 48);
  switch(*(_QWORD *)(a1 + 56))
  {
    case 1:
      v8 = v7 - 2;
      if (v8 < 3)
      {
        v9 = (double *)&unk_1DB2DF7F0;
        goto LABEL_10;
      }
      break;
    case 2:
      v8 = v7 - 1;
      if (v8 < 4)
      {
        v9 = (double *)&unk_1DB2DF840;
        goto LABEL_10;
      }
      break;
    case 3:
      v8 = v7 - 1;
      if (v8 < 4)
      {
        v9 = (double *)&unk_1DB2DF820;
        goto LABEL_10;
      }
      break;
    case 4:
      v8 = v7 - 1;
      if (v8 < 3)
      {
        v9 = (double *)&unk_1DB2DF808;
LABEL_10:
        v6 = v9[v8];
      }
      break;
    default:
      break;
  }
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformMakeRotation(&v30, v6);
  b = v30.b;
  a = v30.a;
  v12 = v5 + atan2f(b, a);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKeyPath:", v14, CFSTR("transform.rotation.z"));

  __asm { FMOV            V2.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", vaddq_f64(*(float64x2_t *)(a1 + 64), vmulq_f64(*(float64x2_t *)(a1 + 80), _Q2)));
  if (v12 == 0.0)
    goto LABEL_12;
  v22 = 100 * (int)v12;
  if (v22 < 0)
    v22 = -100 * (int)v12;
  HIDWORD(v23) = -1775253149 * v22;
  LODWORD(v23) = -1775253149 * v22;
  if ((v23 >> 2) <= 0xDA740D)
  {
LABEL_12:
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v20, "setBounds:");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    v26 = v25;
    v28 = v27;

    objc_msgSend(*(id *)(a1 + 32), "setBounds:", v26, v28, *(double *)(a1 + 88), *(double *)(a1 + 80));
  }
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(v6);
  return result;
}

@end
