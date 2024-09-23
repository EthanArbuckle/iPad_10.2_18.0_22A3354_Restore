@implementation MIDINetworkSession

- (void)updateFromEntity
{
  uint64_t v3;
  _QWORD *imp;
  void *v5;
  id *v6;
  id *v7;
  NSArray *v8;
  CFTypeRef cf;
  CFStringRef str;

  str = 0;
  if (!MIDIObjectGetStringProperty(*(_DWORD *)self->_imp, kMIDIPropertyName, &str))
    objc_storeStrong((id *)self->_imp + 2, (id)str);
  cf = 0;
  if (!MIDIObjectGetDictionaryProperty(*(_DWORD *)self->_imp, CFSTR("apple.midirtp.session"), (CFDictionaryRef *)&cf))
  {
    v3 = objc_msgSend((id)cf, "mutableCopy");
    imp = self->_imp;
    v5 = (void *)imp[3];
    imp[3] = v3;

    CFRelease(cf);
    v6 = (id *)self->_imp;
    v7 = v6 + 4;
    objc_msgSend(v6[3], "objectForKey:", CFSTR("peers"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    ContactOrConnectionSet::UpdateFromDriver(v7, v8);

  }
}

- (void)setStateToEntity
{
  void *imp;
  const __CFString *v4;

  imp = self->_imp;
  v4 = (const __CFString *)*((_QWORD *)imp + 2);
  if (v4)
  {
    MIDIObjectSetStringProperty(*(_DWORD *)imp, kMIDIPropertyName, v4);
    imp = self->_imp;
  }
  MIDIObjectSetDictionaryProperty(*(_DWORD *)imp, CFSTR("apple.midirtp.session"), *((CFDictionaryRef *)imp + 3));
  MIDIObjectSetIntegerProperty(*(_DWORD *)self->_imp, kMIDIPropertyOffline, !-[MIDINetworkSession isEnabled](self, "isEnabled"));
}

- (void)refreshBonjourName
{
  uint64_t v3;
  __CFString *v4;
  id v5;

  -[MIDINetworkSession networkName](self, "networkName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MGCopyAnswer();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("Unknown");
  if (!v5
    || (objc_msgSend(v5, "isEqualToString:", &stru_1E98BB0B0) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    objc_msgSend(*((id *)self->_imp + 3), "setObject:forKey:", v4, CFSTR("dns-sd-name"));
    -[MIDINetworkSession setStateToEntity](self, "setStateToEntity");
  }

}

- (MIDINetworkSession)init
{
  id v2;
  uint64_t v3;
  MIDIDeviceRef v4;
  MIDIEntityRef Entity;
  MIDIEndpointRef Source;
  MIDIEntityRef *v7;
  MIDINetworkSession *v8;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  OSStatus v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MIDINetworkSession;
  v2 = -[MIDINetworkSession init](&v15, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_DWORD *)v3 = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    ContactOrConnectionSet::ContactOrConnectionSet((ContactOrConnectionSet *)(v3 + 32), 1);
    *((_QWORD *)v2 + 1) = v3;
    v4 = *(_DWORD *)(globals + 92);
    if (MIDIDeviceGetNumberOfEntities(v4))
    {
      Entity = MIDIDeviceGetEntity(v4, 0);
      **((_DWORD **)v2 + 1) = Entity;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Session %d"), &stru_1E98BB0B0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v12, 1);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v14 = MIDIDeviceNewEntity(v4, v13, kMIDIProtocol_1_0, 1u, 1uLL, 1uLL, *((MIDIEntityRef **)v2 + 1));
      if (v14)
      {
        v8 = 0;
        goto LABEL_6;
      }
      Entity = **((_DWORD **)v2 + 1);
    }
    Source = MIDIEntityGetSource(Entity, 0);
    v7 = (MIDIEntityRef *)*((_QWORD *)v2 + 1);
    v7[1] = Source;
    *(_DWORD *)(*((_QWORD *)v2 + 1) + 8) = MIDIEntityGetDestination(*v7, 0);
    objc_msgSend(v2, "updateFromEntity");
    objc_msgSend(v2, "refreshBonjourName");
  }
  v8 = (MIDINetworkSession *)v2;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  id *imp;
  objc_super v4;

  imp = (id *)self->_imp;
  if (imp)
  {

    MEMORY[0x1D826BA98](imp, 0x1080C4029CCB1DCLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)MIDINetworkSession;
  -[MIDINetworkSession dealloc](&v4, sel_dealloc);
}

- (BOOL)isEnabled
{
  uint64_t v3;
  int v4;
  void *v5;
  char v6;

  v3 = globals;
  if (globals)
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v4 = 0;
  objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", CFSTR("flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  return v6 & 1;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL4 v3;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = enabled;
  v5 = globals;
  if (globals)
    v6 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v6 = 0;
  objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", CFSTR("flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = v8 & 0xFFFFFFFE | v3;
  v10 = (void *)*((_QWORD *)self->_imp + 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("flags"));

  -[MIDINetworkSession setStateToEntity](self, "setStateToEntity");
  if (v3)
    -[MIDINetworkSession refreshBonjourName](self, "refreshBonjourName");
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
}

- (NSUInteger)networkPort
{
  uint64_t v3;
  int v4;
  void *v5;
  unsigned int v6;

  v3 = globals;
  if (globals)
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v4 = 0;
  objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", CFSTR("port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  return v6;
}

- (NSString)networkName
{
  uint64_t v3;
  int v4;
  void *v5;

  v3 = globals;
  if (globals)
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v4 = 0;
  objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", CFSTR("dns-sd-name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  return (NSString *)v5;
}

- (NSString)localName
{
  uint64_t v3;
  int v4;
  id v5;

  v3 = globals;
  if (globals)
  {
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
    v5 = *((id *)self->_imp + 2);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  }
  else
  {
    v5 = *((id *)self->_imp + 2);
  }
  return (NSString *)v5;
}

- (MIDINetworkConnectionPolicy)connectionPolicy
{
  uint64_t v3;
  int v4;
  void *v5;
  int v6;

  v3 = globals;
  if (globals)
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v4 = 0;
  objc_msgSend(*((id *)self->_imp + 3), "objectForKey:", CFSTR("join-policy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  return (uint64_t)v6;
}

- (void)setConnectionPolicy:(MIDINetworkConnectionPolicy)connectionPolicy
{
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;

  v5 = globals;
  if (globals)
    v6 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
  else
    v6 = 0;
  v7 = (void *)*((_QWORD *)self->_imp + 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", connectionPolicy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("join-policy"));

  -[MIDINetworkSession setStateToEntity](self, "setStateToEntity");
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
}

- (NSSet)connections
{
  uint64_t v3;
  int v4;
  id v5;

  v3 = globals;
  if (globals)
  {
    v4 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
    v5 = *((id *)self->_imp + 5);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  }
  else
  {
    v5 = *((id *)self->_imp + 5);
  }
  return (NSSet *)v5;
}

- (BOOL)addOrRemoveConnection:(id)a3 add:(BOOL)a4
{
  void *v5;

  ContactOrConnectionSet::AddOrRemoveItem((id *)self->_imp + 4, (objc_object *)a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*((id *)self->_imp + 3), "setObject:forKey:", v5, CFSTR("peers"));
    -[MIDINetworkSession setStateToEntity](self, "setStateToEntity");
  }

  return v5 != 0;
}

- (BOOL)addConnection:(MIDINetworkConnection *)connection
{
  MIDINetworkConnection *v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  v4 = connection;
  v5 = globals;
  if (globals)
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)globals + 16))(globals);
  else
    v6 = 0;
  v7 = -[MIDINetworkSession addOrRemoveConnection:add:](self, "addOrRemoveConnection:add:", v4, 1);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);

  return v7;
}

- (BOOL)removeConnection:(MIDINetworkConnection *)connection
{
  MIDINetworkConnection *v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  v4 = connection;
  v5 = globals;
  if (globals)
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)globals + 16))(globals);
  else
    v6 = 0;
  v7 = -[MIDINetworkSession addOrRemoveConnection:add:](self, "addOrRemoveConnection:add:", v4, 0);
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);

  return v7;
}

