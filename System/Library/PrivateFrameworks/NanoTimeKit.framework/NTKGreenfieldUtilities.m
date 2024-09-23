@implementation NTKGreenfieldUtilities

+ (id)temporaryGreenfieldDirectory
{
  if (temporaryGreenfieldDirectory_onceToken != -1)
    dispatch_once(&temporaryGreenfieldDirectory_onceToken, &__block_literal_global_93);
  return (id)temporaryGreenfieldDirectory_tempDir;
}

void __54__NTKGreenfieldUtilities_temporaryGreenfieldDirectory__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(v7, "containsString:", CFSTR("com.apple.NanoTimeKit.GreenfieldDecodingService"));
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    v4 = temporaryGreenfieldDirectory_tempDir;
    temporaryGreenfieldDirectory_tempDir = (uint64_t)v2;
    v3 = (void *)v4;
  }
  else
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.watchface"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)temporaryGreenfieldDirectory_tempDir;
    temporaryGreenfieldDirectory_tempDir = v5;

  }
}

+ (id)temporaryGreenfieldNoBordersSnapshotPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);
  return v6;
}

+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 completionBlock:(id)a4
{
  objc_msgSend(a1, "generateFacePreviewImageFromDraftRecipe:borderType:completionBlock:", a3, 1, a4);
}

+ (void)generateFacePreviewImageFromDraftRecipe:(id)a3 borderType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "encodeQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke;
  v13[3] = &unk_1E6BD4350;
  v16 = a1;
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "faceForSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_snapshotFace:borderType:", v3, *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke_2;
  v7[3] = &unk_1E6BCE3C8;
  v5 = *(id *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __93__NTKGreenfieldUtilities_generateFacePreviewImageFromDraftRecipe_borderType_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (void)encodeRecipeFromDraftRecipe:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "encodeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke;
  block[3] = &unk_1E6BD4378;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "_queue_encodeDraftRecipe:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_2;
  block[3] = &unk_1E6BCE3C8;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

+ (id)_queue_encodeDraftRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  UIImage *v17;
  UIImage *v18;
  double v19;
  double v20;
  BOOL v21;
  UIImage *v22;
  UIImage *v23;
  double v24;
  double v25;
  NTKGreenfieldEncodedRecipe *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  char v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NTKGreenfieldEncodedRecipe *v75;
  UIImage *v76;
  UIImage *v77;
  UIImage *image;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "faceForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tempPathOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a1, "temporaryGreenfieldDirectory");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(a1, "_queue_snapshotFace:borderType:", v5, 0);
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || ((-[UIImage size](v10, "size"),
         v14 = *MEMORY[0x1E0C9D820],
         v13 = *(double *)(MEMORY[0x1E0C9D820] + 8),
         v15 == *MEMORY[0x1E0C9D820])
      ? (v16 = v12 == v13)
      : (v16 = 0),
        v16))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to generate snapshot without border for face: %@, faceWithoutBorderImage:%@"), v5, v11);
    v26 = 0;
    goto LABEL_62;
  }
  objc_msgSend(a1, "_addGreyBorderToWatchFaceImage:", v11);
  v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17 || ((-[UIImage size](v17, "size"), v20 == v14) ? (v21 = v19 == v13) : (v21 = 0), v21))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to generate snapshot image with grey border for face: %@, faceWithGreyBorderImage:%@"), v5, v18);
    v26 = 0;
    goto LABEL_61;
  }
  objc_msgSend(a1, "_addGenericDeviceBorderToWatchFaceImage:includesTransparentPadding:", v11, 0);
  v22 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22 || (-[UIImage size](v22, "size"), v25 == v14) && v24 == v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to generate snapshot image with device border for face: %@, faceWithDeviceBorderImage:%@"), v5, v23);
    v26 = 0;
    goto LABEL_60;
  }
  objc_msgSend(a1, "_greenfieldWatchFaceJsonForFace:", v5);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v80 = a1;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "removeItemAtPath:error:", v30, 0);
  v95 = 0;
  v83 = v27;
  objc_msgSend(v27, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v95);
  v31 = v95;
  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to create the directory at path: %@ error: %@"), v30, v31);
    v32 = (void *)v30;
    v81 = 0;
    v26 = 0;
    goto LABEL_59;
  }
  v76 = v11;
  image = v18;
  v79 = (void *)v30;
  v77 = v23;
  v74 = v9;
  v86 = (void *)objc_opt_new();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v4, "slotToSampleTemplateMapping");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "allKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  v85 = v4;
  if (!v35)
    goto LABEL_35;
  v36 = v35;
  v37 = *(_QWORD *)v92;
  do
  {
    for (i = 0; i != v36; ++i)
    {
      if (*(_QWORD *)v92 != v37)
        objc_enumerationMutation(v34);
      v39 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
      objc_msgSend(v5, "complicationForSlot:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v4, "slotToSampleTemplateMapping");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKey:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v4 = v85;
LABEL_32:
        objc_msgSend(v86, "setObject:forKey:", v41, v39);
        goto LABEL_33;
      }
      +[NTKGreenfieldDraftRecipe templateForComplicationAtSlot:face:](NTKGreenfieldDraftRecipe, "templateForComplicationAtSlot:face:", v39, v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41 && objc_msgSend(v4, "canShareTemplate:slot:", v41, v39))
        goto LABEL_32;
LABEL_33:

    }
    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
  }
  while (v36);
