@implementation AXCameraManager

- (AXCameraManager)init
{
  return (AXCameraManager *)AccessibilityCameraManager.init()();
}

- (void)fetchCurrentCameraSceneBufferWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;
  AXCameraManager *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___AXCameraManager_frameHandler);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AXCameraManager_frameHandler);
  *v6 = sub_1BD8DFAAC;
  v6[1] = (uint64_t (*)())v5;
  v8 = self;
  swift_retain();
  sub_1BD8DF428(v7);
  sub_1BD8DEC30();

  swift_release();
}

- (void).cxx_destruct
{

  sub_1BD8DF428(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AXCameraManager_frameHandler));
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  opaqueCMSampleBuffer *v9;
  id v10;
  AXCameraManager *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1BD8DF88C(v9);

}

@end
