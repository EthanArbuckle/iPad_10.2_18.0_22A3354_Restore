@implementation ARFrame(OUFrame)

- (id)sceneCamera
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wideCamera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)sceneColorBuffer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "capturedImage");

  return v2;
}

- (uint64_t)sceneDepthBuffer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "depthBuffer");

  return v2;
}

- (uint64_t)sceneDepthConfidenceBuffer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "depthConfidenceBuffer");

  return v2;
}

- (uint64_t)semanticLabelBuffer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "semanticSegmentationBufferSampledForDepth");

  return v2;
}

- (uint64_t)semanticConfidenceBuffer
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "rawSceneUnderstandingData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "semanticSegmentationConfidenceBufferSampledForDepth");

  return v2;
}

- (uint64_t)vioTrackingState
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "worldTrackingState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "vioTrackingState");

  return v2;
}

@end
