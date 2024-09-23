@implementation GEOFetchTransitCoverageForMapRect

uint64_t __GEOFetchTransitCoverageForMapRect_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

void __GEOFetchTransitCoverageForMapRect_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Exceeded tile limit of 200"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);

}

void __GEOFetchTransitCoverageForMapRect_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  int v15;
  char v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a5;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsKey:", a2) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeKey:", a2);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      +[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "closeForClient:", *(_QWORD *)(a1 + 40));

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v10 + 24))
    {
      if (v8)
      {
        *(_BYTE *)(v10 + 24) = 1;
        v11 = *(_QWORD *)(a1 + 48);
        if (v11)
          (*(void (**)(uint64_t, uint64_t, id, double))(v11 + 16))(v11, 0xFFFFFFFFLL, v8, 0.0);
      }
      else
      {
        objc_msgSend(v18, "decodedRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "transitCoverage");
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v15 = *(unsigned __int8 *)(v14 + 24);
        if (v15 != v13)
        {
          if (v15 == 255)
            v16 = v13;
          else
            v16 = 2;
          *(_BYTE *)(v14 + 24) = v16;
        }
        if (v13 == 1)
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 80)
                                                                      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                              + 8)
                                                                                  + 24);
        if (!objc_msgSend(*(id *)(a1 + 32), "count"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          v17 = *(_QWORD *)(a1 + 48);
          if (v17)
            (*(void (**)(uint64_t, _QWORD, _QWORD, double))(v17 + 16))(v17, *(char *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        }

      }
    }
  }

}

@end
