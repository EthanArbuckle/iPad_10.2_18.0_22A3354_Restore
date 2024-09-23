@implementation UILabel

- (void)setAttributedOrPlainText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UILabel *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;

  v11 = (const __CFString *)a3;
  v5 = objc_opt_class(NSString, v4);
  if ((objc_opt_isKindOfClass(v11, v5) & 1) != 0)
  {
    v7 = self;
    v8 = v11;
  }
  else
  {
    v9 = objc_opt_class(NSAttributedString, v6);
    if ((objc_opt_isKindOfClass(v11, v9) & 1) != 0)
    {
      -[UILabel setAttributedText:](self, "setAttributedText:", v11);
      goto LABEL_6;
    }
    v10 = (__CFString *)v11;
    if (v11)
      goto LABEL_7;
    v8 = &stru_10028DC20;
    v7 = self;
  }
  -[UILabel setText:](v7, "setText:", v8);
LABEL_6:
  v10 = (__CFString *)v11;
LABEL_7:

}

@end
