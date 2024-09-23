@implementation _DKEvent(Protobuf)

- (void)toPBCodableUseStructuredMetadata:()Protobuf .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, MEMORY[0x1E0C81028], (uint64_t)a3, "Failed to encode value for key %@", a1);
}

@end
