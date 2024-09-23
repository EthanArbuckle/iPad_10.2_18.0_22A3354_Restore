@implementation UnsafeRawPointer:

- (void)String
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!lazy cache variable for type metadata for ThreadSpecific<[UnsafeRawPointer : String]>)
  {
    type metadata accessor for [UnsafeRawPointer : String]();
    v5 = type metadata accessor for ThreadSpecific(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&lazy cache variable for type metadata for ThreadSpecific<[UnsafeRawPointer : String]>);
  }
}

@end
