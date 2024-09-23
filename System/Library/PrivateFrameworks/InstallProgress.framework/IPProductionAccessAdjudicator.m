@implementation IPProductionAccessAdjudicator

- (BOOL)progressServer:(id)a3 shouldAcceptConnection:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.InstallProgress.access"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

@end
