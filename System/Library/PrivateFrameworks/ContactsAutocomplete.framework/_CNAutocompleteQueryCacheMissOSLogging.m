@implementation _CNAutocompleteQueryCacheMissOSLogging

- (_CNAutocompleteQueryCacheMissOSLogging)init
{
  _CNAutocompleteQueryCacheMissOSLogging *v2;
  os_log_t v3;
  OS_os_log *os_log;
  _CNAutocompleteQueryCacheMissOSLogging *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNAutocompleteQueryCacheMissOSLogging;
  v2 = -[_CNAutocompleteQueryCacheMissOSLogging init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts.autocomplete", "cache");
    os_log = v2->_os_log;
    v2->_os_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNAutocompleteQueryCacheMissOSLogging os_log](self, "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNAutocompleteQueryCacheMissOSLogging didReturnCacheFalseNegatives:].cold.1(v4);

}

- (void)didReturnCacheFalsePositives:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_CNAutocompleteQueryCacheMissOSLogging os_log](self, "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNAutocompleteQueryCacheMissOSLogging didReturnCacheFalsePositives:].cold.1(v4);

}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)didReturnCacheFalseNegatives:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0(&dword_1B9950000, v1, v2, "Server returned %lu result(s) not returned from the cache", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)didReturnCacheFalsePositives:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0(&dword_1B9950000, v1, v2, "Cache returned %lu result(s) not returned by the server", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

@end
