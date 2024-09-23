@implementation CKChatController(GroupCollaboration)

- (void)_highlightForShareURL:()GroupCollaboration completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1(&dword_18DFCD000, v0, v1, "Did not get a highlight from URL: %@, error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_attributionFromHighlight:()GroupCollaboration forChatGUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Did not get any attributions from highlight: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_attributionFromHighlight:()GroupCollaboration forChatGUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Did not find an attribution for highlight: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
