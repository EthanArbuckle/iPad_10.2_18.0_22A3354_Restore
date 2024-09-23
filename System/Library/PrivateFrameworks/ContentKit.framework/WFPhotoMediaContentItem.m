@implementation WFPhotoMediaContentItem

- (NSDictionary)additionalRepresentationsForSerialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v18[0] = CFSTR("com.apple.mobileslideshow.asset.localidentifier");
  -[WFPhotoMediaContentItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v18[1] = CFSTR("link.contentkit.phasset.representationtypes");
  -[WFPhotoMediaContentItem assetRepresentationTypes](self, "assetRepresentationTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  v18[2] = CFSTR("link.contentkit.remoteitem.preferredfiletype");
  -[WFPhotoMediaContentItem preferredFileType](self, "preferredFileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  v18[3] = CFSTR("library");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFPhotoMediaContentItem library](self, "library"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFPhotoMediaContentItem preferredFileType](self, "preferredFileType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "originalURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v13, "originalURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("fileURL"));

  }
  return (NSDictionary *)v11;
}

- (void)getPreferredFileSize:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  id v6;

  v4 = (void (**)(id, uint64_t))a3;
  -[WFPhotoMediaContentItem preferredFileType](self, "preferredFileType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPhotoMediaContentItem preferredAssetResourceForType:](self, "preferredAssetResourceForType:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, objc_msgSend(v6, "fileSize"));
}

- (void)getPreferredFileExtension:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[WFPhotoMediaContentItem preferredFileType](self, "preferredFileType");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

- (id)duration
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  WFTimeInterval *v11;
  uint64_t v12;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  if (v4 == 0.0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 224;
    objc_msgSend(v6, "components:fromDate:toDate:options:", 224, v5, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "hour"))
    {
      v10 = 1;
    }
    else
    {
      v12 = objc_msgSend(v9, "minute");
      if (v12)
        v8 = 224;
      else
        v8 = 192;
      if (v12)
        v10 = 1;
      else
        v10 = 0x10000;
    }
    v11 = -[WFTimeInterval initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:]([WFTimeInterval alloc], "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v8, 0, v10, v4);

  }
  return v11;
}

- (id)imageManager
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPHImageManagerClass_softClass;
  v9 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getPHImageManagerClass_block_invoke;
    v5[3] = &unk_24C4E3118;
    v5[4] = &v6;
    __getPHImageManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "defaultManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)assetResourceManager
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPHAssetResourceManagerClass_softClass;
  v9 = getPHAssetResourceManagerClass_softClass;
  if (!getPHAssetResourceManagerClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getPHAssetResourceManagerClass_block_invoke;
    v5[3] = &unk_24C4E3118;
    v5[4] = &v6;
    __getPHAssetResourceManagerClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "defaultManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  -[WFPhotoMediaContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "mediaType") == 1)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy_;
    v11[4] = __Block_byref_object_dispose_;
    v12 = 0;
    v6 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    objc_msgSend(v6, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v6, "setSynchronous:", 0);
    objc_msgSend(v6, "setDeliveryMode:", 1);
    -[WFPhotoMediaContentItem imageManager](self, "imageManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __39__WFPhotoMediaContentItem_getMetadata___block_invoke;
    v8[3] = &unk_24C4DB878;
    v9 = v4;
    v10 = v11;
    objc_msgSend(v7, "requestImageDataAndOrientationForAsset:options:resultHandler:", v5, v6, v8);

    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)getFrameRate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WFPhotoMediaContentItem_getFrameRate___block_invoke;
  v6[3] = &unk_24C4DB8A0;
  v7 = v4;
  v5 = v4;
  -[WFPhotoMediaContentItem generateAVAsset:networkAccessAllowed:](self, "generateAVAsset:networkAccessAllowed:", v6, 0);

}

- (id)metadataIfLocallyAvailable
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "mediaType") == 1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    v4 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    objc_msgSend(v4, "setNetworkAccessAllowed:", 0);
    objc_msgSend(v4, "setSynchronous:", 1);
    objc_msgSend(v4, "setDeliveryMode:", 1);
    -[WFPhotoMediaContentItem imageManager](self, "imageManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__WFPhotoMediaContentItem_metadataIfLocallyAvailable__block_invoke;
    v8[3] = &unk_24C4DB8C8;
    v8[4] = &v9;
    objc_msgSend(v5, "requestImageDataAndOrientationForAsset:options:resultHandler:", v3, v4, v8);

    v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)location
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", self->_preferredFileType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WFPhotoMediaContentItem asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  +[WFContentItem itemWithFile:](WFAVAssetContentItem, "itemWithFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_6:
    v8 = v4;
    objc_msgSend(v4, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  +[WFContentItem itemWithFile:](WFImageContentItem, "itemWithFile:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  v8 = 0;
LABEL_9:

  return v7;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double)(unint64_t)objc_msgSend(v2, "pixelWidth");
  v4 = (double)(unint64_t)objc_msgSend(v2, "pixelHeight");

  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)make
{
  void *v2;
  void *v3;

  -[WFPhotoMediaContentItem metadataIfLocallyAvailable](self, "metadataIfLocallyAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageMakeFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)model
{
  void *v2;
  void *v3;

  -[WFPhotoMediaContentItem metadataIfLocallyAvailable](self, "metadataIfLocallyAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFImageModelFromMetadata(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)width
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem size](self, "size");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)height
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem size](self, "size");
  return (id)objc_msgSend(v2, "numberWithDouble:", v3);
}

