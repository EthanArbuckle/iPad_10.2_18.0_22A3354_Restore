@implementation WFPDFContentItem

+ (id)itemWithPrintFormatters:(id)a3 names:(id)a4
{
  id v6;
  void (__cdecl *v7)();
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = (void (__cdecl *)())getUIPrintFormatterClass_15016;
  v8 = a3;
  v7();
  v9 = (void *)objc_opt_new();
  objc_msgSend(a1, "itemWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __50__WFPDFContentItem_itemWithPrintFormatters_names___block_invoke;
  v14[3] = &unk_24C4E31A8;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v8, "if_map:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObjectRepresentations:forClass:", v12, getUIPrintFormatterClass_15016());
  return v10;
}

+ (void)getPDFFromPrintFormatters:(id)a3 nameIfKnown:(id)a4 matchingInputSize:(BOOL)a5 withMargin:(BOOL)a6 startingAtPage:(int64_t)a7 endingAtPage:(int64_t)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  BOOL v27;

  v14 = a3;
  v15 = a4;
  v16 = a9;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke;
  v20[3] = &unk_24C4E07B0;
  v26 = a5;
  v27 = a6;
  v21 = v14;
  v22 = v15;
  v24 = a7;
  v25 = a8;
  v23 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("UIPrintFormatter"), CFSTR("UIKit"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCEE0];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFImageContentItem imageTypes](WFImageContentItem, "imageTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionOrderedSet:", v6);

  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("PDFDocument"), CFSTR("PDFKit"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Documents");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("PDF"), CFSTR("PDF"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("PDFs"), CFSTR("PDFs"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d PDFs"));
}

void __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke(uint64_t a1)
{
  int v1;
  WFPageRenderer *v2;
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char isKindOfClass;
  void *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *(unsigned __int8 *)(a1 + 72);
  v2 = objc_alloc_init(WFPageRenderer);
  -[WFPageRenderer setIncludeMargin:](v2, "setIncludeMargin:", *(unsigned __int8 *)(a1 + 73));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  v5 = v1 != 0;
  if (v4)
  {
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        getUIPrintFormatterClass_15016();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WFPageRenderer renderer](v2, "renderer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFPageRenderer renderer](v2, "renderer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addPrintFormatter:startingAtPageAtIndex:", v8, objc_msgSend(v10, "numberOfPages"));

          if (*(_BYTE *)(a1 + 73))
          {
            getUIViewPrintFormatterClass_15019();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v8, "view");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 0;
              v43 = &v42;
              v44 = 0x2050000000;
              v12 = (void *)getWKWebViewClass_softClass_15022;
              v45 = getWKWebViewClass_softClass_15022;
              if (!getWKWebViewClass_softClass_15022)
              {
                v41[0] = MEMORY[0x24BDAC760];
                v41[1] = 3221225472;
                v41[2] = __getWKWebViewClass_block_invoke_15023;
                v41[3] = &unk_24C4E3118;
                v41[4] = &v42;
                __getWKWebViewClass_block_invoke_15023((uint64_t)v41);
                v12 = (void *)v43[3];
              }
              v13 = objc_retainAutorelease(v12);
              _Block_object_dispose(&v42, 8);
              isKindOfClass = objc_opt_isKindOfClass();

              v5 &= isKindOfClass ^ 1;
            }
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v4);
  }

  if ((v5 & 1) != 0)
  {
    -[WFPageRenderer renderer](v2, "renderer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfPages") > 0;

    v17 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (v16)
    {
      v19 = 0;
      do
      {
        -[WFPageRenderer sizeForPageAtIndex:](v2, "sizeForPageAtIndex:", v19);
        if (v20 >= v17)
          v17 = v20;
        if (v21 >= v18)
          v18 = v21;
        -[WFPageRenderer renderer](v2, "renderer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "numberOfPages");

        ++v19;
      }
      while (v19 < v23);
    }
    -[WFPageRenderer setMatchInputSize:](v2, "setMatchInputSize:", 1);
    -[WFPageRenderer setInputSize:](v2, "setInputSize:", v17, v18);
  }
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", *(_QWORD *)(a1 + 40), v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = *(void **)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 56) - 1;
  v28 = *(_QWORD *)(a1 + 64) - 1;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  v33[3] = &unk_24C4E2DD0;
  v34 = v25;
  v35 = v31;
  v36 = v26;
  v29 = v31;
  v30 = v25;
  -[WFPageRenderer renderToPDF:startingAtPage:endingAtPage:completionHandler:](v2, "renderToPDF:startingAtPage:endingAtPage:completionHandler:", v30, v27, v28, v33);

}

void __133__WFPDFContentItem_getPDFFromPrintFormatters_nameIfKnown_matchingInputSize_withMargin_startingAtPage_endingAtPage_completionHandler___block_invoke_2(_QWORD *a1)
{
  id v2;

  +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", a1[4], 1, a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[6] + 16))();

}

