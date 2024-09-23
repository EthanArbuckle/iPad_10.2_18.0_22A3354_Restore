@implementation _EARSpeechRecognitionResultPackage

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7
{
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:", a3, a4, a5, a6, a7, 0, 0.0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8
{
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9
{
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:", a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, v11);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13
{
  uint64_t v14;

  LOWORD(v14) = a13;
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14, 0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15
{
  uint64_t v16;

  LOWORD(v16) = __PAIR16__(a14, a13);
  return -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:](self, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v16, a15, 0, 0,
           0);
}

- (id)_initWithRecognition:(id)a3 preITNRecognition:(id)a4 unrepairedRecognition:(id)a5 recognitionIsFormatted:(BOOL)a6 isFinal:(BOOL)a7 audioAnalytics:(id)a8 utteranceStart:(double)a9 latticeMitigatorResult:(id)a10 nBestVoiceCommandInterpretations:(id)a11 preITNNBestVoiceCommandInterpretations:(id)a12 recognitionPaused:(BOOL)a13 firstResultAfterResume:(BOOL)a14 endOfSentenceLikelihood:(id)a15 numTokensExcludingTriggerPhrase:(int64_t)a16 voiceCommandDebugInfo:(id)a17 performanceMarkers:(id)a18
{
  id v23;
  id v24;
  id v25;
  _EARSpeechRecognitionResultPackage *v26;
  uint64_t v27;
  _EARSpeechRecognition *recognition;
  uint64_t v29;
  _EARSpeechRecognition *preITNRecognition;
  uint64_t v31;
  _EARSpeechRecognition *unrepairedRecognition;
  uint64_t v33;
  NSArray *nBestVoiceCommandInterpretations;
  uint64_t v35;
  NSArray *preITNNBestVoiceCommandInterpretations;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;

  v46 = a3;
  v45 = a4;
  v44 = a5;
  v43 = a8;
  v42 = a10;
  v23 = a11;
  v24 = a12;
  v41 = a15;
  v40 = a17;
  v25 = a18;
  v47.receiver = self;
  v47.super_class = (Class)_EARSpeechRecognitionResultPackage;
  v26 = -[_EARSpeechRecognitionResultPackage init](&v47, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v46, "copy");
    recognition = v26->_recognition;
    v26->_recognition = (_EARSpeechRecognition *)v27;

    v29 = objc_msgSend(v45, "copy");
    preITNRecognition = v26->_preITNRecognition;
    v26->_preITNRecognition = (_EARSpeechRecognition *)v29;

    v31 = objc_msgSend(v44, "copy");
    unrepairedRecognition = v26->_unrepairedRecognition;
    v26->_unrepairedRecognition = (_EARSpeechRecognition *)v31;

    v26->_recognitionIsFormatted = a6;
    v26->_isFinal = a7;
    objc_storeStrong((id *)&v26->_audioAnalytics, a8);
    v26->_utteranceStart = a9;
    objc_storeStrong((id *)&v26->_latticeMitigatorResult, a10);
    v33 = objc_msgSend(v23, "copy");
    nBestVoiceCommandInterpretations = v26->_nBestVoiceCommandInterpretations;
    v26->_nBestVoiceCommandInterpretations = (NSArray *)v33;

    v35 = objc_msgSend(v24, "copy");
    preITNNBestVoiceCommandInterpretations = v26->_preITNNBestVoiceCommandInterpretations;
    v26->_preITNNBestVoiceCommandInterpretations = (NSArray *)v35;

    v26->_recognitionPaused = a13;
    v26->_firstResultAfterResume = a14;
    objc_storeStrong((id *)&v26->_endOfSentenceLikelihood, a15);
    v26->_numTokensExcludingTriggerPhrase = a16;
    objc_storeStrong((id *)&v26->_voiceCommandDebugInfo, a17);
    objc_storeStrong((id *)&v26->_performanceMarkers, a18);
  }

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v6;
  double v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  _EARSpeechRecognitionResultPackage *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v18 = [_EARSpeechRecognitionResultPackage alloc];
  -[_EARSpeechRecognitionResultPackage recognition](self, "recognition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage preITNRecognition](self, "preITNRecognition");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage unrepairedRecognition](self, "unrepairedRecognition");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_EARSpeechRecognitionResultPackage recognitionIsFormatted](self, "recognitionIsFormatted");
  v5 = -[_EARSpeechRecognitionResultPackage isFinal](self, "isFinal");
  -[_EARSpeechRecognitionResultPackage audioAnalytics](self, "audioAnalytics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage utteranceStart](self, "utteranceStart");
  v7 = v6;
  -[_EARSpeechRecognitionResultPackage latticeMitigatorResult](self, "latticeMitigatorResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage nBestVoiceCommandInterpretations](self, "nBestVoiceCommandInterpretations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage preITNNBestVoiceCommandInterpretations](self, "preITNNBestVoiceCommandInterpretations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_EARSpeechRecognitionResultPackage recognitionPaused](self, "recognitionPaused");
  v10 = -[_EARSpeechRecognitionResultPackage firstResultAfterResume](self, "firstResultAfterResume");
  -[_EARSpeechRecognitionResultPackage endOfSentenceLikelihood](self, "endOfSentenceLikelihood");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_EARSpeechRecognitionResultPackage numTokensExcludingTriggerPhrase](self, "numTokensExcludingTriggerPhrase");
  -[_EARSpeechRecognitionResultPackage voiceCommandDebugInfo](self, "voiceCommandDebugInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResultPackage performanceMarkers](self, "performanceMarkers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v15) = v10;
  LOBYTE(v15) = v9;
  v19 = -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:](v18, "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:audioAnalytics:utteranceStart:latticeMitigatorResult:nBestVoiceCommandInterpretations:preITNNBestVoiceCommandInterpretations:recognitionPaused:firstResultAfterResume:endOfSentenceLikelihood:numTokensExcludingTriggerPhrase:voiceCommandDebugInfo:performanceMarkers:", v24, v23, v22, v4, v5, v21, v7, v20, v8, v17, v15, v16, v11, v12,
          v13);

  return v19;
}

- (id)nBestResults
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _EARSpeechRecognitionResult *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15[3];
  uint64_t v16[3];
  void **v17;

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_EARSpeechRecognition nBest](self->_recognition, "nBest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognition nBest](self->_preITNRecognition, "nBest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 >= objc_msgSend(v4, "count"))
    v6 = v4;
  else
    v6 = v3;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = [_EARSpeechRecognitionResult alloc];
      objc_msgSend(v3, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v10, v16);
      objc_msgSend(v4, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v11, v15);
      v12 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:](v9, "_initWithTokens:preITNTokens:", v16, v15);
      v17 = (void **)v15;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v17);

      v17 = (void **)v16;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v17);

      objc_msgSend(v14, "addObject:", v12);
      ++v8;
    }
    while (v7 != v8);
  }

  return v14;
}