LABEL_35:

  objc_msgSend(v4, "slotToItemIdMapping");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "slotToBundleIdMapping");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "_metadataDictForWatchFace:slotToSampleTemplateMapping:slotToItemIdMapping:slotToBundleIdMapping:watchFaceDataPath:", v5, v86, v43, v44, v30);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to encode the metadata."));
  v90 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v84, 0, &v90);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v90;
  v11 = v76;
  v23 = v77;
  v18 = image;
  if (v47)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to encode the face dict into json string: error: %@"), v47);
  UIImagePNGRepresentation(image);
  v26 = (NTKGreenfieldEncodedRecipe *)objc_claimAutoreleasedReturnValue();
  v4 = v85;
  v75 = v26;
  if (v26)
  {
    UIImagePNGRepresentation(v77);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      UIImagePNGRepresentation(v76);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        v71 = v45;
        v72 = v46;
        v89 = v47;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v45, 0, &v89);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v89;

        if (v49)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to encode the metadata json dict into NSData with error: %@"), v49);
        v69 = v49;
        objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("snapshot.png"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NTKGreenfieldEncodedRecipe writeToFile:atomically:](v26, "writeToFile:atomically:", v50, 1);

        objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("no_borders_snapshot.png"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "writeToFile:atomically:", v51, 1);

        objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("face.json"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "writeToFile:atomically:", v52, 1);

        objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("metadata.json"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v48;
        objc_msgSend(v48, "writeToFile:atomically:", v53, 1);

        v9 = v74;
        if (objc_msgSend(v5, "shouldIncludeResourceDirectoryForSharing"))
        {
          objc_msgSend(v79, "stringByAppendingPathComponent:", CFSTR("Resources"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v54;
            _os_log_impl(&dword_1B72A3000, v55, OS_LOG_TYPE_DEFAULT, "Preparing resource directory for sharing: '%@'", buf, 0xCu);
          }

          v88 = 0;
          v56 = objc_msgSend(v5, "createResourceDirectorySuitableForSharingAtPath:error:", v54, &v88);
          v57 = v88;
          if ((v56 & 1) == 0)
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to prepare resource directory for sharing at path: %@ error: %@"), v54, v57);

        }
        v68 = (void *)objc_opt_new();
        objc_msgSend(v68, "zippedDataForPath:", v79);
        v58 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "removeItemAtPath:error:", v79, 0);
        v59 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "faceSharingName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "stringWithFormat:", CFSTR("%@.watchface"), v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = (void *)v58;
        objc_msgSend(v74, "stringByAppendingPathComponent:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = 0;
        objc_msgSend(v62, "writeToURL:options:error:", v64, 0, &v87);
        v65 = v87;
        if (v65)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to write .watchFace file to disk with error: %@"), v65);
        objc_msgSend(v5, "faceSharingName");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[NTKGreenfieldEncodedRecipe initWithWatchFaceDataUrl:watchFaceImage:watchFaceName:]([NTKGreenfieldEncodedRecipe alloc], "initWithWatchFaceDataUrl:watchFaceImage:watchFaceName:", v64, v76, v66);

        v47 = v69;
        v4 = v85;
        v23 = v77;
        v18 = image;
        v45 = v71;
        v46 = v72;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to convert into NSData, faceWithoutBorderImage:%@"), v76);
        v26 = 0;
        v9 = v74;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to convert into NSData faceWithDeviceBorderImage:%@"), v77);
      v26 = 0;
      v9 = v74;
    }
    v81 = v47;

  }
  else
  {
    v81 = v47;
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesEncodingException"), CFSTR("Failed to convert into NSData faceWithGreyBorderImage:%@"), image);
    v9 = v74;
  }

  v32 = v79;
  v31 = 0;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
  return v26;
}

+ (id)_queue_snapshotFace:(id)a3 borderType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_time_t v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  _QWORD *v38;
  uint64_t *v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD aBlock[4];
  id v49;
  _QWORD *v50;
  id v51;
  uint64_t v52;
  _QWORD v53[3];
  char v54;
  _BYTE buf[24];
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  NTKFaceSnapshotter *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "encodeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v54 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke;
  aBlock[3] = &unk_1E6BD43A0;
  v50 = v53;
  v51 = a1;
  v9 = v6;
  v49 = v9;
  v52 = 20;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__28;
  v46 = __Block_byref_object_dispose__28;
  v47 = 0;
  v11 = dispatch_semaphore_create(0);
  +[NTKFaceSnapshotter defaultModernSnapshotOptions](NTKFaceSnapshotter, "defaultModernSnapshotOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E6C9EEC0, CFSTR("NTKSnapshotPriorityKey"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("NTKSnapshotPersistableKey"));
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ willSnapshot.", buf, 0xCu);
  }

  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_86;
  v35[3] = &unk_1E6BD43C8;
  v15 = v9;
  v36 = v15;
  v38 = v53;
  v39 = &v42;
  v40 = a1;
  v41 = a4;
  v16 = v11;
  v37 = v16;
  v17 = _Block_copy(v35);
  if (objc_msgSend(v15, "faceStyle") == 21 || objc_msgSend(v15, "faceStyle") == 221)
  {
    +[NTKFaceSnapshotClient sharedInstance](NTKFaceSnapshotClient, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_89;
    v33[3] = &unk_1E6BD0150;
    v34 = v17;
    objc_msgSend(v18, "snapshotFace:options:completion:", v15, v13, v33);

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v56 = __Block_byref_object_copy__28;
    v57 = __Block_byref_object_dispose__28;
    v58 = objc_alloc_init(NTKFaceSnapshotter);
    v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_2;
    v30[3] = &unk_1E6BD43F0;
    v31 = v17;
    v32 = buf;
    objc_msgSend(v19, "provideSnapshotOfFace:options:completion:", v15, v13, v30);

    v8 = MEMORY[0x1E0C809B0];
    _Block_object_dispose(buf, 8);

  }
  v20 = dispatch_time(0, 20000000000);
  dispatch_semaphore_wait(v16, v20);
  v10[2](v10);
  v21 = a1;
  objc_sync_enter(v21);
  v22 = (id)v43[5];
  objc_sync_exit(v21);

  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ result: %@", buf, 0x16u);
  }

  if (v22)
  {
    v24 = objc_alloc(MEMORY[0x1E0DC3828]);
    objc_msgSend(v22, "size");
    v25 = (void *)objc_msgSend(v24, "initWithSize:");
    v28[0] = v8;
    v28[1] = 3221225472;
    v28[2] = __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_92;
    v28[3] = &unk_1E6BD2F50;
    v26 = v22;
    v29 = v26;
    objc_msgSend(v25, "imageWithActions:", v28);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v53, 8);
  return v22;
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  NSObject *v4;

  v2 = *(id *)(a1 + 48);
  objc_sync_enter(v2);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_sync_exit(v2);

  if (!v3)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_cold_1(a1, v4);

  }
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "_queue_snapshotFace: %@ didReceiveSnapshot: %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = *(id *)(a1 + 64);
  objc_sync_enter(v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 64), "addBorder:toWatchFaceImage:", *(_QWORD *)(a1 + 72), v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_sync_exit(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_92(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  CGContext *CurrentContext;
  id v14;
  CGContext *v15;
  CGContext *v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGContext *v20;
  id v21;
  CGRect v22;

  v21 = a2;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFill");

  objc_msgSend(*(id *)(a1 + 32), "size");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v8, "screenCornerRadius");
    objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v5, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CurrentContext = UIGraphicsGetCurrentContext();
    v14 = objc_retainAutorelease(v12);
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v14, "CGPath"));
    v15 = UIGraphicsGetCurrentContext();
    CGContextClip(v15);

  }
  v16 = (CGContext *)objc_msgSend(v21, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "size");
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v22.size.height = v19;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v18;
  CGContextFillRect(v16, v22);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v20 = UIGraphicsGetCurrentContext();
  CGContextResetClip(v20);

}

