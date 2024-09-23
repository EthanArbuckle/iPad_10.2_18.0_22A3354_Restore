@implementation ICDrawing(ICDrawingPersistenceAdditions)

- (void)initWithData:()ICDrawingPersistenceAdditions version:replicaID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICDrawing protobuf corrupt.", v1, 2u);
}

- (void)initWithArchive:()ICDrawingPersistenceAdditions version:replicaID:.cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = 6;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Skipped loading drawing. Drawing archive is wrong version (%d != %d).", (uint8_t *)v3, 0xEu);
}

@end
