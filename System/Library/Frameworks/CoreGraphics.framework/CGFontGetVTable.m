@implementation CGFontGetVTable

void __CGFontGetVTable_block_invoke()
{
  BOOL v0;
  char *library;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  CFStringRef string;
  char buffer[1025];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  string = 0;
  if (copy_string_property("CGFontLibrary", (const void *(*)(const char *))copy_local_domain_value, &string))v0 = string == 0;
  else
    v0 = 1;
  if (!v0)
  {
    verbose = 1;
    if (CFStringGetFileSystemRepresentation(string, buffer, 1025))
    {
      library = load_library((uint64_t)buffer);
      CFRelease(string);
      if (library)
        goto LABEL_10;
    }
    else
    {
      CFRelease(string);
    }
  }
  library = load_library((uint64_t)"CGXType");
  if (library)
  {
LABEL_10:
    CGFontGetVTable_vtable = ((uint64_t (*)(void))library)();
    if (CGFontGetVTable_vtable)
      return;
  }
  CGPostError((uint64_t)"No available font implementation.", v2, v3, v4, v5, v6, v7, v8, v9);
}

@end
