@implementation DULanguageTaggingResponseObjC

- (DULanguageTaggingResponseObjC)init
{
  DULanguageTaggingResponseObjC *v2;
  _TtC21DocumentUnderstanding25DULanguageTaggingResponse *v3;
  _TtC21DocumentUnderstanding25DULanguageTaggingResponse *underlying;
  DULanguageTaggingResponseObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DULanguageTaggingResponseObjC;
  v2 = -[DULanguageTaggingResponseObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding25DULanguageTaggingResponse);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)languageTags
{
  return -[DULanguageTaggingResponse languageTags](self->_underlying, "languageTags");
}

- (void)setLanguageTags:(id)a3
{
  -[DULanguageTaggingResponse setLanguageTags:](self->_underlying, "setLanguageTags:", a3);
}

- (DUDebugInfoObjC)responseDebugInfo
{
  void *v2;
  void *v3;

  -[DULanguageTaggingResponse responseDebugInfo](self->_underlying, "responseDebugInfo");
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
  -[DULanguageTaggingResponse setResponseDebugInfo:](self->_underlying, "setResponseDebugInfo:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
