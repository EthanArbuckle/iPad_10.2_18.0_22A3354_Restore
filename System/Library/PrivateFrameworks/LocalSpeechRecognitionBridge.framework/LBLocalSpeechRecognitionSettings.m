@implementation LBLocalSpeechRecognitionSettings

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7
{
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:", a3, a4, a5, a6, a7, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8
{
  uint64_t v9;

  LODWORD(v9) = 0;
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:", a3, a4, a5, a6, a7, a8, 60.0, 0, v9, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15
{
  uint64_t v16;
  uint64_t v17;

  LOBYTE(v17) = 1;
  WORD1(v16) = __PAIR16__(a13, a12);
  LOWORD(v16) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:", a3, a4, a5, a6, a7, a8, a14, a9, v16, a15, v17);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16
{
  uint64_t v17;
  uint64_t v18;

  BYTE1(v18) = 1;
  LOBYTE(v18) = a16;
  WORD1(v17) = __PAIR16__(a13, a12);
  LOWORD(v17) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:", a3, a4, a5, a6, a7, a8, a14, a9, v17, a15, v18);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17
{
  uint64_t v18;
  uint64_t v19;

  LOWORD(v19) = __PAIR16__(a17, a16);
  WORD1(v18) = __PAIR16__(a13, a12);
  LOWORD(v18) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:", a3, a4, a5, a6, a7, a8, a14, a9, v18, a15, v19, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  LOWORD(v21) = 0;
  LOWORD(v20) = __PAIR16__(a17, a16);
  WORD1(v19) = __PAIR16__(a13, a12);
  LOWORD(v19) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:", a3, a4, a5, a6, a7, a8, a14, a9, v19, a15, v20, a18, v21);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  LOWORD(v23) = __PAIR16__(a20, a19);
  LOWORD(v22) = __PAIR16__(a17, a16);
  WORD1(v21) = __PAIR16__(a13, a12);
  LOWORD(v21) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:", a3, a4, a5, a6, a7, a8, a14, a9, v21, a15, v22, a18, v23, 0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  LOBYTE(v25) = 0;
  LOWORD(v24) = __PAIR16__(a20, a19);
  LOWORD(v23) = __PAIR16__(a17, a16);
  WORD1(v22) = __PAIR16__(a13, a12);
  LOWORD(v22) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:", a3, a4, a5, a6, a7, a8, a14, a9, v22, a15, v23, a18, v24, a21,
           v25);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  LOBYTE(v26) = a22;
  LOWORD(v25) = __PAIR16__(a20, a19);
  LOWORD(v24) = __PAIR16__(a17, a16);
  WORD1(v23) = __PAIR16__(a13, a12);
  LOWORD(v23) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:sharedUserIds:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:", a3, a4, a5, a6, a7, a8, a14, a9, v23, a15, v24, a18, v25, a21,
           v26,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 sharedUserIds:(id)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23
{
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:", a3, a4, a5, a6, a7, a8, a14);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  LOBYTE(v26) = a21;
  WORD1(v25) = __PAIR16__(a19, a18);
  LOWORD(v25) = __PAIR16__(a17, a16);
  WORD1(v24) = __PAIR16__(a13, a12);
  LOWORD(v24) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:", a3, a4, a5, a6, a7, a8, a14, a9, v24, a15, v25, a20, v26, a22,
           a23,
           0,
           0,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26
{
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  LOBYTE(v29) = a21;
  WORD1(v28) = __PAIR16__(a19, a18);
  LOWORD(v28) = __PAIR16__(a17, a16);
  WORD1(v27) = __PAIR16__(a13, a12);
  LOWORD(v27) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:", a3, a4, a5, a6, a7, a8, a14, a9, v27, a15, v28, a20, v29, a22,
           a23,
           a24,
           a25,
           a26,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 location:(id)a6 jitGrammar:(id)a7 overrideModelPath:(id)a8 applicationName:(id)a9 detectUtterances:(BOOL)a10 continuousListening:(BOOL)a11 shouldHandleCapitalization:(BOOL)a12 secureOfflineOnly:(BOOL)a13 maximumRecognitionDuration:(double)a14 recognitionOverrides:(id)a15 shouldStoreAudioOnDevice:(BOOL)a16 deliverEagerPackage:(BOOL)a17 enableEmojiRecognition:(BOOL)a18 enableAutoPunctuation:(BOOL)a19 UILanguage:(id)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  LOBYTE(v31) = 0;
  LOBYTE(v30) = a21;
  WORD1(v29) = __PAIR16__(a19, a18);
  LOWORD(v29) = __PAIR16__(a17, a16);
  WORD1(v28) = __PAIR16__(a13, a12);
  LOWORD(v28) = __PAIR16__(a11, a10);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:", a3, a4, a5, 0, a6, a7, a14, a8, a9, v28, a15, v29, a20,
           v30,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v31,
           0,
           0,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32
{
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  LOBYTE(v37) = 0;
  LOBYTE(v36) = a29;
  LOBYTE(v35) = a22;
  WORD1(v34) = __PAIR16__(a20, a19);
  LOWORD(v34) = __PAIR16__(a18, a17);
  WORD1(v33) = __PAIR16__(a14, a13);
  LOWORD(v33) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v33, a16, v34,
           a21,
           v35,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v36,
           a30,
           a31,
           a32,
           v37);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33
{
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  LOBYTE(v38) = a33;
  LOBYTE(v37) = a29;
  LOBYTE(v36) = a22;
  WORD1(v35) = __PAIR16__(a20, a19);
  LOWORD(v35) = __PAIR16__(a18, a17);
  WORD1(v34) = __PAIR16__(a14, a13);
  LOWORD(v34) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v34, a16, v35,
           a21,
           v36,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           v37,
           a30,
           a31,
           a32,
           v38,
           0);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 enableVoiceCommands:(BOOL)a21 dictationUIInteractionId:(id)a22 sharedUserInfos:(id)a23 prefixText:(id)a24 postfixText:(id)a25 selectedText:(id)a26 powerContext:(id)a27 shouldStartAudioCapture:(BOOL)a28 audioCaptureStartHostTime:(unint64_t)a29 audioRecordType:(int64_t)a30 audioRecordDeviceId:(id)a31 shouldGenerateVoiceCommandCandidates:(BOOL)a32 asrLocale:(id)a33
{
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  LOBYTE(v38) = a32;
  LOBYTE(v37) = a28;
  LOBYTE(v36) = a21;
  WORD1(v35) = __PAIR16__(a20, a19);
  LOWORD(v35) = __PAIR16__(a18, a17);
  WORD1(v34) = __PAIR16__(a14, a13);
  LOWORD(v34) = __PAIR16__(a12, a11);
  return -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", a3, a4, a5, a6, a7, a8, a15, a9, a10, v34, a16, v35,
           0,
           v36,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           v37,
           a29,
           a30,
           a31,
           v38,
           a33);
}

- (LBLocalSpeechRecognitionSettings)initWithRequestId:(id)a3 inputOrigin:(id)a4 speechRecognitionTaskName:(unint64_t)a5 speechRecognitionMode:(unint64_t)a6 location:(id)a7 jitGrammar:(id)a8 overrideModelPath:(id)a9 applicationName:(id)a10 detectUtterances:(BOOL)a11 continuousListening:(BOOL)a12 shouldHandleCapitalization:(BOOL)a13 secureOfflineOnly:(BOOL)a14 maximumRecognitionDuration:(double)a15 recognitionOverrides:(id)a16 shouldStoreAudioOnDevice:(BOOL)a17 deliverEagerPackage:(BOOL)a18 enableEmojiRecognition:(BOOL)a19 enableAutoPunctuation:(BOOL)a20 UILanguage:(id)a21 enableVoiceCommands:(BOOL)a22 dictationUIInteractionId:(id)a23 sharedUserInfos:(id)a24 prefixText:(id)a25 postfixText:(id)a26 selectedText:(id)a27 powerContext:(id)a28 shouldStartAudioCapture:(BOOL)a29 audioCaptureStartHostTime:(unint64_t)a30 audioRecordType:(int64_t)a31 audioRecordDeviceId:(id)a32 shouldGenerateVoiceCommandCandidates:(BOOL)a33 asrLocale:(id)a34
{
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  LBLocalSpeechRecognitionSettings *v46;
  uint64_t v47;
  NSString *requestId;
  uint64_t v49;
  NSString *inputOrigin;
  uint64_t v51;
  CLLocation *location;
  uint64_t v53;
  NSArray *jitGrammar;
  uint64_t v55;
  NSString *overrideModelPath;
  uint64_t v57;
  NSString *applicationName;
  uint64_t v59;
  NSDictionary *recognitionOverrides;
  uint64_t v61;
  NSArray *sharedUserInfos;
  uint64_t v63;
  NSString *asrLocale;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;

  v76 = a3;
  v75 = a4;
  v74 = a7;
  v73 = a8;
  v72 = a9;
  v71 = a10;
  v38 = a16;
  v39 = a21;
  v40 = a23;
  v41 = a24;
  v42 = a25;
  v43 = a26;
  v44 = a27;
  v45 = a28;
  v69 = a32;
  v70 = a34;
  v77.receiver = self;
  v77.super_class = (Class)LBLocalSpeechRecognitionSettings;
  v46 = -[LBLocalSpeechRecognitionSettings init](&v77, sel_init);
  if (v46)
  {
    v47 = objc_msgSend(v76, "copy");
    requestId = v46->_requestId;
    v46->_requestId = (NSString *)v47;

    v49 = objc_msgSend(v75, "copy");
    inputOrigin = v46->_inputOrigin;
    v46->_inputOrigin = (NSString *)v49;

    v46->_speechRecognitionTask = a5;
    v46->_speechRecognitionMode = a6;
    v51 = objc_msgSend(v74, "copy");
    location = v46->_location;
    v46->_location = (CLLocation *)v51;

    v53 = objc_msgSend(v73, "copy");
    jitGrammar = v46->_jitGrammar;
    v46->_jitGrammar = (NSArray *)v53;

    v55 = objc_msgSend(v72, "copy");
    overrideModelPath = v46->_overrideModelPath;
    v46->_overrideModelPath = (NSString *)v55;

    v57 = objc_msgSend(v71, "copy");
    applicationName = v46->_applicationName;
    v46->_applicationName = (NSString *)v57;

    v46->_detectUtterances = a11;
    v46->_continuousListening = a12;
    v46->_shouldHandleCapitalization = a13;
    v46->_secureOfflineOnly = a14;
    v46->_maximumRecognitionDuration = a15;
    v59 = objc_msgSend(v38, "copy");
    recognitionOverrides = v46->_recognitionOverrides;
    v46->_recognitionOverrides = (NSDictionary *)v59;

    v46->_shouldStoreAudioOnDevice = a17;
    v46->_deliverEagerPackage = a18;
    objc_storeStrong((id *)&v46->_UILanguage, a21);
    v46->_enableEmojiRecognition = a19;
    v46->_enableAutoPunctuation = a20;
    v46->_enableVoiceCommands = a22;
    objc_storeStrong((id *)&v46->_dictationUIInteractionId, a23);
    v61 = objc_msgSend(v41, "copy");
    sharedUserInfos = v46->_sharedUserInfos;
    v46->_sharedUserInfos = (NSArray *)v61;

    objc_storeStrong((id *)&v46->_prefixText, a25);
    objc_storeStrong((id *)&v46->_postfixText, a26);
    objc_storeStrong((id *)&v46->_selectedText, a27);
    objc_storeStrong((id *)&v46->_powerContext, a28);
    v46->_shouldStartAudioCapture = a29;
    v46->_audioCaptureStartHostTime = a30;
    v46->_audioRecordType = a31;
    objc_storeStrong((id *)&v46->_audioRecordDeviceId, a32);
    v46->_shouldGenerateVoiceCommandCandidates = a33;
    v63 = objc_msgSend(v70, "copy");
    asrLocale = v46->_asrLocale;
    v46->_asrLocale = (NSString *)v63;

  }
  return v46;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[inputOrigin = %@]"), self->_inputOrigin);
  objc_msgSend(v3, "appendFormat:", CFSTR("[speechRecognitionTask = %lu]"), self->_speechRecognitionTask);
  objc_msgSend(v3, "appendFormat:", CFSTR("[speechRecognitionMode = %lu]"), self->_speechRecognitionMode);
  objc_msgSend(v3, "appendFormat:", CFSTR("[applicationName = %@]"), self->_applicationName);
  if (self->_detectUtterances)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[detectUtterances = %@]"), v4);
  if (self->_continuousListening)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[continuousListening = %@]"), v5);
  if (self->_shouldHandleCapitalization)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[shouldHandleCapitalization = %@]"), v6);
  if (self->_secureOfflineOnly)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[secureOfflineOnly = %@]"), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("[maximumRecognitionDuration = %f]"), *(_QWORD *)&self->_maximumRecognitionDuration);
  if (self->_location)
    v8 = "present";
  else
    v8 = "nil";
  objc_msgSend(v3, "appendFormat:", CFSTR("[location = %s]"), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("[overrides = %@]"), self->_recognitionOverrides);
  objc_msgSend(v3, "appendFormat:", CFSTR("[jitGrammar = %@]"), self->_jitGrammar);
  objc_msgSend(v3, "appendFormat:", CFSTR("[overrideModelPath = %@]"), self->_overrideModelPath);
  if (self->_shouldStoreAudioOnDevice)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[shouldStoreAudioOnDevice = %@]"), v9);
  if (self->_deliverEagerPackage)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[deliverEagerPackage = %@]"), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("[UILanguage = %@]"), self->_UILanguage);
  if (self->_enableEmojiRecognition)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[enableEmojiRecognition = %@]"), v11);
  if (self->_enableAutoPunctuation)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[enableAutoPunctuation = %@]"), v12);
  if (self->_enableVoiceCommands)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[enableVoiceCommands = %@]"), v13);
  objc_msgSend(v3, "appendFormat:", CFSTR("[sharedUserInfos = %@]"), self->_sharedUserInfos);
  if (self->_prefixText)
    v14 = CFSTR("REDACTED");
  else
    v14 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("[prefixText = %@]"), v14);
  if (self->_postfixText)
    v15 = CFSTR("REDACTED");
  else
    v15 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("[postfixText = %@]"), v15);
  if (self->_selectedText)
    v16 = CFSTR("REDACTED");
  else
    v16 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("[selectedText = %@]"), v16);
  objc_msgSend(v3, "appendFormat:", CFSTR("[powerContext = %@]"), self->_powerContext);
  if (self->_shouldStartAudioCapture)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[shouldStartAudioCapture = %@]"), v17);
  objc_msgSend(v3, "appendFormat:", CFSTR("[audioRecordType] = %lld]"), self->_audioRecordType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[audioStartHostTime = %llu"), self->_audioCaptureStartHostTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("[deviceId = %@]"), self->_audioRecordDeviceId);
  if (self->_shouldGenerateVoiceCommandCandidates)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[shouldGenerateVoiceCommandCandidates = %@]"), v18);
  objc_msgSend(v3, "appendFormat:", CFSTR("[asrLocale = %@]"), self->_asrLocale);
  return v3;
}

- (LBLocalSpeechRecognitionSettings)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  char v51;
  char v52;
  char v53;
  void *v54;
  void *v55;
  char v56;
  char v57;
  char v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  LBLocalSpeechRecognitionSettings *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::requestId"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::inputOrigin"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::task"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::location"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("LBLocalSpeechRecognitionSettings:::jitGrammar"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::overrideModelPath"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::applicationName"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::detectUtterances"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::continuousListening"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::shouldHandleCapitalization"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::secureOfflineOnly"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::maxRecognitionDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("LBLocalSpeechRecognitionSettings:::recognitionOverrides"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::shouldStoreAudioOnDevice"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::deliverEagerPackage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::UILanguage"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::enableEmojiRecognition"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::enableAutoPunctuation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v22, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::enableVoiceCommands"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::dictationUIInteractionId"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v26, CFSTR("LBLocalSpeechRecognitionSettings:::sharedUserInfos"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::prefixText"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::postfixText"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::selectedText"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::powerContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::shouldStartAudioCapture"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::audioRecordType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "longLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::audioCaptureStartHostTime"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::audioRecordDeviceId"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::shouldGenerateVoiceCommandCandidates"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_msgSend(v34, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LBLocalSpeechRecognitionSettings:::asrLocale"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v41) = v25;
  LOBYTE(v40) = v29;
  LOBYTE(v39) = v48;
  BYTE3(v38) = v50;
  BYTE2(v38) = v51;
  BYTE1(v38) = v52;
  LOBYTE(v38) = v53;
  BYTE3(v37) = v56;
  BYTE2(v37) = v57;
  BYTE1(v37) = v58;
  LOBYTE(v37) = v59;
  v64 = -[LBLocalSpeechRecognitionSettings initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:](self, "initWithRequestId:inputOrigin:speechRecognitionTaskName:speechRecognitionMode:location:jitGrammar:overrideModelPath:applicationName:detectUtterances:continuousListening:shouldHandleCapitalization:secureOfflineOnly:maximumRecognitionDuration:recognitionOverrides:shouldStoreAudioOnDevice:deliverEagerPackage:enableEmojiRecognition:enableAutoPunctuation:UILanguage:enableVoiceCommands:dictationUIInteractionId:sharedUserInfos:prefixText:postfixText:selectedText:powerContext:shouldStartAudioCapture:audioCaptureStartHostTime:audioRecordType:audioRecordDeviceId:shouldGenerateVoiceCommandCandidates:asrLocale:", v68, v67, v62, v61, v66, v60, v15, v65, v55, v37, v54, v38,
          v49,
          v39,
          v47,
          v46,
          v45,
          v43,
          v44,
          v27,
          v40,
          v33,
          v31,
          v42,
          v41,
          v35);

  return v64;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *requestId;
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
  id v21;

  requestId = self->_requestId;
  v21 = a3;
  objc_msgSend(v21, "encodeObject:forKey:", requestId, CFSTR("LBLocalSpeechRecognitionSettings:::requestId"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_inputOrigin, CFSTR("LBLocalSpeechRecognitionSettings:::inputOrigin"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_speechRecognitionTask);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("LBLocalSpeechRecognitionSettings:::task"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_speechRecognitionMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("LBLocalSpeechRecognitionSettings:::mode"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_location, CFSTR("LBLocalSpeechRecognitionSettings:::location"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_jitGrammar, CFSTR("LBLocalSpeechRecognitionSettings:::jitGrammar"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_overrideModelPath, CFSTR("LBLocalSpeechRecognitionSettings:::overrideModelPath"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_applicationName, CFSTR("LBLocalSpeechRecognitionSettings:::applicationName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_detectUtterances);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("LBLocalSpeechRecognitionSettings:::detectUtterances"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_continuousListening);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("LBLocalSpeechRecognitionSettings:::continuousListening"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldHandleCapitalization);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("LBLocalSpeechRecognitionSettings:::shouldHandleCapitalization"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_secureOfflineOnly);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("LBLocalSpeechRecognitionSettings:::secureOfflineOnly"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maximumRecognitionDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("LBLocalSpeechRecognitionSettings:::maxRecognitionDuration"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_recognitionOverrides, CFSTR("LBLocalSpeechRecognitionSettings:::recognitionOverrides"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldStoreAudioOnDevice);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("LBLocalSpeechRecognitionSettings:::shouldStoreAudioOnDevice"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deliverEagerPackage);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("LBLocalSpeechRecognitionSettings:::deliverEagerPackage"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_UILanguage, CFSTR("LBLocalSpeechRecognitionSettings:::UILanguage"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableEmojiRecognition);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("LBLocalSpeechRecognitionSettings:::enableEmojiRecognition"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableAutoPunctuation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("LBLocalSpeechRecognitionSettings:::enableAutoPunctuation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableVoiceCommands);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("LBLocalSpeechRecognitionSettings:::enableVoiceCommands"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_dictationUIInteractionId, CFSTR("LBLocalSpeechRecognitionSettings:::dictationUIInteractionId"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_sharedUserInfos, CFSTR("LBLocalSpeechRecognitionSettings:::sharedUserInfos"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_prefixText, CFSTR("LBLocalSpeechRecognitionSettings:::prefixText"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_postfixText, CFSTR("LBLocalSpeechRecognitionSettings:::postfixText"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_selectedText, CFSTR("LBLocalSpeechRecognitionSettings:::selectedText"));
  objc_msgSend(v21, "encodeObject:forKey:", self->_powerContext, CFSTR("LBLocalSpeechRecognitionSettings:::powerContext"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldStartAudioCapture);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("LBLocalSpeechRecognitionSettings:::shouldStartAudioCapture"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_audioRecordType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("LBLocalSpeechRecognitionSettings:::audioRecordType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_audioCaptureStartHostTime);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("LBLocalSpeechRecognitionSettings:::audioCaptureStartHostTime"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_audioRecordDeviceId, CFSTR("LBLocalSpeechRecognitionSettings:::audioRecordDeviceId"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shouldGenerateVoiceCommandCandidates);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("LBLocalSpeechRecognitionSettings:::shouldGenerateVoiceCommandCandidates"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_asrLocale, CFSTR("LBLocalSpeechRecognitionSettings:::asrLocale"));
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (unint64_t)speechRecognitionTask
{
  return self->_speechRecognitionTask;
}

- (unint64_t)speechRecognitionMode
{
  return self->_speechRecognitionMode;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
}

- (NSString)overrideModelPath
{
  return self->_overrideModelPath;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (BOOL)continuousListening
{
  return self->_continuousListening;
}

- (BOOL)shouldHandleCapitalization
{
  return self->_shouldHandleCapitalization;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (BOOL)deliverEagerPackage
{
  return self->_deliverEagerPackage;
}

- (BOOL)enableEmojiRecognition
{
  return self->_enableEmojiRecognition;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (NSString)UILanguage
{
  return self->_UILanguage;
}

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (NSString)dictationUIInteractionId
{
  return self->_dictationUIInteractionId;
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

- (BOOL)shouldStartAudioCapture
{
  return self->_shouldStartAudioCapture;
}

- (unint64_t)audioCaptureStartHostTime
{
  return self->_audioCaptureStartHostTime;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (NSString)audioRecordDeviceId
{
  return self->_audioRecordDeviceId;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (NSString)asrLocale
{
  return self->_asrLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asrLocale, 0);
  objc_storeStrong((id *)&self->_audioRecordDeviceId, 0);
  objc_storeStrong((id *)&self->_powerContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_sharedUserInfos, 0);
  objc_storeStrong((id *)&self->_dictationUIInteractionId, 0);
  objc_storeStrong((id *)&self->_UILanguage, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

+ (id)taskString:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("Unknown");
  else
    return off_24D1708C0[a3];
}

+ (id)getTaskStringFromSpeechRecognitionSettings:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = objc_msgSend(a3, "speechRecognitionTask");
  else
    v3 = 1;
  return +[LBLocalSpeechRecognitionSettings taskString:](LBLocalSpeechRecognitionSettings, "taskString:", v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
