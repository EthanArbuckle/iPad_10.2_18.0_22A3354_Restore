@implementation DDShareAction

- (DDShareAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  DDShareAction *v5;
  DDShareAction *v6;
  DDShareAction *v7;
  __DDResult *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DDShareAction;
  v5 = -[DDAction initWithURL:result:context:](&v10, sel_initWithURL_result_context_, a3, a4, a5);
  v6 = v5;
  if (v5 && !v5->super._contact && !v5->super._ics && !v5->super._url)
  {
    v9 = v5->super._result;
    if (!v9)
    {
      v7 = 0;
      goto LABEL_6;
    }
    DDMapURLForResult(v9);
    v7 = (DDShareAction *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_6;
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Share…"));
}

- (id)iconName
{
  return CFSTR("square.and.arrow.up");
}

- (int)interactionType
{
  return 1;
}

- (id)viewController
{
  UIViewController *viewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *ics;
  id v25;
  UIViewController *v26;
  UIViewController *v27;
  __DDResult *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  NSURL *url;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  viewController = self->super._viewController;
  if (!viewController)
  {
    if (self->super._contact)
    {
      v4 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileURLWithPath:relativeToURL:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", self->super._contact, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.vcf"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0C972A8];
      v40[0] = self->super._contact;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      objc_msgSend(v10, "dataWithContacts:error:", v11, &v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v35;

      if (v13
        || (v34 = 0, objc_msgSend(v12, "writeToURL:options:error:", v9, 1, &v34), (v13 = v34) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[DDShareAction viewController].cold.3();

        v14 = 0;
      }
      else
      {
        v39 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (self->super._ics)
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURLWithPath:relativeToURL:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _eventTitleFromCache(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length"))
      {
        v20 = v19;
      }
      else
      {
        DDLocalizedString(CFSTR("New Event"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.ics"), v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      ics = self->super._ics;
      v33 = 0;
      -[NSString writeToURL:atomically:encoding:error:](ics, "writeToURL:atomically:encoding:error:", v23, 1, 4, &v33);
      v25 = v33;
      if (v25)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[DDShareAction viewController].cold.1();
        v14 = 0;
      }
      else
      {
        v38 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (self->super._url)
      {
        url = self->super._url;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &url, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_24;
        goto LABEL_23;
      }
      v29 = self->super._result;
      if (!v29)
        goto LABEL_24;
      DDMapURLForResult(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        v31 = DDResultCopyExtractedURL();
        if (!v31)
          goto LABEL_24;
        v32 = (void *)v31;
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_24;
      }
      v36 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v14)
    {
LABEL_24:
      viewController = self->super._viewController;
      return viewController;
    }
LABEL_23:
    v26 = (UIViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2D8]), "initWithActivityItems:applicationActivities:", v14, 0);
    v27 = self->super._viewController;
    self->super._viewController = v26;

    goto LABEL_24;
  }
  return viewController;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDShareAction;
  v4 = a3;
  -[DDAction prepareViewControllerForActionController:](&v5, sel_prepareViewControllerForActionController_, v4);
  objc_msgSend(v4, "action:presentationShouldBeModal:", self, 0, v5.receiver, v5.super_class);

}

- (void)performFromView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[DDShareAction viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "popoverPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDAction setupPopoverPresentationController:view:](self, "setupPopoverPresentationController:view:", v6, v9);
    objc_msgSend(v9, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)viewController
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Could not serialize contact data for sharing. Error: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
