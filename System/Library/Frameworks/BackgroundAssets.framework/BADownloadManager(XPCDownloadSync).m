@implementation BADownloadManager(XPCDownloadSync)

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_21ABD8000, a1, a3, "Download finished but the local app has no knowledge of the download.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_21ABD8000, a1, a3, "Download finished but did not pass sandbox token.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_0(&dword_21ABD8000, a1, a3, "Download finished but sandbox_extension_consume() failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6_0();
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to remove cloned file failing to be marked as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to mark cloned file as purgeable. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)downloadIdentifierDidFinish:()XPCDownloadSync sandboxExtensionToken:wasHandled:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend(v1, "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ABD8000, v3, v4, "Download %{public}@ failed to be cloned after download. Error:%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
