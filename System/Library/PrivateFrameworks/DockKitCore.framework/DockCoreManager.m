@implementation DockCoreManager

- (_TtP11DockKitCore33DockCoreManagerConnectionDelegate_)connectionDelegate
{
  return (_TtP11DockKitCore33DockCoreManagerConnectionDelegate_ *)(id)MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectionDelegate, a2);
}

- (void)setConnectionDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSXPCConnection)_xpcConnection
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection));
}

- (void)set_xpcConnection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection) = (Class)a3;
  v3 = a3;

}

- (NSError)_xpcConnectionError
{
  void *v2;
  id v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)sub_23A6905C4();

  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (void)set_xpcConnectionError:(id)a3
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError) = (Class)a3;
  v4 = a3;

}

- (double)XPCTIMEOUT
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_XPCTIMEOUT);
}

- (void)setXPCTIMEOUT:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_XPCTIMEOUT) = a3;
}

- (_TtP11DockKitCore18StateEventProtocol_)stateDelegate
{
  return (_TtP11DockKitCore18StateEventProtocol_ *)(id)MEMORY[0x23B853C6C]((char *)self+ OBJC_IVAR____TtC11DockKitCore15DockCoreManager_stateDelegate, a2);
}

- (void)setStateDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP11DockKitCore22SystemTrackingProtocol_)configDelegate
{
  return (_TtP11DockKitCore22SystemTrackingProtocol_ *)(id)MEMORY[0x23B853C6C]((char *)self+ OBJC_IVAR____TtC11DockKitCore15DockCoreManager_configDelegate, a2);
}

- (void)setConfigDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP11DockKitCore23DockClientDebugProtocol_)debugDelegate
{
  return (_TtP11DockKitCore23DockClientDebugProtocol_ *)(id)MEMORY[0x23B853C6C]((char *)self+ OBJC_IVAR____TtC11DockKitCore15DockCoreManager_debugDelegate, a2);
}

- (void)setDebugDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_)clientConfigDelegate
{
  return (_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_ *)(id)MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
}

- (void)setClientConfigDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtP11DockKitCore22DockClientCertProtocol_)certDelegate
{
  return (_TtP11DockKitCore22DockClientCertProtocol_ *)(id)MEMORY[0x23B853C6C]((char *)self+ OBJC_IVAR____TtC11DockKitCore15DockCoreManager_certDelegate, a2);
}

- (void)setCertDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC11DockKitCore18DeviceNotification)connectedNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification));
}

- (void)setConnectedNotification:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification) = (Class)a3;
  v3 = a3;

}

- (_TtC11DockKitCore18DeviceNotification)trackingEnableNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification));
}

- (void)setTrackingEnableNotification:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification) = (Class)a3;
  v3 = a3;

}

- (_TtC11DockKitCore18DeviceNotification)trackingButtonNotification
{
  return (_TtC11DockKitCore18DeviceNotification *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification));
}

- (void)setTrackingButtonNotification:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification) = (Class)a3;
  v3 = a3;

}

- (OS_dispatch_queue)darwinQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue));
}

- (void)setDarwinQueue:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_darwinQueue) = (Class)a3;
  v3 = a3;

}

- (_TtC11DockKitCore17DockCoreAccessory)_connected
{
  return (_TtC11DockKitCore17DockCoreAccessory *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected));
}

- (void)set_connected:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__connected) = (Class)a3;
  v3 = a3;

}

- (int64_t)_trackingButtonState
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState);
}

- (void)set_trackingButtonState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState) = (Class)a3;
}

- (_TtC11DockKitCore15DockCoreManager)init
{
  return (_TtC11DockKitCore15DockCoreManager *)DockCoreManager.init()();
}

- (void)dealloc
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  DockCoreManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectionDelegate);

  swift_release();
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_stateDelegate);
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_configDelegate);
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_debugDelegate);
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_certDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingEnableNotification));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification));

  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture));
}

+ (BOOL)debugAllowed
{
  return _s11DockKitCore0aC7ManagerC12debugAllowedSbvgZ_0() & 1;
}

