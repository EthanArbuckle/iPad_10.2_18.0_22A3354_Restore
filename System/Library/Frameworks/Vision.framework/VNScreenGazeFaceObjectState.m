@implementation VNScreenGazeFaceObjectState

- (void)dealloc
{
  _QWORD *screenGazeState;
  void **v4;
  void **v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  screenGazeState = self->_screenGazeState;
  if (!screenGazeState)
    goto LABEL_16;
  v4 = (void **)screenGazeState[4];
  v5 = (void **)screenGazeState[5];
  screenGazeState[8] = 0;
  v6 = (char *)v5 - (char *)v4;
  if ((unint64_t)((char *)v5 - (char *)v4) >= 0x11)
  {
    do
    {
      operator delete(*v4);
      v5 = (void **)screenGazeState[5];
      v4 = (void **)(screenGazeState[4] + 8);
      screenGazeState[4] = v4;
      v6 = (char *)v5 - (char *)v4;
    }
    while ((unint64_t)((char *)v5 - (char *)v4) > 0x10);
  }
  v7 = v6 >> 3;
  if (v7 == 1)
  {
    v8 = 128;
  }
  else
  {
    if (v7 != 2)
      goto LABEL_9;
    v8 = 256;
  }
  screenGazeState[7] = v8;
LABEL_9:
  if (v4 != v5)
  {
    do
    {
      v9 = *v4++;
      operator delete(v9);
    }
    while (v4 != v5);
    v11 = screenGazeState[4];
    v10 = screenGazeState[5];
    if (v10 != v11)
      screenGazeState[5] = v10 + ((v11 - v10 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  v12 = (void *)screenGazeState[3];
  if (v12)
    operator delete(v12);
  MEMORY[0x1A1B0A898](screenGazeState, 0x1080C40B4A5DF6CLL);
LABEL_16:
  v13.receiver = self;
  v13.super_class = (Class)VNScreenGazeFaceObjectState;
  -[VNScreenGazeFaceObjectState dealloc](&v13, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_faceObservation, 0);
}

- (void)_replaceFaceObservation:(uint64_t)a3 imageWidth:(uint64_t)a4 imageHeight:(int)a5 frameIndex:
{
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  float v28;
  float v29;
  float v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a2;
  if (x0_0)
  {
    objc_storeStrong((id *)(x0_0 + 8), a2);
    *(_QWORD *)(x0_0 + 16) = a3;
    *(_QWORD *)(x0_0 + 24) = a4;
    *(_DWORD *)(x0_0 + 32) = a5;
    objc_msgSend(*(id *)(x0_0 + 8), "unalignedBoundingBox");
    v10 = cgNormalizedRectToGeometryImageRect(v32, *(_QWORD *)(x0_0 + 16));
    v11 = floorf(v10);
    v13 = floorf(v12);
    *(float *)(x0_0 + 72) = v11;
    *(float *)(x0_0 + 76) = v13;
    *(float *)(x0_0 + 80) = ceilf((float)(v12 + v15) - v13);
    *(float *)(x0_0 + 84) = ceilf((float)(v10 + v14) - v11);
    objc_msgSend(*(id *)(x0_0 + 8), "landmarks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(x0_0 + 8), "boundingBox");
      v17 = cgNormalizedRectToGeometryImageRect(v33, *(_QWORD *)(x0_0 + 16));
      v19 = v18;
      objc_msgSend(*(id *)(x0_0 + 8), "landmarks");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leftPupil");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "normalizedPoints");

      VisionCoreImagePointForNormalizedPoint();
      *(float *)&v22 = v22;
      *(float *)&v23 = v23;
      *(_DWORD *)(x0_0 + 48) = LODWORD(v22);
      *(_DWORD *)(x0_0 + 52) = LODWORD(v23);
      objc_msgSend(*(id *)(x0_0 + 8), "landmarks");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rightPupil");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v25, "normalizedPoints");

      VisionCoreImagePointForNormalizedPoint();
      *(float *)&v26 = v26;
      *(float *)&v27 = v27;
      v28 = *(float *)(x0_0 + 72) - v17;
      v29 = *(float *)(x0_0 + 76) - v19;
      v30 = *(float *)(x0_0 + 52) - v29;
      *(float *)(x0_0 + 48) = *(float *)(x0_0 + 48) - v28;
      *(float *)(x0_0 + 52) = v30;
      *(float *)(x0_0 + 56) = *(float *)&v26 - v28;
      *(float *)(x0_0 + 60) = *(float *)&v27 - v29;
    }
  }

}

@end
