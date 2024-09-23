@implementation String

- (void):(uint64_t)a1
{
  type metadata accessor for [(_:)](a1, &lazy cache variable for type metadata for _ContiguousArrayStorage<[String : [Double]]>, (uint64_t (*)(uint64_t))type metadata accessor for [String : [Double]], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
}

- (void):
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [String : [Double]])
  {
    type metadata accessor for MutableBox<CachedEnvironment>(255, &lazy cache variable for type metadata for [Double], MEMORY[0x24BEE13C8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : [Double]]);
  }
}

- (void):(uint64_t *)(a3
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    type metadata accessor for MutableBox<CachedEnvironment>(255, &lazy cache variable for type metadata for [Double], MEMORY[0x24BEE13C8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    v7 = a3(a1, MEMORY[0x24BEE0D00], v6, MEMORY[0x24BEE0D10]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

@end
