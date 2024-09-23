@implementation DUResponseObjC

- (DUResponseObjC)init
{
  DUResponseObjC *v2;
  _TtC21DocumentUnderstanding10DUResponse *v3;
  _TtC21DocumentUnderstanding10DUResponse *underlying;
  DUResponseObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUResponseObjC;
  v2 = -[DUResponseObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding10DUResponse);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (DUTopicDetectionResponseObjC)topics
{
  void *v2;
  void *v3;

  -[DUResponse topics](self->_underlying, "topics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcForTopicDetectionResponse:](DUObjCCompatibilityUtils, "objcForTopicDetectionResponse:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUTopicDetectionResponseObjC *)v3;
}

- (void)setTopics:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils topicDetectionResponseForObjC:](DUObjCCompatibilityUtils, "topicDetectionResponseForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setTopics:](self->_underlying, "setTopics:", v4);

}

- (DUStructuredEntityResponseObjC)structuredEntities
{
  void *v2;
  void *v3;

  -[DUResponse structuredEntities](self->_underlying, "structuredEntities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcForStructuredEntityResponse:](DUObjCCompatibilityUtils, "objcForStructuredEntityResponse:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUStructuredEntityResponseObjC *)v3;
}

- (void)setStructuredEntities:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils structuredEntityResponseForObjC:](DUObjCCompatibilityUtils, "structuredEntityResponseForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setStructuredEntities:](self->_underlying, "setStructuredEntities:", v4);

}

- (DULanguageTaggingResponseObjC)languageTags
{
  void *v2;
  void *v3;

  -[DUResponse languageTags](self->_underlying, "languageTags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcForLanguageTaggingResponse:](DUObjCCompatibilityUtils, "objcForLanguageTaggingResponse:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DULanguageTaggingResponseObjC *)v3;
}

- (void)setLanguageTags:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils languageTaggingResponseForObjC:](DUObjCCompatibilityUtils, "languageTaggingResponseForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setLanguageTags:](self->_underlying, "setLanguageTags:", v4);

}

- (DUCategoryClassificationResponseObjC)documentCategories
{
  void *v2;
  void *v3;

  -[DUResponse documentCategories](self->_underlying, "documentCategories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcForCategoryClassificationResponse:](DUObjCCompatibilityUtils, "objcForCategoryClassificationResponse:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUCategoryClassificationResponseObjC *)v3;
}

- (void)setDocumentCategories:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils categoryClassificationResponseForObjC:](DUObjCCompatibilityUtils, "categoryClassificationResponseForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setDocumentCategories:](self->_underlying, "setDocumentCategories:", v4);

}

- (DUFoundInEventResultObjC)foundInEvent
{
  void *v2;
  void *v3;

  -[DUResponse foundInEventResult](self->_underlying, "foundInEventResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcForFoundInEventResult:](DUObjCCompatibilityUtils, "objcForFoundInEventResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUFoundInEventResultObjC *)v3;
}

- (void)setFoundInEvent:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils foundInEventResultForObjC:](DUObjCCompatibilityUtils, "foundInEventResultForObjC:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setFoundInEventResult:](self->_underlying, "setFoundInEventResult:", v4);

}

- (DUDebugInfoObjC)responseDebugInfo
{
  void *v2;
  void *v3;

  -[DUResponse responseDebugInfo](self->_underlying, "responseDebugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUDebugInfoObjC *)v3;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUResponse setResponseDebugInfo:](self->_underlying, "setResponseDebugInfo:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
