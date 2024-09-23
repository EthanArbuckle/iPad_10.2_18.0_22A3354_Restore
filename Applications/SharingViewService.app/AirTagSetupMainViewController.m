@implementation AirTagSetupMainViewController

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService29AirTagSetupMainViewController *v4;

  v4 = self;
  sub_1000AEFA8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService29AirTagSetupMainViewController *v4;

  v4 = self;
  sub_1000AFA20(a3, (uint64_t)v4);

}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18SharingViewService29AirTagSetupMainViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017CC08, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000D8EC8;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1000B0FA8((uint64_t)a3, (uint64_t)v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC18SharingViewService29AirTagSetupMainViewController *v8;
  uint64_t v9;

  if (a3)
  {
    v5 = sub_100013194(0, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10009370C((unint64_t *)&qword_1001A5610, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000B246C(v7, v9);

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
  _TtC18SharingViewService29AirTagSetupMainViewController *v11;
  uint64_t v12;

  v5 = sub_100006A6C(&qword_1001A3618);
  __chkstk_darwin(v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_nfcVC];
  if (v8)
  {
    v9 = v8 + OBJC_IVAR____TtC18SharingViewService27B389NFCStatusViewController_response;
    *(_QWORD *)v9 = 2;
    *(_BYTE *)(v9 + 8) = 0;
  }
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = self;
  sub_1000B313C(a3, (uint64_t)v7, 0, 0, 427);
  sub_10000D858((uint64_t)v7, &qword_1001A3618);

}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC18SharingViewService29AirTagSetupMainViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017CBB8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1000D8D0C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1000B49BC(a3, (uint64_t)v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (SPPairingSession)accessibilitySession
{
  return (SPPairingSession *)*(id *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_session];
}

- (_TtC18SharingViewService29AirTagSetupMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18SharingViewService29AirTagSetupMainViewController *)sub_1000B4DFC(v5, v7, a4);
}

- (_TtC18SharingViewService29AirTagSetupMainViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService29AirTagSetupMainViewController *)sub_1000B5468(a3);
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController___doNotReference]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_inFlightOperations]);
  sub_1000174C4(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_appleIDInfo], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_appleIDInfo+ 8], *(void **)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_appleIDInfo), *(_QWORD *)&self->__doNotReference[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_appleIDInfo], *(_QWORD *)&self->inFlightOperations[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_appleIDInfo]);
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_timeout]);
  sub_10000D858((uint64_t)self + OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_presentationConfig, &qword_1001A5428);
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_om]);

  swift_unknownObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_retain]);
  swift_errorRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_sessionError]);

  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_assets]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_remainingCharacteristicsToDiscover]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_discoveredChars]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_readValues]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_writeManager
                                                                                              + 8]);
  sub_100023F48(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_storeS1], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_storeS1+ 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_fnameDisplay
                                                                                              + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_vbVersionStr
                                                                                              + 8]);
  sub_10000D858((uint64_t)self + OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_nfcUUID, &qword_1001A42A0);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_customRoleName
                                                                                              + 8]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_customRoleEmoji
                                                                                              + 8]);
  sub_1000559A8(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue], *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue+ 8], *(uint64_t *)((char *)&self->super._userInfo+ OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue), *(_QWORD *)&self->__doNotReference[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue], *(_QWORD *)&self->inFlightOperations[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue + 8], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue + 16], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue + 24], *(_QWORD *)&self->appleIDInfo[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_payloadValue + 32], (void (*)(void))sub_100007348);
  swift_release(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_bubbleMonitor]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_roleCategories]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService29AirTagSetupMainViewController_fbOtions]);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC18SharingViewService29AirTagSetupMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000C576C(v4, (uint64_t)v5);

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC18SharingViewService29AirTagSetupMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000D4630(v7);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000D4CB8);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000D4FCC);
}

- (void)centralManager:(id)a3 didLosePeripheral:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18SharingViewService29AirTagSetupMainViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000D5404(v9, v10);

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService29AirTagSetupMainViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1000D57AC(a4, (uint64_t)a5);

}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6;
  id v7;
  _TtC18SharingViewService29AirTagSetupMainViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000D5BF4(a4);

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC18SharingViewService29AirTagSetupMainViewController *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_1000D62B8(a4, a5);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC18SharingViewService29AirTagSetupMainViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1000C5B70(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService29AirTagSetupMainViewController *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v12 = a5;
  sub_1000D6C30(v8, v11);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC18SharingViewService29AirTagSetupMainViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1000D72F0((uint64_t)v8, v9);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_100049864(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *))sub_1000D8518);
}

- (void)proxCardFlowDidDismiss
{
  uint64_t v2;
  _TtC18SharingViewService29AirTagSetupMainViewController *v3;

  v3 = self;
  sub_1000C61D0((uint64_t)v3, v2);

}

@end