+ (NSString)localFirmwarePath
{
  uint64_t v2;
  void *v3;

  _s11DockKitCore0aC7ManagerC17localFirmwarePathSSSgvgZ_0();
  if (v2)
  {
    v3 = (void *)sub_23A690E04();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (BOOL)ignoreStartupValidation
{
  return _s11DockKitCore0aC7ManagerC23ignoreStartupValidationSbvgZ_0() & 1;
}

+ (BOOL)diagnosticsCollectionEnabled
{
  return _s11DockKitCore0aC7ManagerC28diagnosticsCollectionEnabledSbvgZ_0() & 1;
}

- (void)clearAllSavedObjects
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A648694();

}

- (void)clearAllDelegates
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A6487C0();

}

- (void)disconnect
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  DockCoreManager.disconnect()();

}

- (void)clearXPCError
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  _TtC11DockKitCore15DockCoreManager *v5;
  void *v6;
  os_unfair_lock_s *v7;

  v3 = OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionLock;
  v4 = *(os_unfair_lock_s **)((char *)&self->super.isa
                            + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionLock);
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnectionError) = 0;

  v7 = *(os_unfair_lock_s **)((char *)&self->super.isa + v3);
  swift_retain();
  os_unfair_lock_unlock(v7 + 4);

  swift_release();
}

- (id)xpcConnection
{
  _TtC11DockKitCore15DockCoreManager *v2;
  void *v3;

  v2 = self;
  v3 = sub_23A648CD0();

  return v3;
}

- (id)xpcConnection_useEntitledIfOpen
{
  _TtC11DockKitCore15DockCoreManager *v2;
  void *v3;

  v2 = self;
  v3 = sub_23A649D8C();

  return v3;
}

- (void)handleUnexpectedDisconnect
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A6499FC();

}

- (void)closeXPCNoReply
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A65848C(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection);

}

- (void)pairedDockAccessoriesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0CB8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0CC0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0CC8, (uint64_t)v12);
  swift_release();
}

- (void)_pairedDockAccessoriesWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A666C1C);
}

- (void)selectSubjects:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0C98;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0CA0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0CA8, (uint64_t)v14);
  swift_release();
}

- (void)_selectSubjects:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC11DockKitCore15DockCoreManager *v7;

  v5 = _Block_copy(a4);
  v6 = sub_23A690F18();
  _Block_copy(v5);
  v7 = self;
  sub_23A6671D8(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();

}

- (void)selectSubjectAt:(CGPoint)a3 completionHandler:(id)a4
{
  CGFloat y;
  CGFloat x;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  CGFloat *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  y = a3.y;
  x = a3.x;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (CGFloat *)swift_allocObject();
  v12[2] = x;
  v12[3] = y;
  *((_QWORD *)v12 + 4) = v11;
  *((_QWORD *)v12 + 5) = self;
  v13 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0C78;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0C80;
  v15[5] = v14;
  v16 = self;
  sub_23A67DFCC((uint64_t)v10, (uint64_t)&unk_2569A0C88, (uint64_t)v15);
  swift_release();
}

- (void)_selectSubjectAt:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  void *v7;
  _TtC11DockKitCore15DockCoreManager *v8;

  y = a3.y;
  x = a3.x;
  v7 = _Block_copy(a4);
  _Block_copy(v7);
  v8 = self;
  sub_23A667728((uint64_t)v8, (void (**)(_QWORD, _QWORD))v7, x, y);
  _Block_release(v7);
  _Block_release(v7);

}

- (void)setFramingModeWithMode:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0C58;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0C60;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0C68, (uint64_t)v14);
  swift_release();
}

- (void)_setFramingModeWithMode:(int64_t)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A667CAC);
}

- (void)setRectOfInterestWithRect:(CGRect)a3 completionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((_QWORD *)v14 + 6) = v13;
  *((_QWORD *)v14 + 7) = self;
  v15 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0C38;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0C40;
  v17[5] = v16;
  v18 = self;
  sub_23A67DFCC((uint64_t)v12, (uint64_t)&unk_2569A0C48, (uint64_t)v17);
  swift_release();
}

- (void)_setRectOfInterestWithRect:(CGRect)a3 completion:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  _TtC11DockKitCore15DockCoreManager *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = _Block_copy(a4);
  _Block_copy(v9);
  v10 = self;
  sub_23A668250((uint64_t)v10, (void (**)(_QWORD, _QWORD))v9, x, y, width, height);
  _Block_release(v9);
  _Block_release(v9);

}

