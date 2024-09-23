@implementation WFURLEncodeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFURLEncodeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEncodeMode"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_24F8B90A8;
  v10 = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_24F8BAFA8;
  v7 = v5;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v6, v9, v8);

}

void __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _QWORD *a5)
{
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void (*v12)(_QWORD *, _QWORD, id);
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (v15)
  {
    v8 = *(void **)(a1 + 32);
    v9 = a5;
    v10 = a4;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("Decode")))
    {
      objc_msgSend(v15, "stringByRemovingPercentEncoding");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!v11)
        v11 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "removeCharactersInString:", CFSTR("?&="));
      objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v14);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    ((void (*)(_QWORD *, id, _QWORD *))v9[2])(v9, v11, v10);

  }
  else
  {
    v12 = (void (*)(_QWORD *, _QWORD, id))a5[2];
    v10 = a5;
    v11 = a4;
    v12(v10, 0, v11);
  }

}

void __48__WFURLEncodeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
