@implementation B389SetupMainViewController

- (unint64_t)supportedInterfaceOrientations
{
  _TtC18SharingViewService27B389SetupMainViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_10003100C();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService27B389SetupMainViewController *v4;

  v4 = self;
  sub_100031110(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService27B389SetupMainViewController *v4;

  v4 = self;
  sub_100031DEC(a3, (uint64_t)v4);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  _TtC18SharingViewService27B389SetupMainViewController *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1001798F0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10005BC14;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000334E4((uint64_t)a3, (uint64_t)v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _TtC18SharingViewService27B389SetupMainViewController *v8;
  uint64_t v9;

  if (a3)
  {
    v5 = sub_100013194(0, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10005B9EC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000349EC(v7, v9);

  swift_bridgeObjectRelease(v7);
}

- (void)dismiss:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC18SharingViewService27B389SetupMainViewController *v11;
  uint64_t v12;

  v5 = sub_100006A6C(&qword_1001A3618);
  __chkstk_darwin(v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_nfcVC];
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_response;
    *(_QWORD *)v9 = 2;
    *(_BYTE *)(v9 + 8) = 0;
  }
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = self;
  sub_1000356AC(a3, (uint64_t)v7, 0, 0, 389);
  sub_10000D858((uint64_t)v7, &qword_1001A3618);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC18SharingViewService27B389SetupMainViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1001798A0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_100036ECC(a3, (uint64_t)v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (SPPairingSession)accessibilitySession
{
  return (SPPairingSession *)*(id *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_session];
}

- (_TtC18SharingViewService27B389SetupMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService27B389SetupMainViewController *)sub_100054B84((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10003730C);
}

- (_TtC18SharingViewService27B389SetupMainViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService27B389SetupMainViewController *)sub_100037924(a3);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController___doNotReference]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_inFlightOperations]);
  sub_1000174C4(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo+ 8], *(void **)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo), *(_QWORD *)&self->__doNotReference[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo], *(_QWORD *)&self->inFlightOperations[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_appleIDInfo]);
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_timeout]);
  sub_10000D858((uint64_t)self + OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_presentationConfig, &qword_1001A5428);
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_om]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_retain]);
  swift_errorRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_sessionError]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_remainingCharacteristicsToDiscover]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_discoveredChars]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_readValues]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_writeManager
                                                                                              + 8]);
  sub_100023F48(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_storeS1], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_storeS1+ 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_fnameDisplay
                                                                                              + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_vbVersionStr
                                                                                              + 8]);
  sub_10000D858((uint64_t)self + OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_nfcUUID, &qword_1001A42A0);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_customRoleName
                                                                                              + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_customRoleEmoji
                                                                                              + 8]);
  sub_1000559A8(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue+ 8], *(uint64_t *)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue), *(_QWORD *)&self->__doNotReference[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(_QWORD *)&self->inFlightOperations[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 8], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 16], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 24], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_payloadValue + 32], (void (*)(void))sub_100007348);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_roleCategories]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService27B389SetupMainViewController_fbOtions]);
}

- (void)setResponseHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC18SharingViewService27B389SetupMainViewController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1001793F0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100038484((uint64_t)sub_10005B5D4, v5);

  swift_release(v5);
}

- (void)b389NFCPromptUpdateConfiguration:(id)a3
{
  id v5;
  _TtC18SharingViewService27B389SetupMainViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1000387B0(a3, (uint64_t)v6);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC18SharingViewService27B389SetupMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100048E00(v4, (uint64_t)v5);

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC18SharingViewService27B389SetupMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100056EDC(v7);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_100057564);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_10005787C);
}

- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18SharingViewService27B389SetupMainViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100057CB8(v9, v10);

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService27B389SetupMainViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100058064(a4, (uint64_t)a5);

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  id v7;
  _TtC18SharingViewService27B389SetupMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000584B0(a4);

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC18SharingViewService27B389SetupMainViewController *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_100058B74(a4, a5);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC18SharingViewService27B389SetupMainViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100049204(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService27B389SetupMainViewController *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v12 = a5;
  sub_1000594EC(v8, v11);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService27B389SetupMainViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_100059BA0((uint64_t)v8, v9);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_10005ADC8);
}

@end
