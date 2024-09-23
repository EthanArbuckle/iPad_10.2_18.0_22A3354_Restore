@implementation FairPlayPassbookProvisioningObjC

+ (void)getProvisioningInfoWithAuditToken:(id *)a3 nonce:(NSData *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSData *v20;
  __int128 v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256123A58);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_OWORD *)a3->var0;
  v13 = *(_QWORD *)&a3->var0[4];
  v14 = *(_QWORD *)&a3->var0[6];
  v15 = _Block_copy(a5);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  *(_QWORD *)(v16 + 32) = v13;
  *(_QWORD *)(v16 + 40) = v14;
  *(_QWORD *)(v16 + 48) = a4;
  *(_QWORD *)(v16 + 56) = v15;
  *(_QWORD *)(v16 + 64) = a1;
  v17 = sub_233BD88DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256125250;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256125260;
  v19[5] = v18;
  v20 = a4;
  sub_233BB1D50((uint64_t)v12, (uint64_t)&unk_256125270, (uint64_t)v19);
  swift_release();
}

- (FairPlayPassbookProvisioningObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FairPlayPassbookProvisioningObjC;
  return -[FairPlayPassbookProvisioningObjC init](&v3, sel_init);
}

@end
