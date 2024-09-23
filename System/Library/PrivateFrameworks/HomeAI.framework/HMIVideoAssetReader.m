@implementation HMIVideoAssetReader

- (HMIVideoAssetReader)initWithAsset:(id)a3
{
  return -[HMIVideoAssetReader initWithAsset:readVideoTrack:readAudioTrack:](self, "initWithAsset:readVideoTrack:readAudioTrack:", a3, 1, 1);
}

- (HMIVideoAssetReader)initWithAsset:(id)a3 readVideoTrack:(BOOL)a4 readAudioTrack:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  HMIVideoAssetReader *v10;
  uint64_t v11;
  NSMutableArray *trackOutputs;
  uint64_t v13;
  NSError *v14;
  AVAssetReader *assetReader;
  uint64_t v16;
  NSError *error;
  NSError *v18;
  id v20;
  objc_super v21;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HMIVideoAssetReader;
  v10 = -[HMIVideoAssetReader init](&v21, sel_init);
  if (v10)
  {
    v10->_trackSamples = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    trackOutputs = v10->_trackOutputs;
    v10->_trackOutputs = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_asset, a3);
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDB23B8], "assetReaderWithAsset:error:", v9, &v20);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (NSError *)v20;
    assetReader = v10->_assetReader;
    v10->_assetReader = (AVAssetReader *)v13;

    if (v10->_assetReader)
    {
      if (-[HMIVideoAssetReader _createOutputsForAsset:readVideo:readAudio:](v10, "_createOutputsForAsset:readVideo:readAudio:", v9, v6, v5))
      {
        v16 = 1;
LABEL_7:
        v10->super._status = v16;

        goto LABEL_8;
      }
    }
    else
    {
      error = v10->super._error;
      v10->super._error = v14;
      v18 = v14;

    }
    v16 = 4;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (BOOL)_createOutputsForAsset:(id)a3 readVideo:(BOOL)a4 readAudio:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AVAsset tracksWithMediaType:](self->_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  if (v5)
  {
    -[AVAsset tracksWithMediaType:](self->_asset, "tracksWithMediaType:", *MEMORY[0x24BDB1CF0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v10);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    v15 = (const void *)*MEMORY[0x24BDBD430];
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 0, (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAlwaysCopiesSampleData:", 0);
        if (!-[AVAssetReader canAddOutput:](self->_assetReader, "canAddOutput:", v17))
        {

          v18 = 0;
          goto LABEL_15;
        }
        -[AVAssetReader addOutput:](self->_assetReader, "addOutput:", v17);
        -[NSMutableArray addObject:](self->_trackOutputs, "addObject:", v17);
        CFArrayAppendValue(self->_trackSamples, v15);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
  CFRelease(self->_trackSamples);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAssetReader;
  -[HMIVideoAssetReader dealloc](&v3, sel_dealloc);
}

- (opaqueCMSampleBuffer)_copyNextSampleBufferFromTrackOutput:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HMIVideoAssetReader *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSError *error;
  CMTime v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "copyNextSampleBuffer");
  if (v5)
  {
    v6 = (void *)v5;
    while (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v6))
    {
      CFRelease(v6);
      v6 = (void *)objc_msgSend(v4, "copyNextSampleBuffer");
      if (!v6)
        goto LABEL_5;
    }
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetDecodeTimeStamp(&v15, (CMSampleBufferRef)v6);
  }
  else
  {
LABEL_5:
    if (-[AVAssetReader status](self->_assetReader, "status") == AVAssetReaderStatusFailed)
    {
      v7 = (void *)MEMORY[0x220735570]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVAssetReader error](self->_assetReader, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15.value) = 138543618;
        *(CMTimeValue *)((char *)&v15.value + 4) = (CMTimeValue)v10;
        LOWORD(v15.flags) = 2112;
        *(_QWORD *)((char *)&v15.flags + 2) = v11;
        _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read sample buffer, error: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[AVAssetReader error](self->_assetReader, "error");
      v12 = objc_claimAutoreleasedReturnValue();
      error = v8->super._error;
      v8->super._error = (NSError *)v12;

      v6 = 0;
      v8->super._status = 4;
    }
    else
    {
      v6 = 0;
    }
  }

  return (opaqueCMSampleBuffer *)v6;
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  return -[HMIVideoAssetReader copyNextSampleBufferWithTrackIndexOutput:](self, "copyNextSampleBufferWithTrackIndexOutput:", 0);
}

