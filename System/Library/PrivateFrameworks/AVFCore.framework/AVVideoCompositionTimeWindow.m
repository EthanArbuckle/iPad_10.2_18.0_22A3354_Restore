@implementation AVVideoCompositionTimeWindow

- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4 durationBeforeWhenSeeking:(id *)a5 durationAfterWhenSeeking:(id *)a6
{
  AVVideoCompositionTimeWindow *v11;
  AVVideoCompositionTimeWindow *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  CMTimeEpoch v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  AVVideoCompositionTimeWindow *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  AVVideoCompositionTimeWindow *v31;
  AVVideoCompositionTimeWindow *v32;
  AVVideoCompositionTimeWindow *v33;
  AVVideoCompositionTimeWindow *v34;
  AVVideoCompositionTimeWindow *v35;
  AVVideoCompositionTimeWindow *v36;
  AVVideoCompositionTimeWindow *v37;
  void *v38;
  __int128 v39;
  CMTime time2;
  CMTime time1;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)AVVideoCompositionTimeWindow;
  v11 = -[AVVideoCompositionTimeWindow init](&v42, sel_init);
  v12 = v11;
  if (v11)
  {
    v13 = (__int128 *)MEMORY[0x1E0CA2E68];
    if ((a3->var2 & 1) == 0)
    {
      *(_OWORD *)&a3->var0 = *MEMORY[0x1E0CA2E68];
      a3->var3 = *((_QWORD *)v13 + 2);
    }
    if ((a4->var2 & 1) == 0)
    {
      *(_OWORD *)&a4->var0 = *v13;
      a4->var3 = *((_QWORD *)v13 + 2);
    }
    if ((a5->var2 & 1) == 0)
    {
      v14 = *(_OWORD *)&a3->var0;
      a5->var3 = a3->var3;
      *(_OWORD *)&a5->var0 = v14;
    }
    if ((a6->var2 & 1) == 0)
    {
      v15 = *(_OWORD *)&a4->var0;
      a6->var3 = a4->var3;
      *(_OWORD *)&a6->var0 = v15;
    }
    if ((a3->var2 & 0x1D) == 1)
    {
      if ((a4->var2 & 0x1D) == 1)
      {
        if ((a5->var2 & 0x1D) == 1)
        {
          if ((a6->var2 & 0x1D) == 1)
          {
            time1 = (CMTime)*a3;
            v39 = *v13;
            *(_OWORD *)&time2.value = *v13;
            v16 = *((_QWORD *)v13 + 2);
            time2.epoch = v16;
            if (CMTimeCompare(&time1, &time2) < 0)
            {
              v34 = v12;
              v28 = (void *)MEMORY[0x1E0C99DA0];
              v29 = *MEMORY[0x1E0C99778];
              v30 = CFSTR("durationBefore should not be negative");
            }
            else
            {
              time1 = (CMTime)*a4;
              *(_OWORD *)&time2.value = v39;
              time2.epoch = v16;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                v35 = v12;
                v28 = (void *)MEMORY[0x1E0C99DA0];
                v29 = *MEMORY[0x1E0C99778];
                v30 = CFSTR("durationAfter should not be negative");
              }
              else
              {
                time1 = (CMTime)*a5;
                *(_OWORD *)&time2.value = v39;
                time2.epoch = v16;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v36 = v12;
                  v28 = (void *)MEMORY[0x1E0C99DA0];
                  v29 = *MEMORY[0x1E0C99778];
                  v30 = CFSTR("durationBeforeWhenSeeking should not be negative");
                }
                else
                {
                  time1 = (CMTime)*a6;
                  *(_OWORD *)&time2.value = v39;
                  time2.epoch = v16;
                  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                  {
                    v17 = *(_OWORD *)&a3->var0;
                    v12->_durationBefore.epoch = a3->var3;
                    *(_OWORD *)&v12->_durationBefore.value = v17;
                    v18 = *(_OWORD *)&a4->var0;
                    v12->_durationAfter.epoch = a4->var3;
                    *(_OWORD *)&v12->_durationAfter.value = v18;
                    v19 = *(_OWORD *)&a5->var0;
                    v12->_durationBeforeWhenSeeking.epoch = a5->var3;
                    *(_OWORD *)&v12->_durationBeforeWhenSeeking.value = v19;
                    v20 = *(_OWORD *)&a6->var0;
                    v12->_durationAfterWhenSeeking.epoch = a6->var3;
                    *(_OWORD *)&v12->_durationAfterWhenSeeking.value = v20;
                    return v12;
                  }
                  v37 = v12;
                  v28 = (void *)MEMORY[0x1E0C99DA0];
                  v29 = *MEMORY[0x1E0C99778];
                  v30 = CFSTR("durationAfterWhenSeeking should not be negative");
                }
              }
            }
          }
          else
          {
            v33 = v11;
            v28 = (void *)MEMORY[0x1E0C99DA0];
            v29 = *MEMORY[0x1E0C99778];
            v30 = CFSTR("durationAfterWhenSeeking should be numeric");
          }
        }
        else
        {
          v32 = v11;
          v28 = (void *)MEMORY[0x1E0C99DA0];
          v29 = *MEMORY[0x1E0C99778];
          v30 = CFSTR("durationBeforeWhenSeeking should be numeric");
        }
      }
      else
      {
        v31 = v11;
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = CFSTR("durationAfter should be numeric");
      }
    }
    else
    {
      v22 = v11;
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = CFSTR("durationBefore should be numeric");
    }
    v38 = (void *)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v12, a2, (uint64_t)v30, v23, v24, v25, v26, v27, v39), 0);
    objc_exception_throw(v38);
  }
  return v12;
}

