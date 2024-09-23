@implementation ATXMagicalMomentsStatistics

+ (double)calculateModelConfidenceWithCorrectPredictions:(double)a3 incorrectPredictions:(double)a4
{
  double v6;
  int v7;
  double v8;
  double v9;

  v6 = 0.0;
  v7 = 20;
  v8 = 1.0;
  do
  {
    objc_msgSend((id)objc_opt_class(), "betaDistributionCdfAtX:paramA:paramB:", (v8 + v6) * 0.5, a3, a4);
    if (1.0 - v9 >= 0.95)
      v6 = (v8 + v6) * 0.5;
    else
      v8 = (v8 + v6) * 0.5;
    --v7;
  }
  while (v7);
  return (v8 + v6) * 0.5;
}

+ (double)betaDistributionCdfAtX:(double)a3 paramA:(double)a4 paramB:(double)a5
{
  double i;
  double v10;
  double v11;
  long double v12;
  double v13;
  long double v14;
  long double v15;
  double result;

  i = -1.0;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    i = 0.0;
    if (a3 != 0.0)
    {
      i = 1.0;
      if (a3 != 1.0)
      {
        v10 = 0.0005;
        for (i = 0.0; v10 <= a3; v10 = v10 + 0.001)
        {
          v11 = log(v10);
          v12 = log(1.0 - v10);
          i = i + exp((a5 + -1.0) * v12 + (a4 + -1.0) * v11) * 0.001;
        }
      }
    }
  }
  v13 = lgamma(a4);
  v14 = v13 + lgamma(a5);
  v15 = lgamma(a4 + a5);
  result = i / exp(v14 - v15);
  if (result > 1.0)
    result = 1.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

@end
