@implementation APNSManager.PushDelegateTrampoline

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_23B6B5F00(a4);

}

- (void)dealloc
{
  uint64_t v2;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_256A46C08;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_23B6E0668();
  __swift_project_value_buffer(v4, (uint64_t)qword_256A46E00);
  v5 = sub_23B6E0650();
  v6 = sub_23B6E08C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23B6B3000, v5, v6, "APNSManager deinit", v7, 2u);
    MEMORY[0x23B86B840](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for APNSManager.PushDelegateTrampoline();
  -[APNSManager.PushDelegateTrampoline dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v20;
  v10 = self;
  if (a4)
  {
    v11 = a4;
    v12 = sub_23B6E0614();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_23B6C5A50(v12, v14);
    goto LABEL_8;
  }
  v16 = Strong;
  if (v14 >> 60 == 15)
  {
    swift_release();
LABEL_8:

    return;
  }
  v17 = sub_23B6E07DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = v12;
  v18[6] = v14;
  sub_23B6C5B4C(v12, v14);
  sub_23B6CE420((uint64_t)v8, (uint64_t)&unk_256A46F60, (uint64_t)v18);
  swift_release();
  sub_23B6C5A50(v12, v14);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v8;
  id v10;
  id v11;
  id v12;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (void *)sub_23B6E0614();
    v16 = v15;

    if (a5)
      goto LABEL_3;
  }
  else
  {
    v17 = a3;
    v18 = a5;
    v19 = a6;
    v20 = self;
    v16 = 0xF000000000000000;
    if (a5)
    {
LABEL_3:
      sub_23B6E06EC();

      if (!a6)
        goto LABEL_7;
      goto LABEL_4;
    }
  }
  if (a6)
  {
LABEL_4:
    sub_23B6E06EC();

  }
LABEL_7:
  if (qword_256A46C08 != -1)
    swift_once();
  v21 = sub_23B6E0668();
  __swift_project_value_buffer(v21, (uint64_t)qword_256A46E00);
  v22 = sub_23B6E0650();
  v23 = sub_23B6E08A8();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_23B6B3000, v22, v23, "NOT IMPLEMENTED: connection:didReceiveToken:forTopic:identifier:", v24, 2u);
    MEMORY[0x23B86B840](v24, -1, -1);
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_23B6C5A50((uint64_t)v8, v16);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  id v8;
  id v9;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;

  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v10 = self;
    v11 = a4;
    v12 = sub_23B6E0614();
    v14 = v13;

  }
  else
  {
    v15 = a3;
    v16 = a5;
    v17 = self;
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  if (qword_256A46C08 != -1)
    swift_once();
  v18 = sub_23B6E0668();
  __swift_project_value_buffer(v18, (uint64_t)qword_256A46E00);
  v19 = sub_23B6E0650();
  v20 = sub_23B6E08A8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_23B6B3000, v19, v20, "NOT IMPLEMENTED: connection:didReceiveToken:info:", v21, 2u);
    MEMORY[0x23B86B840](v21, -1, -1);
  }

  sub_23B6C5A50(v12, v14);
}

- (void)connection:(id)a3 didReceiveURLToken:(id)a4 forInfo:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;

  v8 = qword_256A46C08;
  v9 = a3;
  v10 = a4;
  v16 = a5;
  v11 = self;
  if (v8 != -1)
    swift_once();
  v12 = sub_23B6E0668();
  __swift_project_value_buffer(v12, (uint64_t)qword_256A46E00);
  v13 = sub_23B6E0650();
  v14 = sub_23B6E08A8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23B6B3000, v13, v14, "NOT IMPLEMENTED: connection:didReceive:info:", v15, 2u);
    MEMORY[0x23B86B840](v15, -1, -1);
  }

}

- (void)connection:(id)a3 didReceiveURLTokenError:(id)a4 forInfo:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v16;

  v8 = qword_256A46C08;
  v9 = a3;
  v10 = a5;
  v16 = self;
  v11 = a4;
  if (v8 != -1)
    swift_once();
  v12 = sub_23B6E0668();
  __swift_project_value_buffer(v12, (uint64_t)qword_256A46E00);
  v13 = sub_23B6E0650();
  v14 = sub_23B6E08A8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23B6B3000, v13, v14, "NOT IMPLEMENTED: connection:didReceiveURLTokenError:for:", v15, 2u);
    MEMORY[0x23B86B840](v15, -1, -1);
  }

}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_256A46C08;
  v7 = a3;
  v13 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once();
  v9 = sub_23B6E0668();
  __swift_project_value_buffer(v9, (uint64_t)qword_256A46E00);
  v10 = sub_23B6E0650();
  v11 = sub_23B6E08A8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23B6B3000, v10, v11, "NOT IMPLEMENTED: connection:didSend:message:", v12, 2u);
    MEMORY[0x23B86B840](v12, -1, -1);
  }

}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v16;

  v8 = qword_256A46C08;
  v9 = a3;
  v10 = a4;
  v16 = self;
  v11 = a5;
  if (v8 != -1)
    swift_once();
  v12 = sub_23B6E0668();
  __swift_project_value_buffer(v12, (uint64_t)qword_256A46E00);
  v13 = sub_23B6E0650();
  v14 = sub_23B6E08A8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_23B6B3000, v13, v14, "NOT IMPLEMENTED: connection:didFailToSend:error:", v15, 2u);
    MEMORY[0x23B86B840](v15, -1, -1);
  }

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v11 = Strong;
    v12 = sub_23B6E07DC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = 0;
    *(_QWORD *)(v13 + 24) = 0;
    *(_QWORD *)(v13 + 32) = v11;
    *(_BYTE *)(v13 + 40) = a4;
    v14 = a3;
    v15 = self;
    sub_23B6CE420((uint64_t)v9, (uint64_t)&unk_256A46F20, v13);
    swift_release();

  }
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v9 = Strong;
    v10 = sub_23B6E07DC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    v12 = a3;
    v13 = self;
    sub_23B6CE420((uint64_t)v7, (uint64_t)&unk_256A46F08, (uint64_t)v11);
    swift_release();

  }
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *v12;

  if (a4)
  {
    sub_23B6C58C0(0, (unint64_t *)&unk_256A46EF0);
    sub_23B6E0794();
  }
  v6 = qword_256A46C08;
  v7 = a3;
  v12 = self;
  if (v6 != -1)
    swift_once();
  v8 = sub_23B6E0668();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A46E00);
  v9 = sub_23B6E0650();
  v10 = sub_23B6E08A8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23B6B3000, v9, v10, "NOT IMPLEMENTED: channelSubscriptionsFailedWith:", v11, 2u);
    MEMORY[0x23B86B840](v11, -1, -1);
  }
  swift_bridgeObjectRelease();

}

- (_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline)init
{
  _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *result;

  result = (_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
