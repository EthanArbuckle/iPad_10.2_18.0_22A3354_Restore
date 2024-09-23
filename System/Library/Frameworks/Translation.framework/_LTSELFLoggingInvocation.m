@implementation _LTSELFLoggingInvocation

- (_LTSELFLoggingInvocation)initWithInvocationId:(id)a3
{
  id v5;
  _LTSELFLoggingInvocation *v6;
  _LTSELFLoggingInvocation *v7;
  _LTSELFLoggingInvocation *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSELFLoggingInvocation;
  v6 = -[_LTSELFLoggingInvocation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_endSent = 0;
    objc_storeStrong((id *)&v6->_invocationId, a3);
    v8 = v7;
  }

  return v7;
}

- (void)endSuccessfullyWithQSSSessionId:(id)a3
{
  id v4;
  NSObject *v5;
  _LTSELFLoggingEventData *v6;

  v4 = a3;
  if (self->_endSent)
  {
    v5 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTSELFLoggingInvocation endSuccessfullyWithQSSSessionId:].cold.1();
  }
  else
  {
    v6 = -[_LTSELFLoggingEventData initWithType:invocationId:]([_LTSELFLoggingEventData alloc], "initWithType:invocationId:", 2, self->_invocationId);
    -[_LTSELFLoggingEventData setQssSessionId:](v6, "setQssSessionId:", v4);
    +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v6);
    self->_endSent = 1;

  }
}

- (void)endWithError:(id)a3 qssSessionId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _LTSELFLoggingEventData *v9;

  v6 = a3;
  v7 = a4;
  if (self->_endSent)
  {
    v8 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_LTSELFLoggingInvocation endWithError:qssSessionId:].cold.1();
  }
  else
  {
    v9 = -[_LTSELFLoggingEventData initWithType:invocationId:]([_LTSELFLoggingEventData alloc], "initWithType:invocationId:", 3, self->_invocationId);
    -[_LTSELFLoggingEventData setQssSessionId:](v9, "setQssSessionId:", v7);
    -[_LTSELFLoggingEventData setInvocationEndedError:](v9, "setInvocationEndedError:", v6);
    +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v9);
    self->_endSent = 1;

  }
}

- (void)cancelWithReason:(id)a3 qssSessionId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _LTSELFLoggingEventData *v9;

  v6 = a3;
  v7 = a4;
  if (self->_endSent)
  {
    v8 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_LTSELFLoggingInvocation cancelWithReason:qssSessionId:].cold.1();
  }
  else
  {
    v9 = -[_LTSELFLoggingEventData initWithType:invocationId:]([_LTSELFLoggingEventData alloc], "initWithType:invocationId:", 4, self->_invocationId);
    -[_LTSELFLoggingEventData setQssSessionId:](v9, "setQssSessionId:", v7);
    -[_LTSELFLoggingEventData setInvocationCancelledReason:](v9, "setInvocationCancelledReason:", v6);
    +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v9);
    self->_endSent = 1;

  }
}

- (void)userEndedTypingWithPayload:(id)a3 localePair:(id)a4 reason:(int64_t)a5
{
  int64_t v5;

  if ((unint64_t)a5 >= 3)
    v5 = 0;
  else
    v5 = a5 + 5;
  -[_LTSELFLoggingInvocation sendUserEndedTypingEventWithPayload:localePair:type:](self, "sendUserEndedTypingEventWithPayload:localePair:type:", a3, a4, v5);
}

- (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4
{
  -[_LTSELFLoggingInvocation sendEventWithPayload:localePair:type:](self, "sendEventWithPayload:localePair:type:", a3, a4, 8);
}

+ (void)translationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7
{
  _BOOL8 v9;
  id v11;
  _LTSELFLoggingTranslationTTSData *v12;
  _LTSELFLoggingEventData *v13;

  v9 = a5;
  v11 = a3;
  v13 = -[_LTSELFLoggingEventData initWithType:invocationId:]([_LTSELFLoggingEventData alloc], "initWithType:invocationId:", 9, v11);

  v12 = -[_LTSELFLoggingTranslationTTSData initWithSourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:]([_LTSELFLoggingTranslationTTSData alloc], "initWithSourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:", a4, v9, a6, a7);
  -[_LTSELFLoggingEventData setTranslationTTSData:](v13, "setTranslationTTSData:", v12);
  +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v13);

}

