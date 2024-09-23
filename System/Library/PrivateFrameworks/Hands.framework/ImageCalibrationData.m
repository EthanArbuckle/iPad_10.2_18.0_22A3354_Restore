@implementation ImageCalibrationData

- (__n128)cameraToHeadsetTransform
{
  swift_beginAccess();
  return a1[12];
}

- (double)setCameraToHeadsetTransform:(__n128)a3
{
  double result;

  swift_beginAccess();
  *(__n128 *)(a1 + 192) = a2;
  *(__n128 *)(a1 + 208) = a3;
  *(__n128 *)(a1 + 224) = a4;
  *(__n128 *)(a1 + 240) = a5;
  result = 0.0;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_BYTE *)(a1 + 400) = 1;
  return result;
}

- (BOOL)isRectilinearImage
{
  uint64_t v3;

  swift_beginAccess();
  v3 = *(_QWORD *)self->cameraModel;
  if (self->cameraModel[8])
    v3 = v3 != 0;
  return v3 == 0;
}

@end
