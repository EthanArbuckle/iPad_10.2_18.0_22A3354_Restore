@implementation WFMakeImageFromPDFPageAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFMakeImageFromPDFPageAction;
  -[WFMakeImageFromPDFPageAction initializeParameters](&v4, sel_initializeParameters);
  -[WFMakeImageFromPDFPageAction parameterForKey:](self, "parameterForKey:", CFSTR("WFMakeImageFromPDFPageColorspace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (id)parameterSummary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC3A50]);
  WFLocalizedStringResourceWithKey(CFSTR("Make ${WFMakeImageFromPDFPageImageFormat} from ${WFInput}"), CFSTR("Make ${WFMakeImageFromPDFPageImageFormat} from ${WFInput}"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (id)selectedFileType
{
  void *v2;
  void *v3;

  -[WFMakeImageFromPDFPageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeImageFromPDFPageImageFormat"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGColorSpace)selectedColorspace
{
  void *v2;
  const __CFString **v3;
  const __CFString *v4;
  CGColorSpace *v5;

  -[WFMakeImageFromPDFPageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeImageFromPDFPageColorspace"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("RGB")))
  {
    v3 = (const __CFString **)MEMORY[0x24BDBF318];
LABEL_5:
    v4 = *v3;
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("CMYK")))
  {
    v3 = (const __CFString **)MEMORY[0x24BDBF280];
    goto LABEL_5;
  }
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("Gray")))
    v4 = (const __CFString *)*MEMORY[0x24BDBF290];
  else
    v4 = 0;
LABEL_9:
  v5 = CGColorSpaceCreateWithName(v4);

  return v5;
}

- (double)selectedResolution
{
  void *v2;
  float v3;
  double v4;

  -[WFMakeImageFromPDFPageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeImageFromPDFPageResolution"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  uint64_t v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_24F8B6C20;
    v11 = *(_QWORD *)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_3;
    v9[3] = &unk_24F8BB6B0;
    v9[4] = v11;
    objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v10, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a2;
  v7 = a4;
  v10 = v6;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedFileType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "selectedColorspace");
    objc_msgSend(*(id *)(a1 + 32), "selectedResolution");
    objc_msgSend(v10, "createImageWithFileType:colorspace:resolution:completion:", v8, v9, v7);

  }
  else
  {

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __59__WFMakeImageFromPDFPageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v18 = a3;
  obj = v5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
              objc_msgSend(*(id *)(a1 + 32), "output");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addFile:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v18);

}

@end
