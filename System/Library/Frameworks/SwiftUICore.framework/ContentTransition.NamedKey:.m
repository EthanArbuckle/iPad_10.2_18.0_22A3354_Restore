@implementation ContentTransition.NamedKey:

- (void)RBTransition
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [ContentTransition.NamedKey : RBTransition])
  {
    type metadata accessor for RBTransition();
    lazy protocol witness table accessor for type ContentTransition.NamedKey and conformance ContentTransition.NamedKey();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ContentTransition.NamedKey : RBTransition]);
  }
}

@end
