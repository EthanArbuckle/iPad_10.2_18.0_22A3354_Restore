@implementation VCTailspinUtil

+ (BOOL)tailspinDumpOutput:(int)a3 reason:(id)a4
{
  uint64_t v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DE8B00];
  v6[0] = *MEMORY[0x1E0DE8B08];
  v6[1] = v4;
  v7[0] = a4;
  v7[1] = &unk_1E9EF5000;
  v6[2] = *MEMORY[0x1E0DE8B18];
  v7[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  return tailspin_dump_output_with_options_sync();
}

@end
