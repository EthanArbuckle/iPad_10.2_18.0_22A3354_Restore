@implementation ICAttachmentDrawingModel(UI)

- (uint64_t)genericListThumbnailCreator
{
  return 0;
}

- (uint64_t)genericBrickThumbnailCreator
{
  return 0;
}

- (void)saveDrawing:()UI withImage:forImageDrawing:
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  CGAffineTransform v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  CGAffineTransform v133;
  CGAffineTransform v134;
  CGAffineTransform v135;
  _QWORD block[5];
  _BYTE v137[128];
  _BYTE v138[128];
  uint64_t v139;
  CGRect v140;
  CGRect v141;

  v139 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a1, "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBounds:", v12, v14, v16, v18);

  LOWORD(v19) = objc_msgSend(v8, "orientation");
  objc_msgSend(a1, "attachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setOrientation:", (__int16)v19);

  objc_msgSend(a1, "attachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "save:", 0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICAttachmentDrawingModel_UI__saveDrawing_withImage_forImageDrawing___block_invoke;
  block[3] = &unk_1E5C1D540;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(a1, "drawing");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "mergeWithDrawing:", v8);

  if (v24 == 2)
  {
    objc_msgSend(a1, "setMergeableDataDirty:", 1);
    objc_msgSend(a1, "attachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "attachmentDidChange");

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "drawing");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "visibleCommands");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleCommands");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToOrderedSet:", v28);

  v30 = os_log_create("com.apple.notes", "Sketching");
  v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (v29)
  {
    if (v31)
      -[ICAttachmentDrawingModel(UI) saveDrawing:withImage:forImageDrawing:].cold.1(v30, v32, v33, v34, v35, v36, v37, v38);

    objc_msgSend(a1, "attachment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "modificationDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setPreviewUpdateDate:", v40);

  }
  else
  {
    if (v31)
      -[ICAttachmentDrawingModel(UI) saveDrawing:withImage:forImageDrawing:].cold.2(v30, v32, v33, v34, v35, v36, v37, v38);

    +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "generatePreviewIfNeededForAttachment:", v40);
  }

  objc_msgSend(a1, "attachment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v9)
  {
    objc_msgSend(v10, "serializeWithPathData:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v9, 1, v44, 0, 1.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = objc_msgSend(v46, "BOOLForKey:", *MEMORY[0x1E0D63720]);

    if ((_DWORD)v44)
    {
      objc_msgSend(a1, "attachment");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (int)objc_msgSend(v47, "orientation");

      objc_msgSend(a1, "attachment");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "bounds");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;

      v58 = (void *)MEMORY[0x1E0D63AF0];
      objc_msgSend(MEMORY[0x1E0D63AF0], "defaultSize");
      objc_msgSend(v58, "fullSize:forOrientation:", v48);
      v60 = v59;
      v62 = v61;
      objc_msgSend(v9, "size");
      v64 = v63;
      v66 = v65;
      memset(&v135, 0, sizeof(v135));
      objc_msgSend(a1, "drawing");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v67;
      if (v67)
        objc_msgSend(v67, "orientationTransform");
      else
        memset(&v135, 0, sizeof(v135));

      objc_msgSend(MEMORY[0x1E0D63AF0], "fullSize:forOrientation:", v48, v64, v66);
      v70 = v69;
      v72 = v71;
      v133 = v135;
      CGAffineTransformInvert(&v134, &v133);
      v140.origin.x = v51;
      v140.origin.y = v53;
      v140.size.width = v55;
      v140.size.height = v57;
      v141 = CGRectApplyAffineTransform(v140, &v134);
      objc_msgSend(v9, "ic_imageFromRect:", v70 / v60 * v141.origin.x, v72 / v62 * v141.origin.y, v70 / v60 * v141.size.width, v72 / v62 * v141.size.height);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "ic_JPEGDataWithOrientation:", v48);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "writeFallbackImageData:", v74);

    }
    if (!v45)
    {
      +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "generatePreviewIfNeededForAttachment:", v115);
      goto LABEL_42;
    }
    v118 = v10;
    v119 = v8;
    v76 = v9;
    objc_msgSend(v45, "setVersion:", (__int16)objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion"));
    objc_msgSend(a1, "drawingDocument");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "maxDocumentVersion");
    objc_msgSend(v45, "setVersionOutOfDate:", v78 > objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion"));

    memset(&v135, 0, sizeof(v135));
    objc_msgSend(a1, "previewImageOrientationTransform");
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "deviceInfoScalable:", 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v130;
      v121 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v122 = *MEMORY[0x1E0C9BAA8];
      v120 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v130 != v83)
            objc_enumerationMutation(v80);
          v85 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
          objc_msgSend(v85, "imageSize");
          v87 = v86;
          objc_msgSend(v85, "scale");
          objc_msgSend(v76, "ic_scaledImageMinDimension:scale:", v87, v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_OWORD *)&v133.a = v122;
          *(_OWORD *)&v133.c = v121;
          *(_OWORD *)&v133.tx = v120;
          v128 = v135;
          objc_msgSend(MEMORY[0x1E0D63A30], "orientedImage:withTransform:background:backgroundTransform:", v89, &v133, 2, &v128);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend(a1, "attachment");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "scale");
            v92 = (id)objc_msgSend(v91, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v90, 1, 0, 0);

          }
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
      }
      while (v82);
    }

    objc_msgSend(v76, "size");
    v93 = *MEMORY[0x1E0D63D88];
    if (v94 > *MEMORY[0x1E0D63D88] || (objc_msgSend(v76, "size"), v95 > v93))
    {
      objc_msgSend(v76, "ic_scaledImageMaxDimension:scale:", v93, 1.0);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachment");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (id)objc_msgSend(v97, "updateAttachmentPreviewImageWithImage:scale:scaleWhenDrawing:metadata:sendNotification:", v96, 1, 0, 0, 1.0);

    }
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    objc_msgSend(a1, "attachment");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "previewImages");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(v100, "copy");

    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v124, v137, 16);
    v10 = v118;
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v125;
      do
      {
        for (j = 0; j != v103; ++j)
        {
          if (*(_QWORD *)v125 != v104)
            objc_enumerationMutation(v101);
          v106 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
          objc_msgSend(v106, "modifiedDate");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = objc_msgSend(v107, "compare:", v123);

          if (v108 == -1)
          {
            objc_msgSend(a1, "attachment");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "removePreviewImagesObject:", v106);

            objc_msgSend(a1, "attachment");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "managedObjectContext");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "deleteObject:", v106);

          }
        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v124, v137, 16);
      }
      while (v103);
    }

    objc_msgSend(a1, "attachment");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = (id)objc_msgSend(v112, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D63660]);

    v8 = v119;
    v9 = v76;
  }
  else
  {
    objc_msgSend(v42, "deleteAttachmentPreviewImages");

  }
  objc_msgSend(a1, "attachment");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "managedObjectContext");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "shortLoggingDescription");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "ic_saveWithLogDescription:", CFSTR("Saving drawing preview images for %@"), v117);