+ (id)_greenfieldWatchFaceJsonForFace:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "deepCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearMetrics");
  objc_msgSend(v3, "prepareForSharing");
  objc_msgSend(v3, "greenfieldJSONObjectRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_metadataDictForWatchFace:(id)a3 slotToSampleTemplateMapping:(id)a4 slotToItemIdMapping:(id)a5 slotToBundleIdMapping:(id)a6 watchFaceDataPath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke;
  v39[3] = &unk_1E6BCF558;
  v31 = v13;
  v40 = v31;
  v20 = v14;
  v41 = v20;
  v21 = v18;
  v42 = v21;
  objc_msgSend(v12, "enumerateComplicationSlotsWithBlock:", v39);
  v22 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(a1, "_updateSystemDeletableAppItemIdForSlotToItemIdMapping:face:", v22, v12);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("complication_sample_templates"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("complications_item_ids"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("complications_bundle_ids"));

  v23 = (void *)objc_opt_new();
  v33 = v19;
  v34 = 3221225472;
  v35 = __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke_2;
  v36 = &unk_1E6BCF4C8;
  v24 = v12;
  v37 = v24;
  v25 = v23;
  v38 = v25;
  objc_msgSend(v24, "enumerateComplicationSlotsWithBlock:", &v33);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("complications_names"));
  objc_msgSend(v24, "createSharingMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v17, "setObject:forKey:", v26, CFSTR("watchface_metadata"), v31, v33, v34, v35, v36, v37);
  objc_msgSend(v17, "setObject:forKey:", &unk_1E6C9EED8, CFSTR("version"), v31);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "sizeClass"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v29, CFSTR("device_size"));

  }
  return v17;
}

void __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("complicationData"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);

    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "JSONObjectRepresentationWritingResourcesToBundlePath:purpose:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 || objc_msgSend(0, "count"))
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v11);

  }
}

void __140__NTKGreenfieldUtilities__metadataDictForWatchFace_slotToSampleTemplateMapping_slotToItemIdMapping_slotToBundleIdMapping_watchFaceDataPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "complicationForSlot:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedSectionHeaderName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v4);

}

+ (id)createXPCServiceConnection
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.NanoTimeKit.GreenfieldDecodingService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E88550);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_unzipWatchfaceFromURL_withSandboxExtension_writeSandboxExtension_completionBlock_, 0, 1);
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

+ (BOOL)validateFaceType:(id)a3 faceBundleId:(id)a4
{
  id v5;
  NTKFaceDescriptor *v6;
  BOOL v7;
  NTKFaceDescriptor *v8;
  NTKFaceDescriptor *v9;
  void *v10;
  uint64_t v12;

  v5 = a4;
  v12 = -1;
  NTKFaceBundleGetFaceStyleFromString(a3, &v12);
  if (v12 == -1)
    goto LABEL_5;
  if (v12 != 44)
  {
    v8 = [NTKFaceDescriptor alloc];
    v6 = -[NTKFaceDescriptor initWithFaceStyle:](v8, "initWithFaceStyle:", v12);
    goto LABEL_7;
  }
  if (!v5)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_11;
  }
  v6 = -[NTKFaceDescriptor initWithBundleIdentifier:]([NTKFaceDescriptor alloc], "initWithBundleIdentifier:", v5);
LABEL_7:
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKFaceDescriptor isAvailableForDevice:](v9, "isAvailableForDevice:", v10))
    v7 = -[NTKFaceDescriptor isAvailableForDevice:](v9, "isAvailableForDevice:", v10);
  else
    v7 = 0;

LABEL_11:
  return v7;
}

