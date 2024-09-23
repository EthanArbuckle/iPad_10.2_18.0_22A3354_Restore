@implementation Text.Effect.Identifier:

- (void)Text.Effect.AnyLayoutState
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [Text.Effect.Identifier : Text.Effect.AnyLayoutState])
  {
    type metadata accessor for Text.Effect.AnyLayoutState();
    lazy protocol witness table accessor for type Text.Effect.Identifier and conformance Text.Effect.Identifier();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [Text.Effect.Identifier : Text.Effect.AnyLayoutState]);
  }
}

@end
