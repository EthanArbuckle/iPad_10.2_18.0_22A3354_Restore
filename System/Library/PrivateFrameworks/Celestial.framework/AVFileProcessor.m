@implementation AVFileProcessor

+ (id)fileProcessor
{
  return objc_alloc_init(AVFileProcessor);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFileProcessor;
  -[AVFileProcessor dealloc](&v3, sel_dealloc);
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4
{
  return -[AVFileProcessor processPurchasedItem:withAttributes:resultInfo:progressBlock:](self, "processPurchasedItem:withAttributes:resultInfo:progressBlock:", a3, a4, 0, 0);
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 progressBlock:(id)a5
{
  return -[AVFileProcessor processPurchasedItem:withAttributes:resultInfo:progressBlock:](self, "processPurchasedItem:withAttributes:resultInfo:progressBlock:", a3, a4, 0, a5);
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5
{
  return -[AVFileProcessor processPurchasedItem:withAttributes:resultInfo:progressBlock:](self, "processPurchasedItem:withAttributes:resultInfo:progressBlock:", a3, a4, a5, 0);
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5 progressBlock:(id)a6
{
  void *v7;
  int v8;
  void *v9;

  self->_percentComplete = 0.0;
  v7 = (void *)objc_msgSend(a6, "copy");

  self->_progressBlock = v7;
  v8 = PostProcessPurchasedItem();
  if (v8)
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
  else
    v9 = 0;

  return v9;
}

- (id)rentalInfo:(id)a3
{
  PostProcessGetRentalInfo();
  return 0;
}

- (id)sinfsFromFilePath:(id)a3
{
  ObtainCFDataSinfsFromMedia();
  return 0;
}

- (id)sinfInfoFromFilePath:(id)a3
{
  ObtainSinfInfoFromMedia();
  return 0;
}

@end