- (BOOL)isPhotoType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;

  v4 = a3;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("HDR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[WFPhotoMediaContentItem asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((unint64_t)objc_msgSend(v7, "mediaSubtypes") >> 1) & 1;
  }
  else
  {
    WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Panorama"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if (v10)
    {
      -[WFPhotoMediaContentItem asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mediaSubtypes") & 1;
    }
    else
    {
      WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Burst"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqualToString:", v11);

      if (v12)
      {
        -[WFPhotoMediaContentItem asset](self, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "burstIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v13 != 0;

      }
      else
      {
        WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Live Photo"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "isEqualToString:", v14);

        if (!v15)
        {
          LOBYTE(v8) = 0;
          goto LABEL_10;
        }
        -[WFPhotoMediaContentItem isLivePhoto](self, "isLivePhoto");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v7, "BOOLValue");
      }
    }
  }

LABEL_10:
  return v8;
}

- (id)photoTypes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  WFPhotoLibraryPossiblePhotoTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__WFPhotoMediaContentItem_photoTypes__block_invoke;
  v6[3] = &unk_24C4DB8F0;
  v6[4] = self;
  objc_msgSend(v3, "if_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isBurst
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "burstIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", v4 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)isLivePhoto
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", (objc_msgSend(v3, "mediaSubtypes") >> 3) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isHidden
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isHidden"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isFavorite
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFPhotoMediaContentItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isFavorite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mediaType
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mediaType");

  if ((unint64_t)(v3 - 1) > 2)
  {
    v4 = 0;
  }
  else
  {
    WFLocalizedContentPropertyPossibleValueMarker(*(&off_24C4E3630 + v3 - 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isScreenshot
{
  void *v2;
  unint64_t v3;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "mediaSubtypes") >> 2) & 1;

  return v3;
}

- (BOOL)isScreenRecording
{
  void *v2;
  unint64_t v3;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ((unint64_t)objc_msgSend(v2, "mediaSubtypes") >> 19) & 1;

  return v3;
}

- (id)orientation
{
  void *v2;
  unint64_t v3;
  int v4;
  void *v5;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "mediaType") == 1)
  {
    v3 = objc_msgSend(v2, "imageOrientation") - 1;
    if (v3 > 6)
      v4 = 1;
    else
      v4 = dword_20BC9A468[v3];
    WFImageStringFromOrientation(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PHAsset)asset
{
  return (PHAsset *)-[WFContentItem objectForClass:](self, "objectForClass:", getPHAssetClass());
}

- (void)getThumbnail:(id)a3 ofSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  id v19;
  _QWORD aBlock[5];
  id v21;
  id v22;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v8, "setDeliveryMode:", 1);
  objc_msgSend(v8, "setResizeMode:", 2);
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke;
  aBlock[3] = &unk_24C4E2DD0;
  aBlock[4] = self;
  v10 = v8;
  v21 = v10;
  v11 = v7;
  v22 = v11;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFPhotoMediaContentItem asset](self, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAnimatedGIF");

  if (v14)
  {
    v12[2](v12);
  }
  else
  {
    -[WFPhotoMediaContentItem imageManager](self, "imageManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPhotoMediaContentItem asset](self, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_3;
    v17[3] = &unk_24C4DB940;
    v18 = v12;
    v19 = v11;
    objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v16, 1, v10, v17, width, height);

  }
}

- (void)retrieveAssetResource:(id)a3 withNetworkAccess:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[WFContentItem name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEC14A0];
  objc_msgSend(v8, "uniformTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typeWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v16 = (void *)getPHAssetResourceRequestOptionsClass_softClass;
  v32 = getPHAssetResourceRequestOptionsClass_softClass;
  v17 = MEMORY[0x24BDAC760];
  if (!getPHAssetResourceRequestOptionsClass_softClass)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __getPHAssetResourceRequestOptionsClass_block_invoke;
    v28[3] = &unk_24C4E3118;
    v28[4] = &v29;
    __getPHAssetResourceRequestOptionsClass_block_invoke((uint64_t)v28);
    v16 = (void *)v30[3];
  }
  v18 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v29, 8);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "setNetworkAccessAllowed:", v6);
  -[WFPhotoMediaContentItem assetResourceManager](self, "assetResourceManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __85__WFPhotoMediaContentItem_retrieveAssetResource_withNetworkAccess_completionHandler___block_invoke;
  v24[3] = &unk_24C4DB968;
  v26 = v8;
  v27 = v9;
  v25 = v15;
  v21 = v8;
  v22 = v15;
  v23 = v9;
  objc_msgSend(v20, "writeDataForAssetResource:toFile:options:completionHandler:", v21, v22, v19, v24);

}

- (void)retrieveFileWithImageManager:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  WFPhotoMediaContentItem *v19;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    v8 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v8, "setDeliveryMode:", 1);
    -[WFPhotoMediaContentItem imageManager](self, "imageManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPhotoMediaContentItem asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke;
    v17[3] = &unk_24C4DB990;
    v18 = v7;
    v19 = self;
    v20 = v6;
    objc_msgSend(v9, "requestImageDataAndOrientationForAsset:options:resultHandler:", v10, v8, v17);

LABEL_8:
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF82D8]) & 1) != 0
    || objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF82D0]))
  {
    v11 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke_2;
    v14[3] = &unk_24C4DB9B8;
    v16 = v6;
    v14[4] = self;
    v15 = v7;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v12 = (void *)getAVAssetClass_softClass;
    v25 = getAVAssetClass_softClass;
    if (!getAVAssetClass_softClass)
    {
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __getAVAssetClass_block_invoke;
      v21[3] = &unk_24C4E3118;
      v21[4] = &v22;
      __getAVAssetClass_block_invoke((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v22, 8);
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v14, v13);

    v8 = v16;
    goto LABEL_8;
  }
LABEL_9:

}

