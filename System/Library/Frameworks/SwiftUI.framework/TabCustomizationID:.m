@implementation TabCustomizationID:

- (void)TabCustomizationEntry
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    lazy protocol witness table accessor for type TabCustomizationID and conformance TabCustomizationID();
    v3 = type metadata accessor for Dictionary();
    if (!v4)
      atomic_store(v3, a2);
  }
}

- (uint64_t)TabSectionCustomizationEntry
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  result = *a1;
  if (!result)
  {
    type metadata accessor for [TabCustomizationID : TabCustomizationEntry](255, &lazy cache variable for type metadata for [TabCustomizationID : TabSectionCustomizationEntry]);
    v10 = v9;
    v11[0] = a2();
    v11[1] = a3();
    result = MEMORY[0x18D75FFDC](a4, v10, v11);
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)TabCustomizationEntry
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  result = *a1;
  if (!result)
  {
    type metadata accessor for [TabCustomizationID : TabCustomizationEntry](255, &lazy cache variable for type metadata for [TabCustomizationID : TabCustomizationEntry]);
    v10 = v9;
    v11[0] = a2();
    v11[1] = a3();
    result = MEMORY[0x18D75FFDC](a4, v10, v11);
    atomic_store(result, a1);
  }
  return result;
}

@end
