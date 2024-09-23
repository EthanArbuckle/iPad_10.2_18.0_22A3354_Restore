@implementation ARGeoTrackingConsensusAndAverageFilter

- (ARGeoTrackingConsensusAndAverageFilter)initWithENUFromECEF:(uint64_t)a3 maxHistory:(_OWORD *)a4 minInlierScore:(int)a5
{
  ARGeoTrackingConsensusAndAverageFilter *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)ARGeoTrackingConsensusAndAverageFilter;
  v8 = -[ARGeoTrackingConsensusAndAverageFilter init](&v15, sel_init);
  if (v8)
  {
    v9 = operator new();
    *(_BYTE *)(v9 + 128) = 0;
    *(_OWORD *)(v9 + 96) = 0u;
    *(_OWORD *)(v9 + 112) = 0u;
    *(_OWORD *)(v9 + 64) = 0u;
    *(_OWORD *)(v9 + 80) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    v10 = a4[5];
    *(_OWORD *)(v9 + 208) = a4[4];
    *(_OWORD *)(v9 + 224) = v10;
    v11 = a4[7];
    *(_OWORD *)(v9 + 240) = a4[6];
    *(_OWORD *)(v9 + 256) = v11;
    v12 = a4[1];
    *(_OWORD *)(v9 + 144) = *a4;
    *(_OWORD *)(v9 + 160) = v12;
    v13 = a4[3];
    *(_OWORD *)(v9 + 176) = a4[2];
    *(_OWORD *)(v9 + 192) = v13;
    *(_QWORD *)(v9 + 272) = 0;
    *(_QWORD *)(v9 + 280) = 0;
    *(_QWORD *)(v9 + 288) = 0;
    *(double *)(v9 + 296) = a2;
    *(_DWORD *)(v9 + 304) = a5;
    *(_QWORD *)(v9 + 312) = 0;
    v8->_impl = (void *)v9;
  }
  return v8;
}

- (void)dealloc
{
  _QWORD *impl;
  void *v4;
  objc_super v5;

  impl = self->_impl;
  if (impl)
  {
    v4 = (void *)impl[34];
    if (v4)
    {
      impl[35] = v4;
      operator delete(v4);
    }
    MEMORY[0x1B5E2D5B8](impl, 0x1020C40627BD049);
  }
  self->_impl = 0;
  v5.receiver = self;
  v5.super_class = (Class)ARGeoTrackingConsensusAndAverageFilter;
  -[ARGeoTrackingConsensusAndAverageFilter dealloc](&v5, sel_dealloc);
}

- (double)score
{
  return *((double *)self->_impl + 39);
}

- (BOOL)getCurrentENUFromVIO:(double)a3 ENUFromVIO:(id *)a4
{
  unsigned __int8 *impl;
  int v5;

  impl = (unsigned __int8 *)self->_impl;
  v5 = impl[128];
  if (impl[128])
    memmove(a4, impl, 0x80uLL);
  return v5 != 0;
}

- (uint64_t)updateWithVIOPose:(const simd_double4x4 *)a3 VLPose:(const simd_double4x4 *)a4
{
  return ARConsensusAndAverageFilterImpl::Update(*(ARConsensusAndAverageFilterImpl **)(a1 + 8), a3, a4);
}

@end
