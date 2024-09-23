@implementation ABLog2

void ___ABLog2_block_invoke(uint64_t a1)
{
  const char *v2;
  __asl_object_s *v3;
  __asl_object_s *v4;

  v2 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llx"), *(_QWORD *)(a1 + 40)), "UTF8String");
  v3 = asl_new(0);
  if (v3)
  {
    v4 = v3;
    asl_set(v3, "ThreadID", v2);
    asl_set(v4, "Level", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56)), "stringValue"), "UTF8String"));
    asl_set(v4, "Function", *(const char **)(a1 + 48));
    asl_set(v4, "Line", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60)), "stringValue"), "UTF8String"));
    asl_set(v4, "Message", (const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"));
    asl_set(v4, "Category", "Debug");
    asl_set(v4, "Facility", (const char *)objc_msgSend(CFSTR("com.apple.AddressBookLegacy"), "UTF8String"));
    asl_send((asl_object_t)__ABLogAslClient, v4);
    JUMPOUT(0x1A1ACC19CLL);
  }
  NSLog(CFSTR("Error creating new ASL message: %@"), *(_QWORD *)(a1 + 32));
}

@end
