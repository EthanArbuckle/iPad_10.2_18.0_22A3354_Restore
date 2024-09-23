@implementation UITableViewController(FBKDocumentPresenter)

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;

  v6 = a4;
  +[FBKAttachmentViewingControllerSelector controllerForAttachment:](FBKAttachmentViewingControllerSelector, "controllerForAttachment:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[UITableViewController(FBKDocumentPresenter) presentAttachment:fromIndexPath:].cold.1(v17);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(a1, "navigationController");
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject pushViewController:animated:](v17, "pushViewController:animated:", v7, 1);
LABEL_9:

    goto LABEL_10;
  }
  +[FBKLog appHandle](FBKLog, "appHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[UITableViewController(FBKDocumentPresenter) presentAttachment:fromIndexPath:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  v16 = v7;
  objc_msgSend(v16, "setDelegate:", a1);
  objc_msgSend(v16, "setAnnotation:", v6);
  objc_msgSend(v16, "presentPreviewAnimated:", 1);

LABEL_10:
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  +[FBKAttachmentViewingControllerSelector imageControllerForAttachment:](FBKAttachmentViewingControllerSelector, "imageControllerForAttachment:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[UITableViewController(FBKDocumentPresenter) presentAttachmentWithImagePush:fromIndexPath:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    objc_msgSend(a1, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v8, 1);

  }
  else
  {
    objc_msgSend(a1, "presentAttachment:fromIndexPath:", v6, v7);
  }

}

- (void)documentInteractionControllerDidEndPreview:()FBKDocumentPresenter
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);
}

- (double)documentInteractionControllerRectForPreview:()FBKDocumentPresenter
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(a1, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  v9 = v8;

  return v9;
}

- (id)documentInteractionControllerViewForPreview:()FBKDocumentPresenter
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "unknown file type given, cannot display it", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)presentAttachment:()FBKDocumentPresenter fromIndexPath:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "will display document", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)presentAttachmentWithImagePush:()FBKDocumentPresenter fromIndexPath:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, a1, a3, "will display image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
