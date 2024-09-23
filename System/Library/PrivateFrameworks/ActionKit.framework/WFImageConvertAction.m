@implementation WFImageConvertAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (id)typeFromImageFormatString:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JPEG")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("JPEG-2000")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF8438];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PNG")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF84F8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIFF")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF85D0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GIF")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF83D8];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BMP")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF82E0];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDF")) & 1) != 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BDF84E0];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("HEIF")))
    {
      v5 = 0;
      goto LABEL_5;
    }
    v4 = (_QWORD *)MEMORY[0x24BDF83E8];
  }
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v5;
}

- (id)imageQualityWithQuality:(id)a3 imageFormat:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (objc_msgSend(a4, "conformsToUTType:", *MEMORY[0x24BDF8438]))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (BOOL)preserveMetadataWithPreserveMetadata:(BOOL)a3 imageFormat:(id)a4
{
  int v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "conformsToUTType:", *MEMORY[0x24BDF8438]) & 1) == 0
    && (objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF84F8]) & 1) == 0
    && (objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF85D0]) & 1) == 0)
  {
    v4 &= objc_msgSend(v6, "conformsToUTType:", *MEMORY[0x24BDF83E8]);
  }

  return v4;
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
  v6[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageFormat"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageCompressionQuality"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImagePreserveMetadata"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "typeFromImageFormatString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "imageQualityWithQuality:imageFormat:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(*(id *)(a1 + 32), "preserveMetadataWithPreserveMetadata:imageFormat:", v11, v12);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_2;
    v18[3] = &unk_24F8B3598;
    v21 = v14;
    v19 = v12;
    v20 = v13;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_3;
    v17[3] = &unk_24F8BAFA8;
    v17[4] = *(_QWORD *)(a1 + 32);
    v15 = v13;
    v16 = v12;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v18, v17);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, id, _QWORD);
  id v8;

  v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  objc_msgSend(a2, "generateImageFileForType:includingMetadata:compressionQuality:error:", v5, v4, v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, 0);

}

void __51__WFImageConvertAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
