@implementation LSRUtilities

+ (id)transcriptionsWithEARTokens:(id)a3
{
  void *v3;
  void *v4;

  AFTokensForEARTokens(a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFUtilities transcriptionsWithTokens:](SFUtilities, "transcriptionsWithTokens:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recognizedResultFromEARPackage:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  objc_msgSend(v32, "audioAnalytics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "acousticFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x1E0CFEA18]);
        objc_msgSend(v11, "acousticFeatureValuePerFrame");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "frameDuration");
        v14 = (void *)objc_msgSend(v12, "initWithAcousticFeatureValue:frameDuration:", v13);

        objc_msgSend(v4, "setValue:forKey:", v14, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v30, "speechRecognitionFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CFEA20]);
  objc_msgSend(v30, "snr");
  v17 = (void *)objc_msgSend(v16, "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", v15, v4);

  objc_msgSend(v32, "recognition");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "tokenSausage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "interpretationIndices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AFPhrasesAndUtterancesForEARSausage(v18, (uint64_t)v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "utteranceStart");
  +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "utteranceStart");
  +[SFUtilities recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "recognitionMetadataFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v20, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "preITNRecognition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tokenSausage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "interpretationIndices");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  AFPhrasesAndUtterancesForEARSausage(v24, (uint64_t)v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "utteranceStart");
  +[SFUtilities transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:](SFUtilities, "transcriptionFromSpeechPhrases:afAudioAnalytics:utteranceStart:", v26, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:]([SFSpeechRecognitionResult alloc], "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v21, v27, objc_msgSend(v32, "isFinal"), v22);

  return v28;
}

+ (id)emptyResultWithIsFinal:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F170]), "initWithTokenName:start:end:silenceStart:confidence:hasSpaceAfter:hasSpaceBefore:phoneSequence:ipaPhoneSequence:", &stru_1E6486C88, 0, 0, &stru_1E6486C88, &stru_1E6486C88, 0.0, 0.0, 0.0, 0.0);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[LSRUtilities transcriptionsWithEARTokens:](LSRUtilities, "transcriptionsWithEARTokens:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SFSpeechRecognitionResult _initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:]([SFSpeechRecognitionResult alloc], "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v6, v6, v3, 0);

  return v7;
}

@end
