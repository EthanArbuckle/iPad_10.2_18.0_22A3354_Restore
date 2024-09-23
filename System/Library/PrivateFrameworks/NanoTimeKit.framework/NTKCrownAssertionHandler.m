@implementation NTKCrownAssertionHandler

- (id)takeCrownAssertionForToken:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NTKCrownAssertionHandler *v17;
  void *v18;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF171EB8);
  MEMORY[0x1E0C80A78](v5, v6, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B752FB80();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12, v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B752FB68();
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v16, 1, v10);
  v17 = self;
  sub_1B751C098((uint64_t)v9, (uint64_t)v15);

  sub_1B751C348((uint64_t)v9);
  v18 = (void *)sub_1B752FB5C();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  return v18;
}

- (BOOL)relinquishCrownAssertionForToken:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  v3 = sub_1B752FB80();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5, v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B752FB68();
  v9 = sub_1B751E360((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  return v9 & 1;
}

- (NTKCrownAssertionHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CrownAssertionHandler();
  return -[NTKCrownAssertionHandler init](&v3, sel_init);
}

@end
