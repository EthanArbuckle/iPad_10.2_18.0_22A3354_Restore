@implementation AXAuditTheme

+ (id)sharedTheme
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__AXAuditTheme_sharedTheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTheme_onceToken != -1)
    dispatch_once(&sharedTheme_onceToken, block);
  return (id)sharedTheme_instance;
}

void __27__AXAuditTheme_sharedTheme__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedTheme_instance;
  sharedTheme_instance = v0;

}

- (id)backgroundColorForHighlightStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.298039216;
      v7 = 0.850980392;
      v8 = 0.392156863;
      v9 = 0.6;
      goto LABEL_6;
    case 4uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v7 = 0.682352941;
      v9 = 0.7;
      v6 = 1.0;
      v8 = 0.0;
      goto LABEL_6;
    case 5uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.698039216;
      v8 = 0.498039216;
      v7 = 1.0;
      v9 = 0.5;
      goto LABEL_6;
    case 6uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.0;
      v7 = 0.0;
      v8 = 0.0;
      v9 = 0.0;
LABEL_6:
      objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v6, v7, v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)borderColorForHighlightStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v6 = 0.4;
      v7 = 0.0;
      v8 = 0.0;
      goto LABEL_5;
    case 5uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v7 = 0.0;
      v8 = 0.0;
      v6 = 0.0;
      goto LABEL_5;
    case 6uLL:
      v5 = (void *)MEMORY[0x24BDF6950];
      v7 = 0.298039216;
      v6 = 0.4;
      v8 = 0.298039216;
LABEL_5:
      objc_msgSend(v5, "colorWithRed:green:blue:alpha:", v7, v8, 0.0, v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
      break;
    default:
      return v4;
  }
  return v4;
}

- (double)borderWidthForHighlightStyle:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (a3 - 3 <= 3)
    return dbl_235D05CD8[a3 - 3];
  return result;
}

@end
