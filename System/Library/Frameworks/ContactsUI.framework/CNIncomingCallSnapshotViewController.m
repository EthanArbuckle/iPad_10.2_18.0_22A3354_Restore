@implementation CNIncomingCallSnapshotViewController

+ (id)posterDisplayNameComponentsForContact:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getTPInComingCallUISnapshotViewControllerClass(), "posterDisplayNameComponentsForContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (CGRect)verticalNameLabelBoundingRectForName:(id)a3 window:(id)a4
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getTPInComingCallUISnapshotViewControllerClass(), "verticalNameLabelBoundingRectForName:window:", v6, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (CGRect)horizontalNameLabelBoundingRectForName:(id)a3 window:(id)a4
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v5 = a4;
  v6 = a3;
  objc_msgSend(getTPInComingCallUISnapshotViewControllerClass(), "horizontalNameLabelBoundingRectForName:window:", v6, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (void)incomingCallPlaceholderSnapshotForContact:(id)a3 windowScene:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "incomingCallSnapshotForConfiguration:style:contact:nameString:avatarImage:windowScene:completionBlock:", 0, 5, v9, 0, 0, v8, v7);

}

+ (void)incomingCallAvatarSnapshotForAvatarImageData:(id)a3 contact:(id)a4 windowScene:(id)a5 completionBlock:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v9 = (void *)MEMORY[0x1E0DC3870];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v9, "imageWithData:", a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend(getTPInComingCallUISnapshotViewControllerClass(), "instancesRespondToSelector:", sel_initWithConfiguration_style_nameString_avatarImage_);
  v13 = (void *)objc_opt_class();
  if ((_DWORD)a3)
    v14 = 6;
  else
    v14 = 5;
  objc_msgSend(v13, "incomingCallSnapshotForConfiguration:style:contact:nameString:avatarImage:windowScene:completionBlock:", 0, v14, v12, 0, v15, v11, v10);

}

+ (void)incomingCallSnapshotForPosterArchiveData:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;

  v8 = a5;
  v11 = a7;
  v12 = a6;
  v13 = a4;
  +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", a3, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "incomingCallSnapshotForConfiguration:contact:includingCallButtons:windowScene:completionBlock:", v14, v13, v8, v12, v11);

}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 nameString:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v8 = a5;
  v11 = a3 != 0;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v16 = a3;
  v15 = objc_msgSend((id)objc_opt_class(), "styleIncludingCallButtons:canShowPoster:", v8, v11);
  objc_msgSend((id)objc_opt_class(), "incomingCallSnapshotForConfiguration:style:contact:nameString:avatarImage:windowScene:completionBlock:", v16, v15, 0, v14, 0, v13, v12);

}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 contact:(id)a4 includingCallButtons:(BOOL)a5 windowScene:(id)a6 completionBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v8 = a5;
  v11 = a3 != 0;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v16 = a3;
  v15 = objc_msgSend((id)objc_opt_class(), "styleIncludingCallButtons:canShowPoster:", v8, v11);
  objc_msgSend((id)objc_opt_class(), "incomingCallSnapshotForConfiguration:style:contact:nameString:avatarImage:windowScene:completionBlock:", v16, v15, v14, 0, 0, v13, v12);

}

+ (void)incomingCallSnapshotForConfiguration:(id)a3 style:(int64_t)a4 contact:(id)a5 nameString:(id)a6 avatarImage:(id)a7 windowScene:(id)a8 completionBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v34 = v16;
  if (objc_msgSend(getTPInComingCallUISnapshotViewControllerClass(), "instancesRespondToSelector:", sel_initWithConfiguration_style_nameString_avatarImage_))
  {
    v20 = objc_alloc((Class)getTPInComingCallUISnapshotViewControllerClass());
    objc_msgSend(v14, "wrappedPosterConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v22 = objc_msgSend(v20, "initWithConfiguration:style:contact:avatarImage:", v21, a4, v15, v17);
    else
      v22 = objc_msgSend(v20, "initWithConfiguration:style:nameString:avatarImage:", v21, a4, v16, v17);
  }
  else
  {
    v23 = objc_alloc((Class)getTPInComingCallUISnapshotViewControllerClass());
    objc_msgSend(v14, "wrappedPosterConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "initWithConfiguration:style:contact:fallbackText:", v21, a4, v15, &stru_1E20507A8);
  }
  v24 = (void *)v22;

  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke;
  v39[3] = &unk_1E204F648;
  v27 = v24;
  v40 = v27;
  objc_msgSend(v25, "performBlock:", v39);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "defaultSchedulerProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.CNIncomingCallSnapshotViewController.snapshottingQueue"));
  v35[0] = v26;
  v35[1] = 3221225472;
  v35[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_2;
  v35[3] = &unk_1E204F098;
  v36 = v27;
  v37 = v18;
  v38 = v19;
  v31 = v19;
  v32 = v18;
  v33 = v27;
  objc_msgSend(v30, "performBlock:", v35);

}

+ (int64_t)styleIncludingCallButtons:(BOOL)a3 canShowPoster:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  int64_t v7;

  v4 = !a4;
  if (a3 && !v4)
    return 3;
  v6 = v4 || a3;
  v7 = 4;
  if (a3 && !a4)
    v7 = 5;
  if (v6 == 1)
    return v7;
  else
    return 1;
}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_3;
  v3[3] = &unk_1E204E078;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "snapshotWithOptions:windowScene:completionBlock:", 0, v2, v3);

}

void __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_4;
  v11[3] = &unk_1E204F098;
  v8 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "performBlock:", v11);

}

uint64_t __142__CNIncomingCallSnapshotViewController_incomingCallSnapshotForConfiguration_style_contact_nameString_avatarImage_windowScene_completionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)nameString
{
  return self->_nameString;
}

- (void)setNameString:(id)a3
{
  objc_storeStrong((id *)&self->_nameString, a3);
}

- (TPInComingCallUISnapshotViewController)snapshotViewController
{
  return self->_snapshotViewController;
}

- (void)setSnapshotViewController:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotViewController, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
}

@end
