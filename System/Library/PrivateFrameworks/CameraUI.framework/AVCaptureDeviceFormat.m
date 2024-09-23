@implementation AVCaptureDeviceFormat

void __65__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameRate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "minFrameRate");
  v6 = *(double *)(a1 + 40);
  if (v7 <= v6)
  {
    objc_msgSend(v9, "maxFrameRate");
    if (v6 <= v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __69__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsFrameDuration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  CMTime v8;
  CMTime time2;
  CMTime time1;

  v6 = a2;
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "minFrameDuration");
  else
    memset(&time1, 0, sizeof(time1));
  time2 = *(CMTime *)(a1 + 40);
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    if (v7)
      objc_msgSend(v7, "maxFrameDuration");
    else
      memset(&v8, 0, sizeof(v8));
    time2 = *(CMTime *)(a1 + 40);
    if (CMTimeCompare(&time2, &v8) <= 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __77__AVCaptureDeviceFormat_CAMCaptureEngine__cam_supportsPanoramaConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2;
  objc_msgSend(v6, "minFrameRate");
  v8 = v7;
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "minimumFramerate");
    v10 = (double)(int)v18;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v10 = 0.0;
    v19 = 0;
  }
  if (v8 <= v10)
  {
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v11, "maximumFramerate");
      v12 = (double)(int)v15;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v12 = 0.0;
      v16 = 0;
    }
    objc_msgSend(v6, "maxFrameRate", v14, v15, v16, v17, v18, v19);
    if (v13 >= v12)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __63__AVCaptureDeviceFormat_CAMCaptureEngine__cam_maximumFrameRate__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "maxFrameRate");
  if (v3 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v5, "maxFrameRate");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }

}

@end