+ (void)migrateComplicationsOnFace:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[NTKBundleComplicationFaceMigrator sharedInstance](NTKBundleComplicationFaceMigrator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "migrateComplicationsOnFace about to migrate face %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__NTKGreenfieldUtilities_migrateComplicationsOnFace___block_invoke;
  v8[3] = &unk_1E6BCE828;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "migrateFace:completion:", v3, v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __53__NTKGreenfieldUtilities_migrateComplicationsOnFace___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)decodeWatchFaceFromUrl:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "encodeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke;
  block[3] = &unk_1E6BD4378;
  v12 = v6;
  v13 = v7;
  v14 = a1;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  uint64_t *v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  NSObject *v65;
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (v2)
  {
    v3 = objc_msgSend(v2, "startAccessingSecurityScopedResource");
    objc_msgSend(objc_retainAutorelease(a1[4]), "fileSystemRepresentation");
    v4 = sandbox_extension_issue_file();
    objc_msgSend(a1[6], "temporaryGreenfieldDirectory");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = sandbox_extension_issue_file();

    objc_msgSend(a1[6], "createXPCServiceConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject resume](v7, "resume");
    v8 = dispatch_semaphore_create(0);
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__28;
    v62 = __Block_byref_object_dispose__28;
    v63 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__28;
    v56 = __Block_byref_object_dispose__28;
    v57 = 0;
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v68 = v10;
      v69 = 2112;
      v70 = v11;
      v71 = 2080;
      v72 = v4;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "[myConnection remoteObjectProxy] start decoding watch face from url: %@, scopedResource:%@, sandboxExtension: %s", buf, 0x20u);

    }
    -[NSObject remoteObjectProxy](v7, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[4];
    v14 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_114;
    v47[3] = &unk_1E6BD4418;
    v49 = &v52;
    v50 = &v58;
    v51 = v4;
    v15 = v8;
    v48 = v15;
    objc_msgSend(v12, "unzipWatchfaceFromURL:withSandboxExtension:writeSandboxExtension:completionBlock:", v13, v4, v6, v47);

    v16 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v15, v16);
    if (v53[5])
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v53[5], "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_3(v18, (uint64_t)buf, v17);
      }

      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_116;
      block[3] = &unk_1E6BD1738;
      v45 = a1[5];
      v46 = &v52;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else if (v59[5])
    {
      objc_msgSend((id)objc_opt_class(), "_decodeFaceFromDataPath:", v59[5]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v41[0] = v14;
        v41[1] = 3221225472;
        v41[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_117;
        v41[3] = &unk_1E6BCE3C8;
        v43 = a1[5];
        v42 = v20;
        dispatch_async(MEMORY[0x1E0C80D38], v41);

        v21 = v43;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 0, CFSTR("Recipe must not be nil"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v14;
        v38[1] = 3221225472;
        v38[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_3;
        v38[3] = &unk_1E6BCE3C8;
        v34 = a1[5];
        v39 = v33;
        v40 = v34;
        v21 = v33;
        dispatch_async(MEMORY[0x1E0C80D38], v38);

      }
    }
    else
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);

      objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 6, CFSTR("Decoding service timed out."));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v14;
      v35[1] = 3221225472;
      v35[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_124;
      v35[3] = &unk_1E6BCE3C8;
      v31 = a1[5];
      v36 = v30;
      v37 = v31;
      v32 = v30;
      dispatch_async(MEMORY[0x1E0C80D38], v35);

    }
    if ((_DWORD)v3)
      objc_msgSend(a1[4], "stopAccessingSecurityScopedResource");

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not load url %@"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2;
    v64[3] = &unk_1E6BD00B0;
    v65 = v19;
    v66 = a1[5];
    v7 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v64);

    v15 = v65;
  }

}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 5, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 56);
    v15 = 138412802;
    v16 = v5;
    v17 = 2080;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "[myConnection remoteObjectProxy] completion block called with url: %@, sandboxExtension: %s, extractionError: %@", (uint8_t *)&v15, 0x20u);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_117(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_2_121(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

+ (id)unzipWatchFaceFileAtUrl:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  id v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "temporaryGreenfieldDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v18);
  v11 = v18;
  if (v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to create path at %@ with error %@"), v10, v11);
  v17 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", v10, &v17);
  v12 = v17;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[NTKUnzipUtilities unzipFile:toPath:](NTKUnzipUtilities, "unzipFile:toPath:", v5, v13);

  v15 = 0;
  if (v14)
    v15 = v10;

  return v15;
}

+ (id)_decodeFaceFromDataPath:(id)a3
{
  void *v3;
  _BOOL4 v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  char v14;
  id v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NTKGreenfieldDecodedRecipe *v55;
  NTKGreenfieldDecodedRecipe *v56;
  NTKGreenfieldDecodedRecipe *v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  NTKGreenfieldDecodedRecipe *v69;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  void *v96;
  _QWORD v97[4];
  id v98;
  _QWORD block[4];
  NTKGreenfieldDecodedRecipe *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t *v114;
  id v115;
  _QWORD v116[4];
  NSObject *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  id v125;
  uint8_t buf[4];
  uint64_t v127;
  __int16 v128;
  NSObject *v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "stringByAppendingPathComponent:", CFSTR("metadata.json"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v90, "fileExistsAtPath:", v82) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to locate the metadata.json in path: %@"), v82);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v81, 0, 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, metadataDict is not dict %@, metadataPath: %@, url %@"), v89, v82, v93);
  objc_msgSend(v89, "objectForKey:", CFSTR("version"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to load the version number: %@"), v80);
  if ((unint64_t)objc_msgSend(v80, "integerValue") >= 3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Version number is not supported. File: %@ Current: %lu"), v80, 2);
  objc_msgSend(v93, "stringByAppendingPathComponent:", CFSTR("face.json"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v90, "fileExistsAtPath:", v88) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to locate the face.json in path: %@"), v88);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v88);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v79)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to create jsonWatchFaceData from file at path: %@"), v88);
  v125 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v79, 0, &v125);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v125;
  if (v75
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_msgSend(v85, "allValues"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count") == 0,
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to load face.json into dict: %@"), v88);
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = 0;
  v120 = &v119;
  v121 = 0x3032000000;
  v122 = __Block_byref_object_copy__28;
  v123 = __Block_byref_object_dispose__28;
  v124 = 0;
  v5 = dispatch_semaphore_create(0);
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke;
  v116[3] = &unk_1E6BD4440;
  v118 = &v119;
  v6 = v5;
  v117 = v6;
  +[NTKFace greenfieldFaceWithJSONObjectRepresentation:forDevice:withCompletion:](NTKFace, "greenfieldFaceWithJSONObjectRepresentation:forDevice:withCompletion:", v85, v78, v116);
  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  if (!v120[5])
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesIncompatibleDeviceException"), CFSTR("Face is nil.face path %@"), v88);
  objc_msgSend(v93, "stringByAppendingPathComponent:", CFSTR("Resources"));
  v8 = v89;
  v9 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "fileExistsAtPath:", v9))
  {
    if ((objc_msgSend(v90, "isReadableFileAtPath:", v9) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Could not read file at: %@"), v9);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NTKNewUniqueTeporaryResourceDirectory();
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v115 = 0;
    v14 = objc_msgSend(v90, "copyItemAtURL:toURL:error:", v10, v12, &v115);
    v15 = v115;
    if (v15)
      v16 = 0;
    else
      v16 = v14;
    if ((v16 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Could not copy file %@ to %@. Error: %@"), v9, v11, v15);

    v8 = v89;
    v6 = v13;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend((id)v120[5], "setResourceDirectory:", v11);
  objc_msgSend(v8, "objectForKey:", CFSTR("watchface_metadata"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, watchFaceMetadataDictionary is not dict %@, face.json: %@"), v17, v85);
  }
  objc_msgSend((id)v120[5], "handleSharingMetadata:", v17);
  v91 = (void *)objc_opt_new();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("complication_sample_templates"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, complicationSlotToTemplateStringMapping is not dict %@, face.json: %@"), v18, v85);
  }
  v73 = (void *)v11;
  v74 = (void *)v17;
  v71 = v6;
  v72 = (void *)v9;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("complications_item_ids"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, complicationSlotToItemIdMapping is not dict %@, face.json: %@"), v20, v85);
  }
  objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("complications_bundle_ids"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, complicationSlotToBundleIdMapping is not dict %@, face.json: %@"), v20, v85);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA70];
  }
  objc_msgSend((id)objc_opt_class(), "migrateComplicationsOnFace:", v120[5]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)v120[5];
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2;
  v109[3] = &unk_1E6BD4468;
  v114 = &v119;
  v92 = v18;
  v110 = v92;
  v24 = v22;
  v111 = v24;
  v87 = v21;
  v112 = v87;
  v86 = v20;
  v113 = v86;
  objc_msgSend(v23, "enumerateComplicationSlotsWithBlock:", v109);
  v76 = objc_msgSend(v24, "count");
  v25 = v24;
  v96 = v24;
  if (objc_msgSend(v24, "count"))
  {
    v26 = (void *)objc_msgSend(v87, "mutableCopy");
    objc_msgSend(v26, "removeObjectsForKeys:", v25);
    v94 = objc_msgSend(v26, "copy");

    v27 = (void *)objc_msgSend(v86, "mutableCopy");
    objc_msgSend(v27, "removeObjectsForKeys:", v96);
    v83 = objc_msgSend(v27, "copy");

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v28 = v96;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v106 != v30)
            objc_enumerationMutation(v28);
          v32 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i);
          v33 = (void *)v120[5];
          +[NTKComplication nullComplication](NTKComplication, "nullComplication");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setComplication:forSlot:", v34, v32);

        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v105, v131, 16);
      }
      while (v29);
    }

    v86 = (id)v83;
    v87 = (id)v94;
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  objc_msgSend(v92, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v102 != v37)
          objc_enumerationMutation(v35);
        v39 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
        if (objc_msgSend(v96, "containsObject:", v39))
        {
          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            goto LABEL_70;
          *(_DWORD *)buf = 138412290;
          v127 = (uint64_t)v39;
          v41 = v40;
          v42 = "Dropping template for slot '%@' as it doesn't have a complication anymore";
LABEL_62:
          _os_log_impl(&dword_1B72A3000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
          goto LABEL_70;
        }
        objc_msgSend((id)v120[5], "complicationForSlot:", v39);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "complicationType") == 56;

        if (v44)
        {
          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            goto LABEL_70;
          *(_DWORD *)buf = 138412290;
          v127 = (uint64_t)v39;
          v41 = v40;
          v42 = "Dropping template for slot '%@' as it contains an Apricot complication and we don't need a template";
          goto LABEL_62;
        }
        objc_msgSend(v92, "objectForKeyedSubscript:", v39);
        v40 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Cannot decode watch face, templateJSON is not a dictionary"));
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v93);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "URLByAppendingPathComponent:", CFSTR("complicationData"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "URLByAppendingPathComponent:", v39);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v47);
        objc_msgSend(MEMORY[0x1E0C94158], "complicationTemplateWithJSONObjectRepresentation:bundle:purpose:", v40, v48, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v127 = (uint64_t)v39;
            v128 = 2112;
            v129 = v40;
            _os_log_error_impl(&dword_1B72A3000, v50, OS_LOG_TYPE_ERROR, "Cannot decode template for slot:%@, dictionary:\n%@", buf, 0x16u);
          }

        }
        objc_msgSend(v91, "setObject:forKeyedSubscript:", v49, v39);

LABEL_70:
      }
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v101, v130, 16);
    }
    while (v36);
  }

  objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("complications_names"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_169);
  objc_msgSend(v93, "stringByAppendingPathComponent:", CFSTR("no_borders_snapshot.png"));
  v52 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v90, "fileExistsAtPath:", v52))
  {
    objc_msgSend(a1, "temporaryGreenfieldNoBordersSnapshotPath");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v90, "fileExistsAtPath:", v53))
      objc_msgSend(v90, "removeItemAtPath:error:", v53, 0);
    objc_msgSend(v90, "copyItemAtPath:toPath:error:", v52, v53, 0);
  }
  else
  {
    v53 = 0;
  }
  objc_msgSend(v89, "objectForKey:", CFSTR("device_size"));
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = [NTKGreenfieldDecodedRecipe alloc];
  v56 = -[NTKGreenfieldDecodedRecipe initWithWatchFace:complicationSlotToTemplateMapping:complicationSlotToItemIdMapping:complicationSlotToNameMapping:complicationSlotToBundleIdMapping:isUsingModifiedComplicationsSet:noBorderFacePreviewImagePath:senderBoxedDeviceSize:](v55, "initWithWatchFace:complicationSlotToTemplateMapping:complicationSlotToItemIdMapping:complicationSlotToNameMapping:complicationSlotToBundleIdMapping:isUsingModifiedComplicationsSet:noBorderFacePreviewImagePath:senderBoxedDeviceSize:", v120[5], v91, v86, v51, v87, v76 != 0, v53, v54);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2_173;
  block[3] = &unk_1E6BCD5F0;
  v57 = v56;
  v100 = v57;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v58 = objc_claimAutoreleasedReturnValue();
  v95 = (void *)v54;
  v84 = (void *)v52;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v127 = (uint64_t)v93;
    _os_log_impl(&dword_1B72A3000, v58, OS_LOG_TYPE_DEFAULT, "Decode service did start cleaning up files at path: %@.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v93);
  v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v59, "fileSystemRepresentation");
  v60 = sandbox_extension_issue_file();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v127 = v60;
    _os_log_impl(&dword_1B72A3000, v61, OS_LOG_TYPE_DEFAULT, "Decode service sandboxExtension is:%s.", buf, 0xCu);
  }

  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.NanoTimeKit.GreenfieldDecodingService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E88550);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_removeFileAtPath_withSandboxExtension_completionBlock_, 0, 1);
  objc_msgSend(v62, "setRemoteObjectInterface:", v63);
  objc_msgSend(v62, "resume");
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v127 = (uint64_t)v62;
    _os_log_impl(&dword_1B72A3000, v65, OS_LOG_TYPE_DEFAULT, "Decode service myConnection is:%@.", buf, 0xCu);
  }

  objc_msgSend(v62, "remoteObjectProxy");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_175;
  v97[3] = &unk_1E6BCE728;
  v67 = v93;
  v98 = v67;
  objc_msgSend(v66, "removeFileAtPath:withSandboxExtension:completionBlock:", v67, v60, v97);

  v68 = v98;
  v69 = v57;

  _Block_object_dispose(&v119, 8);
  return v69;
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "complicationForSlot:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "complicationForSlot:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complication");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(v4, "complicationType"))
    {
      if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "slot:supportsFamiliesOfComplications:", v3, v4) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[NTKGreenfieldSystemAppDeprecatedMappings isSystemAppDeprecatedBundleId:itemId:](NTKGreenfieldSystemAppDeprecatedMappings, "isSystemAppDeprecatedBundleId:itemId:", v7, v8);

        if (!v9)
          goto LABEL_14;
      }
      else
      {
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412546;
          v13 = v4;
          v14 = 2112;
          v15 = v3;
          _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Dropping unsupported complication '%@' in slot '%@'", (uint8_t *)&v12, 0x16u);
        }

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
LABEL_14:

}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKGreenfieldUtilitiesDecodingException"), CFSTR("Failed to load the complication names. The key and value must be string type. %@ %@"), v5, v4);

}

