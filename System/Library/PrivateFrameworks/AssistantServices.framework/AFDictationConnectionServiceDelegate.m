@implementation AFDictationConnectionServiceDelegate

- (AFDictationConnectionServiceDelegate)initWithDictationConnection:(id)a3
{
  id v4;
  AFDictationConnectionServiceDelegate *v5;
  AFDictationConnectionServiceDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFDictationConnectionServiceDelegate;
  v5 = -[AFDictationConnectionServiceDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_connection, v4);

  return v6;
}

- (void)speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__AFDictationConnectionServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "_dispatchAsync:", v7);

}

- (void)speechRecordingDidBeginWithOptions:(id)a3 sessionUUID:(id)a4 sessionRequestUUID:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  id WeakRetained;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  kdebug_trace();
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("dictationUIInteractionIdentifier");
  objc_msgSend(v8, "interactionIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E3A37708;
  v28[0] = v14;
  v27[1] = CFSTR("speechRecognitionSource");
  v15 = CFSTR("server");
  if (objc_msgSend(v8, "forceOfflineRecognition") && objc_msgSend(v8, "secureOfflineOnly"))
    v15 = CFSTR("local");
  if (v9)
    v16 = v9;
  else
    v16 = &stru_1E3A37708;
  v28[1] = v15;
  v28[2] = v16;
  v27[2] = CFSTR("sessionID");
  v27[3] = CFSTR("sessionRequestUUID");
  if (v10)
    v17 = v10;
  else
    v17 = &stru_1E3A37708;
  v28[3] = v17;
  v27[4] = CFSTR("dictationOptInStatus");
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "siriDataSharingOptInStatus");
  if (v19 > 3)
    v20 = CFSTR("(unknown)");
  else
    v20 = off_1E3A35998[v19];
  v21 = v20;
  v28[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventWithType:context:", 2209, v22);

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__AFDictationConnectionServiceDelegate_speechRecordingDidBeginWithOptions_sessionUUID_sessionRequestUUID___block_invoke;
  v25[3] = &unk_1E3A36FC8;
  v25[4] = self;
  v26 = v8;
  v24 = v8;
  objc_msgSend(WeakRetained, "_dispatchAsync:", v25);

}

- (void)speechRecordingDidEnd
{
  void *v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:", 2211, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__AFDictationConnectionServiceDelegate_speechRecordingDidEnd__block_invoke;
  v6[3] = &unk_1E3A36F30;
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v5, "_dispatchAsync:", v6);

}

- (void)speechRecordingDidCancel
{
  void *v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEventWithType:context:", 2210, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__AFDictationConnectionServiceDelegate_speechRecordingDidCancel__block_invoke;
  v6[3] = &unk_1E3A36F30;
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v5, "_dispatchAsync:", v6);

}

- (void)speechRecordingDidFail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AFAnalyticsContextCreateWithError(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 2212, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__AFDictationConnectionServiceDelegate_speechRecordingDidFail___block_invoke;
  v10[3] = &unk_1E3A36FC8;
  v11 = WeakRetained;
  v12 = v4;
  v8 = v4;
  v9 = WeakRetained;
  objc_msgSend(v9, "_dispatchAsync:", v10);

}

- (void)speechDidRecognizePackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id WeakRetained;
  id v14;
  _QWORD v15[4];
  id v16;
  __CFString *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "recognition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke;
  v15[3] = &unk_1E3A30030;
  v16 = v6;
  v17 = &stru_1E3A37708;
  v18 = 0;
  v9 = v6;
  objc_msgSend(v7, "logEventWithType:contextProvider:", 2213, v15);

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke_2;
  v12[3] = &unk_1E3A36FC8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v14 = v4;
  v10 = v4;
  v11 = WeakRetained;
  objc_msgSend(v11, "_dispatchAsync:", v12);

}

- (void)speechDidRecognizeFinalResultCandidatePackage:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__AFDictationConnectionServiceDelegate_speechDidRecognizeFinalResultCandidatePackage___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  objc_msgSend(v7, "_dispatchAsync:", v8);

}

