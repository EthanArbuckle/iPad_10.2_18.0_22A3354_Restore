@implementation AVTimecode

- (AVTimecode)initWithTimecodeString:(id)a3
{
  id v4;
  AVTimecode *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AVTimecode;
  v5 = -[AVTimecode init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v7, "count") == 4;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v8 &= -[AVTimecode stringIsValidNumericValue:](v5, "stringIsValidNumericValue:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13++), (_QWORD)v19);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    if (v8)
    {
      objc_msgSend(v9, "objectAtIndex:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_timecodeStruct.frames = objc_msgSend(v14, "intValue");

      objc_msgSend(v9, "objectAtIndex:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_timecodeStruct.seconds = objc_msgSend(v15, "intValue");

      objc_msgSend(v9, "objectAtIndex:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_timecodeStruct.minutes = objc_msgSend(v16, "intValue");

      objc_msgSend(v9, "objectAtIndex:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_timecodeStruct.hours = objc_msgSend(v17, "intValue");
    }
    else
    {
      v17 = v5;
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)stringIsValidNumericValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  objc_msgSend(v3, "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (CVSMPTETime)timecodeStruct
{
  *retstr = self[1];
  return self;
}

- (void)setTimecodeStruct:(CVSMPTETime *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->subframes;
  *(_QWORD *)&self->_timecodeStruct.hours = *(_QWORD *)&a3->hours;
  *(_OWORD *)&self->_timecodeStruct.subframes = v3;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(int64_t)a3
{
  self->_frameNumber = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = v3;
}

- (unsigned)tc_flags
{
  return self->_tc_flags;
}

- (void)setTc_flags:(unsigned int)a3
{
  self->_tc_flags = a3;
}

@end
