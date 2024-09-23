@implementation FBSProcessor

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 >= 3)
    +[FBSProcessor formatForInputAtIndex:].cold.1();
  return *off_1E2EC3910[a3];
}

+ (int)outputFormat
{
  return 2053;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("fullROI"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "CGRectValue");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)skipFormatChecks
{
  return 1;
}

+ (void)formatForInputAtIndex:.cold.1()
{
  __assert_rtn("+[FBSProcessor formatForInputAtIndex:]", "CIFastBilateralSolver.m", 467, "0 && \"unreachable\");
}

@end