- (id)preferredAssetResourceForType:(id)a3
{
  id v4;
  id PHAssetResourceClass;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  id v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  PHAssetResourceClass = getPHAssetResourceClass();
  -[WFPhotoMediaContentItem asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PHAssetResourceClass, "assetResourcesForAsset:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BEC14A0];
        objc_msgSend(v13, "uniformTypeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeWithString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "conformsToType:", v4);

        if (v17)
        {
          v18 = objc_msgSend(v13, "type") - 7;
          v19 = v13;
          if (v18 > 0xFFFFFFFFFFFFFFFDLL)
          {

            goto LABEL_15;
          }

          v10 = v19;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  v10 = v10;
  v19 = v10;
LABEL_15:

  return v19;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFPhotoMediaContentItem asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "mediaType") == 2)
  {
    v12 = objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF82D8]);

    if (v12)
    {
      -[WFPhotoMediaContentItem retrieveFileWithImageManager:forType:](self, "retrieveFileWithImageManager:forType:", v8, v10);
      goto LABEL_13;
    }
  }
  else
  {

  }
  WFLivePhotoFileType();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "conformsToUTType:", v13);

  if (v14)
  {
    v15 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke;
    v22[3] = &unk_24C4DB9E0;
    v24 = v8;
    v23 = v10;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v16 = (void *)getPHLivePhotoClass_softClass;
    v29 = getPHLivePhotoClass_softClass;
    if (!getPHLivePhotoClass_softClass)
    {
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __getPHLivePhotoClass_block_invoke;
      v25[3] = &unk_24C4E3118;
      v25[4] = &v26;
      __getPHLivePhotoClass_block_invoke((uint64_t)v25);
      v16 = (void *)v27[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v26, 8);
    -[WFContentItem getObjectRepresentation:forClass:](self, "getObjectRepresentation:forClass:", v22, v17);

  }
  else
  {
    -[WFPhotoMediaContentItem preferredAssetResourceForType:](self, "preferredAssetResourceForType:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[WFPhotoMediaContentItem retrieveAssetResource:withNetworkAccess:completionHandler:](self, "retrieveAssetResource:withNetworkAccess:completionHandler:", v18, 1, v8);
    }
    else
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke_2;
      v19[3] = &unk_24C4E2F28;
      v19[4] = self;
      v20 = v10;
      v21 = v8;
      -[WFPhotoMediaContentItem retrieveFileWithImageManager:forType:](self, "retrieveFileWithImageManager:forType:", v19, v20);

    }
  }
LABEL_13:

}

