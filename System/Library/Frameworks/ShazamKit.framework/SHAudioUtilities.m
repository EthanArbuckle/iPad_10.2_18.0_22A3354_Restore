@implementation SHAudioUtilities

+ (id)bufferHead:(id)a3 duration:(double)a4
{
  uint64_t v4;
  id v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  void *v12;

  v7 = a3;
  objc_msgSend(a1, "durationOfBuffer:", v7);
  if (v8 <= a4)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend(v7, "format");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sampleRate");
    LODWORD(v4) = vcvtad_u64_f64(v10 * a4);

    objc_msgSend(a1, "extractFromBuffer:atPosition:length:", v7, 0, v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

+ (id)bufferTail:(id)a3 duration:(double)a4
{
  uint64_t v4;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  void *v16;

  v7 = a3;
  objc_msgSend(a1, "durationOfBuffer:", v7);
  if (v8 <= a4)
  {
    v15 = v7;
  }
  else
  {
    v9 = v8 - a4;
    objc_msgSend(v7, "format");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sampleRate");
    v12 = (v9 * v11);

    objc_msgSend(v7, "format");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sampleRate");
    LODWORD(v4) = vcvtad_u64_f64(v14 * a4);

    objc_msgSend(a1, "extractFromBuffer:atPosition:length:", v7, v12, v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

+ (double)durationOfBuffer:(id)a3
{
  id v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = a3;
  v4 = (double)objc_msgSend(v3, "frameLength");
  objc_msgSend(v3, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sampleRate");
  v7 = v4 / v6;

  return v7;
}

+ (id)extractFromBuffer:(id)a3 atPosition:(unsigned int)a4 length:(unsigned int)a5
{
  id v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;

  v7 = a3;
  if (objc_msgSend(v7, "frameLength") >= a4)
  {
    v9 = objc_msgSend(v7, "frameLength") - a4;
    if (v9 >= a5)
      v10 = a5;
    else
      v10 = v9;
    v11 = objc_alloc(MEMORY[0x24BDB1838]);
    objc_msgSend(v7, "format");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v11, "initWithPCMFormat:frameCapacity:", v12, v10);

    objc_msgSend(v8, "setFrameLength:", v10);
    if (*(_DWORD *)objc_msgSend(v7, "audioBufferList"))
    {
      v13 = 0;
      v14 = 16;
      do
      {
        objc_msgSend(v8, "format");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_DWORD *)(objc_msgSend(v15, "streamDescription") + 24);

        memcpy(*(void **)(objc_msgSend(v8, "audioBufferList") + v14), (const void *)(*(_QWORD *)(objc_msgSend(v7, "audioBufferList") + v14) + v16 * a4), objc_msgSend(v8, "frameLength") * v16);
        ++v13;
        v14 += 16;
      }
      while (v13 < *(unsigned int *)objc_msgSend(v7, "audioBufferList"));
    }
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

+ (id)splitBuffer:(id)a3 fromStartPosition:(unsigned int)a4 intoDurationsOfSize:(double)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6)
  {
    v10 = objc_msgSend(v8, "frameLength");
    if (v10 >= v6)
      v11 = v6;
    else
      v11 = v10;
    objc_msgSend(a1, "extractFromBuffer:atPosition:length:", v8, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  objc_msgSend(v8, "format");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sampleRate");
  v15 = v14;

  if (objc_msgSend(v8, "frameLength") > v6)
  {
    v16 = (v15 * a5);
    do
    {
      LODWORD(v17) = v6 + v16;
      v18 = objc_msgSend(v8, "frameLength");
      if (v6 + v16 >= v18)
        v17 = v18;
      else
        v17 = v17;
      objc_msgSend(a1, "extractFromBuffer:atPosition:length:", v8, v6, (v17 - v6));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v19);

      v6 = v17;
    }
    while (v17 < objc_msgSend(v8, "frameLength"));
  }

  return v9;
}

+ (id)splitBuffer:(id)a3 atPosition:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (double)objc_msgSend(v6, "frameLength");
  objc_msgSend(v6, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleRate");
  objc_msgSend(a1, "splitBuffer:fromStartPosition:intoDurationsOfSize:", v6, v4, v7 / v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)willAudioFormatCauseBufferMutation:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "commonFormat") != 3 || objc_msgSend(v3, "channelCount") != 1;

  return v4;
}

+ (BOOL)isAudioFormatSupported:(id)a3
{
  id v3;
  BOOL v4;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (*(_DWORD *)(objc_msgSend(v3, "streamDescription") + 8) == 1819304813
    && objc_msgSend(v3, "channelCount") <= 2
    && objc_msgSend(v3, "commonFormat") != 4
    && objc_msgSend(v3, "commonFormat") != 2
    && ((objc_msgSend(v3, "isInterleaved") & 1) != 0 || objc_msgSend(v3, "channelCount") != 2))
  {
    objc_msgSend(v3, "sampleRate");
    v7 = (uint64_t)v6;
    v4 = 1;
    if ((uint64_t)v6 > 44099)
    {
      if (v7 == 44100)
        goto LABEL_6;
      v8 = 48000;
    }
    else
    {
      if (v7 == 16000)
        goto LABEL_6;
      v8 = 32000;
    }
    if (v7 == v8)
      goto LABEL_6;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

+ (id)audioBufferFromData:(void *)a3 byteSize:(unint64_t)a4 inFormat:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;

  v7 = a5;
  v8 = a4 / *(unsigned int *)(objc_msgSend(v7, "streamDescription") + 24);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v7, v8);

  objc_msgSend(v9, "setFrameLength:", v8);
  memcpy(*(void **)(objc_msgSend(v9, "audioBufferList") + 16), a3, a4);
  return v9;
}

+ (id)appendBuffer:(id)a3 toBuffer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  int v26;
  void *v27;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_DWORD *)(objc_msgSend(v7, "streamDescription") + 8);
  objc_msgSend(v5, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_DWORD *)(objc_msgSend(v9, "streamDescription") + 8);

  if (v8 == v10)
  {
    v11 = objc_msgSend(v6, "frameLength");
    v12 = objc_msgSend(v5, "frameLength") + v11;
    if (v12 <= objc_msgSend(v6, "frameCapacity"))
    {
      v15 = v6;
      if (*(_DWORD *)objc_msgSend(v15, "audioBufferList"))
      {
        v19 = 0;
        v20 = 16;
        do
        {
          v21 = objc_msgSend(v15, "frameLength");
          objc_msgSend(v5, "format");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (*(_DWORD *)(objc_msgSend(v22, "streamDescription") + 24) * v21);

          v24 = (void *)(*(_QWORD *)(objc_msgSend(v15, "audioBufferList") + v20) + v23);
          v25 = *(const void **)(objc_msgSend(v5, "audioBufferList") + v20);
          v26 = objc_msgSend(v5, "frameLength");
          objc_msgSend(v5, "format");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          memcpy(v24, v25, (*(_DWORD *)(objc_msgSend(v27, "streamDescription") + 24) * v26));

          ++v19;
          v20 += 16;
        }
        while (v19 < *(unsigned int *)objc_msgSend(v15, "audioBufferList"));
      }
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x24BDB1838]);
      objc_msgSend(v6, "format");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "initWithPCMFormat:frameCapacity:", v14, v12);

      if (*(_DWORD *)objc_msgSend(v6, "audioBufferList"))
      {
        v16 = 0;
        v17 = 0;
        do
        {
          objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", *(_QWORD *)(objc_msgSend(v6, "audioBufferList") + v16 + 16), *(unsigned int *)(objc_msgSend(v6, "audioBufferList") + v16 + 12));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "appendBytes:length:", *(_QWORD *)(objc_msgSend(v5, "audioBufferList") + v16 + 16), *(unsigned int *)(objc_msgSend(v5, "audioBufferList") + v16 + 12));
          objc_msgSend(v18, "getBytes:length:", *(_QWORD *)(objc_msgSend(v15, "audioBufferList") + v16 + 16), objc_msgSend(v18, "length"));

          ++v17;
          v16 += 16;
        }
        while (v17 < *(unsigned int *)objc_msgSend(v6, "audioBufferList"));
      }
    }
    objc_msgSend(v15, "setFrameLength:", v12);
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

@end
