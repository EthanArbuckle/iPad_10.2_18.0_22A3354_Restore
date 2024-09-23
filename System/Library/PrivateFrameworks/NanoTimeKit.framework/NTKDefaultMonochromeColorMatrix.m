@implementation NTKDefaultMonochromeColorMatrix

void __NTKDefaultMonochromeColorMatrix_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v2[0] = 0;
  v2[1] = 0;
  v3 = 1056964608;
  v5 = 0;
  v4 = 0;
  v6 = 1056964608;
  v7 = 0;
  v8 = 0;
  v9 = 1056964608;
  v10 = 0;
  v11 = 0;
  v12 = 1065353216;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v2, "{CAColorMatrix=ffffffffffffffffffff}");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKDefaultMonochromeColorMatrix::__matrix;
  NTKDefaultMonochromeColorMatrix::__matrix = v0;

}

@end
