@implementation SFSpeechURLRecognitionRequest

- (SFSpeechURLRecognitionRequest)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use -[SFSpeechURLRecognitionRequest initWithURL:]"));

  return 0;
}

- (SFSpeechURLRecognitionRequest)initWithURL:(NSURL *)URL
{
  NSURL *v4;
  SFSpeechURLRecognitionRequest *v5;
  uint64_t v6;
  NSURL *v7;
  objc_super v9;

  v4 = URL;
  v9.receiver = self;
  v9.super_class = (Class)SFSpeechURLRecognitionRequest;
  v5 = -[SFSpeechRecognitionRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSURL copy](v4, "copy");
    v7 = v5->_URL;
    v5->_URL = (NSURL *)v6;

  }
  return v5;
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  __CFString *v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSURL *URL;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  __CFString *v27;
  id v28;
  SFSpeechURLRecognitionRequest *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = (objc_class *)MEMORY[0x1E0CFE888];
  v13 = a6;
  v14 = objc_alloc_init(v12);
  v42 = v11;
  objc_msgSend(v14, "setDelegate:", v11);
  -[SFSpeechRecognitionRequest _dictationOptionsWithTaskHint:requestIdentifier:]((uint64_t)self, a5, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setFieldLabel:", CFSTR("SFSpeechPreecordedRequest"));
  if (!-[__CFString caseInsensitiveCompare:](v10, "caseInsensitiveCompare:", CFSTR("hi-IN-translit")))
  {
    v16 = CFSTR("hi-IN");

    objc_msgSend(v15, "setKeyboardIdentifier:", CFSTR("Translit"));
    v10 = CFSTR("hi-IN");
  }
  if (a5 == 1002)
    objc_msgSend(v15, "setOriginalAudioFileURL:", self->_URL);
  v17 = (void *)MEMORY[0x1E0C8B3C0];
  URL = self->_URL;
  v52 = *MEMORY[0x1E0C89EF0];
  v53[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLAssetWithURL:options:", URL, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = IsNarrowBand(v21);
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    if (v10)
      v23 = v10;
    else
      v23 = CFSTR("none");
    v51[0] = v23;
    v50[0] = CFSTR("language");
    v50[1] = CFSTR("task");
    +[SFUtilities taskNameFromTaskHint:](SFUtilities, "taskNameFromTaskHint:", a5);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v24)
      v26 = (const __CFString *)v24;
    else
      v26 = CFSTR("none");
    v51[1] = v26;
    v50[2] = CFSTR("narrowband");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
    v41 = v20;
    v27 = v10;
    v28 = v14;
    v29 = self;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v30;
    v50[3] = CFSTR("appname");
    objc_msgSend(v15, "applicationName");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = CFSTR("none");
    v50[4] = CFSTR("ondevice");
    v51[3] = v33;
    v51[4] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    self = v29;
    v14 = v28;
    v10 = v27;
    v20 = v41;

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.RequestStarted"), v34);
    objc_storeStrong((id *)&self->super._afDictationRequestParams, v34);

  }
  objc_msgSend(v14, "startRecordedAudioDictationWithOptions:forLanguage:narrowband:", v15, v10, v22);
  v35 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke;
  v48[3] = &unk_1E6486300;
  v49 = v14;
  v46[0] = v35;
  v46[1] = 3221225472;
  v46[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_2;
  v46[3] = &unk_1E6486328;
  v47 = v49;
  v43[0] = v35;
  v43[1] = 3221225472;
  v43[2] = __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_3;
  v43[3] = &unk_1E6486350;
  v36 = v47;
  v44 = v36;
  v45 = v42;
  v37 = v42;
  -[SFSpeechURLRecognitionRequest _handlePreRecordedAudioWithAsset:audioTracks:narrowband:addSpeechDataBlock:stopSpeechBlock:cancelSpeechWithErrorBlock:]((uint64_t)self, v20, v21, v22, v48, v46, v43);
  v38 = v45;
  v39 = v36;

  return v39;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SFLocalSpeechRecognitionClient *v16;
  void *v17;
  NSURL *URL;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  SFLocalSpeechRecognitionClient *v26;
  id v27;
  void *v28;
  SFLocalSpeechRecognitionClient *v29;
  _QWORD v31[4];
  SFLocalSpeechRecognitionClient *v32;
  id v33;
  _QWORD v34[4];
  SFLocalSpeechRecognitionClient *v35;
  _QWORD v36[4];
  SFLocalSpeechRecognitionClient *v37;
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  v16 = -[SFLocalSpeechRecognitionClient initWithDelegate:]([SFLocalSpeechRecognitionClient alloc], "initWithDelegate:", v12);
  v17 = (void *)MEMORY[0x1E0C8B3C0];
  URL = self->_URL;
  v38 = *MEMORY[0x1E0C89EF0];
  v39[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLAssetWithURL:options:", URL, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = IsNarrowBand(v21);
  -[SFSpeechRecognitionRequest _requestParametersWithTaskHint:requestIdentifier:taskIdentifier:narrowband:language:]((uint64_t)self, a5, v14, v13, v22, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSpeechRecognitionRequest _sandboxExtensionsWithError:]((uint64_t)self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLocalSpeechRecognitionClient initializeWithSandboxExtensions:](v16, "initializeWithSandboxExtensions:", v24);
  -[SFLocalSpeechRecognitionClient startRecordedAudioDictationWithParameters:](v16, "startRecordedAudioDictationWithParameters:", v23);
  LOBYTE(v14) = objc_msgSend(v23, "narrowband");
  v25 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke;
  v36[3] = &unk_1E6486300;
  v37 = v16;
  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_2;
  v34[3] = &unk_1E6486328;
  v35 = v37;
  v31[0] = v25;
  v31[1] = 3221225472;
  v31[2] = __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_3;
  v31[3] = &unk_1E6486350;
  v26 = v35;
  v32 = v26;
  v33 = v12;
  v27 = v12;
  -[SFSpeechURLRecognitionRequest _handlePreRecordedAudioWithAsset:audioTracks:narrowband:addSpeechDataBlock:stopSpeechBlock:cancelSpeechWithErrorBlock:]((uint64_t)self, v20, v21, (char)v14, v36, v34, v31);
  v28 = v33;
  v29 = v26;

  return v29;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

uint64_t __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAudioPacket:", a2);
}

uint64_t __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSpeech");
}

