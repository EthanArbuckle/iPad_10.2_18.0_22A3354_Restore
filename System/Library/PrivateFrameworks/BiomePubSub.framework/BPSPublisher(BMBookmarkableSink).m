@implementation BPSPublisher(BMBookmarkableSink)

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1A956A000, v0, v1, "Invoking sinkWithBookmark on a publisher chain where not all operators are bookmarkable", v2);
  OUTLINED_FUNCTION_2_1();
}

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_5(&dword_1A956A000, v0, v1, "Failed to setup pipeline since current publisher dosen't conform to BMBookmarkablePublisher", v2);
  OUTLINED_FUNCTION_2_1();
}

- (void)sinkWithBookmark:()BMBookmarkableSink completion:receiveInput:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A956A000, a2, a3, "Creating publisher with bookmark:\n%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
