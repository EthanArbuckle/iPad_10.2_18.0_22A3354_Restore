@implementation SFSpeechRecognitionBlockTask

uint64_t __89___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __68___SFSpeechRecognitionBlockTask__fireResultHandlerWithResult_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
}

void __105___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke(uint64_t *a1)
{
  SFSpeechRecognitionResult *v2;
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(a1[4] + 40), "shouldReportPartialResults"))
  {
    v2 = [SFSpeechRecognitionResult alloc];
    if (v2)
      v3 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:](v2, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", a1[5], a1[6], 0, 0);
    else
      v3 = 0;
    v4 = v3;
    -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](a1[4], v3, 0);

  }
}

uint64_t __87___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), 0, *(void **)(*(_QWORD *)(a1 + 32) + 56));
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __85___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __86___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 216, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v2, 0, v3);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

void __86___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1)
{
  void *v2;
  SFSpeechRecognitionResult *v3;
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shouldReportPartialResults"))
  {
    +[SFUtilities transcriptionsWithTokens:](SFUtilities, "transcriptionsWithTokens:", *(_QWORD *)(a1 + 40));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v5, "copy");
    v3 = [SFSpeechRecognitionResult alloc];
    if (v3)
      v4 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:](v3, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v5, v2, 0, 0);
    else
      v4 = 0;
    -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), v4, 0);

  }
}

void __73___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizePackage___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    if (v3)
      v3 = (_QWORD *)v3[9];
    v4 = v3;
    objc_msgSend(v2, "addEntriesFromDictionary:", v4);

    v11[0] = CFSTR("textNotEmpty");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "bestTranscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formattedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "length") != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("isFinal");
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isFinal"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v10);

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.ResultPackage"), v2);
  }
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
}

uint64_t __80___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __78___SFSpeechRecognitionBlockTask_dictationConnection_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), 0, *(void **)(*(_QWORD *)(a1 + 32) + 56));
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __77___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 216, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v2, 0, v3);

  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

uint64_t __76___SFSpeechRecognitionBlockTask_dictationConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](*(_QWORD *)(a1 + 32), 0, *(void **)(a1 + 40));
  return -[_SFSpeechRecognitionBlockTask _finalizeResultHandler](*(_QWORD *)(a1 + 32));
}

void __92___SFSpeechRecognitionBlockTask__initWithRequest_queue_languageCode_taskHint_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3 || objc_msgSend(v7, "isFinal"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

@end
