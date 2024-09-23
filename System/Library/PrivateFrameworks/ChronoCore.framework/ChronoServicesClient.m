@implementation ChronoServicesClient

- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
  sub_1D284CC60(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E93F5720, (uint64_t)sub_1D272D798, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D271F558);
}

- (_TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient)init
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *result;

  result = (_TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_taskService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_descriptorService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_enablementProvider);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_deviceService, qword_1ED953300);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_extensionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_keybagStateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_powerlogSuggestionService);
  sub_1D271E704((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_stuckPairedRelationshipRepairer, (uint64_t *)&unk_1ED952840);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_keepAliveAssertionProvider);
  sub_1D271E704((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_widgetRelevanceService, &qword_1ED952500);
  sub_1D271E704((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_remoteActivityLaunchService, &qword_1ED9525E0);
  sub_1D271E704((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_activityService, &qword_1ED9589E8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__duetServiceQueue_duetService);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue_connection));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient__queue_providerOptions));
  swift_bridgeObjectRelease();
}

- (void)flushPowerlog
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v2;
  void *v3;
  _QWORD v4[6];

  v2 = self;
  BSDispatchQueueAssert();
  v4[4] = sub_1D284C220;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1D271E3EC;
  v4[3] = &block_descriptor_136;
  v3 = _Block_copy(v4);
  BSDispatchMain();
  _Block_release(v3);

}

- (void)retryStuckRemotePairings
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v2;

  v2 = self;
  sub_1D284C31C();

}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v7;

  v5 = _Block_copy(a4);
  v6 = sub_1D29C5B80();
  _Block_copy(v5);
  v7 = self;
  sub_1D28598D8(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)performDescriptorDiscoveryForHost:(id)a3
{
  sub_1D284DF40(self, (uint64_t)a2, (uint64_t)a3, sub_1D284C6D8);
}

- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
{
  sub_1D284CC60(self, (int)a2, (int)a3, a4, (uint64_t)&unk_1E93F56D0, (uint64_t)sub_1D272D798, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1D284CAE4);
}

- (void)reloadTimeline:(id)a3 error:(id *)a4
{
  id v6;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v7;

  v6 = a3;
  v7 = self;
  sub_1D284CD08(v6, a4);

}

- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  sub_1D29C59E8();
  v4 = self;
  v5 = sub_1D284D2F4();
  v7 = v6;

  swift_bridgeObjectRelease();
  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_1D29C1650();
    sub_1D273BEAC(v5, v7);
  }
  return v8;
}

- (void)removeWidgetHostWithIdentifier:(id)a3
{
  sub_1D284DF40(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D284DA44);
}

- (void)setWidgetConfiguration:(id)a3 activationState:(id)a4 forWidgetHostWithIdentifier:(id)a5
{
  id v8;
  void (*v9)(char *, uint64_t);
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v10;

  sub_1D29C59E8();
  v8 = a3;
  v9 = (void (*)(char *, uint64_t))a4;
  v10 = self;
  sub_1D284DF94(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)setActivationState:(id)a3 forWidgetHostWithIdentifier:(id)a4
{
  id v6;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v7;

  sub_1D29C59E8();
  v6 = a3;
  v7 = self;
  sub_1D284E604(v6);

  swift_bridgeObjectRelease();
}

- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3
{
  sub_1D2855D58(self, (int)a2, a3, (void (*)(void))sub_1D285A3E0);
}

- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4
{
  sub_1D27C961C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1D285BB7C);
}

- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED94D920);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D29C59E8();
  v12 = v11;
  v13 = sub_1D29C59E8();
  v15 = v14;
  if (a5)
  {
    sub_1D29C15FC();
    v16 = sub_1D29C162C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 0, 1, v16);
  }
  else
  {
    v17 = sub_1D29C162C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  v18 = self;
  sub_1D2850AA4(v10, v12, v13, v15, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D271E704((uint64_t)v9, &qword_1ED94D920);
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
{
  sub_1D2853E58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1D285C2EC);
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v19;

  v10 = _Block_copy(a7);
  v11 = sub_1D29C59E8();
  v13 = v12;
  v14 = sub_1D29C59E8();
  v16 = v15;
  _Block_copy(v10);
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1D285CC7C(v17, v18, v11, v13, v14, v16, (uint64_t)v19, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1D285D8FC(v9, v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)subscribeToExtensionsWithProviderOptions:(id)a3 completion:(id)a4
{
  sub_1D2853E58(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1D285E5EC);
}

- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v9;
  void *v10;

  v5 = sub_1D29C59E8();
  v7 = v6;
  v8 = sub_1D29C58E0();
  v9 = self;
  v10 = (void *)sub_1D2853ED4(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)allPairedDevices
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v2;
  id v3;

  v2 = self;
  v3 = sub_1D2855510();

  return v3;
}

- (void)pairDeviceWith:(id)a3 completion:(id)a4
{
  sub_1D27C961C(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1D285F088);
}

- (BOOL)unpairDeviceWith:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v8;

  v5 = sub_1D29C59E8();
  v7 = v6;
  v8 = self;
  sub_1D2855668(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)toggleRemoteWidgetsEnabled:(id)a3 error:(id *)a4
{
  id v5;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = self;
  BSDispatchQueueAssert();
  v7 = objc_msgSend(v5, sel_BOOLValue);
  v8 = (uint64_t)v6
     + OBJC_IVAR____TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient_enablementProvider;
  swift_beginAccess();
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v8 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(id, uint64_t, uint64_t))(v10 + 16))(v7, v9, v10);
  swift_endAccess();

  return 1;
}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v3;

  v3 = self;
  sub_1D28559AC();

  return 1;
}

- (BOOL)remoteWidgetsEnabled
{
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1D2855BF0();

  return v3 & 1;
}

- (void)subscribeToRemoteDevices:(id)a3
{
  sub_1D2855D58(self, (int)a2, a3, (void (*)(void))sub_1D285F2BC);
}

- (void)subscribeToTimelineEntryRelevance:(id)a3
{
  sub_1D2855D58(self, (int)a2, a3, (void (*)(void))sub_1D285F504);
}

- (void)subscribeToWidgetRelevance:(id)a3
{
  sub_1D2855D58(self, (int)a2, a3, (void (*)(void))sub_1D285F93C);
}

- (void)subscribeToActivityPayloadUpdates:(id)a3
{
  sub_1D2855D58(self, (int)a2, a3, (void (*)(void))sub_1D285FBAC);
}

- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v12;
  char *v13;

  v6 = sub_1D29C59E8();
  v8 = v7;
  v9 = sub_1D29C59E8();
  v11 = v10;
  v12 = self;
  v13 = sub_1D2855DBC(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (void)reloadWidgetRelevanceForExtensionIdentifier:(id)a3 kind:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = sub_1D29C59E8();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  _Block_copy(v8);
  v11 = a3;
  v12 = self;
  sub_1D285FD40(v11, v9, (uint64_t)a4, (uint64_t)v12, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC10ChronoCoreP33_2559684BF6D015C60DA4DF344EC1B12920ChronoServicesClient *v13;

  v6 = _Block_copy(a5);
  v7 = sub_1D29C59E8();
  v9 = v8;
  v10 = sub_1D29C59E8();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1D285FF24(v7, v9, v10, v12, (uint64_t)v13, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
