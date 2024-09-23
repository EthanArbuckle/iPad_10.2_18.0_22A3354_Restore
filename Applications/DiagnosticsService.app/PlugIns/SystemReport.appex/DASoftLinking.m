@implementation DASoftLinking

+ (BOOL)isBiometricKitFrameworkAvailable
{
  if (qword_1000BA068 != -1)
    dispatch_once(&qword_1000BA068, &stru_100080AC0);
  return byte_1000BA060;
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
  if (qword_1000BA070 != -1)
    dispatch_once(&qword_1000BA070, &stru_100080AE0);
  return byte_1000BA061;
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
  if (qword_1000BA078 != -1)
    dispatch_once(&qword_1000BA078, &stru_100080B00);
  return byte_1000BA062;
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
  if (qword_1000BA080 != -1)
    dispatch_once(&qword_1000BA080, &stru_100080B20);
  return byte_1000BA063;
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
