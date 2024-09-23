@implementation ColorCacheKey:

- (void)NamedColorInfo
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [ColorCacheKey : NamedColorInfo])
  {
    lazy protocol witness table accessor for type ColorCacheKey and conformance ColorCacheKey();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ColorCacheKey : NamedColorInfo]);
  }
}

@end
