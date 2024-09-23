@implementation _GEOAllCollectionViewTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E1C069B8;
    v8[4] = self;
    v9 = v6;
    -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v8, 0, a4, 0.0);

  }
}

- (void)parseAllCollectionViewResponse:(id)a3 usingError:(id)a4 onCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *, _QWORD);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  GEOAllCollectionsViewResult *v20;
  id *v21;
  void *v22;
  GEOAllCollectionsViewResult *v23;
  void *v24;
  uint64_t v25;
  id *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  GEOAllCollectionsViewResult *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, void *);
  void *v37;
  id v38;

  v33 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *, _QWORD))a5;
  if (!v7)
  {
    objc_msgSend(v33, "globalResult");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (_QWORD *)v9;
      -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v9);
      v11 = v10[6];

      if (v11)
      {
        objc_msgSend(v33, "globalResult");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (_QWORD *)v12;
        if (v12 && (-[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v12), v13[6]))
        {
          objc_msgSend(v33, "globalResult");
          v14 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPlaceGlobalResult allCollectionsViewResult](v14);
          v15 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAllCollectionsViewResult resultFilters](v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v33, "mapsResults");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = MEMORY[0x1E0C809B0];
            v35 = 3221225472;
            v36 = __93___GEOAllCollectionViewTicket_parseAllCollectionViewResponse_usingError_onCompletionHandler___block_invoke;
            v37 = &unk_1E1BFF5C8;
            v38 = v17;
            v19 = v17;
            objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v34);

            v20 = [GEOAllCollectionsViewResult alloc];
            objc_msgSend(v33, "globalResult");
            v21 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult allCollectionsViewResult](v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[GEOAllCollectionsViewResult initWithAllCollectionsViewResult:withPlaces:](v20, "initWithAllCollectionsViewResult:withPlaces:", v22, v19);

            v24 = v38;
            goto LABEL_14;
          }
        }
        else
        {

        }
        objc_msgSend(v33, "globalResult", v33);
        v25 = objc_claimAutoreleasedReturnValue();
        v19 = (_QWORD *)v25;
        if (!v25 || (-[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v25), !v19[6]))
        {
          v23 = 0;
          goto LABEL_16;
        }
        objc_msgSend(v33, "globalResult");
        v26 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult allCollectionsViewResult](v26);
        v27 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAllCollectionsViewResult collectionIds](v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (!v29)
        {
          v23 = 0;
          goto LABEL_17;
        }
        v30 = [GEOAllCollectionsViewResult alloc];
        objc_msgSend(v33, "globalResult");
        v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceGlobalResult allCollectionsViewResult]((id *)v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[GEOAllCollectionsViewResult initWithAllCollectionsViewResult:](v30, "initWithAllCollectionsViewResult:", v24);
LABEL_14:

LABEL_16:
LABEL_17:
        +[GEOCollectionResult collectionResultsFromResponse:](GEOCollectionResult, "collectionResultsFromResponse:", v33, v33, v34, v35, v36, v37);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "copy");
        v8[2](v8, v23, v32, 0);

        goto LABEL_18;
      }
    }
  }
  ((void (**)(id, void *, void *, id))v8)[2](v8, 0, 0, v7);
LABEL_18:

}

@end
