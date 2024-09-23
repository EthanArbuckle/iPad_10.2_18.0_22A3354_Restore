@implementation DASoftLinking

+ (BOOL)isBiometricKitFrameworkAvailable
{
  if (qword_10000CCB0 != -1)
    dispatch_once(&qword_10000CCB0, &stru_1000082C8);
  return byte_10000CCA8;
}

+ (Class)biometricKitClass:(id)a3
{
  NSString *v3;
  Class v4;
  void *v5;

  v3 = (NSString *)a3;
  if (+[DASoftLinking isBiometricKitFrameworkAvailable](DASoftLinking, "isBiometricKitFrameworkAvailable"))
  {
    v4 = NSClassFromString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (BOOL)isNearFieldFrameworkAvailable
{
  if (qword_10000CCC0 != -1)
    dispatch_once(&qword_10000CCC0, &stru_1000082E8);
  return byte_10000CCB8;
}

+ (Class)nearFieldClass:(id)a3
{
  NSString *v3;
  Class v4;
  void *v5;

  v3 = (NSString *)a3;
  if (+[DASoftLinking isNearFieldFrameworkAvailable](DASoftLinking, "isNearFieldFrameworkAvailable"))
  {
    v4 = NSClassFromString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (BOOL)isNearFieldAccessoryFrameworkAvailable
{
  if (qword_10000CCD0 != -1)
    dispatch_once(&qword_10000CCD0, &stru_100008308);
  return byte_10000CCC8;
}

+ (Class)nearFieldAccessoryClass:(id)a3
{
  NSString *v3;
  Class v4;
  void *v5;

  v3 = (NSString *)a3;
  if (+[DASoftLinking isNearFieldAccessoryFrameworkAvailable](DASoftLinking, "isNearFieldAccessoryFrameworkAvailable"))
  {
    v4 = NSClassFromString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (BOOL)isCoreRepairFrameworkAvailable
{
  if (qword_10000CCE0 != -1)
    dispatch_once(&qword_10000CCE0, &stru_100008328);
  return byte_10000CCD8;
}

+ (Class)coreRepairClass:(id)a3
{
  NSString *v3;
  Class v4;
  void *v5;

  v3 = (NSString *)a3;
  if (+[DASoftLinking isCoreRepairFrameworkAvailable](DASoftLinking, "isCoreRepairFrameworkAvailable"))
  {
    v4 = NSClassFromString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

@end
