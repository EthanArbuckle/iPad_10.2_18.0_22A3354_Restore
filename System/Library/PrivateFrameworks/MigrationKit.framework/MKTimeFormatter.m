@implementation MKTimeFormatter

- (MKTimeFormatter)init
{
  MKTimeFormatter *v2;
  MKTimeFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKTimeFormatter;
  v2 = -[MKTimeFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MKTimeFormatter setNumberStyle:](v2, "setNumberStyle:", 1);
    -[MKTimeFormatter setMinimumFractionDigits:](v3, "setMinimumFractionDigits:", 2);
    -[MKTimeFormatter setMaximumFractionDigits:](v3, "setMaximumFractionDigits:", 2);
    -[MKTimeFormatter setPositiveSuffix:](v3, "setPositiveSuffix:", CFSTR(" m"));
    -[MKTimeFormatter setRoundingMode:](v3, "setRoundingMode:", 6);
  }
  return v3;
}

- (id)stringForObjectValue:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v5 / 60.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10.receiver = self;
    v10.super_class = (Class)MKTimeFormatter;
    -[MKTimeFormatter stringForObjectValue:](&v10, sel_stringForObjectValue_, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MKTimeFormatter;
    -[MKTimeFormatter stringForObjectValue:](&v9, sel_stringForObjectValue_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
