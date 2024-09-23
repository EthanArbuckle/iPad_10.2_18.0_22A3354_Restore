@implementation GEOAnnotatedItemList

- (GEOAnnotatedItemList)init
{
  GEOAnnotatedItemList *result;

  result = (GEOAnnotatedItemList *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOAnnotatedItemList)initWithPictureItemContainer:(id)a3 textItemContainer:(id)a4 title:(id)a5 annotatedItemStyle:(int)a6 attribution:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  GEOAnnotatedItemList *v17;
  GEOAnnotatedItemList *v18;
  uint64_t v19;
  NSString *title;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GEOAnnotatedItemList;
  v17 = -[GEOAnnotatedItemList init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pictureItemContainer, a3);
    objc_storeStrong((id *)&v18->_textItemContainer, a4);
    v19 = objc_msgSend(v15, "copy");
    title = v18->_title;
    v18->_title = (NSString *)v19;

    v18->_annotatedItemStyle = a6;
    objc_storeStrong((id *)&v18->_attribution, a7);
  }

  return v18;
}

- (GEOAnnotatedItemList)initWithAnnotatedItemList:(id)a3 attribution:(id)a4
{
  id *v6;
  id v7;
  GEOAnnotatedItemList *v8;
  int v9;
  GEOPictureItemContainer *v10;
  GEOPictureItemContainer *v11;
  void *v12;
  GEOTextItemContainer *v13;
  void *v14;
  GEOTextItemContainer *v15;
  void *v16;

  v6 = (id *)a3;
  v7 = a4;
  -[GEOPDAnnotatedItemList textItemContainer](v6);
  v8 = (GEOAnnotatedItemList *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[GEOPDAnnotatedItemList annotatedItemStyle]((uint64_t)v6);

    if (v9)
    {
      -[GEOPDAnnotatedItemList picItemContainer](v6);
      v10 = (GEOPictureItemContainer *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [GEOPictureItemContainer alloc];
        -[GEOPDAnnotatedItemList picItemContainer](v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[GEOPictureItemContainer initWithPictureItemContainer:](v11, "initWithPictureItemContainer:", v12);

      }
      v13 = [GEOTextItemContainer alloc];
      -[GEOPDAnnotatedItemList textItemContainer](v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[GEOTextItemContainer initWithTextItemContainer:](v13, "initWithTextItemContainer:", v14);
      -[GEOPDAnnotatedItemList title](v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[GEOAnnotatedItemList initWithPictureItemContainer:textItemContainer:title:annotatedItemStyle:attribution:](self, "initWithPictureItemContainer:textItemContainer:title:annotatedItemStyle:attribution:", v10, v15, v16, -[GEOPDAnnotatedItemList annotatedItemStyle]((uint64_t)v6) != 0, v7);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (GEOPictureItemContainer)pictureItemContainer
{
  return self->_pictureItemContainer;
}

- (GEOTextItemContainer)textItemContainer
{
  return self->_textItemContainer;
}

- (NSString)title
{
  return self->_title;
}

- (int)annotatedItemStyle
{
  return self->_annotatedItemStyle;
}

- (GEOMapItemAttribution)attribution
{
  return self->_attribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textItemContainer, 0);
  objc_storeStrong((id *)&self->_pictureItemContainer, 0);
}

@end
