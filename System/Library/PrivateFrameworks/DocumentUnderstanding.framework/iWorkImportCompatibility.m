@implementation iWorkImportCompatibility

+ (__CFDictionary)htmlForFileData:(__CFData *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5
{
  __CFDictionary *result;
  uint64_t (*CopyHTMLForIWorkDataWithUTISymbolLoc)(__CFData *, __CFString *, __CFString *);

  if (!iWorkImportLibraryCore_frameworkLibrary)
    iWorkImportLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!iWorkImportLibraryCore_frameworkLibrary)
    return 0;
  result = (__CFDictionary *)getCopyHTMLForIWorkDataWithUTISymbolLoc();
  if (result)
  {
    CopyHTMLForIWorkDataWithUTISymbolLoc = (uint64_t (*)(__CFData *, __CFString *, __CFString *))getCopyHTMLForIWorkDataWithUTISymbolLoc();
    if (!CopyHTMLForIWorkDataWithUTISymbolLoc)
      +[iWorkImportCompatibility htmlForFileData:referringURLPrefix:uti:].cold.1();
    return (__CFDictionary *)CopyHTMLForIWorkDataWithUTISymbolLoc(a3, a4, a5);
  }
  return result;
}

+ (__CFDictionary)htmlForFileURL:(__CFURL *)a3 referringURLPrefix:(__CFString *)a4 uti:(__CFString *)a5
{
  __CFDictionary *result;
  uint64_t (*CopyHTMLForIWorkFileAtURLSymbolLoc)(__CFURL *, __CFString *, __CFString *);

  if (!iWorkImportLibraryCore_frameworkLibrary)
    iWorkImportLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!iWorkImportLibraryCore_frameworkLibrary)
    return 0;
  result = (__CFDictionary *)getCopyHTMLForIWorkFileAtURLSymbolLoc();
  if (result)
  {
    CopyHTMLForIWorkFileAtURLSymbolLoc = (uint64_t (*)(__CFURL *, __CFString *, __CFString *))getCopyHTMLForIWorkFileAtURLSymbolLoc();
    if (!CopyHTMLForIWorkFileAtURLSymbolLoc)
      +[iWorkImportCompatibility htmlForFileData:referringURLPrefix:uti:].cold.1();
    return (__CFDictionary *)CopyHTMLForIWorkFileAtURLSymbolLoc(a3, a4, a5);
  }
  return result;
}

+ (uint64_t)htmlForFileData:referringURLPrefix:uti:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[DUXPCServer init].cold.1(v0);
}

@end