- (AVVideoCompositionTimeWindow)initWithDurationBefore:(id *)a3 durationAfter:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  v7 = *a4;
  v6 = *a3;
  v5 = *a4;
  return -[AVVideoCompositionTimeWindow initWithDurationBefore:durationAfter:durationBeforeWhenSeeking:durationAfterWhenSeeking:](self, "initWithDurationBefore:durationAfter:durationBeforeWhenSeeking:durationAfterWhenSeeking:", &v8, &v7, &v6, &v5);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMTime v8;
  CMTime time1;
  CMTime v10;
  CMTime v11;
  CMTime v12[2];
  CMTime v13;
  CMTime v14;
  CMTime v15[2];
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
    return 1;
  v16 = v3;
  v17 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  memset(&v15[1], 0, sizeof(CMTime));
  if (self)
  {
    -[AVVideoCompositionTimeWindow durationBefore](self, "durationBefore");
    memset(v15, 0, 24);
    -[AVVideoCompositionTimeWindow durationAfter](self, "durationAfter");
    memset(&v14, 0, sizeof(v14));
    -[AVVideoCompositionTimeWindow durationBeforeWhenSeeking](self, "durationBeforeWhenSeeking");
    memset(&v13, 0, sizeof(v13));
    -[AVVideoCompositionTimeWindow durationAfterWhenSeeking](self, "durationAfterWhenSeeking");
  }
  else
  {
    memset(v15, 0, 24);
    memset(&v14, 0, sizeof(v14));
    memset(&v13, 0, sizeof(v13));
  }
  memset(&v12[1], 0, sizeof(CMTime));
  if (a3)
  {
    objc_msgSend(a3, "durationBefore");
    memset(v12, 0, 24);
    objc_msgSend(a3, "durationAfter");
    memset(&v11, 0, sizeof(v11));
    objc_msgSend(a3, "durationBeforeWhenSeeking");
    memset(&v10, 0, sizeof(v10));
    objc_msgSend(a3, "durationAfterWhenSeeking");
  }
  else
  {
    memset(v12, 0, 24);
    memset(&v11, 0, sizeof(v11));
    memset(&v10, 0, sizeof(v10));
  }
  time1 = v15[1];
  v8 = v12[1];
  if (CMTimeCompare(&time1, &v8))
    return 0;
  time1 = v15[0];
  v8 = v12[0];
  if (CMTimeCompare(&time1, &v8))
    return 0;
  time1 = v14;
  v8 = v11;
  if (CMTimeCompare(&time1, &v8))
    return 0;
  time1 = v13;
  v8 = v10;
  return !CMTimeCompare(&time1, &v8);
}

- (unint64_t)hash
{
  CMTimeEpoch v3;
  CMTimeEpoch v4;
  CMTimeEpoch v5;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;

  if (self)
  {
    -[AVVideoCompositionTimeWindow durationBefore](self, "durationBefore");
    v3 = CMTimeHash(&v10);
    -[AVVideoCompositionTimeWindow durationAfter](self, "durationAfter");
    v4 = CMTimeHash(&v9);
    -[AVVideoCompositionTimeWindow durationBeforeWhenSeeking](self, "durationBeforeWhenSeeking");
    v5 = CMTimeHash(&v8);
    -[AVVideoCompositionTimeWindow durationAfterWhenSeeking](self, "durationAfterWhenSeeking");
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
    v3 = CMTimeHash(&v10);
    memset(&v9, 0, sizeof(v9));
    v4 = CMTimeHash(&v9);
    memset(&v8, 0, sizeof(v8));
    v5 = CMTimeHash(&v8);
    memset(&v7, 0, sizeof(v7));
  }
  return v3 ^ CMTimeHash(&v7) ^ v5 ^ v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  Float64 Seconds;
  Float64 v7;
  Float64 v8;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  time = (CMTime)self->_durationBefore;
  Seconds = CMTimeGetSeconds(&time);
  time = (CMTime)self->_durationAfter;
  v7 = CMTimeGetSeconds(&time);
  time = (CMTime)self->_durationBeforeWhenSeeking;
  v8 = CMTimeGetSeconds(&time);
  time = (CMTime)self->_durationAfterWhenSeeking;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> [-%1.3f, +%1.3f] (during playing) / [-%1.3f, +%1.3f] (during seeking)"), v5, self, *(_QWORD *)&Seconds, *(_QWORD *)&v7, *(_QWORD *)&v8, CMTimeGetSeconds(&time));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationBeforeWhenSeeking
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAfterWhenSeeking
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

@end
