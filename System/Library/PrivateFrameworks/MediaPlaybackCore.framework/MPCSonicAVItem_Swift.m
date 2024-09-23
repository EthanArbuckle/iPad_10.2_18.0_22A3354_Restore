@implementation MPCSonicAVItem_Swift

- (MPCSonicAVItem_Swift)initWithItem:(id)a3 contentID:(id)a4 userIdentity:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  MPCSonicAVItem_Swift *result;

  v7 = sub_210E92BA8();
  sub_210CBB37C(a3, v7, v8, a5);
  return result;
}

- (void).cxx_destruct
{
  sub_210CBB4B4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MPCSonicAVItem_Swift_objc, (void (*)(uint64_t))MEMORY[0x24BEE4FC8], &OBJC_IVAR___MPCSonicAVItem_Swift__storage);
}

- (void)renderWithCompletion:(id)a3
{
  sub_210CBCD48(self, (int)a2, a3, (uint64_t)&unk_24CAA96A8, (uint64_t)&unk_254A7EC18);
}

- (id)_contentID
{
  MPCSonicAVItem_Swift *v2;
  void *v3;
  uint64_t v5[4];

  v2 = self;
  sub_210CBCEAC(v5);

  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  v3 = (void *)sub_210E9352C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  return v3;
}

- (MPCSonicAVItem_Swift)init
{
  MPCSonicAVItem_Swift.init()();
}

@end
