@implementation AFUtteranceSuggestions

- (AFUtteranceSuggestions)initWithLanguageCode:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AFUtteranceSuggestions *v8;
  uint64_t v9;
  NSString *languageCode;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AFUtteranceSuggestions;
  v8 = -[AFUtteranceSuggestions init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    languageCode = v8->_languageCode;
    v8->_languageCode = (NSString *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("Siri Utterance Suggestions Queue", v11);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

  }
  return v8;
}

- (id)_suggestionsFilePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siri.suggestions-%@.plist"), self->_languageCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)getSuggestedUtterancesWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke;
  v7[3] = &unk_1E3A36FA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setSuggestedUtterances:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__AFUtteranceSuggestions_setSuggestedUtterances___block_invoke;
  v7[3] = &unk_1E3A36FC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (AFUtteranceSuggestionsDelegate)delegate
{
  return (AFUtteranceSuggestionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_suggestedUtterances, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__AFUtteranceSuggestions_setSuggestedUtterances___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  _QWORD *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToArray:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "suggestionsDidChange:", *(_QWORD *)(a1 + 32));

    v6 = *(_QWORD **)(a1 + 32);
    v7 = (void *)v6[2];
    objc_msgSend(v6, "_suggestionsFilePath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeToFile:atomically:", v8, 1);

  }
}

void __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[2])
  {
    v3 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v2, "_suggestionsFilePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithContentsOfFile:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

  }
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke_2;
    v10[3] = &unk_1E3A36FA0;
    v9 = v8;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __63__AFUtteranceSuggestions_getSuggestedUtterancesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
