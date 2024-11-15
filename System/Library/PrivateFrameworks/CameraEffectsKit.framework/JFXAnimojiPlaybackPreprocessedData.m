@implementation JFXAnimojiPlaybackPreprocessedData

- (id)initForRenderTime:(id *)a3 usingDataFromMediaTimeRange:(id *)a4 arFrame:(id)a5 avDepthData:(id)a6 animojiBlendShapes:(id)a7
{
  id v13;
  id v14;
  id v15;
  JFXAnimojiPlaybackPreprocessedData *v16;
  JFXAnimojiPlaybackPreprocessedData *v17;
  __int128 v18;
  uint64_t v19;
  NSDictionary *animojiBlendShapes;
  __int128 v21;
  __int128 v22;
  objc_super v24;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)JFXAnimojiPlaybackPreprocessedData;
  v16 = -[JFXAnimojiPlaybackPreprocessedData init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    v18 = *(_OWORD *)&a3->var0;
    v16->_time.epoch = a3->var3;
    *(_OWORD *)&v16->_time.value = v18;
    objc_storeStrong((id *)&v16->_arFrame, a5);
    objc_storeStrong((id *)&v17->_avDepthData, a6);
    v19 = objc_msgSend(v15, "copy");
    animojiBlendShapes = v17->_animojiBlendShapes;
    v17->_animojiBlendShapes = (NSDictionary *)v19;

    v21 = *(_OWORD *)&a4->var0.var0;
    v22 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v17->_mediaTimeRangeForData.duration.timescale = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v17->_mediaTimeRangeForData.start.epoch = v22;
    *(_OWORD *)&v17->_mediaTimeRangeForData.start.value = v21;
  }

  return v17;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (AVDepthData)avDepthData
{
  return self->_avDepthData;
}

- (NSDictionary)animojiBlendShapes
{
  return self->_animojiBlendShapes;
}

- ($70930193D4F448A53BB9343C0237EB5F)mediaTimeRangeForData
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiBlendShapes, 0);
  objc_storeStrong((id *)&self->_avDepthData, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
}

@end
