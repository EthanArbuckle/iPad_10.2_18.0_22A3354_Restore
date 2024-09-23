@implementation ATXSuggestionLayout(StackLayoutSize)

+ (id)uiLayoutTypesForStackLayoutSize:()StackLayoutSize
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x1CAA48B6C]();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E83CDFA8, &unk_1E83CDFC0, &unk_1E83CDFD8, 0, v9, v10, v11, v12, v13);
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x1CAA48B6C]();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E83CDFD8, &unk_1E83CDFF0, &unk_1E83CE008, &unk_1E83CE020, &unk_1E83CE038, &unk_1E83CE050, &unk_1E83CE068, &unk_1E83CE080, 0);
      goto LABEL_7;
    case 2:
      v4 = (void *)MEMORY[0x1CAA48B6C]();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E83CE098, &unk_1E83CE0B0, 0, v8, v9, v10, v11, v12, v13);
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_opt_new();
      return v3;
    case 4:
      v4 = (void *)MEMORY[0x1CAA48B6C]();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E83CE0C8, 0, v7, v8, v9, v10, v11, v12, v13);
LABEL_7:
      v3 = (void *)v5;
      objc_autoreleasePoolPop(v4);
      break;
    default:
      return v3;
  }
  return v3;
}

@end
