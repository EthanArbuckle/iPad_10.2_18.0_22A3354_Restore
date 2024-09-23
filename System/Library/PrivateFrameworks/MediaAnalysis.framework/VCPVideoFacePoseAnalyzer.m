@implementation VCPVideoFacePoseAnalyzer

- (VCPVideoFacePoseAnalyzer)init
{

  return 0;
}

- (VCPVideoFacePoseAnalyzer)initWithFocalLengthInPixels:(float)a3
{
  char *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  VCPVideoFacePoseAnalyzer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPVideoFacePoseAnalyzer;
  v4 = -[VCPVideoFacePoseAnalyzer init](&v11, sel_init);
  v5 = v4;
  if (a3 < 1.0 || v4 == 0)
  {
    v8 = 0;
  }
  else
  {
    *((float *)v4 + 8) = a3;
    v7 = MEMORY[0x1E0CA2E28];
    *(_OWORD *)(v4 + 36) = *MEMORY[0x1E0CA2E28];
    *(_QWORD *)(v4 + 52) = *(_QWORD *)(v7 + 16);
    *((_DWORD *)v4 + 15) = 0;
    *((_DWORD *)v4 + 16) = 0;
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (BOOL)updateFocalLengthInPixels:(float)a3
{
  VCPPnPSolver *poseEstimator;
  VCPVideoFacePoseFilter *filter;

  self->_focalLengthInPixels = a3;
  poseEstimator = self->_poseEstimator;
  if (poseEstimator)
    -[VCPPnPSolver updateFocalLengthInPixels:](poseEstimator, "updateFocalLengthInPixels:");
  filter = self->_filter;
  if (filter)
    -[VCPVideoFacePoseFilter reset](filter, "reset");
  return 1;
}

- (int)analyzeFrameForPose:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withTimestamp:(id *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v12;
  int v13;
  VCPCNNFaceLandmarkDetector *v14;
  VCPCNNFaceLandmarkDetector *landmarkDetector;
  VCPPnPSolver *v16;
  double v17;
  VCPPnPSolver *v18;
  VCPPnPSolver *poseEstimator;
  VCPVideoFacePoseFilter *v20;
  VCPVideoFacePoseFilter *filter;
  int v22;
  void *v23;
  uint64_t v24;
  float v25;
  float *v26;
  float *points2D;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  float v36;
  float *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTime time;
  CGAffineTransform v45;
  CMTime rhs;
  CMTime lhs;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = CVPixelBufferGetWidth(a3);
  v13 = CVPixelBufferGetHeight(a3);
  if (!self->_landmarkDetector)
  {
    +[VCPCNNFaceLandmarkDetector detector](VCPCNNFaceLandmarkDetector, "detector");
    v14 = (VCPCNNFaceLandmarkDetector *)objc_claimAutoreleasedReturnValue();
    landmarkDetector = self->_landmarkDetector;
    self->_landmarkDetector = v14;

    if (!self->_landmarkDetector)
      return -18;
  }
  if (HIDWORD(self->_lastTimestamp.epoch) != v12 || self->_width != v13)
  {
    v16 = [VCPPnPSolver alloc];
    *(float *)&v17 = self->_focalLengthInPixels;
    v18 = -[VCPPnPSolver initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:](v16, "initWithFocalLengthInPixels:principalPoint:cameraTowardsPositiveZ:", 0, v17, (float)((float)v12 * 0.5), (float)((float)v13 * 0.5));
    poseEstimator = self->_poseEstimator;
    self->_poseEstimator = v18;

    if (self->_poseEstimator)
    {
      v20 = objc_alloc_init(VCPVideoFacePoseFilter);
      filter = self->_filter;
      self->_filter = v20;

      if (self->_filter)
      {
        HIDWORD(self->_lastTimestamp.epoch) = v12;
        self->_width = v13;
        goto LABEL_8;
      }
    }
    return -18;
  }
LABEL_8:
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (CGRectIsEmpty(v48))
    return 0;
  v45.b = 0.0;
  v45.c = 0.0;
  v45.a = (double)v12;
  v45.d = (double)-v13;
  v45.tx = 0.0;
  v45.ty = (double)v13;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v50 = CGRectApplyAffineTransform(v49, &v45);
  v22 = -[VCPCNNFaceLandmarkDetector analyzeFrame:withFaceBounds:](self->_landmarkDetector, "analyzeFrame:withFaceBounds:", a3, v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
  if (!v22)
  {
    -[VCPCNNFaceLandmarkDetector landmarks](self->_landmarkDetector, "landmarks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count") == 7)
    {
      v24 = 0;
      v25 = (float)v12;
      v26 = &self->_points2D[13];
      points2D = self->_points2D;
      do
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count") != 3
          || (objc_msgSend(v28, "objectAtIndexedSubscript:", 0),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v30 = objc_msgSend(v29, "intValue"),
              v29,
              v30 > 0x34))
        {

          goto LABEL_23;
        }
        objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v33 = v32;

        objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "floatValue");
        v36 = v35 * (float)v13;

        v37 = (float *)((char *)&VCPAnchorFace3DLandmarks + 12 * v30);
        *(points2D - 1) = v33 * v25;
        *points2D = v36;
        *(_QWORD *)v26 = *(_QWORD *)v37;
        v26[2] = v37[2];

        ++v24;
        v26 += 3;
        points2D += 2;
      }
      while (v24 != 7);
      v22 = -[VCPPnPSolver estimateExtrinsicsWith:andPoints3D:andNumPoints:](self->_poseEstimator, "estimateExtrinsicsWith:andPoints3D:andNumPoints:", &self->_height, &self->_points2D[13], 7);
      if (!v22)
      {
        -[VCPPnPSolver pose](self->_poseEstimator, "pose");
        *(_OWORD *)&self->_points3D[20] = v38;
        *(_OWORD *)&self[1]._landmarkDetector = v39;
        *(_OWORD *)&self[1]._filter = v40;
        *(_OWORD *)&self[1]._lastTimestamp.value = v41;
        lhs = (CMTime)*a5;
        rhs = *(CMTime *)(&self->_focalLengthInPixels + 1);
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > 2.0)
          -[VCPVideoFacePoseFilter reset](self->_filter, "reset");
        v22 = -[VCPVideoFacePoseFilter filteringPose:](self->_filter, "filteringPose:", &self->_points3D[20]);
        if (!v22)
        {
          v42 = *(_OWORD *)&a5->var0;
          *(_QWORD *)&self->_lastTimestamp.flags = a5->var3;
          *(_OWORD *)(&self->_focalLengthInPixels + 1) = v42;
        }
      }
    }
    else
    {
LABEL_23:
      v22 = -18;
    }

  }
  return v22;
}

- (double)pose
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 208), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setPose:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 208), v5, 64, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_poseEstimator, 0);
  objc_storeStrong((id *)&self->_landmarkDetector, 0);
}

@end
