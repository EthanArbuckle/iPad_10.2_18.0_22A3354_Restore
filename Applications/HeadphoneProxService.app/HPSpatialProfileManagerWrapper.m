@implementation HPSpatialProfileManagerWrapper

+ (BOOL)isProxCardEnrollmentSupportedForDevice:(id)a3
{
  Class (__cdecl *v3)();
  id v4;

  v3 = (Class (__cdecl *)())off_1000B7A38;
  v4 = a3;
  LOBYTE(v3) = -[objc_class isProxCardEnrollmentSupportedForDevice:](v3(), "isProxCardEnrollmentSupportedForDevice:", v4);

  return (char)v3;
}

+ (id)profileEnrollmentViewController
{
  Class v2;

  v2 = off_1000B7A38();
  return -[objc_class profileEnrollmentViewController](v2, "profileEnrollmentViewController");
}

+ (void)setProxCardShowed:(BOOL)a3 forDevice:(id)a4
{
  _BOOL8 v4;
  Class (__cdecl *v5)();
  id v6;

  v4 = a3;
  v5 = off_1000B7A38;
  v6 = a4;
  -[objc_class setProxCardShowed:forDevice:](v5(), "setProxCardShowed:forDevice:", v4, v6);

}

@end
