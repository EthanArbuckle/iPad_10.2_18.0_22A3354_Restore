@implementation IOHIDPlugin

- (int)probe:(id)a3 service:(unsigned int)a4 outScore:(int *)a5
{
  return -536870201;
}

- (int)start:(id)a3 service:(unsigned int)a4
{
  return -536870201;
}

- (int)stop
{
  return -536870201;
}

- (IOHIDPlugin)init
{
  IOHIDPlugin *v2;
  char *v3;
  IUnknownVTbl *vtbl;
  ULONG (__cdecl *Release)(void *);
  __int128 v6;
  const __CFUUID *v7;
  IOHIDPlugin *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IOHIDPlugin;
  v2 = -[IOHIDIUnknown2 init](&v10, sel_init);
  if (v2)
  {
    v3 = (char *)malloc_type_malloc(0x40uLL, 0x108004020ACED9DuLL);
    v2->_plugin = (IOCFPlugInInterfaceStruct *)v3;
    vtbl = v2->super._vtbl;
    Release = vtbl->Release;
    v6 = *(_OWORD *)&vtbl->QueryInterface;
    *(_QWORD *)v3 = v2;
    *((_QWORD *)v3 + 3) = Release;
    *((_DWORD *)v3 + 8) = 1;
    *(_OWORD *)(v3 + 8) = v6;
    *((_QWORD *)v3 + 5) = sub_2310D5780;
    *((_QWORD *)v3 + 6) = sub_2310D5798;
    *((_QWORD *)v3 + 7) = sub_2310D57AC;
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
    CFPlugInAddInstanceForFactory(v7);
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  const __CFUUID *v3;
  objc_super v4;

  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  CFPlugInRemoveInstanceForFactory(v3);
  free(self->_plugin);
  v4.receiver = self;
  v4.super_class = (Class)IOHIDPlugin;
  -[IOHIDIUnknown2 dealloc](&v4, sel_dealloc);
}

@end
