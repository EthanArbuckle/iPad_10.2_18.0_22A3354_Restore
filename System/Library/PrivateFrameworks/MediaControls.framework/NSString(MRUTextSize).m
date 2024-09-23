@implementation NSString(MRUTextSize)

- (double)mru_textSizeForFont:()MRUTextSize boundingSize:
{
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0DC1138];
  v15[0] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, a2, a3);
  v12 = v11;

  return v12;
}

@end
