@implementation SHAssetUtilities

+ (void)mixedTracksFromAsset:(id)a3 format:(id)a4 accumulator:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v21 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23B8]), "initWithAsset:error:", v9, &v21);
    v14 = v21;
    if (v13)
    {
      v15 = *MEMORY[0x24BDB1CF0];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __78__SHAssetUtilities_mixedTracksFromAsset_format_accumulator_completionHandler___block_invoke;
      v16[3] = &unk_24D9B7D08;
      v19 = v12;
      v17 = v10;
      v18 = v13;
      v20 = v11;
      objc_msgSend(v9, "loadTracksWithMediaType:completionHandler:", v15, v16);

    }
    else
    {
      (*((void (**)(id, id))v12 + 2))(v12, v14);
    }

  }
}

void __78__SHAssetUtilities_mixedTracksFromAsset_format_accumulator_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  const __CFAllocator *v7;
  opaqueCMSampleBuffer *v8;
  opaqueCMSampleBuffer *v9;
  OSStatus AudioBufferListWithRetainedBlockBuffer;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t v23[16];
  AudioBufferList bufferListOut;
  CMBlockBufferRef blockBufferOut;

  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    v17 = *(_QWORD *)(a1 + 48);
    +[SHError errorWithCode:underlyingError:](SHError, "errorWithCode:underlyingError:", 100, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

    goto LABEL_22;
  }
  v4 = objc_alloc(MEMORY[0x24BDB23C0]);
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAudioTracks:audioSettings:", v3, v5);

  if ((objc_msgSend(*(id *)(a1 + 40), "canAddOutput:", v6) & 1) == 0)
    goto LABEL_20;
  objc_msgSend(*(id *)(a1 + 40), "addOutput:", v6);
  objc_msgSend(*(id *)(a1 + 40), "startReading");
  if (objc_msgSend(*(id *)(a1 + 40), "status") == 2)
  {
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_21;
  }
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "status") != 1)
      goto LABEL_14;
    v8 = (opaqueCMSampleBuffer *)objc_msgSend(v6, "copyNextSampleBuffer");
    if (!v8)
      goto LABEL_14;
    v9 = v8;
    blockBufferOut = 0;
    memset(&bufferListOut, 0, sizeof(bufferListOut));
    AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v8, 0, &bufferListOut, 0x18uLL, v7, v7, 1u, &blockBufferOut);
    CFRelease(v9);
    if (AudioBufferListWithRetainedBlockBuffer)
      break;
    v11 = objc_alloc(MEMORY[0x24BDB1838]);
    v12 = (void *)objc_msgSend(v11, "initWithPCMFormat:frameCapacity:", *(_QWORD *)(a1 + 32), bufferListOut.mBuffers[0].mDataByteSize/ *(_DWORD *)(objc_msgSend(*(id *)(a1 + 32), "streamDescription") + 24));
    objc_msgSend(v12, "setFrameLength:", objc_msgSend(v12, "frameCapacity"));
    if (bufferListOut.mNumberBuffers)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        memcpy(*(void **)(objc_msgSend(v12, "audioBufferList") + v13 * 16 + 16), bufferListOut.mBuffers[v13].mData, bufferListOut.mBuffers[v13].mDataByteSize);
        ++v14;
        ++v13;
      }
      while (v14 < bufferListOut.mNumberBuffers);
    }
    CFRelease(blockBufferOut);
    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
    {
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v12);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v22 = (void *)v16;
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        goto LABEL_21;
      }
    }

LABEL_14:
    if (objc_msgSend(*(id *)(a1 + 40), "status") == 2)
      goto LABEL_15;
  }
  sh_log_object();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_218BF1000, v19, OS_LOG_TYPE_ERROR, "Failed to get audio from URL passed to buffersFromAssetURL", v23, 2u);
  }

LABEL_20:
  v20 = *(_QWORD *)(a1 + 48);
  +[SHError errorWithCode:underlyingError:](SHError, "errorWithCode:underlyingError:", 100, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

LABEL_21:
LABEL_22:

}

