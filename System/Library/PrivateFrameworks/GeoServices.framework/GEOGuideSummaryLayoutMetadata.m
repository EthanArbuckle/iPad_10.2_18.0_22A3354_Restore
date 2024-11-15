@implementation GEOGuideSummaryLayoutMetadata

- (GEOGuideSummaryLayoutMetadata)initWithGuideSummaryLayoutMetadata:(id)a3
{
  id v5;
  GEOGuideSummaryLayoutMetadata *v6;
  GEOGuideSummaryLayoutMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuideSummaryLayoutMetadata;
  v6 = -[GEOGuideSummaryLayoutMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadata, a3);

  return v7;
}

- (BOOL)guideSummaryUsesRichLayout
{
  GEOPDGuideSummaryLayoutMetadata *metadata;

  metadata = self->_metadata;
  return metadata && (*(_BYTE *)&metadata->_flags & 1) != 0 && metadata->_guideSummaryType == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
