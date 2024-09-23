@implementation CADExcludeIntegrationsAccountAccessHandler

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  void *v7;

  -[CADAccountAccessHandler dataProvider](self, "dataProvider", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v7, "isIntegrationStore:inDatabase:", a4, a5) ^ 1;

  return (char)a5;
}

@end
