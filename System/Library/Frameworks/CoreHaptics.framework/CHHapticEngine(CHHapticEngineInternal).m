@implementation CHHapticEngine(CHHapticEngineInternal)

- (void)dispatchOnLocal:()CHHapticEngineInternal .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(!in_dispatch_sync) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

+ (void)doRegisterAudioResource:()CHHapticEngineInternal options:fromPattern:player:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(_sResourceEntries->emplace(resourceID, ResourceEntry(resource, options, 1)).second == true) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

+ (void)doRegisterAudioResource:()CHHapticEngineInternal options:fromPattern:player:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (OUTLINED_FUNCTION_1(MEMORY[0x1E0C81028]))
    OUTLINED_FUNCTION_0(&dword_1B573F000, MEMORY[0x1E0C81028], v0, "%25s:%-5d ASSERTION FAILURE [(_sResourceEntries->emplace(copiedResourceID, ResourceEntry(resource, options, 1)).second == true) != 0 is false]: ", v1, v2, v3, v4, 2u);
  __break(1u);
}

@end