+ (BOOL)buffersFromAudioFile:(id)a3 format:(id)a4 accumulator:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  uint64_t (**v10)(id, void *);
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  BOOL v30;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(id, void *))a5;
  objc_msgSend(v8, "processingFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0x10000u / *(_DWORD *)(objc_msgSend(v11, "streamDescription") + 24);

  v13 = objc_alloc(MEMORY[0x24BDB1838]);
  objc_msgSend(v8, "processingFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithPCMFormat:frameCapacity:", v14, v12);

  v16 = (double)v12;
  objc_msgSend(v9, "sampleRate");
  v18 = v17;
  objc_msgSend(v8, "processingFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sampleRate");
  LODWORD(v14) = vcvtad_u64_f64(v18 / v20 * v16);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v9, v14);
  v22 = objc_alloc(MEMORY[0x24BDB17F8]);
  objc_msgSend(v8, "processingFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  v24 = (void *)objc_msgSend(v22, "initFromFormat:toFormat:", v23, v9);

  while (1)
  {
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __66__SHAssetUtilities_buffersFromAudioFile_format_accumulator_error___block_invoke;
    v34[3] = &unk_24D9B7D30;
    v25 = v8;
    v35 = v25;
    v26 = v15;
    v36 = v26;
    v27 = objc_msgSend(v24, "convertToBuffer:error:withInputFromBlock:", v21, a6, v34);
    if (v27 == 2)
    {
LABEL_6:
      v30 = 1;
      goto LABEL_8;
    }
    v28 = v27;
    if (v27 == 3)
      break;
    v29 = (id)v10[2](v10, v21);
    if (v28 == 1)
      goto LABEL_6;
    objc_msgSend(v26, "setFrameLength:", 0);
    objc_msgSend(v21, "setFrameLength:", 0);

  }
  v30 = 0;
LABEL_8:

  return v30;
}

id __66__SHAssetUtilities_buffersFromAudioFile_format_accumulator_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "readIntoBuffer:error:", *(_QWORD *)(a1 + 40), 0))
  {
    *a3 = 0;
    v5 = *(id *)(a1 + 40);
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "framePosition");
    if (v6 >= objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v5 = 0;
      v7 = 2;
    }
    else
    {
      v5 = 0;
      v7 = 1;
    }
    *a3 = v7;
  }
  return v5;
}

+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 durationToRead:(double)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "pcmBufferFromAudioFile:outputFormat:error:", a3, a4, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a5 <= 0.0)
    {
      v9 = (double)objc_msgSend(v7, "frameLength");
      objc_msgSend(v8, "format");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sampleRate");
      a5 = v9 / v11;

    }
    +[SHAudioUtilities splitBuffer:fromStartPosition:intoDurationsOfSize:](SHAudioUtilities, "splitBuffer:fromStartPosition:intoDurationsOfSize:", v8, 0, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)pcmBufferFromAudioFile:(id)a3 outputFormat:(id)a4 error:(id *)a5
{
  uint64_t v5;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (double)objc_msgSend(v8, "length");
  objc_msgSend(v9, "sampleRate");
  v12 = v11;
  objc_msgSend(v8, "processingFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sampleRate");
  LODWORD(v5) = vcvtad_u64_f64(v12 / v14 * v10);

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB1838]), "initWithPCMFormat:frameCapacity:", v9, v5);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__SHAssetUtilities_pcmBufferFromAudioFile_outputFormat_error___block_invoke;
  v17[3] = &unk_24D9B7D58;
  v17[4] = &v18;
  if (+[SHAssetUtilities buffersFromAudioFile:format:accumulator:error:](SHAssetUtilities, "buffersFromAudioFile:format:accumulator:error:", v8, v9, v17, a5))
  {
    v15 = (id)v19[5];
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __62__SHAssetUtilities_pcmBufferFromAudioFile_outputFormat_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[SHAudioUtilities appendBuffer:toBuffer:](SHAudioUtilities, "appendBuffer:toBuffer:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

@end
