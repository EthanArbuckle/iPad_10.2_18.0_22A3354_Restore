@implementation BWIrisDiscontinuity

- (BWIrisDiscontinuity)initWithTime:(id *)a3 duration:(id *)a4 targetFrameDuration:(id *)a5 onlyRetime:(BOOL)a6 generateIFrames:(BOOL)a7 timeSkews:(id)a8
{
  char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  int v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime time;
  CMTime time2;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)BWIrisDiscontinuity;
  v14 = -[BWIrisDiscontinuity init](&v28, sel_init);
  if ((a4->var2 & 1) != 0 && a8 && (a5->var2 & 1) != 0 && objc_msgSend(a8, "count"))
  {
    if (v14)
    {
      v16 = *(_OWORD *)&a3->var0;
      *((_QWORD *)v14 + 3) = a3->var3;
      *(_OWORD *)(v14 + 8) = v16;
      v17 = *(_OWORD *)&a4->var0;
      *((_QWORD *)v14 + 6) = a4->var3;
      *((_OWORD *)v14 + 2) = v17;
      v18 = *(_OWORD *)&a5->var0;
      *(_QWORD *)(v14 + 108) = a5->var3;
      *(_OWORD *)(v14 + 92) = v18;
      v14[116] = a6;
      v14[117] = 0;
      v14[118] = a7;
      *((_QWORD *)v14 + 7) = a8;
      if (!a6)
      {
        time = (CMTime)*a5;
        CMTimeMultiply(&time2, &time, 3);
        time = (CMTime)*a4;
        if (CMTimeCompare(&time, &time2) >= 1)
        {
          CMTimeMake(&v25, 1, 29);
          time = (CMTime)*a5;
          if (CMTimeCompare(&time, &v25) < 0)
          {
            v19 = &unk_1E4A017D8;
            *((_QWORD *)v14 + 8) = v19;
            *((_DWORD *)v14 + 22) = 1;
            if (!v19)
              return (BWIrisDiscontinuity *)v14;
            goto LABEL_22;
          }
          CMTimeMake(&v24, 1, 23);
          time = (CMTime)*a5;
          if (CMTimeCompare(&time, &v24) < 0)
          {
            v19 = &unk_1E4A017F0;
            *((_QWORD *)v14 + 8) = v19;
            v20 = 2;
          }
          else
          {
            CMTimeMake(&v23, 1, 19);
            time = (CMTime)*a5;
            if (CMTimeCompare(&time, &v23) < 0)
            {
              v19 = &unk_1E4A01808;
              *((_QWORD *)v14 + 8) = v19;
              v20 = 3;
            }
            else
            {
              CMTimeMake(&v22, 1, 16);
              time = (CMTime)*a5;
              if (CMTimeCompare(&time, &v22) < 0)
              {
                v19 = &unk_1E4A01820;
                *((_QWORD *)v14 + 8) = v19;
                v20 = 4;
              }
              else
              {
                time = (CMTime)*a5;
                CMTimeMultiply(&v21, &time, 6);
                time = (CMTime)*a4;
                if (CMTimeCompare(&time, &v21) < 1)
                {
                  v19 = &unk_1E4A01850;
                  *((_QWORD *)v14 + 8) = v19;
                  *((_DWORD *)v14 + 22) = 6;
                  if (!v19)
                    return (BWIrisDiscontinuity *)v14;
                  goto LABEL_22;
                }
                v19 = &unk_1E4A01838;
                *((_QWORD *)v14 + 8) = v19;
                v20 = 5;
              }
            }
          }
          *((_DWORD *)v14 + 22) = v20;
          if (v19)
          {
LABEL_22:
            *((_QWORD *)v14 + 9) = objc_msgSend((id)objc_msgSend(v19, "firstObject"), "integerValue") - 1;
            *((_QWORD *)v14 + 10) = objc_msgSend((id)objc_msgSend(*((id *)v14 + 8), "lastObject"), "integerValue") + 2;
          }
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return (BWIrisDiscontinuity *)v14;
}

- (void)resetWithNewTimeSkews:(id)a3
{
  NSArray *v4;

  v4 = (NSArray *)a3;

  self->_timeSkews = v4;
  BYTE5(self->_targetFrameDuration.epoch) = 0;
  HIBYTE(self->_targetFrameDuration.epoch) = 0;
}

- (BOOL)containsVideoBufferTime:(id *)a3
{
  _BOOL4 v5;
  int64_t v6;
  CMTime duration;
  CMTime lhs;
  CMTime v10;

  if (BYTE4(self->_targetFrameDuration.epoch))
  {
    memset(&v10, 0, sizeof(v10));
    lhs = (CMTime)self->_discontinuityTime;
    duration = (CMTime)self->_duration;
    CMTimeAdd(&v10, &lhs, &duration);
    lhs = (CMTime)*a3;
    duration = (CMTime)self->_discontinuityTime;
    if ((CMTimeCompare(&lhs, &duration) & 0x80000000) == 0)
    {
      lhs = (CMTime)*a3;
      duration = v10;
      return CMTimeCompare(&lhs, &duration) >> 31;
    }
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  v10 = *(CMTime *)a3;
  v6 = -[BWIrisDiscontinuity _offsetIndexFromDiscontinuityForTime:]((uint64_t)self, &v10);
  if (v6 < self->_recipeMinDisplacement || v6 > self->_recipeMaxDisplacement)
    goto LABEL_6;
  if (v6 < 1)
  {
    LOBYTE(v5) = 1;
    BYTE5(self->_targetFrameDuration.epoch) = 1;
  }
  else
  {
    LOBYTE(v5) = BYTE5(self->_targetFrameDuration.epoch) != 0;
  }
  return v5;
}

- (uint64_t)_offsetIndexFromDiscontinuityForTime:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMTime *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  id obj;
  uint64_t v16;
  CMTime v17;
  CMTime time2;
  CMTime time1;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(a1 + 56);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v16 = *(_QWORD *)v21;
    v8 = (CMTime *)(a1 + 8);
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      v11 = 0;
      v14 = v7 + v6;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        if (v12)
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "original");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = *v8;
        if (!CMTimeCompare(&time1, &time2))
          v9 = v7 + v11;
        if (v12)
          objc_msgSend(v12, "original");
        else
          memset(&v17, 0, sizeof(v17));
        time2 = *a2;
        if (!CMTimeCompare(&v17, &time2))
          v10 = v7 + v11;
        if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
          return v10 - v9;
        ++v11;
      }
      while (v6 != v11);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = v14;
      if (v6)
        continue;
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (BOOL)shouldKeepBufferWithTime:(id *)a3 forceKeepingBuffer:(BOOL)a4 nextAdjustedTimeInOut:(id *)a5 discontinuityFrameAttributesOut:(id *)a6
{
  _BOOL4 v8;
  uint64_t v11;
  int recipeIdentifier;
  char v13;
  BOOL v14;
  BOOL result;
  int64_t v16;
  BOOL v17;
  CMTimeEpoch var3;
  int v19;
  int64_t recipeMaxDisplacement;
  CMTime v21;
  CMTime lhs;
  CMTime v23;

  v8 = a4;
  v23 = *(CMTime *)a3;
  v11 = -[BWIrisDiscontinuity _offsetIndexFromDiscontinuityForTime:]((uint64_t)self, &v23);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    recipeIdentifier = 0;
    v13 = 0;
    v14 = 0;
    result = 1;
LABEL_3:
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_27;
  }
  if (BYTE4(self->_targetFrameDuration.epoch))
    v17 = 0;
  else
    v17 = !v8;
  if (!v17)
  {
    if ((a5->var2 & 1) != 0)
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&a5->var0;
      var3 = a5->var3;
    }
    else
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
    }
    lhs.epoch = var3;
    v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    recipeIdentifier = 0;
    v13 = 0;
    v14 = 0;
    *(CMTime *)a5 = v23;
    goto LABEL_26;
  }
  v16 = v11;
  v19 = !-[NSArray containsObject:](self->_recipe, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11));
  if (BYTE6(self->_targetFrameDuration.epoch) && !HIBYTE(self->_targetFrameDuration.epoch))
    v19 = 1;
  if (!v16)
  {
    lhs = (CMTime)*a5;
    v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    *(CMTime *)a5 = v23;
  }
  if ((a5->var2 & 1) != 0)
  {
    if ((v19 | !-[NSArray containsObject:](self->_recipe, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16 - 1))) == 1)
    {
      lhs = (CMTime)*a5;
      v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
      CMTimeAdd(&v23, &lhs, &v21);
      *(CMTime *)a5 = v23;
    }
    if (!v19)
    {
      result = 0;
      recipeIdentifier = 0;
      v13 = 0;
      v14 = 0;
      goto LABEL_3;
    }
  }
  else if ((v19 & 1) == 0)
  {
    lhs = (CMTime)*a3;
    v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    result = 0;
    recipeIdentifier = 0;
    v13 = 0;
    v14 = 0;
    *(CMTime *)a5 = v23;
    goto LABEL_3;
  }
  if (BYTE4(self->_targetFrameDuration.epoch))
    goto LABEL_24;
  v13 = BYTE6(self->_targetFrameDuration.epoch);
  if (!v13)
  {
    recipeIdentifier = 0;
    goto LABEL_25;
  }
  if (v16 < self->_recipeMinDisplacement
    || (recipeMaxDisplacement = self->_recipeMaxDisplacement, v16 > recipeMaxDisplacement))
  {
LABEL_24:
    recipeIdentifier = 0;
    v13 = 0;
LABEL_25:
    v14 = 0;
LABEL_26:
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    result = 1;
    goto LABEL_27;
  }
  if (HIBYTE(self->_targetFrameDuration.epoch))
  {
    v13 = v16 == recipeMaxDisplacement;
  }
  else
  {
    v13 = 1;
    HIBYTE(self->_targetFrameDuration.epoch) = 1;
  }
  recipeIdentifier = self->_recipeIdentifier;
  result = 1;
  v14 = 1;
LABEL_27:
  a6->var0 = v14;
  a6->var1 = v13;
  *(_DWORD *)(&a6->var1 + 1) = 0;
  *(_WORD *)(&a6->var1 + 5) = 0;
  a6->var2 = v16;
  a6->var3 = recipeIdentifier;
  *(&a6->var3 + 1) = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
  retstr->var3 = *(_QWORD *)&self[4].var2;
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIrisDiscontinuity;
  -[BWIrisDiscontinuity dealloc](&v3, sel_dealloc);
}

@end
