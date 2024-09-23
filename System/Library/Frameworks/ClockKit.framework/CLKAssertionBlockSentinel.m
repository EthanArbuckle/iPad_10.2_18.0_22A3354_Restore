@implementation CLKAssertionBlockSentinel

- (void)markCalled
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_1(a1);
  OUTLINED_FUNCTION_0_1(&dword_2114F4000, v1, v2, "Calling completion handler more than once in %s.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)dealloc
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_1(a1);
  OUTLINED_FUNCTION_0_1(&dword_2114F4000, v1, v2, "Failed to call completion handler in %s.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isCalled
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  self->_called = a3;
}

- (BOOL)shouldBeFatal
{
  return self->_fatal;
}

- (void)setFatal:(BOOL)a3
{
  self->_fatal = a3;
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
