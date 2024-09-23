@implementation ARDepthData

- (ARDepthData)initWithDepthMap:(__CVBuffer *)a3 confidenceMap:(__CVBuffer *)a4
{
  ARDepthData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARDepthData;
  v6 = -[ARDepthData init](&v8, sel_init);
  if (v6)
  {
    v6->_depthMap = CVPixelBufferRetain(a3);
    v6->_confidenceMap = CVPixelBufferRetain(a4);
    v6->_isValid = 1;
  }
  return v6;
}

- (void)setDepthMap:(__CVBuffer *)a3
{
  __CVBuffer *depthMap;

  depthMap = self->_depthMap;
  if (depthMap != a3)
  {
    CVPixelBufferRelease(depthMap);
    self->_depthMap = CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceMap:(__CVBuffer *)a3
{
  __CVBuffer *confidenceMap;

  confidenceMap = self->_confidenceMap;
  if (confidenceMap != a3)
  {
    CVPixelBufferRelease(confidenceMap);
    self->_confidenceMap = CVPixelBufferRetain(a3);
  }
}

- (void)setNormalsBuffer:(__CVBuffer *)a3
{
  __CVBuffer *normalsBuffer;

  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer != a3)
  {
    CVPixelBufferRelease(normalsBuffer);
    self->_normalsBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *confidenceBuffer;

  confidenceBuffer = self->_confidenceBuffer;
  if (confidenceBuffer != a3)
  {
    CVPixelBufferRelease(confidenceBuffer);
    self->_confidenceBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_depthMap);
  CVPixelBufferRelease(self->_confidenceMap);
  CVPixelBufferRelease(self->_confidenceBuffer);
  CVPixelBufferRelease(self->_normalsBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARDepthData;
  -[ARDepthData dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARDepthData)initWithCoder:(id)a3
{
  id v4;
  ARDepthData *v5;
  double v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARDepthData;
  v5 = -[ARDepthData init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      v5->_depthMap = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", CFSTR("depthMap"));
      v5->_confidenceMap = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", CFSTR("confidenceMap"));
      v5->_confidenceBuffer = (__CVBuffer *)objc_msgSend(v7, "ar_decodePixelBufferForKey:", CFSTR("confidenceBuffer"));
      v8 = objc_msgSend(v7, "ar_decodePixelBufferForKey:", CFSTR("normalsBuffer"));

      v5->_normalsBuffer = (__CVBuffer *)v8;
    }
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", CFSTR("cameraIntrinsics"));
    *(_DWORD *)&v5->_anon_50[8] = v9;
    *(_DWORD *)&v5->_anon_50[24] = v10;
    *(_QWORD *)v5->_anon_50 = v11;
    *(_QWORD *)&v5->_anon_50[16] = v12;
    *(_DWORD *)&v5->_anon_50[40] = v13;
    *(_QWORD *)&v5->_anon_50[32] = v14;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("extrinsicsToAppNode"));
    *(_OWORD *)v5->_anon_80 = v15;
    *(_OWORD *)&v5->_anon_80[16] = v16;
    *(_OWORD *)&v5->_anon_80[32] = v17;
    *(_OWORD *)&v5->_anon_80[48] = v18;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("deviceTransform"));
    *(_OWORD *)&v5[1].super.isa = v19;
    *(_OWORD *)&v5[1]._depthMap = v20;
    *(_OWORD *)&v5[1]._normalsBuffer = v21;
    *(_OWORD *)&v5[1]._timestamp = v22;
    v5->_isValid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isValid"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  __CVBuffer *depthMap;
  id v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("timestamp"), self->_timestamp);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    depthMap = self->_depthMap;
    v5 = v6;
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", depthMap, CFSTR("depthMap"));
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_confidenceMap, CFSTR("confidenceMap"));
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_confidenceBuffer, CFSTR("confidenceBuffer"));
    objc_msgSend(v5, "ar_encodePixelBuffer:forKey:", self->_normalsBuffer, CFSTR("normalsBuffer"));

  }
  objc_msgSend(v6, "ar_encodeMatrix3x3:forKey:", CFSTR("cameraIntrinsics"), *(double *)self->_anon_50, *(double *)&self->_anon_50[16], *(double *)&self->_anon_50[32]);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", CFSTR("extrinsicsToAppNode"), *(double *)self->_anon_80, *(double *)&self->_anon_80[16], *(double *)&self->_anon_80[32], *(double *)&self->_anon_80[48]);
  objc_msgSend(v6, "ar_encodeMatrix4x4:forKey:", CFSTR("deviceTransform"), *(double *)&self[1].super.isa, *(double *)&self[1]._depthMap, *(double *)&self[1]._normalsBuffer, self[1]._timestamp);
  objc_msgSend(v6, "encodeBool:forKey:", self->_isValid, CFSTR("isValid"));

}

- (CVPixelBufferRef)depthMap
{
  return self->_depthMap;
}

- (CVPixelBufferRef)confidenceMap
{
  return self->_confidenceMap;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (__CVBuffer)confidenceBuffer
{
  return self->_confidenceBuffer;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[5];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

- (__n128)extrinsicsToAppNode
{
  return a1[8];
}

- (__n128)setExtrinsicsToAppNode:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

- (__n128)deviceTransform
{
  return a1[12];
}

- (__n128)setDeviceTransform:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (ADCameraCalibration)adCameraCalibration
{
  return self->_adCameraCalibration;
}

- (void)setAdCameraCalibration:(id)a3
{
  objc_storeStrong((id *)&self->_adCameraCalibration, a3);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (int64_t)depthSensorsState
{
  return self->_depthSensorsState;
}

- (void)setDepthSensorsState:(int64_t)a3
{
  self->_depthSensorsState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adCameraCalibration, 0);
}

@end
