@implementation UIImage(ControlCenterAdditions)

- (id)ccuiAlphaOnlyImageForMaskImage
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  objc_msgSend(a1, "size");
  BSRectWithSize();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredRange:", 0x7FFFLL);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v10, v7, v9);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__UIImage_ControlCenterAdditions__ccuiAlphaOnlyImageForMaskImage__block_invoke;
  v14[3] = &unk_1E8E20B40;
  v14[4] = a1;
  v14[5] = v3;
  v14[6] = v5;
  *(double *)&v14[7] = v7;
  *(double *)&v14[8] = v9;
  objc_msgSend(v11, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
