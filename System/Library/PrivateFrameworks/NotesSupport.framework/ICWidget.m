@implementation ICWidget

+ (ICWidget)sharedWidget
{
  if (sharedWidget_onceToken != -1)
    dispatch_once(&sharedWidget_onceToken, &__block_literal_global_21);
  return (ICWidget *)(id)sharedWidget_sharedWidget;
}

void __24__ICWidget_sharedWidget__block_invoke()
{
  ICWidget *v0;
  void *v1;

  v0 = objc_alloc_init(ICWidget);
  v1 = (void *)sharedWidget_sharedWidget;
  sharedWidget_sharedWidget = (uint64_t)v0;

}

- (void)reloadTimelinesWithReason:(id)a3
{
  id v4;

  v4 = a3;
  -[ICWidget reloadTimelineForKind:reason:](self, "reloadTimelineForKind:reason:", CFSTR("com.apple.mobilenotes.FolderWidget"), v4);
  -[ICWidget reloadTimelineForKind:reason:](self, "reloadTimelineForKind:reason:", CFSTR("com.apple.mobilenotes.NoteWidget"), v4);
  -[ICWidget reloadTimelineForKind:reason:](self, "reloadTimelineForKind:reason:", CFSTR("com.apple.mobilenotes.QuickNoteWidget"), v4);

}

- (void)reloadTimelineForKind:(id)a3 reason:(id)a4
{
  id v5;
  Class (__cdecl *v6)();
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a3;
  v6 = (Class (__cdecl *)())getCHSTimelineControllerClass;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(v6()), "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobilenotes.WidgetExtension"), v5);
  objc_msgSend(v8, "reloadTimelineWithReason:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = os_log_create("com.apple.notes", "Widget");
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICWidget reloadTimelineForKind:reason:].cold.2((uint64_t)v5, (uint64_t)v9, v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[ICWidget reloadTimelineForKind:reason:].cold.1((uint64_t)v5, v11);
  }

}

- (void)reloadTimelineForKind:(uint64_t)a1 reason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "Finished reloading Widget Extension timeline {kind: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)reloadTimelineForKind:(os_log_t)log reason:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DDAA5000, log, OS_LOG_TYPE_ERROR, "Failed to reload Widget Extension timeline {kind %@, error: %@}", (uint8_t *)&v3, 0x16u);
}

@end
