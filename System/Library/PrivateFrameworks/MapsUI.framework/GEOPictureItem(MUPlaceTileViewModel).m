@implementation GEOPictureItem(MUPlaceTileViewModel)

- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  double v22;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenScale");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0D271D8], "defaultPhotoOptionsWithAllowSmaller:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "photo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v12, a2, a3, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__GEOPictureItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
    v18[3] = &unk_1E2E02048;
    v19 = v8;
    v20 = a2;
    v21 = a3;
    v22 = v11;
    objc_msgSend(v16, "loadAppImageAtURL:completionHandler:", v17, v18);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
  }

}

- (uint64_t)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel
{
  uint64_t result;

  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0, 0);
  return result;
}

- (uint64_t)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  uint64_t result;

  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0, 0);
  return result;
}

- (uint64_t)subtitleAttributedStringForFont:()MUPlaceTileViewModel
{
  return 0;
}

- (id)footerAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "tileSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1140];
    v15[0] = *MEMORY[0x1E0DC1138];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v6;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(v7, "initWithString:attributes:", v5, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)expectedNumberOfFooterLines
{
  return 2;
}

@end
