@implementation MRAVRoomOutputDevice

- (MRAVRoomOutputDevice)initWithOutputDevice:(id)a3 memberOutputDevices:(id)a4
{
  id v8;
  id v9;
  MRAVRoomOutputDevice *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *uid;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *label;
  void *v23;
  void *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MRAVRoomOutputDevice;
  v10 = -[MRAVRoomOutputDevice init](&v25, sel_init);
  if (v10)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MRAVRoomOutputDevice.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDevice"));

    }
    if (!objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MRAVRoomOutputDevice.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("roomMemberOutputDevices.count > 0"));

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v10->_concreteOutputDevice, a3);
    objc_storeStrong((id *)&v10->_outputDevice, a3);
    objc_storeStrong((id *)&v10->_roomMemberOutputDevices, a4);
    v11 = (void *)objc_opt_class();
    -[MRAVRoomOutputDevice primaryID](v10, "primaryID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoomOutputDevice roomID](v10, "roomID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "calculateOutputDeviceIDFromOutputDeviceID:withRoomID:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    uid = v10->_uid;
    v10->_uid = (NSString *)v14;

    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MRAVOutputDevice debugName](v10->_outputDevice, "debugName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoomOutputDevice roomID](v10, "roomID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoomOutputDevice roomName](v10, "roomName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithFormat:", CFSTR("<outputDevice=%@, room=%@:%@>"), v17, v18, v19);
    label = v10->_label;
    v10->_label = (NSString *)v20;

  }
  return v10;
}

+ (id)calculateOutputDeviceIDFromOutputDeviceID:(id)a3 withRoomID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@/%@"), v7, v6);

  return v8;
}

- (MRAVOutputDevice)roomMemberOutputDevice
{
  return (MRAVOutputDevice *)-[NSArray firstObject](self->_roomMemberOutputDevices, "firstObject");
}

- (id)debugName
{
  return self->_label;
}

- (id)uid
{
  return self->_uid;
}

- (id)parentUID
{
  void *v2;
  void *v3;

  -[MRAVRoomOutputDevice outputDevice](self, "outputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryID
{
  void *v2;
  void *v3;

  -[MRAVRoomOutputDevice outputDevice](self, "outputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containsUID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[MRAVRoomOutputDevice uid](self, "uid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[MRAVRoomOutputDevice clusterComposition](self, "clusterComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__MRAVRoomOutputDevice_containsUID___block_invoke;
    v9[3] = &unk_1E30C5BF0;
    v10 = v4;
    v6 = objc_msgSend(v7, "mr_any:", v9);

  }
  return v6;
}

uint64_t __36__MRAVRoomOutputDevice_containsUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)modelID
{
  void *v2;
  void *v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)deviceType
{
  void *v2;
  unsigned int v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType");

  return v3;
}

- (unsigned)deviceSubtype
{
  return 15;
}

- (BOOL)isPickable
{
  return 0;
}

- (unsigned)clusterType
{
  return 3;
}

- (id)roomID
{
  void *v2;
  void *v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roomID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)roomName
{
  void *v2;
  void *v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roomName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clusterComposition
{
  MRAVRoomOutputDevice *v2;
  NSArray *clusterComposition;
  uint64_t v4;
  NSArray *v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  clusterComposition = v2->_clusterComposition;
  if (!clusterComposition)
  {
    -[NSArray msv_map:](v2->_roomMemberOutputDevices, "msv_map:", &__block_literal_global_77);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_clusterComposition;
    v2->_clusterComposition = (NSArray *)v4;

    clusterComposition = v2->_clusterComposition;
  }
  v6 = (void *)-[NSArray copy](clusterComposition, "copy");
  objc_sync_exit(v2);

  return v6;
}

MRAVOutputDeviceDescription *__42__MRAVRoomOutputDevice_clusterComposition__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVOutputDeviceDescription *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  MRAVOutputDeviceDescription *v9;

  v2 = a2;
  v3 = [MRAVOutputDeviceDescription alloc];
  v4 = objc_msgSend(v2, "deviceType");
  v5 = objc_msgSend(v2, "deviceSubtype");
  objc_msgSend(v2, "uid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MRAVOutputDeviceDescription initWithDeviceType:deviceSubtype:uid:name:modelID:](v3, "initWithDeviceType:deviceSubtype:uid:name:modelID:", v4, v5, v6, v7, v8);
  return v9;
}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (BOOL)isVolumeMuted
{
  void *v2;
  char v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVolumeMuted");

  return v3;
}

- (unsigned)volumeCapabilities
{
  void *v2;
  unsigned int v3;

  -[MRAVRoomOutputDevice roomMemberOutputDevice](self, "roomMemberOutputDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "volumeCapabilities");

  return v3;
}

- (void)adjustVolume:(int64_t)a3 details:(id)a4
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0CB37A0];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend(v8, "requestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("MRAVRoomOutputDevice.adjustVolume"), v10);
  MRMediaRemoteVolumeControlAdjustmentDescription(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    MRMediaRemoteVolumeControlAdjustmentDescription(a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" to %@"), v13);

  }
  -[MRAVRoomOutputDevice debugName](self, "debugName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MRAVRoomOutputDevice debugName](self, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" for %@"), v15);

  }
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (!self->_concreteOutputDevice)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVRoomOutputDevice.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_concreteOutputDevice"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVRoomOutputDevice.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

}

- (void)setVolumeMuted:(BOOL)a3 details:(id)a4
{
  _BOOL8 v4;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0CB37A0];
  v8 = a4;
  v9 = [v7 alloc];
  objc_msgSend(v8, "requestID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@<%@>"), CFSTR("MRAVRoomOutputDevice.muteVolume"), v10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" to %@"), v13);

  }
  -[MRAVRoomOutputDevice debugName](self, "debugName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MRAVRoomOutputDevice debugName](self, "debugName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" for %@"), v15);

  }
  _MRLogForCategory(0xAuLL);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (!self->_concreteOutputDevice)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVRoomOutputDevice.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_concreteOutputDevice"));

  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVRoomOutputDevice.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (MRAVConcreteOutputDevice)concreteOutputDevice
{
  return self->_concreteOutputDevice;
}

- (NSArray)roomMemberOutputDevices
{
  return self->_roomMemberOutputDevices;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_roomMemberOutputDevices, 0);
  objc_storeStrong((id *)&self->_concreteOutputDevice, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_clusterComposition, 0);
}

@end