- (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5
{
  id v8;
  id v9;
  _LTSELFLoggingTranslationLIDData *v10;

  v8 = a5;
  v9 = a4;
  v10 = -[_LTSELFLoggingTranslationLIDData initWithInvocationId:inputSource:topLocale:lowConfidenceLocales:]([_LTSELFLoggingTranslationLIDData alloc], "initWithInvocationId:inputSource:topLocale:lowConfidenceLocales:", self->_invocationId, a3, v9, v8);

  +[_LTTranslator selfLoggingLanguageIdentificationCompletedWithLIDData:](_LTTranslator, "selfLoggingLanguageIdentificationCompletedWithLIDData:", v10);
}

- (void)sendEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  _LTSELFLoggingEventData *v10;

  v8 = a4;
  v9 = a3;
  v10 = -[_LTSELFLoggingEventData initWithType:invocationId:]([_LTSELFLoggingEventData alloc], "initWithType:invocationId:", a5, self->_invocationId);
  -[_LTSELFLoggingEventData setTranslationPayload:](v10, "setTranslationPayload:", v9);

  -[_LTSELFLoggingEventData setTranslationLocalePair:](v10, "setTranslationLocalePair:", v8);
  +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v10);

}

- (void)sendUserEndedTypingEventWithPayload:(id)a3 localePair:(id)a4 type:(int64_t)a5
{
  NSObject *v6;

  if (self->_endSent)
  {
    v6 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_LTSELFLoggingInvocation sendUserEndedTypingEventWithPayload:localePair:type:].cold.1();
  }
  else
  {
    -[_LTSELFLoggingInvocation sendEventWithPayload:localePair:type:](self, "sendEventWithPayload:localePair:type:", a3, a4, a5);
    self->_endSent = 1;
  }
}

+ (void)userEndedTypingWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5 reason:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  _LTSELFLoggingEventData *v12;
  int64_t v13;
  _LTSELFLoggingEventData *v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [_LTSELFLoggingEventData alloc];
  if ((unint64_t)a6 >= 3)
    v13 = 0;
  else
    v13 = a6 + 5;
  v14 = -[_LTSELFLoggingEventData initWithType:invocationId:](v12, "initWithType:invocationId:", v13, v11);

  -[_LTSELFLoggingEventData setTranslationPayload:](v14, "setTranslationPayload:", v10);
  -[_LTSELFLoggingEventData setTranslationLocalePair:](v14, "setTranslationLocalePair:", v9);

  +[_LTTranslator selfLoggingEventWithData:](_LTTranslator, "selfLoggingEventWithData:", v14);
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (BOOL)endSent
{
  return self->_endSent;
}

- (void)setEndSent:(BOOL)a3
{
  self->_endSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationId, 0);
}

- (void)endSuccessfullyWithQSSSessionId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_235438000, v0, v1, "Invocation [%{public}@] has ended already, so ignoring successful end of event with QSS Session ID of %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)endWithError:qssSessionId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_235438000, v0, v1, "Invocation [%{public}@] has ended already so ignoring end with error of event with QSS Session ID of %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)cancelWithReason:qssSessionId:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_235438000, v0, v1, "Invocation [%{public}@] has ended already so ignoring cancel with reason of event with QSS Session ID of %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)sendUserEndedTypingEventWithPayload:localePair:type:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_1(*MEMORY[0x24BDAC8D0]);
  v2 = 138543362;
  v3 = v0;
  _os_log_debug_impl(&dword_235438000, v1, OS_LOG_TYPE_DEBUG, "Invocation [%{public}@] has ended already, so ignoring successful end with user ending typing", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
