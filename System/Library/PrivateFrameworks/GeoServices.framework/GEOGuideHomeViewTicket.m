@implementation GEOGuideHomeViewTicket

void __61___GEOGuideHomeViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  GEOGuidesHomeResult *v14;
  id *v15;
  void *v16;
  void *v17;
  GEOGuidesHomeResult *v18;
  void *v19;
  NSObject *v20;
  uint8_t v21[16];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "globalResult");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (_QWORD *)v7;
      -[GEOPDPlaceGlobalResult _readGuidesHomeResult](v7);
      v9 = v8[25];

      if (v9)
      {
        objc_msgSend(v5, "globalResult");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (_QWORD *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readGuidesHomeResult](v10), v11[25]))
        {
          objc_msgSend(v5, "mapsResults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v14 = [GEOGuidesHomeResult alloc];
            objc_msgSend(v5, "globalResult");
            v15 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult guidesHomeResult](v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "mapsResults");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[GEOGuidesHomeResult initWithGuidesHomeFixedSection:mapsResults:](v14, "initWithGuidesHomeFixedSection:mapsResults:", v16, v17);

            v19 = 0;
LABEL_15:
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

            goto LABEL_16;
          }
        }
        else
        {

        }
        if (qword_1EDF51128 != -1)
          dispatch_once(&qword_1EDF51128, &__block_literal_global_8);
        v20 = (id)qword_1EDF51120;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Request for a Guide Home contained invalid response.", v21, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Either guidesHomeResult or mapsResult are missing in the response."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        goto LABEL_15;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

@end
