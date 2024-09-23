@implementation GEOFetchTransitCoverageForCoordinate

uint64_t __GEOFetchTransitCoverageForCoordinate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __GEOFetchTransitCoverageForCoordinate_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v7 = a5;
  +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closeForClient:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, 0xFFFFFFFFLL, v7);
  }
  else
  {
    objc_msgSend(v15, "decodedRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "decodedRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "transitCoverage");

    }
    else
    {
      v13 = -1;
    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, v13, 0);
  }

}

@end
