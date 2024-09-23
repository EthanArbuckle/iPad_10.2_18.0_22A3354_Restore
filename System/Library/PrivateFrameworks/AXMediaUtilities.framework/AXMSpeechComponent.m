@implementation AXMSpeechComponent

- (AXMSpeechComponent)init
{
  AXMSpeechComponent *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXMSpeechComponent;
  v2 = -[AXMOutputComponent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C89B98]);
    -[AXMSpeechComponent setSynthesizer:](v2, "setSynthesizer:", v3);

    -[AXMSpeechComponent synthesizer](v2, "synthesizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

  }
  return v2;
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)canHandleRequest:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "speechActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)handleRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a4;
  objc_msgSend(a3, "speechActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, 0);
  -[AXMSpeechComponent currentRequestCompletionBlock](self, "currentRequestCompletionBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    AXMediaLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[AXMSpeechComponent handleRequest:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  objc_msgSend(MEMORY[0x1E0C89BA8], "speechUtteranceWithAttributedString:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMSpeechComponent setCurrentRequestCompletionBlock:](self, "setCurrentRequestCompletionBlock:", v6);

  -[AXMSpeechComponent synthesizer](self, "synthesizer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "speakUtterance:", v20);

}

- (void)stopSpeakingImmediately
{
  id v2;

  -[AXMSpeechComponent synthesizer](self, "synthesizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSpeakingAtBoundary:", 0);

}

- (void)stopSpeakingAtNextWord
{
  id v2;

  -[AXMSpeechComponent synthesizer](self, "synthesizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSpeakingAtBoundary:", 1);

}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  AXMediaLogSpeech();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "attributedSpeechString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "speech started: '%@'", (uint8_t *)&v8, 0xCu);

  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AXMediaLogSpeech();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "attributedSpeechString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B0E3B000, v6, OS_LOG_TYPE_DEFAULT, "speech finished: '%@'", (uint8_t *)&v19, 0xCu);

  }
  -[AXMSpeechComponent currentRequestCompletionBlock](self, "currentRequestCompletionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    AXMediaLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[AXMSpeechComponent speechSynthesizer:didFinishSpeechUtterance:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  -[AXMSpeechComponent currentRequestCompletionBlock](self, "currentRequestCompletionBlock");
  v18 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[AXMSpeechComponent setCurrentRequestCompletionBlock:](self, "setCurrentRequestCompletionBlock:", 0);
  if (v18)
    v18[2](v18);

}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AXMediaLogSpeech();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "attributedSpeechString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B0E3B000, v6, OS_LOG_TYPE_DEFAULT, "speech canceled: '%@'", (uint8_t *)&v19, 0xCu);

  }
  -[AXMSpeechComponent currentRequestCompletionBlock](self, "currentRequestCompletionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    AXMediaLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[AXMSpeechComponent speechSynthesizer:didCancelSpeechUtterance:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  -[AXMSpeechComponent currentRequestCompletionBlock](self, "currentRequestCompletionBlock");
  v18 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  -[AXMSpeechComponent setCurrentRequestCompletionBlock:](self, "setCurrentRequestCompletionBlock:", 0);
  if (v18)
    v18[2](v18);

}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  AXMediaLogSpeech();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "attributedSpeechString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "speech paused: '%@'", (uint8_t *)&v8, 0xCu);

  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  AXMediaLogSpeech();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "attributedSpeechString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1B0E3B000, v5, OS_LOG_TYPE_DEFAULT, "speech resumed: '%@'", (uint8_t *)&v8, 0xCu);

  }
}

- (AVSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_synthesizer, a3);
}

- (id)currentRequestCompletionBlock
{
  return self->_currentRequestCompletionBlock;
}

- (void)setCurrentRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentRequestCompletionBlock, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
}

- (void)handleRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, a1, a3, "handleRequest: expected nil completion block", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechSynthesizer:(uint64_t)a3 didFinishSpeechUtterance:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, a1, a3, "didFinish: expected completion block, but found nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechSynthesizer:(uint64_t)a3 didCancelSpeechUtterance:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, a1, a3, "didCancel: expected completion block, but found nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
