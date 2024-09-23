@implementation QLWaveformDeterminePowerLevelsForAsset

void __QLWaveformDeterminePowerLevelsForAsset_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    dispatch_get_global_queue(-32768, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __QLWaveformDeterminePowerLevelsForAsset_block_invoke_103;
    v10[3] = &unk_24C724F68;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v14 = v6;
    v12 = v3;
    v13 = *(id *)(a1 + 40);
    dispatch_async(v4, v10);

  }
  else
  {
    v7 = (NSObject **)MEMORY[0x24BE7BF48];
    v8 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_ERROR, "No tracks found for asset %@ #Waveform", buf, 0xCu);
    }
  }

}

void __QLWaveformDeterminePowerLevelsForAsset_block_invoke_103(uint64_t a1)
{
  void *v2;
  double Seconds;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  size_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  opaqueCMSampleBuffer *v19;
  double v20;
  int64_t v21;
  NSObject *v22;
  opaqueCMSampleBuffer *v23;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  unint64_t value_low;
  unint64_t v31;
  char *v32;
  UInt32 v33;
  UInt32 mBytesPerFrame;
  int v35;
  uint64_t v36;
  unsigned int v37;
  double v38;
  unint64_t mChannelsPerFrame;
  double v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t *v51;
  id v52;
  opaqueCMSampleBuffer *v53;
  unint64_t v54;
  unsigned int v55;
  _QWORD block[4];
  id v57;
  unint64_t v58;
  char *v59;
  CMBlockBufferRef blockBufferOut;
  CMTime v61;
  CMTime v62;
  id v63;
  CMTime time;
  CMTime v65;
  _QWORD v66[3];
  _QWORD v67[4];

  v67[3] = *MEMORY[0x24BDAC8D0];
  memset(&v65, 0, sizeof(v65));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "duration");
  time = v65;
  Seconds = CMTimeGetSeconds(&time);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 8 * *(_QWORD *)(a1 + 56);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, v9);
  bzero(v8, v9);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v63 = 0;
  objc_msgSend(MEMORY[0x24BDB23B8], "assetReaderWithAsset:error:", v12, &v63);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v63;
  if (v14 || !v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create an AVAssetReader to read the audio levels (error: %@)"), v14);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s ERROR: %@"), "QLWaveformDeterminePowerLevelsForAsset_block_invoke", v18);
  }
  else
  {
    v15 = *MEMORY[0x24BDB1788];
    v66[0] = *MEMORY[0x24BDB1780];
    v66[1] = v15;
    v16 = (void *)MEMORY[0x24BDB23D0];
    v67[0] = &unk_24C749378;
    v67[1] = &unk_24C749390;
    v66[2] = *MEMORY[0x24BDB1790];
    v67[2] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "assetReaderTrackOutputWithTrack:outputSettings:", v11, v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAlwaysCopiesSampleData:", 0);
    objc_msgSend(v13, "addOutput:", v18);
    objc_msgSend(v13, "startReading");
    v19 = (opaqueCMSampleBuffer *)objc_msgSend(v18, "copyNextSampleBuffer");
    if (v19)
    {
      v52 = v18;
      v48 = v13;
      v49 = 0;
      v50 = v11;
      v51 = &v47;
      v20 = Seconds / (double)v4;
      v21 = -1;
      v22 = MEMORY[0x24BDAC9B8];
      do
      {
        v23 = v19;
        FormatDescription = CMSampleBufferGetFormatDescription(v19);
        StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
        CMSampleBufferGetPresentationTimeStamp(&v62, v23);
        v26 = CMTimeGetSeconds(&v62);
        CMSampleBufferGetDuration(&v61, v23);
        v27 = CMTimeGetSeconds(&v61);
        v28 = StreamBasicDescription->mBitsPerChannel == 16;
        v53 = v23;
        if (v28)
        {
          v29 = v27;
          memset(&time, 0, sizeof(time));
          blockBufferOut = 0;
          CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v23, 0, (AudioBufferList *)&time, 0x18uLL, 0, 0, 0, &blockBufferOut);
          value_low = LODWORD(time.value);
          if (LODWORD(time.value))
          {
            v31 = 0;
            do
            {
              v32 = (char *)&time + 16 * v31;
              v33 = *((_DWORD *)v32 + 3);
              mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
              if (mBytesPerFrame <= v33)
              {
                v54 = v31;
                v35 = 0;
                v36 = *((_QWORD *)v32 + 2);
                v37 = v33 / mBytesPerFrame;
                v38 = (double)(v37 - 1);
                mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
                if (v37 <= 1)
                  v37 = 1;
                v55 = v37;
                v40 = 0.0;
                v41 = mChannelsPerFrame;
                do
                {
                  if (v41)
                  {
                    v42 = 0;
                    do
                    {
                      v44 = (double)(unint64_t)(*(_QWORD *)(a1 + 56) - 1);
                      if ((v26 + v40 / v38 * v29) / v20 < v44)
                        v44 = (v26 + v40 / v38 * v29) / v20;
                      v45 = (unint64_t)v44;
                      v46 = *(_QWORD *)&v8[8 * (unint64_t)v44];
                      v43 = *(__int16 *)(v36 + 2 * (v35 + v42));
                      *(double *)&v10[8 * v45] = sqrt(((double)v43 * (double)v43+ *(double *)&v10[8 * (unint64_t)v44]* *(double *)&v10[8 * (unint64_t)v44]* (double)v46)/ (double)(v46 + 1));
                      *(_QWORD *)&v8[8 * v45] = v46 + 1;
                      if (v21 < (uint64_t)(unint64_t)v44)
                      {
                        block[0] = MEMORY[0x24BDAC760];
                        block[1] = 3221225472;
                        block[2] = __QLWaveformDeterminePowerLevelsForAsset_block_invoke_114;
                        block[3] = &unk_24C725DC8;
                        v57 = *(id *)(a1 + 48);
                        v58 = v45;
                        v59 = v10;
                        dispatch_async(v22, block);

                        mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
                        v21 = v45;
                      }
                      ++v42;
                      v41 = mChannelsPerFrame;
                    }
                    while (v42 < mChannelsPerFrame);
                  }
                  v40 = v40 + 1.0;
                  ++v35;
                }
                while (v35 != v55);
                value_low = LODWORD(time.value);
                v31 = v54;
              }
              ++v31;
            }
            while (v31 < value_low);
          }
          CFRelease(blockBufferOut);
        }
        CFRelease(v53);
        v19 = (opaqueCMSampleBuffer *)objc_msgSend(v52, "copyNextSampleBuffer");
      }
      while (v19);
      v11 = v50;
      v14 = v49;
      v13 = v48;
      v18 = v52;
    }
  }

}

uint64_t __QLWaveformDeterminePowerLevelsForAsset_block_invoke_114(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1[4] + 16))(a1[4], a1[5] + 1, a1[6]);
}

@end
