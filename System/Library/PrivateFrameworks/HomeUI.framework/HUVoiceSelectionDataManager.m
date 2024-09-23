@implementation HUVoiceSelectionDataManager

- (HUVoiceSelectionDataManager)initWithInputLanguageCode:(id)a3 listOfVoices:(id)a4
{
  id v7;
  id v8;
  HUVoiceSelectionDataManager *v9;
  HUVoiceSelectionDataManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUVoiceSelectionDataManager;
  v9 = -[SUICVoiceSelectionDefaultDataManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputLanguageCode, a3);
    objc_storeStrong((id *)&v10->_listOfVoices, a4);
  }

  return v10;
}

- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  HUVoiceSelectionDataManager *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[HUVoiceSelectionDataManager listOfVoices](self, "listOfVoices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __83__HUVoiceSelectionDataManager_voicesForRecognitionLanguageCode_outputLanguageCode___block_invoke;
  v19 = &unk_1E6F518A0;
  v20 = v6;
  v21 = self;
  v22 = v7;
  v10 = v8;
  v23 = v10;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "na_each:", &v16);

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Returning matchingVoices = %@", buf, 0xCu);
  }

  v14 = (void *)objc_msgSend(v10, "copy", v16, v17, v18, v19);
  return v14;
}

void __83__HUVoiceSelectionDataManager_voicesForRecognitionLanguageCode_outputLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "inputLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) == 0)
  {

    goto LABEL_5;
  }
  v5 = *(void **)(a1 + 48);
  objc_msgSend(v8, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6);

  v7 = v8;
  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
LABEL_5:
    v7 = v8;
  }

}

- (NSArray)listOfVoices
{
  return self->_listOfVoices;
}

- (void)setListOfVoices:(id)a3
{
  objc_storeStrong((id *)&self->_listOfVoices, a3);
}

- (NSString)inputLanguageCode
{
  return self->_inputLanguageCode;
}

- (void)setInputLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);
  objc_storeStrong((id *)&self->_listOfVoices, 0);
}

@end
