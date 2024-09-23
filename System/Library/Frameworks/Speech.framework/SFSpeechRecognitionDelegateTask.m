@implementation SFSpeechRecognitionDelegateTask

void __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke_2;
    v8[3] = &unk_1E6485450;
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v5;
    v11 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v3, "addOperationWithBlock:", v8);

  }
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 88), 0);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = 0;

}

uint64_t __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didFinishSuccessfully:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke_2;
  v6[3] = &unk_1E6485428;
  v7 = WeakRetained;
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 40);
  v5 = WeakRetained;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

uint64_t __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didProcessAudioDuration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

void __86___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionDelegateTask _handleDidFinishRecognition:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v2 + 112) && !*(_BYTE *)(v2 + 113))
    {
      v3 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "bestTranscription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "formattedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "speechRecognitionTask:didReceiveSearchResults:recognizedText:stable:final:", v2, MEMORY[0x1E0C9AA70], v5, 1, 1);

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didFinishRecognition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(v6 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke_2;
  block[3] = &unk_1E6486328;
  block[4] = v6;
  dispatch_async(v7, block);
}

uint64_t __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 1;
  return result;
}

void __108___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke(uint64_t a1)
{
  -[_SFSpeechRecognitionDelegateTask _handleDidRecognizePartialResult:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __69___SFSpeechRecognitionDelegateTask__handleDidRecognizePartialResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didHypothesizeTranscription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0 && !*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "formattedString");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "speechRecognitionTask:didReceiveSearchResults:recognizedText:stable:final:", v3, MEMORY[0x1E0C9AA70], v4, 1, 0);

  }
}

void __67___SFSpeechRecognitionDelegateTask__handleSpeechRecordingDidCancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  objc_msgSend(WeakRetained, "speechRecognitionTaskWasCancelled:", *(_QWORD *)(a1 + 32));

}

void __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _SFSearchResult *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  __int16 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = WeakRetained;
    v21 = v2;
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v33;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v5);
          v10 = -[_SFSearchResult initWithVoiceSearchResult:]([_SFSearchResult alloc], "initWithVoiceSearchResult:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v9));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_SFSearchResult searchType](v10, "searchType"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v10, v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v7);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 113) = 1;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_2;
    v26[3] = &unk_1E64854A0;
    WeakRetained = v20;
    v12 = v20;
    v13 = *(_QWORD *)(a1 + 32);
    v27 = v12;
    v28 = v13;
    v29 = v4;
    v30 = *(id *)(a1 + 48);
    v31 = *(_WORD *)(a1 + 56);
    v14 = v4;
    v2 = v21;
    objc_msgSend(v21, "addOperationWithBlock:", v26);

  }
  if (*(_BYTE *)(a1 + 57))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    if (v15)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_3;
        v22[3] = &unk_1E6485CE0;
        v16 = WeakRetained;
        v17 = *(_QWORD *)(a1 + 32);
        v23 = v16;
        v24 = v17;
        v25 = v15;
        objc_msgSend(v2, "addOperationWithBlock:", v22);

      }
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 96);
      *(_QWORD *)(v18 + 96) = 0;

    }
    -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:](*(_QWORD *)(a1 + 32), 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;

  }
}

uint64_t __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didReceiveSearchResults:recognizedText:stable:final:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
}

uint64_t __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTask:didFinishRecognition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __89___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1)
{
  id v2;

  +[SFUtilities transcriptionsWithTokens:](SFUtilities, "transcriptionsWithTokens:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFSpeechRecognitionDelegateTask _handleDidRecognizePartialResult:](*(_QWORD *)(a1 + 40), v2);

}

void __76___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizePackage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  +[SFUtilities recognizedResultFromPackage:](SFUtilities, "recognizedResultFromPackage:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 40);
    if (v4)
      v4 = (_QWORD *)v4[9];
    v5 = v4;
    objc_msgSend(v3, "addEntriesFromDictionary:", v5);

    v12[0] = CFSTR("textNotEmpty");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "bestTranscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v8, "length") != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("isFinal");
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isFinal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addEntriesFromDictionary:", v11);

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.ResultPackage"), v3);
  }
  -[_SFSpeechRecognitionDelegateTask _handleDidFinishRecognition:](*(_QWORD *)(a1 + 40), v2);

}

uint64_t __77___SFSpeechRecognitionDelegateTask_dictationConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechRecognitionTaskFinishedReadingAudio:", *(_QWORD *)(a1 + 40));
}

@end
