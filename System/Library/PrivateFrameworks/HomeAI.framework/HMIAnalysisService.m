@implementation HMIAnalysisService

- (HMIAnalysisService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMIAnalysisService;
  return -[HMIAnalysisService init](&v3, sel_init);
}

- (id)expectedClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (int)requestAnalysisForPixelBuffer:(__CVBuffer *)a3 withProperties:(id)a4 andCompletionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(a5, MEMORY[0x24BDBD1B8], 0, a4);
  return -1;
}

- (int)requestAnalysisForAssetData:(id)a3 withProperties:(id)a4 andCompletionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, id))a5 + 2))(a5, MEMORY[0x24BDBD1B8], 0, a4);
  return -1;
}

- (BOOL)cancelRequest:(int)a3
{
  return 1;
}

@end
