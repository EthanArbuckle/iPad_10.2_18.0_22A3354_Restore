@implementation BioStreamsEventHelper

- (BioStreamsEventHelper)initWithBKDeviceType:(int64_t)a3 inBuddy:(BOOL)a4
{
  BioStreamsEventHelper *v6;
  BioStreamsEventHelper *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  BioStreamsEventHelper *v15;
  void *v16;
  uint64_t v17;
  id v19;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v20.receiver = self;
  v20.super_class = (Class)BioStreamsEventHelper;
  v6 = -[BioStreamsEventHelper init](&v20, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  v6->_inBuddy = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v8 = (void *)getBKDeviceClass_softClass_0;
  v29 = getBKDeviceClass_softClass_0;
  if (!getBKDeviceClass_softClass_0)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getBKDeviceClass_block_invoke_0;
    v24 = &unk_1EA27FEE8;
    v25 = &v26;
    __getBKDeviceClass_block_invoke_0((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v26, 8);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v10 = (void *)getBKDeviceDescriptorClass_softClass_0;
  v29 = getBKDeviceDescriptorClass_softClass_0;
  if (!getBKDeviceDescriptorClass_softClass_0)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __getBKDeviceDescriptorClass_block_invoke_0;
    v24 = &unk_1EA27FEE8;
    v25 = &v26;
    __getBKDeviceDescriptorClass_block_invoke_0((uint64_t)&v21);
    v10 = (void *)v27[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v11, "deviceDescriptorForType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v9, "deviceWithDescriptor:error:", v12, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v19;

  v7->_deviceType = a3;
  if (!v14)
  {
    objc_msgSend(v13, "identitiesWithError:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v15 = 0;
    if (v17)
      goto LABEL_10;
LABEL_9:
    v15 = v7;
    goto LABEL_10;
  }

  v15 = 0;
LABEL_10:

  return v15;
}

- (void)sendSuccessfulEnrollEvent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getBMStreamsClass_softClass;
  v21 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getBMStreamsClass_block_invoke;
    v16 = &unk_1EA27FEE8;
    v17 = &v18;
    __getBMStreamsClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v4, "discoverabilitySignal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v7 = (void *)getBMDiscoverabilitySignalEventClass_softClass;
  v21 = getBMDiscoverabilitySignalEventClass_softClass;
  if (!getBMDiscoverabilitySignalEventClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getBMDiscoverabilitySignalEventClass_block_invoke;
    v16 = &unk_1EA27FEE8;
    v17 = &v18;
    __getBMDiscoverabilitySignalEventClass_block_invoke((uint64_t)&v13);
    v7 = (void *)v19[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v18, 8);
  v9 = [v8 alloc];
  -[BioStreamsEventHelper containerIdentifier](self, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BioStreamsEventHelper subtype](self, "subtype");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:bundleID:context:", CFSTR("com.apple.biometrickitui.enrollment.success"), v10, v11);

  objc_msgSend(v6, "sendEvent:", v12);
}

- (id)containerIdentifier
{
  if (-[BioStreamsEventHelper inBuddy](self, "inBuddy"))
    return CFSTR("com.apple.setupassistant");
  else
    return CFSTR("com.apple.Preferences");
}

- (id)subtype
{
  if (-[BioStreamsEventHelper deviceType](self, "deviceType") == 1)
    return CFSTR("TouchID");
  else
    return CFSTR("FaceID");
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

@end
