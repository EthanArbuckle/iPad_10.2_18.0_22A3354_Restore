@implementation ComponentCameraIRBase

- (BOOL)isPresent
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase serialNumber](self, "serialNumber"));
  v5 = v4;
  LOBYTE(v6) = 0;
  if (v3 && v4)
    v6 = objc_msgSend(v4, "isEqualToString:", &stru_10009EB48) ^ 1;

  return v6;
}

- (id)serialNumberComponentPropertyKey
{
  return CFSTR("JasperSNUM");
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end
