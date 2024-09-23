@implementation AXLTHistogramCalculator

+ (id)histogramForAudioPCMBuffer:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "channelCount");

  if (v6 <= 1
    && (v7 = objc_msgSend(v4, "frameLength"),
        objc_msgSend(v4, "format"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "commonFormat"),
        v8,
        v9 == 1))
  {
    objc_msgSend(a1, "histogramForFloat32MonoBuffer:samplesCount:", *(_QWORD *)(objc_msgSend(v4, "audioBufferList") + 16), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)histogramForAudioQueueBuffer:(AudioQueueBuffer *)a3 packetCount:(int64_t)a4 channelsCount:(int64_t)a5 format:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v9 = 0;
  if (a5 <= 1 && a6 == 3)
  {
    objc_msgSend(a1, "histogramForInt16MonoBuffer:samplesCount:", a3->mAudioData, a5 * a4, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

+ (id)histogramForInt16MonoBuffer:(signed __int16 *)a3 samplesCount:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t i;
  float v29;
  double v30;
  void *v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = (void *)objc_opt_new();
    v33 = (void *)objc_opt_new();
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = a4 / 16;
    v11 = a4 / 16;
    do
    {
      if (a4 >= v11)
        v12 = v11;
      else
        v12 = a4;
      v13 = v9 * v10;
      if (++v9 * v10 >= a4)
        v14 = a4;
      else
        v14 = v9 * v10;
      if (v13 < v14)
      {
        v15 = 0;
        v16 = 0;
        v17 = v12 + v7;
        do
        {
          v18 = a3[v13];
          if (v18 < 0)
            v18 = -v18;
          v19 = (unsigned __int16)v18;
          if ((unsigned __int16)v18 < 0xAu)
            LOWORD(v18) = 0;
          if (v19 < 0xA)
            ++v16;
          v15 += (unsigned __int16)v18;
          ++v13;
        }
        while (v13 < v14);
        if (v16 <= v17 >> 1)
        {
          if (v17)
          {
            v20 = (double)(uint64_t)(v15 / v17);
            if (v20 > (double)v8)
              v8 = (uint64_t)v20;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v21);

          }
        }
        else
        {
          objc_msgSend(v33, "addObject:", &unk_24F879098);
        }
      }
      v11 += v10;
      v7 -= v10;
    }
    while (v9 != 16);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v33;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 2000;
      if (v8 > 2000)
        v25 = v8;
      v26 = (double)v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "floatValue");
          v30 = v29 * 0.9 / v26;
          if (v30 < 0.1)
            v30 = 0.1;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmin(v30, 1.0));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v31);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v24);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)histogramForFloat32MonoBuffer:(float *)a3 samplesCount:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  double v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  float v28;
  double v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v8 = 0;
    v9 = 0;
    v10 = a4 / 16;
    v11 = a4 / 16;
    v12 = 0.0;
    do
    {
      if (a4 >= v11)
        v13 = v11;
      else
        v13 = a4;
      v14 = v9 * v10;
      v15 = ++v9 * v10;
      if (v9 * v10 >= a4)
        v15 = a4;
      if (v14 < v15)
      {
        v16 = 0;
        v17 = v13 + v8;
        v18 = 0.0;
        do
        {
          v19 = fabsf(a3[v14]);
          if (v19 < 0.001)
          {
            v19 = 0.0;
            ++v16;
          }
          v18 = v18 + v19;
          ++v14;
        }
        while (v14 < v15);
        if (v16 <= (unint64_t)v17 >> 1)
        {
          if (v17)
          {
            v20 = v18 / (double)v17;
            if (v20 > v12)
              v12 = v20;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v21);

          }
        }
        else
        {
          objc_msgSend(v7, "addObject:", &unk_24F879098, v18);
        }
      }
      v11 += v10;
      v8 -= v10;
    }
    while (v9 != 16);
    if (v12 >= 0.025)
      v22 = v12;
    else
      v22 = 0.025;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v7;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "floatValue", (_QWORD)v32);
          v29 = v28 * 0.9 / v22;
          if (v29 < 0.1)
            v29 = 0.1;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", fmin(v29, 1.0));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v30);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v25);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
