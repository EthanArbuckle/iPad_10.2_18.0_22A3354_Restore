@implementation CESRSpeechParameters

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 maximumRecognitionDuration:(double)a22 endpointStart:(double)a23 inputOrigin:(id)a24 location:(id)a25 jitGrammar:(id)a26 deliverEagerPackage:(BOOL)a27 disableDeliveringAsrFeatures:(BOOL)a28
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  BYTE4(v31) = 0;
  LODWORD(v31) = __PAIR16__(a28, a27);
  LOBYTE(v30) = 0;
  HIWORD(v29) = __PAIR16__(a21, a20);
  WORD2(v29) = __PAIR16__(a19, a18);
  WORD1(v29) = __PAIR16__(a17, a16);
  LOWORD(v29) = __PAIR16__(a15, a14);
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a22, a23, a9, a10, a11, a12,
           a13,
           v29,
           v30,
           a24,
           a25,
           a26,
           v31,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 interactionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29
{
  __int128 v30;
  uint64_t v31;

  BYTE4(v31) = 0;
  LODWORD(v31) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v30 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v30 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v30 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v30 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v30) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v30,
           a25,
           a26,
           a27,
           v31,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32
{
  __int128 v33;
  uint64_t v34;

  BYTE4(v34) = 0;
  WORD1(v34) = __PAIR16__(a32, a31);
  LOWORD(v34) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v33 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v33 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v33 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v33 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v33) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v33,
           a25,
           a26,
           a27,
           v34,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32
{
  __int128 v33;
  uint64_t v34;

  *(_WORD *)((char *)&v34 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v34 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v34) = a28;
  *(_WORD *)((char *)&v33 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v33 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v33 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v33 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v33) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v33,
           a25,
           a26,
           a27,
           v34,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 sharedUserIds:(id)a30 enableEmojiRecognition:(BOOL)a31 enableAutoPunctuation:(BOOL)a32 enableVoiceCommands:(BOOL)a33
{
  __int128 v34;
  uint64_t v35;

  *(_WORD *)((char *)&v35 + 3) = __PAIR16__(a33, a32);
  BYTE2(v35) = a31;
  LOWORD(v35) = __PAIR16__(a29, a28);
  *(_WORD *)((char *)&v34 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v34 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v34 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v34 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v34) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a23, a24, a9, a10, a11, a12,
           a13,
           v34,
           a25,
           a26,
           a27,
           v35,
           0,
           0,
           0,
           0,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37
{
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:", a3, a4, a5, a6, a7, a8, a23, a24, 0.0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38
{
  __int128 v39;
  uint64_t v40;
  uint64_t v41;

  LOBYTE(v41) = 0;
  *(_WORD *)((char *)&v40 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v40) = a28;
  *(_WORD *)((char *)&v39 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v39 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v39 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v39 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v39) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:", a3, a4, a5, a6, a7, a8, a23, a24, a38, a9, a10, a11,
           a12,
           a13,
           v39,
           a25,
           a26,
           a27,
           v40,
           a33,
           a34,
           a35,
           a36,
           a37,
           v41);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39
{
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  LOBYTE(v42) = a39;
  *(_WORD *)((char *)&v41 + 3) = __PAIR16__(a32, a31);
  *(_WORD *)((char *)&v41 + 1) = __PAIR16__(a30, a29);
  LOBYTE(v41) = a28;
  *(_WORD *)((char *)&v40 + 7) = __PAIR16__(a22, a21);
  *(_WORD *)((char *)&v40 + 5) = __PAIR16__(a20, a19);
  *(_WORD *)((char *)&v40 + 3) = __PAIR16__(a18, a17);
  *(_WORD *)((char *)&v40 + 1) = __PAIR16__(a16, a15);
  LOBYTE(v40) = a14;
  return -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", a3, a4, a5, a6, a7, a8, a23, a24, a38, a9, a10, a11,
           a12,
           a13,
           v40,
           a25,
           a26,
           a27,
           v41,
           a33,
           a34,
           a35,
           a36,
           a37,
           v42,
           0);
}

- (CESRSpeechParameters)initWithLanguage:(id)a3 requestIdentifier:(id)a4 dictationUIInteractionIdentifier:(id)a5 task:(id)a6 loggingContext:(id)a7 applicationName:(id)a8 profile:(id)a9 overrides:(id)a10 modelOverrideURL:(id)a11 originalAudioFileURL:(id)a12 codec:(id)a13 narrowband:(BOOL)a14 detectUtterances:(BOOL)a15 censorSpeech:(BOOL)a16 farField:(BOOL)a17 secureOfflineOnly:(BOOL)a18 shouldStoreAudioOnDevice:(BOOL)a19 continuousListening:(BOOL)a20 shouldHandleCapitalization:(BOOL)a21 isSpeechAPIRequest:(BOOL)a22 maximumRecognitionDuration:(double)a23 endpointStart:(double)a24 inputOrigin:(id)a25 location:(id)a26 jitGrammar:(id)a27 deliverEagerPackage:(BOOL)a28 disableDeliveringAsrFeatures:(BOOL)a29 enableEmojiRecognition:(BOOL)a30 enableAutoPunctuation:(BOOL)a31 enableVoiceCommands:(BOOL)a32 sharedUserInfos:(id)a33 prefixText:(id)a34 postfixText:(id)a35 selectedText:(id)a36 powerContext:(id)a37 recognitionStart:(double)a38 shouldGenerateVoiceCommandCandidates:(BOOL)a39 asrId:(id)a40
{
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  CESRSpeechParameters *v57;
  uint64_t v58;
  NSString *language;
  uint64_t v60;
  NSString *requestIdentifier;
  uint64_t v62;
  NSString *dictationUIInteractionIdentifier;
  uint64_t v64;
  NSString *task;
  uint64_t v66;
  NSArray *loggingContext;
  uint64_t v68;
  NSString *applicationName;
  uint64_t v70;
  NSData *profile;
  uint64_t v72;
  NSDictionary *overrides;
  uint64_t v74;
  NSURL *modelOverrideURL;
  uint64_t v76;
  NSURL *originalAudioFileURL;
  uint64_t v78;
  NSString *codec;
  uint64_t v80;
  NSString *inputOrigin;
  uint64_t v82;
  CLLocation *location;
  uint64_t v84;
  NSArray *jitGrammar;
  uint64_t v86;
  NSArray *sharedUserInfos;
  uint64_t v88;
  NSString *prefixText;
  uint64_t v90;
  NSString *postfixText;
  uint64_t v92;
  NSString *selectedText;
  uint64_t v94;
  AFPowerContextPolicy *powerContext;
  uint64_t v96;
  NSUUID *asrId;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  objc_super v111;

  v110 = a3;
  v109 = a4;
  v108 = a5;
  v107 = a6;
  v106 = a7;
  v105 = a8;
  v104 = a9;
  v103 = a10;
  v102 = a11;
  v101 = a12;
  v100 = a13;
  v48 = a25;
  v49 = a26;
  v50 = a27;
  v51 = a33;
  v52 = a34;
  v53 = a35;
  v54 = a36;
  v55 = a37;
  v56 = a40;
  v111.receiver = self;
  v111.super_class = (Class)CESRSpeechParameters;
  v57 = -[CESRSpeechParameters init](&v111, sel_init);
  if (v57)
  {
    v58 = objc_msgSend(v110, "copy");
    language = v57->_language;
    v57->_language = (NSString *)v58;

    v60 = objc_msgSend(v109, "copy");
    requestIdentifier = v57->_requestIdentifier;
    v57->_requestIdentifier = (NSString *)v60;

    v62 = objc_msgSend(v108, "copy");
    dictationUIInteractionIdentifier = v57->_dictationUIInteractionIdentifier;
    v57->_dictationUIInteractionIdentifier = (NSString *)v62;

    v64 = objc_msgSend(v107, "copy");
    task = v57->_task;
    v57->_task = (NSString *)v64;

    v66 = objc_msgSend(v106, "copy");
    loggingContext = v57->_loggingContext;
    v57->_loggingContext = (NSArray *)v66;

    v68 = objc_msgSend(v105, "copy");
    applicationName = v57->_applicationName;
    v57->_applicationName = (NSString *)v68;

    v70 = objc_msgSend(v104, "copy");
    profile = v57->_profile;
    v57->_profile = (NSData *)v70;

    v72 = objc_msgSend(v103, "copy");
    overrides = v57->_overrides;
    v57->_overrides = (NSDictionary *)v72;

    v74 = objc_msgSend(v102, "copy");
    modelOverrideURL = v57->_modelOverrideURL;
    v57->_modelOverrideURL = (NSURL *)v74;

    v76 = objc_msgSend(v101, "copy");
    originalAudioFileURL = v57->_originalAudioFileURL;
    v57->_originalAudioFileURL = (NSURL *)v76;

    v78 = objc_msgSend(v100, "copy");
    codec = v57->_codec;
    v57->_codec = (NSString *)v78;

    v57->_narrowband = a14;
    v57->_detectUtterances = a15;
    v57->_censorSpeech = a16;
    v57->_farField = a17;
    v57->_secureOfflineOnly = a18;
    v57->_shouldStoreAudioOnDevice = a19;
    v57->_continuousListening = a20;
    v57->_shouldHandleCapitalization = a21;
    v57->_isSpeechAPIRequest = a22;
    v57->_maximumRecognitionDuration = a23;
    v57->_endpointStart = a24;
    v80 = objc_msgSend(v48, "copy");
    inputOrigin = v57->_inputOrigin;
    v57->_inputOrigin = (NSString *)v80;

    v82 = objc_msgSend(v49, "copy");
    location = v57->_location;
    v57->_location = (CLLocation *)v82;

    v84 = objc_msgSend(v50, "copy");
    jitGrammar = v57->_jitGrammar;
    v57->_jitGrammar = (NSArray *)v84;

    v57->_deliverEagerPackage = a28;
    v57->_disableDeliveringAsrFeatures = a29;
    v57->_enableEmojiRecognition = a30;
    v57->_enableAutoPunctuation = a31;
    v57->_enableVoiceCommands = a32;
    v86 = objc_msgSend(v51, "copy");
    sharedUserInfos = v57->_sharedUserInfos;
    v57->_sharedUserInfos = (NSArray *)v86;

    v88 = objc_msgSend(v52, "copy");
    prefixText = v57->_prefixText;
    v57->_prefixText = (NSString *)v88;

    v90 = objc_msgSend(v53, "copy");
    postfixText = v57->_postfixText;
    v57->_postfixText = (NSString *)v90;

    v92 = objc_msgSend(v54, "copy");
    selectedText = v57->_selectedText;
    v57->_selectedText = (NSString *)v92;

    v94 = objc_msgSend(v55, "copy");
    powerContext = v57->_powerContext;
    v57->_powerContext = (AFPowerContextPolicy *)v94;

    v57->_recognitionStart = a38;
    v57->_shouldGenerateVoiceCommandCandidates = a39;
    v96 = objc_msgSend(v56, "copy");
    asrId = v57->_asrId;
    v57->_asrId = (NSUUID *)v96;

  }
  return v57;
}

- (id)description
{
  return -[CESRSpeechParameters _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  id v24;
  const __CFString *v25;
  id v26;
  const __CFString *v27;
  id v28;
  const __CFString *v29;
  id v30;
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  id v39;
  const __CFString *v40;
  id v41;
  const __CFString *v42;
  id v43;
  const __CFString *v44;
  id v45;
  const __CFString *v46;
  id v47;
  id v48;
  const __CFString *v49;
  id v50;
  const __CFString *v51;
  id v52;
  const __CFString *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  objc_super v122;
  _QWORD v123[40];

  v123[38] = *MEMORY[0x1E0C80C00];
  v105 = objc_alloc(MEMORY[0x1E0CB3940]);
  v122.receiver = self;
  v122.super_class = (Class)CESRSpeechParameters;
  -[CESRSpeechParameters description](&v122, sel_description);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_language, "description");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("language = %@"), v120);
  v123[0] = v119;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_requestIdentifier, "description");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("requestIdentifier = %@"), v118);
  v123[1] = v117;
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_dictationUIInteractionIdentifier, "description");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("dictationUIInteractionIdentifier = %@"), v116);
  v123[2] = v115;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_task, "description");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("task = %@"), v114);
  v123[3] = v113;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSArray description](self->_loggingContext, "description");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("loggingContext = %@"), v112);
  v123[4] = v111;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_applicationName, "description");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("applicationName = %@"), v110);
  v123[5] = v109;
  v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("profile = (%ld bytes)"), -[NSData length](self->_profile, "length"));
  v123[6] = v108;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSDictionary description](self->_overrides, "description");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("overrides = %@"), v107);
  v123[7] = v104;
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL description](self->_modelOverrideURL, "description");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("modelOverrideURL = %@"), v103);
  v123[8] = v102;
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSURL description](self->_originalAudioFileURL, "description");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("originalAudioFileURL = %@"), v101);
  v123[9] = v100;
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_codec, "description");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("codec = %@"), v99);
  v123[10] = v98;
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_narrowband)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v97 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("narrowband = %@"), v15);
  v123[11] = v97;
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_detectUtterances)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v96 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("detectUtterances = %@"), v17);
  v123[12] = v96;
  v18 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_censorSpeech)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v95 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("censorSpeech = %@"), v19);
  v123[13] = v95;
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_farField)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v94 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("farField = %@"), v21);
  v123[14] = v94;
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_secureOfflineOnly)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  v93 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("secureOfflineOnly = %@"), v23);
  v123[15] = v93;
  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_shouldStoreAudioOnDevice)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v92 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("shouldStoreAudioOnDevice = %@"), v25);
  v123[16] = v92;
  v26 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_continuousListening)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  v91 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("continuousListening = %@"), v27);
  v123[17] = v91;
  v28 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_shouldHandleCapitalization)
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  v90 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("shouldHandleCapitalization = %@"), v29);
  v123[18] = v90;
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_isSpeechAPIRequest)
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v89 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("isSpeechAPIRequest = %@"), v31);
  v123[19] = v89;
  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumRecognitionDuration);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("maximumRecognitionDuration = %@"), v88);
  v123[20] = v87;
  v33 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endpointStart);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("endpointStart = %@"), v86);
  v123[21] = v85;
  v34 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSString description](self->_inputOrigin, "description");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("inputOrigin = %@"), v84);
  v123[22] = v83;
  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CLLocation description](self->_location, "description");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("location = %@"), v82);
  v123[23] = v81;
  v36 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSArray description](self->_jitGrammar, "description");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("jitGrammar = %@"), v80);
  v123[24] = v79;
  v37 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_deliverEagerPackage)
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  v78 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("deliverEagerPackage = %@"), v38);
  v123[25] = v78;
  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_disableDeliveringAsrFeatures)
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  v77 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("disableDeliveringAsrFeatures = %@"), v40);
  v123[26] = v77;
  v41 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_enableEmojiRecognition)
    v42 = CFSTR("YES");
  else
    v42 = CFSTR("NO");
  v76 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("enableEmojiRecognition = %@"), v42);
  v123[27] = v76;
  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_enableAutoPunctuation)
    v44 = CFSTR("YES");
  else
    v44 = CFSTR("NO");
  v75 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("enableAutoPunctuation = %@"), v44);
  v123[28] = v75;
  v45 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_enableVoiceCommands)
    v46 = CFSTR("YES");
  else
    v46 = CFSTR("NO");
  v74 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("enableVoiceCommands = %@"), v46);
  v123[29] = v74;
  v47 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSArray description](self->_sharedUserInfos, "description");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("sharedUserInfos = %@"), v73);
  v123[30] = v72;
  v48 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_prefixText)
    v49 = CFSTR("REDACTED");
  else
    v49 = 0;
  v71 = (void *)objc_msgSend(v48, "initWithFormat:", CFSTR("prefixText = %@"), v49);
  v123[31] = v71;
  v50 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_postfixText)
    v51 = CFSTR("REDACTED");
  else
    v51 = 0;
  v70 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("postfixText = %@"), v51);
  v123[32] = v70;
  v52 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_selectedText)
    v53 = CFSTR("REDACTED");
  else
    v53 = 0;
  v54 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("selectedText = %@"), v53);
  v123[33] = v54;
  v55 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[AFPowerContextPolicy description](self->_powerContext, "description");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("powerContext = %@"), v56);
  v123[34] = v57;
  v58 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recognitionStart);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v58, "initWithFormat:", CFSTR("recognitionStart = %@"), v59);
  v123[35] = v60;
  v61 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_shouldGenerateVoiceCommandCandidates)
    v62 = CFSTR("YES");
  else
    v62 = CFSTR("NO");
  v63 = (void *)objc_msgSend(v61, "initWithFormat:", CFSTR("shouldGenerateVoiceCommandCandidates = %@"), v62);
  v123[36] = v63;
  v64 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NSUUID description](self->_asrId, "description");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v64, "initWithFormat:", CFSTR("asrId = %@"), v65);
  v123[37] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 38);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "componentsJoinedByString:", CFSTR(", "));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (id)objc_msgSend(v105, "initWithFormat:", CFSTR("%@ {%@}"), v121, v68);

  return v106;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_requestIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_dictationUIInteractionIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_task, "hash");
  v7 = -[NSArray hash](self->_loggingContext, "hash");
  v8 = v7 ^ -[NSString hash](self->_applicationName, "hash");
  v9 = v6 ^ v8 ^ -[NSData hash](self->_profile, "hash");
  v10 = -[NSDictionary hash](self->_overrides, "hash");
  v11 = v10 ^ -[NSURL hash](self->_modelOverrideURL, "hash");
  v12 = v11 ^ -[NSURL hash](self->_originalAudioFileURL, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_codec, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_narrowband);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v59, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_detectUtterances);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 ^ objc_msgSend(v58, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_censorSpeech);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13 ^ v15 ^ objc_msgSend(v57, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_farField);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v56, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureOfflineOnly);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 ^ objc_msgSend(v55, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldStoreAudioOnDevice);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 ^ objc_msgSend(v54, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_continuousListening);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16 ^ v19 ^ objc_msgSend(v53, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldHandleCapitalization);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v52, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeechAPIRequest);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 ^ objc_msgSend(v51, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumRecognitionDuration);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 ^ objc_msgSend(v50, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endpointStart);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 ^ objc_msgSend(v49, "hash");
  v25 = v20 ^ v24 ^ -[NSString hash](self->_inputOrigin, "hash");
  v26 = -[CLLocation hash](self->_location, "hash");
  v27 = v26 ^ -[NSArray hash](self->_jitGrammar, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deliverEagerPackage);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableDeliveringAsrFeatures);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29 ^ objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableEmojiRecognition);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31 ^ objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableAutoPunctuation);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33 ^ objc_msgSend(v34, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableVoiceCommands);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v25 ^ v35 ^ objc_msgSend(v36, "hash");
  v38 = -[NSArray hash](self->_sharedUserInfos, "hash");
  v39 = v38 ^ -[NSString hash](self->_prefixText, "hash");
  v40 = v39 ^ -[NSString hash](self->_postfixText, "hash");
  v41 = v40 ^ -[NSString hash](self->_selectedText, "hash");
  v42 = v41 ^ -[AFPowerContextPolicy hash](self->_powerContext, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recognitionStart);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v42 ^ objc_msgSend(v43, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateVoiceCommandCandidates);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44 ^ objc_msgSend(v45, "hash");
  v47 = v37 ^ v46 ^ -[NSUUID hash](self->_asrId, "hash");

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  CESRSpeechParameters *v4;
  CESRSpeechParameters *v5;
  _BOOL4 narrowband;
  _BOOL4 detectUtterances;
  _BOOL4 censorSpeech;
  _BOOL4 farField;
  _BOOL4 secureOfflineOnly;
  _BOOL4 shouldStoreAudioOnDevice;
  _BOOL4 continuousListening;
  _BOOL4 shouldHandleCapitalization;
  _BOOL4 isSpeechAPIRequest;
  double maximumRecognitionDuration;
  double v16;
  double endpointStart;
  double v18;
  _BOOL4 deliverEagerPackage;
  CESRSpeechParameters *v20;
  _BOOL4 disableDeliveringAsrFeatures;
  _BOOL4 enableEmojiRecognition;
  _BOOL4 enableAutoPunctuation;
  _BOOL4 enableVoiceCommands;
  double recognitionStart;
  double v26;
  _BOOL4 shouldGenerateVoiceCommandCandidates;
  NSString *v28;
  NSString *language;
  NSString *v30;
  NSString *requestIdentifier;
  NSString *v32;
  NSString *dictationUIInteractionIdentifier;
  NSString *v34;
  NSString *task;
  NSArray *v36;
  NSArray *loggingContext;
  NSString *v38;
  NSString *applicationName;
  NSData *v40;
  NSData *profile;
  uint64_t v42;
  NSDictionary *overrides;
  uint64_t v44;
  NSURL *modelOverrideURL;
  uint64_t v46;
  NSURL *originalAudioFileURL;
  uint64_t v48;
  NSString *codec;
  uint64_t v50;
  NSString *inputOrigin;
  uint64_t v52;
  CLLocation *location;
  double v54;
  BOOL v55;
  uint64_t v57;
  NSArray *jitGrammar;
  uint64_t v59;
  NSArray *sharedUserInfos;
  uint64_t v61;
  NSString *prefixText;
  uint64_t v63;
  NSString *postfixText;
  uint64_t v65;
  NSString *selectedText;
  uint64_t v67;
  AFPowerContextPolicy *powerContext;
  uint64_t v69;
  NSUUID *asrId;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;

  v4 = (CESRSpeechParameters *)a3;
  if (self == v4)
  {
    v55 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      narrowband = self->_narrowband;
      if (narrowband != -[CESRSpeechParameters narrowband](v5, "narrowband"))
        goto LABEL_50;
      detectUtterances = self->_detectUtterances;
      if (detectUtterances != -[CESRSpeechParameters detectUtterances](v5, "detectUtterances"))
        goto LABEL_50;
      censorSpeech = self->_censorSpeech;
      if (censorSpeech != -[CESRSpeechParameters censorSpeech](v5, "censorSpeech"))
        goto LABEL_50;
      farField = self->_farField;
      if (farField != -[CESRSpeechParameters farField](v5, "farField"))
        goto LABEL_50;
      secureOfflineOnly = self->_secureOfflineOnly;
      if (secureOfflineOnly != -[CESRSpeechParameters secureOfflineOnly](v5, "secureOfflineOnly"))
        goto LABEL_50;
      shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice;
      if (shouldStoreAudioOnDevice != -[CESRSpeechParameters shouldStoreAudioOnDevice](v5, "shouldStoreAudioOnDevice"))
        goto LABEL_50;
      continuousListening = self->_continuousListening;
      if (continuousListening != -[CESRSpeechParameters continuousListening](v5, "continuousListening"))
        goto LABEL_50;
      shouldHandleCapitalization = self->_shouldHandleCapitalization;
      if (shouldHandleCapitalization != -[CESRSpeechParameters shouldHandleCapitalization](v5, "shouldHandleCapitalization"))goto LABEL_50;
      isSpeechAPIRequest = self->_isSpeechAPIRequest;
      if (isSpeechAPIRequest != -[CESRSpeechParameters isSpeechAPIRequest](v5, "isSpeechAPIRequest"))
        goto LABEL_50;
      maximumRecognitionDuration = self->_maximumRecognitionDuration;
      -[CESRSpeechParameters maximumRecognitionDuration](v5, "maximumRecognitionDuration");
      if (maximumRecognitionDuration != v16)
        goto LABEL_50;
      endpointStart = self->_endpointStart;
      -[CESRSpeechParameters endpointStart](v5, "endpointStart");
      if (endpointStart != v18)
        goto LABEL_50;
      deliverEagerPackage = self->_deliverEagerPackage;
      if (deliverEagerPackage != -[CESRSpeechParameters deliverEagerPackage](v5, "deliverEagerPackage"))
        goto LABEL_50;
      v20 = self;
      disableDeliveringAsrFeatures = self->_disableDeliveringAsrFeatures;
      if (disableDeliveringAsrFeatures != -[CESRSpeechParameters disableDeliveringAsrFeatures](v5, "disableDeliveringAsrFeatures"))goto LABEL_50;
      enableEmojiRecognition = v20->_enableEmojiRecognition;
      if (enableEmojiRecognition == -[CESRSpeechParameters enableEmojiRecognition](v5, "enableEmojiRecognition")
        && (enableAutoPunctuation = v20->_enableAutoPunctuation,
            enableAutoPunctuation == -[CESRSpeechParameters enableAutoPunctuation](v5, "enableAutoPunctuation"))
        && (enableVoiceCommands = v20->_enableVoiceCommands,
            enableVoiceCommands == -[CESRSpeechParameters enableVoiceCommands](v5, "enableVoiceCommands"))
        && (recognitionStart = v20->_recognitionStart,
            -[CESRSpeechParameters recognitionStart](v5, "recognitionStart"),
            recognitionStart == v26)
        && (shouldGenerateVoiceCommandCandidates = v20->_shouldGenerateVoiceCommandCandidates,
            shouldGenerateVoiceCommandCandidates == -[CESRSpeechParameters shouldGenerateVoiceCommandCandidates](v5, "shouldGenerateVoiceCommandCandidates")))
      {
        -[CESRSpeechParameters language](v5, "language");
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        language = v20->_language;
        if (language == v28 || -[NSString isEqual:](language, "isEqual:", v28))
        {
          -[CESRSpeechParameters requestIdentifier](v5, "requestIdentifier");
          v30 = (NSString *)objc_claimAutoreleasedReturnValue();
          requestIdentifier = v20->_requestIdentifier;
          if (requestIdentifier == v30 || -[NSString isEqual:](requestIdentifier, "isEqual:", v30))
          {
            -[CESRSpeechParameters dictationUIInteractionIdentifier](v5, "dictationUIInteractionIdentifier");
            v32 = (NSString *)objc_claimAutoreleasedReturnValue();
            dictationUIInteractionIdentifier = v20->_dictationUIInteractionIdentifier;
            if (dictationUIInteractionIdentifier == v32
              || -[NSString isEqual:](dictationUIInteractionIdentifier, "isEqual:", v32))
            {
              -[CESRSpeechParameters task](v5, "task");
              v34 = (NSString *)objc_claimAutoreleasedReturnValue();
              task = v20->_task;
              if (task == v34 || -[NSString isEqual:](task, "isEqual:", v34))
              {
                -[CESRSpeechParameters loggingContext](v5, "loggingContext");
                v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
                loggingContext = v20->_loggingContext;
                if (loggingContext == v36 || -[NSArray isEqual:](loggingContext, "isEqual:", v36))
                {
                  -[CESRSpeechParameters applicationName](v5, "applicationName");
                  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
                  applicationName = v20->_applicationName;
                  if (applicationName == v38 || -[NSString isEqual:](applicationName, "isEqual:", v38))
                  {
                    -[CESRSpeechParameters profile](v5, "profile");
                    v40 = (NSData *)objc_claimAutoreleasedReturnValue();
                    profile = v20->_profile;
                    if (profile == v40 || -[NSData isEqual:](profile, "isEqual:", v40))
                    {
                      -[CESRSpeechParameters overrides](v5, "overrides");
                      v42 = objc_claimAutoreleasedReturnValue();
                      overrides = v20->_overrides;
                      v83 = (void *)v42;
                      if (overrides == (NSDictionary *)v42
                        || -[NSDictionary isEqual:](overrides, "isEqual:", v42))
                      {
                        -[CESRSpeechParameters modelOverrideURL](v5, "modelOverrideURL");
                        v44 = objc_claimAutoreleasedReturnValue();
                        modelOverrideURL = v20->_modelOverrideURL;
                        v82 = (void *)v44;
                        if (modelOverrideURL == (NSURL *)v44
                          || -[NSURL isEqual:](modelOverrideURL, "isEqual:", v44))
                        {
                          -[CESRSpeechParameters originalAudioFileURL](v5, "originalAudioFileURL");
                          v46 = objc_claimAutoreleasedReturnValue();
                          originalAudioFileURL = v20->_originalAudioFileURL;
                          v81 = (void *)v46;
                          if (originalAudioFileURL == (NSURL *)v46
                            || -[NSURL isEqual:](originalAudioFileURL, "isEqual:", v46))
                          {
                            -[CESRSpeechParameters codec](v5, "codec");
                            v48 = objc_claimAutoreleasedReturnValue();
                            codec = v20->_codec;
                            v80 = (void *)v48;
                            if (codec == (NSString *)v48 || -[NSString isEqual:](codec, "isEqual:", v48))
                            {
                              -[CESRSpeechParameters inputOrigin](v5, "inputOrigin");
                              v50 = objc_claimAutoreleasedReturnValue();
                              inputOrigin = v20->_inputOrigin;
                              v79 = (void *)v50;
                              if (inputOrigin == (NSString *)v50
                                || -[NSString isEqual:](inputOrigin, "isEqual:", v50))
                              {
                                -[CESRSpeechParameters location](v5, "location");
                                v52 = objc_claimAutoreleasedReturnValue();
                                location = v20->_location;
                                v78 = (void *)v52;
                                if (location == (CLLocation *)v52
                                  || (-[CLLocation distanceFromLocation:](location, "distanceFromLocation:", v52),
                                      v54 == 0.0))
                                {
                                  -[CESRSpeechParameters jitGrammar](v5, "jitGrammar");
                                  v57 = objc_claimAutoreleasedReturnValue();
                                  jitGrammar = v20->_jitGrammar;
                                  v77 = (void *)v57;
                                  if (jitGrammar == (NSArray *)v57
                                    || -[NSArray isEqual:](jitGrammar, "isEqual:", v57))
                                  {
                                    -[CESRSpeechParameters sharedUserInfos](v5, "sharedUserInfos");
                                    v59 = objc_claimAutoreleasedReturnValue();
                                    sharedUserInfos = v20->_sharedUserInfos;
                                    v76 = (void *)v59;
                                    if (sharedUserInfos == (NSArray *)v59
                                      || -[NSArray isEqual:](sharedUserInfos, "isEqual:", v59))
                                    {
                                      -[CESRSpeechParameters prefixText](v5, "prefixText");
                                      v61 = objc_claimAutoreleasedReturnValue();
                                      prefixText = v20->_prefixText;
                                      v75 = (void *)v61;
                                      if (prefixText == (NSString *)v61
                                        || -[NSString isEqual:](prefixText, "isEqual:", v61))
                                      {
                                        -[CESRSpeechParameters postfixText](v5, "postfixText");
                                        v63 = objc_claimAutoreleasedReturnValue();
                                        postfixText = v20->_postfixText;
                                        v74 = (void *)v63;
                                        if (postfixText == (NSString *)v63
                                          || -[NSString isEqual:](postfixText, "isEqual:", v63))
                                        {
                                          -[CESRSpeechParameters selectedText](v5, "selectedText");
                                          v65 = objc_claimAutoreleasedReturnValue();
                                          selectedText = v20->_selectedText;
                                          v73 = (void *)v65;
                                          if (selectedText == (NSString *)v65
                                            || -[NSString isEqual:](selectedText, "isEqual:", v65))
                                          {
                                            -[CESRSpeechParameters powerContext](v5, "powerContext");
                                            v67 = objc_claimAutoreleasedReturnValue();
                                            powerContext = v20->_powerContext;
                                            v72 = (void *)v67;
                                            if (powerContext == (AFPowerContextPolicy *)v67
                                              || -[AFPowerContextPolicy isEqual:](powerContext, "isEqual:", v67))
                                            {
                                              -[CESRSpeechParameters asrId](v5, "asrId");
                                              v69 = objc_claimAutoreleasedReturnValue();
                                              asrId = v20->_asrId;
                                              v71 = (void *)v69;
                                              v55 = asrId == (NSUUID *)v69
                                                 || -[NSUUID isEqual:](asrId, "isEqual:", v69);

                                            }
                                            else
                                            {
                                              v55 = 0;
                                            }

                                          }
                                          else
                                          {
                                            v55 = 0;
                                          }

                                        }
                                        else
                                        {
                                          v55 = 0;
                                        }

                                      }
                                      else
                                      {
                                        v55 = 0;
                                      }

                                    }
                                    else
                                    {
                                      v55 = 0;
                                    }

                                  }
                                  else
                                  {
                                    v55 = 0;
                                  }

                                }
                                else
                                {
                                  v55 = 0;
                                }

                              }
                              else
                              {
                                v55 = 0;
                              }

                            }
                            else
                            {
                              v55 = 0;
                            }

                          }
                          else
                          {
                            v55 = 0;
                          }

                        }
                        else
                        {
                          v55 = 0;
                        }

                      }
                      else
                      {
                        v55 = 0;
                      }

                    }
                    else
                    {
                      v55 = 0;
                    }

                  }
                  else
                  {
                    v55 = 0;
                  }

                }
                else
                {
                  v55 = 0;
                }

              }
              else
              {
                v55 = 0;
              }

            }
            else
            {
              v55 = 0;
            }

          }
          else
          {
            v55 = 0;
          }

        }
        else
        {
          v55 = 0;
        }

      }
      else
      {
LABEL_50:
        v55 = 0;
      }

    }
    else
    {
      v55 = 0;
    }
  }

  return v55;
}

