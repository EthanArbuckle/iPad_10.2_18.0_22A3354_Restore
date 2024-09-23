@implementation AVTFaceTrackingInfo

- (const)trackingData
{
  return (const $E6535DB85E8BC2AEB7FF0DAA3D45D990 *)&self->_trackingData;
}

- (double)timestamp
{
  return self->_trackingData.timestamp;
}

- (__n128)rawTransform
{
  return a1[31];
}

- (BOOL)hasFaceTrackingData
{
  return 1;
}

+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5
{
  return (id)objc_msgSend(a1, "trackingInfoWithARFrame:inputOrientation:outputOrientation:constrainHeadPose:", a3, a4, a5, 0);
}

+ (id)trackingInfoWithARFrame:(id)a3 inputOrientation:(int64_t)a4 outputOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6
{
  int64_t v6;

  v6 = 4;
  if (a4 != 3)
    v6 = a4;
  if (a4 == 4)
    v6 = 3;
  return (id)objc_msgSend(a1, "trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:", a3, 2, AVTVideoCaptureOrientationFromInterfaceOrientation_orientations[v6], a5, a6);
}

+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6
{
  return (id)objc_msgSend(a1, "trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:", a3, a4, a5, a6, 0);
}

+ (id)trackingInfoWithARFrame:(id)a3 worldAlignment:(int64_t)a4 captureOrientation:(int64_t)a5 interfaceOrientation:(int64_t)a6 constrainHeadPose:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  void *v12;
  AVTFaceTrackingInfo *v13;
  uint64_t v14;
  AVTFaceTrackingInfo *i;
  void *v16;
  id v17;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v7 = a7;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v11, "anchors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (AVTFaceTrackingInfo *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v19 = v7;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; i = (AVTFaceTrackingInfo *)((char *)i + 1))
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          if ((objc_msgSend(v17, "isTracked") & 1) != 0)
          {
            v13 = objc_alloc_init(AVTFaceTrackingInfo);
            AVTTrackingDataFromARFrame((uint64_t)&v13->_trackingData, v11, a4, v17, a5, a6, v19, 0, 0);

            goto LABEL_13;
          }

        }
      }
      v13 = (AVTFaceTrackingInfo *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_13:

  return v13;
}

+ (id)dataWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _OWORD v17[30];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "anchors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if ((objc_msgSend(v14, "isTracked") & 1) != 0)
          {
            memset(v17, 0, sizeof(v17));
            AVTTrackingDataFromARFrame((uint64_t)v17, v7, objc_msgSend(v7, "worldAlignment"), v14, a4, a5, 1, 0, 0);
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 480);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)trackingInfoWithTrackingData:(id *)a3
{
  AVTFaceTrackingInfo *v4;

  v4 = objc_alloc_init(AVTFaceTrackingInfo);
  memcpy(&v4->_trackingData, a3, 0x1E0uLL);
  return v4;
}

@end
