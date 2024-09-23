@implementation GEOPictureItem

void __75__GEOPictureItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  if (!a2 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__GEOPictureItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2;
    v10[3] = &unk_1E2E03148;
    v9 = *(id *)(a1 + 32);
    v11 = 0;
    v12 = v9;
    v13 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);

  }
}

uint64_t __75__GEOPictureItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

@end
