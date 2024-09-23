@implementation EARSpeechRecognitionResult

- (EARSpeechRecognitionResult)initWithResult:(id)a3
{
  id v4;
  EARSpeechRecognitionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSArray *tokens;
  uint64_t v19;
  NSArray *preITNTokens;
  double v21;
  uint64_t v22;
  NSArray *voiceCommandInterpretations;
  uint64_t v24;
  NSArray *preITNVoiceCommandInterpretations;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EARSpeechRecognitionResult;
  v5 = -[EARSpeechRecognitionResult init](&v34, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "tokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __45__EARSpeechRecognitionResult_initWithResult___block_invoke;
    v32[3] = &unk_1E64858C0;
    v33 = v8;
    v11 = v8;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v32);

    v12 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "preITNTokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "preITNTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v10;
    v28 = 3221225472;
    v29 = __45__EARSpeechRecognitionResult_initWithResult___block_invoke_2;
    v30 = &unk_1E64858C0;
    v31 = v14;
    v16 = v14;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", &v27);

    v17 = objc_msgSend(v11, "copy", v27, v28, v29, v30);
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v17;

    v19 = objc_msgSend(v16, "copy");
    preITNTokens = v5->_preITNTokens;
    v5->_preITNTokens = (NSArray *)v19;

    objc_msgSend(v4, "confidence");
    v5->_confidence = v21;
    objc_msgSend(v4, "voiceCommandInterpretations");
    v22 = objc_claimAutoreleasedReturnValue();
    voiceCommandInterpretations = v5->_voiceCommandInterpretations;
    v5->_voiceCommandInterpretations = (NSArray *)v22;

    objc_msgSend(v4, "preITNVoiceCommandInterpretations");
    v24 = objc_claimAutoreleasedReturnValue();
    preITNVoiceCommandInterpretations = v5->_preITNVoiceCommandInterpretations;
    v5->_preITNVoiceCommandInterpretations = (NSArray *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *tokens;
  id v5;

  tokens = self->_tokens;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tokens, CFSTR("tokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preITNTokens, CFSTR("preITNTokens"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceCommandInterpretations, CFSTR("voiceCommandInterpretations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preITNVoiceCommandInterpretations, CFSTR("preITNVoiceCommandInterpretations"));

}

- (EARSpeechRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  EARSpeechRecognitionResult *v5;
  uint64_t v6;
  NSArray *tokens;
  uint64_t v8;
  NSArray *preITNTokens;
  double v10;
  uint64_t v11;
  NSArray *voiceCommandInterpretations;
  uint64_t v13;
  NSArray *preITNVoiceCommandInterpretations;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EARSpeechRecognitionResult;
  v5 = -[EARSpeechRecognitionResult init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("tokens"));
    v6 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("preITNTokens"));
    v8 = objc_claimAutoreleasedReturnValue();
    preITNTokens = v5->_preITNTokens;
    v5->_preITNTokens = (NSArray *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v10;
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("voiceCommandInterpretations"));
    v11 = objc_claimAutoreleasedReturnValue();
    voiceCommandInterpretations = v5->_voiceCommandInterpretations;
    v5->_voiceCommandInterpretations = (NSArray *)v11;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("preITNVoiceCommandInterpretations"));
    v13 = objc_claimAutoreleasedReturnValue();
    preITNVoiceCommandInterpretations = v5->_preITNVoiceCommandInterpretations;
    v5->_preITNVoiceCommandInterpretations = (NSArray *)v13;

  }
  return v5;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (NSArray)preITNTokens
{
  return self->_preITNTokens;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preITNVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_voiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_preITNTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

void __45__EARSpeechRecognitionResult_initWithResult___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  EARSpeechRecognitionToken *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[EARSpeechRecognitionToken initWithToken:]([EARSpeechRecognitionToken alloc], "initWithToken:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

void __45__EARSpeechRecognitionResult_initWithResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  EARSpeechRecognitionToken *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[EARSpeechRecognitionToken initWithToken:]([EARSpeechRecognitionToken alloc], "initWithToken:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
