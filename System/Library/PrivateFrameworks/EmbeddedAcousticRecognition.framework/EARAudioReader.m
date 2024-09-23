@implementation EARAudioReader

- (EARAudioReader)initWithFileURL:(id)a3 sampleRate:(unint64_t)a4
{
  id v6;
  EARAudioReader *v7;
  uint64_t v8;
  NSURL *fileURL;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EARAudioReader;
  v7 = -[EARAudioReader init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fileURL = v7->_fileURL;
    v7->_fileURL = (NSURL *)v8;

    v7->_sampleRate = (double)a4;
  }

  return v7;
}

- (id)enumerateAudioBuffersWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[NSURL pathExtension](self->_fileURL, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("opx"));

  if (v7)
    -[EARAudioReader _opx_enumerateAudioBuffersWithBlock:](self, "_opx_enumerateAudioBuffersWithBlock:", v4);
  else
    -[EARAudioReader _avf_enumerateAudioBuffersWithBlock:](self, "_avf_enumerateAudioBuffersWithBlock:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_avf_enumerateAudioBuffersWithBlock:(id)a3
{
  void (**v5)(id, char *, size_t, _BYTE *);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  opaqueCMSampleBuffer *v21;
  id v22;
  OpaqueCMBlockBuffer *DataBuffer;
  OSStatus DataPointer;
  void *v26;
  void *v27;
  char v28;
  size_t totalLengthOut;
  char *dataPointerOut;
  id v31;
  _QWORD v32[6];
  _QWORD v33[7];

  v33[6] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, char *, size_t, _BYTE *))a3;
  objc_msgSend(MEMORY[0x1E0C8B3B8], "assetWithURL:", self->_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD8], "assetReaderWithAsset:error:", v6, &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  v9 = v8;
  if (v7)
  {
    v10 = *MEMORY[0x1E0C898E8];
    v33[0] = &unk_1E5D5BD80;
    v11 = *MEMORY[0x1E0C89978];
    v32[0] = v10;
    v32[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sampleRate);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C89938];
    v33[1] = v12;
    v33[2] = &unk_1E5D5BD98;
    v14 = *MEMORY[0x1E0C898F8];
    v32[2] = v13;
    v32[3] = v14;
    v15 = *MEMORY[0x1E0C89908];
    v33[3] = &unk_1E5D5BDB0;
    v33[4] = MEMORY[0x1E0C9AAA0];
    v16 = *MEMORY[0x1E0C89918];
    v32[4] = v15;
    v32[5] = v16;
    v33[5] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C8AFE0];
    objc_msgSend(v6, "tracksWithMediaType:", *MEMORY[0x1E0C8A798]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assetReaderAudioMixOutputWithAudioTracks:audioSettings:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARAudioReader.mm"), 68, &stru_1E5D49530);

    }
    if ((objc_msgSend(v7, "canAddOutput:", v20) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARAudioReader.mm"), 70, &stru_1E5D49530);

    }
    objc_msgSend(v7, "addOutput:", v20);
    objc_msgSend(v7, "startReading");
    while (1)
    {
      v21 = (opaqueCMSampleBuffer *)objc_msgSend(v20, "copyNextSampleBuffer");
      v22 = v21;
      if (!v21)
        break;
      totalLengthOut = 0;
      dataPointerOut = 0;
      DataBuffer = CMSampleBufferGetDataBuffer(v21);
      DataPointer = CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut);
      if (DataPointer)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], DataPointer, 0);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        break;
      }
      v28 = 0;
      v5[2](v5, dataPointerOut, totalLengthOut >> 1, &v28);
      if (v28)
      {
        v22 = 0;
        break;
      }
      CFRelease(v22);
    }

  }
  else
  {
    v22 = v8;
  }

  return v22;
}

