@implementation AccessibilityFocus.Match:

- (void)Set<UniqueID>
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for _DictionaryStorage<AccessibilityTechnology, [AccessibilityFocus.Match : Set<UniqueID>]>)
  {
    type metadata accessor for [AccessibilityFocus.Match : Set<UniqueID>](255, (unint64_t *)&lazy cache variable for type metadata for [AccessibilityFocus.Match : Set<UniqueID>], (uint64_t (*)(uint64_t, ValueMetadata *, uint64_t, unint64_t))MEMORY[0x1E0DEA048]);
    lazy protocol witness table accessor for type AccessibilityTechnology and conformance AccessibilityTechnology();
    v0 = type metadata accessor for _DictionaryStorage();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for _DictionaryStorage<AccessibilityTechnology, [AccessibilityFocus.Match : Set<UniqueID>]>);
  }
}

@end