- (void)setCorrectPartialResultIndexList:(id)a3
{
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, a3);
}

- (void)setCorrectPartialResultIndexList:(const void *)a3 oneBestFinalResult:(const void *)a4 partialResultIndexOffset:(int)a5
{
  _QWORD *v9;
  uint64_t v10;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer end;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  std::string *v16;
  std::string::size_type size;
  _QWORD *v18;
  _QWORD *v19;
  void **v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  void **v25;
  uint64_t v26;
  _QWORD *v27;
  NSArray *v28;
  NSArray *correctPartialResultIndexList;
  _EARPerformanceMarkers *v30;
  void *v31;
  void *v32;
  _EARPerformanceMarkers *v33;
  _EARPerformanceMarkers *performanceMarkers;
  uint64_t v35[2];
  void *__p[2];
  unsigned __int8 v37;
  uint64_t v38[2];
  void *v39[2];
  unsigned __int8 v40;
  std::string v41;
  std::vector<int> v42;
  unsigned __int8 **v43;
  _QWORD *v44;
  unint64_t v45;
  std::vector<int> v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;

  if (*(_QWORD *)a4 == *((_QWORD *)a4 + 1))
  {
    if (quasar::gLogLevel >= 6)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"[TTAW] Final Result Empty.", 26);
      quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)&v47);
    }
  }
  else
  {
    quasar::strictAlignTokensToFirstSeenPartialResults((uint64_t *)a3, (uint64_t *)a4, a5, &v46);
    v43 = 0;
    v44 = 0;
    v45 = 0;
    std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v43, *(uint64_t **)a3, *((uint64_t **)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
    v9 = v44;
    if ((unint64_t)v44 >= v45)
    {
      v10 = std::vector<std::vector<quasar::Token>>::__emplace_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v43, (uint64_t *)a4);
    }
    else
    {
      *v44 = 0;
      v9[1] = 0;
      v9[2] = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v9, *(_QWORD *)a4, *((_QWORD *)a4 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 5));
      v10 = (uint64_t)(v9 + 3);
    }
    v44 = (_QWORD *)v10;
    quasar::alignTokensToFirstSeenPartialResultsV3(&v43, (unsigned __int8 **)a4, a5, &v42);
    begin = v42.__begin_;
    end = v42.__end_;
    if (v42.__begin_ != v42.__end_)
    {
      v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
      do
      {
        if (*begin != -1)
        {
          v14 = (*begin - a5);
          if ((v14 & 0x80000000) != 0 || v13 < v14)
          {
            kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"0 <= partialResultIndexWithoutOffset && partialResultIndexWithoutOffset <= partialResults.size()", 96);
            kaldi::KaldiErrorMessage::~KaldiErrorMessage((kaldi::KaldiErrorMessage *)&v47);
          }
          if (v13 == v14)
            *begin = -2;
        }
        ++begin;
      }
      while (begin != end);
    }
    if (quasar::gLogLevel > 5)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v47);
      v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v47, (uint64_t)"[TTAW] oneBestFinalResult: ", 27);
      quasar::tokens2Str((uint64_t *)a4, &v41);
      if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = &v41;
      else
        v16 = (std::string *)v41.__r_.__value_.__r.__words[0];
      if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
      else
        size = v41.__r_.__value_.__l.__size_;
      v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, size);
      v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)", correctIndexList: [", 21);
      v38[0] = (uint64_t)",";
      v38[1] = 1;
      quasar::join<std::vector<int>>((uint64_t *)&v46, v38);
      if ((v40 & 0x80u) == 0)
        v20 = v39;
      else
        v20 = (void **)v39[0];
      if ((v40 & 0x80u) == 0)
        v21 = v40;
      else
        v21 = (uint64_t)v39[1];
      v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
      v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)"]", 1);
      v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)", correctAlignedIndexList: [", 28);
      v35[0] = (uint64_t)",";
      v35[1] = 1;
      quasar::join<std::vector<int>>((uint64_t *)&v42, v35);
      if ((v37 & 0x80u) == 0)
        v25 = __p;
      else
        v25 = (void **)__p[0];
      if ((v37 & 0x80u) == 0)
        v26 = v37;
      else
        v26 = (uint64_t)__p[1];
      v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)v25, v26);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"]", 1);
      if ((char)v37 < 0)
        operator delete(__p[0]);
      if ((char)v40 < 0)
        operator delete(v39[0]);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v41.__r_.__value_.__l.__data_);
      quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)&v47);
    }
    EARHelpers::VectorToArray<int>((unsigned int **)&v46);
    v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
    correctPartialResultIndexList = self->_correctPartialResultIndexList;
    self->_correctPartialResultIndexList = v28;

    v30 = [_EARPerformanceMarkers alloc];
    EARHelpers::VectorToArray<int>((unsigned int **)&v46);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    EARHelpers::VectorToArray<int>((unsigned int **)&v42);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[_EARPerformanceMarkers initWithCorrectPartialResultIndexList:correctAlignedPartialResultIndexList:tokenDelayInMilliseconds:](v30, "initWithCorrectPartialResultIndexList:correctAlignedPartialResultIndexList:tokenDelayInMilliseconds:", v31, v32, 0);
    performanceMarkers = self->_performanceMarkers;
    self->_performanceMarkers = v33;

    if (v42.__begin_)
    {
      v42.__end_ = v42.__begin_;
      operator delete(v42.__begin_);
    }
    *(_QWORD *)&v47 = &v43;
    std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
    if (v46.__begin_)
    {
      v46.__end_ = v46.__begin_;
      operator delete(v46.__begin_);
    }
  }
}

