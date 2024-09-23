@implementation OutputCustomFrame

void __customVideoCompositor_OutputCustomFrame_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t DerivedStorage;
  uint64_t v5;
  CFTypeID TypeID;
  uint64_t UpTimeNanoseconds;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD, _QWORD, uint64_t, _QWORD);
  const void *v14;
  const void *v15;

  v2 = *(unsigned int *)(a1 + 64);
  v3 = *(void **)(a1 + 40);
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v3)
  {
    v5 = DerivedStorage;
    TypeID = CVPixelBufferGetTypeID();
    if (TypeID == CFGetTypeID(v3)
      && CVPixelBufferGetIOSurface((CVPixelBufferRef)v3)
      && IOSurfaceNeedsBindAccel())
    {
      UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      IOSurfaceBindAccel();
      v8 = FigGetUpTimeNanoseconds();
      v9 = (v8 - UpTimeNanoseconds) / 1000;
      ++*(_DWORD *)(v5 + 416);
      v10 = *(_QWORD *)(v5 + 400);
      *(_QWORD *)(v5 + 408) += v9;
      v11 = *(_QWORD *)(v5 + 392);
      if (v11 >= v9)
        v11 = (v8 - UpTimeNanoseconds) / 1000;
      if (v10 > v9)
        v9 = v10;
      *(_QWORD *)(v5 + 392) = v11;
      *(_QWORD *)(v5 + 400) = v9;
    }
  }
  MEMORY[0x19402EEEC](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 296));
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 48) + 304), *(const void **)(a1 + 56));
  MEMORY[0x19402EF04](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 296));
  FigSemaphoreSignal();
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v12 + 176);
  if (v13)
    v13(*(_QWORD *)(v12 + 184), *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 40));
  v14 = *(const void **)(a1 + 32);
  if (v14)
    CFRelease(v14);
  v15 = *(const void **)(a1 + 40);
  if (v15)
    CFRelease(v15);
}

@end
