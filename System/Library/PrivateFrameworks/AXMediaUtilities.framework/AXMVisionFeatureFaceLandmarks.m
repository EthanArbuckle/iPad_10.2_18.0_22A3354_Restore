@implementation AXMVisionFeatureFaceLandmarks

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureFaceLandmarks)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureFaceLandmarks *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXMVisionFeatureFaceLandmarks;
  v5 = -[AXMVisionFeatureFaceLandmarks init](&v16, sel_init);
  if (v5)
  {
    -[AXMVisionFeatureFaceLandmarks setIs3DLandmarks:](v5, "setIs3DLandmarks:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AXMVisionFeatureFaceLandmarksIs3DLandmarks")));
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("AXMVisionFeatureFaceLandmarksResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3710];
    v9 = objc_opt_class();
    AXMSecureCodingClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v8, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:", v7, v9, v10, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    if (v12)
    {
      AXMediaLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_DEFAULT, "Error decoding face landmark dict: %@", buf, 0xCu);
      }

    }
    else
    {
      -[AXMVisionFeatureFaceLandmarks setResults:](v5, "setResults:", v11);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionFeatureFaceLandmarks is3DLandmarks](self, "is3DLandmarks"), CFSTR("AXMVisionFeatureFaceLandmarksIs3DLandmarks"));
  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[AXMVisionFeatureFaceLandmarks results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v8)
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXMVisionFeatureFaceLandmarks encodeWithCoder:].cold.1((uint64_t)v8, v9);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AXMVisionFeatureFaceLandmarksResults"));

}

- (AXMVisionFeatureFaceLandmarks)initWithVisionFaceLandmarks:(id)a3
{
  id v4;
  AXMVisionFeatureFaceLandmarks *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AXMVisionFeatureFaceLandmarks;
  v5 = -[AXMVisionFeatureFaceLandmarks init](&v33, sel_init);
  if (v5)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v6 = (void *)getVNFaceLandmarks2DClass_softClass;
    v38 = getVNFaceLandmarks2DClass_softClass;
    if (!getVNFaceLandmarks2DClass_softClass)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __getVNFaceLandmarks2DClass_block_invoke;
      v34[3] = &unk_1E625C4E8;
      v34[4] = &v35;
      __getVNFaceLandmarks2DClass_block_invoke((uint64_t)v34);
      v6 = (void *)v36[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v35, 8);
    -[AXMVisionFeatureFaceLandmarks setIs3DLandmarks:](v5, "setIs3DLandmarks:", (objc_opt_isKindOfClass() & 1) == 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!-[AXMVisionFeatureFaceLandmarks is3DLandmarks](v5, "is3DLandmarks"))
    {
      v9 = v4;
      objc_msgSend(v9, "leftEye");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v11, &unk_1E62889C0);

      objc_msgSend(v9, "rightEye");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v13, &unk_1E62889D8);

      objc_msgSend(v9, "leftEyebrow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v15, &unk_1E62889F0);

      objc_msgSend(v9, "rightEyebrow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v17, &unk_1E6288A08);

      objc_msgSend(v9, "nose");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v19, &unk_1E6288A20);

      objc_msgSend(v9, "noseCrest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v21, &unk_1E6288A38);

      objc_msgSend(v9, "medianLine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v23, &unk_1E6288A50);

      objc_msgSend(v9, "outerLips");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v25, &unk_1E6288A68);

      objc_msgSend(v9, "innerLips");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v27, &unk_1E6288A80);

      objc_msgSend(v9, "leftPupil");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v29, &unk_1E6288A98);

      objc_msgSend(v9, "rightPupil");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXMVisionFeatureFaceLandmarks pointsArrayForRegion:](v5, "pointsArrayForRegion:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v31, &unk_1E6288AB0);

    }
    -[AXMVisionFeatureFaceLandmarks setResults:](v5, "setResults:", v8);

  }
  return v5;
}

- (id)pointsArrayForRegion:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "pointCount"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = objc_retainAutorelease(v3);
      v8 = objc_msgSend(v7, "normalizedPoints");
      objc_msgSend(MEMORY[0x1E0CB3B18], "axmValueWithCGPoint:", *(double *)(v8 + v5), *(double *)(v8 + v5 + 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v9);

      ++v6;
      v5 += 16;
    }
    while (v6 < objc_msgSend(v7, "pointCount"));
  }

  return v4;
}

- (id)pointValuesForFaceLandmarkType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[AXMVisionFeatureFaceLandmarks is3DLandmarks](self, "is3DLandmarks"))
  {
    v5 = 0;
  }
  else
  {
    -[AXMVisionFeatureFaceLandmarks results](self, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)localizedStringForLandmarkType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.face");
      goto LABEL_14;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.lefteye");
      goto LABEL_14;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.righteye");
      goto LABEL_14;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.lefteyebrow");
      goto LABEL_14;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.righteyebrow");
      goto LABEL_14;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.nose");
      goto LABEL_14;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.nosecrest");
      goto LABEL_14;
    case 7uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.medianline");
      goto LABEL_14;
    case 8uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.mouth");
      goto LABEL_14;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.innerlips");
      goto LABEL_14;
    case 0xAuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.leftpupil");
      goto LABEL_14;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("photo.landmarks.rightpupil");
LABEL_14:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E6260C18, CFSTR("Accessibility"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)unitTestingFaceLandmarksIs3D:(BOOL)a3
{
  _BOOL8 v3;
  AXMVisionFeatureFaceLandmarks *v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init(AXMVisionFeatureFaceLandmarks);
  v5 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  -[AXMVisionFeatureFaceLandmarks setResults:](v4, "setResults:", v5);

  -[AXMVisionFeatureFaceLandmarks setIs3DLandmarks:](v4, "setIs3DLandmarks:", v3);
  return v4;
}

- (BOOL)is3DLandmarks
{
  return self->_is3DLandmarks;
}

- (void)setIs3DLandmarks:(BOOL)a3
{
  self->_is3DLandmarks = a3;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Failed to archive face landmark results: %@", (uint8_t *)&v2, 0xCu);
}

@end
