@implementation OUFrame

- (OUCamera)camera
{
  return (OUCamera *)(id)swift_unknownObjectRetain();
}

- (OUCamera)sceneCamera
{
  return (OUCamera *)(id)swift_unknownObjectRetain();
}

- (double)timestamp
{
  return *(double *)self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(double *)self->timestamp = a3;
}

- (__n128)referenceOriginTransform
{
  return a1[3];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

- (__CVBuffer)colorBuffer
{
  return (__CVBuffer *)*(id *)self->colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->colorBuffer;
  *(_QWORD *)self->colorBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)sceneColorBuffer
{
  return (__CVBuffer *)*(id *)self->sceneColorBuffer;
}

- (void)setSceneColorBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->sceneColorBuffer;
  *(_QWORD *)self->sceneColorBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)sceneDepthBuffer
{
  return (__CVBuffer *)*(id *)self->sceneDepthBuffer;
}

- (void)setSceneDepthBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->sceneDepthBuffer;
  *(_QWORD *)self->sceneDepthBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)sceneDepthConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->sceneDepthConfidenceBuffer;
}

- (void)setSceneDepthConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->sceneDepthConfidenceBuffer;
  *(_QWORD *)self->sceneDepthConfidenceBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)semanticLabelBuffer
{
  return (__CVBuffer *)*(id *)self->semanticLabelBuffer;
}

- (void)setSemanticLabelBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->semanticLabelBuffer;
  *(_QWORD *)self->semanticLabelBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)semanticConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->semanticConfidenceBuffer;
}

- (void)setSemanticConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->semanticConfidenceBuffer;
  *(_QWORD *)self->semanticConfidenceBuffer = a3;
  v3 = a3;

}

- (int64_t)deviceOrientation
{
  return *(_QWORD *)self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  *(_QWORD *)self->deviceOrientation = a3;
}

@end
