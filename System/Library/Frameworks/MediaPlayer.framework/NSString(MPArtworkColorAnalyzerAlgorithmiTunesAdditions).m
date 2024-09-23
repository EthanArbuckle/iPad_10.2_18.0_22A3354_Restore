@implementation NSString(MPArtworkColorAnalyzerAlgorithmiTunesAdditions)

- (id)MP_colorFromHexString
{
  void *v4;
  void *v5;
  void *v7;
  int v8;

  if (objc_msgSend(a1, "length") != 7 || (objc_msgSend(a1, "hasPrefix:", CFSTR("#")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+MPArtworkColorAnalyzerAlgorithmiTunesAdditions.m"), 14, CFSTR("Hex string is expected to begin with # and contain 6 digits"));

  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScanLocation:", 1);
  objc_msgSend(v4, "scanHexInt:", &v8);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v8) / 255.0, (double)BYTE1(v8) / 255.0, (double)v8 / 255.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)MP_hexStringFromColor:()MPArtworkColorAnalyzerAlgorithmiTunesAdditions
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  v4 = 0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), (int)(v7 * 255.0), (int)(v6 * 255.0), (int)(v5 * 255.0));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
