@implementation LACDTOEnvironmentProviderFactory

+ (id)environmentProviderWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[LACDTOEnvironmentProvider initWithLocationProvider:featureController:ratchetStateProvider:lostModeController:]([_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider alloc], "initWithLocationProvider:featureController:ratchetStateProvider:lostModeController:", v12, v11, v10, v9);

  return v13;
}

@end
