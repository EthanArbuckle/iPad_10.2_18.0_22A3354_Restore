@implementation ICTextAttachment(App)

- (id)viewProviderForParentView:()App location:textContainer:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_opt_class();
  objc_msgSend(v8, "textLayoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "viewProviderForTextAttachment:parentView:location:", a1, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)attachmentSizeForImageInTextContainer:()App intrinsicImageSize:
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;

  v8 = a5;
  objc_msgSend(v8, "size");
  v10 = v9;
  objc_msgSend(v8, "lineFragmentPadding");
  v12 = v11;

  v13 = v10 + v12 * -2.0;
  v14 = 0.0;
  if (a2 > 0.0)
  {
    if (v13 >= a2)
      v14 = a2;
    else
      v14 = v13;
  }
  if (objc_msgSend(a1, "supportsMultiplePresentationSizes"))
  {
    objc_msgSend(a1, "attachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "preferredViewSize");

    if (v16 == 1 && a3 > 0.0)
    {
      objc_msgSend(a1, "attachmentThumbnailViewHeight");
      if (a3 >= v17)
        v18 = v17;
      else
        v18 = a3;
      v14 = fmax(a2 * (v18 / a3), 1.0);
      if (v14 > v13)
        return v13;
    }
  }
  return v14;
}

- (id)viewProviderForParentView:()App characterIndex:layoutManager:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  objc_opt_class();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "viewProviderForTextAttachment:parentView:characterIndex:", a1, v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)viewForLayoutManager:()App
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1F04852A0;
  objc_msgSendSuper2(&v2, sel_viewForLayoutManager_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)placeView:()App withFrame:inParentView:characterIndex:layoutManager:
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  objc_super v35;

  v18 = a10;
  v19 = a8;
  v20 = a7;
  objc_opt_class();
  ICDynamicCast();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "attachmentBoundsMargins");
  v24 = v23;
  v26 = v25;
  v29 = a5 - (v27 + v28);
  v30 = a3 + v27;
  v31 = a4 - (v23 + v25);
  objc_msgSend(v21, "paragraphStyleForCharacterIndex:", a9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "layoutWritingDirection"))
    v33 = v26;
  else
    v33 = v24;
  v34 = a2 + v33;
  objc_msgSend(v21, "willPlaceView:forTextAttachment:", v20, a1);
  v35.receiver = a1;
  v35.super_class = (Class)&off_1F04852A0;
  objc_msgSendSuper2(&v35, sel_placeView_withFrame_inParentView_characterIndex_layoutManager_, v20, v19, a9, v18, v34, v30, v31, v29);

  if (v22 != v19)
    objc_msgSend(v21, "didAddViewForTextAttachment:", a1);

}

- (uint64_t)attachmentThumbnailViewHeight
{
  return objc_msgSend((id)objc_opt_class(), "defaultAttachmentThumbnailViewHeight");
}

@end
