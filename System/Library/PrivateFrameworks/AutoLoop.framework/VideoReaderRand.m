@implementation VideoReaderRand

- (id)initFromFile:(id)a3 frameTimes:(const void *)a4
{
  id v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  char *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VideoReaderRand;
  v7 = -[VideoReader initFromFile:](&v12, sel_initFromFile_, v6);
  v8 = v7;
  if (v7)
  {
    v9 = v7 + 320;
    if (v7 + 320 != a4)
      sub_1D4C6454C(v7 + 320, *(char **)a4, *((_QWORD *)a4 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
    *((_DWORD *)v8 + 87) = -1431655765 * ((v9[1] - *v9) >> 3);
    *((_DWORD *)v8 + 86) = -1;
    objc_msgSend(v8, "setReadAheadEnable:", 0);
    v10 = v8;
  }

  return v8;
}

- (id)initFromFile:(id)a3 withParams:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = -[VideoReaderRand initFromFile:frameTimes:](self, "initFromFile:frameTimes:", v6, objc_msgSend(v7, "frameTimes"));

  return v8;
}

- (int)reset
{
  objc_super v3;

  self->_lastFrameDex = -1;
  v3.receiver = self;
  v3.super_class = (Class)VideoReaderRand;
  return -[VideoReader reset](&v3, sel_reset);
}

- (int)indexForTime:(id *)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  CMTimeEpoch v6;
  unsigned int lastFrameDex;
  char *v8;
  CMTimeEpoch v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  CMTimeEpoch v14;
  uint64_t v15;
  char *v16;
  CMTimeEpoch v17;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a3;
  begin = self->_frameTimes.__begin_;
  v6 = *((_QWORD *)begin + 2);
  *(_OWORD *)&time2.value = *(_OWORD *)begin;
  time2.epoch = v6;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    LODWORD(v11) = -1;
  }
  else
  {
    lastFrameDex = self->_lastFrameDex;
    if ((lastFrameDex & 0x80000000) != 0
      || (v24 = (CMTime)*a3,
          v8 = (char *)self->_frameTimes.__begin_ + 24 * lastFrameDex,
          v9 = *((_QWORD *)v8 + 2),
          *(_OWORD *)&v23.value = *(_OWORD *)v8,
          v23.epoch = v9,
          CMTimeCompare(&v24, &v23) < 1))
    {
      v10 = 0;
    }
    else
    {
      v10 = self->_lastFrameDex;
    }
    LODWORD(v11) = self->_numFrames - 1;
    if (v10 < (int)v11)
    {
      v12 = v10;
      do
      {
        v13 = (char *)self->_frameTimes.__begin_ + 24 * v12;
        v14 = *((_QWORD *)v13 + 2);
        *(_OWORD *)&v22.value = *(_OWORD *)v13;
        v22.epoch = v14;
        v21 = (CMTime)*a3;
        if (CMTimeCompare(&v22, &v21) < 1)
        {
          v20 = (CMTime)*a3;
          v15 = v12 + 1;
          v16 = (char *)self->_frameTimes.__begin_ + 24 * v12 + 24;
          v17 = *((_QWORD *)v16 + 2);
          *(_OWORD *)&v19.value = *(_OWORD *)v16;
          v19.epoch = v17;
          if (CMTimeCompare(&v20, &v19) < 0)
          {
            LODWORD(v11) = v12;
            return v11;
          }
        }
        else
        {
          v15 = v12 + 1;
        }
        v11 = self->_numFrames - 1;
        v12 = v15;
      }
      while (v15 < v11);
    }
  }
  return v11;
}

- (int)getFrameAtTime:(id *)a3 frame:(opaqueCMSampleBuffer *)a4 rawFrameIndex:(unsigned int *)a5
{
  unsigned int v8;
  signed int v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  CMTime *v11;
  unsigned int lastFrameDex;
  __int128 v13;
  char *v14;
  __int128 v15;
  int v16;
  int v17;
  int result;
  int v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime time2;
  CMTime time1;
  CMTime v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26;

  v26 = *a3;
  v8 = -[VideoReaderRand indexForTime:](self, "indexForTime:", &v26);
  if ((v8 & 0x80000000) != 0)
    return 3;
  v9 = v8;
  begin = self->_frameTimes.__begin_;
  v11 = (CMTime *)((char *)begin + 24 * v8);
  v25 = *v11;
  lastFrameDex = self->_lastFrameDex;
  if ((lastFrameDex & 0x80000000) != 0)
    goto LABEL_7;
  v13 = *(_OWORD *)&v11->value;
  time1.epoch = v11->epoch;
  *(_OWORD *)&time1.value = v13;
  v14 = (char *)begin + 24 * lastFrameDex;
  v15 = *(_OWORD *)v14;
  time2.epoch = *((_QWORD *)v14 + 2);
  *(_OWORD *)&time2.value = v15;
  if (CMTimeCompare(&time1, &time2) < 1 || (v16 = self->_lastFrameDex, v9 >= v16 + 5))
  {
    -[VideoReaderRand reset](self, "reset");
    v16 = self->_lastFrameDex;
  }
  if (v16 < 0)
  {
LABEL_7:
    v22 = v25;
    -[VideoReader setReadStartT:](self, "setReadStartT:", &v22);
    self->_lastFrameDex = v9 - 1;
  }
  v17 = 7;
  while (1)
  {
    result = -[VideoReader getFrameAsSampleBuf:](self, "getFrameAsSampleBuf:", a4);
    if (result)
      break;
    -[VideoReader lastPresentationTime](self, "lastPresentationTime");
    v20 = v25;
    result = CMTimeCompare(&v21, &v20);
    if (result >= 1)
    {
      NSLog(CFSTR("VideoReaderRand: read past target time"));
      return 3;
    }
    v19 = self->_lastFrameDex + 1;
    self->_lastFrameDex = v19;
    if (!result)
    {
      *a5 = v19;
      return result;
    }
    if (!--v17)
    {
      NSLog(CFSTR("VideoReaderRand: too many frames skipped (%d)"), 7);
      return 3;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  vector<CMTime, std::allocator<CMTime>> *p_frameTimes;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  p_frameTimes = &self->_frameTimes;
  begin = self->_frameTimes.__begin_;
  if (begin)
  {
    p_frameTimes->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 40) = 0;
  return self;
}

@end