- (void)speechDidRecognizeVoiceCommandCandidatePackage:(id)a3 nluResult:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__AFDictationConnectionServiceDelegate_speechDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke;
  v12[3] = &unk_1E3A36B90;
  v13 = WeakRetained;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = WeakRetained;
  objc_msgSend(v11, "_dispatchAsync:", v12);

}

- (void)speechDidRecognizePhrases:(id)a3 rawPhrases:(id)a4 utterances:(id)a5 rawUtterances:(id)a6 nluResult:(id)a7 usingSpeechModel:(id)a8 correctionContext:(id)a9 audioAnalytics:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id WeakRetained;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;

  v15 = a3;
  v37 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke;
  v48[3] = &unk_1E3A30030;
  v24 = v15;
  v49 = v24;
  v25 = v19;
  v50 = v25;
  v26 = v20;
  v51 = v26;
  objc_msgSend(v22, "logEventWithType:contextProvider:", 2213, v48);

  v38[0] = v23;
  v38[1] = 3221225472;
  v38[2] = __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke_2;
  v38[3] = &unk_1E3A2FFE0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v40 = v24;
  v41 = v37;
  v42 = v16;
  v43 = v17;
  v44 = v18;
  v45 = v25;
  v46 = v26;
  v47 = v21;
  v27 = v21;
  v28 = v26;
  v29 = v25;
  v30 = v18;
  v31 = v17;
  v32 = v16;
  v33 = v37;
  v34 = v24;
  v35 = WeakRetained;
  objc_msgSend(v35, "_dispatchAsync:", v38);

}

- (void)speechDidRecognizeTokens:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id WeakRetained;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke;
  v24[3] = &unk_1E3A30058;
  v13 = v8;
  v25 = v13;
  v14 = v10;
  v26 = v14;
  objc_msgSend(v11, "logEventWithType:contextProvider:", 2214, v24);

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke_2;
  v19[3] = &unk_1E3A369B8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v21 = v13;
  v22 = v9;
  v23 = v14;
  v15 = v14;
  v16 = v9;
  v17 = v13;
  v18 = WeakRetained;
  objc_msgSend(v18, "_dispatchAsync:", v19);

}

- (void)speechDidRecognizePartialPackage:(id)a3 nluResult:(id)a4 usingSpeechModel:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id WeakRetained;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke;
  v24[3] = &unk_1E3A30058;
  v13 = v8;
  v25 = v13;
  v14 = v10;
  v26 = v14;
  objc_msgSend(v11, "logEventWithType:contextProvider:", 2214, v24);

  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke_2;
  v19[3] = &unk_1E3A369B8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v21 = v13;
  v22 = v9;
  v23 = v14;
  v15 = v14;
  v16 = v9;
  v17 = v13;
  v18 = WeakRetained;
  objc_msgSend(v18, "_dispatchAsync:", v19);

}

- (void)speechDidRecognizePartialResult:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AFDictationConnectionServiceDelegate_speechDidRecognizePartialResult___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  objc_msgSend(v7, "_dispatchAsync:", v8);

}

- (void)speechDidProcessAudioDuration:(double)a3
{
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  double v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__AFDictationConnectionServiceDelegate_speechDidProcessAudioDuration___block_invoke;
  v6[3] = &unk_1E3A353C0;
  v7 = WeakRetained;
  v8 = a3;
  v5 = WeakRetained;
  objc_msgSend(v5, "_dispatchAsync:", v6);

}

- (void)speechDidRecognizeTranscriptionObjects:(id)a3 usingSpeechModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id WeakRetained;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke;
  v19[3] = &unk_1E3A30058;
  v10 = v6;
  v20 = v10;
  v11 = v7;
  v21 = v11;
  objc_msgSend(v8, "logEventWithType:contextProvider:", 2215, v19);

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke_2;
  v15[3] = &unk_1E3A36B90;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = WeakRetained;
  objc_msgSend(v14, "_dispatchAsync:", v15);

}