- (void)generateAVAsset:(id)a3 networkAccessAllowed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)getPHVideoRequestOptionsClass());
  objc_msgSend(v7, "setNetworkAccessAllowed:", v4);
  objc_msgSend(v7, "setDeliveryMode:", 1);
  -[WFPhotoMediaContentItem imageManager](self, "imageManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPhotoMediaContentItem asset](self, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__WFPhotoMediaContentItem_generateAVAsset_networkAccessAllowed___block_invoke;
  v11[3] = &unk_24C4DBA08;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "requestAVAssetForVideo:options:resultHandler:", v9, v7, v11);

}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  double *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 buf;
  uint64_t v47;
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  getWFAppIntentsLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFPhotoMediaContentItem generateObjectRepresentation:options:forClass:]";
    _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling old generate method", (uint8_t *)&buf, 0xCu);
  }

  if ((Class)objc_opt_class() == a5)
  {
    v13 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
    objc_msgSend(v13, "setDeliveryMode:", 1);
    -[WFPhotoMediaContentItem imageManager](self, "imageManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPhotoMediaContentItem asset](self, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v40[3] = &unk_24C4DBA30;
    v40[4] = self;
    v41 = v8;
    objc_msgSend(v14, "requestImageDataAndOrientationForAsset:options:resultHandler:", v15, v13, v40);

  }
  else
  {
    NSStringFromClass(a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("AVAsset"), "isEqualToString:", v11);

    if (v12)
    {
      -[WFPhotoMediaContentItem generateAVAsset:networkAccessAllowed:](self, "generateAVAsset:networkAccessAllowed:", v8, 1);
    }
    else
    {
      NSStringFromClass(a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(CFSTR("AVPlayerItem"), "isEqualToString:", v16);

      if (v17)
      {
        v18 = objc_alloc_init((Class)getPHVideoRequestOptionsClass());
        objc_msgSend(v18, "setNetworkAccessAllowed:", 1);
        objc_msgSend(v18, "setDeliveryMode:", 1);
        -[WFPhotoMediaContentItem imageManager](self, "imageManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPhotoMediaContentItem asset](self, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
        v38[3] = &unk_24C4DBA58;
        v38[4] = self;
        v39 = v8;
        objc_msgSend(v19, "requestPlayerItemForVideo:options:resultHandler:", v20, v18, v38);

      }
      else
      {
        NSStringFromClass(a5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(CFSTR("PHLivePhoto"), "isEqualToString:", v21);

        if (v22)
        {
          v42 = 0;
          v43 = &v42;
          v44 = 0x2050000000;
          v23 = (void *)getPHLivePhotoRequestOptionsClass_softClass;
          v45 = getPHLivePhotoRequestOptionsClass_softClass;
          v24 = MEMORY[0x24BDAC760];
          if (!getPHLivePhotoRequestOptionsClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x24BDAC760];
            *((_QWORD *)&buf + 1) = 3221225472;
            v47 = (uint64_t)__getPHLivePhotoRequestOptionsClass_block_invoke;
            v48 = &unk_24C4E3118;
            v49 = &v42;
            __getPHLivePhotoRequestOptionsClass_block_invoke((uint64_t)&buf);
            v23 = (void *)v43[3];
          }
          v25 = objc_retainAutorelease(v23);
          _Block_object_dispose(&v42, 8);
          v26 = objc_alloc_init(v25);
          objc_msgSend(v26, "setNetworkAccessAllowed:", 1);
          objc_msgSend(v26, "setDeliveryMode:", 1);
          -[WFPhotoMediaContentItem imageManager](self, "imageManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFPhotoMediaContentItem asset](self, "asset");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v47 = 0x2020000000;
          v29 = (double *)getPHImageManagerMaximumSizeSymbolLoc_ptr;
          v48 = (void *)getPHImageManagerMaximumSizeSymbolLoc_ptr;
          if (!getPHImageManagerMaximumSizeSymbolLoc_ptr)
          {
            v30 = PhotosLibrary();
            v29 = (double *)dlsym(v30, "PHImageManagerMaximumSize");
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v29;
            getPHImageManagerMaximumSizeSymbolLoc_ptr = (uint64_t)v29;
          }
          _Block_object_dispose(&buf, 8);
          if (!v29)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGSize getPHImageManagerMaximumSize(void)");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFPhotoMediaContentItem.m"), 56, CFSTR("%s"), dlerror());

            __break(1u);
          }
          v31 = *v29;
          v32 = v29[1];
          v36[0] = v24;
          v36[1] = 3221225472;
          v36[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
          v36[3] = &unk_24C4DBA80;
          v36[4] = self;
          v37 = v8;
          objc_msgSend(v27, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v28, 0, v26, v36, v31, v32);

        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v33);

        }
      }
    }
  }

}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  NSObject *v30;
  _BYTE *v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(CFSTR("CLLocation"), "isEqualToString:", v8);

  if (v9)
  {
    -[WFPhotoMediaContentItem location](self, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFPhotoMediaContentItem asset](self, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    getWFAppIntentsLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[WFPhotoMediaContentItem asset](self, "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFPhotoMediaContentItem generateObjectRepresentationForClass:options:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_20BBAD000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating LNEntity for asset: %@", buf, 0x16u);

    }
    v17 = objc_alloc(MEMORY[0x24BE60048]);
    v18 = (void *)objc_msgSend(v17, "initWithBundleIdentifier:", *MEMORY[0x24BEC1728]);
    v19 = objc_alloc(MEMORY[0x24BE60188]);
    -[WFPhotoMediaContentItem asset](self, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v19, "initWithString:entityType:", v21, CFSTR("LinkAsset"));

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    v35 = 0;
    v23 = dispatch_semaphore_create(0);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __78__WFPhotoMediaContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
    v29 = &unk_24C4E0C90;
    v31 = buf;
    v24 = v23;
    v30 = v24;
    objc_msgSend(v18, "performQuery:completionHandler:", v22, &v26);
    v25 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v24, v25);
    +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v26, v27, v28, v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (void)copyStateToItem:(id)a3
{
  _QWORD *v5;

  objc_storeStrong((id *)a3 + 6, self->_preferredFileType);
  v5 = a3;
  v5[7] = self->_library;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFPhotoMediaContentItem asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash") ^ 0xC842;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFPhotoMediaContentItem *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFPhotoMediaContentItem *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFPhotoMediaContentItem asset](self, "asset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFPhotoMediaContentItem asset](v4, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("AVAsset"));
  if (!(_DWORD)v6)
  {
    v15 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
    }
    else
    {
      v16 = 0;
    }
    v17 = v16;

    objc_msgSend(v17, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("PHLivePhoto")))
    {

    }
    else
    {
      WFLivePhotoFileType();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v15, "conformsToUTType:", v19);

      if (!v20)
      {
        v23 = v15;
        if (v4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v24 = v23;
          else
            v24 = 0;
        }
        else
        {
          v24 = 0;
        }
        v25 = v24;

        objc_msgSend(v25, "string");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v25) = objc_msgSend(v26, "isEqualToString:", CFSTR("CLLocation"));
        if ((_DWORD)v25)
        {
          -[WFPhotoMediaContentItem location](self, "location");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v27 != 0;

          goto LABEL_18;
        }
        if (!objc_msgSend(v23, "isEqualToClass:", objc_opt_class()))
        {
          v29.receiver = self;
          v29.super_class = (Class)WFPhotoMediaContentItem;
          v14 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v29, sel_canGenerateRepresentationForType_, v23);
          goto LABEL_18;
        }
        -[WFPhotoMediaContentItem asset](self, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "creationDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v28 != 0;

        goto LABEL_17;
      }
    }
    -[WFPhotoMediaContentItem isLivePhoto](self, "isLivePhoto");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v21, "BOOLValue");
LABEL_17:

    goto LABEL_18;
  }
  v8 = (void *)MEMORY[0x24BDBCF20];
  -[WFPhotoMediaContentItem assetRepresentationTypes](self, "assetRepresentationTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(getAVURLAssetClass(), "audiovisualTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "intersectsSet:", v13);

LABEL_18:
  return v14;
}

