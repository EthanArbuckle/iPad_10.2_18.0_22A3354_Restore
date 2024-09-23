@implementation BRLTSTranslator

- (BRLTSTranslator)initWithBundle:(id)a3
{
  id v5;
  BRLTSTranslator *v6;
  BRLTSTranslator *v7;
  BRLTTranslatorProtocol *translator;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRLTSTranslator;
  v6 = -[BRLTSTranslator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    translator = v7->_translator;
    v7->_translator = 0;

  }
  return v7;
}

- (BRLTTranslatorProtocol)translator
{
  BRLTTranslatorProtocol *translator;
  BRLTTranslatorProtocol *v3;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  BRLTTranslatorProtocol *v11;
  NSObject *v12;
  uint64_t v13;

  translator = self->_translator;
  if (!translator)
  {
    -[BRLTSTranslator bundle](self, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "principalClass");

    if (v6)
    {
      if ((BRLTTranslatorClassIsValid(v6) & 1) == 0)
      {
        BRLTLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[BRLTSTranslator translator].cold.4((uint64_t)v6, v12, v13);

        goto LABEL_18;
      }
      v7 = objc_alloc_init((Class)v6);
      v8 = -[NSObject interfaceVersion](v7, "interfaceVersion");
      BRLTLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == 7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[BRLTSTranslator translator].cold.2((uint64_t)v7, v10);

        v11 = self->_translator;
        self->_translator = (BRLTTranslatorProtocol *)v7;

        translator = self->_translator;
        goto LABEL_2;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BRLTSTranslator translator].cold.3(v7, v10);

    }
    else
    {
      BRLTLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BRLTSTranslator translator].cold.1(self, v7);
    }

LABEL_18:
    v3 = 0;
    return v3;
  }
LABEL_2:
  v3 = translator;
  return v3;
}

- (id)brailleForText:(id)a3 parameters:(id)a4 locations:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[BRLTSTranslator translator](self, "translator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActiveTable:", v11);

  if (v8)
  {
    -[BRLTSTranslator translator](self, "translator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "mode");
    v14 = objc_msgSend(v9, "textPositionsRange");
    v16 = v15;
    objc_msgSend(v9, "textFormattingRanges");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:", v8, v13, a5, v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  BRLTLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "language");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (a5)
      v23 = *a5;
    else
      v23 = 0;
    v24 = 138413058;
    v25 = v8;
    v26 = 2112;
    v27 = v18;
    v28 = 2112;
    v29 = v21;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_2114B8000, v19, OS_LOG_TYPE_DEBUG, "Translated text:'%@' -> '%@' lang:%@ positions:%@", (uint8_t *)&v24, 0x2Au);

  }
  return v18;
}

- (id)textForBraille:(id)a3 parameters:(id)a4 locations:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[BRLTSTranslator translator](self, "translator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActiveTable:", v11);

  if (v8)
  {
    -[BRLTSTranslator translator](self, "translator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textForPrintBraille:mode:locations:", v8, objc_msgSend(v9, "mode"), a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  BRLTLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "language");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (a5)
      v18 = *a5;
    else
      v18 = 0;
    v19 = 138413058;
    v20 = v8;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v16;
    v25 = 2112;
    v26 = v18;
    _os_log_debug_impl(&dword_2114B8000, v14, OS_LOG_TYPE_DEBUG, "Translated braille: '%@' -> '%@' lang:%@ positions:%@", (uint8_t *)&v19, 0x2Au);

  }
  return v13;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_translator, 0);
}

- (void)translator
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_2114B8000, a2, a3, "%@ does not conform to translator protocol", (uint8_t *)&v3);
}

@end
