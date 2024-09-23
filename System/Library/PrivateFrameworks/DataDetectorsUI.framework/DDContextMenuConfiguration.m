@implementation DDContextMenuConfiguration

- (BOOL)performPreviewActionForMenuWithAnimator:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  -[DDContextMenuConfiguration interactionViewControllerProvider](self, "interactionViewControllerProvider");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setPreferredCommitStyle:", 1);
    objc_msgSend(v4, "previewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v5[2](v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "modalPresentationStyle") == 7)
      {
        objc_msgSend(v8, "popoverPresentationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sourceView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          objc_msgSend(v8, "setModalPresentationStyle:", 0);
      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke;
      v15[3] = &unk_1E4258140;
      v16 = v7;
      v17 = v8;
      v11 = v8;
      v7 = v7;
      objc_msgSend(v4, "addAnimations:", v15);

      goto LABEL_9;
    }
  }
  else
  {
    -[DDContextMenuConfiguration interactionURL](self, "interactionURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "setPreferredCommitStyle:", 1);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke_2;
      v13[3] = &unk_1E42580C8;
      v14 = v7;
      v7 = v7;
      objc_msgSend(v4, "addAnimations:", v13);
      v11 = v14;
LABEL_9:

      LOBYTE(v7) = 1;
    }
  }

  return (char)v7;
}

uint64_t __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);
}

void __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D22D88];
  v6[0] = *MEMORY[0x1E0D22DA8];
  v6[1] = v4;
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v5, 0);

}

- (BOOL)prefersActionMenuStyle
{
  return self->prefersActionMenuStyle;
}

- (void)setPrefersActionMenuStyle:(BOOL)a3
{
  self->prefersActionMenuStyle = a3;
}

- (BOOL)expandPreviewOnInteraction
{
  return self->expandPreviewOnInteraction;
}

- (void)setExpandPreviewOnInteraction:(BOOL)a3
{
  self->expandPreviewOnInteraction = a3;
}

- (id)interactionViewControllerProvider
{
  return self->interactionViewControllerProvider;
}

- (void)setInteractionViewControllerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)interactionURL
{
  return self->interactionURL;
}

- (void)setInteractionURL:(id)a3
{
  objc_storeStrong((id *)&self->interactionURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->interactionURL, 0);
  objc_storeStrong(&self->interactionViewControllerProvider, 0);
}

@end
