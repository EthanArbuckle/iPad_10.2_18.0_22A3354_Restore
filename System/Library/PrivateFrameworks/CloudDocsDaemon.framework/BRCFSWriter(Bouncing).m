@implementation BRCFSWriter(Bouncing)

+ (void)_isPathMatchIdle:()Bouncing .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_11_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Forcing idle for item we need to download for CZM processing %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

+ (void)_isPathMatchIdle:()Bouncing .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing idle for resuming document %@%@");
  OUTLINED_FUNCTION_2();
}

+ (void)_isPathMatchIdle:()Bouncing .cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Forcing idle for item which is paused from sync %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_generateGentlePhysicalBounceNameForPathMatch:()Bouncing dirfd:existingSourceLogicalName:lastBounceNo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Item bounced back to the same filename%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Very weird, we have missing fsevents on multiple levels of the hierarchy, lets rescan everything%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Marking parent item %@ as lost and clearing the generation ID so we are sure to scan it%@");
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] missing item outside of the scope.  Faking fsevent%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Cannot rename to %@ because it is unprocessed yet%@");
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Cannot rename to %@ because it's a non idle fault%@");
  OUTLINED_FUNCTION_2();
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 134218242;
  v7 = objc_msgSend(a1, "rank");
  v8 = 2112;
  v9 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Apply Changes[%lld]: postponing rank (clashes with an unprocessed item)%@", (uint8_t *)&v6);
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] On disk item %@ can't sync so treating it as idle%@");
  OUTLINED_FUNCTION_2();
}

@end
