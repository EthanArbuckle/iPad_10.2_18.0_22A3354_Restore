@implementation LNURLLaunchRequest

- (LNURLLaunchRequest)initWithURL:(id)a3
{
  uint64_t v3;

  v3 = sub_1A19B29B4();
  MEMORY[0x1E0C80A78](v3);
  sub_1A19B2984();
  return (LNURLLaunchRequest *)sub_1A1930518();
}

- (LNURLLaunchRequest)initWithEntity:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LNURLLaunchRequest *result;

  v5 = a3;
  v6 = a4;
  sub_1A1930610((uint64_t)v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  return result;
}

- (LNURLLaunchRequest)initWithEnumCaseIdentifier:(id)a3 metadata:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  LNURLLaunchRequest *result;

  v5 = sub_1A19B2C00();
  v7 = v6;
  v8 = a4;
  sub_1A1930698(v5, v7, (uint64_t)v8, v9, v10, v11, v12, v13);
  return result;
}

- (LNURLLaunchRequest)initWithAction:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LNURLLaunchRequest *result;

  v3 = a3;
  sub_1A193072C((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  return result;
}

- (void)performWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  LNURLLaunchRequest *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1A1930A68((uint64_t)&unk_1EE648F08, v5);
}

- (void)performValidatingURLScheme:(BOOL)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  LNURLLaunchRequest *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_BYTE *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = self;
  v8 = self;
  sub_1A1930A68((uint64_t)&unk_1EE648EA0, v7);
}

+ (BOOL)isValidURLForLaunching:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = sub_1A19B29B4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A19B2984();
  v7 = sub_1A1932814();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (LNURLLaunchRequest)init
{
  LNURLLaunchRequest.init()();
}

- (void).cxx_destruct
{
  sub_1A1933E4C(*(void **)((char *)&self->super.isa + OBJC_IVAR___LNURLLaunchRequest_storage), *(void **)&self->storage[OBJC_IVAR___LNURLLaunchRequest_storage], *(void **)&self->storage[OBJC_IVAR___LNURLLaunchRequest_storage + 8], self->storage[OBJC_IVAR___LNURLLaunchRequest_storage + 16]);
}

@end
