@implementation CameraAPSCalibrationInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  char v9;

  v9 = 0;
  if (!a3)
    return 0;
  v4 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("cameras"), v6, 4, &v9, &stru_1000041A8));

  -[CameraAPSCalibrationInputs setCameras:](self, "setCameras:", v7);
  return v9 == 0;
}

- (NSArray)cameras
{
  return self->_cameras;
}

- (void)setCameras:(id)a3
{
  objc_storeStrong((id *)&self->_cameras, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameras, 0);
}

@end
