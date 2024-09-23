@implementation _LTBatchTextTranslationRequest

- (id)loggingType
{
  return CFSTR("batch");
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  NSObject *v4;

  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_LTBatchTextTranslationRequest _startTranslationWithService:done:].cold.1();
}

- (void)_translationFailedWithError:(id)a3
{
  id v4;
  void (**translationHandler)(id, _QWORD, id);
  void (**textHandler)(id, _QWORD, id);
  id v7;

  v4 = a3;
  translationHandler = (void (**)(id, _QWORD, id))self->_translationHandler;
  v7 = v4;
  if (translationHandler)
  {
    translationHandler[2](translationHandler, 0, v4);
    v4 = v7;
  }
  textHandler = (void (**)(id, _QWORD, id))self->_textHandler;
  if (textHandler)
  {
    textHandler[2](textHandler, MEMORY[0x24BDBD1A8], v7);
    v4 = v7;
  }

}

- (NSArray)paragraphs
{
  return self->_paragraphs;
}

- (void)setParagraphs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)textHandler
{
  return self->_textHandler;
}

- (void)setTextHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)translationHandler
{
  return self->_translationHandler;
}

- (void)setTranslationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_translationHandler, 0);
  objc_storeStrong(&self->_textHandler, 0);
  objc_storeStrong((id *)&self->_paragraphs, 0);
}

- (void)_startTranslationWithService:done:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

@end
