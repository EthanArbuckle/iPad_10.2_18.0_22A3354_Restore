@implementation PHImageResourceChooserFastPolicyHandler

+ (unint64_t)qualifyResourceInfo:(id)a3 againstPolicy:(int64_t)a4 requestInfo:(id)a5 reversed:(BOOL)a6 tooLargeForPolicy:(BOOL *)a7 disqualificationReason:(id *)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  unint64_t v32;
  objc_super v34;

  v10 = a6;
  v14 = a3;
  v15 = a5;
  v34.receiver = a1;
  v34.super_class = (Class)&OBJC_METACLASS___PHImageResourceChooserFastPolicyHandler;
  v16 = objc_msgSendSuper2(&v34, sel_qualifyResourceInfo_againstPolicy_requestInfo_reversed_tooLargeForPolicy_disqualificationReason_, v14, a4, v15, v10, a7, a8);
  objc_msgSend(v14, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend((id)objc_opt_class(), "storeClassID");

  if (v16)
  {
    if (v18 == 1
      || !a4
      && (objc_msgSend(v15, "behaviorSpec"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isNetworkAccessAllowed"),
          v20,
          (v21 & 1) != 0))
    {
      v19 = 1;
    }
    else
    {
      v19 = 0;
      *a8 = CFSTR("not fast");
      *a7 = 1;
    }
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v15, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "approximateSizeFromAsset:", v22);
  v24 = v23;
  v26 = v25;

  if (!v19)
  {
    v32 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v15, "behaviorSpec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "minimumTableThumbnailLongSide");
  if (v28 <= 0.0)
  {

LABEL_16:
    v32 = 2;
    goto LABEL_17;
  }
  if (v24 >= v26)
    v26 = v24;
  objc_msgSend(v15, "behaviorSpec");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minimumTableThumbnailLongSide");
  v31 = v30;

  if (v26 >= v31)
    goto LABEL_16;
  v32 = 0;
  *a8 = CFSTR("failed minimumTableThumbnailLongSide test");
LABEL_17:

  return v32;
}

@end
