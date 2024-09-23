@implementation BWDroppedSample

- (NSString)reason
{
  return self->_reason;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDroppedSample;
  -[BWDroppedSample dealloc](&v3, sel_dealloc);
}

+ (id)newDroppedSampleWithReason:(id)a3 pts:(id *)a4
{
  BWDroppedSample *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v6 = [BWDroppedSample alloc];
  v8 = *a4;
  return -[BWDroppedSample _initDroppedSampleWithReason:pts:backPressureSemaphoresToIgnore:](v6, a3, (uint64_t)&v8, 0);
}

- (_QWORD)_initDroppedSampleWithReason:(uint64_t)a3 pts:(uint64_t)a4 backPressureSemaphoresToIgnore:
{
  _QWORD *v7;
  uint64_t v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)BWDroppedSample;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  if (v7)
  {
    v7[1] = objc_msgSend(a2, "copy");
    v8 = *(_QWORD *)(a3 + 16);
    *((_OWORD *)v7 + 1) = *(_OWORD *)a3;
    v7[4] = v8;
    v7[5] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", a4);
  }
  return v7;
}

+ (id)newDroppedSampleFromDroppedSample:(id)a3 backPressureSemaphoresToIgnore:(id)a4
{
  void *v5;
  uint64_t v6;
  BWDroppedSample *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a4);
  v6 = (uint64_t)v5;
  if (*((_QWORD *)a3 + 5))
    objc_msgSend(v5, "addObjectsFromArray:");
  v7 = [BWDroppedSample alloc];
  v8 = (void *)*((_QWORD *)a3 + 1);
  v10 = *((_OWORD *)a3 + 1);
  v11 = *((_QWORD *)a3 + 4);
  return -[BWDroppedSample _initDroppedSampleWithReason:pts:backPressureSemaphoresToIgnore:](v7, v8, (uint64_t)&v10, v6);
}

- (NSArray)backPressureSemaphoresToIgnore
{
  return self->_backPressureSemaphoresToIgnore;
}

@end
