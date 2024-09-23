@implementation WrappedFPXEnumeratorObserverProxy

- (WrappedFPXEnumeratorObserverProxy)initWithTarget:(id)a3
{
  id v5;
  WrappedFPXEnumeratorObserverProxy *v6;
  WrappedFPXEnumeratorObserverProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WrappedFPXEnumeratorObserverProxy;
  v6 = -[WrappedFPXEnumeratorObserverProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_target, a3);

  return v7;
}

- (void)enumerationResultsDidChange
{
  id v2;

  -[FPXEnumeratorObserver remoteObjectProxyWithErrorHandler:](self->_target, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerationResultsDidChange");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
}

void __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke_cold_1(v2, v3);

}

- (void)didUpdateItem:(id)a3
{
  FPXEnumeratorObserver *target;
  id v4;
  id v5;

  target = self->_target;
  v4 = a3;
  -[FPXEnumeratorObserver remoteObjectProxyWithErrorHandler:](target, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateItem:", v4);

}

void __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke_cold_1(v2, v3);

}

void __64__WrappedFPXEnumeratorObserverProxy_enumerationResultsDidChange__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] Error on did change: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __51__WrappedFPXEnumeratorObserverProxy_didUpdateItem___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] Error on did update item: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

@end
