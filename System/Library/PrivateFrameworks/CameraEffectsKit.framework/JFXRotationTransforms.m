@implementation JFXRotationTransforms

+ (CGAffineTransform)transformFromCaptureDevicePosition:(SEL)a3 captureVideoOrientation:(int64_t)a4 toInterfaceOrientation:(int64_t)a5
{
  CGAffineTransform *result;
  int v9;
  uint64_t v10;
  __int128 v11;
  CGFloat v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  result = (CGAffineTransform *)objc_msgSend(a2, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", a4, a5, a6);
  v9 = (int)result;
  v10 = MEMORY[0x24BDBD8B8];
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v10 + 32);
  if (a4 == 2)
    result = CGAffineTransformMakeScale(retstr, -1.0, 1.0);
  if (v9)
  {
    v12 = PVCardinalAnglesDouble_1[v9];
    v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v16, &v15, v12);
    v14 = *(_OWORD *)&v16.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v16.tx;
  }
  return result;
}

+ (CGAffineTransform)transformFromTopLeftCaptureDevicePivotPosition:(SEL)a3 captureVideoOrientation:(int64_t)a4 toInterfaceOrientation:(int64_t)a5 size:(int64_t)a6
{
  double height;
  double width;
  int v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform *result;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  height = a7.height;
  width = a7.width;
  v11 = objc_msgSend(a2, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", a4, a5, a6);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, -1.0, 1.0);
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeRotation(&v25, PVCardinalAnglesDouble_1[v11]);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, width * -0.5, height * -0.5);
  memset(&v23, 0, sizeof(v23));
  v12 = width * 0.5;
  v13 = height * 0.5;
  CGAffineTransformMakeTranslation(&v23, v12, v13);
  if ((v11 & 0xFFFFFFFD) == 1)
  {
    CGAffineTransformMakeTranslation(&t1, v13, v12);
    v23 = t1;
    CGAffineTransformMakeScale(&t1, 1.0, -1.0);
    v26 = t1;
  }
  v14 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v24.tx;
  if (a4 == 2)
  {
    t1 = v24;
    t2 = v26;
    CGAffineTransformConcat(retstr, &t1, &t2);
  }
  v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v15;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  v20 = v25;
  CGAffineTransformConcat(&t1, &t2, &v20);
  v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v17;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  v20 = v23;
  result = CGAffineTransformConcat(&t1, &t2, &v20);
  v19 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

+ (int)rotationFromCaptureDevicePosition:(int64_t)a3 captureVideoOrientation:(int64_t)a4 toInterfaceOrientation:(int64_t)a5
{
  uint64_t v8;
  uint64_t v10;

  if (!a5)
    return 0;
  if (rotationFromCaptureDevicePosition_captureVideoOrientation_toInterfaceOrientation__onceToken != -1)
    dispatch_once(&rotationFromCaptureDevicePosition_captureVideoOrientation_toInterfaceOrientation__onceToken, &__block_literal_global_63);
  if ((unint64_t)(a4 - 2) > 2)
    v8 = 0;
  else
    v8 = qword_226AB8778[a4 - 2];
  if ((unint64_t)(a5 - 2) > 2)
    v10 = 0;
  else
    v10 = qword_226AB8778[a5 - 2];
  return *(_DWORD *)(*(_QWORD *)(rotationFromCaptureDevicePosition_captureVideoOrientation_toInterfaceOrientation__MASTER_LOOKUP
                               + ((32 * (a3 != 2)) | (8 * v8)))
                   + 4 * v10);
}

void __106__JFXRotationTransforms_rotationFromCaptureDevicePosition_captureVideoOrientation_toInterfaceOrientation___block_invoke()
{
  rotationFromCaptureDevicePosition_captureVideoOrientation_toInterfaceOrientation__MASTER_LOOKUP = (uint64_t)&_block_invoke_master_lookup;
}

+ (int)rotationFromUIInterfaceOrientation:(int64_t)a3 toUIInterfaceOrientation:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;

  if (rotationFromUIInterfaceOrientation_toUIInterfaceOrientation__onceToken != -1)
    dispatch_once(&rotationFromUIInterfaceOrientation_toUIInterfaceOrientation__onceToken, &__block_literal_global_1);
  if ((unint64_t)(a3 - 2) > 2)
    v6 = 0;
  else
    v6 = qword_226AB8790[a3 - 2];
  if ((unint64_t)(a4 - 2) > 2)
    v7 = 0;
  else
    v7 = qword_226AB8790[a4 - 2];
  return *(_DWORD *)(*(_QWORD *)(rotationFromUIInterfaceOrientation_toUIInterfaceOrientation__MASTER_LOOKUP + 8 * v6)
                   + 4 * v7);
}

void __85__JFXRotationTransforms_rotationFromUIInterfaceOrientation_toUIInterfaceOrientation___block_invoke()
{
  rotationFromUIInterfaceOrientation_toUIInterfaceOrientation__MASTER_LOOKUP = (uint64_t)&_block_invoke_2_master_lookup;
}

@end
