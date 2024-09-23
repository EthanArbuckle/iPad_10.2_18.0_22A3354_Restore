@implementation BMFrameStore(V2)

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v4, v5, "Frames file %{public}@ is invalid because the current size is less than a valid segment header.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v5, v6, "Unable to read frames file segment header %{public}@ error %{darwin.errno}d.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.4(_DWORD *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  _DWORD *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  v6 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a2, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privacyPathname:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 68290050;
  v10[1] = 4;
  v11 = 2082;
  v12 = a1;
  v13 = 1024;
  v14 = v5;
  v15 = 2114;
  v16 = v9;
  v17 = 1042;
  v18 = 4;
  v19 = 2082;
  v20 = "SEGB";
  _os_log_error_impl(&dword_1A95BD000, a3, OS_LOG_TYPE_ERROR, "Segment header magic '%{public}.4s' (0x%04X) in file %{public}@ doesn't match expected magic '%{public}.4s'.", (uint8_t *)v10, 0x32u);

}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.5(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(), "privacyPathname:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v4, v5, "Unable to read frames file segment header %{public}@. Received data of %{public}d length.", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)getSegmentHeader:()V2 fromFileV2:fileSize:.cold.6(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_1(&dword_1A95BD000, v5, v6, "Failed to fstat %{public}@ with error: %{darwin.errno}d", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithFileHandleV2:()V2 permission:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "backingFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_0(&dword_1A95BD000, v6, v7, "Not mapping an empty file %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)initWithFileHandleV2:()V2 permission:.cold.2(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "_printablePathV2");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastAbsoluteTimestamp");
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v3, v4, "Found a bad lastAbsoluteTimestamp in header for segment file %{public}@ time: %f", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithFileHandleV2:()V2 permission:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "segmentPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v4, v5, "Failed to map frames for %{public}@ with permission %lu", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithFileHandleV2:()V2 permission:.cold.4(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v1 = (void *)MEMORY[0x1E0D01D10];
  objc_msgSend(a1, "backingFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "privacyPathname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_0(&dword_1A95BD000, v6, v7, "Failed to map header for %{public}@ with permission %lu", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

- (void)frameWithOffsetV2:()V2 expectedState:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(&dword_1A95BD000, v0, OS_LOG_TYPE_ERROR, "frameWithOffsetV2: offset is not 4-byte aligned:%zu", v1, 0xCu);
}

- (void)writeFrameV2ForBytes:()V2 length:dataVersion:timestamp:outOffset:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134349312;
  v3 = a1;
  v4 = 2048;
  v5 = 0x7FFFFFFFLL;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Sample too large %{public}zu but only %zu supported", (uint8_t *)&v2, 0x16u);
}

@end
