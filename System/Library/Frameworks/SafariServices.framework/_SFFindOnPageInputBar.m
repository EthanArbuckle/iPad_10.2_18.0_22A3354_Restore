@implementation _SFFindOnPageInputBar

- (_SFFindOnPageInputBar)initWithFrame:(CGRect)a3
{
  _SFFindOnPageInputBar *v3;
  _SFFindOnPageInputBar *v4;
  void *v5;
  _SFFindOnPageInputBar *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFFindOnPageInputBar;
  v3 = -[_SFFindOnPageInputBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFFindOnPageInputBar setSearchBarStyle:](v3, "setSearchBarStyle:", 2);
    -[_SFFindOnPageInputBar setAutocorrectionType:](v4, "setAutocorrectionType:", 1);
    -[_SFFindOnPageInputBar setAutocapitalizationType:](v4, "setAutocapitalizationType:", 0);
    -[_SFFindOnPageInputBar setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_SFFindOnPageInputBar searchField](v4, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisablePrediction:", 1);

    v6 = v4;
  }

  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  return 1000.0;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  if (a3 || (_SFDeviceIsPad() & 1) == 0)
    return 250.0;
  else
    return 750.0;
}

- (CGSize)intrinsicContentSize
{
  int IsPad;
  double v3;
  double v4;
  CGSize result;

  IsPad = _SFDeviceIsPad();
  v3 = 9999.0;
  if (IsPad)
    v3 = 660.0;
  v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end
