@implementation TableColumnCustomizationID:

- (void)TableColumnCustomizationEntry
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [TableColumnCustomizationID : TableColumnCustomizationEntry])
  {
    lazy protocol witness table accessor for type TableColumnCustomizationID and conformance TableColumnCustomizationID();
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [TableColumnCustomizationID : TableColumnCustomizationEntry]);
  }
}

- (uint64_t)TableColumnCustomizationEntry
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  result = *a1;
  if (!result)
  {
    type metadata accessor for [TableColumnCustomizationID : TableColumnCustomizationEntry]();
    v10 = v9;
    v11[0] = a2();
    v11[1] = a3();
    result = MEMORY[0x18D75FFDC](a4, v10, v11);
    atomic_store(result, a1);
  }
  return result;
}

@end
