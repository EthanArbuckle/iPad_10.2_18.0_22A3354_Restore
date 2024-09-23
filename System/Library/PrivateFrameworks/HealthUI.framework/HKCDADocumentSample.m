@implementation HKCDADocumentSample

void __106__HKCDADocumentSample_HKDataMetadataSampleExtensions__fetchDetailedReportWithHealthStore_reportDataBlock___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if ((a4 & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v11)
        goto LABEL_10;
      objc_msgSend(v11, "document");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_10;
      v13 = (void *)v12;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "document");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "document");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "documentData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
      else
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("CDA sample missing document"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      }
    }
    else if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
