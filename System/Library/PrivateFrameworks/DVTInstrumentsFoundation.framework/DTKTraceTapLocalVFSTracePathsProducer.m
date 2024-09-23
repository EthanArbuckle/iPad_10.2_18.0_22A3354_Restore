@implementation DTKTraceTapLocalVFSTracePathsProducer

+ (BOOL)supportsConfig:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_222B48528;
  v6[3] = &unk_24EB295F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateTriggerConfigs:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (DTKTraceTapLocalVFSTracePathsProducer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTKTraceTapLocalVFSTracePathsProducer;
  return -[DTKTraceTapLocalVFSTracePathsProducer init](&v3, sel_init);
}

- (void)_emitVFSDump
{
  sysctlbyname("vfs.generic.trace_paths", 0, 0, 0, 0);
}

- (void)start
{
  MEMORY[0x24BEDD108](self, sel__emitVFSDump);
}

@end
