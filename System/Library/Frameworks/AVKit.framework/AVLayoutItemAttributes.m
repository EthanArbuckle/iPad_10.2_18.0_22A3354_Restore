@implementation AVLayoutItemAttributes

- (void)setHasFlexibleContentSize:(BOOL)a3
{
  self->_hasFlexibleContentSize = a3;
}

- (void)setDisplayPriority:(unint64_t)a3
{
  self->_displayPriority = a3;
}

- (void)setTrailingInterItemSpace:(double)a3
{
  self->_trailingInterItemSpace = a3;
}

- (BOOL)prefersSecondaryMaterialOverlay
{
  return self->_prefersSecondaryMaterialOverlay;
}

- (AVLayoutItemAttributes)nextAttributesInLayoutOrder
{
  return self->_nextAttributesInLayoutOrder;
}

- (BOOL)canSubstituteOtherAttributes
{
  return self->_canSubstituteOtherAttributes;
}

- (BOOL)canOnlyAppearInControlOverflowMenu
{
  return self->_canOnlyAppearInControlOverflowMenu;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (BOOL)canOverflowToAuxiliaryMenu
{
  return self->_canOverflowToAuxiliaryMenu;
}

- (AVLayoutItemAttributes)displayPartnerAttributes
{
  return (AVLayoutItemAttributes *)objc_loadWeakRetained((id *)&self->_displayPartnerAttributes);
}

- (AVLayoutItemAttributes)nextAttributesInPriorityOrder
{
  return (AVLayoutItemAttributes *)objc_loadWeakRetained((id *)&self->_nextAttributesInPriorityOrder);
}

- (void)setIncluded:(BOOL)a3
{
  self->_included = a3;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->_minimumSize = a3;
}

- (BOOL)isCollapsedOrExcluded
{
  if (-[AVLayoutItemAttributes isCollapsed](self, "isCollapsed"))
    return 1;
  else
    return !-[AVLayoutItemAttributes isIncluded](self, "isIncluded");
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (AVLayoutItemAttributes)init
{
  char *v2;
  AVLayoutItemAttributes *v3;
  void *v4;
  uint64_t v5;
  NSString *uniqueIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVLayoutItemAttributes;
  v2 = -[AVLayoutItemAttributes init](&v8, sel_init);
  v3 = (AVLayoutItemAttributes *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 72) = *MEMORY[0x1E0C9D820];
    *((_QWORD *)v2 + 4) = 0;
    *(_WORD *)(v2 + 13) = 256;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "globallyUniqueString");
    v5 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v5;

    v3->_hasFlexibleContentSize = 0;
    v3->_displayPriority = 0;
    objc_storeWeak((id *)&v3->_displayPartnerAttributes, 0);
    v3->_canOverflowToAuxiliaryMenu = 0;
    v3->_canSubstituteOtherAttributes = 0;
  }
  return v3;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumSize.width;
  height = self->_minimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)trailingInterItemSpace
{
  return self->_trailingInterItemSpace;
}

- (void)setNextAttributesInPriorityOrder:(id)a3
{
  objc_storeWeak((id *)&self->_nextAttributesInPriorityOrder, a3);
}

- (BOOL)hasFlexibleContentSize
{
  return self->_hasFlexibleContentSize;
}

- (void)setDisplayPartnerAttributes:(id)a3
{
  objc_storeWeak((id *)&self->_displayPartnerAttributes, a3);
}

- (unint64_t)displayPriority
{
  return self->_displayPriority;
}

- (void)setPrefersSecondaryMaterialOverlay:(BOOL)a3
{
  self->_prefersSecondaryMaterialOverlay = a3;
}

- (void)setNextAttributesInLayoutOrder:(id)a3
{
  objc_storeStrong((id *)&self->_nextAttributesInLayoutOrder, a3);
}

- (void)setCanOverflowToAuxiliaryMenu:(BOOL)a3
{
  self->_canOverflowToAuxiliaryMenu = a3;
}

- (void)setCanSubstituteOtherAttributes:(BOOL)a3
{
  self->_canSubstituteOtherAttributes = a3;
}

