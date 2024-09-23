@implementation FlexMLGainValue

- (FlexMLGainValue)initWithGain:(float)a3 segmentTime:(id *)a4
{
  FlexMLGainValue *result;
  __int128 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FlexMLGainValue;
  result = -[FlexMLGainValue init](&v8, sel_init);
  if (result)
  {
    result->_gain = a3;
    v7 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&result->_segmentTime.flags = a4->var3;
    *(_OWORD *)(&result->_gain + 1) = v7;
  }
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  CMTime v15;
  CMTime time1;
  CMTime v17[2];

  v4 = a3;
  objc_msgSend_segmentTime(self, v5, v6, v7, v8);
  memset(v17, 0, sizeof(v17));
  if (v4)
    objc_msgSend_segmentTime(v4, v9, v10, v11, v12);
  time1 = v17[1];
  v15 = v17[0];
  v13 = CMTimeCompare(&time1, &v15);

  return v13;
}

- (float)gain
{
  return self->_gain;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)segmentTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

@end