- (id)fullSizeAssetResourcesInResources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "if_objectsPassingTest:", &__block_literal_global_257);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v5;
  else
    v6 = v4;
  v7 = v6;

  -[WFPhotoMediaContentItem isLivePhoto](self, "isLivePhoto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_259);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }

  return v7;
}

- (id)assetRepresentationTypes
{
  id PHAssetResourceClass;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  PHAssetResourceClass = getPHAssetResourceClass();
  -[WFPhotoMediaContentItem asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PHAssetResourceClass, "assetResourcesForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count")
    || (-[WFPhotoMediaContentItem asset](self, "asset"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "uniformTypeIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v6))
  {
    -[WFPhotoMediaContentItem fullSizeAssetResourcesInResources:](self, "fullSizeAssetResourcesInResources:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_compactMap:", &__block_literal_global_261);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;

  return v9;
}

- (WFFileType)preferredFileType
{
  WFFileType *preferredFileType;
  objc_super v4;

  preferredFileType = self->_preferredFileType;
  if (preferredFileType)
    return preferredFileType;
  v4.receiver = self;
  v4.super_class = (Class)WFPhotoMediaContentItem;
  -[WFContentItem preferredFileType](&v4, sel_preferredFileType);
  return (WFFileType *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFPhotoMediaContentItem;
  -[WFContentItem intermediaryTypesForCoercionToItemClass:](&v10, sel_intermediaryTypesForCoercionToItemClass_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVAsset"), CFSTR("AVFoundation"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5) && (Class)objc_opt_class() == a3)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v8 = objc_msgSend(v6, "indexOfObject:", v5);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "moveObjectsAtIndexes:toIndex:", v9, 0);

    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)outputTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFFileType *preferredFileType;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BEC14A0];
  -[WFPhotoMediaContentItem assetRepresentationTypes](self, "assetRepresentationTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "typesFromStrings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithArray:", v5);
  v10.receiver = self;
  v10.super_class = (Class)WFPhotoMediaContentItem;
  -[WFContentItem outputTypes](&v10, sel_outputTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionOrderedSet:", v7);

  preferredFileType = self->_preferredFileType;
  if (preferredFileType)
    objc_msgSend(v6, "insertObject:atIndex:", preferredFileType, 0);

  return v6;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v5 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", *MEMORY[0x24BEC1728]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItem cachingIdentifier](self, "cachingIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentAttributionSet attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:](WFContentAttributionSet, "attributionSetWithAppDescriptor:disclosureLevel:originalItemIdentifier:", v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)library
{
  return self->_library;
}

- (void)setLibrary:(int64_t)a3
{
  self->_library = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFileType, 0);
}

uint64_t __51__WFPhotoMediaContentItem_assetRepresentationTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniformTypeIdentifier");
}

uint64_t __61__WFPhotoMediaContentItem_fullSizeAssetResourcesInResources___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL8 v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "type");
  v6 = objc_msgSend(v4, "type");

  v7 = (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v8 = !v7;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return -1;
  else
    return v8;
}

BOOL __61__WFPhotoMediaContentItem_fullSizeAssetResourcesInResources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "type");
  return v2 == 10 || (unint64_t)(v2 - 5) < 2;
}

void __78__WFPhotoMediaContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFAppIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315650;
    v21 = "-[WFPhotoMediaContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v20, 0x20u);

  }
  objc_msgSend(v5, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a5;
  if (v16)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithData:scale:allowAnimated:", v16, 0, 1.0);
    v9 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v9 + 16))(v9, v8, v10, 0);

  }
  else
  {
    getPHImageErrorKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "preferredFileType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "conformsToUTType:", *MEMORY[0x24BDF82D8]);

      if (v13)
      {
        v14 = (void *)objc_opt_class();
        WFLocalizedString(CFSTR("a video was provided instead of an image"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "badCoercionErrorWithReasonString:", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v6 + 16))(v6, v9, v7, 0);
  }
  else
  {
    getPHImageErrorKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v8);

  }
}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v6 + 16))(v6, v9, v7, 0);
  }
  else
  {
    getPHImageErrorKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v8);

  }
}

void __64__WFPhotoMediaContentItem_generateAVAsset_networkAccessAllowed___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  v7 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, _QWORD))(v7 + 16))(v7, v10, v8, 0);
  }
  else
  {
    getPHImageErrorKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v9);

  }
}

void __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    objc_msgSend(a2, "videoComplement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v7, *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v8;
    v12 = objc_msgSend(v9, "writeToBundleAtURL:error:", v11, &v15);
    v13 = v15;

    if ((v12 & 1) != 0)
    {
      +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v11, 1, *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v13 = v8;
  }

}

void __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;

  v6 = a2;
  v5 = a3;
  if (!(v6 | v5))
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v8 = a3;
  v9 = a5;
  if (v19
    && (objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "conformsToType:", *(_QWORD *)(a1 + 32)),
        v10,
        (v11 & 1) != 0))
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithData:ofType:proposedFilename:](WFFileRepresentation, "fileWithData:ofType:proposedFilename:", v19, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getPHImageErrorKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v15, v17);

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 48);
    getPHImageErrorKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v14);
  }

}

