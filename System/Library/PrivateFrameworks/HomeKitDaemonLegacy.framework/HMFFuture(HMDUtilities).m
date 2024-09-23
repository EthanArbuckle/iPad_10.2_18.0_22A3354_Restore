@implementation HMFFuture(HMDUtilities)

- (id)naFuture
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__HMFFuture_HMDUtilities__naFuture__block_invoke;
  v11[3] = &unk_1E89ABD88;
  v12 = v2;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __35__HMFFuture_HMDUtilities__naFuture__block_invoke_2;
  v9[3] = &unk_1E89BEB28;
  v4 = v12;
  v10 = v4;
  v5 = (id)objc_msgSend(a1, "then:orRecover:", v11, v9);
  v6 = v10;
  v7 = v4;

  return v7;
}

@end
