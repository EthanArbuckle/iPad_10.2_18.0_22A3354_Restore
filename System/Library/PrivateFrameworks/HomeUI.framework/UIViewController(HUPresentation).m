@implementation UIViewController(HUPresentation)

- (id)hu_performPresentationRequest:()HUPresentation
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;

  v5 = a3;
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+HUPresentation.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequest.viewController != nil"));

  }
  objc_msgSend(v5, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "animated");
  v9 = objc_msgSend(v5, "preferredPresentationType");
  if (!v9)
    goto LABEL_16;
  if (v9 == 1)
  {
    objc_opt_class();
    v10 = a1;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v13 = v10;

      v14 = v13 == 0;
      goto LABEL_13;
    }
    objc_msgSend(v10, "navigationController");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v13 = (id)v20;
      v14 = 0;
LABEL_13:
      objc_msgSend(v13, "hu_pushPreloadableViewController:animated:", v7, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_17;
      goto LABEL_16;
    }
    NSLog(CFSTR("Requested navigation push for presenting view controller %@, but the receiver (%@) does not have a navigation controller!"), v7, v10);
LABEL_16:
    objc_msgSend(a1, "hu_presentPreloadableViewController:animated:", v7, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "preferredPresentationType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+HUPresentation.m"), 41, CFSTR("Unknown presentation type %@"), v16);

  v17 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_internalErrorWithDescription:", CFSTR("Unknown presentation type"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "futureWithError:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v19;
}

- (id)hu_performDismissalRequest:()HUPresentation
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  BOOL (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  char v34;

  v4 = a3;
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "animated");

  objc_opt_class();
  v7 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = v7;

  }
  else
  {
    objc_msgSend(v7, "navigationController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_10;
  }
  objc_msgSend(v10, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v5);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12)
    {
      objc_msgSend(v10, "viewControllers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", v12 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0D519C0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke;
      v31[3] = &unk_1E6F4DF30;
      v10 = v10;
      v32 = v10;
      v33 = v22;
      v34 = v6;
      v24 = v22;
      objc_msgSend(v23, "futureWithBlock:", v31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("Attempting to dismiss view controller %@ at the top of the navigation stack of navigation controller %@! This doesn't make any sense."), v5, v10);
      v13 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_internalErrorWithDescription:", CFSTR("Invalid dismiss request for %@"), v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "futureWithError:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
LABEL_10:
  objc_msgSend(v7, "presentedViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "childViewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke_2;
  v29 = &unk_1E6F4DF58;
  v18 = v5;
  v30 = v18;
  v19 = objc_msgSend(v17, "na_any:", &v26);

  objc_msgSend(v7, "presentedViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((v19 & 1) == 0 && v20 != v18)
    NSLog(CFSTR("Attempting to dismiss view controller %@ that is neither in a navigation stack, a child of the presented view controller, nor is the presented view controller of %@!"), v18, v7, v26, v27, v28, v29);
  objc_msgSend(v7, "hu_dismissViewControllerAnimated:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v15;
}

- (id)hu_dismissViewControllerAnimated:()HUPresentation
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  char v11;
  _QWORD v12[5];
  char v13;

  objc_msgSend(a1, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke;
    v12[3] = &unk_1E6F4DF80;
    v12[4] = a1;
    v13 = a3;
    __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke((uint64_t)v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_68;
    v10[3] = &unk_1E6F4DFA8;
    v10[4] = a1;
    v11 = a3;
    objc_msgSend(v7, "flatMap:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end