- (BOOL)hasNonEmptyToken
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_EARSpeechRecognitionResultPackage recognition](self, "recognition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tokenSausage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v34;
    v21 = *(_QWORD *)v34;
    do
    {
      v6 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v30;
          v23 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v30 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              v25 = 0u;
              v26 = 0u;
              v27 = 0u;
              v28 = 0u;
              v13 = v12;
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
              if (v14)
              {
                v15 = *(_QWORD *)v26;
                while (2)
                {
                  for (j = 0; j != v14; ++j)
                  {
                    if (*(_QWORD *)v26 != v15)
                      objc_enumerationMutation(v13);
                    objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "tokenName", v21);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = objc_msgSend(v17, "length") == 0;

                    if (!v18)
                    {

                      v19 = 1;
                      v3 = v24;
                      goto LABEL_26;
                    }
                  }
                  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
                  if (v14)
                    continue;
                  break;
                }
              }

              v10 = v23;
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          }
          while (v9);
        }

        ++v6;
        v5 = v21;
        v3 = v24;
      }
      while (v6 != v22);
      v4 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      v19 = 0;
    }
    while (v4);
  }
  else
  {
    v19 = 0;
  }
LABEL_26:

  return v19;
}

- (void)setFirstResultAfterResume:(BOOL)a3
{
  self->_firstResultAfterResume = a3;
}

- (_EARSpeechRecognition)recognition
{
  return self->_recognition;
}

- (_EARSpeechRecognition)preITNRecognition
{
  return self->_preITNRecognition;
}

- (_EARSpeechRecognition)unrepairedRecognition
{
  return self->_unrepairedRecognition;
}

- (BOOL)recognitionIsFormatted
{
  return self->_recognitionIsFormatted;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (_EARAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (_EARLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (NSArray)nBestVoiceCommandInterpretations
{
  return self->_nBestVoiceCommandInterpretations;
}

- (NSArray)preITNNBestVoiceCommandInterpretations
{
  return self->_preITNNBestVoiceCommandInterpretations;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (void)setRecognitionPaused:(BOOL)a3
{
  self->_recognitionPaused = a3;
}

- (BOOL)firstResultAfterResume
{
  return self->_firstResultAfterResume;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (int64_t)numTokensExcludingTriggerPhrase
{
  return self->_numTokensExcludingTriggerPhrase;
}

- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo
{
  return self->_voiceCommandDebugInfo;
}

- (_EARPerformanceMarkers)performanceMarkers
{
  return self->_performanceMarkers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMarkers, 0);
  objc_storeStrong((id *)&self->_voiceCommandDebugInfo, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_preITNNBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_nBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_unrepairedRecognition, 0);
  objc_storeStrong((id *)&self->_preITNRecognition, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
}

@end