id __50__WFPDFContentItem_itemWithPrintFormatters_names___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getPDF:(id)a3 matchingInputSize:(BOOL)a4 withMargin:(BOOL)a5 startingAtPage:(int64_t)a6 endingAtPage:(int64_t)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t (*v12)(void);
  id v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a5;
  v10 = a4;
  v12 = getUIPrintFormatterClass_15016;
  v13 = a3;
  -[WFContentItem objectsForClass:](self, "objectsForClass:", v12());
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  -[WFContentItem name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getPDFFromPrintFormatters:nameIfKnown:matchingInputSize:withMargin:startingAtPage:endingAtPage:completionHandler:", v16, v15, v10, v9, a6, a7, v13);

}

- (void)createImageWithFileType:(id)a3 colorspace:(CGColorSpace *)a4 resolution:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  double v20;
  CGColorSpace *v21;

  v10 = a3;
  v11 = a6;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__WFPDFContentItem_createImageWithFileType_colorspace_resolution_completion___block_invoke;
  v17[3] = &unk_24C4E07D8;
  v18 = v10;
  v19 = v11;
  v20 = a5;
  v21 = a4;
  v17[4] = self;
  v12 = (void *)MEMORY[0x24BEC14A0];
  v13 = *MEMORY[0x24BDF84E0];
  v14 = v10;
  v15 = v11;
  objc_msgSend(v12, "typeWithUTType:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v17, v16);

}

- (void)generateFileRepresentations:(id)a3 options:(id)a4 forType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF84E0]))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__WFPDFContentItem_generateFileRepresentations_options_forType___block_invoke;
    v12[3] = &unk_24C4E2ED8;
    v13 = v7;
    -[WFPDFContentItem getPDF:matchingInputSize:withMargin:startingAtPage:endingAtPage:](self, "getPDF:matchingInputSize:withMargin:startingAtPage:endingAtPage:", v12, 1, 1, 1, 0x7FFFFFFFFFFFFFFFLL);

  }
  else
  {
    +[WFImageContentItem imageTypes](WFImageContentItem, "imageTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "conformsToTypes:", v9);

    if (v10)
    {
      -[WFPDFContentItem createImageWithFileType:colorspace:resolution:completion:](self, "createImageWithFileType:colorspace:resolution:completion:", v8, 0, v7, 300.0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }

}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  WFPDFContentItem *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v27[3] = &unk_24C4E0828;
    v29 = v8;
    v27[4] = self;
    v28 = v9;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v27, getPDFDocumentClass());

    v13 = v29;
  }
  else if ((Class)objc_opt_class() == a5)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v24[3] = &unk_24C4E0828;
    v26 = v8;
    v24[4] = self;
    v25 = v9;
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v24, getPDFDocumentClass());

    v13 = v26;
  }
  else
  {
    NSStringFromClass(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(CFSTR("UIPrintFormatter"), "isEqualToString:", v10);

    if (v11)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
      v20[3] = &unk_24C4E2F28;
      v21 = v9;
      v22 = self;
      v23 = v8;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v20, v12);

      v13 = v21;
    }
    else
    {
      NSStringFromClass(a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(CFSTR("PDFDocument"), "isEqualToString:", v14);

      if (!v15)
      {
        objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v17);

        goto LABEL_10;
      }
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
      v18[3] = &unk_24C4E1E38;
      v18[4] = self;
      v19 = v8;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItem getFileRepresentation:forType:](self, "getFileRepresentation:forType:", v18, v16);

      v13 = v19;
    }
  }

LABEL_10:
}

- (void)enumeratePagesInDocument:(id)a3 block:(id)a4
{
  void (**v5)(id, void *);
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *))a4;
  if (objc_msgSend(v8, "pageCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v8, "pageAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7);

      ++v6;
    }
    while (v6 < objc_msgSend(v8, "pageCount"));
  }

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v15 = &unk_24C4E0800;
    v9 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "enumeratePagesInDocument:block:", v6, &v12);
    if (v10)
    {
      +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v10, v12, v13, v14, v15, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
    v15 = &unk_24C4E0800;
    v9 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "enumeratePagesInDocument:block:", v6, &v12);
    if (v10)
    {
      +[WFObjectRepresentation objects:](WFObjectRepresentation, "objects:", v10, v12, v13, v14, v15, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
  v6[3] = &unk_24C4E0850;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  +[WFWKWebViewCapturer loadWebResource:withSize:configuration:coercionOptions:completionHandler:](WFWKWebViewCapturer, "loadWebResource:withSize:configuration:coercionOptions:completionHandler:", v3, 0, v4, v6, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "representationType");
    v6 = objc_alloc(getPDFDocumentClass());
    if (v5)
    {
      objc_msgSend(v4, "fileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithURL:", v7);
    }
    else
    {
      objc_msgSend(v4, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithData:", v7);
    }
    v9 = (void *)v8;

    v10 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v9, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v13, 0);
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD0B88];
      v17 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The PDF was corrupt or could not be read."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 259, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v13);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "viewPrintFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:named:](WFObjectRepresentation, "object:named:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v10, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v7 + 16))(*(_QWORD *)(a1 + 40), 0, v5);
  }

}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1688]);
    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFCoercionOptionPDFPageHeaderText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v6);
        objc_msgSend(v4, "appendAttributedString:", v7);

      }
    }

    objc_msgSend(v14, "attributedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendAttributedString:", v8);

    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("WFCoercionOptionPDFPageFooterText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v10);
        objc_msgSend(v4, "appendAttributedString:", v11);

      }
    }

    v12 = *(void **)(a1 + 40);
    v13 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v12, "addObject:", v13);

  }
}

