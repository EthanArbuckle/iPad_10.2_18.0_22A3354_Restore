@implementation BCSSecureCaptureSession

+ (BOOL)hasActiveSession
{
  return qword_256451F90 != 0;
}

+ (void)authenticateWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSUserActivity *v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256451FC8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  v11 = sub_236DFC3F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256451FD8;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256451FE8;
  v13[5] = v12;
  v14 = a3;
  sub_236DFB348((uint64_t)v8, (uint64_t)&unk_256451FF8, (uint64_t)v13);
  swift_release();
}

- (BCSSecureCaptureSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BCSSecureCaptureSession();
  return -[BCSSecureCaptureSession init](&v3, sel_init);
}

@end
