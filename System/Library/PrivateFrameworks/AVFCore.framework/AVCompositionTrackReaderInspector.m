@implementation AVCompositionTrackReaderInspector

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  _QWORD *v6;
  CFTypeRef v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVCompositionTrackReaderInspector;
  v6 = -[AVTrackReaderInspector _initWithAsset:trackID:trackIndex:](&v9, sel__initWithAsset_trackID_trackIndex_, a3, *(_QWORD *)&a4, a5);
  if (v6)
  {
    v7 = (CFTypeRef)objc_msgSend(a3, "_mutableComposition");
    if (v7)
      v7 = CFRetain(v7);
    v6[12] = v7;
  }
  return v6;
}

- (void)dealloc
{
  OpaqueFigMutableComposition *figMutableComposition;
  objc_super v4;

  figMutableComposition = self->_figMutableComposition;
  if (figMutableComposition)
    CFRelease(figMutableComposition);
  v4.receiver = self;
  v4.super_class = (Class)AVCompositionTrackReaderInspector;
  -[AVTrackReaderInspector dealloc](&v4, sel_dealloc);
}

- (BOOL)isPlayable
{
  return 1;
}

- (int)playabilityValidationResult
{
  return 0;
}

- (BOOL)isDecodable
{
  return 1;
}

- (int)decodabilityValidationResult
{
  return 0;
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_figMutableComposition;
}

- (id)segments
{
  OpaqueFigMutableComposition *v3;
  uint64_t v4;
  unsigned int (*v5)(OpaqueFigMutableComposition *, uint64_t, uint64_t *, _QWORD, _QWORD);
  unsigned int *v6;
  uint64_t v7;
  unsigned int (*v8)(OpaqueFigMutableComposition *, uint64_t, _QWORD, uint64_t, unsigned int *);
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  AVCompositionTrackSegment *v19;
  _OWORD v21[3];
  _OWORD v22[3];
  uint64_t v23;

  v3 = -[AVCompositionTrackReaderInspector _mutableComposition](self, "_mutableComposition");
  v4 = -[AVTrackReaderInspector trackID](self, "trackID");
  v23 = 0;
  v5 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, uint64_t *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (!v5 || v5(v3, v4, &v23, 0, 0) || v23 < 1)
  {
    v6 = 0;
LABEL_14:
    free(v6);
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  v6 = (unsigned int *)malloc_type_malloc(108 * v23, 0x1060040CB727B4DuLL);
  if (!v6)
    goto LABEL_14;
  v7 = v23;
  v8 = *(unsigned int (**)(OpaqueFigMutableComposition *, uint64_t, _QWORD, uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (!v8)
    goto LABEL_14;
  if (v8(v3, v4, 0, v7, v6))
    goto LABEL_14;
  v9 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v23);
  if (!v9)
    goto LABEL_14;
  v10 = (void *)v9;
  if (v23 >= 1)
  {
    v11 = 0;
    v12 = (id *)(v6 + 26);
    do
    {
      v13 = *(v12 - 1);
      v14 = *(unsigned int *)v12;
      v15 = *(_OWORD *)(v12 - 13);
      v16 = *(_OWORD *)(v12 - 9);
      v22[1] = *(_OWORD *)(v12 - 11);
      v22[2] = v16;
      v22[0] = v15;
      v17 = *(_OWORD *)(v12 - 7);
      v18 = *(_OWORD *)(v12 - 3);
      v21[1] = *(_OWORD *)(v12 - 5);
      v21[2] = v18;
      v21[0] = v17;
      v19 = +[AVCompositionTrackSegment compositionTrackSegmentWithURL:trackID:sourceTimeRange:targetTimeRange:](AVCompositionTrackSegment, "compositionTrackSegmentWithURL:trackID:sourceTimeRange:targetTimeRange:", v13, v14, v22, v21);
      if (!v19)
        break;
      objc_msgSend(v10, "addObject:", v19);
      ++v11;
      v12 = (id *)((char *)v12 + 108);
    }
    while (v11 < v23);
  }
  free(v6);
  return v10;
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  return 0;
}

@end
