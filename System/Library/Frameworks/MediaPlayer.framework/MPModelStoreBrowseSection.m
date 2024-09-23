@implementation MPModelStoreBrowseSection

+ (id)__title_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyTitle");
}

+ (void)__MPModelStoreBrowseSectionPropertyTitle__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 19, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyTitle"));

}

+ (id)__sectionType_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyType");
}

+ (void)__MPModelStoreBrowseSectionPropertyType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 20, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyType"));

}

+ (id)__loadAdditionalContentURL_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL");
}

+ (void)__MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 21, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL"));

}

+ (id)__uniformContentItemType_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyUniformContentItemType");
}

+ (void)__MPModelStoreBrowseSectionPropertyUniformContentItemType__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 22, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyUniformContentItemType"));

}

+ (id)__memberOfChartSet_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyMemberOfChartSet");
}

+ (void)__MPModelStoreBrowseSectionPropertyMemberOfChartSet__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 23, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyMemberOfChartSet"));

}

+ (id)__brick_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyBrick");
}

+ (void)__MPModelStoreBrowseSectionPropertyBrick__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 24, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyBrick"));

}

+ (id)__previouslyRetrievedNestedResponse_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse");
}

+ (void)__MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 25, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse"));

}

+ (id)__displaysAsGridCellInCarPlay_KEY
{
  return CFSTR("MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay");
}

+ (void)__MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 26, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay"));

}

+ (id)__radioStation_KEY
{
  return CFSTR("MPModelStoreBrowseSectionRelationshipRadioStation");
}

+ (void)__MPModelStoreBrowseSectionRelationshipRadioStation__MAPPING_MISSING__
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MPModelStoreBrowseSection.m"), 27, CFSTR("Translator was missing mapping for MPModelStoreBrowseSectionRelationshipRadioStation"));

}

- (BOOL)containsOnlyEditorialElements
{
  return self->_containsOnlyEditorialElements;
}

- (void)setContainsOnlyEditorialElements:(BOOL)a3
{
  self->_containsOnlyEditorialElements = a3;
}

@end