- (opaqueCMSampleBuffer)copyNextSampleBufferWithTrackIndexOutput:(unint64_t *)a3
{
  int64_t status;
  void *v6;
  HMIVideoAssetReader *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const void *v11;
  void *v12;
  opaqueCMSampleBuffer *v13;
  __CFArray *v14;
  unint64_t v15;
  opaqueCMSampleBuffer *v16;
  unsigned int v17;
  opaqueCMSampleBuffer *ValueAtIndex;
  BOOL v19;
  const void *v20;
  opaqueCMSampleBuffer *v21;
  void *v22;
  opaqueCMSampleBuffer *v23;
  __CFArray *trackSamples;
  NSError *v26;
  NSError *error;
  CMTime v28;
  CMTime time1;
  CMTime v30;
  CMTime buf;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  status = self->super._status;
  if (status != 1)
  {
    if (status == 4)
    {
      v6 = (void *)MEMORY[0x220735570]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138543362;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Asset reader failed, ignoring", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      return 0;
    }
LABEL_14:
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D58];
    if (-[NSMutableArray count](self->_trackOutputs, "count"))
    {
      v15 = 0;
      v16 = (opaqueCMSampleBuffer *)*MEMORY[0x24BDBD430];
      v17 = -1;
      do
      {
        ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(self->_trackSamples, v15);
        if (ValueAtIndex)
          v19 = ValueAtIndex == v16;
        else
          v19 = 1;
        if (!v19)
        {
          memset(&v30, 0, sizeof(v30));
          CMSampleBufferGetDecodeTimeStamp(&v30, ValueAtIndex);
          time1 = v30;
          v28 = buf;
          if (CMTimeCompare(&time1, &v28) < 0)
          {
            buf = v30;
            v17 = v15;
          }
        }
        ++v15;
      }
      while (-[NSMutableArray count](self->_trackOutputs, "count") > v15);
      if ((v17 & 0x80000000) == 0)
      {
        v20 = CFArrayGetValueAtIndex(self->_trackSamples, v17);
        v21 = (opaqueCMSampleBuffer *)CFRetain(v20);
        -[NSMutableArray objectAtIndexedSubscript:](self->_trackOutputs, "objectAtIndexedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[HMIVideoAssetReader _copyNextSampleBufferFromTrackOutput:](self, "_copyNextSampleBufferFromTrackOutput:", v22);

        trackSamples = self->_trackSamples;
        if (v23)
        {
          CFArraySetValueAtIndex(trackSamples, v17, v23);
          CFRelease(v23);
          if (!a3)
            return v21;
        }
        else
        {
          CFArraySetValueAtIndex(trackSamples, v17, v16);
          if (!a3)
            return v21;
        }
        *a3 = v17;
        return v21;
      }
    }
    return 0;
  }
  if (!-[AVAssetReader startReading](self->_assetReader, "startReading"))
  {
    -[AVAssetReader error](self->_assetReader, "error");
    v26 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->super._error;
    self->super._error = v26;

    v21 = 0;
    self->super._status = 4;
    return v21;
  }
  self->super._status = 2;
  if (-[NSMutableArray count](self->_trackOutputs, "count"))
  {
    v10 = 0;
    v11 = (const void *)*MEMORY[0x24BDBD430];
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_trackOutputs, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMIVideoAssetReader _copyNextSampleBufferFromTrackOutput:](self, "_copyNextSampleBufferFromTrackOutput:", v12);

      v14 = self->_trackSamples;
      if (v13)
      {
        CFArraySetValueAtIndex(v14, v10, v13);
        CFRelease(v13);
      }
      else
      {
        CFArraySetValueAtIndex(v14, v10, v11);
      }
      ++v10;
    }
    while (-[NSMutableArray count](self->_trackOutputs, "count") > v10);
  }
  if (self->super._status != 4)
    goto LABEL_14;
  return 0;
}

