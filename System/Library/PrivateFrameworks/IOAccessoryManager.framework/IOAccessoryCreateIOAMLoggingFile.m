@implementation IOAccessoryCreateIOAMLoggingFile

uint64_t __IOAccessoryCreateIOAMLoggingFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), "stringByAppendingPathComponent:", a2), 0);
  v5 = *MEMORY[0x1E0CB2A38];
  v6 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2A38]);
  return objc_msgSend(v6, "compare:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/com.apple.ioam/ioam_logs/"), "stringByAppendingPathComponent:", a3), 0), "objectForKey:", v5));
}

@end
