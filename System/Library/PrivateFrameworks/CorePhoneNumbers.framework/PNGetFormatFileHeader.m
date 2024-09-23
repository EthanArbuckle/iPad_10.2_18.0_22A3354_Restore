@implementation PNGetFormatFileHeader

void __PNGetFormatFileHeader_block_invoke()
{
  __CFBundle *v0;
  const __CFString *v1;
  char *CStringPtr;
  CFIndex Length;
  int v4;
  int v5;
  size_t v6;
  FILE *v7;
  int *v8;
  FILE *v9;
  int *v10;
  FILE *v11;
  int *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v0 = CFPhoneNumberBundleCopyRulesetFileSystemPath();
  if (v0)
  {
    v1 = (const __CFString *)v0;
    CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)v0, 0x8000100u);
    Length = CFStringGetLength(v1);
    if (CStringPtr
      || (CStringPtr = (char *)v13 - ((Length + 16) & 0xFFFFFFFFFFFFFFF0),
          CFStringGetCString(v1, CStringPtr, Length + 1, 0x8000100u)))
    {
      v4 = open(CStringPtr, 0);
      if (v4 < 0)
      {
        v9 = (FILE *)*MEMORY[0x24BDAC8D8];
        v10 = __error();
        fprintf(v9, "Attempt to open file at %s failed with errno (%d).\n", CStringPtr, *v10);
      }
      else
      {
        v5 = v4;
        v6 = lseek(v4, 0, 2);
        if ((v6 & 0x8000000000000000) != 0)
        {
          v11 = (FILE *)*MEMORY[0x24BDAC8D8];
          v12 = __error();
          fprintf(v11, "Attempt to locate end of file at %s failed with errno (%d).\n", CStringPtr, *v12);
        }
        else
        {
          sFormatFile = (uint64_t)mmap(0, v6, 1, 2, v5, 0);
          if (sFormatFile == -1)
          {
            v7 = (FILE *)*MEMORY[0x24BDAC8D8];
            v8 = __error();
            fprintf(v7, "Attempt to memory map file at %s failed with errno (%d).\n", CStringPtr, *v8);
            sFormatFile = 0;
          }
        }
        close(v5);
      }
    }
    else
    {
      fwrite("Could not obtain ruleset file system path.\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    }
    CFRelease(v1);
  }
  else
  {
    fwrite("Could not obtain ruleset file system path.\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  }
}

@end
