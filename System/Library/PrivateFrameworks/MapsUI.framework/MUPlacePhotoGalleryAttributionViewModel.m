@implementation MUPlacePhotoGalleryAttributionViewModel

+ (id)viewModelForCustomTitle:(id)a3 customSubtitle:(id)a4
{
  id v4;
  MUPlacePhotoGalleryAttributionViewModel *v5;

  v4 = a3;
  v5 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
  -[MUPlacePhotoGalleryAttributionViewModel setTitleText:](v5, "setTitleText:", v4);
  -[MUPlacePhotoGalleryAttributionViewModel setSubtitleText:](v5, "setSubtitleText:", v4);

  return v5;
}

+ (id)viewModelFromMapItem:(id)a3 photo:(id)a4 photoCreditName:(id)a5 shouldAddPhotoCredit:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  MUPlacePhotoGalleryAttributionViewModel *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MUPlacePhotoGalleryAttributionViewModel *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v31;
  void *v32;
  void *v33;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
  if ((MapKitIdiomIsMacCatalyst() & 1) == 0)
  {
    if (v6)
    {
      v13 = 3;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CC18A8];
      objc_msgSend(v10, "attribution");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v14, "shouldShowReportAnIssueOnPhotoGalleryForMapItem:photoAttribution:", v9, v15);

      if ((_DWORD)v14)
        v13 = 2;
      else
        v13 = 0;
    }
    -[MUPlacePhotoGalleryAttributionViewModel setAccessoryStyle:](v12, "setAccessoryStyle:", v13);
  }
  objc_msgSend(v10, "geoMapItemPhoto");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "author");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionViewModel setAuthorName:](v12, "setAuthorName:", v17);

  objc_msgSend(v9, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionViewModel setPlaceName:](v12, "setPlaceName:", v18);

  objc_msgSend(v10, "geoMapItemPhoto");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateCreated");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionViewModel setPhotoDate:](v12, "setPhotoDate:", v20);

  objc_msgSend(v10, "attribution");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "providerName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionViewModel setVendorName:](v12, "setVendorName:", v22);

  objc_msgSend(v10, "geoMapItemPhoto");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "caption");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryAttributionViewModel setCaption:](v12, "setCaption:", v24);

  objc_msgSend(v10, "attribution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v25, "isUserSubmitted");

  if ((_DWORD)v24)
  {
    v26 = v12;
    v27 = 2;
LABEL_12:
    -[MUPlacePhotoGalleryAttributionViewModel setAttributionType:](v26, "setAttributionType:", v27);
    goto LABEL_13;
  }
  objc_msgSend(v10, "attribution");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isBusinessOwned");

  v26 = v12;
  if (v29)
  {
    v27 = 3;
    goto LABEL_12;
  }
  if (v6)
  {
    -[MUPlacePhotoGalleryAttributionViewModel setAttributionType:](v12, "setAttributionType:", 4);
    if (objc_msgSend(v11, "length"))
      -[MUPlacePhotoGalleryAttributionViewModel setAuthorName:](v12, "setAuthorName:", v11);
  }
  else
  {
    -[MUPlacePhotoGalleryAttributionViewModel setAttributionType:](v12, "setAttributionType:", 1);
    objc_msgSend(v10, "attribution");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "urlsForPhotoWithIdentifier:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "count"))
      -[MUPlacePhotoGalleryAttributionViewModel setSupportsPunchOut:](v12, "setSupportsPunchOut:", 1);

  }
LABEL_13:

  return v12;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleText, a3);
}

- (int64_t)accessoryStyle
{
  return self->_accessoryStyle;
}

- (void)setAccessoryStyle:(int64_t)a3
{
  self->_accessoryStyle = a3;
}

- (NSString)authorName
{
  return self->_authorName;
}

- (void)setAuthorName:(id)a3
{
  objc_storeStrong((id *)&self->_authorName, a3);
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (NSDate)photoDate
{
  return self->_photoDate;
}

- (void)setPhotoDate:(id)a3
{
  objc_storeStrong((id *)&self->_photoDate, a3);
}

- (int64_t)attributionType
{
  return self->_attributionType;
}

- (void)setAttributionType:(int64_t)a3
{
  self->_attributionType = a3;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_storeStrong((id *)&self->_caption, a3);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (void)setVendorName:(id)a3
{
  objc_storeStrong((id *)&self->_vendorName, a3);
}

- (BOOL)supportsPunchOut
{
  return self->_supportsPunchOut;
}

- (void)setSupportsPunchOut:(BOOL)a3
{
  self->_supportsPunchOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_photoDate, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_authorName, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
