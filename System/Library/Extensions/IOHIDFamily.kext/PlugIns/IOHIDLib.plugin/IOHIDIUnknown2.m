@implementation IOHIDIUnknown2

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  return -2147483644;
}

- (IOHIDIUnknown2)init
{
  IOHIDIUnknown2 *v2;
  IUnknownVTbl *v3;
  IOHIDIUnknown2 *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOHIDIUnknown2;
  v2 = -[IOHIDIUnknown2 init](&v6, sel_init);
  if (v2)
  {
    v3 = (IUnknownVTbl *)malloc_type_malloc(0x20uLL, 0x8004018A671A6uLL);
    v2->_vtbl = v3;
    v3->_reserved = v2;
    v3->QueryInterface = (HRESULT (__cdecl *)(void *, REFIID, LPVOID *))sub_2310D5584;
    v3->AddRef = (ULONG (__cdecl *)(void *))sub_2310D559C;
    v3->Release = (ULONG (__cdecl *)(void *))sub_2310D55DC;
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_vtbl);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDIUnknown2;
  -[IOHIDIUnknown2 dealloc](&v3, sel_dealloc);
}

@end
