@implementation WFGenerateHashAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD);
  size_t v7;
  int v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[7];

  v4 = a3;
  -[WFGenerateHashAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFHashType"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SHA1")) & 1) != 0)
  {
    v6 = MEMORY[0x24BDAC320];
    v7 = 20;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SHA256")) & 1) != 0)
  {
    v6 = MEMORY[0x24BDAC358];
    v7 = 32;
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("SHA512"));
    if (v8)
      v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x24BDAC398];
    else
      v6 = MEMORY[0x24BDAC300];
    if (v8)
      v7 = 64;
    else
      v7 = 16;
  }
  v9 = malloc_type_malloc(v7, 0xF28AFB92uLL);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &__block_descriptor_56_e62_v32__0__WFFileRepresentation_8__NSError_16___v_____NSError__24l;
  v11[4] = v6;
  v11[5] = v9;
  v11[6] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke_2;
  v10[3] = &unk_24F8B0CD8;
  v10[4] = self;
  v10[5] = v9;
  objc_msgSend(v4, "transformFileRepresentationsForType:usingBlock:completionHandler:", 0, v11, v10);

}

void __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  void (*v11)(uint64_t, uint64_t, _QWORD);
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v17, "mappedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void (*)(uint64_t, uint64_t, _QWORD))a1[4];
  v12 = objc_retainAutorelease(v9);
  v11(objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a1[5]);
  if (a1[6])
  {
    v13 = 0;
    do
      objc_msgSend(v10, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(a1[5] + v13++));
    while (a1[6] > v13);
  }
  v14 = (void *)MEMORY[0x24BE19590];
  objc_msgSend(v17, "wfName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "object:named:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v16, v7);

}

void __51__WFGenerateHashAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v7 = a3;
  v6 = a2;
  free(v5);
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
}

@end
