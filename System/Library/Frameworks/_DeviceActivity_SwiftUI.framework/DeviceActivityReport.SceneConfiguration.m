@implementation DeviceActivityReport.SceneConfiguration

- (void)updateDeviceActivityData:(id)a3 segmentInterval:(id)a4 replyHandler:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration *v13;
  uint64_t v14;

  v7 = sub_22910A3E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = sub_22910A8EC();
  sub_22910A3DC();
  _Block_copy(v11);
  v13 = self;
  sub_2291027DC(v12, (uint64_t)v10, v13, v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration)init
{
  return (_TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration *)sub_229100784();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration__deviceActivityData;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A277B8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue));
}

@end
