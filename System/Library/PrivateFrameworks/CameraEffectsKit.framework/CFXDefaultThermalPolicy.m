@implementation CFXDefaultThermalPolicy

- (unint64_t)priority
{
  return -1;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  int v8;
  void *v9;
  uint64_t v10;
  int v11;

  if (a3 > 0x32)
    goto LABEL_9;
  if (((1 << a3) & 0x4010040100000) != 0)
  {
    v8 = 15;
  }
  else if (a3)
  {
    if (a3 != 10)
      goto LABEL_9;
    v8 = 24;
  }
  else
  {
    v8 = 30;
  }
  *a6 = v8;
LABEL_9:
  +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cameraMode");

  if (JFXIsVideoCameraMode(v10))
    v11 = *a6;
  else
    v11 = 15;
  *a5 = v11;
}

@end
