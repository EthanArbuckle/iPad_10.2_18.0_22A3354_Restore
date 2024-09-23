@implementation CKComposition(CKPersistentComposition)

- (void)_persistTextToComposition:()CKPersistentComposition directoryURL:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "-> Error: persistentText was unsuccessfully generated from drafted text.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_persistTextToComposition:()CKPersistentComposition directoryURL:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "-> Error: could not archive persistentText. Found error: %@", a5, a6, a7, a8, 2u);
}

@end
