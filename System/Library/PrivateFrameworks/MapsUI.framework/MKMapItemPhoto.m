@implementation MKMapItemPhoto

void __71__MKMapItemPhoto_MUPhotoTileProvider__configureWithSize_imageProvider___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5)
{
  id v8;
  double v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;

  v8 = a2;
  if (!v8 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__MKMapItemPhoto_MUPhotoTileProvider__configureWithSize_imageProvider___block_invoke_2;
    v10[3] = &unk_1E2E02020;
    v13 = *(id *)(a1 + 32);
    v11 = v8;
    v12 = 0;
    v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v11, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v9);

  }
}

uint64_t __71__MKMapItemPhoto_MUPhotoTileProvider__configureWithSize_imageProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 48);
  if (!a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

@end
