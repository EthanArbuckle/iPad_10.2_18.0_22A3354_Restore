@implementation APUIAppClipView

- (void)layoutSuggestion:(id)a3
{
  id v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapRecognizer;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  Class v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  ATXHeroData **p_prediction;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  NSObject *v48;
  APUIAppClipView *v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[APUISuggestionView setSuggestion:](self, "setSuggestion:", v4);
    -[APUISuggestionView createViewsIfNeeded](self, "createViewsIfNeeded");
    v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__tapRecognized_);
    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = v5;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_tapRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_tapRecognizer, "setNumberOfTouchesRequired:", 1);
    -[APUIAppClipView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapRecognizer);
    -[APUISuggestionView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiSpecification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    v10 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(v4, "executableSpecification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "executableClassString");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(v12);
    objc_msgSend(v4, "executableSpecification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "executable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClass:fromData:error:", v13, v15, &v50);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v50;

    if (v16 || !v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        p_prediction = &self->_prediction;
        objc_storeStrong((id *)&self->_prediction, v16);
        -[ATXHeroData clipMetadata](self->_prediction, "clipMetadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fullAppCachedIconFilePath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "copy");

        if (v22)
        {
          dispatch_get_global_queue(25, 0);
          v23 = objc_claimAutoreleasedReturnValue();
          v44 = MEMORY[0x24BDAC760];
          v45 = 3221225472;
          v46 = __36__APUIAppClipView_layoutSuggestion___block_invoke;
          v47 = &unk_24DB7D290;
          v48 = v22;
          v49 = self;
          dispatch_async(v23, &v44);

        }
        -[APUISuggestionView titleLabel](self, "titleLabel", v44, v45, v46, v47);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeroData clipMetadata](*p_prediction, "clipMetadata");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedTitleForClipSuggestion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v26);

        -[APUISuggestionView subtitleLabel](self, "subtitleLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHeroData clipMetadata](*p_prediction, "clipMetadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedSubtitleForClipSuggestion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setText:", v29);

      }
      else
      {
        __atxlog_handle_ui();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[APUIAppClipView layoutSuggestion:].cold.3((uint64_t)v16, v22);
      }

      v30 = (void *)MEMORY[0x24BDF6768];
      v31 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "systemImageNamed:withConfiguration:", CFSTR("location.fill"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textAttachmentWithImage:", v33);
      v18 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)objc_opt_new();
      v35 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v4, "uiSpecification");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "reason");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v35, "initWithString:", v37);
      objc_msgSend(v34, "appendAttributedString:", v38);

      v39 = objc_alloc(MEMORY[0x24BDD1458]);
      v51 = *MEMORY[0x24BDF6608];
      v52[0] = &unk_24DB83E10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v39, "initWithString:attributes:", CFSTR("​"), v40);
      objc_msgSend(v34, "appendAttributedString:", v41);

      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v18);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "appendAttributedString:", v42);

      -[APUISuggestionView reasonLabel](self, "reasonLabel");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setAttributedText:", v34);

      -[APUISuggestionView installReasonLabelIfNecessary](self, "installReasonLabelIfNecessary");
    }
    else
    {
      __atxlog_handle_ui();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[APUIAppClipView layoutSuggestion:].cold.2();
    }

  }
  else
  {
    __atxlog_handle_ui();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[APUIAppClipView layoutSuggestion:].cold.1(v17);
  }

}

void __36__APUIAppClipView_layoutSuggestion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    +[APUIAppIconDataSource _appClipIconTreatmentForCGImage:](APUIAppIconDataSource, "_appClipIconTreatmentForCGImage:", objc_msgSend(objc_retainAutorelease(v2), "CGImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__APUIAppClipView_layoutSuggestion___block_invoke_2;
    v6[3] = &unk_24DB7D290;
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

  }
}

void __36__APUIAppClipView_layoutSuggestion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 40));

}

- (void)openPredictionAction
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = 5517;
  _os_log_error_impl(&dword_219979000, log, OS_LOG_TYPE_ERROR, "e:%ld * SuggestionsWidget: tried to tap a suggestion before the last execution ended", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __39__APUIAppClipView_openPredictionAction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view:didTapSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__APUIAppClipView_openPredictionAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void (*v6)(uint64_t);
  uint64_t *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  __atxlog_handle_ui();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__APUIAppClipView_openPredictionAction__block_invoke_2_cold_1();

    v12 = MEMORY[0x24BDAC760];
    v6 = __39__APUIAppClipView_openPredictionAction__block_invoke_22;
    v7 = &v12;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "clipMetadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clipURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_219979000, v5, OS_LOG_TYPE_DEFAULT, "SuggestionsWidget: Opened app clip request for url: %@", buf, 0xCu);

    }
    v11 = MEMORY[0x24BDAC760];
    v6 = __39__APUIAppClipView_openPredictionAction__block_invoke_23;
    v7 = &v11;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_24DB7D290;
  v10 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = (uint64_t)v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __39__APUIAppClipView_openPredictionAction__block_invoke_22(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view:didFailExecutingSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__APUIAppClipView_openPredictionAction__block_invoke_23(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view:didFinishExecutingSuggestion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

- (void)layoutSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_219979000, log, OS_LOG_TYPE_FAULT, "e:fault SuggestionsWidget: clip suggestion is nil", v1, 2u);
}

- (void)layoutSuggestion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: error unarchiving data for clip suggestion: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)layoutSuggestion:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  v4 = v3;
  OUTLINED_FUNCTION_1_1(&dword_219979000, a2, v5, "e:%ld * SuggestionsWidget: error class ATXHeroData expected. Class read: %@", v6);

}

void __39__APUIAppClipView_openPredictionAction__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_219979000, v0, v1, "e:%ld * SuggestionsWidget: Error while opening app clip: %@", v2);
  OUTLINED_FUNCTION_3();
}

@end
