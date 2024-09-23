@implementation DetailHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.DetailHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.DetailHeader"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.DetailHeader"), CFSTR("accessibilityPlaylistVisibilitySwitchContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.DetailHeader"), CFSTR("accessibilityIsVisiblePlaylistTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.DetailHeader"), CFSTR("accessibilityArtworkEditingOverlayView"), "@", 0);
  objc_msgSend(v3, "validateSwiftStruct:", CFSTR("MusicApplication.ContainerDetailPlaylistProperties"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.PlaylistDetailViewController"), CFSTR("containerProperties"), "Optional<ContainerDetailPlaylistProperties>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.ContainerDetailPlaylistProperties"), CFSTR("activeCollaborators"), "Optional<Array<MPModelPlaylistAuthor>>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.ContainerDetailPlaylistProperties"), CFSTR("modelObject"), "Optional<MPModelPlaylist>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.DetailHeader"), CFSTR("detailsView"), "DetailsView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.DetailHeader[class].DetailsView"), CFSTR("actionButton"), "TextButton");
  objc_msgSend(v3, "validateClass:", CFSTR("MPModelObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelObject"), CFSTR("hasLoadedValueForKey:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MPModelPlaylist"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPModelPlaylist"), CFSTR("MPModelObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelPlaylist"), CFSTR("collaboratorStatus"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelPlaylist"), CFSTR("curator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelPlaylist"), CFSTR("ownerName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelCurator"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MPModelPlaylistAuthor"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MPModelPlaylistAuthor"), CFSTR("MPModelObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelPlaylistAuthor"), CFSTR("socialProfile"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelSocialPerson"), CFSTR("name"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DetailHeaderAccessibility;
  -[DetailHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[DetailHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlaylistVisibilitySwitchContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("AXPublicPlaylistSwitchContainerView"));
  -[DetailHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityIsVisiblePlaylistTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[DetailHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkEditingOverlayView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMusicLocalizedString(CFSTR("add.playlist.artwork.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  -[DetailHeaderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_accessibilityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeSwiftValueForKey:", CFSTR("containerProperties"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSwiftStruct();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[DetailHeaderAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("detailsView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeSwiftValueForKey:", CFSTR("actionButton"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DetailHeaderAccessibility _axLabelForActionButtonForContainerProperties:](self, "_axLabelForActionButtonForContainerProperties:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAccessibilityLabel:", v15);

    }
  }

}

uint64_t __71__DetailHeaderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234917594](CFSTR("MusicApplication.PlaylistDetailViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DetailHeaderAccessibility;
  -[DetailHeaderAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[DetailHeaderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axLabelForActionButtonForContainerProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "safeSwiftArrayForKey:", CFSTR("activeCollaborators"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("modelObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DetailHeaderAccessibility _axIsCollaborativeForModelPlaylist:](self, "_axIsCollaborativeForModelPlaylist:", v8)
    && objc_msgSend(v6, "count"))
  {
    -[DetailHeaderAccessibility _axStringForActiveCallaborators:](self, "_axStringForActiveCallaborators:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DetailHeaderAccessibility _axOwnerNameForPlaylist:](self, "_axOwnerNameForPlaylist:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DetailHeaderAccessibility _axCuratorNameForPlaylist:](self, "_axCuratorNameForPlaylist:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      v12 = v10;
    else
      v12 = v11;
    v9 = v12;

  }
  return v9;
}

- (id)_axStringForActiveCallaborators:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DetailHeaderAccessibility _axNameForAuthor:](self, "_axNameForAuthor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v9 = v6;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityMusicLocalizedString(CFSTR("PLAYLIST_CURATORS_COUNT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v6, objc_msgSend(v4, "count") - 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)_axIsCollaborativeForModelPlaylist:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDBF28]))
    v4 = (unint64_t)(objc_msgSend(v3, "collaboratorStatus") - 2) < 3;
  else
    v4 = 0;

  return v4;
}

- (id)_axCuratorNameForPlaylist:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDC340])
    && (objc_msgSend(v3, "curator"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasLoadedValueForKey:", *MEMORY[0x24BDDBDE8]),
        v4,
        v5))
  {
    objc_msgSend(v3, "curator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_axOwnerNameForPlaylist:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDBF38]))
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("ownerName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_axNameForAuthor:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasLoadedValueForKey:", *MEMORY[0x24BDDC338])
    && (objc_msgSend(v3, "socialProfile"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hasLoadedValueForKey:", *MEMORY[0x24BDDBED8]),
        v4,
        v5))
  {
    objc_msgSend(v3, "socialProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
