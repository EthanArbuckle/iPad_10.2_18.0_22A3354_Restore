@implementation PXPeopleAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleAvatarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleAvatarView"), CFSTR("sharedAlbumCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("objectID"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHAssetCollection"), CFSTR("PHCollection"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHCollection"), CFSTR("PHObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("objectID"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("photoLibrary"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPhotoLibrary"), CFSTR("managedObjectContextForCurrentQueueQoS"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PXSharedAlbumSubscriberInfo"), CFSTR("allSubscribersForAlbumWithObjectID:includingCurrentUser:managedObjectContext:"), "@", "@", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PXSharedAlbumContactMatcher"), CFSTR("sharedMatcher"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumContactMatcher"), CFSTR("contactsMatchingSubscriberInfos:keysToFetch:"), "@", "@", "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  const __CFString *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *);
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(_QWORD *);
  void *v61;
  id v62;
  id v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t);
  void *v68;
  id v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  char v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  -[PXPeopleAvatarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sharedAlbumCollection"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("objectID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0;
  objc_opt_class();
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v5 = MEMORY[0x24BDAC760];
  v76 = 0;
  v65 = MEMORY[0x24BDAC760];
  v66 = 3221225472;
  v67 = __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke;
  v68 = &unk_24FF067E0;
  v70 = &v71;
  v34 = v2;
  v69 = v34;
  AXPerformSafeBlock();
  v6 = (id)v72[5];

  _Block_object_dispose(&v71, 8);
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    abort();
  v77 = 0;
  objc_opt_class();
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v76 = 0;
  v58 = v5;
  v59 = 3221225472;
  v60 = __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_2;
  v61 = &unk_24FF06920;
  v64 = &v71;
  v32 = v4;
  v62 = v32;
  v33 = v7;
  v63 = v33;
  AXPerformSafeBlock();
  v8 = (id)v72[5];

  _Block_object_dispose(&v71, 8);
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    abort();
  v77 = 0;
  objc_opt_class();
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v76 = 0;
  v53 = v5;
  v54 = 3221225472;
  v55 = __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_3;
  v56 = &unk_24FF06B30;
  v57 = &v71;
  AXPerformSafeBlock();
  v10 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    abort();
  v77 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v76 = 0;
  v48 = v5;
  v49 = 3221225472;
  v50 = __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_4;
  v51 = &unk_24FF06B30;
  v52 = &v71;
  AXPerformSafeBlock();
  v12 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  __UIAccessibilityCastAsProtocol();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    abort();
  v77 = 0;
  objc_opt_class();
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__2;
  v75 = __Block_byref_object_dispose__2;
  v76 = 0;
  v40 = v5;
  v41 = 3221225472;
  v42 = __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_5;
  v43 = &unk_24FF06B58;
  v47 = &v71;
  v31 = v11;
  v44 = v31;
  v30 = v9;
  v45 = v30;
  v14 = v13;
  v46 = v14;
  AXPerformSafeBlock();
  v15 = (id)v72[5];

  _Block_object_dispose(&v71, 8);
  __UIAccessibilityCastAsClass();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
    abort();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v78, 16);
  if (!v18)
  {

LABEL_16:
    v35.receiver = self;
    v35.super_class = (Class)PXPeopleAvatarViewAccessibility;
    -[PXPeopleAvatarViewAccessibility accessibilityLabel](&v35, sel_accessibilityLabel);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v19 = 0;
  v20 = *(_QWORD *)v37;
  do
  {
    v21 = 0;
    v22 = v19;
    do
    {
      if (*(_QWORD *)v37 != v20)
        objc_enumerationMutation(v17);
      objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v21), "safeStringForKey:", CFSTR("givenName"), v27, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      ++v21;
      v22 = v19;
    }
    while (v18 != v21);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v78, 16, v27, CFSTR("__AXStringForVariablesSentinel"));
  }
  while (v18);

  if (!v19)
    goto LABEL_16;
  v23 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPULocalizedString(CFSTR("shared.with"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v24, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v25;
}

void __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("photoLibrary"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContextForCurrentQueueQoS");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE72798], "allSubscribersForAlbumWithObjectID:includingCurrentUser:managedObjectContext:", a1[4], 0, a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE72790], "sharedMatcher");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBAEB8], "descriptorForRequiredKeysIncludingImage:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__PXPeopleAvatarViewAccessibility_accessibilityLabel__block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v8[0] = a1[6];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactsMatchingSubscriberInfos:keysToFetch:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
