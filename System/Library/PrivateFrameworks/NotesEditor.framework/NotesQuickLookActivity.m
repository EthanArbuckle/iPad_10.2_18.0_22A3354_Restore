@implementation NotesQuickLookActivity

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.Quicklook");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("QUICK_LOOK"), CFSTR("Quick Look"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemImageName
{
  return CFSTR("eye");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)_beforeActivity
{
  return (id)*MEMORY[0x1E0D96E08];
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NotesQuickLookActivityItem *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NotesQuickLookActivity setItem:](self, "setItem:", v10, (_QWORD)v14);

          goto LABEL_15;
        }
        if (!v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v7 = v10;
          else
            v7 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
LABEL_15:
    v7 = 0;
  }

  -[NotesQuickLookActivity item](self, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && v7)
  {
    v12 = objc_alloc_init(NotesQuickLookActivityItem);
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesQuickLookActivityItem setPreviewItems:](v12, "setPreviewItems:", v13);

    -[NotesQuickLookActivity setItem:](self, "setItem:", v12);
  }

}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (void)_cleanup
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NotesQuickLookActivity;
  -[UIActivity _cleanup](&v3, sel__cleanup);
  -[NotesQuickLookActivity presentPreviewController](self, "presentPreviewController");
}

- (void)presentPreviewController
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id object;

  object = objc_alloc_init(MEMORY[0x1E0CD3250]);
  objc_msgSend(object, "setDataSource:", self);
  objc_msgSend(object, "setDelegate:", self);
  objc_msgSend(object, "setIsContentManaged:", -[NotesQuickLookActivity sourceIsManaged](self, "sourceIsManaged"));
  -[NotesQuickLookActivity item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstItemIndex");

  objc_msgSend(object, "setCurrentPreviewItemIndex:", v4);
  v5 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_viewControllerManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_topmostPresentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(*v5, "keyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootViewController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "presentViewController:animated:completion:", object, 1, 0);
  objc_setAssociatedObject(object, &NotesQuickLookActivityLifeLine, self, (void *)1);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NotesQuickLookActivity item](self, "item", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NotesQuickLookActivity item](self, "item", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v8 = a4;
  v9 = a3;
  -[NotesQuickLookActivity item](self, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotesQuickLookActivity item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notesQuickLookActivityItem:rectForPreviewItem:inView:previewController:", v12, v8, a5, v9);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  -[NotesQuickLookActivity item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[NotesQuickLookActivity item](self, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesQuickLookActivity item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "notesQuickLookActivityItem:transitionImageForPreviewItem:previewController:", v14, v8, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[NotesQuickLookActivity item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[NotesQuickLookActivity item](self, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NotesQuickLookActivity item](self, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notesQuickLookActivityItem:transitionViewForPreviewItem:previewController:", v13, v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (NotesQuickLookActivityItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
