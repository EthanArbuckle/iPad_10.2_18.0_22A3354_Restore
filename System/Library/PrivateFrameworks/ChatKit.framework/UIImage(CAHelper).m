@implementation UIImage(CAHelper)

- (id)__ck_imageScaledToFillSize:()CAHelper
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];

  objc_msgSend(a1, "size");
  v7 = a2 / v6;
  objc_msgSend(a1, "size");
  if (v7 < a3 / v8)
    v7 = a3 / v8;
  objc_msgSend(a1, "size");
  v10 = v9 * v7;
  objc_msgSend(a1, "size");
  v12 = v11 * v7;
  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScale:", 0.0);
  objc_msgSend(v13, "setPreferredRange:", 0);
  objc_msgSend(v13, "setOpaque:", 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v13, v10, v12);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__UIImage_CAHelper____ck_imageScaledToFillSize___block_invoke;
  v17[3] = &unk_1E2750638;
  v17[4] = a1;
  *(double *)&v17[5] = v10;
  *(double *)&v17[6] = v12;
  objc_msgSend(v14, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
