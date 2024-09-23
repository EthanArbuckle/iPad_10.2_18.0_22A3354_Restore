@implementation NUDocumentSectionBlueprintProvider

- (NUDocumentSectionBlueprintProvider)init
{
  NUDocumentSectionBlueprintProvider *v2;
  FCObservable *v3;
  FCObservable *tempObservableHeaderBlueprint;
  FCObservable *v5;
  FCObservable *tempObservableFooterBlueprint;
  FCObservable *v7;
  FCObservable *tempObservableContentOverlayBlueprintData;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NUDocumentSectionBlueprintProvider;
  v2 = -[NUDocumentSectionBlueprintProvider init](&v10, sel_init);
  if (v2)
  {
    v3 = (FCObservable *)objc_alloc_init(MEMORY[0x24BE6CC80]);
    tempObservableHeaderBlueprint = v2->_tempObservableHeaderBlueprint;
    v2->_tempObservableHeaderBlueprint = v3;

    v5 = (FCObservable *)objc_alloc_init(MEMORY[0x24BE6CC80]);
    tempObservableFooterBlueprint = v2->_tempObservableFooterBlueprint;
    v2->_tempObservableFooterBlueprint = v5;

    v7 = (FCObservable *)objc_alloc_init(MEMORY[0x24BE6CC80]);
    tempObservableContentOverlayBlueprintData = v2->_tempObservableContentOverlayBlueprintData;
    v2->_tempObservableContentOverlayBlueprintData = v7;

  }
  return v2;
}

- (FCObservable)tempObservableHeaderBlueprint
{
  return self->_tempObservableHeaderBlueprint;
}

- (FCObservable)tempObservableFooterBlueprint
{
  return self->_tempObservableFooterBlueprint;
}

- (FCObservable)tempObservableContentOverlayBlueprintData
{
  return self->_tempObservableContentOverlayBlueprintData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempObservableContentOverlayBlueprintData, 0);
  objc_storeStrong((id *)&self->_tempObservableFooterBlueprint, 0);
  objc_storeStrong((id *)&self->_tempObservableHeaderBlueprint, 0);
}

@end
