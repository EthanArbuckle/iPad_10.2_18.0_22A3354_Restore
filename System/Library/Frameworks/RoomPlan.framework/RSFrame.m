@implementation RSFrame

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

- (__CVBuffer)depthBuffer
{
  return (__CVBuffer *)*(id *)self->depthBuffer;
}

- (void)setDepthBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->depthBuffer;
  *(_QWORD *)self->depthBuffer = a3;
  v3 = a3;

}

- (__CVBuffer)depthConfidenceBuffer
{
  return (__CVBuffer *)*(id *)self->depthConfidenceBuffer;
}

- (void)setDepthConfidenceBuffer:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  id v4;

  v4 = *(id *)self->depthConfidenceBuffer;
  *(_QWORD *)self->depthConfidenceBuffer = a3;
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

- (int64_t)vioTrackingState
{
  return *(_QWORD *)self->vioTrackingState;
}

- (void)setVioTrackingState:(int64_t)a3
{
  *(_QWORD *)self->vioTrackingState = a3;
}

- (__n128)referenceOriginTransform
{
  return a1[6];
}

- (__n128)setReferenceOriginTransform:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  result[9] = a5;
  return result;
}

- (RSCamera)sceneCamera
{
  return (RSCamera *)(id)swift_unknownObjectRetain();
}

- (void)setSceneCamera:(id)a3
{
  *(_QWORD *)self->sceneCamera = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

- (int64_t)deviceOrientation
{
  return *(_QWORD *)self->deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  *(_QWORD *)self->deviceOrientation = a3;
}

- (uint64_t)setRawFeaturePoints:(uint64_t)a3
{
  *(_QWORD *)(a1 + 16) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

- (uint64_t)setCamera:(uint64_t)a3
{
  *(_QWORD *)(a1 + 24) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

@end
