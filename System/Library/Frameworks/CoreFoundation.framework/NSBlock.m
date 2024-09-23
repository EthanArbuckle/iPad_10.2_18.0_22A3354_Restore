@implementation NSBlock

- (void)invoke
{
  ((void (*)(void))self[2].super.isa)();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)alloc
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)performAfterDelay:(double)a3
{
  double v4;
  int64_t v5;
  dispatch_time_t v6;
  qos_class_t v7;
  NSObject *global_queue;

  v4 = a3 * 1000.0 * 1000.0 * 1000.0;
  if ((unint64_t)v4 <= 2)
    v5 = 2;
  else
    v5 = (unint64_t)v4;
  v6 = dispatch_time(0, v5);
  v7 = qos_class_self();
  global_queue = dispatch_get_global_queue(v7, 0);
  dispatch_after(v6, global_queue, self);
}

- (id)debugDescription
{
  const char *v3;
  const void *v4;
  const void *v5;
  Class isa;
  Class v7;
  __CFString *Mutable;
  objc_class *v9;
  const char *Name;
  const char *v11;
  const char *dli_fname;
  const char *dli_sname;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  Dl_info v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (((uint64_t)self[1].super.isa & 0x2000000) != 0)
  {
    isa = self[3].super.isa;
    v3 = _Block_signature(self);
    v4 = (const void *)*((_QWORD *)isa + 2);
    v5 = (const void *)*((_QWORD *)isa + 3);
  }
  else
  {
    v3 = _Block_signature(self);
    v4 = 0;
    v5 = 0;
  }
  v7 = self[2].super.isa;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v9 = (objc_class *)objc_opt_class();
  Name = class_getName(v9);
  v11 = "<unknown signature>";
  if (v3)
    v11 = v3;
  CFStringAppendFormat(Mutable, 0, CFSTR("<%s: %p>\n signature: \"%s\"), Name, self, v11);
  memset(&v19, 0, sizeof(v19));
  if (v7 && dladdr(v7, &v19))
  {
    dli_fname = "<unknown invoke library>";
    if (v19.dli_fname)
      dli_fname = v19.dli_fname;
    dli_sname = "<unknown invoke symbol>";
    if (v19.dli_sname)
      dli_sname = v19.dli_sname;
  }
  if (v4 && dladdr(v4, &v19))
  {
    v14 = "<unknown copy library>";
    if (v19.dli_fname)
      v14 = v19.dli_fname;
    v15 = "<unknown copy symbol>";
    if (v19.dli_sname)
      v15 = v19.dli_sname;
  }
  if (v5 && dladdr(v5, &v19))
  {
    v16 = "<unknown dispose library>";
    if (v19.dli_fname)
      v16 = v19.dli_fname;
    v17 = "<unknown dispose symbol>";
    if (v19.dli_sname)
      v17 = v19.dli_sname;
  }
  return Mutable;
}

@end
