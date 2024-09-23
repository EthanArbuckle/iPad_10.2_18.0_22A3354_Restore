@implementation NSSetupLibXML

void ___NSSetupLibXML_block_invoke()
{
  xmlInitParser();
  __originalLoader = (uint64_t (*)(_QWORD, _QWORD, _QWORD))xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)_xmlExternalEntityLoader);
}

@end
