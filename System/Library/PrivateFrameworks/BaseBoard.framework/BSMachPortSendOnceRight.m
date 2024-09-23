@implementation BSMachPortSendOnceRight

+ (char)_type
{
  return 2;
}

- (BSMachPortSendOnceRight)initWithPort:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  BSMachPortSendOnceRight *v7;
  void *v9;

  v3 = *(_QWORD *)&a3;
  if (a3 - 1 <= 0xFFFFFFFD && !BSMachPortIsType(a3, 1310720))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMachPortRight.m"), 444, CFSTR("you must pass in a send-once (or dead) right or NULL"));

  }
  _BSMachPortRightDescription(2u, 0, (uint64_t)CFSTR("take"), v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (BSMachPortSendOnceRight *)-[BSMachPortRight _initWithPort:type:owner:trace:](self, v3, 2, 0, v6);

  return v7;
}

- (id)initFromReceiveRight:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__BSMachPortSendOnceRight_initFromReceiveRight___block_invoke;
  v10[3] = &unk_1E1EBF3D0;
  v10[4] = &v11;
  objc_msgSend(a3, "accessPort:", v10);
  v5 = *((unsigned int *)v12 + 6);
  objc_msgSend(a3, "trace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _BSMachPortRightDescription(2u, 0, (uint64_t)CFSTR("make"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BSMachPortRight _initWithPort:type:owner:trace:](self, *((unsigned int *)v12 + 6), 2, 0, v7);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __48__BSMachPortSendOnceRight_initFromReceiveRight___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    v2 = result;
    result = BSMachCreateSendOnceRight(a2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