- (void)speechRecognitionDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  +[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    AFAnalyticsContextCreateWithError(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEventWithType:context:", 2217, v7);

  }
  else
  {
    objc_msgSend(v5, "logEventWithType:context:", 2216, 0);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__AFDictationConnectionServiceDelegate_speechRecognitionDidFinishWithError___block_invoke;
  v11[3] = &unk_1E3A36FC8;
  v12 = WeakRetained;
  v13 = v4;
  v9 = v4;
  v10 = WeakRetained;
  objc_msgSend(v10, "_dispatchAsync:", v11);

}

- (void)speechDidFinishWritingAudioFile:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__AFDictationConnectionServiceDelegate_speechDidFinishWritingAudioFile_error___block_invoke;
  v12[3] = &unk_1E3A36B90;
  v13 = WeakRetained;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = WeakRetained;
  objc_msgSend(v11, "_dispatchAsync:", v12);

}

- (void)speechDidReceiveSearchResults:(id)a3 recognitionText:(id)a4 stable:(BOOL)a5 final:(BOOL)a6
{
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__AFDictationConnectionServiceDelegate_speechDidReceiveSearchResults_recognitionText_stable_final___block_invoke;
  v16[3] = &unk_1E3A2FF40;
  v17 = WeakRetained;
  v18 = v10;
  v19 = v11;
  v20 = a5;
  v21 = a6;
  v13 = v11;
  v14 = v10;
  v15 = WeakRetained;
  objc_msgSend(v15, "_dispatchAsync:", v16);

}

- (void)speechDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__AFDictationConnectionServiceDelegate_speechDidDetectLanguage_confidenceScores_isConfident___block_invoke;
  v14[3] = &unk_1E3A30080;
  v15 = WeakRetained;
  v16 = v8;
  v17 = v9;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  v13 = WeakRetained;
  objc_msgSend(v13, "_dispatchAsync:", v14);

}

- (void)speechDidRecognizeMultilingualSpeech:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__AFDictationConnectionServiceDelegate_speechDidRecognizeMultilingualSpeech___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  objc_msgSend(v7, "_dispatchAsync:", v8);

}

- (void)languageDetectorFailedWithError:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AFDictationConnectionServiceDelegate_languageDetectorFailedWithError___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  objc_msgSend(v7, "_dispatchAsync:", v8);

}

- (void)speechDidBeginLocalRecognitionWithModelInfo:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__AFDictationConnectionServiceDelegate_speechDidBeginLocalRecognitionWithModelInfo___block_invoke;
  v8[3] = &unk_1E3A36FC8;
  v9 = WeakRetained;
  v10 = v4;
  v6 = v4;
  v7 = WeakRetained;
  objc_msgSend(v7, "_dispatchAsync:", v8);

}

- (void)speechDidPauseRecognition
{
  id WeakRetained;
  id v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__AFDictationConnectionServiceDelegate_speechDidPauseRecognition__block_invoke;
  v4[3] = &unk_1E3A36F30;
  v5 = WeakRetained;
  v3 = WeakRetained;
  objc_msgSend(v3, "_dispatchAsync:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

uint64_t __65__AFDictationConnectionServiceDelegate_speechDidPauseRecognition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidPauseRecognition");
}

uint64_t __84__AFDictationConnectionServiceDelegate_speechDidBeginLocalRecognitionWithModelInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidBeginLocalRecognitionWithModelInfo:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__AFDictationConnectionServiceDelegate_languageDetectorFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateLanguageDetectorDidFail:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__AFDictationConnectionServiceDelegate_speechDidRecognizeMultilingualSpeech___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateMultilingualSpeechRecognized:", *(_QWORD *)(a1 + 40));
}

uint64_t __93__AFDictationConnectionServiceDelegate_speechDidDetectLanguage_confidenceScores_isConfident___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateLanguageDetected:confidenceScores:isConfident:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __99__AFDictationConnectionServiceDelegate_speechDidReceiveSearchResults_recognitionText_stable_final___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateSearchResultsReceived:recognitionText:stable:final:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
}

