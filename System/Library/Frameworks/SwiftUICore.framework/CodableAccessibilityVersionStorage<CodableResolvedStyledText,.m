@implementation CodableAccessibilityVersionStorage<CodableResolvedStyledText,

- (void)AccessibilityText>
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [CodableAccessibilityVersionStorage<CodableResolvedStyledText, AccessibilityText>])
  {
    type metadata accessor for CodableAccessibilityVersionStorage<CodableResolvedStyledText, AccessibilityText>();
    v0 = type metadata accessor for Array();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [CodableAccessibilityVersionStorage<CodableResolvedStyledText, AccessibilityText>]);
  }
}

- (uint64_t)AccessibilityText>
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    type metadata accessor for [CodableAccessibilityVersionStorage<CodableResolvedStyledText, AccessibilityText>]();
    v10 = v9;
    v11 = lazy protocol witness table accessor for type CodableAccessibilityVersionStorage<CodableResolvedStyledText, AccessibilityText> and conformance CodableAccessibilityVersionStorage<A, B>(a2, a3);
    result = MEMORY[0x23B7C9C04](a4, v10, &v11);
    atomic_store(result, a1);
  }
  return result;
}

@end
