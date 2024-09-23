@implementation GEOMapsHomeTicket

void __56___GEOMapsHomeTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  GEOMapsHomeResult *v9;
  id *v10;
  void *v11;
  void *v12;
  GEOMapsHomeResult *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (!v5
    && (objc_msgSend(v14, "globalResult"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (_QWORD *)v6, -[GEOPDPlaceGlobalResult _readMapsHomeResult](v6), v8 = v7[28], v7, v8))
  {
    v9 = [GEOMapsHomeResult alloc];
    objc_msgSend(v14, "globalResult");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult mapsHomeResult](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mapsResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOMapsHomeResult initWithMapsHomeResult:mapsResults:](v9, "initWithMapsHomeResult:mapsResults:", v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
