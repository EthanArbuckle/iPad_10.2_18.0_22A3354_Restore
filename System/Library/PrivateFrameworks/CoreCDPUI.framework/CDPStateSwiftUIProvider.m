@implementation CDPStateSwiftUIProvider

+ (void)makeSwiftUIViewForRemoteSecretDuringSignInCdpContext:(CDPContext *)a3 validator:(CDPRemoteDeviceSecretValidatorProtocol *)a4 devices:(NSArray *)a5 presentingViewController:(UIViewController *)a6 performingAccountRecovery:(BOOL)a7 delegate:(CDPUIController *)a8 offeringRemoteApproval:(BOOL)a9 canShowRPD:(BOOL)a10 isADPEnabled:(BOOL)a11 selectedDevice:(CDPDevice *)a12 completionHandler:(id)a13
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  CDPContext *v26;
  NSArray *v27;
  UIViewController *v28;
  CDPUIController *v29;
  CDPDevice *v30;
  uint64_t v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;
  CDPRemoteDeviceSecretValidatorProtocol *v36;
  NSArray *v37;

  v36 = a4;
  v37 = a5;
  v35 = a1;
  v33 = a11;
  v34 = a7;
  v32 = a10;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549E33A0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a13);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a3;
  *(_QWORD *)(v22 + 24) = a4;
  *(_QWORD *)(v22 + 32) = a5;
  *(_QWORD *)(v22 + 40) = a6;
  *(_BYTE *)(v22 + 48) = v34;
  *(_QWORD *)(v22 + 56) = a8;
  *(_BYTE *)(v22 + 64) = a9;
  *(_BYTE *)(v22 + 65) = v32;
  *(_BYTE *)(v22 + 66) = v33;
  *(_QWORD *)(v22 + 72) = a12;
  *(_QWORD *)(v22 + 80) = v21;
  *(_QWORD *)(v22 + 88) = v35;
  v23 = sub_20DCF6CF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_2549E33B0;
  v24[5] = v22;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_2549E33C0;
  v25[5] = v24;
  v26 = a3;
  swift_unknownObjectRetain();
  v27 = v37;
  v28 = a6;
  v29 = a8;
  v30 = a12;
  sub_20DCDE470((uint64_t)v20, (uint64_t)&unk_2549E33D0, (uint64_t)v25);
  swift_release();
}

- (_TtC9CoreCDPUI23CDPStateSwiftUIProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CDPStateSwiftUIProvider();
  return -[CDPStateSwiftUIProvider init](&v3, sel_init);
}

@end
