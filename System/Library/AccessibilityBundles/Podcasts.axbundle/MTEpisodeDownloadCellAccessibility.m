@implementation MTEpisodeDownloadCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTEpisodeDownloadCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTEpisodeDownloadCell"), CFSTR("MTCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCollectionViewCell"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTGenericCollectionCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTGenericCollectionCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("MTEpisode"), CFSTR("author"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTEpisodeDownloadCell"), CFSTR("downloadButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTCollectionViewCell"), CFSTR("deleteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTDownloadsCollectionViewController"), CFSTR("episodeForDownloadAtIndex:"), "@", "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  objc_opt_class();
  -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "indexPathForCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  AXPerformSafeBlock();
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  LOBYTE(v17) = 0;
  objc_opt_class();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("author"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v17)
    goto LABEL_6;
  LOBYTE(v17) = 0;
  objc_opt_class();
  -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v17
    || (LOBYTE(v17) = 0,
        objc_opt_class(),
        -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        __UIAccessibilityCastAsClass(),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        (_BYTE)v17))
  {
LABEL_6:
    abort();
  }
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __56__MTEpisodeDownloadCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "episodeForDownloadAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("downloadButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (BOOL)accessibilityDeleteAction:(id)a3
{
  void *v3;

  -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

  return 1;
}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MTEpisodeDownloadCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel_accessibilityDeleteAction_);
    objc_msgSend(v7, "setSortPriority:", *MEMORY[0x24BEBAD58]);
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

@end
