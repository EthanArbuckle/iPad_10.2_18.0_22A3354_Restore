@implementation LUIStringfy

+ (id)dataSizeStringFromBytes:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  const __CFString *v6;

  v3 = (double)a3;
  v4 = (double)a3 / 1000.0;
  if (v4 <= 1.0)
  {
    v6 = CFSTR("bytes");
  }
  else
  {
    v3 = v4 / 1000.0;
    if (v4 / 1000.0 <= 1.0)
    {
      v6 = CFSTR("KB");
      v3 = (double)a3 / 1000.0;
    }
    else
    {
      v5 = v3 / 1000.0;
      if (v3 / 1000.0 > 1.0)
        v3 = v3 / 1000.0;
      v6 = CFSTR("MB");
      if (v5 > 1.0)
        v6 = CFSTR("GB");
    }
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f %@"), *(_QWORD *)&v3, v6);
}

@end