void __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  if (v13)
  {
    getAVURLAssetClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFFileRepresentation fileWithURL:options:ofType:proposedFilename:](WFFileRepresentation, "fileWithURL:options:ofType:proposedFilename:", v9, 5, 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v12, 0);

    }
    else
    {
      +[WFContentItem itemWithObject:](WFAVAssetContentItem, "itemWithObject:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "getFileRepresentation:forType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__WFPhotoMediaContentItem_retrieveAssetResource_withNetworkAccess_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, a2);
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *MEMORY[0x24BDBCBE0];
    v12[0] = *MEMORY[0x24BDBCBF0];
    v12[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "resourceValuesForKeys:error:", v5, 0);

    v7 = (void *)MEMORY[0x24BEC14A0];
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniformTypeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typeWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v8, 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "imageManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_2;
  v5[3] = &unk_24C4DB918;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "requestImageDataAndOrientationForAsset:options:resultHandler:", v3, v4, v5);

}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (v12)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithPlatformImage:", v12);
  }
  else
  {
    getPHImageErrorKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_6;
    }
    v6 = 0;
  }
  v9 = *(_QWORD *)(a1 + 40);
  getPHImageErrorKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v6, v11);

LABEL_6:
}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:", a2);
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 32);
  getPHImageErrorKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, a2, v9);

}

uint64_t __37__WFPhotoMediaContentItem_photoTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isPhotoType:", a2);
}

void __53__WFPhotoMediaContentItem_metadataIfLocallyAvailable__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  CGImageSource *v10;
  CGImageSource *v11;
  CFDictionaryRef v12;
  uint64_t v13;
  void *v14;
  const __CFData *data;

  data = a2;
  v8 = a3;
  v9 = a5;
  if (data)
  {
    v10 = CGImageSourceCreateWithData(data, 0);
    if (v10)
    {
      v11 = v10;
      v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      CFRelease(v11);
    }
  }

}

void __40__WFPhotoMediaContentItem_getFrameRate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v10 = (_QWORD *)getAVMediaTypeVideoSymbolLoc_ptr;
  v24 = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    v11 = AVFoundationLibrary();
    v10 = dlsym(v11, "AVMediaTypeVideo");
    v22[3] = (uint64_t)v10;
    getAVMediaTypeVideoSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v21, 8);
  if (v10)
  {
    objc_msgSend(v7, "tracksWithMediaType:", *v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nominalFrameRate");
    v15 = v14;

    v16 = *(_QWORD *)(a1 + 32);
    LODWORD(v17) = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v18, 0);

LABEL_7:
    return;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFPhotoMediaContentItem.m"), 65, CFSTR("%s"), dlerror());

  __break(1u);
}

void __39__WFPhotoMediaContentItem_getMetadata___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  CGImageSource *v10;
  CGImageSource *v11;
  CFDictionaryRef v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFData *data;

  data = a2;
  v8 = a3;
  v9 = a5;
  if (data && (v10 = CGImageSourceCreateWithData(data, 0)) != 0)
  {
    v11 = v10;
    v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    CFRelease(v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    getPHImageErrorKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v17);

  }
}

+ (id)itemWithAssetIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:", a3, 0, 0);
}

+ (id)itemWithAssetIdentifier:(id)a3 assetFile:(id)a4
{
  return (id)objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:nameIfKnown:", a3, 0, a4, 0);
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4
{
  return (id)objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:", a3, a4, 0);
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5
{
  return (id)objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:nameIfKnown:", a3, a4, a5, 0);
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6
{
  return (id)objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:nameIfKnown:attributionSet:cachingIdentifier:", a3, a4, a5, a6, 0, 0);
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6 attributionSet:(id)a7 cachingIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id PHAssetClass;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v14)
  {
    objc_msgSend(a1, "fetchOptionsForLibrary:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PHAssetClass = getPHAssetClass();
    v37[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PHAssetClass, "fetchAssetsWithLocalIdentifiers:options:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v22, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "itemWithObject:named:attributionSet:cachingIdentifier:", v23, v16, v17, v18);
      v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setLibrary:", a4);
      if (!v15)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v15, "wfType");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v24[6];
      v24[6] = v25;

      v30 = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "wfType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setFileRepresentations:forType:", v27, v28);

    }
    else
    {
      getWFGeneralLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "+[WFPhotoMediaContentItem itemWithAssetIdentifier:library:assetFile:nameIfKnown:attributionSet:cachingIdentifier:]";
        v33 = 2112;
        v34 = v14;
        v35 = 2048;
        v36 = a4;
        _os_log_impl(&dword_20BBAD000, v27, OS_LOG_TYPE_DEFAULT, "%s No PHAsset found for asset identifier: %@, library: %li", buf, 0x20u);
      }
      v24 = 0;
    }

    goto LABEL_10;
  }
  v24 = 0;
LABEL_11:

  return v24;
}

+ (id)itemsWithBurstIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  void *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "fetchOptionsForLibrary:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setIncludeAssetSourceTypes:", 7);
    objc_msgSend(v6, "setIncludeAllBurstAssets:", 1);
    objc_msgSend(v6, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v8);

    v9 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(getPHAssetClass(), "fetchAssetsWithBurstIdentifier:options:", v4, v6, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "itemWithObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
  }
  else
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "+[WFPhotoMediaContentItem itemsWithBurstIdentifier:]";
      _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)fetchOptionsForLibrary:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[WFSharedPhotoLibrary sharedLibrary](WFSharedPhotoLibrary, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "fetchOptionsWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "+[WFPhotoMediaContentItem fetchOptionsForLibrary:]";
      v12 = 2048;
      v13 = a3;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for library: %li, error: %@", buf, 0x20u);
    }

  }
  objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v5, "setIncludeGuestAssets:", 1);

  return v5;
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v14, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.mobileslideshow.asset.localidentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("library"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:nameIfKnown:attributionSet:cachingIdentifier:", v15, objc_msgSend(v16, "integerValue"), v18, v13, v12, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  +[WFContentLibraryFiltering getItemsMatchingQuery:withInput:resultHandler:](WFPhotoLibraryFiltering, "getItemsMatchingQuery:withInput:resultHandler:", a3, a4, a6);
}

