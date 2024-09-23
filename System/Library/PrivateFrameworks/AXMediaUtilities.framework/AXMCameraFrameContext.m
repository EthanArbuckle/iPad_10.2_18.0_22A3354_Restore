@implementation AXMCameraFrameContext

- (AXMCameraFrameContext)initWithVideoFieldOfView:(float)a3 zoomFactor:(float)a4 sourceWidth:(int64_t)a5 sourceHeight:(int64_t)a6 presentationTimestamp:(double)a7 attitude:(id)a8
{
  id v15;
  AXMCameraFrameContext *v16;
  AXMCameraFrameContext *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)AXMCameraFrameContext;
  v16 = -[AXMCameraFrameContext init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_videoFieldOfView = a3;
    v16->_videoZoomFactor = a4;
    v16->_videoSourceWidth = a5;
    v16->_videoSourceHeight = a6;
    v16->_presentationTimestamp = a7;
    objc_storeStrong((id *)&v16->_deviceAttitude, a8);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMCameraFrameContext)initWithCoder:(id)a3
{
  id v4;
  AXMCameraFrameContext *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double v10;
  uint64_t v11;
  CMAttitude *deviceAttitude;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXMCameraFrameContext;
  v5 = -[AXMCameraFrameContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("videoFieldOfView"));
    v5->_videoFieldOfView = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("videoZoomFactor"));
    v5->_videoZoomFactor = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("videoSourceWidth"));
    v5->_videoSourceWidth = (uint64_t)v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("videoSourceHeight"));
    v5->_videoSourceHeight = (uint64_t)v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("presentationTimestamp"));
    v5->_presentationTimestamp = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceAttitude"));
    v11 = objc_claimAutoreleasedReturnValue();
    deviceAttitude = v5->_deviceAttitude;
    v5->_deviceAttitude = (CMAttitude *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXMCameraFrameContext videoFieldOfView](self, "videoFieldOfView");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("videoFieldOfView"));
  -[AXMCameraFrameContext videoZoomFactor](self, "videoZoomFactor");
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("videoZoomFactor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCameraFrameContext videoSourceWidth](self, "videoSourceWidth"), CFSTR("videoSourceWidth"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMCameraFrameContext videoSourceHeight](self, "videoSourceHeight"), CFSTR("videoSourceHeight"));
  -[AXMCameraFrameContext presentationTimestamp](self, "presentationTimestamp");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("presentationTimestamp"));
  -[AXMCameraFrameContext deviceAttitude](self, "deviceAttitude");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceAttitude"));

}

- (CGRect)motionCorrectedNormalizedFrame:(CGRect)a3 targetAttitude:(id)a4 targetZoomFactor:(float)a5 interfaceOrientation:(int64_t)a6 mirrored:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  float v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  v7 = a7;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  if (v15
    && a5 != 0.0
    && (-[AXMCameraFrameContext videoZoomFactor](self, "videoZoomFactor"), v16 != 0.0)
    && -[AXMCameraFrameContext videoSourceHeight](self, "videoSourceHeight")
    && -[AXMCameraFrameContext videoSourceWidth](self, "videoSourceWidth")
    && (-[AXMCameraFrameContext deviceAttitude](self, "deviceAttitude"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    -[AXMCameraFrameContext videoFieldOfView](self, "videoFieldOfView");
    v24 = v23;
    -[AXMCameraFrameContext videoZoomFactor](self, "videoZoomFactor");
    v26 = v24 / v25;
    v27 = v26 * (float)-[AXMCameraFrameContext videoSourceHeight](self, "videoSourceHeight");
    v28 = v27 / (float)-[AXMCameraFrameContext videoSourceWidth](self, "videoSourceWidth");
    -[AXMCameraFrameContext videoFieldOfView](self, "videoFieldOfView");
    v30 = v29 / a5;
    v31 = v30 * (float)-[AXMCameraFrameContext videoSourceHeight](self, "videoSourceHeight");
    v32 = v31 / (float)-[AXMCameraFrameContext videoSourceWidth](self, "videoSourceWidth");
    -[AXMCameraFrameContext deviceAttitude](self, "deviceAttitude");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v34 = v28;
    *(float *)&v35 = v26;
    *(float *)&v36 = v32;
    *(float *)&v37 = v30;
    +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:](AXMGeometryUtilities, "motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:", v33, v15, a6, v7, x, y, width, height, v34, v35, v36, v37);
    x = v38;
    y = v39;
    width = v40;
    height = v41;

  }
  else
  {
    AXMediaLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AXMCameraFrameContext motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:].cold.1(v17);

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (float)videoFieldOfView
{
  return self->_videoFieldOfView;
}

- (float)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (int64_t)videoSourceWidth
{
  return self->_videoSourceWidth;
}

- (int64_t)videoSourceHeight
{
  return self->_videoSourceHeight;
}

- (double)presentationTimestamp
{
  return self->_presentationTimestamp;
}

- (CMAttitude)deviceAttitude
{
  return self->_deviceAttitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAttitude, 0);
}

- (void)motionCorrectedNormalizedFrame:(os_log_t)log targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "AXMCameraFrameContext motionCorrectedNormalizedFrame received invalid input", v1, 2u);
}

@end