- (void)getClientConfigurationUpdatesWithDelegate:(_TtP11DockKitCore38XPCTrackingCameraCaptureClientProtocol_ *)a3 appID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0C18;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0C20;
  v16[5] = v15;
  swift_unknownObjectRetain();
  v17 = a4;
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0C28, (uint64_t)v16);
  swift_release();
}

- (void)_getClientConfigurationUpdatesWithDelegate:(id)a3 appID:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC11DockKitCore15DockCoreManager *v12;

  v7 = _Block_copy(a5);
  v8 = sub_23A690E1C();
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v7;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v12 = self;
  sub_23A665308((uint8_t *)a3, v8, v10, sub_23A6747CC, v11, v12);
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)setFramingModeEventWithMode:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  _TtC11DockKitCore15DockCoreManager *v8;

  v5 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  v6 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  v8 = self;
  swift_unknownObjectRelease();
  if (v6 && (v7 = (void *)MEMORY[0x23B853C6C](v5)) != 0)
  {
    objc_msgSend(v7, sel_setFramingModeEventWithMode_, a3);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)selectSubjectAtEventWithX:(id)a3 y:(id)a4
{
  char *v7;
  uint64_t v8;
  id v9;
  _TtC11DockKitCore15DockCoreManager *v10;
  void *v11;
  id v12;

  v7 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  v8 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  v12 = a3;
  v9 = a4;
  v10 = self;
  swift_unknownObjectRelease();
  if (v8 && (v11 = (void *)MEMORY[0x23B853C6C](v7)) != 0)
  {
    objc_msgSend(v11, sel_selectSubjectAtEventWithX_y_, v12, v9);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)selectSubjectsEvent:(id)a3
{
  char *v4;
  uint64_t v5;
  _TtC11DockKitCore15DockCoreManager *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  sub_23A690F18();
  v4 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  v5 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  v6 = self;
  swift_unknownObjectRelease();
  if (v5 && (v7 = MEMORY[0x23B853C6C](v4)) != 0)
  {
    v8 = (void *)v7;
    v9 = (void *)sub_23A690F00();
    objc_msgSend(v8, sel_selectSubjectsEvent_, v9);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)setRectOfInterestEventWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  void *v10;
  _TtC11DockKitCore15DockCoreManager *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  v9 = MEMORY[0x23B853C6C]((char *)self + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate, a2);
  v11 = self;
  swift_unknownObjectRelease();
  if (v9 && (v10 = (void *)MEMORY[0x23B853C6C](v8)) != 0)
  {
    objc_msgSend(v10, sel_setRectOfInterestEventWithRect_, x, y, width, height);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)sendCommandEventWithCommand:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TtC11DockKitCore15DockCoreManager *v13;

  v4 = a3;
  v13 = self;
  v5 = sub_23A690624();
  v7 = v6;

  v8 = (char *)v13 + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate;
  v9 = MEMORY[0x23B853C6C]((char *)v13 + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_clientConfigDelegate);
  swift_unknownObjectRelease();
  if (v9)
  {
    v10 = MEMORY[0x23B853C6C](v8);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)sub_23A690618();
      objc_msgSend(v11, sel_sendCommandEventWithCommand_, v12);

      swift_unknownObjectRelease();
    }
  }
  sub_23A5CA254(v5, v7);

}

- (void)connectedDockAccessoryWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0BF8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0C00;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0C08, (uint64_t)v12);
  swift_release();
}

- (void)_connectedDockAccessoryWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A6687AC);
}

- (void)dockedDockAccessoryWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0BD8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0BE0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0BE8, (uint64_t)v12);
  swift_release();
}

- (void)_dockedDockAccessoryWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A668D60);
}

- (void)getDockTrackingButtonStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0BB8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0BC0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0BC8, (uint64_t)v12);
  swift_release();
}

- (void)_getDockTrackingButtonStateWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A6692FC);
}

- (void)updateCameraSessionWithSession:(_TtC11DockKitCore24CameraSessionInformation *)a3 new:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore24CameraSessionInformation *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0B90;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0B98;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0BA0, (uint64_t)v16);
  swift_release();
}

- (void)_updateCameraSessionWithSession:(id)a3 new:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  _TtC11DockKitCore15DockCoreManager *v9;
  id v10;

  v5 = a4;
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v10 = a3;
  v9 = self;
  sub_23A66988C((uint64_t)v10, v5, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)_updateTrackingSummaryDebugWithData:(id)a3 completion:(id)a4
{
  sub_23A660A88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_23A669DE4);
}