- (CESRSpeechParameters)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  char v57;
  char v58;
  void *v59;
  void *v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  CESRSpeechParameters *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::language"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::requestIdentifier"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::dictationUIInteractionIdentifier"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::task"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("CESRSpeechParameters::loggingContext"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::applicationName"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::profile"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("CESRSpeechParameters::overrides"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::modelOverrideURL"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::originalAudioFileURL"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::codec"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::narrowband"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::detectUtterances"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::censorSpeech"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::farField"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::secureOfflineOnly"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::shouldStoreAudioOnDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::continuousListening"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::shouldHandleCapitalization"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::isSpeechAPIRequest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::maximumRecognitionDuration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::endpointStart"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::inputOrigin"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::location"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0C99E60];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v28, CFSTR("CESRSpeechParameters::jitGrammar"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::deliverEagerPackage"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v29, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::disableDeliveringAsrFeatures"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::enableEmojiRecognition"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v31, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::enableAutoPunctuation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = objc_msgSend(v32, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::enableVoiceCommands"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "BOOLValue");

  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v37, CFSTR("CESRSpeechParameters::sharedUserInfos"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::prefixText"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::postfixText"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::selectedText"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::powerContext"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::recognitionStart"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  v41 = v40;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::shouldGenerateVoiceCommandCandidates"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CESRSpeechParameters::asrId"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v49) = v43;
  BYTE4(v48) = v34;
  BYTE3(v48) = v27;
  BYTE2(v48) = v56;
  BYTE1(v48) = v57;
  LOBYTE(v48) = v58;
  LOBYTE(v47) = v61;
  HIBYTE(v46) = v62;
  BYTE6(v46) = v63;
  BYTE5(v46) = v64;
  BYTE4(v46) = v65;
  BYTE3(v46) = v66;
  BYTE2(v46) = v67;
  BYTE1(v46) = v68;
  LOBYTE(v46) = v69;
  v75 = -[CESRSpeechParameters initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:](self, "initWithLanguage:requestIdentifier:dictationUIInteractionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:codec:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:continuousListening:shouldHandleCapitalization:isSpeechAPIRequest:maximumRecognitionDuration:endpointStart:inputOrigin:location:jitGrammar:deliverEagerPackage:disableDeliveringAsrFeatures:enableEmojiRecognition:enableAutoPunctuation:enableVoiceCommands:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:recognitionStart:shouldGenerateVoiceCommandCandidates:asrId:", v81, v78, v80, v79, v73, v72, v22, v25, v41, v77, v76, v71,
          v70,
          v60,
          v46,
          v47,
          v59,
          v55,
          v54,
          v48,
          v53,
          v52,
          v51,
          v50,
          v38,
          v49,
          v44);

  return v75;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  language = self->_language;
  v23 = a3;
  objc_msgSend(v23, "encodeObject:forKey:", language, CFSTR("CESRSpeechParameters::language"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("CESRSpeechParameters::requestIdentifier"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_dictationUIInteractionIdentifier, CFSTR("CESRSpeechParameters::dictationUIInteractionIdentifier"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_task, CFSTR("CESRSpeechParameters::task"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_loggingContext, CFSTR("CESRSpeechParameters::loggingContext"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_applicationName, CFSTR("CESRSpeechParameters::applicationName"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_profile, CFSTR("CESRSpeechParameters::profile"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_overrides, CFSTR("CESRSpeechParameters::overrides"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_modelOverrideURL, CFSTR("CESRSpeechParameters::modelOverrideURL"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_originalAudioFileURL, CFSTR("CESRSpeechParameters::originalAudioFileURL"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_codec, CFSTR("CESRSpeechParameters::codec"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_narrowband);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v5, CFSTR("CESRSpeechParameters::narrowband"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_detectUtterances);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v6, CFSTR("CESRSpeechParameters::detectUtterances"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_censorSpeech);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v7, CFSTR("CESRSpeechParameters::censorSpeech"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_farField);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v8, CFSTR("CESRSpeechParameters::farField"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_secureOfflineOnly);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v9, CFSTR("CESRSpeechParameters::secureOfflineOnly"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldStoreAudioOnDevice);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v10, CFSTR("CESRSpeechParameters::shouldStoreAudioOnDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_continuousListening);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v11, CFSTR("CESRSpeechParameters::continuousListening"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldHandleCapitalization);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v12, CFSTR("CESRSpeechParameters::shouldHandleCapitalization"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeechAPIRequest);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v13, CFSTR("CESRSpeechParameters::isSpeechAPIRequest"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumRecognitionDuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v14, CFSTR("CESRSpeechParameters::maximumRecognitionDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endpointStart);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v15, CFSTR("CESRSpeechParameters::endpointStart"));

  objc_msgSend(v23, "encodeObject:forKey:", self->_inputOrigin, CFSTR("CESRSpeechParameters::inputOrigin"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_location, CFSTR("CESRSpeechParameters::location"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_jitGrammar, CFSTR("CESRSpeechParameters::jitGrammar"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_deliverEagerPackage);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v16, CFSTR("CESRSpeechParameters::deliverEagerPackage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableDeliveringAsrFeatures);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v17, CFSTR("CESRSpeechParameters::disableDeliveringAsrFeatures"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableEmojiRecognition);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v18, CFSTR("CESRSpeechParameters::enableEmojiRecognition"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableAutoPunctuation);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v19, CFSTR("CESRSpeechParameters::enableAutoPunctuation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableVoiceCommands);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v20, CFSTR("CESRSpeechParameters::enableVoiceCommands"));

  objc_msgSend(v23, "encodeObject:forKey:", self->_sharedUserInfos, CFSTR("CESRSpeechParameters::sharedUserInfos"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_prefixText, CFSTR("CESRSpeechParameters::prefixText"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_postfixText, CFSTR("CESRSpeechParameters::postfixText"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_selectedText, CFSTR("CESRSpeechParameters::selectedText"));
  objc_msgSend(v23, "encodeObject:forKey:", self->_powerContext, CFSTR("CESRSpeechParameters::powerContext"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_recognitionStart);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v21, CFSTR("CESRSpeechParameters::recognitionStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateVoiceCommandCandidates);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v22, CFSTR("CESRSpeechParameters::shouldGenerateVoiceCommandCandidates"));

  objc_msgSend(v23, "encodeObject:forKey:", self->_asrId, CFSTR("CESRSpeechParameters::asrId"));
}

- (NSString)language
{
  return self->_language;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)dictationUIInteractionIdentifier
{
  return self->_dictationUIInteractionIdentifier;
}

- (NSString)task
{
  return self->_task;
}

- (NSArray)loggingContext
{
  return self->_loggingContext;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSData)profile
{
  return self->_profile;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (NSString)codec
{
  return self->_codec;
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)farField
{
  return self->_farField;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (BOOL)isSpeechAPIRequest
{
  return self->_isSpeechAPIRequest;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (double)endpointStart
{
  return self->_endpointStart;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
}

- (BOOL)deliverEagerPackage
{
  return self->_deliverEagerPackage;
}

- (BOOL)disableDeliveringAsrFeatures
{
  return self->_disableDeliveringAsrFeatures;
}

- (BOOL)enableEmojiRecognition
{
  return self->_enableEmojiRecognition;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (NSArray)sharedUserInfos
{
  return self->_sharedUserInfos;
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (AFPowerContextPolicy)powerContext
{
  return self->_powerContext;
}

- (double)recognitionStart
{
  return self->_recognitionStart;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (NSUUID)asrId
{
  return self->_asrId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _CESRSpeechParametersMutation *);
  _CESRSpeechParametersMutation *v5;
  void *v6;

  v4 = (void (**)(id, _CESRSpeechParametersMutation *))a3;
  if (v4)
  {
    v5 = -[_CESRSpeechParametersMutation initWithBaseModel:]([_CESRSpeechParametersMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_CESRSpeechParametersMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[CESRSpeechParameters copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _CESRSpeechParametersMutation *);
  _CESRSpeechParametersMutation *v4;
  void *v5;

  v3 = (void (**)(id, _CESRSpeechParametersMutation *))a3;
  v4 = objc_alloc_init(_CESRSpeechParametersMutation);
  if (v3)
    v3[2](v3, v4);
  -[_CESRSpeechParametersMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