- (id)_opx_enumerateAudioBuffersWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  AudioConverterRef v22;
  int v23;
  AudioConverterRef outAudioConverter;
  AudioStreamBasicDescription inDestinationFormat;
  AudioStreamBasicDescription inSourceFormat;

  v4 = a3;
  inSourceFormat.mSampleRate = self->_sampleRate;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_1AE161340;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_1AE161350;
  inDestinationFormat.mSampleRate = inSourceFormat.mSampleRate;
  *(_OWORD *)&inDestinationFormat.mFormatID = xmmword_1AE161360;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_1AE161370;
  outAudioConverter = 0;
  v5 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, &outAudioConverter);
  v6 = v5;
  if ((_DWORD)v5)
  {
    EARLogger::QuasarOSLogger((EARLogger *)v5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EARAudioReader _opx_enumerateAudioBuffersWithBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 640);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke;
    v19[3] = &unk_1E5D48400;
    v23 = 320;
    v20 = v15;
    v22 = outAudioConverter;
    v21 = v4;
    v16 = v15;
    v17 = -[EARAudioReader _opx_enumeratePacketsWithBlock:](self, "_opx_enumeratePacketsWithBlock:", v19);

    v14 = 0;
  }

  return v14;
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  UInt32 v4;
  OpaqueAudioConverter *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD inInputDataProcUserData[4];
  id v19;
  _QWORD *v20;
  char *v21;
  UInt32 ioOutputDataPacketSize;
  AudioBufferList outOutputData;
  _QWORD v24[3];
  char v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  outOutputData.mNumberBuffers = 1;
  outOutputData.mBuffers[0].mData = (void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "mutableBytes");
  v4 = objc_msgSend(*(id *)(a1 + 32), "length");
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = v4;
  ioOutputDataPacketSize = *(_DWORD *)(a1 + 56);
  v5 = *(OpaqueAudioConverter **)(a1 + 48);
  inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
  inInputDataProcUserData[1] = 3221225472;
  inInputDataProcUserData[2] = __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2;
  inInputDataProcUserData[3] = &unk_1E5D483D8;
  v20 = v24;
  v21 = &v26;
  v6 = v3;
  v19 = v6;
  v7 = AudioConverterFillComplexBuffer(v5, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  v8 = v7;
  if ((_DWORD)v7 != 1836086393 && (_DWORD)v7)
  {
    EARLogger::QuasarOSLogger((EARLogger *)v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_1(v8, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_12;
  }
  if (!ioOutputDataPacketSize || !outOutputData.mNumberBuffers)
  {
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  v9 = 2 * ioOutputDataPacketSize;
  if (2 * (unint64_t)ioOutputDataPacketSize <= outOutputData.mBuffers[0].mDataByteSize)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
  EARLogger::QuasarOSLogger((EARLogger *)v7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_2(v9, (int *)&outOutputData.mBuffers[0].mDataByteSize, v10);

LABEL_13:
  _Block_object_dispose(v24, 8);

}

uint64_t __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2(uint64_t a1, unsigned int *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    result = 1836086393;
    *a2 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v9 = *(_QWORD **)(a1 + 48);
      *v9 = 0;
      v9[1] = 0;
      *a4 = v9;
    }
  }
  else if (*a2 == 1)
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "length");
    *(_QWORD *)(a3 + 16) = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
    *(_DWORD *)(a3 + 12) = v10;
    if (a4)
    {
      v11 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)v11 = 0;
      *(_DWORD *)(v11 + 8) = 0;
      *(_DWORD *)(v11 + 12) = v10;
      *a4 = v11;
    }
    result = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    EARLogger::QuasarOSLogger((EARLogger *)a1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2_cold_1(a2, v12);

    return 1752524863;
  }
  return result;
}

- (id)_opx_enumeratePacketsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  NSURL *fileURL;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  int v14;
  id v15;
  unsigned __int8 v17;
  id v18;
  id v19;
  char v20;
  id v21;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  fileURL = self->_fileURL;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", fileURL, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v8 = v7;
  if (!v6)
  {
    v8 = v7;
    v15 = v8;
    goto LABEL_14;
  }
  while (2)
  {
    v9 = 0;
    v20 = 0x80;
    do
    {
      v19 = 0;
      objc_msgSend(v6, "readDataUpToLength:error:", 1, &v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;

      if (!v10)
      {
        v15 = v11;
LABEL_13:

        v8 = v11;
        goto LABEL_14;
      }
      if (objc_msgSend(v10, "length") != 1)
      {
        v15 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v10, "getBytes:length:", &v20, 1);
      v12 = v20 & 0x7F | (v9 << 7);

      v8 = v11;
      v9 = v12;
    }
    while (v20 < 0);
    v18 = 0;
    objc_msgSend(v6, "readDataUpToLength:error:", v12, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (!v13)
    {
      v15 = v8;
LABEL_17:

      break;
    }
    if (objc_msgSend(v13, "length") != v12)
    {
      v15 = 0;
      goto LABEL_17;
    }
    v17 = 0;
    v4[2](v4, v13, &v17);
    v14 = v17;

    v15 = 0;
    if (!v14)
      continue;
    break;
  }
LABEL_14:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)_opx_enumerateAudioBuffersWithBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1AD756000, a2, a3, "Could not make Opus decoder: %d", a5, a6, a7, a8, 0);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1AD756000, a2, a3, "Could not finish Opus decoding for offline only mode: %d", a5, a6, a7, a8, 0);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_cold_2(int a1, int *a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_1AD756000, log, OS_LOG_TYPE_ERROR, "Opus ecoder gave us %d bytes bytes but we really only expected %d", (uint8_t *)v4, 0xEu);
}

void __54__EARAudioReader__opx_enumerateAudioBuffersWithBlock___block_invoke_2_cold_1(unsigned int *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "Only expecting to get 1 Opus packet at a time, not %lu", (uint8_t *)&v3, 0xCu);
}

@end