- (void)_updateTrackingSummaryWithData:(id)a3 completion:(id)a4
{
  sub_23A660A88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_23A66A30C);
}

- (void)setSystemTrackingEnabledWithEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0B70;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0B78;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0B80, (uint64_t)v14);
  swift_release();
}

- (void)_setSystemTrackingEnabledWithEnabled:(BOOL)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A66A834);
}

- (void)getSystemTrackingEnabledWithAppID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0B50;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0B58;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0B60, (uint64_t)v14);
  swift_release();
}

- (void)_getSystemTrackingEnabledWithAppID:(id)a3 completion:(id)a4
{
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC11DockKitCore15DockCoreManager *v9;

  v5 = _Block_copy(a4);
  v6 = (_QWORD *)sub_23A690E1C();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_23A66ADE0(v6, v8, (char *)v9, v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();

}

- (BOOL)getStateEventsWithDelegate:(id)a3 syncWithDaemon:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  _TtC11DockKitCore15DockCoreManager *v8;

  v5 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  DockCoreManager.getStateEvents(delegate:syncWithDaemon:)((uint64_t)a3, v5);
  swift_unknownObjectRelease();

  return 1;
}

- (void)stopStateEvents
{
  void *v2;
  _TtC11DockKitCore15DockCoreManager *v3;
  _TtC11DockKitCore15DockCoreManager *v4;
  _TtC11DockKitCore15DockCoreManager *v5;
  _TtC11DockKitCore15DockCoreManager *v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification);
  if (v2)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_connectedNotification) = 0;
    v3 = self;

  }
  else
  {
    v4 = self;
  }
  v5 = self;
  v6 = *(_TtC11DockKitCore15DockCoreManager **)((char *)&self->super.isa
                                              + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification);
  if (v6)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_trackingButtonNotification) = 0;

    v5 = v6;
  }

}

- (BOOL)monitorSystemTrackingStateWithDelegate:(id)a3 appID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC11DockKitCore15DockCoreManager *v10;

  v7 = sub_23A690E1C();
  v9 = v8;
  swift_unknownObjectRetain();
  v10 = self;
  DockCoreManager.monitorSystemTrackingState(delegate:appID:)((uint64_t)a3, v7, v9);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)notifyConfigDelegateWithAppID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11DockKitCore15DockCoreManager *v7;

  v4 = sub_23A690E1C();
  v6 = v5;
  v7 = self;
  sub_23A65314C(v4, v6);
  swift_bridgeObjectRelease();

}

- (void)setCachedConnectedWithConnected:(id)a3
{
  os_unfair_lock_s *v5;
  id v6;
  _TtC11DockKitCore15DockCoreManager *v7;

  v5 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_allocatedLock);
  v6 = a3;
  v7 = self;
  swift_retain();
  os_unfair_lock_lock(v5 + 5);
  sub_23A653614((uint64_t)&v5[4], (uint64_t)v7, a3, "setCachedConnected: setting _connected to %@");
  os_unfair_lock_unlock(v5 + 5);

  swift_release();
}

- (void)setCachedButtonStateWithEnabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *v4;
  _TtC11DockKitCore15DockCoreManager *v5;

  v3 = a3;
  v4 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_allocatedLock);
  v5 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 5);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__trackingButtonState) = (Class)v3;
  os_unfair_lock_unlock(v4 + 5);

  swift_release();
}

- (void)syncStateAndGenerateStateEvents:(unint64_t)a3
{
  _TtC11DockKitCore15DockCoreManager *v3;

  v3 = self;
  sub_23A66B39C();

}

- (NSXPCConnection)_xpcConnection_Debug
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug));
}

- (void)set_xpcConnection_Debug:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug) = (Class)a3;
  v3 = a3;

}

- (id)xpcConnection_Debug
{
  _TtC11DockKitCore15DockCoreManager *v2;
  void *v3;

  v2 = self;
  v3 = sub_23A65512C();

  return v3;
}

- (void)closeXPCNoReply_Debug
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A65848C(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Debug);

}

- (void)setDockAccessoryStateWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 docked:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0B10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0B18;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0B20, (uint64_t)v16);
  swift_release();
}