uint64_t __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_2_173(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "collectOverrideTemplates");
}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_175(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_175_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Decode service remove files at path:%@ succeed.", (uint8_t *)&v7, 0xCu);
  }

}

+ (void)generateFacePreviewImageFromUrl:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "encodeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NTKGreenfieldUtilities_generateFacePreviewImageFromUrl_completionBlock___block_invoke;
  block[3] = &unk_1E6BD4378;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __74__NTKGreenfieldUtilities_generateFacePreviewImageFromUrl_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_queue_greenfieldPreviewFromUrl:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = CFSTR("Failed to generate the image.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit"), -1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)_queue_greenfieldPreviewFromUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "unzipWatchFaceFileAtUrl:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("snapshot.png"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject contentsAtPath:](v9, "contentsAtPath:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:].cold.2();

      }
    }
    else
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:].cold.3();
      v12 = 0;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[NTKGreenfieldUtilities _queue_greenfieldPreviewFromUrl:].cold.1();
    v12 = 0;
  }

  return v12;
}

+ (id)addBorder:(unint64_t)a3 toWatchFaceImage:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;

  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NTKGreenfieldUtilities addBorder:toWatchFaceImage:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_10;
  }
  objc_msgSend(v6, "size");
  v10 = v9;
  v11 = v8;
  if (v9 == 0.0 || v8 == 0.0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[NTKGreenfieldUtilities addBorder:toWatchFaceImage:].cold.2(v13, v10, v11);
LABEL_10:

    a1 = 0;
    goto LABEL_16;
  }
  switch(a3)
  {
    case 0uLL:
      v12 = v7;
      goto LABEL_15;
    case 1uLL:
      objc_msgSend(a1, "_addGreyBorderToWatchFaceImage:", v7);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2uLL:
      v21 = a1;
      v22 = v7;
      v23 = 0;
      goto LABEL_14;
    case 3uLL:
      v21 = a1;
      v22 = v7;
      v23 = 1;
LABEL_14:
      objc_msgSend(v21, "_addGenericDeviceBorderToWatchFaceImage:includesTransparentPadding:", v22, v23);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      a1 = v12;
      break;
    default:
      break;
  }
