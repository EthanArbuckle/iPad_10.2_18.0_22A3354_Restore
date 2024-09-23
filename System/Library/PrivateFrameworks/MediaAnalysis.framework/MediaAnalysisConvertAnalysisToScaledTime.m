@implementation MediaAnalysisConvertAnalysisToScaledTime

void __MediaAnalysisConvertAnalysisToScaledTime_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  Float64 Seconds;
  float v15;
  void *v16;
  Float64 v17;
  float v18;
  id v19;
  CMTime end;
  CMTime start;
  CMTimeRange v22;
  CMTime v23;
  CMTimeRange range;
  CMTime v25;
  CMTime v26;
  CMTime time;
  CMTimeRange v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v19;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        memset(&v28, 0, sizeof(v28));
        if (v11
          && (objc_msgSend(v11, "vcp_timerange"), (v28.start.flags & 1) != 0)
          && (v28.duration.flags & 1) != 0
          && !v28.duration.epoch
          && (v28.duration.value & 0x8000000000000000) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(a1 + 32);
          time = v28.start;
          Seconds = CMTimeGetSeconds(&time);
          *(float *)&Seconds = Seconds;
          objc_msgSend(v13, "scaledTimeForOriginalTime:", Seconds);
          memset(&v26, 0, sizeof(v26));
          CMTimeMakeWithSeconds(&v26, v15, 600);
          v16 = *(void **)(a1 + 32);
          range = v28;
          CMTimeRangeGetEnd(&v25, &range);
          v17 = CMTimeGetSeconds(&v25);
          *(float *)&v17 = v17;
          objc_msgSend(v16, "scaledTimeForOriginalTime:", v17);
          memset(&v23, 0, sizeof(v23));
          CMTimeMakeWithSeconds(&v23, v18, 600);
          start = v26;
          end = v23;
          CMTimeRangeFromTimeToTime(&v22, &start, &end);
          objc_msgSend(v12, "vcp_setTimerange:", &v22);
          objc_msgSend(v6, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
}

@end
