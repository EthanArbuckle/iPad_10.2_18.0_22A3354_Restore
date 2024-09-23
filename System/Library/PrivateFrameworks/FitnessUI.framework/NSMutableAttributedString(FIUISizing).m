@implementation NSMutableAttributedString(FIUISizing)

- (double)scaleFontSizeByAmount:()FIUISizing minimumFontSize:
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  _QWORD v10[8];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = objc_msgSend(a1, "length");
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(a1, "beginEditing");
  v7 = *MEMORY[0x24BEBB360];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__NSMutableAttributedString_FIUISizing__scaleFontSizeByAmount_minimumFontSize___block_invoke;
  v10[3] = &unk_24CF30D70;
  *(double *)&v10[6] = a2;
  *(double *)&v10[7] = a3;
  v10[4] = a1;
  v10[5] = &v11;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0x100000, v10);
  objc_msgSend(a1, "endEditing");
  v8 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (double)scaleNumericAttribute:()FIUISizing byAmount:
{
  id v6;
  uint64_t v7;
  id v8;
  double v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, uint64_t);
  void *v14;
  void *v15;
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0x3FF0000000000000;
  objc_msgSend(a1, "beginEditing");
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __72__NSMutableAttributedString_FIUISizing__scaleNumericAttribute_byAmount___block_invoke;
  v14 = &unk_24CF30D98;
  v18 = a2;
  v17 = &v19;
  v15 = a1;
  v8 = v6;
  v16 = v8;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0x100000, &v11);
  objc_msgSend(a1, "endEditing", v11, v12, v13, v14, v15);
  v9 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (uint64_t)scaleToFitWidth:()FIUISizing
{
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;

  result = objc_msgSend(a1, "size");
  if (v5 > a2)
  {
    do
    {
      objc_msgSend(a1, "scaleFontSizeByAmount:minimumFontSize:", 0.94, 1.0);
      v7 = v6;
      result = objc_msgSend(a1, "size");
    }
    while (v8 > a2 && v7 > 1.0);
  }
  return result;
}

- (double)scaleFontAndKerningToFitSize:()FIUISizing minimumFontSize:minimumKerning:stillDidntFit:
{
  uint64_t v13;
  char v14;
  double v15;
  double v16;
  char v17;
  double v18;
  double v19;
  double v20;

  v13 = *MEMORY[0x24BEBB378];
  v14 = 1;
  v15 = 1.79769313e308;
  v16 = 1.79769313e308;
  do
  {
    if ((v14 & 1) != 0)
      goto LABEL_10;
    v17 = 1;
    if (objc_msgSend(a1, "length") && a2 > 0.0 && a3 > 0.0)
    {
      if (v16 > a5)
      {
        objc_msgSend(a1, "scaleNumericAttribute:byAmount:", v13, 0.8);
        v16 = v18;
LABEL_10:
        v17 = 0;
        goto LABEL_11;
      }
      if (v15 > a4)
      {
        objc_msgSend(a1, "scaleFontSizeByAmount:minimumFontSize:", 0.85, a4);
        v15 = v19;
        goto LABEL_10;
      }
    }
LABEL_11:
    objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, 0, a2, 1.79769313e308);
    if ((v17 & 1) != 0)
      break;
    v14 = 0;
  }
  while (v20 > a3);
  if (a7)
    *a7 = v20 > a3;
  return a2;
}

@end