void __67__WFPDFContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFCoercionOptionPDFPageHeaderText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v4, "appendString:", v6);
    }

    objc_msgSend(v12, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v7);

    objc_msgSend(*(id *)(a1 + 32), "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("WFCoercionOptionPDFPageFooterText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v4, "appendString:", v9);
    }

    v10 = *(void **)(a1 + 40);
    v11 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __64__WFPDFContentItem_generateFileRepresentations_options_forType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD, id);
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v10[0] = a2;
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);

  }
  else
  {
    v9 = *(void (**)(uint64_t, _QWORD, id))(v3 + 16);
    v7 = a3;
    v9(v3, 0, v7);
    v8 = 0;
  }

}

void __77__WFPDFContentItem_createImageWithFileType_colorspace_resolution_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  const __CFURL *v8;
  CGPDFDocument *v9;
  size_t NumberOfPages;
  size_t v11;
  size_t v12;
  unint64_t v13;
  CGPDFPage *Page;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v19;
  void *v20;
  CGContext *v21;
  CGFloat v22;
  CGImageRef Image;
  CGImage *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFURL *v29;
  void *v30;
  __CFString *v31;
  CGImageDestination *v32;
  void *v33;
  const __CFData *v34;
  CGDataProvider *v35;
  void *v36;
  size_t v37;
  CGPDFDocument *v38;
  void *v39;
  CGAffineTransform transform;
  CGRect BoxRect;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_3:
    v7();
    goto LABEL_16;
  }
  if (!objc_msgSend(v5, "representationType"))
  {
    objc_msgSend(v6, "data");
    v34 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v35 = CGDataProviderCreateWithCFData(v34);

    v9 = CGPDFDocumentCreateWithProvider(v35);
    CGDataProviderRelease(v35);
    if (v9)
      goto LABEL_6;
LABEL_18:
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_3;
  }
  objc_msgSend(v6, "fileURL");
  v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v9 = CGPDFDocumentCreateWithURL(v8);

  if (!v9)
    goto LABEL_18;
LABEL_6:
  v36 = v6;
  v39 = (void *)objc_opt_new();
  NumberOfPages = CGPDFDocumentGetNumberOfPages(v9);
  if (NumberOfPages)
  {
    v11 = NumberOfPages;
    v12 = 1;
    v13 = 0x24BEC1000uLL;
    v37 = NumberOfPages;
    v38 = v9;
    do
    {
      Page = CGPDFDocumentGetPage(v9, v12);
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      v19 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 888)), "initWithSize:opaque:scale:colorspace:hdrCapable:", 0, *(_QWORD *)(a1 + 64), 1, BoxRect.size.width, BoxRect.size.height, *(double *)(a1 + 56) / 72.0);
      v20 = v19;
      if (v19)
      {
        v21 = (CGContext *)objc_msgSend(objc_retainAutorelease(v19), "CGContext");
        CGContextSetRGBFillColor(v21, 1.0, 1.0, 1.0, 1.0);
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        CGContextFillRect(v21, v42);
        CGContextSetInterpolationQuality(v21, kCGInterpolationHigh);
        CGContextSetRenderingIntent(v21, kCGRenderingIntentDefault);
        v43.origin.x = x;
        v43.origin.y = y;
        v43.size.width = width;
        v43.size.height = height;
        v22 = CGRectGetHeight(v43);
        CGContextTranslateCTM(v21, 0.0, v22);
        CGContextScaleCTM(v21, 1.0, -1.0);
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFMediaBox, v44, 0, 1);
        CGContextConcatCTM(v21, &transform);
        CGContextDrawPDFPage(v21, Page);
        Image = CGBitmapContextCreateImage(v21);
        if (Image)
        {
          v24 = Image;
          if (v11 == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*(id *)(a1 + 32), "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("%@-%lu"), v27, v12);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

          }
          +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v25, *(_QWORD *)(a1 + 40));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v28);
          v29 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "utType");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "identifier");
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v32 = CGImageDestinationCreateWithURL(v29, v31, 1uLL, 0);

          CGImageDestinationAddImage(v32, v24, 0);
          CGImageDestinationFinalize(v32);
          CFRelease(v32);
          CFRelease(v24);
          +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v29, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v33);

          v11 = v37;
          v9 = v38;
          v13 = 0x24BEC1000;
        }
      }

      ++v12;
    }
    while (v12 <= v11);
  }
  CGPDFDocumentRelease(v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  v6 = v36;
LABEL_16:

}

@end