- (void)_setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5
{
  void *v8;
  _TtC11DockKitCore15DockCoreManager *v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v10 = a3;
  v9 = self;
  sub_23A66B53C((uint64_t)v10, a4, (uint64_t)v9, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)triggerSystemEventWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 event:(_TtC11DockKitCore20AccessorySystemEvent *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  _TtC11DockKitCore20AccessorySystemEvent *v18;
  _TtC11DockKitCore15DockCoreManager *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0AF0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0AF8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0B00, (uint64_t)v16);
  swift_release();
}

- (void)_triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC11DockKitCore15DockCoreManager *v10;
  id v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v11 = a3;
  v9 = a4;
  v10 = self;
  sub_23A66BAAC((uint64_t)v11, (uint64_t)v9, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)getTrackerDebugNotificationsWithDelegate:(_TtP11DockKitCore23DockClientDebugProtocol_ *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0AD0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0AD8;
  v14[5] = v13;
  swift_unknownObjectRetain();
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0AE0, (uint64_t)v14);
  swift_release();
}

- (void)_getTrackerDebugNotificationsWithDelegate:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC11DockKitCore15DockCoreManager *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v8 = self;
  sub_23A665E34((uint64_t)a3, (void (*)(_QWORD, _QWORD))sub_23A67479C, v7, (char *)v8);
  swift_release();

  swift_unknownObjectRelease();
}

- (void)stopTrackerDebugNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0AB0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0AB8;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0AC0, (uint64_t)v12);
  swift_release();
}

- (void)_stopTrackerDebugNotificationsWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A66C01C);
}

- (void)getAccessoryDescriptionWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore27XPCDataStreamClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0A90;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0A98;
  v16[5] = v15;
  v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0AA0, (uint64_t)v16);
  swift_release();
}

- (void)_getAccessoryDescriptionWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
  void *v8;
  _TtC11DockKitCore15DockCoreManager *v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v10 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  sub_23A66C5C0((uint64_t)a3, a4, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_unknownObjectRelease();
}

- (NSXPCConnection)_xpcConnection_Certification
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification));
}

- (void)set_xpcConnection_Certification:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification) = (Class)a3;
  v3 = a3;

}

- (id)xpcConnection_Cert
{
  _TtC11DockKitCore15DockCoreManager *v2;
  void *v3;

  v2 = self;
  v3 = sub_23A657DD8();

  return v3;
}

- (void)closeXPCNoReply_Cert
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A65848C(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_Certification);

}

- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 options:(NSDictionary *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC11DockKitCore12DockCoreInfo *v19;
  NSDictionary *v20;
  _TtC11DockKitCore15DockCoreManager *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0A70;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A0A78;
  v18[5] = v17;
  v19 = a3;
  swift_unknownObjectRetain();
  v20 = a5;
  v21 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A0A80, (uint64_t)v18);
  swift_release();
}

- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 delegate:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v9;
  uint64_t v10;
  _TtC11DockKitCore15DockCoreManager *v11;
  id v12;

  v9 = _Block_copy(a6);
  sub_23A5D03A4(0, (unint64_t *)&unk_25699E110);
  v10 = sub_23A690DBC();
  _Block_copy(v9);
  v12 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  sub_23A66CB18(a3, (uint8_t *)a4, v10, (uint64_t)v11, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)getAccessoryDiagnosticsWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 options:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  NSDictionary *v18;
  _TtC11DockKitCore15DockCoreManager *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0A50;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0A58;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0A60, (uint64_t)v16);
  swift_release();
}

- (void)_getAccessoryDiagnosticsWithInfo:(id)a3 options:(id)a4 completion:(id)a5
{
  void *v7;
  _QWORD *v8;
  _TtC11DockKitCore15DockCoreManager *v9;
  id v10;

  v7 = _Block_copy(a5);
  sub_23A5D03A4(0, (unint64_t *)&unk_25699E110);
  v8 = (_QWORD *)sub_23A690DBC();
  _Block_copy(v7);
  v10 = a3;
  v9 = self;
  sub_23A66D0B4((uint64_t)a3, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();

}

- (void)manualFirmwareUpdateWithFilePath:(NSString *)a3 sandboxExt:(NSString *)a4 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  _TtC11DockKitCore15DockCoreManager *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2569A0A30;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2569A0A38;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  swift_unknownObjectRetain();
  v21 = self;
  sub_23A67DFCC((uint64_t)v13, (uint64_t)&unk_2569A0A40, (uint64_t)v18);
  swift_release();
}

