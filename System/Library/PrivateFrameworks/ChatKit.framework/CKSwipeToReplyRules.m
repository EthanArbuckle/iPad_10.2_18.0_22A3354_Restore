@implementation CKSwipeToReplyRules

+ (id)balloonCellFromGestureRecognizer:(id)a3 inTranscriptCollectionView:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  int v26;

  v5 = a3;
  v6 = a4;
  if (CKIsRunningInMessagesNotificationExtension()
    || (objc_msgSend(v6, "_ck_isEditing") & 1) != 0
    || (objc_msgSend(v6, "isDecelerating") & 1) != 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "velocityInView:", v6);
  v13 = atan(v12 / v11) * 180.0 / 3.14159265;
  if (v13 < 0.0)
    v13 = -v13;
  if (v13 > 18.0)
  {
LABEL_7:
    v14 = 0;
  }
  else
  {
    objc_msgSend(v6, "indexPathForItemAtPoint:inSection:", 0, v8, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "collectionView:shouldAllowSwipeForItemAtIndexPath:", v6, v16))
      {
        objc_msgSend(v6, "cellForItemAtIndexPath:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_msgSend(v19, "contentView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "convertPoint:toView:", v20, v8, v10);
          v22 = v21;
          v24 = v23;

          v25 = objc_msgSend(v19, "allowsSwipeToReply");
          v26 = objc_msgSend(v19, "isPointInAllowedSwipingArea:", v22, v24);
          v14 = 0;
          if (v25 && v26)
            v14 = v19;

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

@end
