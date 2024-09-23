@implementation NSURL(GSAdditions)

- (void)gs_chmod:()GSAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v7, v8, 0);

}

@end