LABEL_16:

  return a1;
}

+ (id)_addGreyBorderToWatchFaceImage:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGContext *CurrentContext;
  id v12;
  CGContext *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGContext *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGSize v27;
  CGRect v28;
  CGRect v29;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  objc_msgSend(v3, "size", _LayoutConstants_23(&v21));
  v5 = v4 * *(double *)&v21;
  objc_msgSend(v3, "size");
  v7 = v6;
  objc_msgSend(v3, "size");
  v9 = v7 + v5 - v8;
  v28.size.width = v5 * *((double *)&v22 + 1);
  v28.size.height = v9 + v5 * *((double *)&v22 + 1) - v5;
  v28.origin.x = (v5 - v5 * *((double *)&v22 + 1)) * 0.5;
  v28.origin.y = (v9 - v28.size.height) * 0.5;
  v29 = CGRectInset(v28, *(double *)&v23 * 0.5, *(double *)&v23 * 0.5);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height, *((double *)&v21 + 1) * *((double *)&v23 + 1) * CGRectGetHeight(v29));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27.width = v5;
  v27.height = v9;
  UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
  objc_msgSend(v10, "setLineWidth:", *(double *)&v22);
  objc_msgSend(v10, "fill");
  CurrentContext = UIGraphicsGetCurrentContext();
  v12 = objc_retainAutorelease(v10);
  CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(v12, "CGPath"));
  v13 = UIGraphicsGetCurrentContext();
  CGContextClip(v13);
  objc_msgSend(v3, "size");
  v15 = (v5 - v14) * 0.5;
  objc_msgSend(v3, "size");
  objc_msgSend(v3, "drawAtPoint:", v15, (v9 - v16) * 0.5);

  v17 = UIGraphicsGetCurrentContext();
  CGContextResetClip(v17);
  NTKCOutlineColor(0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStroke");
  objc_msgSend(v12, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v19;
}

+ (id)_addGenericDeviceBorderToWatchFaceImage:(id)a3 includesTransparentPadding:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;

  v4 = a4;
  v5 = a3;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice", _LayoutConstants_23(&v44));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceCategory") - 1;
  if (v7 > 4)
    v8 = CFSTR("email_sharing_luxo");
  else
    v8 = off_1E6BD45D8[v7];
  NTKImageNamed(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0DC3828]);
  objc_msgSend(v9, "size");
  v11 = (void *)objc_msgSend(v10, "initWithSize:");
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke;
  v35[3] = &unk_1E6BD44D0;
  v13 = v9;
  v36 = v13;
  v14 = v5;
  v37 = v14;
  v40 = v46;
  v41 = v47;
  v42 = v48;
  v43 = v49;
  v38 = v44;
  v39 = v45;
  objc_msgSend(v11, "imageWithActions:", v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4)
  {
    v17 = *(double *)&v49;
    objc_msgSend(v15, "size");
    v19 = v18 + v17 * 2.0;
    v20 = *((double *)&v49 + 1);
    objc_msgSend(v16, "size");
    v22 = v21 + v20 * 2.0;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v19, v22);
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke_2;
    v25[3] = &unk_1E6BD44F8;
    v27 = v19;
    v28 = v22;
    v26 = v16;
    v31 = v46;
    v32 = v47;
    v33 = v48;
    v34 = v49;
    v29 = v44;
    v30 = v45;
    objc_msgSend(v23, "imageWithActions:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

uint64_t __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 5, *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 96), *(double *)(a1 + 104), 1.0);
}

