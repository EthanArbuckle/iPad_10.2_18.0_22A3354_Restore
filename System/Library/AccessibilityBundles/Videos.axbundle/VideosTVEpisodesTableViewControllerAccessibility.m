@implementation VideosTVEpisodesTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosTVEpisodesTableViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosTVEpisodesTableViewController"), CFSTR("configureCell: atIndexPath: withEntity: invalidationContext:"), "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VideosFormatters"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VideosFormatters"), CFSTR("localizedEpisodeTitle:"), "@", "Q", 0);

}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withEntity:(id)a5 invalidationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)VideosTVEpisodesTableViewControllerAccessibility;
  -[VideosTVEpisodesTableViewControllerAccessibility configureCell:atIndexPath:withEntity:invalidationContext:](&v26, sel_configureCell_atIndexPath_withEntity_invalidationContext_, v10, v11, v12, v13);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDDBB60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unsignedIntegerValue");

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  AXPerformSafeBlock();
  v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  objc_msgSend(v10, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playbackDuration");
  AXDurationStringForDuration();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityLabel:", v18, v15, v19, CFSTR("__AXStringForVariablesSentinel"));
}

void __109__VideosTVEpisodesTableViewControllerAccessibility_configureCell_atIndexPath_withEntity_invalidationContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)MEMORY[0x2349241F4](CFSTR("VideosFormatters")), "localizedEpisodeTitle:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
