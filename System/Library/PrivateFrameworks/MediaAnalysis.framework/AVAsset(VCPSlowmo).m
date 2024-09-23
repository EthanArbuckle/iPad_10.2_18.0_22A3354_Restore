@implementation AVAsset(VCPSlowmo)

- (void)vcp_scaleSlowmoTimeRange:()VCPSlowmo withTimeMapping:inComposition:
{
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  CMTime duration;
  CMTime start;
  CMTimeRange v14;
  _OWORD v15[3];
  __int128 v16;
  _OWORD v17[2];

  v7 = a4;
  v8 = a5;
  memset(v17, 0, sizeof(v17));
  v9 = *(_OWORD *)(a3 + 16);
  v15[0] = *(_OWORD *)a3;
  v15[1] = v9;
  v15[2] = *(_OWORD *)(a3 + 32);
  v16 = 0u;
  if (v7)
    objc_msgSend(v7, "vcp_convertToOriginalTimerangeFromScaledTimerange:", v15);
  *(_OWORD *)&start.value = v16;
  start.epoch = *(_QWORD *)&v17[0];
  duration = *(CMTime *)(a3 + 24);
  CMTimeRangeMake(&v14, &start, &duration);
  v10 = *(_OWORD *)((char *)v17 + 8);
  v11 = *((_QWORD *)&v17[1] + 1);
  objc_msgSend(v8, "scaleTimeRange:toDuration:", &v14, &v10);

}

- (void)vcp_scaleRampWithIntervals:()VCPSlowmo andRates:inSlowmoTimerange:withTimeMapping:inComposition:
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  float v21;
  Float64 v22;
  __int128 v23;
  CMTimeRange v24;
  CMTime end;
  CMTime v26;
  CMTimeRange v27;
  CMTime duration;
  CMTime start;
  CMTimeRange v30;
  CMTime v31;
  CMTime v32;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v37;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if ((*(_BYTE *)(a5 + 12) & 1) == 0
    || (*(_BYTE *)(a5 + 36) & 1) == 0
    || *(_QWORD *)(a5 + 40)
    || (*(_QWORD *)(a5 + 24) & 0x8000000000000000) != 0
    || (time1 = *(CMTime *)(a5 + 24), time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2)))
  {
    if (objc_msgSend(v13, "count"))
    {
      v16 = 0;
      v32 = *(CMTime *)a5;
      while (v16 < objc_msgSend(v13, "count") - 1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        v19 = v18;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = (float)(v19 / v21);

        memset(&v31, 0, sizeof(v31));
        CMTimeMakeWithSeconds(&v31, v22, 600);
        start = v32;
        duration = v31;
        CMTimeRangeMake(&v30, &start, &duration);
        objc_msgSend(a1, "vcp_scaleSlowmoTimeRange:withTimeMapping:inComposition:", &v30, v14, v15);
        lhs = v32;
        rhs = v31;
        CMTimeAdd(&v37, &lhs, &rhs);
        v32 = v37;
        ++v16;
      }
      v26 = v32;
      v23 = *(_OWORD *)(a5 + 16);
      *(_OWORD *)&v24.start.value = *(_OWORD *)a5;
      *(_OWORD *)&v24.start.epoch = v23;
      *(_OWORD *)&v24.duration.timescale = *(_OWORD *)(a5 + 32);
      CMTimeRangeGetEnd(&end, &v24);
      CMTimeRangeFromTimeToTime(&v27, &v26, &end);
      objc_msgSend(a1, "vcp_scaleSlowmoTimeRange:withTimeMapping:inComposition:", &v27, v14, v15);
    }
  }

}

