@implementation MTLTelemetryDepthStencilState

- (MTLTelemetryDepthStencilState)initWithBaseDepthStencilState:(id)a3 device:(id)a4 descriptor:(id)a5
{
  MTLTelemetryDepthStencilState *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MTLTelemetryDepthStencilState;
  v7 = -[MTLToolsObject initWithBaseObject:parent:](&v25, sel_initWithBaseObject_parent_, a3);
  if (v7 && objc_msgSend(a4, "enableTelemetry"))
  {
    v8 = *((_QWORD *)a4 + 55);
    v9 = objc_msgSend(a5, "depthCompareFunction");
    ++*(_DWORD *)(v8 + 4 * v9 + 4);
    ++**((_DWORD **)a4 + 55);
    if (objc_msgSend(a5, "frontFaceStencil"))
    {
      v10 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "stencilCompareFunction");
      v11 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "stencilFailureOperation");
      v12 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "depthFailureOperation");
      v13 = objc_msgSend((id)objc_msgSend(a5, "frontFaceStencil"), "depthStencilPassOperation");
      v14 = 32 * v10;
      ++*(_DWORD *)(*((_QWORD *)a4 + 56) + v14 + 4 * v11);
      v15 = *((_QWORD *)a4 + 56) + v14 + 4 * v12;
      ++*(_DWORD *)(v15 + 256);
      v16 = *((_QWORD *)a4 + 56) + v14 + 4 * v13;
      ++*(_DWORD *)(v16 + 512);
    }
    if (objc_msgSend(a5, "backFaceStencil"))
    {
      v17 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "stencilCompareFunction");
      v18 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "stencilFailureOperation");
      v19 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "depthFailureOperation");
      v20 = objc_msgSend((id)objc_msgSend(a5, "backFaceStencil"), "depthStencilPassOperation");
      v21 = 32 * v17;
      ++*(_DWORD *)(*((_QWORD *)a4 + 57) + v21 + 4 * v18);
      v22 = *((_QWORD *)a4 + 57) + v21 + 4 * v19;
      ++*(_DWORD *)(v22 + 256);
      v23 = *((_QWORD *)a4 + 57) + v21 + 4 * v20;
      ++*(_DWORD *)(v23 + 512);
    }
  }
  return v7;
}

@end
