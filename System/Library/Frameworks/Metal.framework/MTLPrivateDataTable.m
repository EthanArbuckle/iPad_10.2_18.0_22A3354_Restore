@implementation MTLPrivateDataTable

- (MTLPrivateDataTable)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLPrivateDataTable;
  return -[MTLPrivateDataTable init](&v3, sel_init);
}

- (BOOL)getPrivateDataAndOffset:(id)a3 privateData:(id *)a4 privateDataOffset:(unint64_t *)a5
{
  *a4 = (id)objc_msgSend(a3, "newBufferWithLength:options:", 8, 0);
  *a5 = 0;
  return *a4 != 0;
}

- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4
{

  *a3 = 0;
}

- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5
{
  uint64_t v7;

  if (a5)
  {
    v7 = objc_msgSend(a3, "contents");
    *(_QWORD *)(v7 + a4) = objc_msgSend(*((id *)a5 + 3), "gpuAddress");
  }
}

@end