- (id)vcp_assetWithoutAdjustments:()VCPSlowmo duration:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CMTime *v11;
  double Seconds;
  double v13;
  id v14;
  double v15;
  float v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[3];
  CMTime v40;
  CMTime v41;
  CMTime duration;
  CMTime v43;
  CMTimeRange v44;
  __int128 v45;
  CMTimeEpoch v46;
  CMTime v47;
  CMTimeRange v48;
  CMTime v49;
  CMTime v50;
  CMTimeRange v51;
  CMTimeRange v52;
  CMTime v53;
  CMTimeRange v54;
  CMTime v55;
  CMTime v56;
  CMTime time;
  CMTimeRange range;
  CMTime v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CMTimeRange v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  CMTimeEpoch epoch;
  CMTimeRange v70;
  CMTime end;
  CMTime start;
  CMTimeRange v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D75310]);
    objc_msgSend(v6, "privateFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithURL:", v8);

    v34 = v9;
    if (v9 && (objc_msgSend(v9, "hasSlowMotionAdjustments") & 1) != 0)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75300]), "initWithVideoAsset:videoAdjustments:", 0, v9);
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0C8B268], "composition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v73, 0, sizeof(v73));
        v11 = (CMTime *)MEMORY[0x1E0CA2E68];
        start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        objc_msgSend(a1, "duration");
        CMTimeRangeFromTimeToTime(&v73, &start, &end);
        v70 = v73;
        v68 = *(_OWORD *)&v11->value;
        epoch = v11->epoch;
        if ((objc_msgSend(v10, "insertTimeRange:ofAsset:atTime:error:", &v70, a1, &v68, 0) & 1) != 0)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0D75288]);
          objc_msgSend(v26, "rampDown");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "rampUp");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "slowMotionRate");
          v67 = 0;
          v66 = 0;
          objc_msgSend(v29, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", 1, &v67, &v66);
          v31 = v67;
          v32 = v66;
          objc_msgSend(v9, "slowMotionRate");
          v65 = 0;
          v64 = 0;
          objc_msgSend(v30, "computeRampToTargetRate:forExport:outTimeSteps:outIntermediateRates:", 1, &v65, &v64);
          v27 = v65;
          v28 = v64;
          memset(&v63, 0, sizeof(v63));
          objc_msgSend(v33, "slowMotionRampInRangeForExport:", 1);
          v61 = 0u;
          v62 = 0u;
          v60 = 0u;
          objc_msgSend(v33, "slowMotionRampOutRangeForExport:", 1);
          memset(&v59, 0, sizeof(v59));
          objc_msgSend(v9, "slowMotionTimeRange");
          CMTimeRangeGetEnd(&v59, &range);
          time = v63.start;
          Seconds = CMTimeGetSeconds(&time);
          v56 = v59;
          v13 = CMTimeGetSeconds(&v56);
          memset(&v55, 0, sizeof(v55));
          if (Seconds >= 0.100000001)
          {
            v54 = v63;
            CMTimeRangeGetEnd(&v55, &v54);
          }
          else
          {
            v55 = *v11;
          }
          v15 = a2 - v13;
          memset(&v53, 0, sizeof(v53));
          if (v15 >= 0.100000001)
          {
            *(_OWORD *)&v53.value = v60;
            v53.epoch = v61;
          }
          else
          {
            v52 = v73;
            CMTimeRangeGetEnd(&v53, &v52);
          }
          memset(&v51, 0, sizeof(v51));
          v50 = v55;
          v49 = v53;
          CMTimeRangeFromTimeToTime(&v51, &v50, &v49);
          if (v15 >= 0.100000001)
          {
            v48 = v63;
            objc_msgSend(a1, "vcp_scaleRampWithIntervals:andRates:inSlowmoTimerange:withTimeMapping:inComposition:", v31, v32, &v48, v33, v10);
          }
          memset(&v47, 0, sizeof(v47));
          v45 = *(_OWORD *)&v51.start.value;
          v46 = v51.start.epoch;
          objc_msgSend(v33, "convertToOriginalTimeFromScaledTime:forExport:", &v45, 1);
          v43 = v47;
          duration = v51.duration;
          CMTimeRangeMake(&v44, &v43, &duration);
          v40 = v51.duration;
          objc_msgSend(v9, "slowMotionRate");
          CMTimeMultiplyByFloat64(&v41, &v40, v16);
          objc_msgSend(v10, "scaleTimeRange:toDuration:", &v44, &v41);
          if (Seconds >= 0.100000001)
          {
            v39[0] = v60;
            v39[1] = v61;
            v39[2] = v62;
            objc_msgSend(a1, "vcp_scaleRampWithIntervals:andRates:inSlowmoTimerange:withTimeMapping:inComposition:", v27, v28, v39, v33, v10);
          }
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v10, "tracks");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v74, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v36;
            v20 = *MEMORY[0x1E0C8A7A0];
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                objc_msgSend(v22, "mediaType");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqualToString:", v20);

                if (v24)
                  objc_msgSend(v10, "removeTrack:", v22);
              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v74, 16);
            }
            while (v18);
          }

          v14 = v10;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
