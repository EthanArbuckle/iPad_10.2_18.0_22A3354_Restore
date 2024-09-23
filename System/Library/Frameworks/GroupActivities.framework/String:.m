@implementation String:

- (uint64_t)Data
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x1A1B05BEC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)SpatialTemplatePreferenceOutput
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : SpatialTemplatePreferenceOutput]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x1A1B05BEC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)String
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x1A1B05BEC](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

@end
