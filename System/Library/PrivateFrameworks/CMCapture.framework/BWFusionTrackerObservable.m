@implementation BWFusionTrackerObservable

- (char)initWithKind:(__int128 *)a3 box:(uint64_t)a4 confidence:(void *)a5 timestamp:(double)a6 identifier:(double)a7 metadata:(double)a8
{
  char *v19;
  char *v20;
  __int128 v21;
  objc_super v23;

  if (!a1)
    return 0;
  v23.receiver = a1;
  v23.super_class = (Class)BWFusionTrackerObservable;
  v19 = (char *)objc_msgSendSuper2(&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    *((_QWORD *)v19 + 5) = a2;
    *((double *)v19 + 1) = a6;
    *((double *)v19 + 2) = a7;
    *((double *)v19 + 3) = a8;
    *((double *)v19 + 4) = a9;
    *((float *)v19 + 12) = a10;
    *((_QWORD *)v19 + 14) = a4;
    v21 = *a3;
    *(_QWORD *)(v19 + 68) = *((_QWORD *)a3 + 2);
    *(_OWORD *)(v19 + 52) = v21;
    *((_QWORD *)v19 + 13) = a5;
  }
  return v20;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWFusionTrackerObservable;
  -[BWFusionTrackerObservable dealloc](&v3, sel_dealloc);
}

- (CGRect)box
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_box.origin.x;
  y = self->_box.origin.y;
  width = self->_box.size.width;
  height = self->_box.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)objectKind
{
  return self->_objectKind;
}

- (float)confidence
{
  return self->_confidence;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastDetectionTimestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (id)metadata
{
  return self->_metadata;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end
