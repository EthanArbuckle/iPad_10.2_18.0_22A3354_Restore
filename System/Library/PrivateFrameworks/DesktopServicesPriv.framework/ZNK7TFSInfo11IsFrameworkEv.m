@implementation ZNK7TFSInfo11IsFrameworkEv

TString *___ZNK7TFSInfo11IsFrameworkEv_block_invoke()
{
  TString *v0;
  TString *result;

  v0 = (TString *)operator new();
  result = TString::TString(v0, ".framework");
  TFSInfo::IsFramework(void)const::kFrameworkExtension = (uint64_t)v0;
  return result;
}

@end