- (void)_manualFirmwareUpdateWithFilePath:(id)a3 sandboxExt:(id)a4 delegate:(id)a5 completion:(id)a6
{
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC11DockKitCore15DockCoreManager *v15;

  v8 = _Block_copy(a6);
  v9 = (_QWORD *)sub_23A690E1C();
  v11 = v10;
  v12 = sub_23A690E1C();
  v14 = v13;
  _Block_copy(v8);
  swift_unknownObjectRetain();
  v15 = self;
  sub_23A66D638(v9, v11, v12, v14, (uint64_t)a5, (uint64_t)v15, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)haltWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A0A10;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A0A18;
  v16[5] = v15;
  v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A0A20, (uint64_t)v16);
  swift_release();
}

- (void)_haltWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
  sub_23A65CA54(self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, id, void *))sub_23A66DB5C);
}

- (NSXPCConnection)_xpcConnection_CameraCapture
{
  return (NSXPCConnection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture));
}

- (void)set_xpcConnection_CameraCapture:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture) = (Class)a3;
  v3 = a3;

}

- (id)xpcConnection_CameraCapture
{
  _TtC11DockKitCore15DockCoreManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_23A649E20();

  return v3;
}

- (void)closeXPCNoReply_CameraCapture
{
  _TtC11DockKitCore15DockCoreManager *v2;

  v2 = self;
  sub_23A65848C(&OBJC_IVAR____TtC11DockKitCore15DockCoreManager__xpcConnection_CameraCapture);

}

- (void)rebootWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 delegate:(_TtP11DockKitCore30XPCCertificationClientProtocol_ *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC11DockKitCore12DockCoreInfo *v17;
  _TtC11DockKitCore15DockCoreManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2569A09E8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2569A09F0;
  v16[5] = v15;
  v17 = a3;
  swift_unknownObjectRetain();
  v18 = self;
  sub_23A67DFCC((uint64_t)v11, (uint64_t)&unk_2569A09F8, (uint64_t)v16);
  swift_release();
}

- (void)_rebootWithInfo:(id)a3 delegate:(id)a4 completion:(id)a5
{
  sub_23A65CA54(self, (int)a2, a3, (uint64_t)a4, a5, (void (*)(id, uint64_t, id, void *))sub_23A66E0B4);
}

- (void)connectedClientsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A09C8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A09D0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A09D8, (uint64_t)v12);
  swift_release();
}

- (void)_connectedClientsWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A66E60C);
}

- (void)versionsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A09A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A09B0;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A09B8, (uint64_t)v12);
  swift_release();
}

- (void)_versionsWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A66EBA8);
}

- (void)migrateDataWithUpdate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0988;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0990;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0998, (uint64_t)v14);
  swift_release();
}

- (void)_migrateDataWithUpdate:(BOOL)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A66F144);
}

- (void)dumpStateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC11DockKitCore15DockCoreManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2569A0968;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2569A0970;
  v12[5] = v11;
  v13 = self;
  sub_23A67DFCC((uint64_t)v7, (uint64_t)&unk_2569A0978, (uint64_t)v12);
  swift_release();
}

- (void)_dumpStateWithCompletion:(id)a3
{
  sub_23A65F8B0(self, (int)a2, a3, (void (*)(void))sub_23A66F6F0);
}

- (void)unpairAccessoryWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore12DockCoreInfo *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0948;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0950;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0958, (uint64_t)v14);
  swift_release();
}

- (void)_unpairAccessoryWithInfo:(id)a3 completion:(id)a4
{
  sub_23A660A88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_23A66FCA0);
}

- (void)returnToBaseWithInfo:(_TtC11DockKitCore12DockCoreInfo *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore12DockCoreInfo *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0928;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0930;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0938, (uint64_t)v14);
  swift_release();
}

- (void)_returnToBaseWithInfo:(id)a3 completion:(id)a4
{
  sub_23A660A88(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_23A670208);
}

- (void)dumpTrackerDiagsWithPath:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0900;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A0908;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A0910, (uint64_t)v14);
  swift_release();
}

- (void)_dumpTrackerDiagsWithPath:(id)a3 completion:(id)a4
{
  sub_23A661F14(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_23A670770);
}

- (void)dumpTrackerStatesWithPath:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC11DockKitCore15DockCoreManager *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A08E0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A08E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A08F0, (uint64_t)v14);
  swift_release();
}