+ (id)photoAlbums
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint8_t v34[128];
  _BYTE buf[24];
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass;
  v32 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getPHPhotoLibraryClass_block_invoke;
    v36 = &unk_24C4E3118;
    v37 = &v29;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)buf);
    v2 = (void *)v30[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v29, 8);
  if (objc_msgSend(v3, "authorizationStatus") != 3)
    return 0;
  +[WFSharedPhotoLibrary sharedLibrary](WFSharedPhotoLibrary, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v4, "fetchOptionsWithError:", &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;

  if (v19)
  {
    objc_msgSend(v19, "setWantsIncrementalChangeDetails:", 0);
    v5 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(getPHAssetCollectionClass(), "fetchAssetCollectionsWithType:subtype:options:", 1, 0x7FFFFFFFFFFFFFFFLL, v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v18);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v7);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(getPHAssetCollectionClass(), "fetchAssetCollectionsWithType:subtype:options:", 2, 0x7FFFFFFFFFFFFFFFLL, v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if (objc_msgSend(v14, "assetCollectionSubtype", v18) == 209)
          {
            objc_msgSend(v5, "insertObject:atIndex:", v14, 0);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "assetCollectionSubtype"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(&unk_24C512440, "containsObject:", v15);

            if ((v16 & 1) == 0)
              objc_msgSend(v5, "addObject:", v14);
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      }
      while (v11);
    }
  }
  else
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[WFPhotoMediaContentItem photoAlbums]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)propertyBuilders
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _QWORD v98[5];
  _QWORD v99[5];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[22];

  v104[20] = *MEMORY[0x24BDAC8D0];
  WFLocalizedContentPropertyNameMarkerWithContext(CFSTR("Album"), (uint64_t)CFSTR("Image Content Item"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_549, v97, objc_opt_class());
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "multipleValues:", 1);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v98[0] = MEMORY[0x24BDAC760];
  v98[1] = 3221225472;
  v98[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_147;
  v98[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v98[4] = a1;
  objc_msgSend(v95, "possibleValuesGetter:", v98);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v94;
  WFLocalizedContentPropertyNameMarker(CFSTR("Width"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("width"), v93, objc_opt_class());
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v92;
  WFLocalizedContentPropertyNameMarker(CFSTR("Height"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("height"), v91, objc_opt_class());
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v90;
  WFLocalizedContentPropertyNameMarker(CFSTR("Date Taken"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("asset.creationDate"), v89, objc_opt_class());
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "tense:", 1);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "timeUnits:", 8220);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "comparableUnits:", 8220);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v85;
  WFLocalizedContentPropertyNameMarker(CFSTR("Time Taken"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("asset.creationDate"), v84, objc_opt_class());
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "tense:", 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "timeUnits:", 224);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "comparableUnits:", 224);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "gettable:", 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v79;
  WFLocalizedContentPropertyNameMarker(CFSTR("Media Type"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("mediaType"), v78, objc_opt_class());
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  WFPhotoLibraryPossibleMediaTypes();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "possibleValues:", v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v104[5] = v75;
  WFLocalizedContentPropertyNameMarker(CFSTR("Photo Type"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("photoTypes"), v74, objc_opt_class());
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  WFPhotoLibraryPossiblePhotoTypes();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "possibleValues:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "multipleValues:", 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "sortable:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v104[6] = v69;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is a Screenshot"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isScreenshot"), v67, objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not a Screenshot"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "negativeName:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Photo"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "singularItemName:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v104[7] = v62;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is a Screen Recording"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isScreenRecording"), v60, objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not a Screen Recording"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "negativeName:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Video"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "singularItemName:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v104[8] = v55;
  WFLocalizedContentPropertyNameMarker(CFSTR("Location"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = 0;
  v101 = &v100;
  v102 = 0x2050000000;
  v4 = (void *)getCLLocationClass_softClass;
  v103 = getCLLocationClass_softClass;
  if (!getCLLocationClass_softClass)
  {
    v99[0] = v3;
    v99[1] = 3221225472;
    v99[2] = __getCLLocationClass_block_invoke;
    v99[3] = &unk_24C4E3118;
    v99[4] = &v100;
    __getCLLocationClass_block_invoke((uint64_t)v99);
    v4 = (void *)v101[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v100, 8);
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("location"), v54, v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v104[9] = v53;
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("duration"), v52, objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "timeUnits:", 224);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v104[10] = v50;
  WFLocalizedContentPropertyNameMarker(CFSTR("Frame Rate"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_185, v49, objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "irrational:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v104[11] = v47;
  WFLocalizedContentPropertyNameMarker(CFSTR("Orientation"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("orientation"), v46, objc_opt_class());
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  WFImagePossibleOrientationStrings();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "possibleValues:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sortable:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v104[12] = v42;
  WFLocalizedContentPropertyNameMarker(CFSTR("Camera Make"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("make"), v41, objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sortable:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "filterable:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v104[13] = v38;
  WFLocalizedContentPropertyNameMarker(CFSTR("Camera Model"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("model"), v37, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sortable:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "filterable:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v104[14] = v34;
  WFLocalizedContentPropertyNameMarker(CFSTR("Metadata Dictionary"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_195, v33, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "sortable:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "filterable:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v104[15] = v30;
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Favorite"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("isFavorite"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Favorite"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "negativeName:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Photo"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "singularItemName:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v104[16] = v23;
  WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("asset.creationDate"), v22, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userInfo:", CFSTR("WFFileCreationDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tense:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeUnits:", 8444);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v104[17] = v18;
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Modified Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder keyPath:name:class:](WFContentPropertyBuilder, "keyPath:name:class:", CFSTR("asset.modificationDate"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userInfo:", CFSTR("WFFileModificationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tense:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeUnits:", 8444);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v104[18] = v10;
  WFLocalizedContentPropertyNameMarker(CFSTR("File Size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentPropertyBuilder block:name:class:](WFContentPropertyBuilder, "block:name:class:", &__block_literal_global_208, v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userInfo:", CFSTR("WFFileSizeProperty"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortable:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterable:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v104[19] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 20);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)remoteItemWithAssetIdentifier:(id)a3 named:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = CFSTR("com.apple.mobileslideshow.asset.localidentifier");
  v13[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "itemWithSerializedItem:forType:named:attributionSet:cachingIdentifier:", v9, 0, v7, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("AVAsset"));
  if ((v6 & 1) != 0)
    goto LABEL_14;
  v8 = v4;
  if (v4)
  {
    objc_opt_class();
    v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("CLLocation"));
  if ((v10 & 1) != 0 || (objc_msgSend(v8, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
LABEL_14:
    v12 = 1;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFPhotoMediaContentItem;
    v12 = objc_msgSendSuper2(&v14, sel_supportedTypeMustBeDeterminedByInstance_, v8);
  }

  return v12;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("PHAsset"), CFSTR("Photos"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ownedPasteboardTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.mobileslideshow.asset.localidentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Photo media (singular)"), CFSTR("Photo media"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Photo media (plural)"), CFSTR("Photo media"));
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVAsset"), CFSTR("AVFoundation"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("AVPlayerItem"), CFSTR("AVFoundation"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("PHLivePhoto"), CFSTR("Photos"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEC14A0];
  WFLivePhotoFileType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "typeWithUTType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("CLLocation"), CFSTR("CoreLocation"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClass:](WFObjectType, "typeWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)localizedFilterDescription
{
  return WFLocalizedStringWithKey(CFSTR("Photo (singular)"), CFSTR("Photo"));
}

+ (id)localizedPluralFilterDescription
{
  return WFLocalizedString(CFSTR("Photos"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Photos"));
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return a3 == 0;
}

id __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_147(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "photoAlbums");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_compactMap:", &__block_literal_global_149);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_8;
  v7[3] = &unk_24C4E2420;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getPreferredFileSize:", v7);

}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  WFFileSize *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[WFFileSize initWithByteCount:]([WFFileSize alloc], "initWithByteCount:", a2);
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);

}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_6;
  v7[3] = &unk_24C4DE198;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getMetadata:", v7);

}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_24C4DB7F0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a2, "getFrameRate:", v7);

}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wfName");
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id PHAssetCollectionClass;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  +[WFSharedPhotoLibrary sharedLibrary](WFSharedPhotoLibrary, "sharedLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "fetchOptionsWithError:", &v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v27;

  if (v9)
  {
    objc_msgSend(v9, "setWantsIncrementalChangeDetails:", 0);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    PHAssetCollectionClass = getPHAssetCollectionClass();
    objc_msgSend(v5, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PHAssetCollectionClass, "fetchAssetCollectionsContainingAsset:withType:options:", v12, 1, v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v14)
    {
      v15 = v14;
      v22 = v5;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "wfName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "wfName");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v20);

          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v15);
      v21 = v7;
      v5 = v22;
    }
    else
    {
      v21 = v7;
    }
  }
  else
  {
    getWFGeneralLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "+[WFPhotoMediaContentItem propertyBuilders]_block_invoke";
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
    }
    v21 = 0;
  }

  ((void (**)(id, void *))v6)[2](v6, v21);
}

- (BOOL)getListSubtitle:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v4 = (void (**)(id, uint64_t))a3;
  -[WFPhotoMediaContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mediaType");
  switch(v6)
  {
    case 3:
      v8 = CFSTR("Audio");
      break;
    case 2:
      v8 = CFSTR("Video");
      break;
    case 1:
      WFLocalizedStringWithKey(CFSTR("Photo (media type)"), CFSTR("Photo"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      v8 = CFSTR("Unknown");
      break;
  }
  WFLocalizedString(v8);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v9 = (void *)v7;
  if (v4)
    v4[2](v4, v7);

  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  _QWORD v14[4];
  id v15;
  CGAffineTransform v16;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screenScale");
    v10 = v9;

    CGAffineTransformMakeScale(&v16, v10, v10);
    v11 = height * v16.c + v16.a * width;
    v12 = height * v16.d + v16.b * width;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __68__WFPhotoMediaContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v14[3] = &unk_24C4E0020;
    v15 = v7;
    -[WFPhotoMediaContentItem getThumbnail:ofSize:](self, "getThumbnail:ofSize:", v14, v11, v12);

  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v4 = (void (**)(id, void *))a3;
  -[WFPhotoMediaContentItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "mediaType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[WFPhotoMediaContentItem asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duration");
    WFChooseFromListFormatPlaybackDuration(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  if (v4)
LABEL_5:
    v4[2](v4, v8);
LABEL_6:

  return 1;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

uint64_t __68__WFPhotoMediaContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
