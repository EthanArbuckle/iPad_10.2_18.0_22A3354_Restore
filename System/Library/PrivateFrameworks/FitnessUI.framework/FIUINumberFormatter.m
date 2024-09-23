@implementation FIUINumberFormatter

- (id)stringFromNumber:(id)a3
{
  id v4;
  void *v5;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  if (!-[FIUINumberFormatter maximumFractionDigits](self, "maximumFractionDigits"))
  {
    objc_msgSend(v4, "doubleValue");
    v8 = v7;
    switch(-[FIUINumberFormatter roundingMode](self, "roundingMode"))
    {
      case 0:
      case 2:
        v9 = v8 < 0.0;
        v10 = -1.0;
        goto LABEL_11;
      case 4:
      case 5:
        if (v8 < 0.0 && v8 >= -0.5)
          goto LABEL_15;
        break;
      case 6:
        v9 = v8 < 0.0;
        v10 = -0.5;
LABEL_11:
        if (v9 && v8 > v10)
        {
LABEL_15:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
          v13 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v13;
        }
        break;
      default:
        break;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)FIUINumberFormatter;
  -[FIUINumberFormatter stringFromNumber:](&v14, sel_stringFromNumber_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
