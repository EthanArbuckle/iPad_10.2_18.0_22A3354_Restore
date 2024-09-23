@implementation DASoftLinking

+ (BOOL)isBiometricKitFrameworkAvailable
{
  if (qword_1000089E0 != -1)
    dispatch_once(&qword_1000089E0, &stru_100004100);
  return byte_1000089D8;
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
  if (qword_1000089F0 != -1)
    dispatch_once(&qword_1000089F0, &stru_100004120);
  return byte_1000089E8;
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
  if (qword_100008A00 != -1)
    dispatch_once(&qword_100008A00, &stru_100004140);
  return byte_1000089F8;
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
  if (qword_100008A10 != -1)
    dispatch_once(&qword_100008A10, &stru_100004160);
  return byte_100008A08;
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
