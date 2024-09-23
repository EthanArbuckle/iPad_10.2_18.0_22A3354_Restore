@implementation MTPodcastCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTPodcastCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTPodcastCollectionViewCell"), CFSTR("UICollectionReusableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionReusableView"), CFSTR("prepareForReuse"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MTDB"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTDB"), CFSTR("mainOrPrivateContext"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTPodcastCollectionViewCell"), CFSTR("podcastUUID"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTPodcastCollectionViewCellAccessibility;
  -[MTPodcastCollectionViewCellAccessibility accessibilityLabel](&v15, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    AXPerformSafeBlock();
    objc_msgSend((id)v10[5], "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "safeValueForKey:", CFSTR("title"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[MTPodcastCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5);
    _Block_object_dispose(&v9, 8);

  }
  return v5;
}

void __62__MTPodcastCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  char v16;

  v2 = (void *)MEMORY[0x24BDD1758];
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("podcastUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("MTPodcast"));
  objc_msgSend(v6, "setPredicate:", v5);
  v15 = 0;
  objc_msgSend((id)MEMORY[0x234919E98](CFSTR("MTDB")), "safeValueForKey:", CFSTR("sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("mainOrPrivateContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v6, &v14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v14;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v10;

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTPodcastCollectionViewCellAccessibility;
  -[MTPodcastCollectionViewCellAccessibility prepareForReuse](&v3, sel_prepareForReuse);
  -[MTPodcastCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
