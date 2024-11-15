@implementation VirtualCameraWarpingStates

- (double)initWithInputCamera:(void *)a3 outputCamera:(double)a4 outputROI:(double)a5
{
  double *v13;
  objc_super v15;

  if (!a1)
    return 0;
  v15.receiver = a1;
  v15.super_class = (Class)VirtualCameraWarpingStates;
  v13 = (double *)objc_msgSendSuper2(&v15, sel_init);
  if (v13)
  {
    *((_QWORD *)v13 + 1) = a2;
    *((_QWORD *)v13 + 2) = a3;
    v13[3] = a4;
    v13[4] = a5;
    v13[5] = a6;
    v13[6] = a7;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VirtualCameraWarpingStates;
  -[VirtualCameraWarpingStates dealloc](&v3, sel_dealloc);
}

@end
