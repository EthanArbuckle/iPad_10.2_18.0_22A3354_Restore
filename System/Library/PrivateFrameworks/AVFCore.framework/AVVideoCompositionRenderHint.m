@implementation AVVideoCompositionRenderHint

- (AVVideoCompositionRenderHint)initWithStartCompositionTime:(id *)a3 endCompositionTime:(id *)a4 subsequentStartCompositionTime:(id *)a5 subsequentEndCompositionTime:(id *)a6
{
  AVVideoCompositionRenderHint *v10;
  AVVideoCompositionRenderHintInternal *v11;
  int64_t var3;
  AVVideoCompositionRenderHintInternal *internal;
  __int128 v14;
  AVVideoCompositionRenderHintInternal *v15;
  __int128 v16;
  AVVideoCompositionRenderHintInternal *v17;
  __int128 v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AVVideoCompositionRenderHint;
  v10 = -[AVVideoCompositionRenderHint init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(AVVideoCompositionRenderHintInternal);
    v10->_internal = v11;
    var3 = a3->var3;
    *(_OWORD *)&v11->_startCompositionTime.value = *(_OWORD *)&a3->var0;
    v11->_startCompositionTime.epoch = var3;
    internal = v10->_internal;
    v14 = *(_OWORD *)&a4->var0;
    internal->_endCompositionTime.epoch = a4->var3;
    *(_OWORD *)&internal->_endCompositionTime.value = v14;
    v15 = v10->_internal;
    v16 = *(_OWORD *)&a5->var0;
    v15->_subsequentStartCompositionTime.epoch = a5->var3;
    *(_OWORD *)&v15->_subsequentStartCompositionTime.value = v16;
    v17 = v10->_internal;
    v18 = *(_OWORD *)&a6->var0;
    v17->_subsequentEndCompositionTime.epoch = a6->var3;
    *(_OWORD *)&v17->_subsequentEndCompositionTime.value = v18;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVVideoCompositionRenderHint;
  -[AVVideoCompositionRenderHint dealloc](&v3, sel_dealloc);
}

- (CMTime)startCompositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale + 8);
  return self;
}

- (CMTime)endCompositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)subsequentStartCompositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->var1 + 56);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)subsequentEndCompositionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->var1 + 80);
  return self;
}

@end
