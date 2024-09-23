@implementation GetSearchFoundationFrameworkInfo

void ___GetSearchFoundationFrameworkInfo_block_invoke()
{
  const __CFURL *v0;
  const __CFURL *v1;
  __CFBundle *v2;
  Class Class;
  objc_class *v4;
  objc_class *ClassPair;
  void (*v6)(void);
  void (*v7)(void);
  void (*v8)(void);
  void (*v9)(void);
  objc_class *v10;
  void (*v11)(void);
  void (*v12)(void);
  void (*v13)(void);
  _QWORD *v14;
  _QWORD block[5];

  v0 = CFURLCreateWithFileSystemPath(0, CFSTR("/System/Library/PrivateFrameworks/SearchFoundation.framework"), kCFURLPOSIXPathStyle, 1u);
  if (v0)
  {
    v1 = v0;
    v2 = CFBundleCreate(0, v0);
    CFRelease(v1);
    if (v2)
    {
      if (!CFBundleIsExecutableLoaded(v2))
        CFBundleLoadExecutable(v2);
      if (CFBundleIsExecutableLoaded(v2))
      {
        _GetSearchFoundationFrameworkInfo__InfoPtr = (uint64_t)malloc_type_calloc(1uLL, 0x30uLL, 0x800407D3415B1uLL);
        *(_QWORD *)_GetSearchFoundationFrameworkInfo__InfoPtr = objc_getClass("SFSearchResult");
        *(_QWORD *)(_GetSearchFoundationFrameworkInfo__InfoPtr + 8) = objc_getClass("SFFormattedText");
        *(_QWORD *)(_GetSearchFoundationFrameworkInfo__InfoPtr + 16) = objc_getClass("SFRichText");
        *(_QWORD *)(_GetSearchFoundationFrameworkInfo__InfoPtr + 24) = objc_getClass("SFText");
        Class = objc_getClass("SFWebCardSection");
        *(_QWORD *)(_GetSearchFoundationFrameworkInfo__InfoPtr + 40) = Class;
        v4 = objc_getClass("SFCard");
        ClassPair = objc_allocateClassPair(v4, "DCSDictionaryCard", 0);
        if (class_addIvar(ClassPair, "_dictionaryID", 8uLL, 3u, "@")
          && class_addIvar(ClassPair, "_searchString", 8uLL, 3u, "@"))
        {
          objc_registerClassPair(ClassPair);
          v6 = imp_implementationWithBlock(&__block_literal_global_62);
          class_addMethod(ClassPair, sel_setDictionaryID_, v6, "v@:@");
          v7 = imp_implementationWithBlock(&__block_literal_global_64);
          class_addMethod(ClassPair, sel_setSearchString_, v7, "v@:@");
          v8 = imp_implementationWithBlock(&__block_literal_global_66);
          class_addMethod(ClassPair, sel_dealloc, v8, "v@:");
          v9 = imp_implementationWithBlock(&__block_literal_global_71);
          v10 = object_getClass(ClassPair);
          class_addMethod(v10, sel_supportsSecureCoding, v9, "B@:");
          v11 = imp_implementationWithBlock(&__block_literal_global_79);
          class_addMethod(ClassPair, sel_encodeWithCoder_, v11, "v@:@");
          v12 = imp_implementationWithBlock(&__block_literal_global_85);
          class_addMethod(ClassPair, sel_initWithCoder_, v12, "@@:@");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = ___CreateDCSDictionaryCardClass_block_invoke_7;
          block[3] = &unk_1E8B57810;
          block[4] = Class;
          v13 = imp_implementationWithBlock(block);
          class_addMethod(ClassPair, sel_loadCardSectionsWithCompletionHandler_, v13, "v@:@");
        }
        else if (ClassPair)
        {
          objc_disposeClassPair(ClassPair);
          ClassPair = 0;
        }
        _GetSearchFoundationFrameworkInfo__DCSDictionaryCardClass = (uint64_t)ClassPair;
        v14 = (_QWORD *)_GetSearchFoundationFrameworkInfo__InfoPtr;
        *(_QWORD *)(_GetSearchFoundationFrameworkInfo__InfoPtr + 32) = ClassPair;
        if (!*v14 || !v14[1] || !v14[2] || !ClassPair || !v14[3] || !v14[5])
        {
          free(v14);
          _GetSearchFoundationFrameworkInfo__InfoPtr = 0;
        }
      }
    }
  }
}

@end
