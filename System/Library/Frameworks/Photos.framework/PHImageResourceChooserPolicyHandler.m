@implementation PHImageResourceChooserPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  unint64_t v33;
  void *v35;
  int v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;

  v14 = a3;
  v15 = a5;
  if (v15)
  {
    if (a7)
      goto LABEL_3;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageResourceChooserPolicyHandler.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tooLargeForPolicy"));

    if (a8)
      goto LABEL_4;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageResourceChooserPolicyHandler.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestInfo"));

  if (!a7)
    goto LABEL_31;
LABEL_3:
  if (a8)
    goto LABEL_4;
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageResourceChooserPolicyHandler.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outDisqualificationReason"));

LABEL_4:
  objc_msgSend(v14, "store");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend((id)objc_opt_class(), "storeClassID");

  objc_msgSend(v15, "allowedResourceVersions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "containsObject:", v19);

  if (!v20)
  {
    v28 = CFSTR("version mismatch");
LABEL_22:
    v33 = 0;
    *a8 = v28;
    goto LABEL_23;
  }
  objc_msgSend(v14, "dataStoreKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "desiredSize");
  v23 = v22;
  v25 = v24;
  objc_msgSend(v15, "behaviorSpec");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(a1, "_passesSquareTableThumbnailTestWithKey:pixelSize:storeClassID:loadingOptions:", v21, v17, objc_msgSend(v26, "loadingOptions"), v23, v25);

  if (!(_DWORD)v27)
  {
    v28 = CFSTR("failed square thumb test");
    goto LABEL_22;
  }
  if (a4 == 4)
  {
    if ((objc_msgSend(v15, "isCloudShared") & 1) != 0)
      goto LABEL_19;
  }
  else
  {
    objc_msgSend(v15, "behaviorSpec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "version") != 2 || (objc_msgSend(v15, "isCloudShared") & 1) != 0)
    {

      goto LABEL_19;
    }
  }
  objc_msgSend(v15, "asset");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "mediaType");

  if (a4 != 4)
  if (v30 != 2 && (objc_msgSend(v14, "isDerivative") & 1) != 0)
  {
    v28 = CFSTR("failed derivative test");
    goto LABEL_22;
  }
LABEL_19:
  objc_msgSend(v15, "behaviorSpec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "useLimitedLibraryMode");

  if (v32 && (_DWORD)v17 == 1)
  {
    v28 = CFSTR("failed limited library test");
    goto LABEL_22;
  }
  objc_msgSend(v15, "behaviorSpec");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "useLowMemoryMode");

  v33 = 2;
  if (v36 && (_DWORD)v17 != 1)
  {
    objc_msgSend(v15, "asset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "approximateSizeFromAsset:", v37);
    v39 = v38;
    v41 = v40;

    v42 = objc_msgSend(v14, "isPrimaryFormat");
    v28 = CFSTR("failed low-memory mode test");
    if (v42 && v39 <= 5000.0 && v41 <= 5000.0)
    {
      v33 = 2;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_23:

  return v33;
}

+ (BOOL)_passesSquareTableThumbnailTestWithKey:(id)a3 pixelSize:(CGSize)a4 storeClassID:(unsigned __int16)a5 loadingOptions:(unint64_t)a6
{
  int v6;
  double height;
  double width;
  id v9;
  void *v10;
  BOOL v11;

  v6 = a5;
  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = v9;
  v11 = v6 != 1 || width == height && width > 0.0 || (objc_msgSend(v9, "representsSquareResource") & 1) == 0;

  return v11;
}

@end