- (BOOL)checkAndSaveCrashReportWithData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  HMIVideoAssetReader *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  CMTime rhs;
  CMTime time;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  uint64_t v38;
  CMTime lhs;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3810000000;
  v36 = &unk_219EC7149;
  v37 = *MEMORY[0x24BDC0D58];
  v38 = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3810000000;
  v31 = *MEMORY[0x24BDC0D88];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v30 = &unk_219EC7149;
  v32 = v6;
  -[AVAsset tracks](self->_asset, "tracks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke;
  v23[3] = &unk_24DBEA1D8;
  v23[4] = self;
  v25 = &v33;
  v26 = &v27;
  v9 = v5;
  v24 = v9;
  objc_msgSend(v7, "na_each:", v23);

  lhs = *(CMTime *)(v28 + 4);
  rhs = *(CMTime *)(v34 + 4);
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) > 1.0)
    objc_msgSend(v9, "addObject:", &unk_24DC15590);
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x220735570]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(lhs.value) = 138543618;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)v13;
      LOWORD(lhs.flags) = 2112;
      *(_QWORD *)((char *)&lhs.flags + 2) = v9;
      _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Warnings: %@", (uint8_t *)&lhs, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke_21;
    v19[3] = &unk_24DBEA200;
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    objc_msgSend(v9, "na_each:", v19);
    if (+[HMIPreference isInternalInstall](HMIPreference, "isInternalInstall"))
    {
      objc_msgSend(v14, "appendString:", CFSTR("Sanitized Data\n"));
      objc_msgSend(v4, "base64EncodedDataWithOptions:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v15, 4);
      objc_msgSend(v14, "appendString:", v16);

      objc_msgSend(v14, "appendString:", CFSTR("\n\n"));
    }
    HMISimulateCrash(CFSTR("Asset Check"), v14, 1);

  }
  v17 = objc_msgSend(v9, "count") != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v14[6];
  CMTime time;
  __int128 v16;
  _OWORD v17[2];
  CMTime v18;
  CMTime v19;
  __int128 v20;
  _OWORD v21[2];
  CMTime time1;
  CMTime v23;
  _OWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[2];
  CMTime buf;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x220735570]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v3, "timeRange");
    else
      memset(v24, 0, sizeof(v24));
    HMICMTimeRangeDescription(v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138543874;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v7;
    LOWORD(buf.flags) = 2112;
    *(_QWORD *)((char *)&buf.flags + 2) = v3;
    HIWORD(buf.epoch) = 2112;
    v28 = v8;
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Track %@, %@", (uint8_t *)&buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    v20 = 0u;
  }
  time1 = *(CMTime *)((char *)v21 + 8);
  buf = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  CMTimeMinimum(&v23, &time1, &buf);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v23;
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v16 = 0u;
  }
  v18 = *(CMTime *)((char *)v17 + 8);
  buf = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32);
  CMTimeMaximum(&v19, &v18, &buf);
  *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v19;
  if (v3)
    objc_msgSend(v3, "timeRange");
  else
    memset(&v14[3], 0, 48);
  time = *(CMTime *)((char *)&v14[4] + 8);
  if (CMTimeGetSeconds(&time) > 3600.0)
  {
    v9 = *(void **)(a1 + 40);
    v25[0] = CFSTR("name");
    v25[1] = CFSTR("discussion");
    v26[0] = CFSTR("VeryLongTrackDuration");
    v10 = (void *)MEMORY[0x24BDD17C8];
    if (v3)
      objc_msgSend(v3, "timeRange");
    else
      memset(v14, 0, 48);
    HMICMTimeRangeDescription(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Track %@ has an unexpectedly long track duration %@."), v3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
}

uint64_t __55__HMIVideoAssetReader_checkAndSaveCrashReportWithData___block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("discussion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v7);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOutputs, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