void __124__SFSpeechURLRecognitionRequest__startedLocalConnectionWithLanguageCode_delegate_taskHint_requestIdentifier_taskIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancelSpeech");
  objc_msgSend(*(id *)(a1 + 40), "localSpeechRecognitionClient:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_handlePreRecordedAudioWithAsset:(void *)a3 audioTracks:(char)a4 narrowband:(void *)a5 addSpeechDataBlock:(void *)a6 stopSpeechBlock:(void *)a7 cancelSpeechWithErrorBlock:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v13 = a2;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke;
    block[3] = &unk_1E64862A8;
    v20 = v13;
    v26 = a4;
    v21 = v14;
    v22 = a1;
    v23 = v15;
    v24 = v16;
    v25 = v17;
    dispatch_async(v18, block);

  }
}

void __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[9];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1927;
  v19 = __Block_byref_object_dispose__1928;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_134;
  v13[3] = &unk_1E6486280;
  v2 = *(id *)(a1 + 32);
  v13[4] = v2;
  v13[8] = &v15;
  v14 = *(_BYTE *)(a1 + 80);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v13[5] = v3;
  v13[6] = v4;
  v6 = v5;
  v13[7] = v6;
  if (__151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_134((uint64_t)v13))
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v7, v8, v9, v10, v11, v12);
  else
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v16[5], v8, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

uint64_t __151__SFSpeechURLRecognitionRequest__handlePreRecordedAudioWithAsset_audioTracks_narrowband_addSpeechDataBlock_stopSpeechBlock_cancelSpeechWithErrorBlock___block_invoke_134(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  opaqueCMSampleBuffer *v16;
  OpaqueCMBlockBuffer *DataBuffer;
  size_t DataLength;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v26;
  size_t totalLengthOut;
  char *dataPointerOut;
  _QWORD v29[6];
  _QWORD v30[7];

  v30[6] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v2, &v26);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v26;
  v5 = v4;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 72))
      v6 = 8000;
    else
      v6 = 16000;
    v30[0] = &unk_1E64987B0;
    v7 = *MEMORY[0x1E0C89970];
    v29[0] = *MEMORY[0x1E0C898E0];
    v29[1] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C89930];
    v30[1] = v8;
    v30[2] = &unk_1E64987C8;
    v10 = *MEMORY[0x1E0C898F0];
    v29[2] = v9;
    v29[3] = v10;
    v11 = *MEMORY[0x1E0C89900];
    v30[3] = &unk_1E64987E0;
    v30[4] = MEMORY[0x1E0C9AAA0];
    v12 = *MEMORY[0x1E0C89910];
    v29[4] = v11;
    v29[5] = v12;
    v30[5] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C8AFE8], "assetReaderAudioMixOutputWithAudioTracks:audioSettings:", *(_QWORD *)(a1 + 40), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if ((objc_msgSend(v3, "canAddOutput:", v14) & 1) != 0)
      {
        objc_msgSend(v3, "addOutput:", v14);
        objc_msgSend(v3, "startReading");
        v15 = objc_msgSend(v14, "copyNextSampleBuffer");
        if (v15)
        {
          v16 = (opaqueCMSampleBuffer *)v15;
          do
          {
            if (CMSampleBufferGetNumSamples(v16))
            {
              totalLengthOut = 0;
              dataPointerOut = 0;
              DataBuffer = CMSampleBufferGetDataBuffer(v16);
              if (CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &dataPointerOut))
              {
                DataLength = CMBlockBufferGetDataLength(DataBuffer);
                v19 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", DataLength));
                v20 = CMBlockBufferCopyDataBytes(DataBuffer, 0, DataLength, (void *)objc_msgSend(v19, "mutableBytes"));
                if ((_DWORD)v20)
                {
                  NSLog(CFSTR("CMBlockBufferCopyDataBytes could not copy data: %d"), v20);
                  v21 = 0;
                }
                else
                {
                  v21 = v19;
                }

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", dataPointerOut, totalLengthOut);
                v21 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v21 = 0;
            }
            CFRelease(v16);
            if (v21)
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

            v16 = (opaqueCMSampleBuffer *)objc_msgSend(v14, "copyNextSampleBuffer");
          }
          while (v16);
        }
        v22 = 1;
        goto LABEL_24;
      }
      NSLog(CFSTR("Could not add output for %@"), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 120));
    }
    v22 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v24 = v4;
  v22 = 0;
  v13 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v24;
LABEL_25:

  return v22;
}

uint64_t __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRecordedSpeechSampleData:", a2);
}

uint64_t __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopSpeechWithOptions:", 0);
}

void __104__SFSpeechURLRecognitionRequest__startedConnectionWithLanguageCode_delegate_taskHint_requestIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cancelSpeech");
  objc_msgSend(*(id *)(a1 + 40), "dictationConnection:speechRecordingDidFail:", *(_QWORD *)(a1 + 32), v4);

}

@end
