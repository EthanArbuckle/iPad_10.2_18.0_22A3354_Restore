@implementation DASoftLinking

+ (BOOL)isBiometricKitFrameworkAvailable
{
  if (qword_1000083C8 != -1)
    dispatch_once(&qword_1000083C8, &stru_1000040E8);
  return byte_1000083C0;
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
  if (qword_1000083D8 != -1)
    dispatch_once(&qword_1000083D8, &stru_100004108);
  return byte_1000083D0;
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
  if (qword_1000083E8 != -1)
    dispatch_once(&qword_1000083E8, &stru_100004128);
  return byte_1000083E0;
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
  if (qword_1000083F8 != -1)
    dispatch_once(&qword_1000083F8, &stru_100004148);
  return byte_1000083F0;
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