LABEL_42:
}

- (id)imageForActivityItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
    objc_msgSend(v4, "attachmentPreviewImageWithMinSize:scale:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "orientedImageWithBackground:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (ICAttachmentDrawingActivityItemSource)activityItem
{
  ICAttachmentDrawingActivityItemSource *v2;
  void *v3;
  ICAttachmentDrawingActivityItemSource *v4;

  v2 = [ICAttachmentDrawingActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);

  return v4;
}

- (id)activityItems
{
  uint64_t v2;
  void *v3;
  void *v4;
  ICAttachmentActivityItemSource *v5;
  void *v6;
  ICAttachmentActivityItemSource *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityItem");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICAttachmentActivityItemSource initWithAttachment:](v5, "initWithAttachment:", v6);
  objc_msgSend(v4, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)providerDataTypes
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "previewImageTypeUTI");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)providerFileTypes
{
  void *v1;
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "previewImageTypeUTI");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)fileURLForTypeIdentifier:()UI
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "previewImageTypeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
    objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "orientedPreviewImageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)dataForTypeIdentifier:()UI
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(a1, "previewImageTypeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(a1, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
    objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPasswordProtected");

    if (v10)
    {
      objc_msgSend(a1, "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAuthenticated");

      if (v12)
      {
        objc_msgSend(v8, "decryptedImageData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v8, "orientedPreviewImageURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dataWithContentsOfURL:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)attributesForSharingHTMLWithTagName:()UI textContent:
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

  *a3 = CFSTR("img");
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "orientedImageWithBackground:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ic_JPEGData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mimeTypeFromUTI:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"),
      v11,
      v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (uint64_t)canConvertToHTMLForSharing
{
  return 1;
}

- (void)drawPreviewInRect:()UI
{
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double x;
  double y;
  double width;
  double height;
  CGContext *CurrentContext;
  id v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  objc_msgSend(a1, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
  objc_msgSend(v10, "attachmentPreviewImageWithMinSize:scale:");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "orientedImageWithBackground:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "size");
    if (v13 > 0.0)
    {
      objc_msgSend(v12, "size");
      if (v14 > 0.0 && a4 > 0.0 && a5 > 0.0)
      {
        objc_msgSend(v12, "size");
        v16 = v15;
        objc_msgSend(v12, "size");
        v18 = a4 / (v16 / v17);
        objc_msgSend(a1, "drawing");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bounds");
        v21 = v20;
        objc_msgSend(a1, "drawing");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fullBounds");
        v24 = v21 * (a4 / v23);

        v31.origin.x = 0.0;
        v31.origin.y = 0.0;
        v31.size.width = a4;
        v31.size.height = v18;
        v32 = CGRectOffset(v31, a2, a3 - v24);
        x = v32.origin.x;
        y = v32.origin.y;
        width = v32.size.width;
        height = v32.size.height;
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        v33.origin.x = a2;
        v33.origin.y = a3;
        v33.size.width = a4;
        v33.size.height = a5;
        CGContextClipToRect(CurrentContext, v33);
        objc_msgSend(v12, "drawInRect:", x, y, width, height);
        CGContextRestoreGState(CurrentContext);
      }
    }
  }

}

- (void)saveDrawing:()UI withImage:forImageDrawing:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Drawing set image up-to-date", a5, a6, a7, a8, 0);
}

- (void)saveDrawing:()UI withImage:forImageDrawing:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AC7A1000, a1, a3, "Drawing set image not up-to-date", a5, a6, a7, a8, 0);
}

@end
