@implementation VideoMessagingServer

- (void)sendVideoMessageWithData:(NSData *)a3 url:(_TtC20FaceTimeMessageStore18SandboxExtendedURL *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSData *v10;
  _TtC20FaceTimeMessageStore18SandboxExtendedURL *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain();
  sub_23B393E98((uint64_t)&unk_256A0DA18, (uint64_t)v9);
}

@end
