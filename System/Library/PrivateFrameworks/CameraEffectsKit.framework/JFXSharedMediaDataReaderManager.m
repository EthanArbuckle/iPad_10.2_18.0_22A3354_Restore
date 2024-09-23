@implementation JFXSharedMediaDataReaderManager

- (JFXSharedMediaDataReaderManager)initWithPlayableElement:(id)a3
{
  id v5;
  JFXSharedMediaDataReaderManager *v6;
  JFXSharedMediaDataReaderManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXSharedMediaDataReaderManager;
  v6 = -[JFXSharedMediaDataReaderManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playableElement, a3);

  return v7;
}

- (JFXARMetadataMediaReader)sharedARMetadataReader
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  -[JFXSharedMediaDataReaderManager weakSharedARMetadataReader](self, "weakSharedARMetadataReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    JFXLog_DebugMediaDataReader();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[JFXSharedMediaDataReaderManager sharedARMetadataReader].cold.2();

    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[JFXSharedMediaDataReaderManager playableElement](self, "playableElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("sharedARMetadataReader"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXSharedMediaDataReaderManager playableElement](self, "playableElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createARMetadataReaderWithCreationAttributesProvider:name:", v11, v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[JFXSharedMediaDataReaderManager setWeakSharedARMetadataReader:](self, "setWeakSharedARMetadataReader:", v5);
      JFXLog_DebugMediaDataReader();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[JFXSharedMediaDataReaderManager sharedARMetadataReader].cold.1();

    }
  }

  return (JFXARMetadataMediaReader *)v5;
}

- (JFXDepthDataMediaReader)sharedDepthDataReader
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  -[JFXSharedMediaDataReaderManager weakSharedDepthDataReader](self, "weakSharedDepthDataReader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    JFXLog_DebugMediaDataReader();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[JFXSharedMediaDataReaderManager sharedDepthDataReader].cold.2();

    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[JFXSharedMediaDataReaderManager playableElement](self, "playableElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("sharedDepthDataReader"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[JFXMediaDataReaderFactory sharedInstance](JFXMediaDataReaderFactory, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXSharedMediaDataReaderManager playableElement](self, "playableElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDepthDataReaderWithCreationAttributesProvider:name:", v11, v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[JFXSharedMediaDataReaderManager setWeakSharedDepthDataReader:](self, "setWeakSharedDepthDataReader:", v5);
      JFXLog_DebugMediaDataReader();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[JFXSharedMediaDataReaderManager sharedARMetadataReader].cold.1();

    }
  }

  return (JFXDepthDataMediaReader *)v5;
}

- (JFXPlayableElement)playableElement
{
  return self->_playableElement;
}

- (void)setPlayableElement:(id)a3
{
  objc_storeStrong((id *)&self->_playableElement, a3);
}

- (JFXARMetadataMediaReader)weakSharedARMetadataReader
{
  return (JFXARMetadataMediaReader *)objc_loadWeakRetained((id *)&self->_weakSharedARMetadataReader);
}

- (void)setWeakSharedARMetadataReader:(id)a3
{
  objc_storeWeak((id *)&self->_weakSharedARMetadataReader, a3);
}

- (JFXDepthDataMediaReader)weakSharedDepthDataReader
{
  return (JFXDepthDataMediaReader *)objc_loadWeakRetained((id *)&self->_weakSharedDepthDataReader);
}

- (void)setWeakSharedDepthDataReader:(id)a3
{
  objc_storeWeak((id *)&self->_weakSharedDepthDataReader, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakSharedDepthDataReader);
  objc_destroyWeak((id *)&self->_weakSharedARMetadataReader);
  objc_storeStrong((id *)&self->_playableElement, 0);
}

- (void)sharedARMetadataReader
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_3();
  objc_msgSend((id)OUTLINED_FUNCTION_3_5(v0, v1), "playableElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "return existing shared ARMetadataMediaReader reader %@ for playable element id %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

- (void)sharedDepthDataReader
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_3();
  objc_msgSend((id)OUTLINED_FUNCTION_3_5(v0, v1), "playableElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "return existing shared DepthReader %@ for playable element id %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

@end
