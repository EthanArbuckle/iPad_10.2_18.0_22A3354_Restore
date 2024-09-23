@implementation _SFWebProcessPlugIn

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  FILE *javaScriptConsoleOutputFile;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  FILE *(*v16)(uint64_t);
  void *v17;
  _SFWebProcessPlugIn *v18;
  id v19;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFWebProcessPlugIn;
  -[WBSWebProcessPlugIn webProcessPlugIn:initializeWithObject:](&v20, sel_webProcessPlugIn_initializeWithObject_, v6, a4);
  objc_msgSend(v6, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("JavaScriptConsoleOutputURLBookmarkData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", v8, 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __61___SFWebProcessPlugIn_webProcessPlugIn_initializeWithObject___block_invoke;
    v17 = &unk_1E4AC0590;
    v18 = self;
    v10 = v9;
    v19 = v10;
    objc_msgSend(v10, "safari_accessingSecurityScopedResource:", &v14);
    javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
    if (javaScriptConsoleOutputFile)
    {
      setvbuf(javaScriptConsoleOutputFile, 0, 1, 0);
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[_SFWebProcessPlugIn webProcessPlugIn:initializeWithObject:].cold.1((uint64_t)v10, v12);
    }

  }
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall", v14, v15, v16, v17, v18))
  {
    objc_msgSend(v6, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0D8AF90], 4, 0);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall")
    && (v13 = *MEMORY[0x1E0D8AF90], objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D8AF90])))
  {
    -[WBSWebProcessPlugIn plugInController](self, "plugInController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBool:forKey:", v17, v13);

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_SFWebProcessPlugIn;
    -[_SFWebProcessPlugIn observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)didCreatePageController:(id)a3 forBrowserContextController:(id)a4
{
  id v6;
  id value;

  value = a3;
  v6 = a4;
  objc_setAssociatedObject(v6, &kContextControllerToPlugInPageControllerAssociationKey, value, (void *)0x301);
  -[_SFWebProcessPlugIn _installUIClientIfNecessaryWithPageController:](self, "_installUIClientIfNecessaryWithPageController:", value);

}

- (void)_installUIClientIfNecessaryWithPageController:(id)a3
{
  id v4;
  int v5;
  __sFILE *javaScriptConsoleOutputFile;
  char v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t *);
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D4EC80], "supportsWebpageStatusBar");
  javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
  if (javaScriptConsoleOutputFile)
    v7 = 1;
  else
    v7 = v5;
  if ((v7 & 1) != 0)
  {
    v8 = mouseDidMoveOverElementCallback;
    if (!v5)
      v8 = 0;
    if (javaScriptConsoleOutputFile)
      v9 = willAddMessageWithDetailsToConsoleCallback;
    else
      v9 = 0;
    objc_msgSend(v4, "browserContextController", 5, v4, 0, 0, 0, 0, 0, v8, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_bundlePageRef");
    WKBundlePageSetUIClient();

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  FILE *javaScriptConsoleOutputFile;
  void *v6;
  void *v7;
  objc_super v8;

  -[WBSWebProcessPlugIn plugInController](self, "plugInController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D4F370]);
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D4F378]);
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D8AFB0]);
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D4F380]);
  javaScriptConsoleOutputFile = self->_javaScriptConsoleOutputFile;
  if (javaScriptConsoleOutputFile)
    fclose(javaScriptConsoleOutputFile);
  if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isInternalInstall"))
  {
    -[WBSWebProcessPlugIn plugInController](self, "plugInController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:forKeyPath:", self, *MEMORY[0x1E0D8AF90]);

  }
  v8.receiver = self;
  v8.super_class = (Class)_SFWebProcessPlugIn;
  -[_SFWebProcessPlugIn dealloc](&v8, sel_dealloc);
}

- (void)willDestroyPageController:(id)a3 forBrowserContextController:(id)a4
{
  objc_setAssociatedObject(a4, &kContextControllerToPlugInPageControllerAssociationKey, 0, (void *)0x301);
}

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class **v7;
  int v8;
  void *v9;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "pageGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Reader")) & 1) != 0)
  {
    v7 = off_1E4ABE2D8;
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D8B6B0]);
    v7 = off_1E4ABE3F8;
    if (v8)
      v7 = (__objc2_class **)0x1E0D8AD48;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v7), "initWithPlugIn:contextController:", self, v4);

  return v9;
}

- (void)webProcessPlugIn:(uint64_t)a1 initializeWithObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Unable to open JavaScript output file at %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
