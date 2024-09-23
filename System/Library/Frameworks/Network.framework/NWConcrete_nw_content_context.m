@implementation NWConcrete_nw_content_context

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  objc_storeStrong((id *)self + 7, 0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_content_context;
  -[NWConcrete_nw_content_context dealloc](&v2, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)(id)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("<nw_content_context %s priority %f expiration %llu>"), (char *)self + 24, *((_QWORD *)self + 10), *((_QWORD *)self + 8));
}

- (id).cxx_construct
{
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end
