@implementation UIViewVectorAnimatableProperty(MobileSafariFrameworkExtras)

+ (id)safari_propertyWithLength:()MobileSafariFrameworkExtras
{
  char v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(MEMORY[0x1E0DC3F48], "instancesRespondToSelector:", sel_initWithLength_);
  v6 = [a1 alloc];
  if ((v5 & 1) != 0)
    v7 = (void *)objc_msgSend(v6, "initWithLength:", a3);
  else
    v7 = (void *)objc_msgSend(v6, "_initWithLength:", a3);
  return v7;
}

+ (id)safari_pointProperty
{
  void *v1;

  objc_msgSend(a1, "safari_propertyWithLength:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_setPointValue:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  return v1;
}

- (uint64_t)safari_setPointValue:()MobileSafariFrameworkExtras
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setPointValue___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v4[4] = a2;
  *(double *)&v4[5] = a3;
  return objc_msgSend(a1, "_mutateValue:", v4);
}

- (double)safari_pointValue
{
  return *(double *)objc_msgSend(a1, "_value");
}

- (double)safari_pointPresentationValue
{
  return *(double *)objc_msgSend(a1, "_presentationValue");
}

+ (id)safari_sizeProperty
{
  void *v1;

  objc_msgSend(a1, "safari_propertyWithLength:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_setSizeValue:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  return v1;
}

- (uint64_t)safari_setSizeValue:()MobileSafariFrameworkExtras
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setSizeValue___block_invoke;
  v4[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v4[4] = a2;
  *(double *)&v4[5] = a3;
  return objc_msgSend(a1, "_mutateValue:", v4);
}

- (double)safari_sizeValue
{
  return *(double *)objc_msgSend(a1, "_value");
}

- (double)safari_sizePresentationValue
{
  return *(double *)objc_msgSend(a1, "_presentationValue");
}

+ (id)safari_rectProperty
{
  void *v1;

  objc_msgSend(a1, "safari_propertyWithLength:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_setRectValue:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  return v1;
}

- (uint64_t)safari_setRectValue:()MobileSafariFrameworkExtras
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setRectValue___block_invoke;
  v6[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(double *)&v6[4] = a2;
  *(double *)&v6[5] = a3;
  *(double *)&v6[6] = a4;
  *(double *)&v6[7] = a5;
  return objc_msgSend(a1, "_mutateValue:", v6);
}

- (double)safari_rectValue
{
  return *(double *)objc_msgSend(a1, "_value");
}

- (double)safari_rectPresentationValue
{
  return *(double *)objc_msgSend(a1, "_presentationValue");
}

+ (id)safari_transformProperty
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(a1, "safari_propertyWithLength:", 6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "safari_setTransformValue:", v4);
  return v1;
}

- (uint64_t)safari_setTransformValue:()MobileSafariFrameworkExtras
{
  __int128 v4;
  _QWORD v6[4];
  CGAffineTransformComponents v7;
  CGAffineTransform transform;
  CGAffineTransformComponents v9;

  memset(&v9, 0, sizeof(v9));
  v4 = a3[1];
  *(_OWORD *)&transform.a = *a3;
  *(_OWORD *)&transform.c = v4;
  *(_OWORD *)&transform.tx = a3[2];
  CGAffineTransformDecompose(&v9, &transform);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setTransformValue___block_invoke;
  v6[3] = &__block_descriptor_80_e9_v16__0_d8l;
  v7 = v9;
  return objc_msgSend(a1, "_mutateValue:", v6);
}

- (CGAffineTransform)safari_transformValue
{
  uint64_t v3;
  long double v4;
  long double v5;
  __int128 v6;
  CGVector v7;
  CGAffineTransformComponents v9;

  v3 = objc_msgSend(a1, "_value");
  v4 = exp(*(long double *)v3);
  v5 = exp(*(long double *)(v3 + 8));
  v7 = *(CGVector *)(v3 + 16);
  v6 = *(_OWORD *)(v3 + 32);
  v9.scale.width = v4;
  v9.scale.height = v5;
  *(_OWORD *)&v9.horizontalShear = v6;
  v9.translation = v7;
  return CGAffineTransformMakeWithComponents(a2, &v9);
}

- (CGAffineTransform)safari_transformPresentationValue
{
  uint64_t v3;
  long double v4;
  long double v5;
  __int128 v6;
  CGVector v7;
  CGAffineTransformComponents v9;

  v3 = objc_msgSend(a1, "_presentationValue");
  v4 = exp(*(long double *)v3);
  v5 = exp(*(long double *)(v3 + 8));
  v7 = *(CGVector *)(v3 + 16);
  v6 = *(_OWORD *)(v3 + 32);
  v9.scale.width = v4;
  v9.scale.height = v5;
  *(_OWORD *)&v9.horizontalShear = v6;
  v9.translation = v7;
  return CGAffineTransformMakeWithComponents(a2, &v9);
}

@end
