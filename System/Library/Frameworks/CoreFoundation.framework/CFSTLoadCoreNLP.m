@implementation CFSTLoadCoreNLP

void ____CFSTLoadCoreNLP_block_invoke()
{
  CFStringRef v0;
  CFStringRef v1;
  const __CFString *v2;
  CFIndex Length;
  CFIndex v4;
  char *v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(_QWORD);
  BOOL v10;
  char v32;

  v0 = CFStringCreateWithCString(0, "", 0x8000100u);
  if (!v0)
    return;
  v1 = v0;
  v2 = CFStringCreateWithFormat(0, 0, CFSTR("%@/%s"), v0, "System/Library/PrivateFrameworks/CoreNLP.framework/CoreNLP");
  CFRelease(v1);
  if (!v2)
    return;
  Length = CFStringGetLength(v2);
  v4 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v5 = (char *)malloc_type_malloc(v4, 0xF47C6EDAuLL);
  if (!v5)
  {
LABEL_79:
    CFRelease(v2);
    return;
  }
  v6 = v5;
  if (!CFStringGetCString(v2, v5, v4, 0x8000100u))
  {
    free(v6);
    goto LABEL_79;
  }
  CFRelease(v2);
  v7 = dlopen(v6, 5);
  if (v7)
  {
    v8 = v7;
    __NLStringTokenizerCopyBestStringLanguage = dlsym(v7, "NLStringTokenizerCopyBestStringLanguage");
    __NLStringTokenizerCreate = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v8, "NLStringTokenizerCreate");
    __NLStringTokenizerSetString = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym(v8, "NLStringTokenizerSetString");
    __NLStringTokenizerGoToTokenAtIndex = (uint64_t (*)(_QWORD, _QWORD))dlsym(v8, "NLStringTokenizerGoToTokenAtIndex");
    __NLStringTokenizerAdvanceToNextToken = (uint64_t (*)(_QWORD))dlsym(v8, "NLStringTokenizerAdvanceToNextToken");
    __NLStringTokenizerGetCurrentTokenRange = (uint64_t (*)(_QWORD))dlsym(v8, "NLStringTokenizerGetCurrentTokenRange");
    __NLStringTokenizerCopyCurrentTokenAttribute = (uint64_t (*)(_QWORD, _QWORD))dlsym(v8, "NLStringTokenizerCopyCurrentTokenAttribute");
    __NLStringTokenizerGetCurrentSubTokens = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym(v8, "NLStringTokenizerGetCurrentSubTokens");
    __NLStringTokenizerCopyBestStringLanguageWithHints = dlsym(v8, "NLStringTokenizerCopyBestStringLanguageWithHints");
    ___NLStringTokenizerCopyPossibleStringLanguages = dlsym(v8, "_NLStringTokenizerCopyPossibleStringLanguages");
    ___NLStringTokenizerTokenize = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerTokenize");
    ___NLStringTokenizerTokenizeWithTranscriptions = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerTokenizeWithTranscriptions");
    ___NLStringTokenizerTokenizeCompoundWord = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerTokenizeCompoundWord");
    ___NLStringTokenizerGetDerivedTokens = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerGetDerivedTokens");
    ___NLStringTokenizerGetNextBestTokens = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerGetNextBestTokens");
    ___NLStringTokenizerCreateNamePartsArrayWithString = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerCreateNamePartsArrayWithString");
    ___NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName");
    ___NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName");
    ___NLStringTokenizerGetCurrentTokenPartOfSpeech = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerGetCurrentTokenPartOfSpeech");
    ___NLStringTokenizerSetLocale = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerSetLocale");
    ___NLStringTokenizerSetTokenizerAttribute = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerSetTokenizerAttribute");
    ___NLStringTokenizerGetTokenizerAttribute = (uint64_t (*)(_QWORD))dlsym(v8, "_NLStringTokenizerGetTokenizerAttribute");
    v9 = (uint64_t (*)(_QWORD))dlsym(v8, "NLStringTokenizerSetStringWithOptions");
    __NLStringTokenizerSetStringWithOptions = v9;
    if (__NLStringTokenizerCopyBestStringLanguage)
      v10 = __NLStringTokenizerCreate == 0;
    else
      v10 = 1;
    v32 = !v10
       && __NLStringTokenizerSetString != 0
       && __NLStringTokenizerGoToTokenAtIndex != 0
       && __NLStringTokenizerAdvanceToNextToken != 0
       && __NLStringTokenizerGetCurrentTokenRange != 0
       && __NLStringTokenizerCopyCurrentTokenAttribute != 0
       && __NLStringTokenizerGetCurrentSubTokens != 0
       && __NLStringTokenizerCopyBestStringLanguageWithHints != 0
       && ___NLStringTokenizerCopyPossibleStringLanguages != 0
       && ___NLStringTokenizerTokenize != 0
       && ___NLStringTokenizerTokenizeWithTranscriptions != 0
       && ___NLStringTokenizerTokenizeCompoundWord != 0
       && ___NLStringTokenizerGetDerivedTokens != 0
       && ___NLStringTokenizerGetNextBestTokens != 0
       && ___NLStringTokenizerCreateNamePartsArrayWithString != 0
       && ___NLStringTokenizerCreateNamePartsArrayWithStringAsCompositeName != 0
       && ___NLStringTokenizerCreatePossibleNamePartsArrayWithStringAsCompositeName != 0
       && ___NLStringTokenizerGetCurrentTokenPartOfSpeech != 0
       && ___NLStringTokenizerSetLocale != 0
       && ___NLStringTokenizerSetTokenizerAttribute != 0
       && ___NLStringTokenizerGetTokenizerAttribute != 0
       && v9 != 0;
    __CFSTLoadCoreNLP_isCoreNLPAvailable = v32;
  }
  free(v6);
}

@end
