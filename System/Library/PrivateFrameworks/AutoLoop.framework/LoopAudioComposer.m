@implementation LoopAudioComposer

- (int)composeLoopWithAudio:(id)a3 withAudioSource:(id)a4 startTime:(id *)a5 fadeTime:(id *)a6 periodTime:(id *)a7 metadata:(id)a8 andOutputURL:(id)a9
{
  id v13;
  id v14;
  CMTime *v15;
  int32_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int64_t var0;
  uint64_t var1;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v56;
  CMTime v57;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v58;
  CMTime v59;
  __int128 v60;
  CMTimeEpoch v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  CMTimeRange v66;
  CMTime v67;
  CMTime v68;
  __int128 v69;
  uint64_t v70;
  CMTime v71;
  CMTime v72;
  CMTime v73;
  CMTime v74;
  CMTimeRange v75;
  __int128 v76;
  uint64_t v77;
  CMTime v78;
  CMTime v79;
  CMTimeRange v80;
  CMTime v81;
  CMTime v82;
  __int128 v83;
  CMTimeEpoch v84;
  CMTime v85;
  CMTime v86;
  CMTimeRange v87;
  CMTime rhs;
  CMTime lhs;
  _OWORD v90[3];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _OWORD v98[2];
  CMTime v99;
  CMTime v100;
  __int128 v101;
  CMTimeEpoch epoch;
  CMTime duration;
  CMTime start;
  CMTimeRange v105;
  CMTime v106;
  CMTime v107;
  CMTime time2;
  CMTime time1;

  v13 = a3;
  v55 = a4;
  v54 = a8;
  v14 = a9;
  time1 = *(CMTime *)a6;
  v15 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v16 = CMTimeCompare(&time1, &time2);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeItemAtPath:error:", v21, 0);

  }
  v107 = (CMTime)*a7;
  if (v13)
    objc_msgSend(v13, "duration");
  else
    memset(&v106, 0, sizeof(v106));
  if (CMTimeCompare(&v107, &v106))
  {
    var0 = a7->var0;
    var1 = a7->var1;
    if (v13)
    {
      objc_msgSend(v13, "duration");
      v24 = v97;
      objc_msgSend(v13, "duration");
      v25 = DWORD2(v94);
    }
    else
    {
      v25 = 0;
      v24 = 0;
      v97 = 0uLL;
      *(_QWORD *)&v98[0] = 0;
      v94 = 0uLL;
      *(_QWORD *)&v95 = 0;
    }
    NSLog(CFSTR("WARNING: LOOP PERIOD = %lld/%d, BUT LOOP VIDEO DURATION = %lld/%d.\n"), var0, var1, v24, v25);
  }
  v26 = *MEMORY[0x1E0C8A808];
  objc_msgSend(v13, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    objc_msgSend(v13, "tracksWithMediaType:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndex:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = *MEMORY[0x1E0C8A7A0];
    objc_msgSend(v55, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      objc_msgSend(v55, "tracksWithMediaType:", v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectAtIndex:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C8B268], "composition");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addMutableTrackWithMediaType:preferredTrackID:", v26, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      start = *v15;
      duration = (CMTime)*a7;
      CMTimeRangeMake(&v105, &start, &duration);
      v101 = *(_OWORD *)&v15->value;
      epoch = v15->epoch;
      objc_msgSend(v52, "insertTimeRange:ofTrack:atTime:error:", &v105, v53, &v101, 0);
      v100 = (CMTime)*a7;
      if (v34)
      {
        objc_msgSend(v34, "timeRange");
      }
      else
      {
        memset(v98, 0, sizeof(v98));
        v97 = 0u;
      }
      v99 = *(CMTime *)((char *)v98 + 8);
      if (CMTimeCompare(&v100, &v99) < 1)
      {
        if (v53)
        {
          objc_msgSend(v53, "preferredTransform");
        }
        else
        {
          v93 = 0u;
          v92 = 0u;
          v91 = 0u;
        }
        v90[0] = v91;
        v90[1] = v92;
        v90[2] = v93;
        objc_msgSend(v52, "setPreferredTransform:", v90);
        v97 = 0uLL;
        *(_QWORD *)&v98[0] = 0;
        lhs = (CMTime)*a7;
        rhs = (CMTime)*a6;
        CMTimeSubtract((CMTime *)&v97, &lhs, &rhs);
        if (v16 <= 0)
        {
          objc_msgSend(v51, "addMutableTrackWithMediaType:preferredTrackID:", v30, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = (CMTime)*a5;
          v85 = (CMTime)*a7;
          CMTimeRangeMake(&v87, &v86, &v85);
          v83 = *(_OWORD *)&v15->value;
          v84 = v15->epoch;
          v47 = 0;
          v48 = 0;
          v49 = 0;
          objc_msgSend(v42, "insertTimeRange:ofTrack:atTime:error:", &v87, v34, &v83, 0);
          v40 = 0;
        }
        else
        {
          objc_msgSend(v51, "addMutableTrackWithMediaType:preferredTrackID:", v30, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addMutableTrackWithMediaType:preferredTrackID:", v30, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addMutableTrackWithMediaType:preferredTrackID:", v30, 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (CMTime)*a6;
          v81 = *v15;
          if (CMTimeCompare(&v82, &v81) >= 1)
          {
            v79 = (CMTime)*a5;
            v78 = (CMTime)*a6;
            CMTimeRangeMake(&v80, &v79, &v78);
            v76 = v97;
            v77 = *(_QWORD *)&v98[0];
            objc_msgSend(v47, "insertTimeRange:ofTrack:atTime:error:", &v80, v34, &v76, 0);
            v73 = (CMTime)*a5;
            v72 = (CMTime)*a7;
            CMTimeAdd(&v74, &v73, &v72);
            v71 = (CMTime)*a6;
            CMTimeRangeMake(&v75, &v74, &v71);
            v69 = v97;
            v70 = *(_QWORD *)&v98[0];
            objc_msgSend(v48, "insertTimeRange:ofTrack:atTime:error:", &v75, v34, &v69, 0);
          }
          *(_OWORD *)&v68.value = v97;
          v68.epoch = *(_QWORD *)&v98[0];
          v67 = *v15;
          if (CMTimeCompare(&v68, &v67) >= 1)
          {
            v64 = (CMTime)*a5;
            v63 = (CMTime)*a6;
            CMTimeAdd(&v65, &v64, &v63);
            *(_OWORD *)&v62.value = v97;
            v62.epoch = *(_QWORD *)&v98[0];
            CMTimeRangeMake(&v66, &v65, &v62);
            v60 = *(_OWORD *)&v15->value;
            v61 = v15->epoch;
            objc_msgSend(v49, "insertTimeRange:ofTrack:atTime:error:", &v66, v34, &v60, 0);
          }
          objc_msgSend(MEMORY[0x1E0C8B258], "audioMix");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)&v59.value = v97;
          v59.epoch = *(_QWORD *)&v98[0];
          v58 = *a7;
          sub_1D4C7B958(v48, v41, &v59, (CMTime *)&v58, 1);
          *(_OWORD *)&v57.value = v97;
          v57.epoch = *(_QWORD *)&v98[0];
          v56 = *a7;
          sub_1D4C7B958(v47, v41, &v57, (CMTime *)&v56, 0);
          objc_msgSend(v40, "setInputParameters:", v41);

          v42 = 0;
        }
        objc_msgSend(MEMORY[0x1E0C8AFC0], "exportPresetsCompatibleWithAsset:", v13);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *MEMORY[0x1E0C89E28];
        if ((objc_msgSend((id)*MEMORY[0x1E0C89E28], "isEqualToString:", *MEMORY[0x1E0C89E98]) & 1) != 0
          || (objc_msgSend(v43, "containsObject:", v44) & 1) != 0)
        {
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC0]), "initWithAsset:presetName:", v51, v44);
          objc_msgSend(v45, "setOutputURL:", v14);
          objc_msgSend(v45, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
          objc_msgSend(v45, "setShouldOptimizeForNetworkUse:", 1);
          objc_msgSend(v45, "setAudioMix:", v40);
          if (v54)
            objc_msgSend(v45, "setMetadata:", v54);
          if (sub_1D4C6CAD8(v45))
          {
            NSLog(CFSTR("Audio export error"));
            v35 = -1;
          }
          else
          {
            v35 = 0;
          }

        }
        else
        {
          NSLog(CFSTR("Audio export error: export preset incompatible with loop video asset. \n"));
          v35 = 0;
        }

      }
      else
      {
        v36 = a7->var0;
        v37 = a7->var1;
        if (v34)
        {
          objc_msgSend(v34, "timeRange");
          v38 = *((_QWORD *)&v98[0] + 1);
          objc_msgSend(v34, "timeRange");
          v39 = v96;
        }
        else
        {
          v39 = 0;
          v38 = 0;
          memset(v98, 0, sizeof(v98));
          v97 = 0u;
          v96 = 0u;
          v95 = 0u;
          v94 = 0u;
        }
        NSLog(CFSTR("Audio track of insufficient length (period %lld/%d; duration %lld/%d)"), v36, v37, v38, v39);
        v35 = -1;
      }

    }
    else
    {
      NSLog(CFSTR("No audio track available.\n"));
      v35 = -1;
    }

  }
  else
  {
    NSLog(CFSTR("No video track available.\n"));
    v35 = -1;
  }

  return v35;
}

@end
