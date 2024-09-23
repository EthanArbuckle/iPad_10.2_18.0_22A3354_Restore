@implementation IDSBlastDoorInterfaceInternal

- (void)unpackPayloadDictionary:(id)a3 resultHandler:(id)a4
{
  void *v5;
  _QWORD *v6;
  IDSBlastDoorInterfaceInternal *v7;

  v5 = _Block_copy(a4);
  v6 = (_QWORD *)sub_1CCD47558();
  _Block_copy(v5);
  v7 = self;
  sub_1CCD465DC(v6, (uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)unpackClientMessage:(id)a3 context:(id)a4 resultHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  IDSBlastDoorInterfaceInternal *v9;

  v6 = _Block_copy(a5);
  v7 = sub_1CCD47558();
  v8 = sub_1CCD47558();
  _Block_copy(v6);
  v9 = self;
  sub_1CCD46C6C(v7, v8, (uint64_t)v9, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (IDSBlastDoorInterfaceInternal)init
{
  return (IDSBlastDoorInterfaceInternal *)IDSBlastDoorInterface.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
