@implementation LPStocksMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPStocksMetadata)initWithCoder:(id)a3
{
  id v4;
  LPStocksMetadata *v5;
  uint64_t v6;
  NSString *combinedTitle;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  NSString *footnote;
  uint64_t v14;
  LPImage *icon;
  LPStocksMetadata *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPStocksMetadata;
  v5 = -[LPStocksMetadata init](&v18, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("combinedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    combinedTitle = v5->_combinedTitle;
    v5->_combinedTitle = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    decodeStringForKey(v4, (uint64_t)CFSTR("subtitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    decodeStringForKey(v4, (uint64_t)CFSTR("footnote"));
    v12 = objc_claimAutoreleasedReturnValue();
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v12;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("icon"));
    v14 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (LPImage *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_combinedTitle, CFSTR("combinedTitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_footnote, CFSTR("footnote"));
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, CFSTR("icon"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPStocksMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LPStocksMetadata *v10;

  v4 = +[LPStocksMetadata allocWithZone:](LPStocksMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPStocksMetadata combinedTitle](self, "combinedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setCombinedTitle:](v4, "setCombinedTitle:", v5);

    -[LPStocksMetadata title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setTitle:](v4, "setTitle:", v6);

    -[LPStocksMetadata subtitle](self, "subtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setSubtitle:](v4, "setSubtitle:", v7);

    -[LPStocksMetadata footnote](self, "footnote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setFootnote:](v4, "setFootnote:", v8);

    -[LPStocksMetadata icon](self, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPStocksMetadata setIcon:](v4, "setIcon:", v9);

    v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPStocksMetadata;
  if (-[LPStocksMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      if ((objectsAreEqual_0(self->_combinedTitle, v6[2]) & 1) != 0
        && objectsAreEqual_0(self->_title, v6[3])
        && objectsAreEqual_0(self->_subtitle, v6[4])
        && objectsAreEqual_0(self->_footnote, v6[5]))
      {
        v5 = objectsAreEqual_0(self->_icon, v6[6]);
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("combinedTitle"), CFSTR("title"), CFSTR("subtitle"), CFSTR("footnote"), CFSTR("icon"), 0);
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("icon"));
}

- (NSString)combinedTitle
{
  return self->_combinedTitle;
}

- (void)setCombinedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_combinedTitle, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", 51);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  v7 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v7 - 2) < 2)
  {
    -[LPStocksMetadata title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "top");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leading");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v17);

    -[LPStocksMetadata subtitle](self, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottom");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leading");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v21);

    -[LPStocksMetadata footnote](self, "footnote");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "belowBottom");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);
    goto LABEL_6;
  }
  if (!v7)
  {
    -[LPStocksMetadata combinedTitle](self, "combinedTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "top");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leading");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v12);
    goto LABEL_8;
  }
  if (v7 == 1)
  {
    -[LPStocksMetadata combinedTitle](self, "combinedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "top");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v8);

    -[LPStocksMetadata footnote](self, "footnote");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LPLocalizedString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottom");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leading");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v13);
LABEL_6:

LABEL_8:
  }
  -[LPStocksMetadata icon](self, "icon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeadingIcon:", v25);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isStockSymbolURL:](LPPresentationSpecializations, "isStockSymbolURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("%@: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR("Stocks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPStocksMetadata combinedTitle](self, "combinedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  -[LPStocksMetadata icon](self, "icon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
