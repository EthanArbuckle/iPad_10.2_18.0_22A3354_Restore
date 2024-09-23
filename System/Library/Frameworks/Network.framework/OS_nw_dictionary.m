@implementation OS_nw_dictionary

- (void)dealloc
{
  Class isa;
  Class v4;
  objc_super v5;
  _QWORD applier[5];

  isa = self[2].super.super.isa;
  if (isa)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = __nw_dictionary_dispose_block_invoke;
    applier[3] = &__block_descriptor_tmp_47794;
    applier[4] = self;
    xpc_dictionary_apply(isa, applier);
    v4 = self[2].super.super.isa;
    if (v4)
    {
      xpc_release(v4);
      self[2].super.super.isa = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)OS_nw_dictionary;
  -[OS_nw_dictionary dealloc](&v5, sel_dealloc);
}

- (id)redactedDescription
{
  CFMutableStringRef Mutable;
  __CFString *v4;
  _QWORD v6[6];
  char v7;

  if (nwlog_get_sensitive_redacted::onceToken != -1)
    dispatch_once(&nwlog_get_sensitive_redacted::onceToken, &__block_literal_global_59);
  if (nwlog_get_sensitive_redacted::sensitiveRedacted)
  {
    if (nw_dictionary_get_count((uint64_t)self))
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      v4 = Mutable;
      if (Mutable)
      {
        v7 = 1;
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __56__OS_nw_dictionary_nw_descriptions__redactedDescription__block_invoke;
        v6[3] = &__block_descriptor_48_e36_B24__0r_8__NSObject_OS_nw_object__16l;
        v6[4] = &v7;
        v6[5] = Mutable;
        nw_dictionary_apply((uint64_t)self, (uint64_t)v6);
        CFStringAppend(v4, CFSTR("}"));
      }
    }
    else
    {
      v4 = CFSTR("{}");
    }
    return v4;
  }
  else
  {
    -[OS_nw_dictionary description](self, "description");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)description
{
  CFMutableStringRef Mutable;
  __CFString *v4;
  _QWORD v6[6];
  char v7;

  if (nw_dictionary_get_count((uint64_t)self))
  {
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    v4 = Mutable;
    if (Mutable)
    {
      v7 = 1;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48__OS_nw_dictionary_nw_descriptions__description__block_invoke;
      v6[3] = &__block_descriptor_48_e36_B24__0r_8__NSObject_OS_nw_object__16l;
      v6[4] = &v7;
      v6[5] = Mutable;
      nw_dictionary_apply((uint64_t)self, (uint64_t)v6);
      CFStringAppend(v4, CFSTR("}"));
    }
  }
  else
  {
    v4 = CFSTR("{}");
  }
  return v4;
}

@end