uint64_t __93__NTKGreenfieldUtilities__addGenericDeviceBorderToWatchFaceImage_includesTransparentPadding___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  CGContext *v6;
  CGRect v8;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v3, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFill");

  v6 = (CGContext *)objc_msgSend(v4, "CGContext");
  v8.size.width = *(CGFloat *)(a1 + 40);
  v8.size.height = *(CGFloat *)(a1 + 48);
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  CGContextFillRect(v6, v8);
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(a1 + 136), *(double *)(a1 + 144));
}

+ (id)encodeQueue
{
  if (encodeQueue_onceToken != -1)
    dispatch_once(&encodeQueue_onceToken, &__block_literal_global_192);
  return (id)encodeQueue_encodeQueue;
}

void __37__NTKGreenfieldUtilities_encodeQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.NanoTimeKit.Greenfield.queue", 0, v2);
  v1 = (void *)encodeQueue_encodeQueue;
  encodeQueue_encodeQueue = (uint64_t)v0;

}

+ (BOOL)shouldAutoDismissViewControllerForAddFaceFlow:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)_companionAppIdFromWatchAppBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8858], "sharedDeviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nrDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__28;
  v20 = __Block_byref_object_dispose__28;
  v21 = 0;
  v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke;
  v12[3] = &unk_1E6BD4540;
  v8 = v3;
  v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v4, "fetchApplicationOnPairedDevice:withBundleID:completion:", v6, v8, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(a2, "companionAppBundleID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (void)_updateSystemDeletableAppItemIdForSlotToItemIdMapping:(id)a3 face:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_semaphore_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  dispatch_semaphore_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  NSObject *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  NSObject *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke;
  v54[3] = &unk_1E6BD4568;
  v9 = v6;
  v55 = v9;
  v10 = v7;
  v56 = v10;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v54);
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v10;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Pending processing sadSlotToAppIdMapping: %@", buf, 0xCu);
  }

  v12 = (void *)MEMORY[0x1E0C99E20];
  v41 = v10;
  objc_msgSend(v10, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0CF9CA8];
  objc_msgSend(v14, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryForBundleIDs:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = dispatch_semaphore_create(0);
  v50[0] = v8;
  v50[1] = 3221225472;
  v50[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_204;
  v50[3] = &unk_1E6BD4590;
  v42 = v15;
  v51 = v42;
  v20 = v14;
  v52 = v20;
  v21 = v19;
  v53 = v21;
  v40 = v18;
  objc_msgSend(v18, "executeQueryWithResultHandler:", v50);
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  v39 = v20;
  if (objc_msgSend(v20, "count"))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v20;
      _os_log_impl(&dword_1B72A3000, v22, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldUtilities) Started SAD ItemID lookup %@:", buf, 0xCu);
    }

    v23 = dispatch_semaphore_create(0);
    v24 = (void *)MEMORY[0x1E0CF9CA0];
    objc_msgSend(v20, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v8;
    v47[1] = 3221225472;
    v47[2] = __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_207;
    v47[3] = &unk_1E6BD45B8;
    v48 = v42;
    v26 = v23;
    v49 = v26;
    objc_msgSend(v24, "lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:withResultHandler:", v25, v47);

    v37 = v26;
    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v37 = v21;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v9, "orderedComplicationSlots", v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  v29 = v41;
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(v27);
        v33 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "isEqualToNumber:", &unk_1E6C9EEF0))
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v42, "objectForKeyedSubscript:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, v33);

            v29 = v41;
          }

        }
      }
      v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v30);
  }

}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "isEqualToNumber:", &unk_1E6C9EEF0))
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Found itemID == 0 for slot: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v5);

  }
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "executeQueryWithResultHandler: %@ %@", buf, 0x16u);
  }
  v20 = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "storeItemID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14 && (int)objc_msgSend(v14, "intValue") >= 1)
        {
          v16 = *(void **)(a1 + 32);
          objc_msgSend(v13, "bundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

          v18 = *(void **)(a1 + 40);
          objc_msgSend(v13, "bundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObject:", v19);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_207(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_207_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "(NTKGreenfieldUtilities) Completed SAD ItemID lookup finished with result %@:", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v5, "allKeys", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v13);

        }
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)shouldPresentUnreleasedFeaturesInternalWarningForFace:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (!NTKInternalBuild(v3, v4))
    goto LABEL_5;
  if ((objc_msgSend(v3, "shouldPresentAlertForSharingUnreleasedFace") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__NTKGreenfieldUtilities_shouldPresentUnreleasedFeaturesInternalWarningForFace___block_invoke;
    v7[3] = &unk_1E6BCFCE8;
    v8 = v3;
    v9 = &v10;
    objc_msgSend(v8, "enumerateComplicationSlotsWithBlock:", v7);

LABEL_5:
    v5 = *((_BYTE *)v11 + 24) != 0;
    goto LABEL_6;
  }
  v5 = 1;
LABEL_6:
  _Block_object_dispose(&v10, 8);

  return v5;
}

