@implementation _SFReaderCustomProtocols

+ (const)registerReaderCustomProtocols
{
  return CFSTR("safari-reader");
}

+ (void)registerReaderCustomProtocols
{
  SafariShared::TranslatedFileURLProtocol::registerProtocol();
  SafariShared::TranslatedFileURLProtocol::registerProtocol();
}

+ (OpaqueJSScript)readerUserInterfaceScriptForContext:(OpaqueJSContext *)a3
{
  unsigned __int8 v3;

  if ((v3 & 1) == 0
  {
    JSContextGetGroup(a3);
    +[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:]::userInterfaceScript = JSScriptCreateReferencingImmortalASCIIText();
  }
  return (OpaqueJSScript *)+[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:]::userInterfaceScript;
}

@end
