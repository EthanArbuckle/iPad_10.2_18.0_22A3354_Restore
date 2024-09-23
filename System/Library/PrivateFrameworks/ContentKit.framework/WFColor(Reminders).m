@implementation WFColor(Reminders)

+ (id)colorWithRemindersColor:()Reminders
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "colorRGBSpace");
  objc_msgSend(v4, "red");
  v7 = v6;
  objc_msgSend(v4, "green");
  v9 = v8;
  objc_msgSend(v4, "blue");
  v11 = v10;
  objc_msgSend(v4, "alpha");
  v13 = v12;

  if (v5 == 1)
    objc_msgSend(a1, "colorWithDisplayP3Red:green:blue:alpha:", v7, v9, v11, v13);
  else
    objc_msgSend(a1, "colorWithRed:green:blue:alpha:", v7, v9, v11, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
