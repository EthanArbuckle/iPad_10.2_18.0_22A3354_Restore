@implementation AVTAvatarAttributeEditorLayoutProvider

+ (BOOL)shouldShowSideGroupPickerForContainerSize:(CGSize)a3 forEnvironment:(id)a4
{
  double width;
  BOOL result;

  width = a3.width;
  result = objc_msgSend(a4, "deviceIsMac", a3.width, a3.height);
  if (width <= 300.0)
    return 0;
  return result;
}

+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7
{
  return (id)objc_msgSend(a1, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:maxGroupLabelWidth:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, 0.0);
}

+ (id)defaultLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7 maxGroupLabelWidth:(double)a8
{
  _BOOL8 v9;
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v18;
  uint64_t v19;
  id v20;
  double v21;
  void *v22;

  v9 = a6;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v18 = a7;
  v19 = objc_msgSend(a1, "shouldShowSideGroupPickerForContainerSize:forEnvironment:", v18, width, height);
  if ((objc_msgSend(v18, "deviceIsMac") & 1) == 0)
    v19 = objc_msgSend(v18, "deviceIsPad") & v19;
  v20 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v18, "mainScreenScale");
  v22 = (void *)objc_msgSend(v20, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:", v9, v19, width, height, top, left, bottom, right, a5, v21, *(_QWORD *)&a8);

  return v22;
}

+ (AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout)actionsToEditorTransitionStartingLayoutInContainerOfSize:(double)a3 attributesContentViewExtraHeight:(double)a4 insets:(double)a5 userInfoViewHeight:(double)a6 RTL:(double)a7 avatarViewStartFrame:(double)a8 avatarViewAlpha:(double)a9 environment:(uint64_t)a10
{
  id v26;
  uint64_t v27;
  AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout *v28;
  double v29;
  double v30;

  v26 = a12;
  v27 = objc_msgSend(a1, "shouldShowSideGroupPickerForContainerSize:forEnvironment:", v26, a2, a3);
  v28 = [AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout alloc];
  objc_msgSend(v26, "mainScreenScale");
  v30 = v29;

  return -[AVTAvatarAttributeEditorTransitionFromActionsStartingPortraitLayout initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:avatarViewContainerFrame:attributesContentViewFrameExtraHeight:avatarViewAlpha:showSideGroupPicker:](v28, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:avatarViewContainerFrame:attributesContentViewFrameExtraHeight:avatarViewAlpha:showSideGroupPicker:", a11, v27, a2, a3, a5, a6, a7, a8, a9, v30, a17, a18, a19, *(_QWORD *)&a4, a20);
}

+ (id)editorToActionsTransitionStartingLayoutInContainerOfSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 RTL:(BOOL)a6 environment:(id)a7
{
  void *v7;
  AVTAvatarAttributeEditorOverridingLayout *v8;

  objc_msgSend(a1, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", a6, a7, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVTAvatarAttributeEditorOverridingLayout initWithLayout:]([AVTAvatarAttributeEditorOverridingLayout alloc], "initWithLayout:", v7);
  -[AVTAvatarAttributeEditorOverridingLayout setAvatarContainerAlpha:](v8, "setAvatarContainerAlpha:", 0.0);

  return v8;
}

@end
