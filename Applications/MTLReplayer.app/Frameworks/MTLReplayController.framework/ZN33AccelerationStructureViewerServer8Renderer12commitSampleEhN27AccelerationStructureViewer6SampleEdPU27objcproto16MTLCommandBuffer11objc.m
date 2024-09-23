@implementation ZN33AccelerationStructureViewerServer8Renderer12commitSampleEhN27AccelerationStructureViewer6SampleEdPU27objcproto16MTLCommandBuffer11objc

_QWORD *___ZN33AccelerationStructureViewerServer8Renderer12commitSampleEhN27AccelerationStructureViewer6SampleEdPU27objcproto16MTLCommandBuffer11objc_objectPU32objcproto21OS_dispatch_semaphore8NSObject_block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[72];
  _BYTE v7[24];
  _BYTE *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v2 = *(_QWORD *)(a1 + 696);
  v3 = *(_BYTE *)(a1 + 712);
  AccelerationStructureViewer::Sample::Sample(v6, a1 + 32);
  AccelerationStructureViewerServer::Renderer::completeSample(v2, v3, (uint64_t)v6, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 688) + 8) + 40), *(double *)(a1 + 704));

  result = v8;
  if (v8 == v7)
  {
    v5 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

@end
