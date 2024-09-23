@implementation DTObjectAllocService

+ (void)registerCapabilities:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[DTAllocationsRecorder serviceIdentifier](DTAllocationsRecorder, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", v4, +[DTAllocationsRecorder currentVersion](DTAllocationsRecorder, "currentVersion"), a1);

  objc_msgSend(v5, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.objectalloc.immediate"), 1, a1);
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.objectalloc.deferred"), 1, a1);
  objc_msgSend(v5, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.objectalloc.zombies"), 1, a1);

}

- (DTObjectAllocService)initWithChannel:(id)a3
{
  id v4;
  DTObjectAllocService *v5;
  uint64_t v6;
  DTAllocationsRecorder *recorder;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTObjectAllocService;
  v5 = -[DTXService initWithChannel:](&v11, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    recorder = v5->_recorder;
    v5->_recorder = (DTAllocationsRecorder *)v6;

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_222B7FCF4;
    v9[3] = &unk_24EB2A6E8;
    v10 = v4;
    -[DTAllocationsRecorder setBufferHandler:](v5->_recorder, "setBufferHandler:", v9);

  }
  return v5;
}

- (void)messageReceived:(id)a3
{
  mach_port_name_t task;

  if (objc_msgSend(a3, "errorStatus") == 2)
  {
    task = self->_task;
    if (task + 1 >= 2)
    {
      mach_port_deallocate(*MEMORY[0x24BDAEC58], task);
      self->_task = 0;
    }
    -[DTAllocationsRecorder cancel](self->_recorder, "cancel");
  }
}

- (id)preparedEnvironmentForLaunch:(id)a3 eventsMask:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = objc_msgSend(v5, "intValue");

  if (+[DTAllocationsRecorder configureLocalLaunchEnvironment:recordedEventsMask:](DTAllocationsRecorder, "configureLocalLaunchEnvironment:recordedEventsMask:", v6, v7))
  {
    v8 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)attachToPid:(id)a3 eventsMask:(id)a4
{
  id v6;
  void *v7;
  DTAllocationsRecorder *recorder;
  uint64_t task;
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  self->_task = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", objc_msgSend(a3, "intValue"));
  v7 = (void *)objc_opt_new();
  recorder = self->_recorder;
  task = self->_task;
  v10 = objc_msgSend(v6, "intValue");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_222B7FF3C;
  v13[3] = &unk_24EB283C8;
  v11 = v7;
  v14 = v11;
  -[DTAllocationsRecorder startAttachingToTask:recordedEventsMask:errorHandler:](recorder, "startAttachingToTask:recordedEventsMask:errorHandler:", task, v10, v13);

  return v11;
}

- (void)startCollectionWithPid:(int)a3
{
  uint64_t v5;
  DTAllocationsRecorder *recorder;
  uint64_t v7;
  _QWORD v8[6];

  v5 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", *(_QWORD *)&a3);
  self->_task = v5;
  recorder = self->_recorder;
  v7 = +[DTAllocationsRecorder allEventsMask](DTAllocationsRecorder, "allEventsMask");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_222B80008;
  v8[3] = &unk_24EB2A710;
  v8[4] = self;
  v8[5] = a2;
  -[DTAllocationsRecorder startAttachingToTask:recordedEventsMask:errorHandler:](recorder, "startAttachingToTask:recordedEventsMask:errorHandler:", v5, v7, v8);
}

- (void)stopCollection
{
  id v3;

  -[DTAllocationsRecorder stop](self->_recorder, "stop");
  -[DTXService channel](self, "channel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recorder, 0);
}

@end
