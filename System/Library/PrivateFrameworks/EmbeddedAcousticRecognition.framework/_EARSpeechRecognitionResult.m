@implementation _EARSpeechRecognitionResult

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std::allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:
{
  id v6;
  _QWORD v8[3];
  _QWORD v9[3];
  void **v10;

  memset(v9, 0, sizeof(v9));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v9, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  memset(v8, 0, sizeof(v8));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v8, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
  v6 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:confidence:](self, "_initWithTokens:preITNTokens:confidence:", v9, v8, 0.0);
  v10 = (void **)v8;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v10);
  v10 = (void **)v9;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v10);
  return v6;
}

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :allocator<quasar::Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:
{
  id v8;
  _QWORD v10[3];
  _QWORD v11[3];
  void **v12;

  memset(v11, 0, sizeof(v11));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v11, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
  memset(v10, 0, sizeof(v10));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v10, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
  v8 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:confidence:voiceCommandInterpretations:preITNVoiceCommandInterpretations:utteranceStart:](self, "_initWithTokens:preITNTokens:confidence:voiceCommandInterpretations:preITNVoiceCommandInterpretations:utteranceStart:", v11, v10, 0, 0, a5, 0.0);
  v12 = (void **)v10;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v12);
  v12 = (void **)v11;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

- (id)_initWithTokens:()vector<quasar:(std:()vector<quasar:(std:(double)a5 :(id)a6 allocator<quasar:(id)a7 :(double)a8 Token>> *)a4 :Token :allocator<quasar::Token>> *)a3 :Token preITNTokens:confidence:voiceCommandInterpretations:preITNVoiceCommandInterpretations:utteranceStart:
{
  id v14;
  id v15;
  _EARSpeechRecognitionResult *v16;
  _EARSpeechRecognitionResult *v17;
  _EARSpeechRecognitionResult *v18;
  uint64_t p_quasarTokens;
  uint64_t v20;
  NSArray *voiceCommandInterpretations;
  uint64_t v22;
  NSArray *preITNVoiceCommandInterpretations;
  objc_super v25;

  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_EARSpeechRecognitionResult;
  v16 = -[_EARSpeechRecognitionResult init](&v25, sel_init);
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    p_quasarTokens = (uint64_t)&v16->_quasarTokens;
    if (&v17->_quasarTokens != a3)
      std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(p_quasarTokens, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a3->__end_ - (char *)a3->__begin_) >> 5));
    if (&v17->_quasarPreItnTokens != a4)
      std::vector<quasar::Token>::__assign_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>((uint64_t)&v17->_quasarPreItnTokens, (uint64_t)a4->__begin_, (uint64_t)a4->__end_, 0x6DB6DB6DB6DB6DB7 * (((char *)a4->__end_ - (char *)a4->__begin_) >> 5));
    v18->_confidence = a5;
    v20 = objc_msgSend(v14, "copy");
    voiceCommandInterpretations = v18->_voiceCommandInterpretations;
    v18->_voiceCommandInterpretations = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    preITNVoiceCommandInterpretations = v18->_preITNVoiceCommandInterpretations;
    v18->_preITNVoiceCommandInterpretations = (NSArray *)v22;

    v18->_utteranceStart = a8;
  }

  return v18;
}

- (NSArray)tokens
{
  return (NSArray *)EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens((const quasar::Token **)&self->_quasarTokens);
}

- (NSArray)preITNTokens
{
  return (NSArray *)EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens((const quasar::Token **)&self->_quasarPreItnTokens);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EARSpeechRecognitionResult;
  -[_EARSpeechRecognitionResult description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResult tokens](self, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARSpeechRecognitionResult preITNTokens](self, "preITNTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" tokens=%@, preITNTokens=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSArray)voiceCommandInterpretations
{
  return self->_voiceCommandInterpretations;
}

- (NSArray)preITNVoiceCommandInterpretations
{
  return self->_preITNVoiceCommandInterpretations;
}

- (vector<quasar::Token,)quasarTokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, (uint64_t)self->_quasarTokens.__begin_, (uint64_t)self->_quasarTokens.__end_, 0x6DB6DB6DB6DB6DB7* (((char *)self->_quasarTokens.__end_- (char *)self->_quasarTokens.__begin_) >> 5));
}

- (vector<quasar::Token,)quasarPreItnTokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<quasar::Token, std::allocator<quasar::Token>> *)std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(retstr, (uint64_t)self->_quasarPreItnTokens.__begin_, (uint64_t)self->_quasarPreItnTokens.__end_, 0x6DB6DB6DB6DB6DB7* (((char *)self->_quasarPreItnTokens.__end_- (char *)self->_quasarPreItnTokens.__begin_) >> 5));
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (void).cxx_destruct
{
  vector<quasar::Token, std::allocator<quasar::Token>> *p_quasarPreItnTokens;

  p_quasarPreItnTokens = &self->_quasarPreItnTokens;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_quasarPreItnTokens);
  p_quasarPreItnTokens = &self->_quasarTokens;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_quasarPreItnTokens);
  objc_storeStrong((id *)&self->_preITNVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_voiceCommandInterpretations, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
