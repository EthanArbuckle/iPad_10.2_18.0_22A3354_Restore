@implementation FEPerformDelayed

void ___FEPerformDelayed_block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_256BAFC98;
  v8 = qword_256BAFC98;
  if (!qword_256BAFC98)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getUIApplicationClass_block_invoke;
    v4[3] = &unk_250D3A058;
    v4[4] = &v5;
    __getUIApplicationClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "sharedApplication");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_256BAFC80;
  qword_256BAFC80 = v2;

}

void ___FEPerformDelayed_block_invoke_0()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_256BAFCE0;
  v8 = qword_256BAFCE0;
  if (!qword_256BAFCE0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getUIApplicationClass_block_invoke_0;
    v4[3] = &unk_250D3A058;
    v4[4] = &v5;
    __getUIApplicationClass_block_invoke_0((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "sharedApplication");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = v2;

}

@end