- (void)_dumpTrackerStatesWithPath:(id)a3 completion:(id)a4
{
  sub_23A661F14(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_23A670D90);
}

- (void)searchWithCalibrate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A08C0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A08C8;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A08D0, (uint64_t)v14);
  swift_release();
}

- (void)_searchWithCalibrate:(BOOL)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A6713B0);
}

- (void)stopSearchWithCalibrate:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A08A0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A08A8;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_2569A08B0, (uint64_t)v14);
  swift_release();
}

- (void)_stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A671978);
}

- (void)setDockTrackingButtonStateWithState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542D27F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23A690F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2569A0890;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2569A03C0;
  v14[5] = v13;
  v15 = self;
  sub_23A67DFCC((uint64_t)v9, (uint64_t)&unk_25699FF10, (uint64_t)v14);
  swift_release();
}

- (void)_setDockTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4
{
  sub_23A663344(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_23A671F40);
}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3
{
  sub_23A664020((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_dumpTrackerDiagnosticsWithPath_);
}

- (void)dumpTrackerStateWithPath:(id)a3
{
  sub_23A664020((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_dumpTrackerStateWithPath_);
}

- (void)searchWithCalibrate:(BOOL)a3
{
  sub_23A66418C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_searchWithCalibrate_);
}

- (void)stopSearchWithCalibrate:(BOOL)a3
{
  sub_23A66418C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_stopSearchWithCalibrate_);
}

- (void)returnToBase
{
  sub_23A6642E0((char *)self, (uint64_t)a2, (SEL *)&selRef_returnToBase);
}

- (void)stopReturnToBase
{
  sub_23A6642E0((char *)self, (uint64_t)a2, (SEL *)&selRef_stopReturnToBase);
}

- (void)accessoryDescriptionFeedbackWithProcessID:(int)a3 info:(id)a4 accessoryDescription:(id)a5 err:(id)a6
{
  sub_23A66463C((char *)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_accessoryDescriptionFeedbackLock, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_accessoryDescriptionFeedbackDelegates, (SEL *)&selRef_accessoryDescriptionFeedbackWithProcessID_info_accessoryDescription_err_, (void (*)(uint64_t))sub_23A614138);
}

- (void)diagnosticsFeedbackWithProcessID:(int)a3 info:(id)a4 path:(id)a5 err:(id)a6
{
  sub_23A66463C((char *)self, (uint64_t)a2, a3, a4, (uint64_t)a5, a6, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_diagnosticsFeedbackLock, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_diagnosticsFeedbackDelegates, (SEL *)&selRef_diagnosticsFeedbackWithProcessID_info_path_err_, (void (*)(uint64_t))sub_23A614144);
}

- (void)fwUpdateFeedbackWithProcessID:(int)a3 info:(id)a4 message:(id)a5 complete:(BOOL)a6 err:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  id v14;
  _TtC11DockKitCore15DockCoreManager *v15;
  id v16;

  v10 = sub_23A690E1C();
  v12 = v11;
  v13 = *(os_unfair_lock_s **)((char *)&self->super.isa
                             + OBJC_IVAR____TtC11DockKitCore15DockCoreManager_fwUpdateFeedbackLock);
  v14 = a4;
  v15 = self;
  v16 = a7;
  swift_retain();
  os_unfair_lock_lock(v13 + 5);
  sub_23A6647F4((uint64_t)&v13[4], (uint64_t)v15, a3, (uint64_t)v14, v10, v12, a6, (uint64_t)a7);
  os_unfair_lock_unlock(v13 + 5);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)haltFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7
{
  sub_23A664C3C((char *)self, (uint64_t)a2, *(uint64_t *)&a3, a4, a5, a6, a7, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_haltFeedbackLock, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_haltFeedbackDelegates, (SEL *)&selRef_haltFeedbackWithProcessID_info_success_complete_err_);
}

- (void)rebootFeedbackWithProcessID:(int)a3 info:(id)a4 success:(BOOL)a5 complete:(BOOL)a6 err:(id)a7
{
  sub_23A664C3C((char *)self, (uint64_t)a2, *(uint64_t *)&a3, a4, a5, a6, a7, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_rebootFeedbackLock, &OBJC_IVAR____TtC11DockKitCore15DockCoreManager_rebootFeedbackDelegates, (SEL *)&selRef_rebootFeedbackWithProcessID_info_success_complete_err_);
}

@end