uint64_t __78__AFDictationConnectionServiceDelegate_speechDidFinishWritingAudioFile_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateAudioFileFinished:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76__AFDictationConnectionServiceDelegate_speechRecognitionDidFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  v2 = *(void **)(a1 + 40);
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateSpeechRecognitionDidSucceed");
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("kAFAssistantErrorDomain")))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "code") == 34)
    {

LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 0);
      return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateRecognitionDidFail:", *(_QWORD *)(a1 + 40));
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "code");

    if (v5 == 1700)
      goto LABEL_8;
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateRecognitionDidFail:", *(_QWORD *)(a1 + 40));
}

id __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("transcribedObjectsCount"));

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageModel"));
  return v2;
}

uint64_t __96__AFDictationConnectionServiceDelegate_speechDidRecognizeTranscriptionObjects_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizeTranscriptionObjects:languageModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__AFDictationConnectionServiceDelegate_speechDidProcessAudioDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extendRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidProcessAudioDuration:", *(double *)(a1 + 40));
}

uint64_t __72__AFDictationConnectionServiceDelegate_speechDidRecognizePartialResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extendRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizePartialResult:", *(_QWORD *)(a1 + 40));
}

id __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "recognition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneBestTokenList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("tokensCount"));

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("languageModel"));

  return v2;
}

uint64_t __100__AFDictationConnectionServiceDelegate_speechDidRecognizePartialPackage_nluResult_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extendRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizePartialSpeechPackage:nluResult:languageModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("tokensCount"));

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageModel"));
  return v2;
}

uint64_t __92__AFDictationConnectionServiceDelegate_speechDidRecognizeTokens_nluResult_usingSpeechModel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_extendRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizeSpeechTokens:nluResult:languageModel:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("phrasesCount"));

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageModel"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("correctionContext"));
  return v2;
}

uint64_t __162__AFDictationConnectionServiceDelegate_speechDidRecognizePhrases_rawPhrases_utterances_rawUtterances_nluResult_usingSpeechModel_correctionContext_audioAnalytics___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizeSpeechPhrases:rawPhrases:utterances:rawUtterances:nluResult:languageModel:correctionIdentifier:audioAnalytics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
}

uint64_t __97__AFDictationConnectionServiceDelegate_speechDidRecognizeVoiceCommandCandidatePackage_nluResult___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizeVoiceCommandCandidatePackage:nluResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __86__AFDictationConnectionServiceDelegate_speechDidRecognizeFinalResultCandidatePackage___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizeFinalResultCandidatePackage:", *(_QWORD *)(a1 + 40));
}

id __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("phrasesCount"));

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("languageModel"));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("correctionContext"));
  return v2;
}

uint64_t __66__AFDictationConnectionServiceDelegate_speechDidRecognizePackage___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestTimeout");
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateDidRecognizePackage:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__AFDictationConnectionServiceDelegate_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateRecordingDidFail:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__AFDictationConnectionServiceDelegate_speechRecordingDidCancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateRecordingDidCancel");
}

uint64_t __61__AFDictationConnectionServiceDelegate_speechRecordingDidEnd__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_scheduleRequestTimeout");
  objc_msgSend(*(id *)(a1 + 32), "_checkAndSetIsCapturingSpeech:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_tellSpeechDelegateRecordingDidEnd");
}

void __106__AFDictationConnectionServiceDelegate_speechRecordingDidBeginWithOptions_sessionUUID_sessionRequestUUID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_tellSpeechDelegateRecordingDidBeginWithOptions:", *(_QWORD *)(a1 + 40));

}

void __94__AFDictationConnectionServiceDelegate_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_startInputAudioPowerUpdatesWithXPCWrapper:", *(_QWORD *)(a1 + 40));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "_tellSpeechDelegateRecordingWillBegin");

}

@end
