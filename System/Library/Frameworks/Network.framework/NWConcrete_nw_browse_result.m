@implementation NWConcrete_nw_browse_result

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)*((_QWORD *)self + 4);
  if (v3)
  {
    free(v3);
    *((_QWORD *)self + 4) = 0;
  }
  v4 = (void *)*((_QWORD *)self + 5);
  if (v4)
  {
    free(v4);
    *((_QWORD *)self + 5) = 0;
  }
  v5 = (void *)*((_QWORD *)self + 3);
  *((_QWORD *)self + 3) = 0;

  v6 = (void *)*((_QWORD *)self + 2);
  *((_QWORD *)self + 2) = 0;

  v7.receiver = self;
  v7.super_class = (Class)NWConcrete_nw_browse_result;
  -[NWConcrete_nw_browse_result dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = nw_browse_result_get_description(self, 0);
  return (NSString *)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (id)redactedDescription
{
  const __CFAllocator *v2;
  const char *description;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  description = nw_browse_result_get_description(self, 1);
  return (id)(id)CFStringCreateWithCString(v2, description, 0x8000100u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

@end
