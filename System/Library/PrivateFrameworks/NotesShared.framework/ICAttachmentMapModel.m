@implementation ICAttachmentMapModel

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_MAP_LOCATIONS_%lu"), CFSTR("NOTE_LIST_MAP_LOCATIONS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 1;
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (id)MKMapItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("map_item_data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
    v19 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v19);
    v7 = v19;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ICAttachmentMapModel MKMapItem].cold.2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    }
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v15 = (void *)getMKMapItemClass_softClass;
    v24 = getMKMapItemClass_softClass;
    if (!getMKMapItemClass_softClass)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getMKMapItemClass_block_invoke;
      v20[3] = &unk_1E76C77A8;
      v20[4] = &v21;
      __getMKMapItemClass_block_invoke((uint64_t)v20);
      v15 = (void *)v22[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v21, 8);
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v16, *MEMORY[0x1E0CB2CD0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)addLocation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ICAttachmentLocation newAttachmentLocationForAttachment:](ICAttachmentLocation, "newAttachmentLocationForAttachment:", v3);
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v4);

  -[ICAttachmentMapModel MKMapItem](self, "MKMapItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v11, "placemark");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocationFromPlacemark:", v9);
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocationFromURL:", v10);

  }
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  *a3 = CFSTR("a");
  v8 = objc_retainAutorelease(v7);
  *a4 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("href=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return objc_msgSend(a3, "appearanceType") == 0;
}

- (void)MKMapItem
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error creating unarchiver: %@", a5, a6, a7, a8, 2u);
}

@end
