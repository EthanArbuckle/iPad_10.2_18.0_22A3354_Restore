@implementation MKMapItemPhoto(MUPhotoTileProvider)

- (void)configureWithSize:()MUPhotoTileProvider imageProvider:
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
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenScale");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0D271D8], "defaultPhotoOptionsWithAllowSmaller:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "geoMapItemPhoto");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v12, a2, a3, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __71__MKMapItemPhoto_MUPhotoTileProvider__configureWithSize_imageProvider___block_invoke;
    v20[3] = &unk_1E2E02048;
    v21 = v8;
    v22 = a2;
    v23 = a3;
    v24 = v11;
    objc_msgSend(v18, "loadAppImageAtURL:completionHandler:", v19, v20);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, 0);
  }

}

@end
