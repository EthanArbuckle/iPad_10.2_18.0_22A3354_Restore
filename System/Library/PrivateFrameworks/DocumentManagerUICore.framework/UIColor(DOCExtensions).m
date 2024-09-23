@implementation UIColor(DOCExtensions)

+ (id)_doc_safeTintColor:()DOCExtensions
{
  id v3;
  void *v4;
  double v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_colorDifferenceFromColor:", v3);
  if (v5 >= 0.2)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)_doc_invertedColor
{
  __int128 v2;
  double v3[3];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 0u;
  *(_OWORD *)v3 = 0u;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v2, (char *)&v2 + 8, v3, &v3[1]);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0 - *(double *)&v2, 1.0 - *((double *)&v2 + 1), 1.0 - v3[0], v3[1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)doc_readableFromColor:()DOCExtensions fallbackColor:
{
  id v6;
  double v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a1, "_colorDifferenceFromColor:", a3);
  if (v7 < 0.2)
    v8 = v6;
  else
    v8 = a1;
  v9 = v8;

  return v9;
}

@end
