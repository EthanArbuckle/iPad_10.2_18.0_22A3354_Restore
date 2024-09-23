@implementation ABPKInput

- (ABPKInput)init
{
  ABPKInput *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPKInput;
  result = -[ABPKInput init](&v3, sel_init);
  if (result)
  {
    result->_isDepthDataValid = 0;
    result->_depthMap = 0;
    result->_depthConfidenceBuffer = 0;
  }
  return result;
}

- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  -[ABPKInput timestamp](self, "timestamp");
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%f.png"), v7, CFSTR("image"), v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  writeImage(-[ABPKInput image](self, "image"), v30);
  getPixelBufferFormatTypeAsString(self->_depthMap);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%f.png"), v7, CFSTR("depth"), v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  saveDepthBufferToFile(-[ABPKInput depthMap](self, "depthMap"), v28, 10000.0);
  getPixelBufferFormatTypeAsString(self->_depthConfidenceBuffer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%f.png"), v7, CFSTR("depth_confidence"), v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  saveDepthBufferToFile(-[ABPKInput depthConfidenceBuffer](self, "depthConfidenceBuffer"), v11, 10000.0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_inputs_%f.plist"), v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v14, "setObject:forKey:", v32, CFSTR("depth_map_type"));
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("depth_confidence_map_type"));
  objc_msgSend(v14, "setObject:forKey:", v32, CFSTR("depth_confidence_map_type"));
  objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("depth_confidence_map_type"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ABPKInput isDepthDataValid](self, "isDepthDataValid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("depth_valid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ABPKInput isVioPoseValid](self, "isVioPoseValid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("vio_pose_valid"));

  -[ABPKInput vioPose](self, "vioPose");
  simdMatrix4x4ToNSMat(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("vio_pose"));

  v22 = (void *)MEMORY[0x24BDD16E0];
  -[ABPKInput timestamp](self, "timestamp");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v23, CFSTR("timestamp"));

  -[ABPKInput cameraParams](self, "cameraParams");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "toDict");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v25, CFSTR("camera_params"));

  objc_msgSend(v14, "writeToFile:atomically:", v13, 0);
  return 0;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

- (__CVBuffer)depthMap
{
  return self->_depthMap;
}

- (void)setDepthMap:(__CVBuffer *)a3
{
  self->_depthMap = a3;
}

- (__CVBuffer)depthConfidenceBuffer
{
  return self->_depthConfidenceBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  self->_depthConfidenceBuffer = a3;
}

- (BOOL)isDepthDataValid
{
  return self->_isDepthDataValid;
}

- (void)setIsDepthDataValid:(BOOL)a3
{
  self->_isDepthDataValid = a3;
}

- (double)vioPose
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 64), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setVioPose:(__n128)a3
{
  _OWORD v5[4];

  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 64), v5, 64, 1, 0);
}

- (BOOL)isVioPoseValid
{
  return self->_isVioPoseValid;
}

- (void)setIsVioPoseValid:(BOOL)a3
{
  self->_isVioPoseValid = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (ABPKCameraParams)cameraParams
{
  return (ABPKCameraParams *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCameraParams:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraParams, 0);
}

@end
