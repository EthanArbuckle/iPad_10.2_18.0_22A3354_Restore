@implementation JFXMediaReaderDepthData

- (JFXMediaReaderDepthData)initWithAVDepthData:(id)a3 timeRange:(id *)a4
{
  id v7;
  JFXMediaReaderDepthData *v8;
  JFXMediaReaderDepthData *v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JFXMediaReaderDepthData;
  v8 = -[JFXMediaReaderDepthData init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avDepthData, a3);
    v10 = *(_OWORD *)&a4->var0.var0;
    v11 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v9->_timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v9->_timeRange.duration.timescale = v11;
    *(_OWORD *)&v9->_timeRange.start.value = v10;
  }

  return v9;
}

- (AVDepthData)avDepthData
{
  return self->_avDepthData;
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDepthData, 0);
}

@end
