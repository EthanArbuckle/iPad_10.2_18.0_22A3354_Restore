@implementation MKMapItem(MUPlaceTileViewModel)

- (id)tileSubtitle
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!objc_msgSend(a1, "_hasHikeInfo"))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  objc_msgSend(a1, "_hikeSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
  else
    objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lengthStringForUnit:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hikeSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  else
    objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "elevationGainStringForUnit:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length") || !objc_msgSend(v10, "length"))
  {

LABEL_12:
    objc_msgSend(a1, "_shortAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%@ · ↗ %@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  MURouteSnapshotKey *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  double v34;
  double v35;
  double v36;
  _QWORD v37[4];
  id v38;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenScale");
  v11 = v10;

  if (objc_msgSend(a1, "_hasHikeInfo"))
  {
    v12 = (void *)MEMORY[0x1E0D274C0];
    objc_msgSend(a1, "_geoMapItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "builderWithMapItem:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "buildRoute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueRouteID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v26 = v18;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceStyle") == 2;

    v30 = -[MURouteSnapshotKey initWithIdentifier:width:height:scale:padding:darkMode:]([MURouteSnapshotKey alloc], "initWithIdentifier:width:height:scale:padding:darkMode:", v26, v29, a2, a3, v11, 15.0, 15.0, 15.0, 15.0);
    +[MURouteSnapshotManager sharedInstance](MURouteSnapshotManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __70__MKMapItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
    v37[3] = &unk_1E2E03D00;
    v38 = v8;
    objc_msgSend(v31, "getSnapshotForKey:route:completion:", v30, v15, v37);

  }
  else
  {
    objc_msgSend(a1, "_geoMapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_photos");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_geo_firstPhotoOfAtLeastSize:", a2 * v11, a3 * v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "url");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __70__MKMapItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2;
      v32[3] = &unk_1E2E02048;
      v33 = v8;
      v34 = a2;
      v35 = a3;
      v36 = v11;
      objc_msgSend(v24, "loadAppImageAtURL:completionHandler:", v25, v32);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
    }
  }

}

- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "_styleAttributes");
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
    objc_msgSend(a1, "_styleAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    _MUFetchBadgeIconWithStyleAttributes(v5, 0, v4);

  }
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
