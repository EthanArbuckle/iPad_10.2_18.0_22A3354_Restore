@implementation ICAttachmentMovieModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_VIDEOS_%lu"), CFSTR("NOTE_LIST_VIDEOS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)hasThumbnailImage
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentMovieModel;
  if (!-[ICAttachmentModel hasThumbnailImage](&v9, sel_hasThumbnailImage))
    return 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWidth");
  if (v4 <= 0.0)
  {
    v7 = 0;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeHeight");
    v7 = v6 > 0.0;

  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  CGSize result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = &unk_1BDC8BD37;
  v14 = *MEMORY[0x1E0C9D820];
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ICAttachmentMovieModel_intrinsicContentSize__block_invoke;
  v9[3] = &unk_1E76C7730;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

void __46__ICAttachmentMovieModel_intrinsicContentSize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeHeight");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v6;

}

- (void)updateAttachmentSize
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C8B3C0];
    -[ICAttachmentModel attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_safeURLAssetWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0C8A808];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke;
    v14[3] = &unk_1E76CCBA8;
    v14[4] = self;
    v15 = v10;
    v12 = v10;
    objc_msgSend(v12, "loadTracksWithMediaType:completionHandler:", v11, v14);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICAttachmentMovieModel;
    -[ICAttachmentModel updateAttachmentSize](&v13, sel_updateAttachmentSize);
  }
}

void __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke_2;
    v9[3] = &unk_1E76C7708;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = v6;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v5, "performBlock:", v9);

  }
}

void __46__ICAttachmentMovieModel_updateAttachmentSize__block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double Seconds;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CMTime time;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  objc_msgSend(*(id *)(a1 + 32), "naturalSize");
  v3 = v2;
  v5 = v4;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "preferredTransform");
    v7 = *((double *)&v34 + 1);
    v8 = *(double *)&v34;
    v9 = *((double *)&v35 + 1);
    v10 = *(double *)&v35;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v9 = 0.0;
    v7 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
  }
  v11 = v5 * v9 + v7 * v3;
  v12 = round(fabs(v5 * v10 + v8 * v3));
  v13 = round(fabs(v11));
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeWidth");
  v16 = v15;

  v17 = v16 != v12;
  if (v16 != v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSizeWidth:", v12);

  }
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeHeight");
  v21 = v20;

  if (v21 != v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSizeHeight:", v13);

    v17 = 1;
  }
  v23 = *(void **)(a1 + 48);
  if (v23)
    objc_msgSend(v23, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "duration");
  v27 = v26;

  if (v27 == Seconds)
  {
    if (!v17)
      return;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDuration:", Seconds);

  }
  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "updateChangeCountWithReason:", CFSTR("Updated attachment size"));

  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "managedObjectContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "ic_save");

  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentDidChangeSizeNotification"));

}

- (id)asset
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5
    && (-[ICAttachmentModel attachment](self, "attachment"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "typeUTI"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = +[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v7),
        v7,
        v6,
        v8))
  {
    v9 = (void *)MEMORY[0x1E0C8B3C0];
    -[ICAttachmentModel attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "media");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_safeURLAssetWithURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  return 1;
}

- (id)placeholderImageSystemName
{
  return CFSTR("photo.tv");
}

- (double)placeholderWidth
{
  return 540.0;
}

- (double)placeholderHeight
{
  return 460.0;
}

- (void)updateFileBasedAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentMovieModel;
  -[ICAttachmentModel updateFileBasedAttributes](&v3, sel_updateFileBasedAttributes);
  -[ICAttachmentMovieModel updateAttachmentSize](self, "updateAttachmentSize");
}

- (void)addLocation
{
  void *v3;
  void *v4;
  int v5;
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
  void *v17;
  id v18;
  double v19;
  double v20;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C8B3C0];
    -[ICAttachmentModel attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_safeURLAssetWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C8B220];
    objc_msgSend(v10, "commonMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadataItemsFromArray:withKey:keySpace:", v12, *MEMORY[0x1E0C8AAC8], *MEMORY[0x1E0C8A9E8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0.0;
      v20 = 0.0;
      if (objc_msgSend(v16, "scanDouble:", &v20))
      {
        if (objc_msgSend(v16, "scanDouble:", &v19))
        {
          -[ICAttachmentModel attachment](self, "attachment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (id)objc_msgSend(v17, "addLocationWithLatitude:longitude:", v20, v19);

        }
      }

    }
  }
}

@end
