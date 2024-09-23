@implementation AccessibilityRelationshipScope.Relationship

- (unint64_t):
{
  unint64_t result;

  result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  *a1 = result;
  return result;
}

- (void):
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [AccessibilityRelationshipScope.Relationship : [AccessibilityNode]])
  {
    type metadata accessor for TupleView<(ModifiedContent<AnyView, _TraitWritingModifier<LayoutPriorityTraitKey>>, _ConditionalContent<Image, Image>?)>(255, (unint64_t *)&lazy cache variable for type metadata for [AccessibilityNode], (uint64_t (*)(uint64_t))type metadata accessor for AccessibilityNode, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    lazy protocol witness table accessor for type AccessibilityRelationshipScope.Relationship and conformance AccessibilityRelationshipScope.Relationship();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [AccessibilityRelationshipScope.Relationship : [AccessibilityNode]]);
  }
}

@end
