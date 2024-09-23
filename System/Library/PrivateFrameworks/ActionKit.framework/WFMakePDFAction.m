@implementation WFMakePDFAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  WFMakePDFAction *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems"))
  {
    -[WFMakePDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPDFIncludedPages"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMakePDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPDFSinglePage"), objc_opt_class());
    v6 = objc_claimAutoreleasedReturnValue();
    -[WFMakePDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPDFPageRangeStart"), objc_opt_class());
    v7 = objc_claimAutoreleasedReturnValue();
    -[WFMakePDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPDFPageRangeEnd"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v7;
    v32 = (void *)v6;
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Single Page")))
    {
      if (v6)
        v9 = (void *)v6;
      else
        v9 = &unk_24F93B468;
      v10 = objc_msgSend(v9, "integerValue");
      v30 = v10;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Page Range")))
    {
      if (v7)
        v15 = (void *)v7;
      else
        v15 = &unk_24F93B468;
      v30 = objc_msgSend(v15, "integerValue");
      if (v8)
        v16 = v8;
      else
        v16 = &unk_24F93B480;
      v10 = objc_msgSend(v16, "integerValue");
    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v30 = 1;
    }
    -[WFMakePDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPDFIncludeMargin"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    v19 = (void *)MEMORY[0x24BE193F0];
    v42 = *MEMORY[0x24BE19720];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "optionsWithDictionary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84E0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v4, "numberOfItems");
    -[WFMakePDFAction progress](self, "progress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTotalUnitCount:", v24);

    objc_msgSend(v4, "items");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke;
    v37[3] = &unk_24F8BABE8;
    v38 = v23;
    v39 = self;
    v40 = v4;
    v41 = v22;
    v33[0] = v27;
    v33[1] = 3221225472;
    v33[2] = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_3;
    v33[3] = &unk_24F8BAC10;
    v33[4] = self;
    v34 = v38;
    v35 = v30;
    v36 = v10;
    v28 = v38;
    v29 = v22;
    objc_msgSend(v26, "if_mapAsynchronously:completionHandler:", v37, v33);

    v14 = v31;
    v13 = v32;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BEC4270];
    v44[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v5;
    v44[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Make sure to pass items to the Make PDF action."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 6, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFMakePDFAction finishRunningWithError:](self, "finishRunningWithError:", v8);
  }

}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  uint64_t v18;
  id v19;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE193F8];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_2;
  v17 = &unk_24F8BABC0;
  v8 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = v6;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v7, "requestForCoercingToFileType:completionHandler:", v8, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "defaultCoercionOptions", v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "optionsByAddingContentsOfOptions:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", v13);

  objc_msgSend(v10, "performCoercion:", v11);
}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  id obj;
  id obja;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (!v5 || a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
    goto LABEL_65;
  }
  v61 = v5;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v78;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v78 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "representationType");
        if (v12 == 1)
        {
          v16 = objc_alloc((Class)getPDFDocumentClass_47061());
          objc_msgSend(v11, "fileURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v16, "initWithURL:", v14);
        }
        else
        {
          if (v12)
            goto LABEL_32;
          v13 = objc_alloc((Class)getPDFDocumentClass_47061());
          objc_msgSend(v11, "data");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "initWithData:", v14);
        }
        v17 = (void *)v15;

        if (!v17)
        {
LABEL_32:
          getWFActionsLogObject();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v85 = "-[WFMakePDFAction runAsynchronouslyWithInput:]_block_invoke_3";
            v86 = 2112;
            v87 = v11;
            _os_log_impl(&dword_22D353000, v30, OS_LOG_TYPE_FAULT, "%s Could not make PDFDocument from PDF file %@", buf, 0x16u);
          }

          v31 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BE19450], "badCoercionErrorForType:", *(_QWORD *)(a1 + 40));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "finishRunningWithError:", v32);
          v18 = v6;
          goto LABEL_64;
        }
        objc_msgSend(v62, "addObject:", v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
      if (v8)
        continue;
      break;
    }
  }
  v59 = v6;

  v18 = objc_alloc_init((Class)getPDFDocumentClass_47061());
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFPDFDocumentMergeBehavior"), objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v19;
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("Append")))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v62;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v74;
      v23 = 1;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v74 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          v26 = objc_msgSend(v25, "pageCount", v57);
          if (v26)
          {
            v27 = v26;
            for (k = 0; k != v27; ++k)
            {
              if (v23 + k >= *(_QWORD *)(a1 + 48) && v23 + k <= *(_QWORD *)(a1 + 56))
              {
                objc_msgSend(v25, "pageAtIndex:", k);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "insertPage:atIndex:", v29, objc_msgSend(v18, "pageCount"));

              }
            }
            v23 += v27;
          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v21);
    }
LABEL_62:

    goto LABEL_63;
  }
  if (!objc_msgSend(v19, "isEqualToString:", CFSTR("Shuffle")))
    goto LABEL_63;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v33 = v62;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  if (!v34)
    goto LABEL_62;
  v35 = v34;
  v36 = 0;
  v37 = *(_QWORD *)v70;
  do
  {
    for (m = 0; m != v35; ++m)
    {
      if (*(_QWORD *)v70 != v37)
        objc_enumerationMutation(v33);
      v39 = objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "pageCount", v57);
      if (v39 > v36)
        v36 = v39;
    }
    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  }
  while (v35);

  if (v36 >= 1)
  {
    v40 = 0;
    v41 = 1;
    obja = v33;
    v60 = v36;
    do
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v42 = v33;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v66;
        do
        {
          for (n = 0; n != v44; ++n)
          {
            if (*(_QWORD *)v66 != v45)
              objc_enumerationMutation(v42);
            v47 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * n);
            if (v40 <= objc_msgSend(v47, "pageCount") - 1)
            {
              if (v41 >= *(_QWORD *)(a1 + 48))
              {
                v48 = v41 + 1;
                if (v41 <= *(_QWORD *)(a1 + 56))
                {
                  objc_msgSend(v47, "pageAtIndex:", v40);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "insertPage:atIndex:", v49, objc_msgSend(v18, "pageCount"));

                }
                v41 = v48;
              }
              else
              {
                ++v41;
              }
            }
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
        }
        while (v44);
      }

      ++v40;
      v33 = obja;
    }
    while (v40 != v60);
  }
LABEL_63:
  v50 = (void *)MEMORY[0x24BE194F8];
  objc_msgSend(v59, "firstObject", v57);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "wfName");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "proposedFilenameForFile:ofType:", v52, *(_QWORD *)(a1 + 40));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE19628], "proposedTemporaryFileURLForFilename:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "writeToURL:", v54);
  objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v54, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "output");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addFile:", v55);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  v32 = v58;
LABEL_64:

  v5 = v61;
LABEL_65:

}

void __46__WFMakePDFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + 1);

  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v6);
}

@end
