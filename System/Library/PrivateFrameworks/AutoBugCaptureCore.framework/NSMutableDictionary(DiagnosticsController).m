@implementation NSMutableDictionary(DiagnosticsController)

- (void)setActions:()DiagnosticsController forProcess:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
    objc_msgSend(a1, "setValue:forKey:", v7, v6);

}

@end