void __80__NTKGreenfieldUtilities_shouldPresentUnreleasedFeaturesInternalWarningForFace___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  +[NTKGreenfieldDraftRecipe templateForComplicationAtSlot:face:](NTKGreenfieldDraftRecipe, "templateForComplicationAtSlot:face:", a2, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "considersUISensitivitySensitive:", objc_msgSend(v8, "uiSensitivity"));

    v5 = v8;
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }
  }

}

void __70__NTKGreenfieldUtilities_encodeRecipeFromDraftRecipe_completionBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "Encode failed reason: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __57__NTKGreenfieldUtilities__queue_snapshotFace_borderType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  v7 = v4;
  objc_msgSend(v6, "JSONObjectRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v4;
  v11 = 2048;
  v12 = v5;
  v13 = 2112;
  v14 = v8;
  _os_log_fault_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_FAULT, "GreenfieldFaceSnapshotTimout: Failed to generate snapshot for a %@ face within %lu sec. Face: %@", (uint8_t *)&v9, 0x20u);

}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "Decoding service timed out", a5, a6, a7, a8, 0);
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "Decode failed reason: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __65__NTKGreenfieldUtilities_decodeWatchFaceFromUrl_completionBlock___block_invoke_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a3, (uint64_t)a3, "unzipWatchfaceFromURL path is nil, error: %@", (uint8_t *)a2);

}

void __50__NTKGreenfieldUtilities__decodeFaceFromDataPath___block_invoke_175_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Decode service remove files at path:%@ failed with error: %@.", v1);
  OUTLINED_FUNCTION_1();
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = 0;
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, v1, "Failed to unzip file url %@ at path: %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "Failed to load snapshot.png file at path: %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)_queue_greenfieldPreviewFromUrl:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "Failed to locate snapshot.png file at path: %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)addBorder:(uint64_t)a3 toWatchFaceImage:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "cannot add border to nil watch face image", a5, a6, a7, a8, 0);
}

+ (void)addBorder:(double)a3 toWatchFaceImage:.cold.2(NSObject *a1, double a2, double a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromCGSize(*(CGSize *)&a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a1, v5, "cannot add border to watch face image with invalid size %@", v6);

}

void __62__NTKGreenfieldUtilities__companionAppIdFromWatchAppBundleId___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1B72A3000, v0, (uint64_t)v0, "Failed to fetch watch app with %@ error %@", v1);
  OUTLINED_FUNCTION_1();
}

void __85__NTKGreenfieldUtilities__updateSystemDeletableAppItemIdForSlotToItemIdMapping_face___block_invoke_207_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, v0, v1, "(NTKGreenfieldUtilities) Completed SAD ItemID lookup finished with error %@:", v2);
  OUTLINED_FUNCTION_1();
}

@end
