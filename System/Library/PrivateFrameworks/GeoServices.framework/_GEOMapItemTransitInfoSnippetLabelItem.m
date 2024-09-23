@implementation _GEOMapItemTransitInfoSnippetLabelItem

- (_GEOMapItemTransitInfoSnippetLabelItem)initWithType:(unint64_t)a3 labelString:(id)a4 labelArtwork:(id)a5
{
  id v8;
  id v9;
  _GEOMapItemTransitInfoSnippetLabelItem *v10;
  _GEOMapItemTransitInfoSnippetLabelItem *v11;
  uint64_t v12;
  NSString *labelString;
  _GEOMapItemTransitInfoSnippetLabelItem *v14;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_GEOMapItemTransitInfoSnippetLabelItem;
  v10 = -[_GEOMapItemTransitInfoSnippetLabelItem init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    labelString = v11->_labelString;
    v11->_labelString = (NSString *)v12;

    objc_storeStrong((id *)&v11->_labelArtwork, a5);
    v14 = v11;
  }

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)labelString
{
  return self->_labelString;
}

- (GEOTransitArtworkDataSource)labelArtwork
{
  return self->_labelArtwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelArtwork, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
}

@end
