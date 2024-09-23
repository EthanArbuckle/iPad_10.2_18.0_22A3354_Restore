@implementation VSMetricsManagerObjC

+ (void)recordEnterEventWithPage:(id)a3 pageType:(id)a4
{
  sub_1D248FAB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_1E93A2948, (uint64_t)&unk_1EFC7EC00, (uint64_t)&selRef_recordEnterEventWithPage_pageType_);
}

+ (void)recordExitEventWithPage:(id)a3 pageType:(id)a4
{
  sub_1D248FAB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)&unk_1E93A2920, (uint64_t)&unk_1EFC7EBF0, (uint64_t)&selRef_recordExitEventWithPage_pageType_);
}

+ (void)recordClickEventWithPage:(id)a3 pageType:(id)a4 target:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);

  v5 = sub_1D24DFD70();
  v7 = v6;
  v8 = sub_1D24DFD70();
  v10 = v9;
  v11 = sub_1D24DFD70();
  sub_1D2491434(v5, v7, v8, v10, v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)recordSignInEventWithProviderIdentifier:(id)a3 supportedProvider:(BOOL)a4 channelAdamID:(id)a5 signInType:(id)a6 error:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v10 = sub_1D24DFD70();
  v12 = v11;
  if (a5)
  {
    v13 = sub_1D24DFD70();
    a5 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = sub_1D24DFD70();
  v17 = v16;
  v18 = a7;
  sub_1D2491AC0(v10, v12, a4, v13, a5, v15, v17, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)recordSignOutEventWithProviderIdentifier:(id)a3
{
  sub_1D24904FC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D2491F7C);
}

+ (void)recordSTBOptOutEventWithError:(id)a3
{
  id v4;

  v4 = a3;
  sub_1D2492134(a3);

}

+ (void)recordMetadataRequestWithProviderIdentifier:(id)a3 channelAdamID:(id)a4 fulfilledByProvider:(BOOL)a5 error:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = sub_1D24DFD70();
  v10 = v9;
  v11 = sub_1D24DFD70();
  v13 = v12;
  v14 = a6;
  sub_1D2492468(v8, v10, v11, v13, a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)recordInvalidTemplateErrorWithProviderAppAdamID:(id)a3
{
  sub_1D24904FC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D24928FC);
}

+ (void)recordNowPlayingBrokenEventWithBundleID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7EA00);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1D24DFD70();
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC7EA08);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1D24E8C70;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 40) = v6;
  *(_QWORD *)(inited + 48) = v8;
  swift_bridgeObjectRetain();
  sub_1D248EFD8(inited);
  swift_bridgeObjectRelease();
  v10 = sub_1D24DFE00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v6;
  v11[5] = v8;
  swift_bridgeObjectRetain();
  sub_1D248F7C8((uint64_t)v5, (uint64_t)&unk_1EFC7EB10, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)recordFederatedPunchoutEventWithError:(id)a3 metadata:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = sub_1D24DFD1C();
  v6 = a3;
  sub_1D2492B08(a3, v5);

  swift_bridgeObjectRelease();
}

+ (void)recordAccountUpdateWithAccount:(id)a3 source:(id)a4 updateType:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = _Block_copy(a6);
  v8 = sub_1D24DFD70();
  v10 = v9;
  v11 = sub_1D24DFD70();
  v13 = v12;
  if (v7)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v7;
    v7 = sub_1D248681C;
  }
  else
  {
    v14 = 0;
  }
  v15 = a3;
  sub_1D249349C(v15, v8, v10, v11, v13, (uint64_t)v7, v14);
  sub_1D24867E4((uint64_t)v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (VSMetricsManagerObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSMetricsManagerObjC;
  return -[VSMetricsManagerObjC init](&v3, sel_init);
}

@end
