@implementation TabDocumentActivity

- (id)activityTitle
{
  return -[TabDocumentActivity activityTitleWithTabDocument:](self, "activityTitleWithTabDocument:", self->_tabDocument);
}

- (id)activityTitleWithTabDocument:(id)a3
{
  return &stru_1E9CFDBB0;
}

- (id)_systemImageName
{
  return -[TabDocumentActivity systemImageNameWithTabDocument:](self, "systemImageNameWithTabDocument:", self->_tabDocument);
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return 0;
}

- (id)_activityImage
{
  return -[TabDocumentActivity activityImageWithTabDocument:](self, "activityImageWithTabDocument:", self->_tabDocument);
}

- (id)activityImageWithTabDocument:(id)a3
{
  return 0;
}

- (int64_t)actionType
{
  return -[TabDocumentActivity actionTypeWithTabDocument:](self, "actionTypeWithTabDocument:", self->_tabDocument);
}

- (int64_t)actionTypeWithTabDocument:(id)a3
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  TabDocument *v4;
  TabDocument *tabDocument;
  _BOOL4 v6;

  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_37);
  v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v4;

  v6 = -[TabDocument isShowingStartPageOverriddenByExtension](self->_tabDocument, "isShowingStartPageOverriddenByExtension");
  return (-[TabDocumentActivity canPerformOnNewTabPage](self, "canPerformOnNewTabPage")
       || !-[TabDocument isBlank](self->_tabDocument, "isBlank") && !v6)
      && self->_tabDocument
      && -[TabDocumentActivity canPerformWithTabDocument:](self, "canPerformWithTabDocument:");
}

uint64_t __51__TabDocumentActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)canPerformOnNewTabPage
{
  return 0;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  return 1;
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  TabDocument *v6;
  TabDocument *tabDocument;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_2_1);
  v6 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v6;

  -[TabDocumentActivity prepareWithTabDocument:completion:](self, "prepareWithTabDocument:completion:", self->_tabDocument, v8);
}

uint64_t __60__TabDocumentActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareWithTabDocument:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[TabDocumentActivity prepareWithTabDocument:](self, "prepareWithTabDocument:", a3);
  v6[2]();

}

- (void)performActivity
{
  void *v3;
  id v4;

  -[TabDocumentActivity performActivityWithTabDocument:](self, "performActivityWithTabDocument:", self->_tabDocument);
  -[_SFActivity delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sf_didPerformFormatMenuAction:provenance:", -[TabDocumentActivity actionType](self, "actionType"), objc_msgSend(v4, "provenanceForSafariActivity:", self));

  }
}

- (id)_embeddedActivityViewController
{
  return -[TabDocumentActivity embeddedActivityViewControllerWithTabDocument:](self, "embeddedActivityViewControllerWithTabDocument:", self->_tabDocument);
}

- (id)embeddedActivityViewControllerWithTabDocument:(id)a3
{
  return 0;
}

- (TabDocument)tabDocument
{
  return self->_tabDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
}

@end
