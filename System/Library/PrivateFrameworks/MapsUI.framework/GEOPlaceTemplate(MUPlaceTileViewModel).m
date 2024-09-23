@implementation GEOPlaceTemplate(MUPlaceTileViewModel)

- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "styleAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);

  }
}

- (void)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "styleAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _MUFetchBadgeIconWithStyleAttributes(v5, 0, v4);

  }
}

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
  objc_msgSend(a1, "heroImage");
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
    v18[2] = __77__GEOPlaceTemplate_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
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

- (id)subtitleAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "subtitleLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringForFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)footerAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "footerLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringForFont:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)expectedNumberOfFooterLines
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;

  objc_msgSend(a1, "footerLine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "footerLine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length") || objc_msgSend(v5, "length"))
  {
    v6 = 2;
  }
  else
  {
    objc_msgSend(a1, "footerLine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ratingSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v9, "isAppleRating"))
        v6 = 1;
      else
        v6 = 2;
    }
    else
    {
      v6 = 1;
    }

  }
  return v6;
}

@end