- (void)setCanOnlyAppearInControlOverflowMenu:(BOOL)a3
{
  self->_canOnlyAppearInControlOverflowMenu = a3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVLayoutItemAttributes uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVLayoutItemAttributes;
  v5 = -[AVLayoutItemAttributes isEqual:](&v9, sel_isEqual_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVLayoutItemAttributes uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVLayoutItemAttributes *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[AVLayoutItemAttributes init](+[AVLayoutItemAttributes allocWithZone:](AVLayoutItemAttributes, "allocWithZone:", a3), "init");
  -[AVLayoutItemAttributes minimumSize](self, "minimumSize");
  -[AVLayoutItemAttributes setMinimumSize:](v4, "setMinimumSize:");
  -[AVLayoutItemAttributes trailingInterItemSpace](self, "trailingInterItemSpace");
  -[AVLayoutItemAttributes setTrailingInterItemSpace:](v4, "setTrailingInterItemSpace:");
  -[AVLayoutItemAttributes setCollapsed:](v4, "setCollapsed:", -[AVLayoutItemAttributes isCollapsed](self, "isCollapsed"));
  -[AVLayoutItemAttributes setIncluded:](v4, "setIncluded:", -[AVLayoutItemAttributes isIncluded](self, "isIncluded"));
  -[AVLayoutItemAttributes uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setUniqueIdentifier:](v4, "setUniqueIdentifier:", v5);

  -[AVLayoutItemAttributes setHasFlexibleContentSize:](v4, "setHasFlexibleContentSize:", -[AVLayoutItemAttributes hasFlexibleContentSize](self, "hasFlexibleContentSize"));
  -[AVLayoutItemAttributes setDisplayPriority:](v4, "setDisplayPriority:", -[AVLayoutItemAttributes displayPriority](self, "displayPriority"));
  -[AVLayoutItemAttributes accessibilityIdentifier](self, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v6);

  -[AVLayoutItemAttributes setPrefersSecondaryMaterialOverlay:](v4, "setPrefersSecondaryMaterialOverlay:", -[AVLayoutItemAttributes prefersSecondaryMaterialOverlay](self, "prefersSecondaryMaterialOverlay"));
  -[AVLayoutItemAttributes displayPartnerAttributes](self, "displayPartnerAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setDisplayPartnerAttributes:](v4, "setDisplayPartnerAttributes:", v7);

  -[AVLayoutItemAttributes nextAttributesInLayoutOrder](self, "nextAttributesInLayoutOrder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setNextAttributesInLayoutOrder:](v4, "setNextAttributesInLayoutOrder:", v8);

  -[AVLayoutItemAttributes nextAttributesInPriorityOrder](self, "nextAttributesInPriorityOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes setNextAttributesInPriorityOrder:](v4, "setNextAttributesInPriorityOrder:", v9);

  -[AVLayoutItemAttributes setCanOverflowToAuxiliaryMenu:](v4, "setCanOverflowToAuxiliaryMenu:", -[AVLayoutItemAttributes canOverflowToAuxiliaryMenu](self, "canOverflowToAuxiliaryMenu"));
  -[AVLayoutItemAttributes setCanSubstituteOtherAttributes:](v4, "setCanSubstituteOtherAttributes:", -[AVLayoutItemAttributes canSubstituteOtherAttributes](self, "canSubstituteOtherAttributes"));
  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  objc_super v10;
  NSSize v11;

  v10.receiver = self;
  v10.super_class = (Class)AVLayoutItemAttributes;
  -[AVLayoutItemAttributes debugDescription](&v10, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVLayoutItemAttributes accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVLayoutItemAttributes minimumSize](self, "minimumSize");
  NSStringFromSize(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("NO");
  if (-[AVLayoutItemAttributes isCollapsed](self, "isCollapsed"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[AVLayoutItemAttributes isIncluded](self, "isIncluded"))
    v7 = CFSTR("YES");
  objc_msgSend(v4, "appendFormat:", CFSTR("{accessibilityID: %@ minSize: %@ isCollapsed: %@ isIncluded: %@ displayPriority: %ld}"), v5, v6, v8, v7, -[AVLayoutItemAttributes displayPriority](self, "displayPriority"));

  return v4;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_nextAttributesInPriorityOrder);
  objc_storeStrong((id *)&self->_nextAttributesInLayoutOrder, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_destroyWeak((id *)&self->_displayPartnerAttributes);
}

@end
