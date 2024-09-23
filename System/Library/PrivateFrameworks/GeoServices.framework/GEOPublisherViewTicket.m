@implementation GEOPublisherViewTicket

void __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  GEOPublisherViewResult *v18;
  id *v19;
  void *v20;
  GEOPublisherViewResult *v21;
  void *v22;
  uint64_t v23;
  id *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  GEOPublisherViewResult *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  GEOPublisherResult *v40;
  void *v41;
  GEOPublisherResult *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  _QWORD v46[4];
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "globalResult");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (_QWORD *)v7;
      -[GEOPDPlaceGlobalResult _readPublisherViewResult](v7);
      v9 = v8[41];

      if (v9)
      {
        objc_msgSend(v5, "globalResult");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (_QWORD *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readPublisherViewResult](v10), v11[41]))
        {
          objc_msgSend(v5, "globalResult");
          v12 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPlaceGlobalResult publisherViewResult](v12);
          v13 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPublisherViewResult resultFilters](v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v5, "mapsResults");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_2;
            v46[3] = &unk_1E1BFF5C8;
            v47 = v15;
            v17 = v15;
            objc_msgSend(v16, "enumerateObjectsUsingBlock:", v46);

            v18 = [GEOPublisherViewResult alloc];
            objc_msgSend(v5, "globalResult");
            v19 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult publisherViewResult](v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[GEOPublisherViewResult initWithPublisherViewResult:withPlaces:](v18, "initWithPublisherViewResult:withPlaces:", v20, v17);

            v22 = v47;
            goto LABEL_14;
          }
        }
        else
        {

        }
        objc_msgSend(v5, "globalResult");
        v23 = objc_claimAutoreleasedReturnValue();
        v17 = (_QWORD *)v23;
        if (!v23 || (-[GEOPDPlaceGlobalResult _readPublisherViewResult](v23), !v17[41]))
        {
          v21 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v5, "globalResult");
        v24 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult publisherViewResult](v24);
        v25 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPublisherViewResult collectionIds](v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (!v27)
        {
          v21 = 0;
LABEL_17:
          +[GEOCollectionResult collectionResultsFromResponse:](GEOCollectionResult, "collectionResultsFromResponse:", v5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mapsResults");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_952);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "filteredArrayUsingPredicate:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "count"))
          {
            if ((unint64_t)objc_msgSend(v32, "count") < 2)
            {
              objc_msgSend(v32, "firstObject");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = [GEOPublisherResult alloc];
              objc_msgSend(v39, "publisher");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = -[GEOPublisherResult initWithPublisherResult:](v40, "initWithPublisherResult:", v41);

              if (v42)
              {
                v43 = *(_QWORD *)(a1 + 32);
                v44 = (void *)objc_msgSend(v29, "copy");
                (*(void (**)(uint64_t, GEOPublisherViewResult *, void *, GEOPublisherResult *, _QWORD))(v43 + 16))(v43, v21, v44, v42, 0);
              }
              else
              {
                GEOGetGEOPublisherViewLookupLog();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1885A9000, v45, OS_LOG_TYPE_ERROR, "Request for a publisher view returned nil publisher", buf, 2u);
                }

                objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("No publisher result in response."));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0, v44);
              }

              goto LABEL_33;
            }
            GEOGetGEOPublisherViewLookupLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = objc_msgSend(v32, "count");
              *(_DWORD *)buf = 134218240;
              v49 = v34;
              v50 = 1024;
              v51 = 1;
              _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_ERROR, "Request for a publisher view contained more than one publishers in response: %lu expected: %d", buf, 0x12u);
            }

            v35 = (void *)MEMORY[0x1E0CB35C8];
            v36 = CFSTR("Multiple publishers in response.");
          }
          else
          {
            GEOGetGEOPublisherViewLookupLog();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v38 = objc_msgSend(v32, "count");
              *(_DWORD *)buf = 134218240;
              v49 = v38;
              v50 = 1024;
              v51 = 1;
              _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_ERROR, "Request for a publisher view contained no publishers in response: %lu expected: %d", buf, 0x12u);
            }

            v35 = (void *)MEMORY[0x1E0CB35C8];
            v36 = CFSTR("No publishers in response.");
          }
          objc_msgSend(v35, "GEOErrorWithCode:reason:", -11, v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_33:

          goto LABEL_34;
        }
        v28 = [GEOPublisherViewResult alloc];
        objc_msgSend(v5, "globalResult");
        v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult publisherViewResult]((id *)v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[GEOPublisherViewResult initWithPublisherViewResult:](v28, "initWithPublisherViewResult:", v22);
LABEL_14:

LABEL_16:
        goto LABEL_17;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_34:

}

void __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "resultType") == 1)
  {
    if (objc_msgSend(v7, "hasPlace"))
    {
      objc_msgSend(v7, "place");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "status");

      if (!v4)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(v7, "place");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v6);

      }
    }
  }

}

BOOL __61___GEOPublisherViewTicket_submitWithHandler_networkActivity___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resultType") == 3;
}

@end
