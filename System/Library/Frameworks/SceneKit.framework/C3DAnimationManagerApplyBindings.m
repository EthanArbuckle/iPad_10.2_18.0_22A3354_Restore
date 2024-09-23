@implementation C3DAnimationManagerApplyBindings

void *__C3DAnimationManagerApplyBindings_block_invoke(uint64_t a1, uint64_t *a2)
{
  _OWORD *TargetAddress;
  uint64_t v4;
  uint64_t v5;
  const void *Target;
  void *v7;
  int BaseType;
  size_t v9;
  uint64_t TypeSemantic;
  uint64_t ComponentIndex;
  _OWORD v13[4];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v13, 0, sizeof(v13));
  TargetAddress = (_OWORD *)C3DModelTargetGetTargetAddress(a2[2]);
  v4 = a2[4];
  if (v4)
  {
    v5 = C3DModelTargetGetTargetAddress(a2[3]);
    (*(void (**)(uint64_t, _OWORD *, uint64_t, _OWORD *))(v4 + 16))(v4, TargetAddress, v5, v13);
    TargetAddress = v13;
  }
  Target = (const void *)C3DModelTargetGetTarget(a2[3]);
  v7 = (void *)C3DModelTargetGetTargetAddress(a2[3]);
  BaseType = C3DModelTargetGetBaseType(a2[3]);
  v9 = C3DSizeOfBaseType(BaseType);
  TypeSemantic = C3DModelTargetGetTypeSemantic(a2[3]);
  ComponentIndex = C3DModelTargetGetComponentIndex(a2[3]);
  return C3DSetValue(Target, v7, TargetAddress, v9, TypeSemantic, ComponentIndex);
}

@end