- (NSSet)contacts
{
  uint64_t v2;
  int v3;
  void *v4;

  v2 = globals;
  if (globals)
  {
    v3 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)globals + 16))(globals, a2);
    v4 = *(void **)(globals + 112);
    caulk::mach::os_object<NSObject  {objcproto15OS_os_eventlink}* {__strong}>::get(v4);
    objc_claimAutoreleasedReturnValue();
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  }
  else
  {
    v4 = (void *)MEMORY[0x70];
    caulk::mach::os_object<NSObject  {objcproto15OS_os_eventlink}* {__strong}>::get(MEMORY[0x70]);
    objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v4;
}

- (BOOL)addContact:(MIDINetworkHost *)contact
{
  MIDINetworkHost *v3;
  uint64_t v4;
  int v5;
  MNSGlobalState *v6;
  BOOL v7;

  v3 = contact;
  v4 = globals;
  if (globals)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)globals + 16))(globals);
    v6 = (MNSGlobalState *)globals;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = MNSGlobalState::AddOrRemoveContact(v6, (objc_object *)v3, 1);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);

  return v7;
}

- (BOOL)removeContact:(MIDINetworkHost *)contact
{
  MIDINetworkHost *v3;
  uint64_t v4;
  int v5;
  MNSGlobalState *v6;
  BOOL v7;

  v3 = contact;
  v4 = globals;
  if (globals)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)globals + 16))(globals);
    v6 = (MNSGlobalState *)globals;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = MNSGlobalState::AddOrRemoveContact(v6, (objc_object *)v3, 0);
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);

  return v7;
}

- (void)sessionChanged
{
  id v3;

  -[MIDINetworkSession updateFromEntity](self, "updateFromEntity");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MIDINetworkNotificationSessionDidChange"), self);

}

- (void)contactsChanged
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MIDINetworkNotificationContactsDidChange"), self);

}

- (MIDIEndpointRef)sourceEndpoint
{
  return *((_DWORD *)self->_imp + 1);
}

- (MIDIEndpointRef)destinationEndpoint
{
  return *((_DWORD *)self->_imp + 2);
}

+ (MIDINetworkSession)defaultSession
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void *v6;
  MIDINetworkSession *v7;
  void *v8;
  char v10;
  char **v11;
  char *v12;

  v2 = atomic_load(&+[MIDINetworkSession defaultSession]::once);
  if (v2 != -1)
  {
    v12 = &v10;
    v11 = &v12;
    std::__call_once(&+[MIDINetworkSession defaultSession]::once, &v11, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<+[MIDINetworkSession defaultSession]::$_0 &&>>);
  }
  v3 = globals;
  if (globals)
  {
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)globals + 16))(globals);
    v5 = (_QWORD *)globals;
    if (globals)
    {
      v6 = *(void **)(globals + 96);
      if (!v6)
      {
        v7 = objc_alloc_init(MIDINetworkSession);
        v8 = (void *)v5[12];
        v5[12] = v7;

        v6 = (void *)v5[12];
      }
      v5 = v6;
    }
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
  }
  else
  {
    v5 = 0;
  }
  return (MIDINetworkSession *)v5;
}

@end
